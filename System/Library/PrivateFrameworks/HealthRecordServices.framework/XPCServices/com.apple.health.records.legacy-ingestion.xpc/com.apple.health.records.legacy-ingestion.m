id sub_100001540(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _UNKNOWN **v3;
  _UNKNOWN **v4;
  id v5;

  v1 = [&off_100015B60 objectForKeyedSubscript:a1];
  v2 = (void *)v1;
  v3 = &off_100015A48;
  if (v1) {
    v3 = (_UNKNOWN **)v1;
  }
  v4 = v3;

  v5 = [v4 integerValue];
  return v5;
}

NSDictionary *__cdecl sub_100001F1C(id a1, HDOriginalFHIRResourceObject *a2)
{
  return (NSDictionary *)[(HDOriginalFHIRResourceObject *)a2 JSONObject];
}

id sub_10000254C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchOrRefreshCredentialWithClientCompletion:", *(void *)(a1 + 40));
}

uint64_t sub_1000026CC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000280C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) result];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100002A10(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 88);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002ACC;
  block[3] = &unk_100014490;
  block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

id sub_100002ACC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleDelegateRefreshCompletionForInitialResult:refreshResult:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t sub_100002F1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002F2C(uint64_t a1)
{
}

void sub_100002F34(uint64_t a1)
{
}

void sub_100002FE0(uint64_t a1)
{
}

void sub_100003098(uint64_t a1)
{
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = +[HDXPCListener serviceListener];
  uint64_t v4 = [[HDHealthRecordsLegacyIngestionXPCServiceManager alloc] initWithListener:v3];
  [(HDHealthRecordsLegacyIngestionXPCServiceManager *)v4 resume];

  return 0;
}

void sub_100004B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5 = *(void **)(a1 + 32);
  if (a2) {
    [v5 _handleTaskCompletedWithData:a2 endState:a3];
  }
  else {
    [v5 _handleTaskError:a4 retryCount:*(void *)(a1 + 40) endState:a3];
  }
  id v6 = [*(id *)(a1 + 32) fetchGroup];
  dispatch_group_leave(v6);
}

unint64_t HDFHIRQueryModeFromHKFHIRResourceQueryMode(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >= 3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_10000BAAC();
    }
    return 0;
  }
  return v1;
}

uint64_t sub_100004C10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004C20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005694(id a1)
{
  id v1 = objc_alloc_init((Class)NSISO8601DateFormatter);
  id v2 = (void *)qword_10001B4E8;
  qword_10001B4E8 = (uint64_t)v1;

  [(id)qword_10001B4E8 setFormatOptions:275];
  id v3 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [(id)qword_10001B4E8 setTimeZone:v3];
}

void sub_100005794(id a1)
{
  id v1 = objc_alloc_init((Class)NSISO8601DateFormatter);
  id v2 = (void *)qword_10001B4F8;
  qword_10001B4F8 = (uint64_t)v1;

  [(id)qword_10001B4F8 setFormatOptions:1907];
  id v3 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [(id)qword_10001B4F8 setTimeZone:v3];
}

void sub_100005930(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100006B04(uint64_t a1)
{
  uint64_t v1 = [&off_100015B88 objectForKeyedSubscript:a1];
  id v2 = (void *)v1;
  id v3 = &off_100015AC0;
  if (v1) {
    id v3 = (_UNKNOWN **)v1;
  }
  uint64_t v4 = v3;

  id v5 = [v4 integerValue];
  return v5;
}

void sub_100008938(uint64_t a1)
{
}

void sub_100008944(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v17)
  {
    [*(id *)(a1 + 32) startTaskWithRequest:v17 completion:*(void *)(a1 + 40)];
  }
  else
  {
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = +[NSError hk_error:7 description:@"Unable to create a URL request for a mysterious reason"];
    }
    id v8 = v7;
    id v9 = [0 URL];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      v12 = [*(id *)(*(void *)(a1 + 32) + 24) specification];
      v13 = [v12 connection];
      v14 = [v13 gateway];
      id v11 = [v14 baseURL];
    }
    v15 = [*(id *)(a1 + 32) resourceType];
    v16 = +[HKFHIRRequestTaskEndState endStateForCanceledRequestAtURL:resourceType:interactionType:](HKFHIRRequestTaskEndState, "endStateForCanceledRequestAtURL:resourceType:interactionType:", v11, v15, [*(id *)(a1 + 32) interactionType]);

    [*(id *)(a1 + 32) handleError:v8 endState:v16];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100008C74(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v37 = +[NSAssertionHandler currentHandler];
      [v37 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"HDFHIRRequestTask.m", 90, @"Invalid parameter not satisfying: %@", @"response == nil || (response != nil && [response isKindOfClass:[NSHTTPURLResponse class]])" object file lineNumber description];
    }
  }
  uint64_t v10 = +[NSDate now];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;
  id v13 = v8;
  _HKInitializeLogging();
  v14 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    v15 = v14;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v45 = (id)objc_opt_class();
      os_log_t log = [*(id *)(a1 + 40) HTTPMethod];
      v41 = [*(id *)(a1 + 40) URL];
      v39 = [v41 absoluteString];
      HKSensitiveLogItem();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      if (v9) {
        v33 = "error";
      }
      else {
        v33 = "response";
      }
      v34 = v9;
      if (!v9)
      {
        id v35 = v32;
        v34 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 statusCode]);
        id v32 = v35;
      }
      *(_DWORD *)buf = 138544386;
      id v47 = v45;
      __int16 v48 = 2114;
      os_log_t v49 = log;
      __int16 v50 = 2112;
      id v51 = v32;
      __int16 v52 = 2080;
      v53 = v33;
      __int16 v54 = 2114;
      v55 = v34;
      v36 = v32;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}@ completed for %{public}@ %@ with %s: %{public}@", buf, 0x34u);
      if (!v9) {
    }
      }
  }
  id v16 = objc_alloc((Class)HKFHIRRequestTaskEndState);
  id v17 = [*(id *)(a1 + 40) URL];
  v18 = [*(id *)(a1 + 32) resourceType];
  id v19 = objc_msgSend(v16, "initWithRequestedURL:resourceType:interactionType:responseStatusCode:requestEndTime:requestDuration:hadError:errorCode:", v17, v18, objc_msgSend(*(id *)(a1 + 32), "interactionType"), objc_msgSend(v13, "statusCode"), v10, 0, v12 - *(double *)(a1 + 64), 0);

  if (v8)
  {
    uint64_t v20 = [*(id *)(a1 + 32) _errorForRequest:*(void *)(a1 + 40) response:v13 data:v7];
    if (v20)
    {
      id v21 = (id)v20;
      _HKInitializeLogging();
      v22 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        loga = v22;
        v23 = objc_opt_class();
        v24 = *(void **)(a1 + 40);
        id v44 = v23;
        v40 = [v24 URL];
        v38 = [v40 absoluteString];
        v25 = HKSensitiveLogItem();
        v26 = objc_msgSend(v21, "hrs_safelyLoggableDescription");
        *(_DWORD *)buf = 138543874;
        id v47 = v23;
        __int16 v48 = 2112;
        os_log_t v49 = v25;
        __int16 v50 = 2112;
        id v51 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "%{public}@ response for request %@: %@", buf, 0x20u);
      }
      goto LABEL_12;
    }
    v30 = *(void **)(a1 + 32);
    if (v7)
    {
      [*(id *)(a1 + 32) _handleResponse:v13 data:v7 endState:v19];
    }
    else
    {
      v31 = +[NSData data];
      [v30 _handleResponse:v13 data:v31 endState:v19];
    }
    id v21 = 0;
  }
  else
  {
    id v21 = v9;
    if (v21)
    {
LABEL_12:
      v27 = objc_msgSend(v21, "hk_OAuth2_errorCode");
      v28 = *(void **)(a1 + 32);
      v29 = [v19 asErrorEndStateWithErrorCode:v27];
      [v28 _handleError:v21 endState:v29];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_100009544(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009554(uint64_t a1)
{
}

void sub_10000955C(uint64_t a1)
{
}

void sub_100009678(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 32))
  {
    uint64_t v4 = +[NSAssertionHandler currentHandler];
    id v5 = (const char *)a1[6];
    uint64_t v6 = a1[4];
    id v7 = NSStringFromSelector(v5);
    [v4 handleFailureInMethod:v5, v6, @"HDFHIRRequestTask.m", 225, @"%@ may be called at most once", v7 object file lineNumber description];

    uint64_t v2 = a1[4];
  }
  id v3 = (void *)a1[5];

  objc_storeStrong((id *)(v2 + 32), v3);
}

uint64_t sub_100009794()
{
  return NSRequestConcreteImplementation();
}

id sub_100009FCC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldRefreshTokenForCredentialedTaskError:a2];
}

void sub_10000A7CC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v11 = [objc_alloc((Class)HKFHIRRequestTaskEndStates) initWithEndState:v8];

  id v10 = [objc_alloc((Class)HKFHIRCredentialRefreshResult) initWithCredential:*(void *)(a1 + 32) authResponse:v9 endStates:v11 error:v7];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
  [*(id *)(a1 + 40) setRefreshResult:v10];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000ACD8(void *a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)a1[4];
    uint64_t v6 = v4;
    id v7 = [v5 logPrefix];
    uint64_t v8 = a1[5];
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ execution of %{public}@ resulted in %{public}@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_10000AF54(id a1, HDFHIRCredentialResult *a2, HKFHIRRequestTaskEndStates *a3)
{
  id v3 = a2;
  id v4 = [(HDFHIRCredentialResult *)v3 assembleUpdatedCredential];
  [(HDFHIRCredentialResult *)v3 didRefreshCredential:v4];
}

void sub_10000B750(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setCredentialResult:v3];
  id v4 = [v3 refreshError];
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    id v8 = 0;
    uint64_t v6 = [v5 createURLRequestWithCredentialResult:v3 error:&v8];
    id v7 = v8;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000B8C8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 logDescription];
  sub_100005950();
  sub_100005930((void *)&_mh_execute_header, v5, v6, "%{public}@ finished downloading", v7, v8, v9, v10, v11);
}

void sub_10000B95C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 logDescription];
  sub_100005950();
  sub_100005930((void *)&_mh_execute_header, v5, v6, "%{public}@ starting to download", v7, v8, v9, v10, v11);
}

void sub_10000B9F0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 logDescription];
  sub_100005950();
  __int16 v8 = 2048;
  uint64_t v9 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}@ fetching with %zd retry(ies) remaining", v7, 0x16u);
}

void sub_10000BAAC()
{
  sub_100005950();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unknown HKFHIRResourceQueryMode %lu, returning \"all\" HDFHIRQueryMode", v1, 0xCu);
}

void sub_10000BB20(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 logDescription];
  uint64_t v7 = objc_msgSend(a3, "hrs_safelyLoggableDescription");
  int v8 = 138543618;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  uint8_t v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@ fetching failed with error: %{public}@", (uint8_t *)&v8, 0x16u);
}

void sub_10000BD2C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  id v6 = v5;
  uint64_t v7 = [a3 HTTPMethod];
  int v8 = [a3 URL];
  uint64_t v9 = [v8 absoluteString];
  __int16 v10 = HKSensitiveLogItem();
  int v11 = 138543874;
  uint64_t v12 = v5;
  __int16 v13 = 2114;
  id v14 = v7;
  __int16 v15 = 2112;
  id v16 = v10;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}@ starting with request %{public}@ %@", (uint8_t *)&v11, 0x20u);
}

void sub_10000BE54(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  id v6 = [a2 logPrefix];
  int v7 = 138543618;
  int v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@ failed to instantiate download operation. Error: %{public}@", (uint8_t *)&v7, 0x16u);
}

uint64_t HDHealthRecordsPublicUserAgentString()
{
  return _HDHealthRecordsPublicUserAgentString();
}

uint64_t HKCreateConcurrentDispatchQueue()
{
  return _HKCreateConcurrentDispatchQueue();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return _HKCreateSerialDispatchQueue();
}

uint64_t HKFHIRServerAuthenticationPKCEAlgorithmIsSupported()
{
  return _HKFHIRServerAuthenticationPKCEAlgorithmIsSupported();
}

uint64_t HKSafeObject()
{
  return _HKSafeObject();
}

uint64_t HKSensitiveLogItem()
{
  return _HKSensitiveLogItem();
}

uint64_t HKStringFromBool()
{
  return _HKStringFromBool();
}

uint64_t NSRequestConcreteImplementation()
{
  return _NSRequestConcreteImplementation();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromHKFHIRServerAuthenticationPKCEAlgorithm()
{
  return _NSStringFromHKFHIRServerAuthenticationPKCEAlgorithm();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_HTTPMethod(void *a1, const char *a2, ...)
{
  return [a1 HTTPMethod];
}

id objc_msgSend_PKCEAlgorithm(void *a1, const char *a2, ...)
{
  return [a1 PKCEAlgorithm];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_URLSession(void *a1, const char *a2, ...)
{
  return [a1 URLSession];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__createDefaultURLSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _createDefaultURLSessionConfiguration];
}

id objc_msgSend__defaultRetryCount(void *a1, const char *a2, ...)
{
  return [a1 _defaultRetryCount];
}

id objc_msgSend__parseEndpointSchemas(void *a1, const char *a2, ...)
{
  return [a1 _parseEndpointSchemas];
}

id objc_msgSend__performPreflightChecks(void *a1, const char *a2, ...)
{
  return [a1 _performPreflightChecks];
}

id objc_msgSend__requiredRootKeys(void *a1, const char *a2, ...)
{
  return [a1 _requiredRootKeys];
}

id objc_msgSend__schemaVariableBindings(void *a1, const char *a2, ...)
{
  return [a1 _schemaVariableBindings];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessToken(void *a1, const char *a2, ...)
{
  return [a1 accessToken];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_accountInformation(void *a1, const char *a2, ...)
{
  return [a1 accountInformation];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assembleEndStates(void *a1, const char *a2, ...)
{
  return [a1 assembleEndStates];
}

id objc_msgSend_assembleUpdatedCredential(void *a1, const char *a2, ...)
{
  return [a1 assembleUpdatedCredential];
}

id objc_msgSend_authResponse(void *a1, const char *a2, ...)
{
  return [a1 authResponse];
}

id objc_msgSend_authSchemaDefinitions(void *a1, const char *a2, ...)
{
  return [a1 authSchemaDefinitions];
}

id objc_msgSend_authType(void *a1, const char *a2, ...)
{
  return [a1 authType];
}

id objc_msgSend_authentication(void *a1, const char *a2, ...)
{
  return [a1 authentication];
}

id objc_msgSend_authenticationInformation(void *a1, const char *a2, ...)
{
  return [a1 authenticationInformation];
}

id objc_msgSend_authorization(void *a1, const char *a2, ...)
{
  return [a1 authorization];
}

id objc_msgSend_authorizationEndpointType(void *a1, const char *a2, ...)
{
  return [a1 authorizationEndpointType];
}

id objc_msgSend_authorizationSchemas(void *a1, const char *a2, ...)
{
  return [a1 authorizationSchemas];
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return [a1 baseURL];
}

id objc_msgSend_bindings(void *a1, const char *a2, ...)
{
  return [a1 bindings];
}

id objc_msgSend_bodyParameters(void *a1, const char *a2, ...)
{
  return [a1 bodyParameters];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return [a1 clientID];
}

id objc_msgSend_clientSecret(void *a1, const char *a2, ...)
{
  return [a1 clientSecret];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_consumeRefreshResult(void *a1, const char *a2, ...)
{
  return [a1 consumeRefreshResult];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return [a1 credential];
}

id objc_msgSend_credentialResult(void *a1, const char *a2, ...)
{
  return [a1 credentialResult];
}

id objc_msgSend_credentialResultDidUpdateHandler(void *a1, const char *a2, ...)
{
  return [a1 credentialResultDidUpdateHandler];
}

id objc_msgSend_credentialVendor(void *a1, const char *a2, ...)
{
  return [a1 credentialVendor];
}

id objc_msgSend_credentialedSession(void *a1, const char *a2, ...)
{
  return [a1 credentialedSession];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentResult(void *a1, const char *a2, ...)
{
  return [a1 currentResult];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_definition(void *a1, const char *a2, ...)
{
  return [a1 definition];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_endStates(void *a1, const char *a2, ...)
{
  return [a1 endStates];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_expiration(void *a1, const char *a2, ...)
{
  return [a1 expiration];
}

id objc_msgSend_fetchGroup(void *a1, const char *a2, ...)
{
  return [a1 fetchGroup];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_fullRequestURL(void *a1, const char *a2, ...)
{
  return [a1 fullRequestURL];
}

id objc_msgSend_gateway(void *a1, const char *a2, ...)
{
  return [a1 gateway];
}

id objc_msgSend_headerParameters(void *a1, const char *a2, ...)
{
  return [a1 headerParameters];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interactionType(void *a1, const char *a2, ...)
{
  return [a1 interactionType];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isExpired(void *a1, const char *a2, ...)
{
  return [a1 isExpired];
}

id objc_msgSend_isInvalidated(void *a1, const char *a2, ...)
{
  return [a1 isInvalidated];
}

id objc_msgSend_lastFetchDate(void *a1, const char *a2, ...)
{
  return [a1 lastFetchDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_logDescription(void *a1, const char *a2, ...)
{
  return [a1 logDescription];
}

id objc_msgSend_logPrefix(void *a1, const char *a2, ...)
{
  return [a1 logPrefix];
}

id objc_msgSend_method(void *a1, const char *a2, ...)
{
  return [a1 method];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_originalCredential(void *a1, const char *a2, ...)
{
  return [a1 originalCredential];
}

id objc_msgSend_patientID(void *a1, const char *a2, ...)
{
  return [a1 patientID];
}

id objc_msgSend_pkceVerifier(void *a1, const char *a2, ...)
{
  return [a1 pkceVerifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_queryMode(void *a1, const char *a2, ...)
{
  return [a1 queryMode];
}

id objc_msgSend_queryParameters(void *a1, const char *a2, ...)
{
  return [a1 queryParameters];
}

id objc_msgSend_refreshError(void *a1, const char *a2, ...)
{
  return [a1 refreshError];
}

id objc_msgSend_refreshToken(void *a1, const char *a2, ...)
{
  return [a1 refreshToken];
}

id objc_msgSend_refreshedCredential(void *a1, const char *a2, ...)
{
  return [a1 refreshedCredential];
}

id objc_msgSend_requestedScopeString(void *a1, const char *a2, ...)
{
  return [a1 requestedScopeString];
}

id objc_msgSend_resourceSchema(void *a1, const char *a2, ...)
{
  return [a1 resourceSchema];
}

id objc_msgSend_resourceSchemaDefinition(void *a1, const char *a2, ...)
{
  return [a1 resourceSchemaDefinition];
}

id objc_msgSend_resourceSchemaDefinitions(void *a1, const char *a2, ...)
{
  return [a1 resourceSchemaDefinitions];
}

id objc_msgSend_resourceSchemas(void *a1, const char *a2, ...)
{
  return [a1 resourceSchemas];
}

id objc_msgSend_resourceType(void *a1, const char *a2, ...)
{
  return [a1 resourceType];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scope(void *a1, const char *a2, ...)
{
  return [a1 scope];
}

id objc_msgSend_scopeString(void *a1, const char *a2, ...)
{
  return [a1 scopeString];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_shouldRefresh(void *a1, const char *a2, ...)
{
  return [a1 shouldRefresh];
}

id objc_msgSend_specification(void *a1, const char *a2, ...)
{
  return [a1 specification];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_wrappedCredential(void *a1, const char *a2, ...)
{
  return [a1 wrappedCredential];
}