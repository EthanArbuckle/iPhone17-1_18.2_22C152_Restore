@interface HDCPSFetchJSONTask
- (BOOL)_performRetryIfNeededForStatusCode:(int64_t)a3 retryCount:(int64_t)a4 retryHandler:(id)a5;
- (HDCPSFetchJSONTask)init;
- (HDCPSFetchJSONTask)initWithSession:(id)a3 request:(id)a4;
- (HDCPSFetchJSONTask)initWithSession:(id)a3 request:(id)a4 maxRetriesAllowed:(int64_t)a5 retryInterval:(double)a6;
- (NSCopying)JSONObject;
- (NSError)error;
- (NSURLRequest)request;
- (NSURLSession)session;
- (double)retryInterval;
- (id)_errorFromResponse:(id)a3;
- (int64_t)maxRetryCount;
- (void)_startTaskWithCompletion:(id)a3;
- (void)_startTaskWithRetryCount:(int64_t)a3 completion:(id)a4;
- (void)resume;
- (void)waitUntilFinished;
@end

@implementation HDCPSFetchJSONTask

- (HDCPSFetchJSONTask)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDCPSFetchJSONTask)initWithSession:(id)a3 request:(id)a4
{
  return [(HDCPSFetchJSONTask *)self initWithSession:a3 request:a4 maxRetriesAllowed:3 retryInterval:15.0];
}

- (HDCPSFetchJSONTask)initWithSession:(id)a3 request:(id)a4 maxRetriesAllowed:(int64_t)a5 retryInterval:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDCPSFetchJSONTask;
  v13 = [(HDCPSFetchJSONTask *)&v19 init];
  if (v13)
  {
    dispatch_group_t v14 = dispatch_group_create();
    group = v13->_group;
    v13->_group = (OS_dispatch_group *)v14;

    v16 = (NSURLRequest *)[v12 copy];
    request = v13->_request;
    v13->_request = v16;

    objc_storeStrong((id *)&v13->_session, a3);
    v13->_maxRetryCount = a5;
    v13->_retryInterval = a6;
  }

  return v13;
}

- (void)resume
{
  if (atomic_exchange(&self->_resumedFlag._Value, 1u))
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"HDCPSFetchJSONTask.m" lineNumber:61 description:@"Do not call resume twice"];
  }
  else
  {
    self->_resumed = 1;
    dispatch_group_enter((dispatch_group_t)self->_group);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_74654;
    v6[3] = &unk_113B88;
    v6[4] = self;
    v3 = objc_retainBlock(v6);
    [(HDCPSFetchJSONTask *)self _startTaskWithCompletion:v3];
  }
}

- (void)waitUntilFinished
{
  if (!self->_resumed)
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"HDCPSFetchJSONTask.m" lineNumber:77 description:@"Task must be resumed before waiting"];
  }
  group = self->_group;

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_startTaskWithCompletion:(id)a3
{
  id v4 = a3;
  [(HDCPSFetchJSONTask *)self _startTaskWithRetryCount:[(HDCPSFetchJSONTask *)self maxRetryCount] completion:v4];
}

- (void)_startTaskWithRetryCount:(int64_t)a3 completion:(id)a4
{
  v7 = (void (**)(void))a4;
  id v8 = [(NSURLRequest *)self->_request mutableCopy];
  id v24 = 0;
  unsigned __int8 v9 = +[HDProviderServiceSpecification addAuthorizationHeadersToRequest:v8 error:&v24];
  id v10 = v24;
  id v11 = v24;
  if (v9)
  {
    _HKInitializeLogging();
    id v12 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_B1E8C(v12, (uint64_t)self, v8);
    }
    v13 = [(HDCPSFetchJSONTask *)self session];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_748D8;
    v18 = &unk_114228;
    SEL v22 = a2;
    objc_super v19 = self;
    id v20 = v8;
    int64_t v23 = a3;
    v21 = v7;
    dispatch_group_t v14 = [v13 dataTaskWithRequest:v20 completionHandler:&v15];

    objc_msgSend(v14, "resume", v15, v16, v17, v18, v19);
  }
  else
  {
    objc_storeStrong((id *)&self->_error, v10);
    v7[2](v7);
  }
}

- (id)_errorFromResponse:(id)a3
{
  v3 = (char *)[a3 statusCode];
  id v4 = v3;
  if ((uint64_t)v3 > 417)
  {
    if ((uint64_t)v3 > 501)
    {
      if (v3 == (unsigned char *)&stru_1A8.reserved3 + 2)
      {
        CFStringRef v5 = @"bad gateway";
        uint64_t v6 = 604;
        goto LABEL_17;
      }
      if (v3 == (unsigned char *)&stru_1A8.reserved3 + 3)
      {
        CFStringRef v5 = @"temporarily unavailable";
        uint64_t v6 = 602;
        goto LABEL_17;
      }
    }
    else if (v3 == (unsigned char *)&stru_158.reserved2 + 2 || v3 == (char *)&stru_1A8.reserved3)
    {
      CFStringRef v5 = @"service down";
      uint64_t v6 = 601;
LABEL_17:
      id v8 = HDProviderServiceErrorDomain;
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      CFStringRef v14 = v5;
      unsigned __int8 v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v10 = +[NSError errorWithDomain:v8 code:v4 userInfo:v9];

      _HKInitializeLogging();
      id v11 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B2094((uint64_t)v10, v11);
      }
      v7 = +[NSError hk_error:v6 description:@"Service error" underlyingError:v10];

      goto LABEL_20;
    }
LABEL_13:
    CFStringRef v5 = @"unexpected error";
    uint64_t v6 = 607;
    goto LABEL_17;
  }
  CFStringRef v5 = @"missing required parameter";
  uint64_t v6 = 606;
  switch((unint64_t)v3)
  {
    case 0x190uLL:
      goto LABEL_17;
    case 0x191uLL:
      CFStringRef v5 = @"unauthorized";
      uint64_t v6 = 600;
      goto LABEL_17;
    case 0x192uLL:
      goto LABEL_13;
    case 0x193uLL:
      CFStringRef v5 = @"access error";
      uint64_t v6 = 603;
      goto LABEL_17;
    case 0x194uLL:
      CFStringRef v5 = @"nothing found";
      uint64_t v6 = 605;
      goto LABEL_17;
    default:
      if (v3 != stru_B8.segname) {
        goto LABEL_13;
      }
      v7 = 0;
      break;
  }
LABEL_20:

  return v7;
}

- (BOOL)_performRetryIfNeededForStatusCode:(int64_t)a3 retryCount:(int64_t)a4 retryHandler:(id)a5
{
  id v8 = a5;
  unsigned __int8 v9 = v8;
  BOOL v10 = a4 < 1;
  int64_t v11 = a4 - 1;
  if (!v10)
  {
    if (a3 == 503)
    {
      [(HDCPSFetchJSONTask *)self retryInterval];
      dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      v15 = dispatch_get_global_queue(17, 0);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_75034;
      v17[3] = &unk_114250;
      id v18 = v9;
      int64_t v19 = v11;
      dispatch_after(v14, v15, v17);

      goto LABEL_7;
    }
    if (a3 == 401)
    {
      (*((void (**)(id, int64_t))v8 + 2))(v8, v11);
LABEL_7:
      BOOL v12 = 1;
      goto LABEL_8;
    }
  }
  BOOL v12 = 0;
LABEL_8:

  return v12;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSError)error
{
  return self->_error;
}

- (NSCopying)JSONObject
{
  return self->_JSONObject;
}

- (int64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (double)retryInterval
{
  return self->_retryInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONObject, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end