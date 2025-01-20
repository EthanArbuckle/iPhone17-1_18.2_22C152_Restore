@interface HDFHIRRequestTask
- (HDFHIRRequestTask)init;
- (HDFHIRRequestTask)initWithSession:(id)a3;
- (HDFHIRSession)session;
- (NSString)resourceType;
- (id)_errorForRequest:(id)a3 response:(id)a4 data:(id)a5;
- (id)errorForRequest:(id)a3 response:(id)a4 data:(id)a5;
- (int64_t)interactionType;
- (void)_handleResponse:(id)a3 data:(id)a4 endState:(id)a5;
- (void)createURLRequestWithCompletion:(id)a3;
- (void)resume;
- (void)startTaskWithRequest:(id)a3 completion:(id)a4;
@end

@implementation HDFHIRRequestTask

- (HDFHIRRequestTask)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDFHIRRequestTask)initWithSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDFHIRRequestTask;
  v6 = [(HDFHIRRequestTask *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    dispatch_group_t v8 = dispatch_group_create();
    group = v7->_group;
    v7->_group = (OS_dispatch_group *)v8;
  }
  return v7;
}

- (void)resume
{
  if (!self->_resumed
    || (+[NSAssertionHandler currentHandler],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 handleFailureInMethod:a2 object:self file:@"HDFHIRRequestTask.m" lineNumber:56 description:@"Do not call resume twice"], v5, !self->_resumed))
  {
    self->_resumed = 1;
    dispatch_group_enter((dispatch_group_t)self->_group);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008938;
    v8[3] = &unk_100014650;
    v8[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100008944;
    v6[3] = &unk_100014678;
    v6[4] = self;
    v7 = objc_retainBlock(v8);
    v3 = v7;
    [(HDFHIRRequestTask *)self createURLRequestWithCompletion:v6];
  }
}

- (void)startTaskWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDFHIRRequestTask.m", 84, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  _HKInitializeLogging();
  v9 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_10000BD2C(v9, (uint64_t)self, v7);
  }
  v10 = [(HDFHIRRequestTask *)self session];
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v12 = v11;
  v13 = [v10 URLSession];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008C74;
  v18[3] = &unk_1000146A0;
  v18[4] = self;
  id v19 = v7;
  uint64_t v22 = v12;
  id v20 = v8;
  SEL v21 = a2;
  id v14 = v8;
  id v15 = v7;
  v16 = [v13 dataTaskWithRequest:v15 completionHandler:v18];

  [v16 resume];
}

- (void)_handleResponse:(id)a3 data:(id)a4 endState:(id)a5
{
}

- (id)_errorForRequest:(id)a3 response:(id)a4 data:(id)a5
{
  return [(HDFHIRRequestTask *)self errorForRequest:a3 response:a4 data:a5];
}

- (HDFHIRSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

- (NSString)resourceType
{
  return 0;
}

- (int64_t)interactionType
{
  return 0;
}

- (void)createURLRequestWithCompletion:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  sub_100009794();
  (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
}

- (id)errorForRequest:(id)a3 response:(id)a4 data:(id)a5
{
  return 0;
}

@end