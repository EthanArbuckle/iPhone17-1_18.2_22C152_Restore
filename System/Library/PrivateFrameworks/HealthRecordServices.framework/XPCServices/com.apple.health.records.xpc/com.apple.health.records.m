void sub_100003C68(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = [*(id *)(a1 + 32) FHIRProcessor];
  v3 = *(void *)(a1 + 40);
  v6 = 0;
  v4 = [v2 processReferenceExtractionRequest:v3 error:&v6];
  v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100003DD4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) FHIRProcessor];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = 0;
  v5 = [v2 compareExistingPatientResourceData:v3 incomingPatientResourceData:v4 error:&v7];
  id v6 = v7;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100003F20(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) FHIRProcessor];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  uint64_t v4 = [v2 processExtractionRequest:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000406C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) FHIRProcessor];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  uint64_t v4 = [v2 extractAttachmentContentFromFHIRResource:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000041D8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) FHIRProcessor];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = 0;
  id v5 = [v2 processOptInRequest:v3 redactor:v4 error:&v7];
  id v6 = v7;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100004324(void *a1)
{
  _HKInitializeLogging();
  v2 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543362;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_preprocessSignedClinicalData starting", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)HDHRSignedClinicalDataHandler);
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[7];
  id v16 = 0;
  v9 = [v6 preprocessDataInSource:v7 options:v8 error:&v16];
  id v10 = v16;
  _HKInitializeLogging();
  v11 = (void *)HKLogHealthRecords;
  if (v9)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_preprocessSignedClinicalData finished successfully", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_100005BDC((uint64_t)a1, (uint64_t)v11, (uint64_t)v10, v15);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_1000045C0(void *a1)
{
  _HKInitializeLogging();
  v2 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543362;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_preprocessSignedClinicalDataFHIRResourceObject starting", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)HDHRSignedClinicalDataHandler);
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[7];
  id v16 = 0;
  v9 = [v6 preprocessFHIRResourceObject:v7 options:v8 error:&v16];
  id v10 = v16;
  _HKInitializeLogging();
  v11 = (void *)HKLogHealthRecords;
  if (v9)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_preprocessSignedClinicalDataFHIRResourceObject finished successfully", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_100005C70((uint64_t)a1, (uint64_t)v11, (uint64_t)v10, v15);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_10000485C(void *a1)
{
  _HKInitializeLogging();
  v2 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543362;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_reprocessOriginalRecords starting", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)HDHRSignedClinicalDataHandler);
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[7];
  id v16 = 0;
  v9 = [v6 reprocessOriginalRecords:v7 options:v8 error:&v16];
  id v10 = v16;
  _HKInitializeLogging();
  v11 = (void *)HKLogHealthRecords;
  if (v9)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_reprocessOriginalRecords finished successfully", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_100005D04((uint64_t)a1, (uint64_t)v11, (uint64_t)v10, v15);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_100004AF8(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_processOriginalSignedClinicalDataRecords starting", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)HDHRSignedClinicalDataHandler);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004C58;
  v9[3] = &unk_100008210;
  uint64_t v7 = *(void *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  [v6 processOriginalSignedClinicalDataRecords:v7 options:v8 completion:v9];
}

void sub_100004C58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  _HKInitializeLogging();
  uint64_t v7 = (void *)HKLogHealthRecords;
  if (a2)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_processOriginalSignedClinicalDataRecords finished successfully", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_100005D98(a1, (uint64_t)v7, (uint64_t)v5, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100004E54(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_processSignedClinicalDataContextCollection starting", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)HDHRSignedClinicalDataHandler);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004FB0;
  v8[3] = &unk_100008210;
  uint64_t v7 = *(void *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  [v6 processContextCollection:v7 completion:v8];
}

void sub_100004FB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  _HKInitializeLogging();
  uint64_t v7 = (void *)HKLogHealthRecords;
  if (a2)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_processSignedClinicalDataContextCollection finished successfully", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_100005E2C(a1, (uint64_t)v7, (uint64_t)v5, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000051AC(uint64_t a1)
{
  v2 = +[NSUUID UUID];
  uint64_t v3 = [v2 UUIDString];
  uint64_t v4 = [v3 substringFromIndex:24];

  _HKInitializeLogging();
  id v5 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138543618;
    id v16 = v8;
    __int16 v17 = 2114;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_indexClinicalDocumentsWithRequest %{public}@ starting", buf, 0x16u);
  }
  id v9 = objc_alloc_init((Class)HKClinicalDocumentIndexingRequestHandler);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005360;
  v12[3] = &unk_100008238;
  uint64_t v10 = *(void *)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v4;
  id v14 = *(id *)(a1 + 48);
  id v11 = v4;
  [v9 indexClinicalDocumentsWithRequest:v10 completion:v12];
}

void sub_100005360(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  _HKInitializeLogging();
  uint64_t v7 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138543618;
    id v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_indexClinicalDocumentsWithRequest %{public}@ completed", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100005544(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_fetchSpotlightSearchResultsForQueryString starting", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)HKClinicalDocumentIndexingRequestHandler);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000056A0;
  v8[3] = &unk_100008260;
  uint64_t v7 = *(void *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  [v6 fetchSpotlightSearchResultsForQueryString:v7 completion:v8];
}

void sub_1000056A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  _HKInitializeLogging();
  uint64_t v7 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    int v11 = 138543362;
    int v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: remote_fetchSpotlightSearchResultsForQueryString completed", (uint8_t *)&v11, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000058D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005998(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_1000059B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _objc_retain_x1(a1, a2, a3, a4);
}

uint64_t sub_1000059D0()
{
  return objc_opt_class();
}

int main(int argc, const char **argv, const char **envp)
{
  _HKInitializeLogging();
  uint64_t v3 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = v3;
    id v5 = +[NSProcessInfo processInfo];
    id v6 = [v5 processName];
    int v10 = 138543362;
    int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@ did launch", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = +[HDXPCListener serviceListener];
  uint64_t v8 = [[HDHealthRecordsXPCServiceManager alloc] initWithListener:v7];
  [(HDHealthRecordsXPCServiceManager *)v8 resume];

  return 0;
}

void sub_100005BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000059B8(a1, a2, a3, a4);
  id v5 = (objc_class *)sub_1000059D0();
  id v6 = NSStringFromClass(v5);
  sub_100005980();
  sub_100005998((void *)&_mh_execute_header, v7, v8, "%{public}@: remote_preprocessSignedClinicalData failed with error: %{public}@", v9, v10, v11, v12, v13);
}

void sub_100005C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000059B8(a1, a2, a3, a4);
  id v5 = (objc_class *)sub_1000059D0();
  id v6 = NSStringFromClass(v5);
  sub_100005980();
  sub_100005998((void *)&_mh_execute_header, v7, v8, "%{public}@: remote_preprocessSignedClinicalDataFHIRResourceObject failed with error: %{public}@", v9, v10, v11, v12, v13);
}

void sub_100005D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000059B8(a1, a2, a3, a4);
  id v5 = (objc_class *)sub_1000059D0();
  id v6 = NSStringFromClass(v5);
  sub_100005980();
  sub_100005998((void *)&_mh_execute_header, v7, v8, "%{public}@: remote_reprocessOriginalRecords failed with error: %{public}@", v9, v10, v11, v12, v13);
}

void sub_100005D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000059B8(a1, a2, a3, a4);
  id v5 = (objc_class *)sub_1000059D0();
  id v6 = NSStringFromClass(v5);
  sub_100005980();
  sub_100005998((void *)&_mh_execute_header, v7, v8, "%{public}@: remote_processOriginalSignedClinicalDataRecords failed with error: %{public}@", v9, v10, v11, v12, v13);
}

void sub_100005E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000059B8(a1, a2, a3, a4);
  id v5 = (objc_class *)sub_1000059D0();
  id v6 = NSStringFromClass(v5);
  sub_100005980();
  sub_100005998((void *)&_mh_execute_header, v7, v8, "%{public}@: remote_processSignedClinicalDataContextCollection failed with error: %{public}@", v9, v10, v11, v12, v13);
}

uint64_t HKDispatchAsyncOnGlobalConcurrentQueue()
{
  return _HKDispatchAsyncOnGlobalConcurrentQueue();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_FHIRProcessor(void *a1, const char *a2, ...)
{
  return [a1 FHIRProcessor];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_extractionRulesetVersion(void *a1, const char *a2, ...)
{
  return [a1 extractionRulesetVersion];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_supportedFHIRConfiguration(void *a1, const char *a2, ...)
{
  return [a1 supportedFHIRConfiguration];
}