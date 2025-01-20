@interface HDFHIRResourceDownloadOperation
+ (id)FHIRDateStringFromDate:(id)a3;
+ (id)FHIRDateTimeStringFromDate:(id)a3;
+ (id)_schemaVariableBindingsWithLastFetchDate:(id)a3;
+ (id)operationWithDownloadRequest:(id)a3 session:(id)a4 error:(id *)a5 downloadCompletion:(id)a6;
- (HDFHIRCredentialedSession)session;
- (HDFHIRResourceDownloadOperation)init;
- (HDFHIRResourceDownloadOperation)initWithDownloadRequest:(id)a3 session:(id)a4 resourceSchema:(id)a5 downloadCompletion:(id)a6;
- (HDFHIRResourceSchema)resourceSchema;
- (HKFHIRResourceDownloadRequest)request;
- (NSMutableArray)endStates;
- (OS_dispatch_group)fetchGroup;
- (id)_performPreflightChecks;
- (id)_requestResultWithError:(id)a3;
- (id)_requestResultWithResourceBundleData:(id)a3;
- (id)_schemaVariableBindings;
- (id)assembleEndStates;
- (id)downloadCompletion;
- (id)logDescription;
- (int64_t)_defaultRetryCount;
- (void)_handlePreflightError:(id)a3;
- (void)_handleTaskCompletedWithData:(id)a3 endState:(id)a4;
- (void)_handleTaskError:(id)a3 retryCount:(int64_t)a4 endState:(id)a5;
- (void)_performFetchWithURL:(id)a3 retryCount:(int64_t)a4;
- (void)consumeEndState:(id)a3;
- (void)main;
- (void)setEndStates:(id)a3;
@end

@implementation HDFHIRResourceDownloadOperation

- (HDFHIRResourceDownloadOperation)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDFHIRResourceDownloadOperation)initWithDownloadRequest:(id)a3 session:(id)a4 resourceSchema:(id)a5 downloadCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HDFHIRResourceDownloadOperation;
  v14 = [(HDFHIRResourceDownloadOperation *)&v24 init];
  if (v14)
  {
    v15 = (HKFHIRResourceDownloadRequest *)[v10 copy];
    request = v14->_request;
    v14->_request = v15;

    id v17 = [v13 copy];
    id downloadCompletion = v14->_downloadCompletion;
    v14->_id downloadCompletion = v17;

    objc_storeStrong((id *)&v14->_session, a4);
    v19 = (HDFHIRResourceSchema *)[v12 copy];
    resourceSchema = v14->_resourceSchema;
    v14->_resourceSchema = v19;

    dispatch_group_t v21 = dispatch_group_create();
    fetchGroup = v14->_fetchGroup;
    v14->_fetchGroup = (OS_dispatch_group *)v21;
  }
  return v14;
}

+ (id)operationWithDownloadRequest:(id)a3 session:(id)a4 error:(id *)a5 downloadCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 resourceSchemaDefinition];
  v14 = [v10 context];
  v15 = [v14 accountInformation];
  v16 = [v15 authentication];
  id v17 = +[HDFHIREndpointSchema schemaWithDefinition:v13 authenticationInformation:v16 error:a5];

  if (v17) {
    id v18 = [objc_alloc((Class)a1) initWithDownloadRequest:v10 session:v11 resourceSchema:v17 downloadCompletion:v12];
  }
  else {
    id v18 = 0;
  }

  return v18;
}

- (void)main
{
  v3 = [(HDFHIRResourceDownloadOperation *)self _performPreflightChecks];
  _HKInitializeLogging();
  v4 = (void *)HKLogHealthRecords;
  if (v3)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = [(HDFHIRResourceDownloadOperation *)self logDescription];
      v7 = [(HDFHIREndpointSchema *)self->_resourceSchema name];
      int v12 = 138543874;
      id v13 = v6;
      __int16 v14 = 2114;
      v15 = v7;
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will skip download for %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    [(HDFHIRResourceDownloadOperation *)self _handlePreflightError:v3];
  }
  else
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_10000B95C(v4, self);
    }
    id v8 = objc_alloc_init((Class)NSMutableArray);
    [(HDFHIRResourceDownloadOperation *)self setEndStates:v8];

    int64_t v9 = [(HDFHIRResourceDownloadOperation *)self _defaultRetryCount];
    id v10 = [(HKFHIRResourceDownloadRequest *)self->_request fullRequestURL];
    [(HDFHIRResourceDownloadOperation *)self _performFetchWithURL:v10 retryCount:v9];

    dispatch_group_wait((dispatch_group_t)self->_fetchGroup, 0xFFFFFFFFFFFFFFFFLL);
    _HKInitializeLogging();
    id v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_10000B8C8(v11, self);
    }
  }
}

- (id)_performPreflightChecks
{
  if ([(HDFHIREndpointSchema *)self->_resourceSchema isEnabled])
  {
    v3 = 0;
  }
  else
  {
    v4 = [(HDFHIREndpointSchema *)self->_resourceSchema name];
    v3 = +[NSError hk_error:125, @"resource schema %@ is not enabled", v4 format];
  }

  return v3;
}

- (void)_performFetchWithURL:(id)a3 retryCount:(int64_t)a4
{
  id v7 = a3;
  if (a4 < 0)
  {
    v36 = +[NSAssertionHandler currentHandler];
    [v36 handleFailureInMethod:a2, self, @"HDFHIRResourceDownloadOperation.m", 105, @"Invalid parameter not satisfying: %@", @"retryCount >= 0" object file lineNumber description];
  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100004B34;
  v41[3] = &unk_100014530;
  v41[4] = self;
  v41[5] = a4;
  id v8 = objc_retainBlock(v41);
  dispatch_group_enter((dispatch_group_t)self->_fetchGroup);
  int64_t v9 = [(HKFHIRResourceDownloadRequest *)self->_request context];
  unsigned __int8 v10 = [v9 options];

  if ((v10 & 2) != 0)
  {
    _HKInitializeLogging();
    id v18 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = [(HDFHIRResourceDownloadOperation *)self logDescription];
      *(_DWORD *)buf = 138543362;
      v43 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ BYPASSING FHIR REQUEST, this FHIR resource download request has the \"skip web request\" option set.", buf, 0xCu);
    }
    objc_msgSend(@"{\"resourceType\": \"Bundle\", \"entry\": []}", "dataUsingEncoding:", 4);
    id v17 = (HDFHIRResourceRequestTask *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      id v21 = v7;
      uint64_t v22 = 4;
    }
    else
    {
      v29 = [(HKFHIRResourceDownloadRequest *)self->_request resourceType];
      v30 = +[NSString stringWithFormat:@"http://127.0.0.1/FHIR/%@", v29];
      id v21 = +[NSURL URLWithString:v30];

      uint64_t v22 = 5;
    }
    v31 = [(HKFHIRResourceDownloadRequest *)self->_request resourceType];
    v32 = +[HKFHIRRequestTaskEndState endStateForCanceledRequestAtURL:v21 resourceType:v31 interactionType:v22];

    ((void (*)(void *, HDFHIRResourceRequestTask *, void *, void))v8[2])(v8, v17, v32, 0);
  }
  else
  {
    _HKInitializeLogging();
    id v11 = (void *)HKLogHealthRecords;
    BOOL v12 = os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v12)
      {
        v33 = v11;
        v34 = [(HDFHIRResourceDownloadOperation *)self logDescription];
        v35 = [(HKFHIRResourceDownloadRequest *)self->_request resourceType];
        *(_DWORD *)buf = 138543874;
        v43 = v34;
        __int16 v44 = 2114;
        v45 = v35;
        __int16 v46 = 2048;
        int64_t v47 = a4;
        _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%{public}@ fetching %{public}@ resources with %zd retry(ies) remaining", buf, 0x20u);
      }
      id v13 = [HDFHIRResourceRequestTask alloc];
      session = self->_session;
      resourceSchema = self->_resourceSchema;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100004C20;
      v37[3] = &unk_100014558;
      __int16 v16 = (id *)&v38;
      v38 = v8;
      id v17 = [(HDFHIRResourceRequestTask *)v13 initWithCredentialedSession:session resourceSchema:resourceSchema requestURL:v7 completion:v37];
    }
    else
    {
      if (v12) {
        sub_10000B9F0(v11, self, a4);
      }
      v23 = [HDFHIRResourceQueryTask alloc];
      objc_super v24 = self->_session;
      v25 = self->_resourceSchema;
      v26 = [(HKFHIRResourceDownloadRequest *)self->_request context];
      unint64_t Mode = HDFHIRQueryModeFromHKFHIRResourceQueryMode((unint64_t)[v26 queryMode]);
      v28 = [(HDFHIRResourceDownloadOperation *)self _schemaVariableBindings];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100004C10;
      v39[3] = &unk_100014558;
      __int16 v16 = (id *)&v40;
      v40 = v8;
      id v17 = [(HDFHIRResourceQueryTask *)v23 initWithCredentialedSession:v24 resourceSchema:v25 queryMode:Mode bindings:v28 completion:v39];
    }
    [(HDFHIRRequestTask *)v17 resume];
  }
}

- (void)_handlePreflightError:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDFHIRResourceDownloadOperation.m", 159, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

    id v5 = 0;
  }
  id downloadCompletion = (void (**)(id, void *))self->_downloadCompletion;
  id v7 = [(HDFHIRResourceDownloadOperation *)self _requestResultWithError:v5];
  downloadCompletion[2](downloadCompletion, v7);
}

- (void)_handleTaskError:(id)a3 retryCount:(int64_t)a4 endState:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HDFHIRResourceDownloadOperation.m", 164, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HDFHIRResourceDownloadOperation.m", 165, @"Invalid parameter not satisfying: %@", @"retryCount >= 0" object file lineNumber description];

    [(HDFHIRResourceDownloadOperation *)self consumeEndState:v10];
    goto LABEL_10;
  }
  if (a4 < 0) {
    goto LABEL_9;
  }
LABEL_3:
  [(HDFHIRResourceDownloadOperation *)self consumeEndState:v10];
  if (a4)
  {
    id v11 = [(HDFHIRResourceDownloadOperation *)self session];
    BOOL v12 = [v11 specification];
    unsigned int v13 = [v12 shouldRetryFailedResourceTaskWithError:v9];

    if (v13)
    {
      _HKInitializeLogging();
      __int16 v14 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        __int16 v16 = [(HDFHIRResourceDownloadOperation *)self logDescription];
        id v17 = objc_msgSend(v9, "hrs_safelyLoggableDescription");
        *(_DWORD *)buf = 138543874;
        objc_super v24 = v16;
        __int16 v25 = 2114;
        v26 = v17;
        __int16 v27 = 2048;
        int64_t v28 = a4;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching encountered error: %{public}@. %zd retry(ies) remaining", buf, 0x20u);
      }
      id v18 = [(HKFHIRResourceDownloadRequest *)self->_request fullRequestURL];
      [(HDFHIRResourceDownloadOperation *)self _performFetchWithURL:v18 retryCount:a4 - 1];
      goto LABEL_13;
    }
  }
LABEL_10:
  _HKInitializeLogging();
  id v21 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_10000BB20(v21, self, v9);
  }
  id downloadCompletion = (void (**)(id, void *))self->_downloadCompletion;
  id v18 = [(HDFHIRResourceDownloadOperation *)self _requestResultWithError:v9];
  downloadCompletion[2](downloadCompletion, v18);
LABEL_13:
}

- (void)_handleTaskCompletedWithData:(id)a3 endState:(id)a4
{
  id v6 = a3;
  [(HDFHIRResourceDownloadOperation *)self consumeEndState:a4];
  id downloadCompletion = (void (**)(id, id))self->_downloadCompletion;
  id v8 = [(HDFHIRResourceDownloadOperation *)self _requestResultWithResourceBundleData:v6];

  downloadCompletion[2](downloadCompletion, v8);
}

- (int64_t)_defaultRetryCount
{
  return 1;
}

- (id)_schemaVariableBindings
{
  v3 = objc_opt_class();
  v4 = [(HKFHIRResourceDownloadRequest *)self->_request context];
  id v5 = [v4 lastFetchDate];
  id v6 = [v3 _schemaVariableBindingsWithLastFetchDate:v5];

  return v6;
}

+ (id)_schemaVariableBindingsWithLastFetchDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_alloc_init((Class)NSDateComponents);
    [v6 setMonth:-1];
    id v7 = +[NSCalendar hk_gregorianCalendarWithUTCTimeZone];
    id v8 = [v7 dateByAddingComponents:v6 toDate:v5 options:0];
  }
  else
  {
    id v8 = +[NSDate distantPast];
  }
  id v9 = [a1 FHIRDateStringFromDate:v8];
  id v10 = [a1 FHIRDateTimeStringFromDate:v8];
  id v11 = +[NSString stringWithFormat:@"ge%@", v9];
  BOOL v12 = +[NSString stringWithFormat:@"ge%@", v10];
  v15[0] = @"geLastFetchedDate";
  v15[1] = @"geLastFetchedDateTime";
  v16[0] = v11;
  v16[1] = v12;
  unsigned int v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v13;
}

- (id)_requestResultWithResourceBundleData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDFHIRResourceDownloadOperation.m", 223, @"Invalid parameter not satisfying: %@", @"resourceBundleData != nil" object file lineNumber description];
  }
  id v6 = objc_alloc((Class)HKFHIRResourceDownloadRequestResult);
  id v7 = [(HDFHIRResourceDownloadOperation *)self assembleEndStates];
  id v8 = [(HDFHIRCredentialedSession *)self->_session consumeRefreshResult];
  id v9 = [v6 initWithResourceBundleData:v5 endStates:v7 refreshResult:v8];

  return v9;
}

- (id)_requestResultWithError:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDFHIRResourceDownloadOperation.m", 230, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  id v6 = objc_alloc((Class)HKFHIRResourceDownloadRequestResult);
  id v7 = [(HDFHIRResourceDownloadOperation *)self assembleEndStates];
  id v8 = [(HDFHIRCredentialedSession *)self->_session consumeRefreshResult];
  id v9 = [v6 initWithError:v5 endStates:v7 refreshResult:v8];

  return v9;
}

- (void)consumeEndState:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDFHIRResourceDownloadOperation.m", 237, @"Invalid parameter not satisfying: %@", @"endState" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableArray *)self->_endStates addObject:v5];
}

- (id)assembleEndStates
{
  id v3 = objc_alloc((Class)HKFHIRRequestTaskEndStates);
  if (self->_endStates) {
    endStates = self->_endStates;
  }
  else {
    endStates = (NSMutableArray *)&__NSArray0__struct;
  }
  id v5 = [v3 initWithEndStates:endStates];

  return v5;
}

- (id)logDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(HDFHIREndpointSchema *)self->_resourceSchema name];
  id v6 = +[NSString stringWithFormat:@"%@ resource: %@", v4, v5];

  return v6;
}

+ (id)FHIRDateStringFromDate:(id)a3
{
  uint64_t v3 = qword_10001B4F0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10001B4F0, &stru_100014598);
  }
  id v5 = [(id)qword_10001B4E8 stringFromDate:v4];

  return v5;
}

+ (id)FHIRDateTimeStringFromDate:(id)a3
{
  uint64_t v3 = qword_10001B500;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10001B500, &stru_1000145B8);
  }
  id v5 = [(id)qword_10001B4F8 stringFromDate:v4];

  return v5;
}

- (HKFHIRResourceDownloadRequest)request
{
  return self->_request;
}

- (HDFHIRCredentialedSession)session
{
  return self->_session;
}

- (HDFHIRResourceSchema)resourceSchema
{
  return self->_resourceSchema;
}

- (id)downloadCompletion
{
  return self->_downloadCompletion;
}

- (OS_dispatch_group)fetchGroup
{
  return self->_fetchGroup;
}

- (NSMutableArray)endStates
{
  return self->_endStates;
}

- (void)setEndStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endStates, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong(&self->_downloadCompletion, 0);
  objc_storeStrong((id *)&self->_resourceSchema, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end