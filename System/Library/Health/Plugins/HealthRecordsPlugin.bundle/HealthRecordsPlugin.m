uint64_t sub_51E8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

void sub_5454(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_shouldScheduleIngestion"))
  {
    uint64_t v2 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = v2;

    [*(id *)(a1 + 32) scheduleIngestionWithReason:@"querying for health records samples"];
    v5 = (void (**)(void))objc_retainBlock(*(id *)(*(void *)(a1 + 32) + 120));
    if (v5)
    {
      v6 = v5;
      v5[2]();
      v5 = v6;
    }
  }
}

void sub_6198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_61BC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[HDSignedClinicalDataIssuerEntity propertiesForCodable];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = [*(id *)(a1 + 40) database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_6300;
  v15[3] = &unk_111758;
  id v16 = *(id *)(a1 + 40);
  id v17 = v5;
  id v18 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  id v12 = v5;
  id v13 = +[HDSignedClinicalDataIssuerEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDSignedClinicalDataIssuerEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v11, v10, 0, v7, v9, a3, v15);

  return v13;
}

BOOL sub_6300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = +[HDSignedClinicalDataIssuerEntity codableWithRow:a4 error:a8];
  if (v10)
  {
    uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
    id v12 = [*(id *)(a1 + 32) syncIdentityManager];
    id v13 = [v12 identityForEntityID:v11 transaction:*(void *)(a1 + 40) error:a8];

    BOOL v14 = v13 != 0;
    if (v13)
    {
      v15 = [v13 identity];
      id v16 = [v15 codableSyncIdentity];
      [v10 setSyncIdentity:v16];

      [*(id *)(a1 + 48) addObject:v10];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

BOOL sub_6654(id a1, HDSyncCodable *a2)
{
  uint64_t v2 = a2;
  objc_opt_class();
  uint64_t v3 = HKSafeObject();

  id v4 = 0;
  if (!v3)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AA228((uint64_t)v4, v5);
    }
  }

  return v3 != 0;
}

void sub_7A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

intptr_t sub_7A24(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  unsigned int v3 = [v2 shouldSkipFetch];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 context];
    v6 = [v5 inputFileHandle];

    _HKInitializeLogging();
    uint64_t v7 = (void *)HKLogHealthRecords;
    BOOL v8 = os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        v9 = *(void **)(a1 + 40);
        uint64_t v11 = v7;
        id v12 = [v9 identifier];
        int v21 = 138543618;
        uint64_t v22 = v10;
        __int16 v23 = 2114;
        v24 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: performing file import", (uint8_t *)&v21, 0x16u);
      }
      [*(id *)(a1 + 32) _performFileImportWithAccount:*(void *)(a1 + 40)];
    }
    else if (v8)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      id v16 = *(void **)(a1 + 40);
      id v18 = v7;
      v19 = [v16 identifier];
      int v21 = 138543618;
      uint64_t v22 = v17;
      __int16 v23 = 2114;
      v24 = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: ingestion skipping fetch", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    [v4 _performFetchWithAccount:*(void *)(a1 + 40) batchingSemaphore:*(void *)(a1 + 48)];
    id v13 = [*(id *)(a1 + 32) context];
    BOOL v14 = [v13 inputFileHandle];

    if (v14)
    {
      _HKInitializeLogging();
      v15 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_AA328(v15);
      }
    }
  }
  intptr_t result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  atomic_store(0, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  return result;
}

void sub_7C34(uint64_t a1)
{
  for (i = (atomic_uchar *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
        (atomic_exchange(i, 1u) & 1) != 0;
        i = (atomic_uchar *)(*(void *)(*(void *)(a1 + 56) + 8) + 32))
  {
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), v3);
    [*(id *)(a1 + 40) _performExtractionWithAccount:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 40) _performExtractionWithAccount:*(void *)(a1 + 48)];
  _HKInitializeLogging();
  id v4 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    uint64_t v7 = v4;
    BOOL v8 = [v5 identifier];
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: extraction finished", (uint8_t *)&v9, 0x16u);
  }
}

id sub_85E0(id a1, HDUnresolvedReferenceSet *a2)
{
  return [(HDUnresolvedReferenceSet *)a2 resource];
}

id sub_85E8(id a1, HDUnresolvedReferenceSet *a2)
{
  return [(HDUnresolvedReferenceSet *)a2 resource];
}

void sub_9A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_9A9C(void *a1, uint64_t a2)
{
  id v4 = (os_unfair_lock_s *)(*(void *)(a1[5] + 8) + 32);
  uint64_t v5 = *(void *)(a1[6] + 8);
  os_unfair_lock_lock(v4);
  unint64_t v6 = *(void *)(v5 + 24) + a2;
  if (v6 <= 0x31) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 0;
  }
  *(void *)(v5 + 24) = v7;
  os_unfair_lock_unlock(v4);
  if (v6 >= 0x32)
  {
    BOOL v8 = a1[4];
    dispatch_semaphore_signal(v8);
  }
}

BOOL sub_9B28(id a1, HDFHIRResourceSchema *a2)
{
  uint64_t v2 = [(HDFHIREndpointSchema *)a2 name];
  unsigned __int8 v3 = [v2 isEqualToString:@"Observation"];

  return v3;
}

id sub_A98C(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[4], a1[5]);
  }
  unsigned __int8 v3 = *(void **)(a1[4] + 56);

  return [v3 invalidate];
}

id sub_AC08(id a1, HDClinicalIngestionTaskPerAccountInfo *a2)
{
  uint64_t v2 = a2;
  id v3 = objc_alloc((Class)HKClinicalIngestionPerAccountOutcome);
  id v4 = [(HDClinicalIngestionTaskPerAccountInfo *)v2 accountIdentifier];
  id v5 = [(HDClinicalIngestionTaskPerAccountInfo *)v2 outcomeInfo];

  id v6 = [v3 initWithAccountIdentifier:v4 info:v5];

  return v6;
}

id sub_AFC4(id a1, HDClinicalAccount *a2)
{
  return [(HDClinicalAccount *)a2 identifier];
}

void sub_B168(id a1, HDClinicalAccount *a2, id a3)
{
  id v5 = a3;
  id v6 = a2;
  id v10 = [(HDClinicalAccount *)v6 identifier];
  unint64_t v7 = [HDClinicalIngestionTaskPerAccountInfo alloc];
  BOOL v8 = [(HDClinicalAccount *)v6 identifier];

  int v9 = [(HDClinicalIngestionTaskPerAccountInfo *)v7 initWithAccountIdentifier:v8];
  (*((void (**)(id, id, HDClinicalIngestionTaskPerAccountInfo *))a3 + 2))(v5, v10, v9);
}

void sub_C32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_C344(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_C354(uint64_t a1)
{
}

void sub_C35C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_C434;
  v8[3] = &unk_111A10;
  id v6 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  char v13 = *(unsigned char *)(a1 + 64);
  id v9 = v6;
  id v10 = *(id *)(a1 + 32);
  id v11 = v3;
  id v7 = v3;
  [v4 consumeMetricsFromHandler:v5 completion:v8];
}

void sub_C434(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_C510;
    v7[3] = &unk_1119E8;
    id v8 = *(id *)(a1 + 48);
    [v5 submitClinicalIngestionAnalyticsFromAccumulator:v6 completion:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_C510(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_C74C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = [(NSError *)v2 domain];
  unsigned int v4 = [v3 isEqualToString:HKHTTPErrorDomain];

  if (v4) {
    char v5 = (uint32_t *)[(NSError *)v2 code] != &stru_158.nreloc;
  }
  else {
    char v5 = 1;
  }

  return v5;
}

void sub_CC84(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_D04C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_D618(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    uint64_t v10 = (char *)[v8 statusCode];
    _HKInitializeLogging();
    id v11 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v45 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Received response for opt-in study device registration with status code %ld", buf, 0xCu);
    }
    if ((unint64_t)(v10 - 200) >= 0x64)
    {
      id v14 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
      _HKInitializeLogging();
      v26 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AA77C((uint64_t)v14, (uint64_t)v10, v26);
      }
      goto LABEL_27;
    }
    id v43 = 0;
    uint64_t v12 = +[NSJSONSerialization JSONObjectWithData:v7 options:1 error:&v43];
    id v13 = v43;
    id v14 = v13;
    if (!v12 || v13)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AA66C();
      }
      goto LABEL_26;
    }
    v15 = [v12 objectForKeyedSubscript:@"subjectId"];
    id v16 = [v12 objectForKeyedSubscript:@"token"];
    if (v15)
    {
      id v17 = [objc_alloc((Class)NSUUID) initWithUUIDString:v15];
      if (v17)
      {
LABEL_20:
        if (v16)
        {
          if (v17)
          {
            os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
            [*(id *)(a1 + 32) setSubjectID:v15];
            [*(id *)(a1 + 32) setSubjectToken:v16];
            os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
            [*(id *)(a1 + 32) enableDataCollection];
          }
        }
        else
        {
          _HKInitializeLogging();
          v35 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
            sub_AA6D4(v35, v36, v37, v38, v39, v40, v41, v42);
          }
        }

LABEL_26:
LABEL_27:

        goto LABEL_28;
      }
      _HKInitializeLogging();
      id v18 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AA744(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      _HKInitializeLogging();
      v27 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AA70C(v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
    id v17 = 0;
    goto LABEL_20;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_AA7F4();
  }
LABEL_28:
}

void sub_EFF0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_F018(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_F034(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_F200(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsString();
  uint64_t v3 = HDSQLiteColumnWithNameAsDate();
  uint64_t v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AA938(a1, v6);
    }
  }
  else
  {
    id v7 = [objc_alloc((Class)HKSignedClinicalDataRegistryPublicKeyEntry) initWithKeyID:v2 added:v3 removed:0 source:0 jwkData:0];
    [*(id *)(a1 + 32) addObject:v7];
  }
  return 1;
}

void sub_F764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_F7A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_F7B0(uint64_t a1)
{
}

uint64_t sub_F7B8(void *a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsDate();
  uint64_t v3 = *(void *)(a1[4] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = HDSQLiteColumnWithNameAsDate();
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(void *)(*(void *)(a1[6] + 8) + 40) = HDSQLiteColumnWithNameAsData();

  return _objc_release_x1();
}

uint64_t sub_F9CC()
{
  HDSQLiteBindStringToProperty();
  HDSQLiteBindDateToProperty();
  HDSQLiteBindDateToProperty();
  v0 = +[NSDate now];
  HDSQLiteBindDateToProperty();

  HDSQLiteBindStringToProperty();

  return HDSQLiteBindDataToProperty();
}

uint64_t sub_FD40()
{
  HDSQLiteBindDateToProperty();
  v0 = +[NSDate now];
  HDSQLiteBindDateToProperty();

  return HDSQLiteBindNullToProperty();
}

uint64_t _ingestionStatusFromHKClinicalIngestionState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 0;
  }
  else {
    return qword_F2800[a1 - 1];
  }
}

void sub_FF4C(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_AAAA8();
  }
}

id sub_100A0(id a1, HDClinicalAccount *a2)
{
  id v2 = a2;
  id v3 = [objc_alloc((Class)HKClinicalAccount) initWithDaemonClinicalAccount:v2];

  id v4 = [objc_alloc((Class)HKClinicalConnectedAccount) initWithClinicalAccount:v3];

  return v4;
}

uint64_t _accountsEventFromHKClinicalAccountStateChangeType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3) {
    return 0;
  }
  else {
    return a1 + 2;
  }
}

void sub_10574(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_AAC04();
  }
}

id sub_10AC8(uint64_t a1, void *a2)
{
  id v3 = [a2 metadata];
  id v4 = [v3 objectForKeyedSubscript:_HKPrivateMetadataKeyMedicalRecordUUID];
  uint64_t v5 = [*(id *)(a1 + 32) UUID];
  uint64_t v6 = [v5 UUIDString];
  id v7 = [v4 isEqual:v6];

  return v7;
}

id sub_1107C(id a1, HDHRSExtractionFailureRecord *a2)
{
  return [(HDHRSExtractionFailureRecord *)a2 internalDisplaySafeDescription];
}

void sub_11600(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = [a2 analyticsString];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    id v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
}

BOOL sub_12200(id a1, HKClinicalGatewayEndpointSchema *a2)
{
  uint64_t v2 = [(HKClinicalGatewayEndpointSchema *)a2 name];
  unsigned __int8 v3 = [v2 isEqualToString:@"authorize"];

  return v3;
}

BOOL sub_12244(id a1, HKClinicalGatewayEndpointSchemaParameter *a2)
{
  uint64_t v2 = [(HKClinicalGatewayEndpointSchemaParameter *)a2 param];
  unsigned __int8 v3 = [v2 isEqualToString:@"redirect_uri"];

  return v3;
}

void sub_1247C(uint64_t a1)
{
  HDSQLiteBindStringToProperty();
  HDSQLiteBindStringToProperty();
  uint64_t v2 = [*(id *)(a1 + 48) absoluteString];
  HDSQLiteBindStringToProperty();

  id v3 = [*(id *)(a1 + 56) absoluteString];
  HDSQLiteBindStringToProperty();
}

NSString *__cdecl sub_125F8(id a1)
{
  return (NSString *)@"DELETE FROM issuer WHERE iss = ?";
}

uint64_t sub_12604(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = (const char *)[*(id *)(a1 + 32) UTF8String];

  return sqlite3_bind_text(a2, 1, v3, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void sub_135B8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) debugDescription];
  id v3 = HKClinicalContentAnalyticsTriggerReasonToString();
  uint64_t v4 = HKClinicalContentAnalyticsTriggerOptionsToString();
  id v5 = +[NSString stringWithFormat:@"%@ content analytics collection (%@: %@)", v2, v3, v4];

  _HKInitializeLogging();
  uint64_t v6 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%{public}@ triggered", buf, 0xCu);
  }
  id v7 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_13760;
  v11[3] = &unk_111E40;
  id v12 = v5;
  id v13 = v7;
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  id v14 = v9;
  id v10 = v5;
  objc_msgSend(v7, "_queue_triggerClinicalContentAnalyticsWithOptions:completion:", v8, v11);
}

void sub_13760(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  _HKInitializeLogging();
  id v7 = HKLogHealthRecords;
  if (a2)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%{public}@ successful", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_AAF00(a1, (uint64_t)v5, v7);
  }
  objc_msgSend(*(id *)(a1 + 40), "_queue_didTriggerClinicalAnalyticsForReason:success:error:", *(void *)(a1 + 56), a2 != 0, v5);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_13928(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clinicalAnalyticsKeyValueDomain];
  id v10 = 0;
  unsigned __int8 v3 = [v2 setNumber:0 forKey:@"contentAnalyticsAnchor" error:&v10];
  id v4 = v10;
  if (v3)
  {
    _HKInitializeLogging();
    id v5 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = v5;
      uint64_t v8 = [v6 debugDescription];
      *(_DWORD *)buf = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%{public}@ content analytics anchors were reset", buf, 0xCu);
    }
    int v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    int v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

id sub_13D5C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(*(void *)(a1 + 32) + 64) containsObject:v7];
  if (v10)
  {
    [*(id *)(a1 + 32) _submitPayload:v9 forEvent:v8 usingCoordinator:*(void *)(a1 + 40)];
  }
  else
  {
    _HKInitializeLogging();
    id v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      id v12 = v11;
      int v14 = 138543618;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "%{public}@: metric on gateway from %{public}@ may not be submitted, discarding", (uint8_t *)&v14, 0x16u);
    }
  }

  return v10;
}

uint64_t sub_13E94(uint64_t a1, uint64_t a2)
{
  _HKInitializeLogging();
  id v4 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    int v7 = 138543618;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %ld ingestion analytics submitted", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_140E0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_14470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_14498(uint64_t a1, void *a2)
{
  int v4 = *(unsigned __int8 *)(a1 + 64);
  if (!*(unsigned char *)(a1 + 64))
  {
    unint64_t v10 = 0;
    id v8 = 0;
    id v6 = &off_11CEE8;
LABEL_9:
    _HKInitializeLogging();
    id v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      id v12 = *(void **)(a1 + 40);
      id v13 = v11;
      int v14 = [v12 debugDescription];
      id v15 = [*(id *)(a1 + 48) batchCount];
      id v16 = [v6 integerValue];
      *(_DWORD *)buf = 138543874;
      v61 = v14;
      __int16 v62 = 2048;
      id v63 = v15;
      __int16 v64 = 2048;
      id v65 = v16;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%{public}@: content analytics batch %ld starting at anchor %ld", buf, 0x20u);
    }
    v58 = 0;
    id v17 = *(void **)(a1 + 40);
    id v57 = v8;
    uint64_t v18 = objc_msgSend(v17, "_queue_fetchRecordsForContentAnalyticsWithStartAnchor:limitCount:finalAnchor:error:", objc_msgSend(v6, "longLongValue"), v10, &v58, &v57);
    id v19 = v57;

    if (v18)
    {
      if (v4) {
        BOOL v20 = (unint64_t)[v18 count] >= v10;
      }
      else {
        BOOL v20 = 0;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v20;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v25 = v18;
      id v26 = [v25 countByEnumeratingWithState:&v53 objects:v68 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v54;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v54 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v53 + 1) + 8 * i);
            uint64_t v52 = 0;
            v49[1] = _NSConcreteStackBlock;
            v49[2] = (id)3221225472;
            v49[3] = sub_149E8;
            v49[4] = &unk_111F30;
            id v50 = *(id *)(a1 + 48);
            uint64_t v51 = v30;
            HKWithAutoreleasePool();
            id v31 = 0;
          }
          id v27 = [v25 countByEnumeratingWithState:&v53 objects:v68 count:16];
        }
        while (v27);
      }

      if (*(unsigned char *)(a1 + 65))
      {
        uint64_t v32 = *(void **)(a1 + 48);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
        uint64_t v34 = [WeakRetained daemon];
        v35 = [v34 analyticsSubmissionCoordinator];
        [v32 submitMetricsWithCoordinator:v35];
      }
      if (!*(unsigned char *)(a1 + 64)) {
        goto LABEL_30;
      }
      id v36 = v58;
      if (v36 == [v6 integerValue]) {
        goto LABEL_30;
      }
      v44 = *(void **)(a1 + 32);
      v45 = +[NSNumber numberWithLongLong:v58];
      v49[0] = v19;
      unsigned __int8 v46 = [v44 setNumber:v45 forKey:@"contentAnalyticsAnchor" error:v49];
      id v47 = v49[0];

      if (v46)
      {
        id v19 = v47;
LABEL_30:
        _HKInitializeLogging();
        uint64_t v37 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
        {
          uint64_t v38 = *(void **)(a1 + 40);
          uint64_t v39 = v37;
          uint64_t v40 = [v38 debugDescription];
          id v41 = [*(id *)(a1 + 48) batchCount];
          uint64_t v42 = v58;
          id v43 = [*(id *)(a1 + 48) debugDescription];
          *(_DWORD *)buf = 138544130;
          v61 = v40;
          __int16 v62 = 2048;
          id v63 = v41;
          __int16 v64 = 2048;
          id v65 = v42;
          __int16 v66 = 2114;
          v67 = v43;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "%{public}@: content analytics batch %ld finished at anchor %lld. Result: %{public}@", buf, 0x2Au);
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          [*(id *)(a1 + 48) incrementBatchCount];
          if (*(unsigned char *)(a1 + 65)) {
            [*(id *)(a1 + 48) resetMetrics];
          }
        }
        uint64_t v23 = 1;
LABEL_44:

        id v8 = v19;
        goto LABEL_45;
      }
      id v24 = v47;
    }
    else
    {
      id v24 = v19;
    }
    id v19 = v24;
    if (v24)
    {
      if (a2) {
        *a2 = v24;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v23 = 0;
    goto LABEL_44;
  }
  id v5 = *(void **)(a1 + 32);
  id v59 = 0;
  id v6 = [v5 numberForKey:@"contentAnalyticsAnchor" error:&v59];
  id v7 = v59;
  id v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    unint64_t v10 = 200;
    goto LABEL_9;
  }
  _HKInitializeLogging();
  uint64_t v21 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_AAF8C(a1, v21);
    if (a2) {
      goto LABEL_16;
    }
LABEL_47:
    _HKLogDroppedError();
    uint64_t v23 = 0;
    goto LABEL_45;
  }
  if (!a2) {
    goto LABEL_47;
  }
LABEL_16:
  id v8 = v8;
  uint64_t v23 = 0;
  *a2 = v8;
LABEL_45:

  return v23;
}

uint64_t sub_149E8(uint64_t a1)
{
  return 1;
}

void sub_14C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_14C3C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  BOOL v9 = +[HDSQLiteOrderingTerm orderingTermWithProperty:HDSQLEntityPropertyPersistentID entityClass:objc_opt_class() ascending:1];
  uint64_t v22 = v9;
  unint64_t v10 = +[NSArray arrayWithObjects:&v22 count:1];
  id v11 = +[HDMedicalRecordEntity queryWithDatabase:v6 predicate:v7 limit:v8 orderingTerms:v10 groupBy:0];

  uint64_t v21 = HDSampleEntityPropertyDataType;
  id v12 = +[NSArray arrayWithObjects:&v21 count:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_14E3C;
  v18[3] = &unk_111F80;
  v18[4] = *(void *)(a1 + 40);
  id v19 = v5;
  long long v17 = *(_OWORD *)(a1 + 48);
  id v13 = (id)v17;
  long long v20 = v17;
  id v14 = v5;
  id v15 = [v11 enumeratePersistentIDsAndProperties:v12 error:a3 enumerationHandler:v18];

  return v15;
}

BOOL sub_14E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  id v6 = (void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 32) _medicalRecordForObjectID:a2 dataTypeCode:HDSQLiteColumnAsInt64() error:a5];
  uint64_t v8 = v7;
  if (v7)
  {
    BOOL v9 = [v7 sampleType];
    unint64_t v10 = +[HKUnknownRecordType unknownRecordType];
    unsigned int v11 = [v9 isEqual:v10];

    if (v11)
    {
      id v12 = [v8 sourceRevision];
      id v13 = [v12 source];
      id v14 = [v13 _deducedClinicalAccountIdentifier];

      if (v14)
      {
        id v15 = [*(id *)(a1 + 40) databaseForEntityClass:objc_opt_class()];
        id v31 = 0;
        id v16 = +[HDClinicalAccountEntity accountWithIdentifier:v14 database:v15 error:&v31];
        id v17 = v31;

        if (v16)
        {
          uint64_t v18 = [v16 gateway];
          id v19 = [v18 baseURL];
          long long v20 = v19;
          if (v19)
          {
            id v21 = v19;
          }
          else
          {
            id v21 = +[NSURL URLWithString:@"http://localhost/gateway-without-baseURL"];
          }
          uint64_t v23 = v21;
        }
        else
        {
          _HKInitializeLogging();
          id v24 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            id v27 = *v6;
            uint64_t v28 = v24;
            uint64_t v29 = [v27 debugDescription];
            uint64_t v30 = HKSensitiveLogItem();
            *(_DWORD *)buf = 138413058;
            uint64_t v33 = v29;
            __int16 v34 = 2112;
            v35 = v14;
            __int16 v36 = 2112;
            uint64_t v37 = v30;
            __int16 v38 = 2112;
            id v39 = v17;
            _os_log_error_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "%@ failed to retrieve account %@ for record %@: %@", buf, 0x2Au);
          }
          uint64_t v23 = +[NSURL URLWithString:@"http://localhost/error-retrieving-account-for-resource"];
        }
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v22 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_AB024(v6, v22, v8);
        }
        uint64_t v23 = +[NSURL URLWithString:@"http://localhost/unable-to-retrieve-account-for-resource"];
      }
      id v25 = [[HDClinicalContentAnalyticsItem alloc] initWithSourceURL:v23 medicalRecord:v8];
      [*(id *)(a1 + 48) addObject:v25];
    }
  }

  return v8 != 0;
}

uint64_t sub_1557C(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

void sub_15694(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

HKClinicalGateway *__cdecl sub_17230(id a1, HDClinicalGateway *a2)
{
  uint64_t v2 = a2;
  id v3 = [objc_alloc((Class)HKClinicalGateway) initWithDaemonClinicalGateway:v2];

  return (HKClinicalGateway *)v3;
}

HDClinicalGateway *__cdecl sub_172E8(id a1, id a2)
{
  id v2 = a2;
  id v3 = [[HDClinicalGateway alloc] initWithContent:v2];

  return v3;
}

uint64_t sub_184E0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *(id *)(a1 + 32);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!objc_msgSend(*(id *)(a1 + 40), "insertOrReplaceIssuer:database:error:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v10), v5, a3, (void)v13))
        {
          uint64_t v11 = 0;
          goto LABEL_11;
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 1;
LABEL_11:

  return v11;
}

uint64_t sub_188C4(uint64_t a1, void *a2, uint64_t a3)
{
  id v19 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 32);
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = *(void **)(a1 + 40);
        uint64_t v10 = [v8 kid];
        uint64_t v11 = [v8 added];
        id v12 = [v8 removed];
        long long v13 = [v8 source];
        long long v14 = [v8 jwk];
        LODWORD(v9) = [v9 insertOrReplacePublicKeyWithKeyID:v10 added:v11 removed:v12 source:v13 jwk:v14 database:v19 error:a3];

        if (!v9)
        {
          uint64_t v15 = 0;
          goto LABEL_11;
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 1;
LABEL_11:

  return v15;
}

void sub_18C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_18CA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_18CB0(uint64_t a1)
{
}

BOOL sub_18CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) fetchPublicKeysWithDatabase:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

uint64_t sub_18E3C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = +[NSDate now];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!objc_msgSend(*(id *)(a1 + 40), "removePublicKeyWithKeyID:removedDate:database:error:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v11), v6, v5, a3, (void)v14))
        {
          uint64_t v12 = 0;
          goto LABEL_11;
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

void sub_194CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 80);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_195F4;
  v11[3] = &unk_112180;
  void v11[4] = v7;
  uint64_t v18 = *(void *)(a1 + 72);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = v6;
  id v17 = *(id *)(a1 + 64);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

intptr_t sub_195F4(uint64_t a1)
{
  _HKInitializeLogging();
  id v2 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AB4E8(a1, v2);
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 56) highestRowID];
  uint64_t v7 = [*(id *)(a1 + 56) rulesVersion];
  [v3 _didCompleteExtractionWithRequest:v4 result:v5 highestRowID:v6 extractionRulesVersion:v7 profile:*(void *)(a1 + 64) error:*(void *)(a1 + 72)];

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 80));
}

id sub_1A2F8(id a1, HDExtractionResultItem *a2)
{
  return [(HDExtractionResultItem *)a2 originalFHIRResource];
}

id sub_1A300(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 originalFHIRResource];
  uint64_t v5 = [v3 providedResource];

  id v6 = [v4 isEqual:v5];
  return v6;
}

id sub_1A370(id a1, HDFHIRResourceObjectPair *a2)
{
  id v2 = [(HDFHIRResourceObjectPair *)a2 providedResource];
  id v3 = HKSensitiveLogItem();

  return v3;
}

uint64_t sub_1A98C()
{
  return v0;
}

void sub_1A998(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_1ABAC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchOrRefreshCredentialWithClientCompletion:", *(void *)(a1 + 40));
}

uint64_t sub_1AD2C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1AE6C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) result];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_1B070(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 88);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1B12C;
  block[3] = &unk_1122A0;
  block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

id sub_1B12C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleDelegateRefreshCompletionForInitialResult:refreshResult:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t sub_1B57C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1B58C(uint64_t a1)
{
}

void sub_1B594(uint64_t a1)
{
}

void sub_1B640(uint64_t a1)
{
}

void sub_1B6F8(uint64_t a1)
{
}

int64_t sub_1BFD0(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  return 0;
}

id HDHealthRecordsPluginBundle()
{
  if (qword_138A50 != -1) {
    dispatch_once(&qword_138A50, &stru_112398);
  }
  uint64_t v0 = (void *)qword_138A48;

  return v0;
}

void sub_1C02C(id a1)
{
  qword_138A48 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id sub_1C5A4(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  [v7 addObject:@"PRAGMA encoding=\"UTF-8\";"];
  id v8 = +[HDSignedClinicalDataRegistryMetadataEntity createTableSQL];
  [v7 addObject:v8];

  id v9 = +[HDSignedClinicalDataRegistryIssuerEntity createTableSQL];
  [v7 addObject:v9];

  id v10 = [v6 executeStatements:v7 database:v5 error:a3];
  return v10;
}

id sub_1C678(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = +[HDSignedClinicalDataRegistryPublicKeyEntity createTableSQL];
  uint64_t v11 = v7;
  id v8 = +[NSArray arrayWithObjects:&v11 count:1];
  id v9 = [v6 executeStatements:v8 database:v5 error:a3];

  return v9;
}

id sub_1C754(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setUserVersion:*(void *)(a1 + 32) withDatabaseName:0 error:a3];
}

id sub_1C8F8(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 executeSQLStatements:*(void *)(a1 + 32) error:a3];
}

void sub_1C920(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1D37C(_Unwind_Exception *a1)
{
}

void sub_1D3BC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 40);
    id v8 = 0;
    uint64_t v4 = [v3 connectionInformationWithCredential:a2 error:&v8];
    id v5 = v8;
    if (v4)
    {
      id v6 = *(id *)(a1 + 48);
      id v7 = v4;
      HKWithUnfairLock();
    }
    else
    {
      [*(id *)(a1 + 32) cancelWithError:v5];
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelWithError:");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_1D4CC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) identifier];
  [v1 setObject:v2 forKeyedSubscript:v3];
}

void sub_1D6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1D6D8(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1D704(uint64_t a1)
{
}

void sub_1D70C(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;
}

void sub_1D864(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_ABCF4(a1, v4);
  }
  uint64_t v5 = [v3 refreshError];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v5)
  {
    id v7 = [v3 refreshError];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
  else
  {
    id v7 = [v3 credential];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
}

void sub_1DB7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DB94(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DBA4(uint64_t a1)
{
}

BOOL sub_1DBAC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 64) predicateForObjectsFromLocalSourceWithBundleIdentifier:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) error:a3];
  if (v6)
  {
    id v7 = HDMedicalRecordEntityPredicateForFHIRIdentifier();
    id v8 = +[HDSQLitePredicate compoundPredicateWithPredicate:v6 otherPredicate:v7];
    id v9 = *(void **)(a1 + 64);
    uint64_t v10 = [v5 databaseForEntityClass:v9];
    uint64_t v11 = [v9 _medicalRecordsWithPredicate:v8 withoutConceptIndex:0 excludeSignedClinicalDataRecords:0 database:v10 profile:*(void *)(a1 + 40) error:a3];

    BOOL v12 = v11 != 0;
    if (v11)
    {
      uint64_t v13 = [v11 firstObject];
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void sub_1DF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DFA4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 64)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "items", 0);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(a1 + 64) processMedicalRecordsInExtractionResultItem:*(void *)(*((void *)&v15 + 1) + 8 * (void)v10) accountIdentifier:*(void *)(a1 + 40) database:v5 profile:*(void *)(a1 + 48) error:a3];
        if (!v11)
        {
          uint64_t v13 = 0;
          goto LABEL_11;
        }
        BOOL v12 = v11;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v11 integerValue];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1;
LABEL_11:

  return v13;
}

id sub_1E10C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDMedicalRecordsInExtractionResultJournalEntry alloc] initWithExtractionResult:*(void *)(a1 + 32) accountIdentifier:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 48) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

void sub_1E65C(id a1, HKMedicalRecord *a2, id a3)
{
  id v5 = a3;
  uint64_t v6 = a2;
  id v7 = [(HKMedicalRecord *)v6 FHIRIdentifier];
  (*((void (**)(id, id, HKMedicalRecord *))a3 + 2))(v5, v7, v6);
}

uint64_t sub_1EE60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = +[NSNumber numberWithLongLong:a2];
  id v8 = +[HDMedicalRecordEntity entityWithPersistentID:v7];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v15 = 0;
    uint64_t v10 = (*(uint64_t (**)(void))(v9 + 16))();
    id v11 = v15;
    BOOL v12 = v11;
    if ((v10 & 1) == 0)
    {
      id v13 = v11;
      if (v13)
      {
        if (a5) {
          *a5 = v13;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t sub_1F074()
{
  return HDSQLiteBindNumberToProperty();
}

void sub_1F11C(id a1)
{
  v3[0] = &off_11CF48;
  v4[0] = objc_opt_class();
  v3[1] = &off_11CF60;
  v4[1] = objc_opt_class();
  v3[2] = &off_11CF78;
  v4[2] = objc_opt_class();
  v3[3] = &off_11CF90;
  v4[3] = objc_opt_class();
  v3[4] = &off_11CFA8;
  v4[4] = objc_opt_class();
  v3[5] = &off_11CFC0;
  v4[5] = objc_opt_class();
  v3[6] = &off_11CFD8;
  v4[6] = objc_opt_class();
  v3[7] = &off_11CFF0;
  v4[7] = objc_opt_class();
  v3[8] = &off_11D008;
  v4[8] = objc_opt_class();
  v3[9] = &off_11D020;
  v4[9] = objc_opt_class();
  v3[10] = &off_11D038;
  v4[10] = objc_opt_class();
  v3[11] = &off_11D050;
  v4[11] = objc_opt_class();
  v3[12] = &off_11D068;
  v4[12] = objc_opt_class();
  v3[13] = &off_11D080;
  v4[13] = objc_opt_class();
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:14];
  id v2 = (void *)qword_137178;
  qword_137178 = v1;
}

uint64_t sub_1F788(uint64_t a1)
{
  if (HDSQLiteColumnWithNameAsInteger() != 2)
  {
    uint64_t v2 = HDSQLiteColumnWithNameAsNumber();
    id v3 = (void *)v2;
    if (v2) {
      uint64_t v4 = (_UNKNOWN **)v2;
    }
    else {
      uint64_t v4 = &off_11CF30;
    }
    id v5 = v4;

    if (!*(unsigned char *)(a1 + 40) || [v5 integerValue] != &stru_B8.reserved1)
    {
      uint64_t v6 = HDSQLiteColumnWithNameAsNumber();
      id v7 = (void *)v6;
      if (v6) {
        id v8 = (_UNKNOWN **)v6;
      }
      else {
        id v8 = &off_11CF30;
      }
      uint64_t v9 = v8;

      uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      id v11 = v10;
      if (v10)
      {
        [v10 addObject:v9];
      }
      else
      {
        id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v9, 0);
        [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v5];
      }
    }
  }
  return 1;
}

uint64_t sub_1F8C8(uint64_t a1, uint64_t a2)
{
  return 1;
}

id sub_2016C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v6 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:*(void *)(a1 + 32) database:v5 error:a3];
  id v7 = v6;
  if (v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_203C8;
    v12[3] = &unk_111DB8;
    id v13 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_2040C;
    v10[3] = &unk_1125B0;
    id v11 = *(id *)(a1 + 40);
    id v8 = [v5 executeCachedStatementForKey:&unk_F2858 error:a3 SQLGenerator:&stru_112588 bindingHandler:v12 enumerationHandler:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

NSString *__cdecl sub_202C0(id a1)
{
  uint64_t v1 = HDOriginalFHIRResourceEntityPropertyType;
  uint64_t v2 = HDOriginalFHIRResourceEntityPropertyResourceID;
  uint64_t v3 = HDOriginalFHIRResourceEntityPropertySourceURL;
  uint64_t v4 = HDOriginalFHIRResourceLastSeenEntityLastSeenDate;
  id v5 = +[HDOriginalFHIRResourceEntity disambiguatedDatabaseTable];
  uint64_t v6 = +[HDOriginalFHIRResourceLastSeenEntity disambiguatedDatabaseTable];
  id v7 = +[NSString stringWithFormat:@"SELECT res.%@, res.%@, res.%@, last.%@                     FROM %@ AS res                     LEFT JOIN %@ AS last ON res.%@ = last.%@                     WHERE res.%@ LIKE ?", v1, v2, v3, v4, v5, v6, HDSQLEntityPropertyPersistentID, HDOriginalFHIRResourceLastSeenEntityResourceID, HDOriginalFHIRResourceEntityPropertyAccountID, 0];

  return (NSString *)v7;
}

uint64_t sub_203C8(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, (sqlite3_int64)v3);
}

uint64_t sub_2040C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = HDSQLiteColumnAsString();
  uint64_t v6 = HDSQLiteColumnAsString();
  id v7 = HDSQLiteColumnAsURL();
  id v8 = HDSQLiteColumnAsDate();
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = !v9;
  if (v9)
  {
    +[NSError hk_assignError:a3 code:3 description:@"Resource without resource type or resource id present"];
  }
  else
  {
    id v11 = [objc_alloc((Class)HKFHIRIdentifier) initWithResourceType:v5 identifier:v6];
    id v12 = [objc_alloc((Class)HDFHIRResourceLastSeenObject) initWithResourceIdentifier:v11 sourceURL:v7 lastSeenDate:v8];
    [*(id *)(a1 + 32) addObject:v12];
  }
  return v10;
}

id sub_206C0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v5 protectedDatabase];
  id v8 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:v6 database:v7 error:a3];

  if (v8)
  {
    BOOL v9 = [v5 protectedDatabase];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_20924;
    v14[3] = &unk_112620;
    id v15 = v8;
    id v16 = *(id *)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_2097C;
    v12[3] = &unk_1125B0;
    id v13 = *(id *)(a1 + 48);
    id v10 = [v9 executeCachedStatementForKey:&unk_F2859 error:a3 SQLGenerator:&stru_1125F8 bindingHandler:v14 enumerationHandler:v12];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

NSString *__cdecl sub_20850(id a1)
{
  uint64_t v1 = HDSQLEntityPropertyPersistentID;
  uint64_t v2 = +[HDOriginalFHIRResourceEntity disambiguatedDatabaseTable];
  id v3 = +[HDOriginalFHIRResourceLastSeenEntity disambiguatedDatabaseTable];
  uint64_t v4 = +[NSString stringWithFormat:@"SELECT res.%@                     FROM %@ AS res                     LEFT JOIN %@ AS last ON res.%@ = last.%@                     WHERE res.%@ LIKE ? AND (last.%@ < ? OR last.%@ IS NULL)", v1, v2, v3, v1, HDOriginalFHIRResourceLastSeenEntityResourceID, HDOriginalFHIRResourceEntityPropertyAccountID, HDOriginalFHIRResourceLastSeenEntityLastSeenDate, HDOriginalFHIRResourceLastSeenEntityLastSeenDate, 0];

  return (NSString *)v4;
}

uint64_t sub_20924(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, (sqlite3_int64)[*(id *)(a1 + 32) persistentID]);

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t sub_2097C(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsNumber();
  id v3 = +[HDOriginalFHIRResourceEntity entityWithPersistentID:v2];
  [*(id *)(a1 + 32) addObject:v3];

  return 1;
}

void sub_20EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 184), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20EE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_20EF4(uint64_t a1)
{
}

id sub_20EFC(uint64_t a1)
{
  uint64_t v1 = HDSQLEntityPropertyPersistentID;
  uint64_t v2 = HDOriginalFHIRResourceLastSeenEntityLastSeenDate;
  id v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v4 = +[NSString stringWithFormat:@"SELECT %@, %@ FROM %@ WHERE %@ = ?", v1, v2, v3, HDOriginalFHIRResourceLastSeenEntityResourceID, 0];

  return v4;
}

uint64_t sub_20FA0()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t sub_20FB0(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsNumber();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = HDSQLiteColumnAsDate();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return 1;
}

uint64_t sub_21020()
{
  HDSQLiteBindNumberToProperty();

  return HDSQLiteBindDateToProperty();
}

uint64_t sub_21080()
{
  return HDSQLiteBindDateToProperty();
}

void sub_212D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_212F0(uint64_t a1)
{
  uint64_t v1 = HDOriginalFHIRResourceLastSeenEntityLastSeenDate;
  uint64_t v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v3 = +[NSString stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ?", v1, v2, HDOriginalFHIRResourceLastSeenEntityResourceID];

  return v3;
}

uint64_t sub_21384()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t sub_21394(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsDate();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

void sub_21818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21830(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21840(uint64_t a1)
{
}

BOOL sub_21848(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(id **)(a1 + 32);
  uint64_t v4 = [v3[1] allAccountsWithError:a2];
  uint64_t v5 = [v3 _clientAccountsFromAccounts:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

void sub_21A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_21A4C(void *a1, uint64_t a2)
{
  uint64_t v3 = (id *)a1[4];
  uint64_t v4 = [v3[1] accountsForGatewaysWithExternalIDs:a1[5] errorOut:a2];
  uint64_t v5 = [v3 _clientAccountsFromAccounts:v4];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

void sub_21C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_21C64(void *a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1[4] + 8) accountForSource:a1[5] error:a2];
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

void sub_21E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_21E90(void *a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1[4] + 8) accountWithIdentifier:a1[5] error:a2];
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

void sub_22B5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_AC12C(a1, (uint64_t)v3, v4);
  }
}

HKClinicalAccount *__cdecl sub_22BD4(id a1, HDClinicalAccount *a2)
{
  return [(HDClinicalAccount *)a2 hkAccount];
}

NSDictionary *__cdecl sub_2317C(id a1, HDOriginalFHIRResourceObject *a2)
{
  return (NSDictionary *)[(HDOriginalFHIRResourceObject *)a2 JSONObject];
}

uint64_t sub_234B8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a1[4] _privateSourceBundleIdentifiersByPublicWithError:a3];
  if (v6)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = a1[5];
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v8)
    {
      id v9 = v8;
      long long v20 = a3;
      id v21 = v5;
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v14 = a1[4];
          id v22 = 0;
          id v15 = [v14 _medicalRecordForClinicalRecordWithUUID:v12 privateSourceBundleIdentifiersByPublic:v6 error:&v22];
          id v16 = v22;
          if (v15)
          {
            [a1[6] addObject:v15];
          }
          else
          {
            _HKInitializeLogging();
            long long v17 = HKLogDatabase;
            if (v16)
            {
              if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_ERROR)) {
                sub_AC1DC(v12, (uint64_t)v16, v17);
              }
              if (v20) {
                *long long v20 = v16;
              }
              else {
                _HKLogDroppedError();
              }
              id v5 = v21;

              uint64_t v18 = 0;
              goto LABEL_23;
            }
            if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v28 = v12;
              _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Failed to find  medical record for clinical record with UUID %{public}@", buf, 0xCu);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      uint64_t v18 = 1;
      id v5 = v21;
    }
    else
    {
      uint64_t v18 = 1;
    }
LABEL_23:
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

void sub_23A38(id a1, HDClinicalAccount *a2, id a3)
{
  uint64_t v4 = (void (**)(id, void *, void *))a3;
  id v5 = a2;
  uint64_t v6 = [(HDClinicalAccount *)v5 gateway];
  id v7 = [v6 externalID];
  id v12 = +[HKSource _publicSourceForClinicalExternalIdentifier:v7 name:&stru_1152E8];

  id v8 = [(HDClinicalAccount *)v5 identifier];

  id v9 = +[HKSource _privateSourceForClinicalAccountIdentifier:v8 name:&stru_1152E8];

  uint64_t v10 = [v12 bundleIdentifier];
  id v11 = [v9 bundleIdentifier];
  v4[2](v4, v10, v11);
}

id sub_2458C(uint64_t a1)
{
  return [*(id *)(a1 + 48) sendEvent:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
}

id sub_250A4(id a1, HDClinicalIngestionGatewayFeatureOperation *a2)
{
  return [(HDClinicalIngestionOperation *)a2 operationError];
}

void sub_255BC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

id sub_255DC(uint64_t a1, void *a2)
{
  return a2;
}

id sub_255F4()
{
  return [v0 count];
}

uint64_t sub_25618()
{
  return v0;
}

void sub_25AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25AE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25AF8(uint64_t a1)
{
}

uint64_t sub_25B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)objc_opt_class() _issuerWithRow:a3];

  return _objc_release_x1();
}

void sub_25CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_25CD0(void *a1, void *a2, void *a3)
{
  id v5 = [a2 databaseForEntityClass:a1[6]];
  uint64_t v6 = (void *)a1[6];
  uint64_t v7 = a1[4];
  id v14 = 0;
  uint64_t v8 = [v6 issuerWithIdentifier:v7 database:v5 error:&v14];
  id v9 = v14;
  uint64_t v10 = *(void *)(a1[5] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  uint64_t v12 = *(void *)(*(void *)(a1[5] + 8) + 40);
  if (!v12)
  {
    if (v9)
    {
      if (a3) {
        *a3 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }
    else
    {
      +[NSError hk_assignError:a3, 118, @"Issuer \"%@\" not found", a1[4] code format];
    }
  }

  return v12 != 0;
}

uint64_t sub_26340(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v29;
    *(void *)&long long v6 = 138543874;
    long long v25 = v6;
    id v26 = v4;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v9);
        id v11 = *(void **)(a1 + 48);
        uint64_t v12 = *(void *)(a1 + 56);
        uint64_t v13 = *(void *)(a1 + 40);
        id v27 = 0;
        id v14 = objc_msgSend(v11, "insertCodableIssuer:syncProvenance:profile:transaction:error:", v10, v12, v13, v3, &v27, v25, v26);
        id v15 = v27;

        if (!v14)
        {
          unsigned int v16 = objc_msgSend(v15, "hd_isConstraintViolation");
          _HKInitializeLogging();
          long long v17 = (void *)HKLogHealthRecords;
          if (v16)
          {
            if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_12;
            }
            uint64_t v18 = *(void *)(a1 + 48);
            id v19 = v17;
            long long v20 = [v10 identifier];
            id v21 = HKSensitiveLogItem();
            *(_DWORD *)buf = v25;
            uint64_t v33 = v18;
            id v4 = v26;
            __int16 v34 = 2114;
            v35 = v21;
            __int16 v36 = 2114;
            id v37 = v15;
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ unable to insert codable signed clinical data issuer %{public}@ because of a constraint violation, likely because the issuer already exists. Ignoring error: %{public}@", buf, 0x20u);
            goto LABEL_10;
          }
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            uint64_t v22 = *(void *)(a1 + 48);
            id v19 = v17;
            long long v20 = [v10 identifier];
            id v21 = HKSensitiveLogItem();
            *(_DWORD *)buf = v25;
            uint64_t v33 = v22;
            id v4 = v26;
            __int16 v34 = 2114;
            v35 = v21;
            __int16 v36 = 2114;
            id v37 = v15;
            _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "%{public}@ failed to insert codable signed clinical data issuer %{public}@, ignoring. Error: %{public}@", buf, 0x20u);
LABEL_10:
          }
        }
LABEL_12:

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v23 = [v4 countByEnumeratingWithState:&v28 objects:v38 count:16];
      id v7 = v23;
    }
    while (v23);
  }

  return 1;
}

id sub_265CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDSignedClinicalDataIssuerInsertCodableJournalEntry alloc] initWithIssuers:*(void *)(a1 + 32) syncProvenance:*(void *)(a1 + 48)];
  long long v6 = [*(id *)(a1 + 40) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

void sub_26CA0(uint64_t a1)
{
  HDSQLiteBindInt64ToProperty();
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  HDSQLiteBindStringToProperty();

  id v3 = [*(id *)(a1 + 32) title];
  HDSQLiteBindStringToProperty();

  id v4 = [*(id *)(a1 + 32) subtitle];
  HDSQLiteBindStringToProperty();

  id v5 = [*(id *)(a1 + 32) wellKnownURL];
  HDSQLiteBindStringToProperty();

  id v6 = [*(id *)(a1 + 40) entity];
  [v6 persistentID];
  HDSQLiteBindInt64ToProperty();
}

id sub_27010(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  id v6 = *(void **)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_27100;
  v12[3] = &unk_112950;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v15 = v7;
  uint64_t v16 = v8;
  id v9 = v5;
  id v10 = [v6 enumerateEntitiesInDatabase:v9 predicate:0 error:a3 enumerationHandler:v12];

  return v10;
}

uint64_t sub_27100(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v10 = 0;
  unsigned __int8 v6 = [a2 updateTitleUsingRegistry:v3 database:v4 profile:v5 error:&v10];
  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v8 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AC61C((uint64_t)a1, v8);
    }
  }

  return 1;
}

id sub_27198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = objc_alloc_init(HDSignedClinicalDataIssuerTitleUpdateJournalEntry);
  unsigned __int8 v6 = [*(id *)(a1 + 32) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

uint64_t sub_274B8()
{
  return HDSQLiteBindStringToProperty();
}

id sub_28160(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldRefreshTokenForCredentialedTaskError:a2];
}

void sub_29278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2929C(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      _HKInitializeLogging();
      unsigned __int8 v6 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
        sub_AC808(a1, v6, v7, v8, v9, v10, v11, v12);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained _dispatchBlock];

      if (!xpc_activity_set_state(v3, 5))
      {
        _HKInitializeLogging();
        id v14 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
          sub_AC78C(a1, v14);
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v15 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AC878(a1, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

void sub_2959C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_29878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_2989C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unsigned __int8 v6 = +[HDFHIRCredentialEntity allProperties];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) database];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_299EC;
  v17[3] = &unk_1129F0;
  id v18 = v5;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 80);
  id v19 = v10;
  uint64_t v21 = v11;
  id v20 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  id v14 = v5;
  id v15 = +[HDFHIRCredentialEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDFHIRCredentialEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v13, v12, 0, v7, v9, a3, v17);

  return v15;
}

BOOL sub_299EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, void *a8)
{
  uint64_t v12 = *(void **)(a1 + 32);
  id v13 = a2;
  id v14 = [v12 databaseForEntityClass:objc_opt_class()];
  id v15 = [v13 persistentID];

  uint64_t v16 = +[NSNumber numberWithLongLong:v15];
  uint64_t v17 = +[HDClinicalAccountEntity accountEntityWithCredentialID:v16 database:v14 error:a8];

  if (*a8)
  {
    BOOL v18 = 0;
    *a7 = 1;
  }
  else if (v17)
  {
    id v19 = [v17 UUIDForProperty:HDClinicalAccountEntityPropertySyncIdentifier database:v14];
    id v20 = +[HDFHIRCredentialEntity codableWithRow:a4 accountSyncIdentifier:v19];
    uint64_t v21 = HDSQLiteColumnWithNameAsInt64();
    uint64_t v22 = [*(id *)(a1 + 40) syncIdentityManager];
    id v23 = [v22 identityForEntityID:v21 transaction:*(void *)(a1 + 32) error:a8];

    if (v23)
    {
      long long v24 = [v23 identity];
      long long v25 = [v24 codableSyncIdentity];
      [v20 setSyncIdentity:v25];

      id v26 = [*(id *)(a1 + 40) healthRecordsExtension];
      id v27 = [v26 accountManager];

      BOOL v18 = v27 != 0;
      if (v27)
      {
        long long v28 = [v27 credentialFromCodableCredential:v20];
        id v51 = 0;
        unsigned __int8 v29 = +[HDFHIRCredential validateSyncableCodableCredential:v20 error:&v51];
        id v48 = v51;
        if (v29)
        {
          id v50 = 0;
          long long v30 = v28;
          unsigned __int8 v31 = [v28 hasRefreshTokenWithError:&v50];
          id v32 = v50;
          if (v31)
          {
            id v49 = v32;
            v45 = v32;
            os_log_t log = v30;
            unsigned __int8 v33 = [v30 makeRefreshTokenSynchronizableIfNeededWithError:&v49];
            id v34 = v49;

            if ((v33 & 1) == 0)
            {
              _HKInitializeLogging();
              v35 = HKLogHealthRecords;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
              {
                uint64_t v43 = *(void *)(a1 + 56);
                uint64_t v44 = *(void *)(a1 + 40);
                *(_DWORD *)buf = 138543874;
                uint64_t v53 = v43;
                __int16 v54 = 2114;
                uint64_t v55 = v44;
                __int16 v56 = 2114;
                id v57 = v34;
                _os_log_error_impl(&dword_0, v35, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to ensure that refresh token for the credential is synchronizable. Error: %{public}@", buf, 0x20u);
              }
            }
            [*(id *)(a1 + 48) addObject:v20];

            long long v28 = log;
          }
          else
          {
            id v39 = v32;
            _HKInitializeLogging();
            loga = HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v40 = *(void *)(a1 + 56);
              uint64_t v41 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138543874;
              uint64_t v53 = v40;
              __int16 v54 = 2114;
              uint64_t v55 = v41;
              __int16 v56 = 2114;
              id v57 = v39;
              _os_log_impl(&dword_0, loga, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ retrieved codable with no refresh token in the keychain, skipping. Error: %{public}@", buf, 0x20u);
            }

            long long v28 = v30;
          }
        }
        else
        {
          _HKInitializeLogging();
          __int16 v36 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            uint64_t v37 = *(void *)(a1 + 56);
            uint64_t v38 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543874;
            uint64_t v53 = v37;
            __int16 v54 = 2114;
            uint64_t v55 = v38;
            __int16 v56 = 2114;
            id v57 = v48;
            _os_log_error_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ retrieved codable which is invalid for sync, skipping. Error: %{public}@", buf, 0x20u);
          }
        }
      }
      else
      {
        +[NSError hk_assignError:a8 code:127 format:@"Credential sync is not supported for profiles without a clinical account manager."];
        *a7 = 1;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

BOOL sub_2A0B8(id a1, HDSyncCodable *a2)
{
  uint64_t v2 = a2;
  objc_opt_class();
  uint64_t v3 = HKSafeObject();

  id v4 = 0;
  if (!v3)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AC8E8((uint64_t)v4, v5);
    }
  }

  return v3 != 0;
}

void sub_2ADD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2AE14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2AE24(uint64_t a1)
{
}

void sub_2AE2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_2B33C(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_ACBB4(a1, (uint64_t)v3, v4);
  }
}

uint64_t sub_2B584(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t sub_2B778(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2BBD0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  uint64_t v7 = [v6 databaseForEntityClass:v5];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v10 = [v6 databaseForEntityClass:v8];

  LODWORD(v6) = [v8 insertEvent:v9 database:v10 error:a3];
  uint64_t v11 = v6 & [*(id *)(a1 + 40) _pruneEventsIfNeededInDatabase:v7 error:a3];

  return v11;
}

id sub_2BC7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) database];
  id v7 = [v5 journalEvent:v4 database:v6 error:a3];

  return v7;
}

void sub_2BDD0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountIdentifier];
  HDSQLiteBindUUIDToProperty();

  [*(id *)(a1 + 32) type];
  HDSQLiteBindInt64ToProperty();
  id v3 = [*(id *)(a1 + 32) caller];
  HDSQLiteBindStringToProperty();

  uint64_t v4 = [*(id *)(a1 + 32) timestamp];
  HDSQLiteBindDateToProperty();

  uint64_t v5 = [*(id *)(a1 + 32) eventDescription];
  HDSQLiteBindStringToProperty();

  +[HDClinicalAccountEventEntity _wrapHKOptionalClinicalAccountCredentialStateInNSNumber:](HDClinicalAccountEventEntity, "_wrapHKOptionalClinicalAccountCredentialStateInNSNumber:", [*(id *)(a1 + 32) credentialStateBefore]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindNumberToProperty();
  id v6 = +[HDClinicalAccountEventEntity _wrapHKOptionalClinicalAccountCredentialStateInNSNumber:](HDClinicalAccountEventEntity, "_wrapHKOptionalClinicalAccountCredentialStateInNSNumber:", [*(id *)(a1 + 32) credentialStateAfter]);
  HDSQLiteBindNumberToProperty();
}

void sub_2C16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2C184(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2C194(uint64_t a1)
{
}

void sub_2C19C(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  id v3 = HDSQLiteColumnWithNameAsNumber();
  id v4 = [v2 _unwrapHKClinicalAccountCredentialStateFromNSNumber:v3];

  uint64_t v5 = objc_opt_class();
  id v6 = HDSQLiteColumnWithNameAsNumber();
  id v7 = [v5 _unwrapHKClinicalAccountCredentialStateFromNSNumber:v6];

  id v8 = objc_alloc((Class)HKClinicalAccountEvent);
  HDSQLiteColumnWithNameAsUUID();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = HDSQLiteColumnWithNameAsInteger();
  id v10 = HDSQLiteColumnWithNameAsString();
  uint64_t v11 = HDSQLiteColumnWithNameAsDate();
  id v12 = HDSQLiteColumnWithNameAsString();
  id v13 = [v8 initWithAccountIdentifier:v16 type:v9 caller:v10 timestamp:v11 eventDescription:v12 credentialStateBefore:v4 credentialStateAfter:v7];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

void sub_2C4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_2C4BC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)a1[6];
  uint64_t v6 = a1[4];
  id v7 = [a2 databaseForEntityClass:v5];
  uint64_t v8 = [v5 _fetchEventsForAccountWithIdentifier:v6 database:v7 error:a3];
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
}

void sub_2C7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL sub_2C7C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 72), @"HDClinicalAccountEventEntity+HealthRecordsPlugin.m", 161, @"Invalid parameter not satisfying: %@", @"[entity isKindOfClass:[HDClinicalAccountEventEntity class]]" object file lineNumber description];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = 0;
  uint64_t v5 = [v3 _eventInDatabase:v4 error:&v10];
  id v6 = v10;
  id v7 = v10;
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }

  return v5 != 0;
}

uint64_t sub_2CCF0(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsUUID();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return 1;
}

uint64_t sub_2CD3C()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t sub_2D998(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_2E0AC(uint64_t a1)
{
  uint64_t v1 = [&off_11D780 objectForKeyedSubscript:a1];
  uint64_t v2 = (void *)v1;
  id v3 = &off_11D140;
  if (v1) {
    id v3 = (_UNKNOWN **)v1;
  }
  uint64_t v4 = v3;

  id v5 = [v4 integerValue];
  return v5;
}

void sub_2F384(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 endStates];
  id v5 = [v4 objects];
  id v6 = [v5 firstObject];
  id v7 = [v6 requestedURL];
  id v8 = [v7 copy];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 96);
  *(void *)(v9 + 96) = v8;

  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [v3 endStates];
  [v11 _accumulateMetricsFromTaskStates:v12];

  id v13 = [v3 resourceBundleData];

  uint64_t v14 = *(void **)(a1 + 32);
  if (v13)
  {
    id v15 = [v3 resourceBundleData];

    [v14 _handleTaskCompletedWithData:v15];
  }
  else
  {
    id v15 = [v3 error];

    [v14 _handleTaskError:v15];
  }
}

void sub_2F4B4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 refreshResult];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 refreshResult];
    [v4 _handleTokenRefreshResult:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_30348(uint64_t a1, void *a2, void *a3, void *a4)
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

uint64_t sub_30630(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDDataEntityPropertyCreationDate greaterThanValue:*(void *)(*(void *)(a1 + 32) + 72)];
  id v7 = [*(id *)(a1 + 32) profile];
  id v8 = [v7 daemon];
  id v9 = [v8 behavior];
  if ([v9 futureMigrationsEnabled]) {
    uint64_t v10 = 8;
  }
  else {
    uint64_t v10 = 0;
  }

  id v11 = +[HKSampleType medicalRecordTypesWithOptions:v10];
  id v12 = HDSampleEntityPredicateForDataTypes();
  v34[0] = v12;
  v34[1] = v6;
  id v13 = +[NSArray arrayWithObjects:v34 count:2];
  uint64_t v14 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  uint64_t v15 = HDSQLEntityPropertyStar;
  uint64_t v16 = [v5 databaseForEntityClass:objc_opt_class()];
  uint64_t v17 = +[HDMedicalRecordEntity countValueForProperty:v15 predicate:v14 database:v16 error:a3];

  if (!v17) {
    goto LABEL_12;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = [v17 unsignedIntegerValue] != 0;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 64))
  {
    _HKInitializeLogging();
    uint64_t v18 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = v18;
      id v21 = [v17 unsignedIntegerValue];
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 72);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v19;
      __int16 v30 = 2048;
      id v31 = v21;
      __int16 v32 = 2114;
      uint64_t v33 = v22;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected new records, there are %lu records that are newer than %{public}@", buf, 0x20u);
    }
    id v23 = [*(id *)(a1 + 32) task];
    [v23 markDidProduceNewRecords];

    uint64_t v28 = 0;
    *(void *)buf = 0;
    if ([*(id *)(a1 + 32) _countOfNewLabsFromStartTimePredicate:v6 transaction:v5 count:buf error:a3]&& objc_msgSend(*(id *)(a1 + 32), "_countOfPinnedLabsFromStartTimePredicate:transaction:count:error:", v6, v5, &v28, a3))
    {
      long long v24 = [*(id *)(a1 + 32) task];
      id v25 = [v17 unsignedIntegerValue];
      [v24 recordCountOfAllRecords:v25 allLabs:*(void *)buf pinnedLabs:v28];

      goto LABEL_11;
    }
LABEL_12:
    uint64_t v26 = 0;
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v26 = 1;
LABEL_13:

  return v26;
}

void sub_30F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_30F88(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_30F98(uint64_t a1)
{
}

uint64_t sub_30FA0(uint64_t a1, void *a2)
{
  return 0;
}

NSUUID *__cdecl sub_30FC8(id a1, HKMedicalRecord *a2)
{
  return (NSUUID *)[(HKMedicalRecord *)a2 UUID];
}

NSUUID *__cdecl sub_30FD0(id a1, HKUserDomainConceptLink *a2)
{
  return (NSUUID *)[(HKUserDomainConceptLink *)a2 targetUUID];
}

id sub_31B10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_triggerClinicalOptInDataUploadWithCompletion:", *(void *)(a1 + 40));
}

void sub_31D8C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_31E1C;
  v2[3] = &unk_112CE0;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_queue_triggerClinicalOptInDataUploadWithCompletion:", v2);
}

void sub_31E1C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a2)
  {
    _HKInitializeLogging();
    uint64_t v10 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      id v12 = *(void **)(a1 + 32);
      id v13 = v10;
      uint64_t v14 = [v12 debugDescription];
      int v22 = 138543362;
      id v23 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%{public}@: opt-in data upload triggered successfully", (uint8_t *)&v22, 0xCu);
    }
    v11.n128_u64[0] = 0;
    (*(void (**)(__n128))(*(void *)(a1 + 40) + 16))(v11);
  }
  else
  {
    id v15 = [v8 code];
    _HKInitializeLogging();
    uint64_t v16 = (void *)HKLogHealthRecords;
    if (v15)
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AD000(a1, v16);
      }
      uint64_t v18 = *(void (**)(__n128))(*(void *)(a1 + 40) + 16);
      v17.n128_u64[0] = 0;
    }
    else
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = *(void **)(a1 + 32);
        id v20 = v16;
        id v21 = [v19 debugDescription];
        int v22 = 138543362;
        id v23 = v21;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "%{public}@: opt-in data upload triggered before registration finishes", (uint8_t *)&v22, 0xCu);
      }
      v17.n128_f64[0] = (double)XPC_ACTIVITY_INTERVAL_1_MIN;
      uint64_t v18 = *(void (**)(__n128))(*(void *)(a1 + 40) + 16);
    }
    v18(v17);
  }
}

void sub_32474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3249C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_324AC(uint64_t a1)
{
}

void sub_324B4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_326DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AD208(a1, v4);
  }
  id v5 = [v3 refreshError];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v3 refreshError];
    [v6 cancelWithError:v7];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [v3 credential];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

uint64_t sub_32DC8()
{
  return v0;
}

void sub_32DD4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_330D0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addType:a2];
}

id sub_33400(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addType:a2];
}

void sub_33CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_33CE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_33CF4(uint64_t a1)
{
}

BOOL sub_33CFC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];

  id v15 = 0;
  unsigned __int8 v7 = +[HDClinicalAuthorizationSessionEntity pruneAuthorizationSessionsInDatabase:v6 error:&v15];
  id v8 = v15;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    id v9 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AD788(a1, v9);
    }
  }
  uint64_t v10 = +[HDClinicalAuthorizationSessionEntity createInitialLoginSessionForGatewayWithExternalID:*(void *)(a1 + 40) database:v6 error:a3];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  BOOL v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v13;
}

void sub_34188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_341B0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];

  uint64_t v7 = +[HDClinicalAuthorizationSessionEntity createReloginSessionForAccountWithIdentifier:*(void *)(a1 + 32) database:v6 error:a3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  BOOL v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  return v10;
}

void sub_3490C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 176), 8);
  _Unwind_Resume(a1);
}

BOOL sub_34950(void *a1, void *a2, void **a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];

  uint64_t v7 = +[HDClinicalAuthorizationSessionEntity existingEntityWithState:a1[4] database:v6 error:a3];
  if ([v7 updateWithCode:a1[5] database:v6 error:a3])
  {
    uint64_t v8 = [v7 tokenSessionInDatabase:v6 error:a3];
    uint64_t v9 = *(void *)(a1[7] + 8);
    BOOL v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      uint64_t v11 = [v7 accountIdentifierInDatabase:v6];
      uint64_t v12 = [v7 gatewayExternalIDInDatabase:v6];
      BOOL v13 = (void *)v12;
      if (v11)
      {
        _HKInitializeLogging();
        uint64_t v14 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (void *)a1[6];
          uint64_t v16 = v14;
          __n128 v17 = [v15 debugDescription];
          *(_DWORD *)buf = 138543618;
          uint64_t v42 = v17;
          __int16 v43 = 2114;
          uint64_t v44 = v11;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ account %{public}@ is re-logging in", buf, 0x16u);
        }
        uint64_t v18 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:v11 database:v6 error:a3];
        if (v18)
        {
          if (!+[HDClinicalGatewayEntity pruneUnusedGatewaysInDatabase:v6 error:a3])
          {
            _HKInitializeLogging();
            uint64_t v19 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
            {
              id v20 = (void *)a1[6];
              id v21 = v19;
              int v22 = [v20 debugDescription];
              id v23 = *a3;
              *(_DWORD *)buf = 138543618;
              uint64_t v42 = v22;
              __int16 v43 = 2114;
              uint64_t v44 = v23;
              _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "%{public}@ non-Fatal Error: Unable to prune unreferenced clinical account gateways: %{public}@", buf, 0x16u);
            }
          }
          uint64_t v24 = [v18 accountInDatabase:v6 error:a3];
          uint64_t v25 = *(void *)(a1[8] + 8);
          uint64_t v26 = *(void **)(v25 + 40);
          *(void *)(v25 + 40) = v24;

          uint64_t v27 = [*(id *)(*(void *)(a1[8] + 8) + 40) gateway];
          uint64_t v28 = *(void *)(a1[9] + 8);
          unsigned __int8 v29 = *(void **)(v28 + 40);
          *(void *)(v28 + 40) = v27;

          uint64_t v30 = a1[8];
          goto LABEL_17;
        }
      }
      else
      {
        if (!v12)
        {
          +[NSError hk_assignError:a3, 100, @"Missing both accountIdentifier and gatewayExternalID for authorization session with state %@", a1[4] code format];
          BOOL v31 = 0;
          goto LABEL_20;
        }
        _HKInitializeLogging();
        __int16 v32 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = (void *)a1[6];
          id v34 = v32;
          v35 = [v33 debugDescription];
          *(_DWORD *)buf = 138543362;
          uint64_t v42 = v35;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ logged in to a new account", buf, 0xCu);
        }
        __int16 v36 = +[HDClinicalGatewayEntity existingGatewayEntityWithExternalID:v13 database:v6 error:a3];
        uint64_t v18 = v36;
        if (v36)
        {
          uint64_t v37 = [v36 gatewayInDatabase:v6 error:a3];
          uint64_t v38 = *(void *)(a1[9] + 8);
          id v39 = *(void **)(v38 + 40);
          *(void *)(v38 + 40) = v37;

          uint64_t v30 = a1[9];
LABEL_17:
          BOOL v31 = *(void *)(*(void *)(v30 + 8) + 40) != 0;
LABEL_19:

LABEL_20:
          goto LABEL_21;
        }
      }
      BOOL v31 = 0;
      goto LABEL_19;
    }
  }
  BOOL v31 = 0;
LABEL_21:

  return v31;
}

id sub_34D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDClinicalAccountManagerEndLoginSessionJournalEntry alloc] initWithCode:*(void *)(a1 + 32) state:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 48) addJournalEntry:v5 error:a3];

  return v6;
}

void sub_34DB4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v10 = *(void *)(v9 + 40);
  if (v10)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = [*(id *)(v9 + 40) identifier];
    id v56 = 0;
    BOOL v13 = [v11 accountWithIdentifier:v12 error:&v56];
    id v14 = v56;

    if (v13)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v13);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v16 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AD9F4((void **)(a1 + 32), v16);
      }
    }

    id v15 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  else
  {
    id v15 = 0;
  }
  __n128 v17 = [v15 hkAccount];
  uint64_t v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v20 = objc_alloc((Class)HKClinicalEphemeralAccount);
    id v21 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) hkGateway];
    int v22 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) requestedScope];
    id v19 = [v20 initWithGateway:v21 authResponse:v7 requestedScopeString:v22];
  }
  _HKInitializeLogging();
  id v23 = (void *)HKLogHealthRecords;
  if (a2)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void **)(a1 + 32);
      uint64_t v25 = v23;
      uint64_t v26 = [v24 debugDescription];
      uint64_t v27 = [v19 identifier];
      *(_DWORD *)buf = 138543618;
      v58 = v26;
      __int16 v59 = 2114;
      v60 = v27;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully completed token fetch for account %{public}@", buf, 0x16u);
    }
    uint64_t v28 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) state];
    uint64_t v29 = *(void *)(a1 + 40);
    id v55 = 0;
    unsigned __int8 v30 = +[HDClinicalAuthorizationSessionEntity deleteSessionWithState:v28 profile:v29 error:&v55];
    id v31 = v55;

    if ((v30 & 1) == 0
      && (_HKInitializeLogging(),
          __int16 v32 = (void *)HKLogHealthRecords,
          os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)))
    {
      sub_AD88C(a1, v32, (uint64_t)v31);
      if (v10) {
        goto LABEL_17;
      }
    }
    else if (v10)
    {
LABEL_17:
      _HKInitializeLogging();
      uint64_t v33 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
      {
        id v34 = *(void **)(a1 + 32);
        v35 = v33;
        __int16 v36 = [v34 debugDescription];
        *(_DWORD *)buf = 138543362;
        v58 = v36;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "%{public}@ token fetch succeeded after re-login, triggering ingestion automatically", buf, 0xCu);
      }
      uint64_t v37 = *(void **)(a1 + 32);
      uint64_t v38 = [v19 identifier];
      [v37 _performIngestionForNewCredentialsWithReason:@"account re-login" accountIdentifier:v38];
    }
    uint64_t v39 = 0;
LABEL_21:

    id v31 = (id)v39;
LABEL_32:
    id v44 = objc_alloc((Class)HKClinicalAccountLoginCompletionState);
    id v45 = v19;
    id v46 = v31;
    BOOL v47 = v10 != 0;
    id v48 = v8;
    goto LABEL_33;
  }
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    uint64_t v49 = *(void **)(a1 + 32);
    id v50 = v23;
    id v51 = [v49 debugDescription];
    uint64_t v52 = [v19 identifier];
    *(_DWORD *)buf = 138543874;
    v58 = v51;
    __int16 v59 = 2114;
    v60 = v52;
    __int16 v61 = 2114;
    id v62 = v8;
    _os_log_error_impl(&dword_0, v50, OS_LOG_TYPE_ERROR, "%{public}@ unable to complete token fetch for account %{public}@: %{public}@", buf, 0x20u);

    if (v8) {
      goto LABEL_24;
    }
LABEL_31:
    id v31 = 0;
    goto LABEL_32;
  }
  if (!v8) {
    goto LABEL_31;
  }
LABEL_24:
  unsigned int v40 = objc_msgSend(v8, "hk_OAuth2_isOAuth2ErrorWithCode:", 13);
  id v31 = 0;
  if (!v7 || !v40) {
    goto LABEL_32;
  }
  uint64_t v41 = *(void **)(a1 + 32);
  uint64_t v42 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) requestedScope];
  id v54 = 0;
  uint64_t v39 = [v41 _savePatientMismatchedCredentialFromAuthResponse:v7 requestedScope:v42 error:&v54];
  id v31 = v54;

  if (v39) {
    goto LABEL_21;
  }
  _HKInitializeLogging();
  __int16 v43 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_AD958(a1 + 32, v43);
  }
  id v44 = objc_alloc((Class)HKClinicalAccountLoginCompletionState);
  id v45 = v19;
  id v46 = 0;
  BOOL v47 = v10 != 0;
  id v48 = v31;
LABEL_33:
  id v53 = [v44 initWithAccount:v45 alternateCredentialPersistentID:v46 wasRelogin:v47 error:v48];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

BOOL sub_353A4(id a1, HDDatabaseTransaction *a2, id *a3)
{
  id v4 = a2;
  id v5 = [(HDDatabaseTransaction *)v4 databaseForEntityClass:objc_opt_class()];

  LOBYTE(v4) = +[HDClinicalGatewayEntity pruneUnusedGatewaysInDatabase:v5 error:a3];
  LOBYTE(a3) = v4 & +[HDClinicalAuthorizationSessionEntity pruneAuthorizationSessionsInDatabase:v5 error:a3];

  return (char)a3;
}

void sub_35678(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = a3;
  id v11 = [objc_alloc((Class)HKFHIRRequestTaskEndStates) initWithEndState:v10];

  [v9 _accumulateMetricsFromTaskEndStates:v11 gateway:*(void *)(a1 + 40)];
  if (!v7)
  {
    uint64_t v25 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_11;
  }
  uint64_t v12 = *(void **)(a1 + 48);
  if (v12)
  {
    BOOL v13 = [v12 patientHash];
    id v14 = [v7 patientID];
    id v15 = +[HDFHIRCredential patientHashForPatientID:v14];

    if (!v13 || v13 == v15 || v15 && ([v13 isEqualToString:v15] & 1) != 0)
    {
      id v16 = objc_alloc((Class)HKClinicalAccountEvent);
      __n128 v17 = [*(id *)(a1 + 48) identifier];
      uint64_t v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "-[HDClinicalAccountManager _fetchAccessTokenForTokenSession:existingAccount:gateway:completion:]_block_invoke", 397, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Managers/HDClinicalAccountManager.m");
      id v19 = +[NSDate date];
      id v20 = [v16 initWithAccountIdentifier:v17 type:1 caller:v18 timestamp:v19 eventDescription:@"Updating existing account credential state from auth response after fetching access token based on OAuth2 authorization code."];

      id v21 = *(void **)(a1 + 32);
      uint64_t v22 = *(void *)(a1 + 48);
      id v23 = [*(id *)(a1 + 56) requestedScope];
      id v32 = 0;
      LOBYTE(v22) = [v21 _createOrUpdateCredentialFromAuthResponse:v7 account:v22 requestedScope:v23 event:v20 error:&v32];
      id v24 = v32;

      if (v22)
      {

        goto LABEL_9;
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v26 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = *(void **)(a1 + 32);
        uint64_t v28 = v26;
        uint64_t v29 = [v27 debugDescription];
        *(_DWORD *)buf = 138543874;
        id v34 = v29;
        __int16 v35 = 2114;
        __int16 v36 = v13;
        __int16 v37 = 2114;
        uint64_t v38 = v15;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ patient hash mismatch, had %{public}@, now have %{public}@", buf, 0x20u);
      }
      uint64_t v30 = *(void *)(a1 + 64);
      id v31 = +[NSError hk_OAuth2_error:13];
      (*(void (**)(uint64_t, void, id, void *))(v30 + 16))(v30, 0, v7, v31);
    }
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v25 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_11:
  v25();
LABEL_17:
}

void sub_35BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_35BC0(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];

  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) gateway];
  uint64_t v9 = [v8 externalID];
  id v10 = [v7 _createAccountForGatewayWithExternalID:v9 database:v6 profile:*(void *)(a1 + 48) error:a3];

  if (v10)
  {
    [v10 identifierInDatabase:v6];
    v12 = id v11 = a3;
    id v13 = objc_alloc((Class)HKClinicalAccountEvent);
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "-[HDClinicalAccountManager persistEphemeralAccount:triggerIngestion:error:]_block_invoke", 440, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Managers/HDClinicalAccountManager.m");
    +[NSDate date];
    v15 = uint64_t v33 = v6;
    id v16 = [v13 initWithAccountIdentifier:v12 type:1 caller:v14 timestamp:v15 eventDescription:@"Persisting an ephemeral account and creating a credential from auth response."];

    __n128 v17 = [*(id *)(a1 + 40) authResponse];
    uint64_t v18 = [*(id *)(a1 + 40) requestedScopeString];
    id v19 = *(void **)(a1 + 48);
    id v20 = [v19 database];
    id v34 = (void *)v12;
    LODWORD(v14) = +[HDClinicalAccountEntity createAccountCredentialFromAuthResponse:v17 accountIdentifier:v12 requestedScope:v18 profile:v19 healthDatabase:v20 event:v16 createdCredential:0 error:v11];

    if (v14)
    {
      id v6 = v33;
      if (!+[HDClinicalGatewayEntity pruneUnusedGatewaysInDatabase:v33 error:v11])
      {
        _HKInitializeLogging();
        id v21 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = *(void **)(a1 + 32);
          id v23 = v21;
          id v24 = [v22 debugDescription];
          uint64_t v25 = *v11;
          *(_DWORD *)buf = 138543618;
          __int16 v36 = v24;
          __int16 v37 = 2114;
          uint64_t v38 = v25;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "%{public}@ non-fatal error: unable to prune unreferenced clinical account gateways: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v26 = [v10 accountInDatabase:v33 error:v11];
      uint64_t v27 = v26;
      if (v26)
      {
        uint64_t v28 = [v26 hkAccount];
        uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v30 = *(void **)(v29 + 40);
        *(void *)(v29 + 40) = v28;

        BOOL v31 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
      }
      else
      {
        BOOL v31 = 0;
      }
    }
    else
    {
      BOOL v31 = 0;
      id v6 = v33;
    }
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

id sub_3609C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) credential];

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 64) + 24));
  uint64_t v12 = *(void *)(a1 + 72);
  id v11 = *(void **)(a1 + 80);
  if (v6)
  {
    id v13 = [v11 eventWithAppendedEventDescription:@"update credential"];
    id v24 = 0;
    unsigned __int8 v14 = +[HDClinicalAccountEntity updateAccountCredentialFromAuthResponse:v7 accountIdentifier:v8 requestedScope:v9 profile:WeakRetained healthDatabase:v12 event:v13 updatedCredential:0 error:&v24];
    id v15 = v24;
  }
  else
  {
    id v13 = [v11 eventWithAppendedEventDescription:@"create credential"];
    id v23 = 0;
    unsigned __int8 v14 = +[HDClinicalAccountEntity createAccountCredentialFromAuthResponse:v7 accountIdentifier:v8 requestedScope:v9 profile:WeakRetained healthDatabase:v12 event:v13 createdCredential:0 error:&v23];
    id v15 = v23;
  }
  id v16 = v15;

  if ((v14 & 1) == 0)
  {
    id v21 = v16;
    id v17 = v21;
    if (v21)
    {
      if (a3)
      {
        id v17 = v21;
        id v20 = 0;
        *a3 = v17;
        id v16 = v17;
        goto LABEL_11;
      }
      _HKLogDroppedError();
    }
    id v20 = 0;
    id v16 = v17;
    goto LABEL_11;
  }
  id v17 = [v5 databaseForEntityClass:objc_opt_class()];
  uint64_t v18 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:*(void *)(a1 + 48) database:v17 error:a3];
  id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 64) + 24));
  id v20 = [v18 resetFetchFailureInformationWithProfile:v19 transaction:v5 error:a3];

LABEL_11:
  return v20;
}

void sub_36474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_3648C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1[4];
  id v6 = (id *)(a1[5] + 24);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v9 = +[HDFHIRCredentialEntity insertCredential:v5 profile:WeakRetained transaction:v7 error:a3];

  uint64_t v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v9 persistentID]);
  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  return v9 != 0;
}

void sub_366F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_3670C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v5 protectedDatabase];
  uint64_t v8 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:v6 database:v7 error:a3];

  if (v8)
  {
    uint64_t v9 = HDClinicalAccountEntityPropertyGatewayExternalID;
    uint64_t v10 = [v5 protectedDatabase];
    uint64_t v11 = [v8 stringForProperty:v9 database:v10];

    if (!v11)
    {
      +[NSError hk_assignError:a3, 3, @"Unable to replace account %@ with a new account: no gateway id found on account", *(void *)(a1 + 32) code format];
      BOOL v21 = 0;
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v12 = [v5 protectedDatabase];
    id v13 = [v8 syncIdentifierInDatabase:v12];

    if (v13)
    {
      if ([*(id *)(a1 + 40) _deleteAccountWithSyncIdentifier:v13 deletionReason:1 transaction:v5 error:a3])
      {
        unsigned __int8 v14 = *(void **)(a1 + 40);
        id v15 = [v5 protectedDatabase];
        id v16 = [v14 _createAccountForGatewayWithExternalID:v11 database:v15 profile:*(void *)(a1 + 48) error:a3];

        if (v16)
        {
          id v17 = *(void **)(a1 + 56);
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
          unsigned int v19 = [v16 assignCredentialWithPersistentID:v17 profile:WeakRetained transaction:v5 error:a3];

          if (v19)
          {
            id v17 = [v5 protectedDatabase];
            id v20 = [v16 identifierInDatabase:v17];
          }
          else
          {
            id v20 = 0;
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v20);
          if (v19)
          {
          }
          BOOL v21 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
        }
        else
        {
          BOOL v21 = 0;
        }

        goto LABEL_18;
      }
    }
    else
    {
      +[NSError hk_assignError:a3, 100, @"Unable to replace account %@ with a new account: failed to retrieve sync identifier", *(void *)(a1 + 32) code format];
    }
    BOOL v21 = 0;
LABEL_18:

    goto LABEL_19;
  }
  BOOL v21 = 0;
LABEL_20:

  return v21;
}

void sub_36C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_36C80(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) profile];
  id v5 = [v4 database];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[HDClinicalAccountEntity hasGatewayBackedAccountsInHealthDatabase:v5 error:a2];

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
}

void sub_36E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_36E18(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) profile];
  id v5 = [v4 database];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[HDClinicalAccountEntity hasIssuerBackedAccountsInHealthDatabase:v5 error:a2];

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
}

void sub_3705C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_37074(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _hasClinicalSharingEnabledAccountWithError:a2];
  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
}

BOOL sub_37124(id a1, HDClinicalAccount *a2)
{
  uint64_t v2 = a2;
  id v3 = [(HDClinicalAccount *)v2 gateway];

  if (v3)
  {
    id v3 = [(HDClinicalAccount *)v2 gateway];
    id v4 = [v3 hkGateway];

    id v5 = [v4 features];
    uint64_t v6 = objc_msgSend(v5, "hk_firstObjectPassingTest:", &stru_112F58);
    LOBYTE(v3) = v6 != 0;
  }
  return (char)v3;
}

BOOL sub_371C0(id a1, HKClinicalGatewayFeature *a2)
{
  uint64_t v2 = [(HKClinicalGatewayFeature *)a2 name];
  unsigned __int8 v3 = [v2 isEqualToString:HKClinicalGatewayFeatureNameClinicalSharing];

  return v3;
}

void sub_38144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_38164(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v5 protectedDatabase];
  uint64_t v8 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:v6 database:v7 error:a3];

  if (v8)
  {
    uint64_t v9 = [v5 protectedDatabase];
    uint64_t v10 = [v8 syncIdentifierInDatabase:v9];

    if (v10)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) _deleteAccountWithSyncIdentifier:v10 deletionReason:*(void *)(a1 + 56) transaction:v5 error:a3];
      BOOL v11 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
    }
    else
    {
      uint64_t v12 = [*(id *)(a1 + 32) UUIDString];
      +[NSError hk_assignError:a3, 100, @"Failed to retrieve sync identifier for account with identifier %@", v12 code format];

      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

id sub_382A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  id v5 = [[HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry alloc] initWithAccountIdentifier:*(void *)(a1 + 32) deletionReason:*(void *)(a1 + 56)];
  id v6 = [*(id *)(a1 + 40) addJournalEntry:v5 error:a3];

  return v6;
}

id sub_3854C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _deleteAccountWithSyncIdentifier:*(void *)(a1 + 40) deletionReason:*(void *)(a1 + 48) transaction:a2 error:a3];
}

id sub_38564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry alloc] initWithAccountSyncIdentifier:*(void *)(a1 + 32) deletionReason:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 40) addJournalEntry:v5 error:a3];

  return v6;
}

id sub_390D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];
  id v7 = [*(id *)(a1 + 32) identifier];
  uint64_t v8 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:v7 database:v6 error:a3];

  id v9 = [v8 updateCredentialState:*(void *)(a1 + 56) profile:*(void *)(a1 + 40) transaction:v5 error:a3];
  uint64_t v12 = *(void **)(a1 + 48);
  uint64_t v10 = a1 + 48;
  BOOL v11 = v12;
  if ((v9 & 1) == 0)
  {
    BOOL v11 = [v11 eventMarkedAsFailedWithError:*a3];
  }
  id v17 = 0;
  unsigned __int8 v13 = +[HDClinicalAccountEventEntity insertEvent:v11 database:v6 error:&v17];
  id v14 = v17;
  if ((v9 & 1) == 0) {

  }
  if ((v13 & 1) == 0)
  {
    _HKInitializeLogging();
    id v15 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_ADD30(v10, v15);
    }
  }

  return v9;
}

uint64_t sub_3922C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = a1 + 32;
  id v9 = [v6 database];
  id v14 = 0;
  LOBYTE(v_Block_object_dispose(&STACK[0x220], 8) = +[HDClinicalAccountEventEntity journalEvent:v8 database:v9 error:&v14];
  id v10 = v14;

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    BOOL v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_ADD30(v7, v11);
    }
  }
  id v12 = v5;
  if (v12)
  {
    if (a3) {
      *a3 = v12;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return 0;
}

id sub_394C4(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];
  uint64_t v7 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:a1[4] database:v6 error:a3];
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
    id v9 = [v7 updateClinicalSharingStatusWithProfile:WeakRetained transaction:v5 firstSharedDate:a1[6] lastSharedDate:a1[7] userStatus:a1[8] multiDeviceStatus:a1[9] primaryDeviceName:a1[10] error:a3];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_396A0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 asRefreshResultWithEndStates:a3];
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v16 = 0;
  id v9 = [v7 didRefreshCredentialForAccount:v8 refreshResult:v6 error:&v16];
  id v10 = v16;
  if (v9)
  {
    [v5 didRefreshCredential:v9];
  }
  else
  {
    _HKInitializeLogging();
    BOOL v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      id v12 = *(void **)(a1 + 32);
      unsigned __int8 v13 = v11;
      id v14 = [v12 debugDescription];
      id v15 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      id v20 = v15;
      __int16 v21 = 2114;
      id v22 = v10;
      _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "%{public}@ failed to update credential for account %{public}@: %{public}@", buf, 0x20u);
    }
  }
}

void sub_3A038(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned __int8 v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 48) eventMarkedAsFailedWithError:a2];
  id v6 = 0;
  LOBYTE(v3) = [v3 _setAccountWithIdentifierNeedsRelogin:v2 event:v4 error:&v6];
  id v5 = v6;

  if ((v3 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_ADE38();
    }
  }
}

id sub_3A3CC(void *a1, void *a2)
{
  return [a2 accountManager:a1[4] account:a1[5] didChangeState:a1[6]];
}

void sub_3A978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

BOOL sub_3A998(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 96)) {
    id v6 = @"SIMULATOR_FAKECLIENTID";
  }
  else {
    id v6 = @"QAUSEONLY_FAKECLIENTID";
  }
  uint64_t v7 = v6;
  if (*(unsigned char *)(a1 + 96)) {
    uint64_t v8 = @"SIMULATOR_FAKECLIENTSECRET";
  }
  else {
    uint64_t v8 = @"QAUSEONLY_FAKECLIENTSECRET";
  }
  id v9 = v8;
  if (*(unsigned char *)(a1 + 96)) {
    id v10 = @"SIMULATOR_FAKEGATEWAYBATCHID";
  }
  else {
    id v10 = @"QAUSEONLY_FAKEGATEWAYBATCHID";
  }
  BOOL v11 = v10;
  if (*(unsigned char *)(a1 + 96)) {
    id v12 = @"SIMULATOR_FAKEBRANDID";
  }
  else {
    id v12 = @"QAUSEONLY_FAKEBRANDID";
  }
  unsigned __int8 v13 = v12;
  if (*(unsigned char *)(a1 + 96)) {
    id v14 = @"SIMULATOR_FAKEBRANDBATCHID";
  }
  else {
    id v14 = @"QAUSEONLY_FAKEBRANDBATCHID";
  }
  id v15 = v14;
  v45[0] = @"authSchemas";
  v45[1] = @"baseURL";
  v46[0] = &__NSArray0__struct;
  v46[1] = @"https://localhost:9090/resource";
  v45[2] = @"clientID";
  v45[3] = @"clientSecret";
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(a1 + 40);
  v46[3] = v9;
  v46[4] = v16;
  v45[4] = @"country";
  v45[5] = @"fhirVersion";
  uint64_t v41 = v9;
  uint64_t v42 = v7;
  v46[2] = v7;
  id v18 = a2;
  __int16 v19 = [v17 stringRepresentation];
  v46[5] = v19;
  v46[6] = v11;
  unsigned int v40 = v11;
  uint64_t v20 = a3;
  __int16 v21 = v15;
  v45[6] = @"gatewayBatchID";
  v45[7] = @"gatewayID";
  uint64_t v22 = *(void *)(a1 + 56);
  v46[7] = *(void *)(a1 + 48);
  v46[8] = &off_11D158;
  v45[8] = @"minCompatibleApiVersion";
  v45[9] = @"title";
  CFStringRef v23 = *(const __CFString **)(a1 + 64);
  if (!v23) {
    CFStringRef v23 = @"Static Gateway";
  }
  v46[9] = v22;
  v46[10] = v23;
  v45[10] = @"subtitle";
  v45[11] = @"phoneNumber";
  v46[11] = @"4085551212";
  v45[12] = @"brand";
  v43[0] = @"brandID";
  v43[1] = @"brandBatchID";
  v44[0] = v13;
  v44[1] = v15;
  id v24 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  v46[12] = v24;
  v46[13] = &off_11D7A8;
  v45[13] = @"urls";
  v45[14] = @"displayableDescription";
  CFStringRef v25 = *(const __CFString **)(a1 + 72);
  if (!v25) {
    CFStringRef v25 = @"Gateway paired with static local account";
  }
  v46[14] = v25;
  v46[15] = &__NSArray0__struct;
  v45[15] = @"resourceSchemas";
  v45[16] = @"status";
  v46[16] = @"Disabled";
  v46[17] = @"FHIR";
  v45[17] = @"type";
  v45[18] = @"updated";
  v46[18] = &off_11D170;
  uint64_t v26 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:19];

  uint64_t v27 = [v18 databaseForEntityClass:objc_opt_class()];

  uint64_t v28 = [[HDClinicalGateway alloc] initWithContent:v26];
  uint64_t v29 = [*(id *)(a1 + 80) profile];
  unsigned int v30 = +[HDClinicalGatewayEntity insertOrUpdateGateway:v28 database:v27 profile:v29 error:v20];

  if (v30)
  {
    BOOL v31 = *(void **)(a1 + 80);
    uint64_t v32 = *(void *)(a1 + 48);
    uint64_t v33 = [v31 profile];
    id v34 = [v31 _createAccountForGatewayWithExternalID:v32 database:v27 profile:v33 error:v20];

    if (v34)
    {
      uint64_t v35 = [v34 accountInDatabase:v27 error:v20];
      uint64_t v36 = *(void *)(*(void *)(a1 + 88) + 8);
      __int16 v37 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = v35;

      BOOL v38 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) != 0;
    }
    else
    {
      BOOL v38 = 0;
    }
  }
  else
  {
    BOOL v38 = 0;
  }

  return v38;
}

void sub_3B014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_3B02C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) externalID];
  uint64_t v8 = [v5 protectedDatabase];
  id v9 = [v6 _createAccountForGatewayWithExternalID:v7 database:v8 profile:*(void *)(a1 + 48) error:a3];

  if (v9)
  {
    id v10 = [v5 protectedDatabase];
    uint64_t v11 = [v9 accountInDatabase:v10 error:a3];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    unsigned __int8 v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    BOOL v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void sub_3B2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_3B304(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) externalID];
  uint64_t v8 = [v5 protectedDatabase];
  id v9 = [v6 _createAccountForGatewayWithExternalID:v7 database:v8 profile:*(void *)(a1 + 48) error:a3];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 56) createCredentialWithIdentifier:0 requestedScope:*(void *)(a1 + 64) error:a3];
    if (v10)
    {
      uint64_t v11 = +[HDFHIRCredentialEntity insertCredential:v10 profile:*(void *)(a1 + 48) transaction:v5 error:a3];
      uint64_t v12 = v11;
      if (v11)
      {
        unsigned __int8 v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 persistentID]);
        [v9 assignCredentialWithPersistentID:v13 profile:*(void *)(a1 + 48) transaction:v5 error:a3];

        BOOL v14 = [v5 protectedDatabase];
        uint64_t v15 = [v9 accountInDatabase:v14 error:a3];
        uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        BOOL v18 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

void sub_3BC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_3BC60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];
  uint64_t v7 = [*(id *)(a1 + 32) issuerIdentifier];
  id v40 = 0;
  uint64_t v8 = +[HDClinicalAccountEntity accountEntityForSignedClinicalDataIssuerWithIdentifier:v7 database:v6 error:&v40];
  id v9 = v40;
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v12) {
    goto LABEL_2;
  }
  if (v9)
  {
    _HKInitializeLogging();
    BOOL v14 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = *(void **)(a1 + 40);
      id v34 = v14;
      uint64_t v35 = [v33 debugDescription];
      uint64_t v36 = [*(id *)(a1 + 32) issuerIdentifier];
      __int16 v37 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = v35;
      __int16 v43 = 2114;
      id v44 = v37;
      __int16 v45 = 2114;
      id v46 = v9;
      _os_log_debug_impl(&dword_0, v34, OS_LOG_TYPE_DEBUG, "%{public}@ failed to check for existing account for ID %{public}@: %{public}@", buf, 0x20u);
    }
    if (a3)
    {
      BOOL v13 = 0;
      *a3 = v9;
      goto LABEL_26;
    }
    _HKLogDroppedError();
LABEL_25:
    BOOL v13 = 0;
    goto LABEL_26;
  }
  int v15 = *(unsigned __int8 *)(a1 + 56);
  _HKInitializeLogging();
  uint64_t v16 = (void *)HKLogHealthRecords;
  if (!v15)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_ADF58(a1, v16, (id *)(a1 + 32));
    }
    id v24 = [*(id *)(a1 + 32) issuerIdentifier];
    CFStringRef v25 = HKSensitiveLogItem();
    +[NSError hk_assignError:a3, 118, @"no account and issuer with identifier %@", v25 code format];
    goto LABEL_24;
  }
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = *(void **)(a1 + 40);
    BOOL v18 = v16;
    __int16 v19 = [v17 debugDescription];
    uint64_t v20 = [*(id *)(a1 + 32) issuerIdentifier];
    __int16 v21 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    uint64_t v42 = v19;
    __int16 v43 = 2114;
    id v44 = v21;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ creating account & issuer with identifier %{public}@", buf, 0x16u);
  }
  uint64_t v22 = (void **)(a1 + 40);
  CFStringRef v23 = [*(id *)(a1 + 40) profileExtension];
  id v24 = [v23 createSignedClinicalDataRegistry];

  CFStringRef v25 = +[HKSignedClinicalDataIssuer makeIssuerForRecord:*(void *)(a1 + 32) usingRegistry:v24];
  uint64_t v26 = *(void **)(a1 + 40);
  id v39 = 0;
  uint64_t v27 = [v26 createAccountForIssuer:v25 databaseTransaction:v5 error:&v39];
  id v28 = v39;
  uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
  unsigned int v30 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v27;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    _HKInitializeLogging();
    BOOL v31 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AE034(v22, v31);
    }
    id v32 = v28;
    if (v32)
    {
      if (a3) {
        *a3 = v32;
      }
      else {
        _HKLogDroppedError();
      }
    }

LABEL_24:
    goto LABEL_25;
  }

  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
LABEL_2:
  BOOL v13 = v12 != 0;
LABEL_26:

  return v13;
}

BOOL sub_3C090(id a1, NSError *a2, id *a3)
{
  id v4 = a2;
  if (v4)
  {
    if (a3) {
      *a3 = v4;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return 0;
}

void sub_3C288(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 taskSuccess] & 1) == 0)
  {
    _HKInitializeLogging();
    id v4 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AE0E8((void *)a1, v4, v3);
    }
  }
  [*(id *)(a1 + 56) invalidate];
}

void sub_3C490(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully requested changes cloud sync for reason: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    unsigned int v10 = objc_msgSend(v5, "hk_isHealthKitErrorWithCode:", 701);
    _HKInitializeLogging();
    uint64_t v11 = (void *)HKLogHealthRecords;
    if (v10)
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
        sub_AE1D0(a1, v11);
      }
    }
    else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      sub_AE288();
    }
  }
}

void sub_3C950(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 didSucceed] & 1) == 0)
  {
    _HKInitializeLogging();
    id v4 = (void *)HKLogDatabase;
    if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_FAULT)) {
      sub_AE378(a1, v4);
    }
  }
}

void sub_3D510(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_3D52C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_3D54C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_3D664(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setCredentialResult:v3];
  uint64_t v4 = [v3 refreshError];
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    id v8 = 0;
    id v6 = [v5 createURLRequestWithCredentialResult:v3 error:&v8];
    id v7 = v8;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_3DBB0(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_3DBC4(_Unwind_Exception *a1)
{
}

void sub_3DCC0(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_3DCD8(_Unwind_Exception *a1)
{
}

void sub_3DE84(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_3DE98(_Unwind_Exception *a1)
{
}

void sub_3DF94(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_3DFAC(_Unwind_Exception *a1)
{
}

void sub_3F814(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) error];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = +[NSError hk_error:7 description:@"Search operation cancelled"];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v3 = (void *)v2;
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) page];
    id v6 = [v4 _searchResultsPageWithOnlySupportedSearchResultsInSearchResultsPage:v5];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v3 = v7;
  }
}

void sub_3FAD4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 64);
  id v19 = 0;
  uint64_t v4 = +[HDProviderServiceSpecification URLForProvidersWithBatchID:v2 searchSessionID:v3 error:&v19];
  id v5 = v19;
  if (v4)
  {
    id v6 = +[NSURLRequest requestWithURL:v4];
    id v7 = [[HDCPSFetchJSONTask alloc] initWithSession:*(void *)(*(void *)(a1 + 40) + 24) request:v6];
    [(HDCPSFetchJSONTask *)v7 resume];
    [(HDCPSFetchJSONTask *)v7 waitUntilFinished];
    id v8 = [(HDCPSFetchJSONTask *)v7 JSONObject];

    if (v8)
    {
      uint64_t v9 = [(HDCPSFetchJSONTask *)v7 JSONObject];
      uint64_t v10 = *(void **)(a1 + 48);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_3FCA0;
      v15[3] = &unk_1131F0;
      id v11 = v10;
      uint64_t v12 = *(void *)(a1 + 40);
      id v16 = v11;
      uint64_t v17 = v12;
      id v18 = *(id *)(a1 + 56);
      +[HDProviderServiceSpecification providerAndGatewaysFromFetchedJSONObject:v9 matchingProviderExternalID:v11 completion:v15];

      uint64_t v13 = v16;
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v13 = [(HDCPSFetchJSONTask *)v7 error];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v13);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_3FCA0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v7)
  {
    _HKInitializeLogging();
    uint64_t v10 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AE884(a1, v10, (uint64_t)v9);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v15);
        uint64_t v17 = *(void **)(a1 + 40);
        id v21 = 0;
        unsigned __int8 v18 = [v17 _insertOrUpdateGatewayIfSupported:v16 error:&v21];
        id v19 = v21;
        uint64_t v20 = v19;
        if ((v18 & 1) == 0)
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          goto LABEL_14;
        }

        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:
}

void sub_3FF40(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_3FFDC;
  v4[3] = &unk_113240;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _fetchRemoteGatewayWithExternalID:v2 batchID:v3 completion:v4];
}

void sub_3FFDC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [objc_alloc((Class)HKClinicalGateway) initWithDaemonClinicalGateway:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_40138(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) profile];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2 database];
  id v12 = 0;
  id v5 = +[HDClinicalGatewayEntity gatewayWithExternalID:v3 healthDatabase:v4 error:&v12];
  id v6 = v12;

  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [v5 batchID];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_40280;
    v10[3] = &unk_113240;
    id v11 = *(id *)(a1 + 48);
    [v7 _fetchRemoteGatewayWithExternalID:v8 batchID:v9 completion:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_40280(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_40380(void *a1)
{
  uint64_t v2 = a1[4];
  id v17 = 0;
  uint64_t v3 = +[HDProviderServiceSpecification URLForGatewaysWithBatchID:v2 error:&v17];
  id v4 = v17;
  if (v3)
  {
    id v5 = +[NSURLRequest requestWithURL:v3];
    id v6 = [[HDCPSFetchJSONTask alloc] initWithSession:*(void *)(a1[5] + 24) request:v5];
    [(HDCPSFetchJSONTask *)v6 resume];
    [(HDCPSFetchJSONTask *)v6 waitUntilFinished];
    id v7 = [(HDCPSFetchJSONTask *)v6 JSONObject];

    if (v7)
    {
      uint64_t v8 = [(HDCPSFetchJSONTask *)v6 JSONObject];
      uint64_t v9 = a1[6];
      id v16 = v4;
      uint64_t v10 = +[HDProviderServiceSpecification gatewayFromFetchedJSONObject:v8 matchingExternalID:v9 error:&v16];
      id v11 = v16;

      if (!v10)
      {
        (*(void (**)(void))(a1[7] + 16))();
        id v4 = v11;
LABEL_9:

        goto LABEL_10;
      }
      id v12 = (void *)a1[5];
      id v15 = v11;
      [v12 _insertOrUpdateGatewayIfSupported:v10 error:&v15];
      id v4 = v15;

      id v13 = *(void (**)(void))(a1[7] + 16);
    }
    else
    {
      uint64_t v14 = a1[7];
      uint64_t v10 = [(HDCPSFetchJSONTask *)v6 error];
      id v13 = *(void (**)(void))(v14 + 16);
    }
    v13();
    goto LABEL_9;
  }
  (*(void (**)(void))(a1[7] + 16))();
LABEL_10:
}

uint64_t sub_40778(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 countryCode];
  if ([v4 _isCountryCodeSupported:v5])
  {
    [v3 minCompatibleAPIVersion];
    uint64_t IsMinCompatibleAPIVersionSupported = HKProviderServiceIsMinCompatibleAPIVersionSupported();
  }
  else
  {
    uint64_t IsMinCompatibleAPIVersionSupported = 0;
  }

  return IsMinCompatibleAPIVersionSupported;
}

uint64_t sub_408A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 country];
  if ([v4 _isCountryCodeSupported:v5])
  {
    [v3 minCompatibleAPIVersion];
    unsigned int IsMinCompatibleAPIVersionSupported = HKProviderServiceIsMinCompatibleAPIVersionSupported();
  }
  else
  {
    unsigned int IsMinCompatibleAPIVersionSupported = 0;
  }

  if (v3) {
    uint64_t v7 = IsMinCompatibleAPIVersionSupported;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_40CD8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) batchID];
  uint64_t v3 = *(void *)(a1 + 40);
  id v19 = 0;
  id v4 = +[HDProviderServiceSpecification URLForBrandLogosWithBatchID:v2 scaleKey:v3 error:&v19];
  id v5 = v19;

  if (v4)
  {
    id v6 = +[NSURLRequest requestWithURL:v4];
    uint64_t v7 = [[HDCPSFetchJSONTask alloc] initWithSession:*(void *)(*(void *)(a1 + 48) + 24) request:v6];
    [(HDCPSFetchJSONTask *)v7 resume];
    [(HDCPSFetchJSONTask *)v7 waitUntilFinished];
    uint64_t v8 = [(HDCPSFetchJSONTask *)v7 JSONObject];

    if (v8)
    {
      uint64_t v9 = [(HDCPSFetchJSONTask *)v7 JSONObject];
      id v18 = v5;
      uint64_t v10 = +[HDProviderServiceSpecification brandLogosFromFetchedJSONObject:v9 error:&v18];
      id v11 = v18;

      if (v10)
      {
        id v12 = [*(id *)(a1 + 32) externalID];
        id v13 = [v10 objectForKeyedSubscript:v12];

        uint64_t v14 = *(void *)(a1 + 56);
        if (v13)
        {
          id v15 = [*(id *)(a1 + 32) externalID];
          id v16 = [v10 objectForKeyedSubscript:v15];
          (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v16, 0);
        }
        else
        {
          id v15 = +[NSError hk_error:1 format:@"Data was returned but we couldn't find a matching externalID so no image will be returned"];
          (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
        }
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      id v5 = v11;
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 56);
      uint64_t v10 = [(HDCPSFetchJSONTask *)v7 error];
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v10);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_41000(void *a1)
{
  uint64_t v2 = a1[4];
  id v13 = 0;
  uint64_t v3 = +[HDProviderServiceSpecification URLForFeaturedBrandLogosAtScaleKey:v2 error:&v13];
  id v4 = v13;
  if (v3)
  {
    id v5 = +[NSURLRequest requestWithURL:v3];
    id v6 = [[HDCPSFetchJSONTask alloc] initWithSession:*(void *)(a1[5] + 24) request:v5];
    [(HDCPSFetchJSONTask *)v6 resume];
    [(HDCPSFetchJSONTask *)v6 waitUntilFinished];
    uint64_t v7 = [(HDCPSFetchJSONTask *)v6 JSONObject];

    if (v7)
    {
      uint64_t v8 = [(HDCPSFetchJSONTask *)v6 JSONObject];
      id v12 = v4;
      uint64_t v9 = +[HDProviderServiceSpecification brandLogosFromFetchedJSONObject:v8 error:&v12];
      id v10 = v12;

      (*(void (**)(void))(a1[6] + 16))();
      id v4 = v10;
    }
    else
    {
      uint64_t v11 = a1[6];
      uint64_t v9 = [(HDCPSFetchJSONTask *)v6 error];
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v9);
    }
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void sub_4199C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_419BC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

id sub_42A44(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _predicateForAccountWithIdentifier:a2];
}

id sub_42C04(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _predicateForAccountForGatewayWithExternalID:a2];
}

void sub_43CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_43CEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_43CFC(uint64_t a1)
{
}

uint64_t sub_43D04(void *a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(a1[8] + 8) + 40) = [(id)objc_opt_class() _populateAccountWithRow:a3 credential:a1[5] gateway:a1[6] signedClinicalDataIssuer:a1[7]];

  return _objc_release_x1();
}

void sub_43F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_43F60(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntity:*(void *)(a1 + 32)];
  uint64_t v6 = [*(id *)(a1 + 32) _codableInDatabase:v5 error:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  BOOL v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  return v9;
}

void sub_441F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_44220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_opt_class();
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v5 _codableWithRow:a3 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_44D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_44D34(void *a1, void *a2, uint64_t a3)
{
  id v5 = (void *)a1[6];
  uint64_t v6 = a1[4];
  uint64_t v7 = [a2 databaseForEntityClass:v5];
  uint64_t v8 = [v5 accountWithIdentifier:v6 database:v7 error:a3];
  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
}

void sub_44FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL sub_4500C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 72), @"HDClinicalAccountEntity+HealthRecordsPlugin.m", 855, @"Invalid parameter not satisfying: %@", @"[entity isKindOfClass:[HDClinicalAccountEntity class]]" object file lineNumber description];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = 0;
  id v5 = [v3 accountInDatabase:v4 error:&v10];
  id v6 = v10;
  id v7 = v10;
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }

  return v5 != 0;
}

void sub_4525C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_45274(void *a1, void *a2, uint64_t a3)
{
  id v5 = (void *)a1[6];
  id v6 = [a2 databaseForEntityClass:v5];
  uint64_t v7 = [v5 accountsInDatabase:v6 predicate:a1[4] errorOut:a3];
  uint64_t v8 = *(void *)(a1[5] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
}

void sub_45674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_4568C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  uint64_t v7 = [v5 _predicateForAccountsWithIssuers];
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = HDSQLEntityPropertyStar;
  id v10 = [v6 databaseForEntityClass:v8];

  uint64_t v11 = [v8 countValueForProperty:v9 predicate:v7 database:v10 error:a3];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  BOOL v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
  return v14;
}

void sub_458A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_458C4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  uint64_t v7 = [v5 _predicateForAccountsWithGateways];
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = HDSQLEntityPropertyStar;
  id v10 = [v6 databaseForEntityClass:v8];

  uint64_t v11 = [v8 countValueForProperty:v9 predicate:v7 database:v10 error:a3];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  BOOL v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
  return v14;
}

void sub_45E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_45E18(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 40) accountsNeedExtractionSQL];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_45EEC;
  v9[3] = &unk_1126E0;
  v9[4] = *(void *)(a1 + 32);
  id v7 = [v5 executeSQL:v6 error:a3 bindingHandler:&stru_113460 enumerationHandler:v9];

  return v7;
}

uint64_t sub_45EEC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    char v2 = 1;
  }
  else
  {
    char v2 = HDSQLiteColumnAsBoolean();
    uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v1 + 24) = v2;
  return 1;
}

void sub_4605C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_46074(uint64_t a1, void *a2, void *a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  id v6 = *(void **)(a1 + 40);
  id v7 = [v6 _predicateForActiveNeedsRelogin];
  id v14 = 0;
  uint64_t v8 = [v6 anyInDatabase:v5 predicate:v7 error:&v14];
  id v9 = v14;

  if (v9)
  {
    if (a3) {
      *a3 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }
  else
  {
    uint64_t v10 = +[NSNumber numberWithInt:v8 != 0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  return v9 == 0;
}

void sub_464B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

id sub_464E0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 80)];
  id v7 = [*(id *)(a1 + 80) existingAccountEntityWithIdentifier:*(void *)(a1 + 32) database:v6 error:a3];
  uint64_t v8 = [v7 _updateCredentialFromAuthResponse:*(void *)(a1 + 40) requestedScope:*(void *)(a1 + 48) profile:*(void *)(a1 + 56) transaction:v5 error:a3];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v11)
  {
    id v13 = *(void **)(a1 + 80);
    uint64_t v12 = *(void *)(a1 + 88);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v17 = [v11 fetchRefreshTokenWithError:0];
    uint64_t v18 = [v16 eventWithAppendedRefreshToken:v17 description:@"Updated credential refresh token"];
    id v19 = [v13 _updateAccountCredentialState:v12 identifier:v14 profile:v15 transaction:v5 event:v18 alwaysRecordEvent:1 error:a3];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

id sub_46628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 80);
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) eventMarkedAsFailedWithError:a2];
  [v5 _journalAccountEvent:v6 database:*(void *)(a1 + 32)];

  id v7 = [[HDClinicalAccountUpdateCredentialJournalEntry alloc] initWithAuthResponse:*(void *)(a1 + 40) accountIdentifier:*(void *)(a1 + 48) requestedScope:*(void *)(a1 + 56) event:*(void *)(a1 + 64)];
  id v8 = [*(id *)(a1 + 32) addJournalEntry:v7 error:a3];

  return v8;
}

void sub_46B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

id sub_46B94(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 80)];
  id v7 = [*(id *)(a1 + 80) existingAccountEntityWithIdentifier:*(void *)(a1 + 32) database:v6 error:a3];
  id v8 = v7;
  if (v7
    && ([v7 _createCredentialFromAuthResponse:*(void *)(a1 + 40) credentialIdentifier:0 requestedScope:*(void *)(a1 + 48) profile:*(void *)(a1 + 56) transaction:v5 error:a3], v9 = objc_claimAutoreleasedReturnValue(), uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8), v11 = *(void **)(v10 + 40), *(void *)(v10 + 40) = v9, v11, (v12 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) != 0))
  {
    uint64_t v14 = *(void **)(a1 + 80);
    uint64_t v13 = *(void *)(a1 + 88);
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v18 = [v12 fetchRefreshTokenWithError:0];
    id v19 = [v17 eventWithAppendedRefreshToken:v18 description:@"Created credential refresh token"];
    id v20 = [v14 _updateAccountCredentialState:v13 identifier:v15 profile:v16 transaction:v5 event:v19 alwaysRecordEvent:1 error:a3];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

id sub_46CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 80);
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) eventMarkedAsFailedWithError:a2];
  [v5 _journalAccountEvent:v6 database:*(void *)(a1 + 32)];

  id v7 = [(HDClinicalAccountUpdateCredentialJournalEntry *)[HDClinicalAccountCreateCredentialJournalEntry alloc] initWithAuthResponse:*(void *)(a1 + 40) accountIdentifier:*(void *)(a1 + 48) requestedScope:*(void *)(a1 + 56) event:*(void *)(a1 + 64)];
  id v8 = [*(id *)(a1 + 32) addJournalEntry:v7 error:a3];

  return v8;
}

void sub_47154(uint64_t a1)
{
  id v1 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
  HDSQLiteBindNumberToProperty();
}

void sub_475F8(uint64_t a1)
{
  HDSQLiteBindNumberToProperty();
  if (*(void *)(a1 + 56))
  {
    +[HDFHIRCredential patientHashForPatientID:](HDFHIRCredential, "patientHashForPatientID:");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindStringToProperty();
  }
  else
  {
    HDSQLiteBindStringToProperty();
  }
}

uint64_t sub_47800()
{
  HDSQLiteBindDateToProperty();

  return HDSQLiteBindNumberToProperty();
}

uint64_t sub_47CA8(id *a1)
{
  if (([a1[4] containsObject:HDClinicalAccountEntityPropertyModificationDate] & 1) == 0) {
    HDSQLiteBindDateToProperty();
  }
  if (([a1[4] containsObject:HDClinicalAccountEntityPropertySyncAnchor] & 1) == 0)
  {
    [a1[6] longLongValue];
    HDSQLiteBindInt64ToProperty();
  }
  if (([a1[4] containsObject:HDClinicalAccountEntityPropertySyncProvenance] & 1) == 0) {
    HDSQLiteBindInt64ToProperty();
  }
  uint64_t result = (uint64_t)[a1[4] containsObject:HDClinicalAccountEntityPropertySyncIdentity];
  if ((result & 1) == 0)
  {
    [a1[7] currentSyncIdentityPersistentID];
    return HDSQLiteBindInt64ToProperty();
  }
  return result;
}

id sub_47EE0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_47FD4;
  v14[3] = &unk_113540;
  id v15 = v7;
  id v16 = *(id *)(a1 + 48);
  v13.receiver = v9;
  v13.super_class = (Class)HDClinicalAccountEntity;
  id v10 = v7;
  id v11 = objc_msgSendSuper2(&v13, "updateProperties:database:error:bindingHandler:", a2, v8, a4, v14);

  return v11;
}

uint64_t sub_47FD4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

BOOL sub_48190(uint64_t a1, void *a2, void *a3)
{
  id v65 = a2;
  id v5 = [v65 databaseForEntityClass:*(void *)(a1 + 48)];
  id v66 = objc_alloc_init((Class)NSMutableDictionary);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = *(id *)(a1 + 32);
  id v6 = [obj countByEnumeratingWithState:&v85 objects:v97 count:16];
  if (!v6) {
    goto LABEL_70;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v86;
  __int16 v64 = a3;
  uint64_t v77 = a1;
  v67 = v5;
  uint64_t v75 = *(void *)v86;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v86 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v85 + 1) + 8 * (void)v9);
      id v11 = *(void **)(a1 + 48);
      id v84 = 0;
      unsigned __int8 v12 = [v11 _validateCodableAccount:v10 error:&v84];
      id v13 = v84;
      uint64_t v14 = v13;
      if ((v12 & 1) == 0)
      {
        _HKInitializeLogging();
        id v21 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          id v48 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          id v92 = v48;
          __int16 v93 = 2114;
          id v94 = v14;
          _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "%{public}@ invalid codable clinical account: %{public}@", buf, 0x16u);
        }
        goto LABEL_14;
      }
      v78 = v13;
      id v15 = v7;
      id v16 = [v10 syncIdentifier];
      uint64_t v17 = +[NSUUID hk_UUIDWithData:v16];

      uint64_t v18 = +[HDClinicalDeletedAccountEntity tombstoneExistsWithSyncIdentifier:v17 database:v5 error:a3];
      if (!v18)
      {

        int v40 = 1;
        goto LABEL_72;
      }
      id v19 = v18;
      if ([v18 BOOLValue])
      {
        _HKInitializeLogging();
        id v20 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
        {
          id v57 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          id v92 = v57;
          __int16 v93 = 2114;
          id v94 = v17;
          _os_log_debug_impl(&dword_0, v20, OS_LOG_TYPE_DEBUG, "%{public}@ received deleted account from sync with sync identifier %{public}@. Skipping.", buf, 0x16u);
        }

        id v7 = v15;
        uint64_t v8 = v75;
        uint64_t v14 = v78;
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v22 = [v10 gatewayExternalID];
      uint64_t v23 = [v10 signedClinicalDataIssuerIdentifier];
      v73 = (void *)v22;
      v74 = (void *)v23;
      if (v22)
      {
        uint64_t v68 = [v66 objectForKeyedSubscript:v22];
        if (v68)
        {
          v71 = 0;
          id v24 = 0;
          goto LABEL_26;
        }
        id v83 = 0;
        +[HDClinicalGatewayEntity gatewayEntityWithExternalID:v22 database:v5 error:&v83];
        long long v25 = v26 = (void *)v22;
        id v24 = v83;
        if (!v25)
        {
          _HKInitializeLogging();
          uint64_t v52 = (void *)HKLogHealthRecords;
          if (v24)
          {
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              id v53 = *(void **)(v77 + 48);
              id v54 = v52;
              id v55 = HKSensitiveLogItem();
              *(_DWORD *)buf = 138543874;
              id v92 = v53;
              a3 = v64;
              __int16 v93 = 2112;
              id v94 = v55;
              __int16 v95 = 2114;
              id v96 = v24;
              _os_log_error_impl(&dword_0, v54, OS_LOG_TYPE_ERROR, "%{public}@ failed to find gateway with external ID \"%@\": %{public}@", buf, 0x20u);
              goto LABEL_67;
            }
          }
          else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
          {
            v72 = *(void **)(v77 + 48);
            id v54 = v52;
            id v55 = HKSensitiveLogItem();
            __int16 v61 = [v10 accountIdentifier];
            *(_DWORD *)buf = 138543874;
            id v92 = v72;
            __int16 v93 = 2112;
            id v94 = v55;
            __int16 v95 = 2114;
            id v96 = v61;
            _os_log_impl(&dword_0, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ there is no gateway with external ID \"%@\", dropping account %{public}@", buf, 0x20u);

            a3 = v64;
LABEL_67:
          }
          int v40 = 3;
          goto LABEL_57;
        }
        uint64_t v68 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v25 persistentID]);
        objc_msgSend(v66, "setObject:forKeyedSubscript:");
        v71 = 0;
      }
      else
      {
        if (!v23)
        {
          _HKInitializeLogging();
          __int16 v45 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
            sub_AECE8(v89, v45, v10, &v90);
          }
          id v46 = [v10 accountIdentifier];
          +[NSError hk_assignError:a3, 3, @"Received an account (%@) with neither gatewayExternalID nor signedClinicalDataIssuerIdentifier", v46 code format];

          id v24 = 0;
          int v40 = 1;
          goto LABEL_56;
        }
        id v82 = 0;
        long long v25 = +[HDSignedClinicalDataIssuerEntity issuerEntityWithIdentifier:v23 database:v5 error:&v82];
        id v24 = v82;
        if (!v25)
        {
          _HKInitializeLogging();
          uint64_t v49 = HKLogHealthRecords;
          if (v24)
          {
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              id v50 = *(void **)(v77 + 48);
              *(_DWORD *)buf = 138543874;
              id v92 = v50;
              __int16 v93 = 2112;
              id v94 = v74;
              __int16 v95 = 2114;
              id v96 = v24;
              _os_log_error_impl(&dword_0, v49, OS_LOG_TYPE_ERROR, "%{public}@ failed to find issuer \"%@\": %{public}@", buf, 0x20u);
              id v51 = v74;
LABEL_63:
              int v40 = 3;
              uint64_t v26 = 0;
              goto LABEL_58;
            }
          }
          else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
          {
            v58 = *(void **)(v77 + 48);
            __int16 v59 = v49;
            v60 = [v10 accountIdentifier];
            *(_DWORD *)buf = 138543874;
            id v92 = v58;
            a3 = v64;
            __int16 v93 = 2112;
            id v94 = v74;
            __int16 v95 = 2114;
            id v96 = v60;
            _os_log_impl(&dword_0, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ there is no issuer \"%@\", dropping account %{public}@", buf, 0x20u);

            id v51 = v74;
            goto LABEL_63;
          }
          int v40 = 3;
          goto LABEL_56;
        }
        v71 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v25 persistentID]);
        uint64_t v68 = 0;
      }

LABEL_26:
      uint64_t v27 = [*(id *)(v77 + 40) syncIdentityManager];
      id v28 = [v27 legacySyncIdentity];

      if ([v10 hasSyncIdentity])
      {
        v69 = v28;
        uint64_t v29 = [v10 syncIdentity];
        id v81 = v24;
        id v30 = +[HDSyncIdentity syncIdentityWithCodable:v29 error:&v81];
        id v31 = v81;

        if (!v30)
        {
          _HKInitializeLogging();
          BOOL v47 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v92 = v31;
            _os_log_fault_impl(&dword_0, v47, OS_LOG_TYPE_FAULT, "HDClinicalAccountEntity SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }
          int v40 = 3;
          id v39 = (void *)v68;
          uint64_t v41 = v69;
          goto LABEL_54;
        }
        id v32 = [*(id *)(v77 + 40) syncIdentityManager];
        id v80 = v31;
        id v28 = [v32 concreteIdentityForIdentity:v30 shouldCreate:1 transaction:v65 error:&v80];
        id v24 = v80;

        if (!v28)
        {
          _HKInitializeLogging();
          id v56 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v92 = v24;
            _os_log_fault_impl(&dword_0, v56, OS_LOG_TYPE_FAULT, "HDClinicalAccountEntity ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }
          uint64_t v41 = 0;
          int v40 = 3;
          id v31 = v24;
          id v39 = (void *)v68;
          goto LABEL_54;
        }
      }
      uint64_t v33 = *(void **)(v77 + 48);
      uint64_t v34 = *(void *)(v77 + 56);
      v70 = v28;
      uint64_t v35 = [v28 entity];
      id v36 = [v35 persistentID];
      uint64_t v37 = *(void *)(v77 + 40);
      id v79 = v24;
      BOOL v38 = v10;
      id v39 = (void *)v68;
      LOBYTE(v33) = [v33 _insertOrUpdateAccountWithCodableAccount:v38 gatewayID:v68 signedClinicalDataIssuerID:v71 syncProvenance:v34 syncIdentity:v36 transaction:v65 profile:v37 error:&v79];
      id v31 = v79;

      if ((v33 & 1) == 0)
      {
        _HKInitializeLogging();
        uint64_t v42 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
        {
          __int16 v43 = *(void **)(v77 + 48);
          *(_DWORD *)buf = 138543618;
          id v92 = v43;
          __int16 v93 = 2114;
          id v94 = v31;
          _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "%{public}@ failed to insert codable clinical account: %{public}@", buf, 0x16u);
        }
        id v44 = v31;
        id v30 = v44;
        uint64_t v41 = v70;
        if (v44)
        {
          if (v64)
          {
            id v30 = v44;
            *__int16 v64 = v30;
            int v40 = 1;
            id v31 = v30;
LABEL_54:

            goto LABEL_55;
          }
          _HKLogDroppedError();
        }
        int v40 = 1;
        id v31 = v30;
        goto LABEL_54;
      }
      int v40 = 0;
      uint64_t v41 = v70;
LABEL_55:

      id v24 = v31;
      a3 = v64;
LABEL_56:
      uint64_t v26 = v73;
LABEL_57:
      id v51 = v74;
LABEL_58:

      a1 = v77;
      id v7 = v15;
      uint64_t v8 = v75;
      id v5 = v67;
      if (v40 && v40 != 3) {
        goto LABEL_72;
      }
LABEL_15:
      uint64_t v9 = (char *)v9 + 1;
    }
    while (v7 != v9);
    id v62 = [obj countByEnumeratingWithState:&v85 objects:v97 count:16];
    id v7 = v62;
  }
  while (v62);
LABEL_70:
  int v40 = 0;
LABEL_72:

  return v40 == 0;
}

id sub_48BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDClinicalAccountInsertCodableJournalEntry alloc] initWithCodableAccounts:*(void *)(a1 + 32) syncProvenance:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 40) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

void sub_49C88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

id sub_49CAC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 32))
  {
    id v6 = +[HDClinicalGatewayEntity entityWithPersistentID:](HDClinicalGatewayEntity, "entityWithPersistentID:");
    id v7 = v6;
    if (v6
      && ![v6 setNeedsSyncWithProfile:*(void *)(a1 + 40) transaction:v5 error:a3])
    {

      id v29 = 0;
      goto LABEL_23;
    }
  }
  uint64_t v8 = HKDateMax();
  uint64_t v9 = *(void **)(a1 + 176);
  id v10 = [v9 _propertiesForEntity];
  uint64_t v11 = *(void *)(a1 + 40);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_4A150;
  v41[3] = &unk_1135B8;
  long long v59 = *(_OWORD *)(a1 + 168);
  id v12 = v5;
  id v42 = v12;
  id v43 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  char v63 = *(unsigned char *)(a1 + 208);
  uint64_t v14 = *(void *)(a1 + 184);
  id v44 = v13;
  uint64_t v60 = v14;
  id v45 = *(id *)(a1 + 80);
  id v15 = v8;
  id v46 = v15;
  id v47 = *(id *)(a1 + 56);
  id v48 = *(id *)(a1 + 88);
  id v49 = *(id *)(a1 + 96);
  id v50 = *(id *)(a1 + 104);
  id v51 = *(id *)(a1 + 112);
  id v52 = *(id *)(a1 + 120);
  id v53 = *(id *)(a1 + 128);
  id v54 = *(id *)(a1 + 136);
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 192);
  id v55 = v16;
  uint64_t v61 = v17;
  id v56 = *(id *)(a1 + 144);
  id v18 = *(id *)(a1 + 152);
  uint64_t v19 = *(void *)(a1 + 200);
  id v57 = v18;
  uint64_t v62 = v19;
  id v58 = *(id *)(a1 + 160);
  LODWORD(v9) = [v9 _bindPropertiesForSync:v10 profile:v11 transaction:v12 error:a3 mutationHandler:v41];

  if (v9)
  {
    id v20 = *(void **)(*(void *)(*(void *)(a1 + 168) + 8) + 40);
    id v21 = [v12 databaseForEntity:v20];
    uint64_t v22 = [v20 accountInDatabase:v21 error:a3];

    if (v22)
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_4A720;
      v38[3] = &unk_1135E0;
      uint64_t v40 = *(void *)(a1 + 176);
      id v23 = v22;
      id v39 = v23;
      [v12 onCommit:v38 orRollback:0];
      uint64_t v35 = *(void **)(a1 + 176);
      uint64_t v36 = *(void *)(a1 + 64);
      uint64_t v37 = [v23 gateway];
      id v24 = [v37 externalID];
      long long v25 = v24;
      if (!v24)
      {
        uint64_t v33 = [v23 signedClinicalDataIssuer];
        long long v25 = [v33 identifier];
      }
      uint64_t v26 = [v23 gateway];
      uint64_t v27 = [v26 title];
      if (v27)
      {
        unsigned int v28 = [v35 updateSourcesForAccountWithIdentifier:v36 wasAccountInsert:1 clinicalExternalID:v25 externalTitle:v27 profile:*(void *)(a1 + 40) error:a3];
      }
      else
      {
        id v32 = [v23 signedClinicalDataIssuer];
        [v32 title];
        id v30 = v34 = v15;
        unsigned int v28 = [v35 updateSourcesForAccountWithIdentifier:v36 wasAccountInsert:1 clinicalExternalID:v25 externalTitle:v30 profile:*(void *)(a1 + 40) error:a3];

        id v15 = v34;
      }

      if (!v24)
      {
      }
      if (v28) {
        id v29 = [*(id *)(a1 + 176) _updateCountOfGatewayBackedAccountsWithProfile:*(void *)(a1 + 40) error:a3];
      }
      else {
        id v29 = 0;
      }
    }
    else
    {
      id v29 = 0;
    }
  }
  else
  {
    id v29 = 0;
  }

LABEL_23:
  return v29;
}

BOOL sub_4A150(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = *(void **)(a1 + 176);
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = a2;
  uint64_t v11 = [v9 protectedDatabase];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_4A3D4;
  v22[3] = &unk_113590;
  id v23 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  char v43 = *(unsigned char *)(a1 + 208);
  uint64_t v13 = *(void *)(a1 + 184);
  id v24 = v12;
  uint64_t v40 = v13;
  id v25 = *(id *)(a1 + 56);
  id v26 = *(id *)(a1 + 64);
  id v27 = *(id *)(a1 + 72);
  id v28 = *(id *)(a1 + 80);
  id v29 = *(id *)(a1 + 88);
  id v30 = *(id *)(a1 + 96);
  id v31 = *(id *)(a1 + 104);
  id v32 = *(id *)(a1 + 112);
  id v33 = *(id *)(a1 + 120);
  id v34 = *(id *)(a1 + 128);
  id v14 = *(id *)(a1 + 136);
  uint64_t v15 = *(void *)(a1 + 192);
  id v35 = v14;
  uint64_t v41 = v15;
  id v36 = *(id *)(a1 + 144);
  id v37 = *(id *)(a1 + 152);
  id v39 = v7;
  uint64_t v42 = *(void *)(a1 + 200);
  id v38 = *(id *)(a1 + 160);
  id v16 = v7;
  uint64_t v17 = [v8 insertOrReplaceEntity:0 database:v11 properties:v10 error:a4 bindingHandler:v22];

  uint64_t v18 = *(void *)(*(void *)(a1 + 168) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  BOOL v20 = *(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) != 0;
  return v20;
}

uint64_t sub_4A3D4(uint64_t a1)
{
  HDSQLiteBindUUIDToProperty();
  HDSQLiteBindUUIDToProperty();
  HDSQLiteBindBooleanToProperty();
  id v2 = +[NSNumber numberWithInteger:*(void *)(a1 + 168)];
  HDSQLiteBindNumberToProperty();

  HDSQLiteBindDateToProperty();
  HDSQLiteBindDateToProperty();
  HDSQLiteBindDateToProperty();
  HDSQLiteBindDateToProperty();
  HDSQLiteBindNumberToProperty();
  HDSQLiteBindNumberToProperty();
  HDSQLiteBindNumberToProperty();
  HDSQLiteBindNumberToProperty();
  HDSQLiteBindNumberToProperty();
  HDSQLiteBindStringToProperty();
  HDSQLiteBindNumberToProperty();
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindNumberToProperty();
  id v3 = [*(id *)(a1 + 144) lastSharedDate];
  HDSQLiteBindDateToProperty();

  uint64_t v4 = [*(id *)(a1 + 144) firstSharedDate];
  HDSQLiteBindDateToProperty();

  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 144) userStatus]);
  HDSQLiteBindNumberToProperty();

  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 144) multiDeviceStatus]);
  HDSQLiteBindNumberToProperty();

  id v7 = [*(id *)(a1 + 144) primaryDeviceName];
  HDSQLiteBindStringToProperty();

  (*(void (**)(void))(*(void *)(a1 + 160) + 16))();
  HDSQLiteBindInt64ToProperty();

  return HDSQLiteBindDateToProperty();
}

void sub_4A720(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) hkAccount];
  [v1 _postAccountChangeNotificationForAccount:v2 changeType:1];
}

void sub_4AB30(uint64_t a1)
{
  [*(id *)(a1 + 32) modificationDate];
  +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(a1 + 32) hasLastFetchDate])
  {
    [*(id *)(a1 + 32) lastFetchDate];
    id v2 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v2 = 0;
  }
  if ([*(id *)(a1 + 32) hasLastFullFetchDate])
  {
    [*(id *)(a1 + 32) lastFullFetchDate];
    id v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = HKDateMax();
  if ([*(id *)(a1 + 32) hasLastFailedFetchDate])
  {
    [*(id *)(a1 + 32) lastFailedFetchDate];
    id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v5 = 0;
  }
  HDSQLiteBindDateToProperty();
  [*(id *)(a1 + 32) userEnabled];
  HDSQLiteBindBooleanToProperty();
  HDSQLiteBindDateToProperty();
  HDSQLiteBindDateToProperty();
  HDSQLiteBindDateToProperty();
  id v6 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [*(id *)(a1 + 32) failedFetchAttemptsCount]);
  HDSQLiteBindNumberToProperty();

  id v7 = [*(id *)(a1 + 32) patientHash];
  HDSQLiteBindStringToProperty();

  if ([*(id *)(a1 + 32) hasClinicalSharingFirstSharedDate])
  {
    [*(id *)(a1 + 32) clinicalSharingFirstSharedDate];
    uint64_t v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([*(id *)(a1 + 32) hasClinicalSharingLastSharedDate])
  {
    [*(id *)(a1 + 32) clinicalSharingLastSharedDate];
    uint64_t v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    uint64_t v9 = 0;
  }
  HDSQLiteBindDateToProperty();
  HDSQLiteBindDateToProperty();
  id v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [*(id *)(a1 + 32) clinicalSharingUserStatus]);
  HDSQLiteBindNumberToProperty();

  uint64_t v11 = [*(id *)(a1 + 32) clinicalSharingPrimaryDeviceName];
  HDSQLiteBindStringToProperty();
}

void sub_4AE64(uint64_t a1)
{
  id v2 = objc_opt_class();
  id v3 = [*(id *)(a1 + 40) hkAccount];
  [v2 _postAccountChangeNotificationForAccount:v3 changeType:2];
}

uint64_t sub_4B19C(uint64_t result)
{
  uint64_t v1 = (void *)result;
  id v2 = *(void **)(result + 32);
  if (v2)
  {
    id v3 = +[NSDate distantPast];
    unsigned int v4 = [v2 isEqual:v3];

    if (v4) {
      uint64_t result = HDSQLiteBindNullToProperty();
    }
    else {
      uint64_t result = HDSQLiteBindDateToProperty();
    }
  }
  id v5 = (void *)v1[5];
  if (v5)
  {
    id v6 = +[NSDate distantPast];
    unsigned int v7 = [v5 isEqual:v6];

    if (v7) {
      uint64_t result = HDSQLiteBindNullToProperty();
    }
    else {
      uint64_t result = HDSQLiteBindDateToProperty();
    }
  }
  if (v1[6]) {
    uint64_t result = HDSQLiteBindNumberToProperty();
  }
  if (v1[7]) {
    uint64_t result = HDSQLiteBindNumberToProperty();
  }
  if (v1[8])
  {
    return HDSQLiteBindStringToProperty();
  }
  return result;
}

void sub_4B2F0(uint64_t a1)
{
  id v2 = objc_opt_class();
  id v3 = [*(id *)(a1 + 40) hkAccount];
  [v2 _postAccountChangeNotificationForAccount:v3 changeType:2];
}

uint64_t sub_4B4A0()
{
  return HDSQLiteBindBooleanToProperty();
}

uint64_t sub_4B614()
{
  return HDSQLiteBindStringToProperty();
}

id sub_4B820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 56) _updateAccountCredentialState:*(void *)(a1 + 64) identifier:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) transaction:a2 event:*(void *)(a1 + 48) alwaysRecordEvent:0 error:a3];
}

id sub_4B860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 64);
  id v6 = [*(id *)(a1 + 32) eventMarkedAsFailedWithError:a2];
  [v5 _journalAccountEvent:v6 database:*(void *)(a1 + 40)];

  unsigned int v7 = [[HDClinicalAccountUpdateCredentialStateJournalEntry alloc] initWithCredentialState:*(void *)(a1 + 72) accountIdentifier:*(void *)(a1 + 48) event:*(void *)(a1 + 56)];
  id v8 = [*(id *)(a1 + 40) addJournalEntry:v7 error:a3];

  return v8;
}

void sub_4BC1C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) hkAccount];
  [v1 _postAccountChangeNotificationForAccount:v2 changeType:2];
}

BOOL sub_4BE9C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v5 protectedDatabase];
  uint64_t v9 = [v6 existingAccountEntityWithIdentifier:v7 database:v8 error:a3];

  if ([v9 updateUserEnabled:*(unsigned __int8 *)(a1 + 56) profile:*(void *)(a1 + 40) transaction:v5 error:a3])
  {
    id v10 = [v5 protectedDatabase];
    uint64_t v11 = [v9 accountInDatabase:v10 error:a3];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4BFE8;
  v15[3] = &unk_1135E0;
  uint64_t v12 = *(void *)(a1 + 48);
  id v16 = v11;
  uint64_t v17 = v12;
  id v13 = v11;
  [v5 onCommit:v15 orRollback:0];

  return v13 != 0;
}

void sub_4BFE8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) hkAccount];
  [v1 _postAccountChangeNotificationForAccount:v2 changeType:2];
}

id sub_4C040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDClinicalAccountUpdateUserEnabledJournalEntry alloc] initWithUserEnabled:*(unsigned __int8 *)(a1 + 48) accountIdentifier:*(void *)(a1 + 32)];
  id v6 = [*(id *)(a1 + 40) addJournalEntry:v5 error:a3];

  return v6;
}

uint64_t sub_4C268()
{
  HDSQLiteBindDateToProperty();
  HDSQLiteBindDateToProperty();

  return HDSQLiteBindNumberToProperty();
}

uint64_t sub_4C5B4()
{
  HDSQLiteBindDateToProperty();
  HDSQLiteBindDateToProperty();
  HDSQLiteBindDateToProperty();

  return HDSQLiteBindNumberToProperty();
}

uint64_t sub_4C88C()
{
  HDSQLiteBindDateToProperty();

  return HDSQLiteBindNumberToProperty();
}

BOOL sub_4CD24(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v5 protectedDatabase];
  uint64_t v9 = [v6 existingAccountEntityWithIdentifier:v7 database:v8 error:a3];

  if ([v9 _updateLastFetchDate:*(void *)(a1 + 40) wasFullFetch:*(unsigned __int8 *)(a1 + 64) profile:*(void *)(a1 + 48) transaction:v5 error:a3])
  {
    id v10 = [v5 protectedDatabase];
    uint64_t v11 = [v9 accountInDatabase:v10 error:a3];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4CE70;
  v15[3] = &unk_1135E0;
  uint64_t v12 = *(void *)(a1 + 56);
  id v16 = v11;
  uint64_t v17 = v12;
  id v13 = v11;
  [v5 onCommit:v15 orRollback:0];

  return v13 != 0;
}

void sub_4CE70(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) hkAccount];
  [v1 _postAccountChangeNotificationForAccount:v2 changeType:2];
}

id sub_4CEC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDClinicalAccountUpdateLastFetchDateJournalEntry alloc] initWithLastFetchDate:*(void *)(a1 + 32) wasFullFetch:*(unsigned __int8 *)(a1 + 56) accountIdentifier:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 48) addJournalEntry:v5 error:a3];

  return v6;
}

uint64_t sub_4D034(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)a1[7];
  uint64_t v7 = a1[4];
  id v8 = [v5 protectedDatabase];
  uint64_t v9 = [v6 existingAccountEntityWithIdentifier:v7 database:v8 error:a3];

  if (v9)
  {
    if (![v9 _updateLastFullFetchDateWithLastFetchDate:a1[5] lastFullFetchDate:a1[5] profile:a1[6] transaction:v5 error:a3])
    {
      uint64_t v14 = 0;
      goto LABEL_6;
    }
    id v10 = [v5 protectedDatabase];
    uint64_t v11 = [v9 accountInDatabase:v10 error:a3];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_4D180;
    v16[3] = &unk_1135E0;
    uint64_t v12 = a1[7];
    id v17 = v11;
    uint64_t v18 = v12;
    id v13 = v11;
    [v5 onCommit:v16 orRollback:0];
  }
  uint64_t v14 = 1;
LABEL_6:

  return v14;
}

void sub_4D180(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) hkAccount];
  [v1 _postAccountChangeNotificationForAccount:v2 changeType:2];
}

BOOL sub_4D1D8(id a1, NSError *a2, id *a3)
{
  return 1;
}

BOOL sub_4D3B0(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)a1[8];
  uint64_t v7 = a1[4];
  id v8 = [v5 protectedDatabase];
  uint64_t v9 = [v6 existingAccountEntityWithIdentifier:v7 database:v8 error:a3];

  if ([v9 _updateLastFailedFetchDate:a1[5] overrideFailedAttemptsCount:a1[6] profile:a1[7] transaction:v5 error:a3])
  {
    id v10 = [v5 protectedDatabase];
    uint64_t v11 = [v9 accountInDatabase:v10 error:a3];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4D4FC;
  v15[3] = &unk_1135E0;
  uint64_t v12 = a1[8];
  id v16 = v11;
  uint64_t v17 = v12;
  id v13 = v11;
  [v5 onCommit:v15 orRollback:0];

  return v13 != 0;
}

void sub_4D4FC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) hkAccount];
  [v1 _postAccountChangeNotificationForAccount:v2 changeType:2];
}

id sub_4D554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDClinicalAccountUpdateLastFailedFetchDateJournalEntry alloc] initWithLastFailedFetchDate:*(void *)(a1 + 32) overrideFailedAttemptsCount:*(void *)(a1 + 40) accountIdentifier:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 56) addJournalEntry:v5 error:a3];

  return v6;
}

id sub_4D728(void *a1, void *a2, uint64_t a3)
{
  id v5 = (void *)a1[7];
  uint64_t v6 = a1[4];
  id v7 = a2;
  id v8 = [v7 protectedDatabase];
  uint64_t v9 = [v5 existingAccountEntityWithIdentifier:v6 database:v8 error:a3];

  id v10 = [v9 updateProperties:a1[5] profile:a1[6] transaction:v7 error:a3 bindingHandler:&stru_1137B0];
  return v10;
}

void sub_4D7C4(id a1, HDSQLiteStatementBinder *a2)
{
  HDSQLiteBindDateToProperty();

  HDSQLiteBindDateToProperty();
}

uint64_t sub_4D998()
{
  HDSQLiteBindNumberToProperty();

  return HDSQLiteBindNumberToProperty();
}

BOOL sub_4DBC8(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)a1[8];
  uint64_t v7 = a1[4];
  id v8 = [v5 protectedDatabase];
  uint64_t v9 = [v6 existingAccountEntityWithIdentifier:v7 database:v8 error:a3];

  if ([v9 _updateLastExtractedRowID:a1[5] rulesVersion:a1[6] profile:a1[7] transaction:v5 error:a3])
  {
    id v10 = [v5 protectedDatabase];
    uint64_t v11 = [v9 accountInDatabase:v10 error:a3];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4DD14;
  v15[3] = &unk_1135E0;
  uint64_t v12 = a1[8];
  id v16 = v11;
  uint64_t v17 = v12;
  id v13 = v11;
  [v5 onCommit:v15 orRollback:0];

  return v13 != 0;
}

void sub_4DD14(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) hkAccount];
  [v1 _postAccountChangeNotificationForAccount:v2 changeType:2];
}

id sub_4DD6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDClinicalAccountUpdateLastExtractedJournalEntry alloc] initWithLastExtractedRowID:*(void *)(a1 + 32) rulesVersion:*(void *)(a1 + 40) accountIdentifier:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 56) addJournalEntry:v5 error:a3];

  return v6;
}

uint64_t sub_4DF4C()
{
  return HDSQLiteBindNumberToProperty();
}

id sub_4E110(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  id v6 = [*(id *)(a1 + 56) existingAccountEntityWithIdentifier:*(void *)(a1 + 32) database:v5 error:a3];
  id v7 = [v6 updateLastSubmittedRowID:*(void *)(a1 + 40) expectedRulesVersion:*(void *)(a1 + 48) database:v5 error:a3];

  return v7;
}

id sub_4E18C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDClinicalAccountUpdateLastSubmittedJournalEntry alloc] initWithLastSubmittedRowID:*(void *)(a1 + 32) expectedRulesVersion:*(void *)(a1 + 40) accountIdentifier:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 56) addJournalEntry:v5 error:a3];

  return v6;
}

id sub_4E384(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1[7];
  id v6 = a2;
  id v7 = [v6 databaseForEntityClass:v5];
  id v8 = [(id)a1[7] existingAccountEntityWithIdentifier:a1[4] database:v7 error:a3];
  id v9 = [v8 _updateLastExtractedRowID:0 rulesVersion:a1[5] profile:a1[6] transaction:v6 error:a3];

  return v9;
}

id sub_4E418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [[HDClinicalAccountUpdateLastExtractedJournalEntry alloc] initWithLastExtractedRowID:0 rulesVersion:*(void *)(a1 + 32) accountIdentifier:*(void *)(a1 + 40)];
  id v6 = [[HDClinicalAccountUpdateLastSubmittedJournalEntry alloc] initWithLastSubmittedRowID:0 expectedRulesVersion:*(void *)(a1 + 32) accountIdentifier:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) addJournalEntry:v5 error:a3]) {
    id v7 = [*(id *)(a1 + 48) addJournalEntry:v6 error:a3];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

id sub_4E5C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v5 protectedDatabase];
  id v9 = [v6 existingAccountEntityWithIdentifier:v7 database:v8 error:a3];

  if (v9
    && [v9 deleteCredentialWithProfile:*(void *)(a1 + 40) transaction:v5 deleteTokens:1 credentialIdentifier:0 error:a3])
  {
    uint64_t v10 = HDClinicalAccountEntityPropertyGatewayExternalID;
    uint64_t v11 = [v5 protectedDatabase];
    uint64_t v12 = [v9 stringForProperty:v10 database:v11];

    uint64_t v13 = HDClinicalAccountEntityPropertySignedClinicalDataIssuerROWID;
    uint64_t v14 = [v5 protectedDatabase];
    uint64_t v15 = [v9 numberForProperty:v13 database:v14];

    if (v15)
    {
      id v16 = +[HDSignedClinicalDataIssuerEntity entityWithPersistentID:v15];
      uint64_t v17 = HDSignedClinicalDataIssuerEntityPropertyIdentifier;
      uint64_t v18 = [v5 protectedDatabase];
      uint64_t v19 = [v16 stringForProperty:v17 database:v18];
    }
    else
    {
      id v16 = 0;
      uint64_t v19 = 0;
    }
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_4ECD8;
    v72[3] = &unk_1137D8;
    uint64_t v76 = *(void *)(a1 + 48);
    id v73 = *(id *)(a1 + 32);
    id v69 = v12;
    id v74 = v69;
    id v21 = v19;
    id v75 = v21;
    [v5 onCommit:v72 orRollback:0];
    uint64_t v22 = [*(id *)(a1 + 40) sourceManager];
    uint64_t v23 = *(void *)(a1 + 32);
    id v71 = 0;
    id v24 = [v22 privateSourceForClinicalAccountIdentifier:v23 provenance:0 createOrUpdateIfNecessary:0 nameOnCreateOrUpdate:0 error:&v71];
    id v25 = v71;

    id v68 = v25;
    if (v24)
    {
      id v65 = v21;
      id v26 = [v24 sourceWithProfile:*(void *)(a1 + 40) error:a3];
      if (!v26) {
        goto LABEL_11;
      }
      [*(id *)(a1 + 40) sourceManager];
      id v27 = v62 = v15;
      [v26 bundleIdentifier];
      v29 = id v28 = v16;
      unsigned __int8 v30 = [v27 deleteSourceWithBundleIdentifier:v29 error:a3];

      id v16 = v28;
      uint64_t v15 = v62;
      if ((v30 & 1) == 0)
      {
LABEL_11:

        id v20 = 0;
        id v21 = v65;
        id v31 = v68;
LABEL_51:

        goto LABEL_52;
      }

      id v21 = v65;
    }
    else
    {
      if (v25)
      {
        id v31 = v25;
        if (a3)
        {
          id v20 = 0;
          *a3 = v25;
        }
        else
        {
          _HKLogDroppedError();
          id v20 = 0;
        }
        goto LABEL_51;
      }
      _HKInitializeLogging();
      id v32 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = *(void *)(a1 + 48);
        uint64_t v34 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v78 = v33;
        __int16 v79 = 2114;
        uint64_t v80 = v34;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: asked to delete account with identifier %{public}@, but no corresponding account source entity to delete. Continuing.", buf, 0x16u);
      }
    }
    uint64_t v61 = v16;
    id v35 = v69;
    if (!v69) {
      id v35 = v21;
    }
    id v36 = v35;
    if (!v36)
    {
LABEL_32:
      id v49 = [v5 protectedDatabase];
      id v20 = [v9 deleteFromDatabase:v49 error:a3];

      if (v20)
      {
        id v16 = v61;
        if (v69 && *(unsigned char *)(a1 + 56))
        {
          __int16 v64 = v15;
          id v67 = v21;
          uint64_t v50 = HDClinicalAccountEntityPropertyGatewayID;
          id v51 = [v5 protectedDatabase];
          id v52 = [v9 numberForProperty:v50 database:v51];

          if (v52)
          {
            id v53 = +[HDClinicalGatewayEntity entityWithPersistentID:v52];
            id v54 = [v5 protectedDatabase];
            unsigned int v55 = [v53 deleteFromDatabase:v54 error:a3];

            id v21 = v67;
            if (!v55)
            {

              id v20 = 0;
              uint64_t v15 = v64;
              goto LABEL_38;
            }
          }
          else
          {
            _HKInitializeLogging();
            id v56 = (void *)HKLogHealthRecords;
            id v21 = v67;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
              sub_AEE9C(v56);
            }
          }

          id v16 = v61;
          uint64_t v15 = v64;
        }
        if (!v16
          || !*(unsigned char *)(a1 + 57)
          || ([v5 protectedDatabase],
              id v57 = objc_claimAutoreleasedReturnValue(),
              id v20 = [v61 deleteFromDatabase:v57 error:a3],
              v57,
              id v16 = v61,
              v20))
        {
          id v20 = [*(id *)(a1 + 48) _updateCountOfGatewayBackedAccountsWithProfile:*(void *)(a1 + 40) error:a3];
        }
        goto LABEL_49;
      }
LABEL_38:
      id v16 = v61;
LABEL_49:
      id v31 = v68;
      goto LABEL_50;
    }
    id v37 = [*(id *)(a1 + 40) sourceManager];
    id v70 = 0;
    id v66 = v36;
    id v38 = [v37 publicSourceForClinicalExternalIdentifier:v36 provenance:0 createOrUpdateIfNecessary:0 nameOnCreateOrUpdate:0 error:&v70];
    id v39 = v70;

    uint64_t v40 = v38;
    if (v38)
    {
      uint64_t v60 = v39;
      char v63 = v15;
      uint64_t v41 = [v38 sourceWithProfile:*(void *)(a1 + 40) error:a3];
      if (v41)
      {
        uint64_t v42 = [*(id *)(a1 + 40) sourceManager];
        [v41 bundleIdentifier];
        long long v59 = v24;
        v44 = id v43 = v21;
        unsigned __int8 v45 = [v42 deleteSourceWithBundleIdentifier:v44 error:a3];

        id v21 = v43;
        id v24 = v59;

        if (v45)
        {

          uint64_t v15 = v63;
          uint64_t v40 = v38;
LABEL_31:

          id v36 = v66;
          goto LABEL_32;
        }
      }

      id v16 = v61;
      uint64_t v15 = v63;
      id v31 = v68;
      id v39 = v60;
    }
    else
    {
      if (!v39)
      {
        uint64_t v60 = 0;
        _HKInitializeLogging();
        id v46 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v47 = *(void *)(a1 + 48);
          uint64_t v48 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v78 = v47;
          __int16 v79 = 2114;
          uint64_t v80 = v48;
          _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: asked to delete account with identifier %{public}@, but no corresponding public source entity to delete. Continuing.", buf, 0x16u);
        }
        goto LABEL_31;
      }
      if (a3) {
        *a3 = v39;
      }
      else {
        _HKLogDroppedError();
      }
      id v16 = v61;
      id v31 = v68;
    }

    id v20 = 0;
    id v36 = v66;
LABEL_50:

    goto LABEL_51;
  }
  id v20 = 0;
LABEL_52:

  return v20;
}

void sub_4ECD8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 56) _hkAccountRepresentingDeletedAccountWithIdentifier:*(void *)(a1 + 32) gatewayExternalID:*(void *)(a1 + 40) signedClinicalDataIssuerID:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) _postAccountChangeNotificationForAccount:v2 changeType:3];
}

void sub_4F4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_4F4F8(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v16 = +[HDClinicalAccountEntity _propertiesForCodable];
  id v5 = [v16 arrayByAddingObject:HDClinicalAccountEntityPropertySyncIdentity];
  id v6 = [*(id *)(a1 + 64) _syncObjectsGenerationPredicate];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) database];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_4F674;
  v17[3] = &unk_111758;
  id v18 = *(id *)(a1 + 40);
  id v19 = v4;
  id v20 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  id v12 = v4;
  id v13 = +[HDClinicalAccountEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDClinicalAccountEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v5, v6, v8, v11, v10, 0, v7, v9, a3, v17);

  return v13;
}

BOOL sub_4F674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = +[HDClinicalAccountEntity _codableWithRow:a4 error:a8];
  if (v10)
  {
    uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
    id v12 = [*(id *)(a1 + 32) syncIdentityManager];
    id v13 = [v12 identityForEntityID:v11 transaction:*(void *)(a1 + 40) error:a8];

    BOOL v14 = v13 != 0;
    if (v13)
    {
      uint64_t v15 = [v13 identity];
      id v16 = [v15 codableSyncIdentity];
      [v10 setSyncIdentity:v16];

      [*(id *)(a1 + 48) addObject:v10];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

id sub_4FA5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = HKSafeObject();

  id v5 = 0;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) _shouldInsertReceivedCodableAccount:v4];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AEF34(a1, v7, (uint64_t)v5);
    }
    id v6 = 0;
  }

  return v6;
}

id sub_53A4C(uint64_t a1, void *a2)
{
  return [a2 profileExtension:*(void *)(a1 + 32) healthRecordsSupported:*(unsigned __int8 *)(a1 + 40)];
}

void sub_53D2C(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  id v2 = [*(id *)(a1 + 32) createHealthRecordsIngestionServiceClient];
  uint64_t v3 = *(void *)(v1 + 8);
  id v4 = [*(id *)v1 profile];
  id v10 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_53E54;
  v8[3] = &unk_113870;
  id v5 = v2;
  id v9 = v5;
  LOBYTE(v3) = +[HDOriginalSignedClinicalDataRecordEntity enumerateActiveRecordsForAccountIdentifier:v3 profile:v4 error:&v10 block:v8];
  id v6 = v10;

  if ((v3 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AF2A4((void *)v1, (uint64_t)v6, v7);
    }
  }
}

id sub_53E54(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didUpdateSignedClinicalDataRecord:a2];
}

id sub_54598(uint64_t a1, void *a2)
{
  return [a2 profileExtension:*(void *)(a1 + 32) accountEventOccurred:*(void *)(a1 + 40)];
}

id sub_54E5C(id a1)
{
  return a1;
}

uint64_t sub_5543C()
{
  HDSQLiteBindUUIDToProperty();
  HDSQLiteBindDateToProperty();
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindInt64ToProperty();

  return HDSQLiteBindInt64ToProperty();
}

id sub_55844(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 32;
  id v2 = *(void **)(a1 + 32);
  id v8 = 0;
  id v4 = [v2 _validateCodableDeletedAccount:a2 error:&v8];
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AF6A8(v3, v6, (uint64_t)v5);
    }
  }

  return v4;
}

uint64_t sub_558D8(uint64_t a1, void *a2, uint64_t a3)
{
  id v28 = a2;
  id v4 = [v28 databaseForEntityClass:*(void *)(a1 + 48)];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = *(id *)(a1 + 32);
  id v33 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (!v33) {
    goto LABEL_20;
  }
  uint64_t v32 = *(void *)v37;
  id v27 = v4;
  uint64_t v31 = a1;
  do
  {
    for (i = 0; i != v33; i = (char *)i + 1)
    {
      if (*(void *)v37 != v32) {
        objc_enumerationMutation(obj);
      }
      id v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      uint64_t v7 = [v6 syncIdentifier];
      id v8 = +[NSUUID hk_UUIDWithData:v7];

      [v6 deletionDate];
      id v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      id v10 = [v6 safeDeletionReason];
      uint64_t v11 = [*(id *)(a1 + 40) syncIdentityManager];
      id v12 = [v11 legacySyncIdentity];

      if ([v6 hasSyncIdentity])
      {
        id v13 = [v6 syncIdentity];
        id v35 = 0;
        BOOL v14 = +[HDSyncIdentity syncIdentityWithCodable:v13 error:&v35];
        id v15 = v35;

        if (v14)
        {
          id v16 = [*(id *)(v31 + 40) syncIdentityManager];
          id v34 = v15;
          uint64_t v17 = [v16 concreteIdentityForIdentity:v14 shouldCreate:1 transaction:v28 error:&v34];
          id v18 = v34;

          if (v17)
          {

            id v12 = (void *)v17;
            id v4 = v27;
            a1 = v31;
            goto LABEL_10;
          }
          _HKInitializeLogging();
          id v24 = HKLogHealthRecords;
          id v4 = v27;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v41 = v18;
            _os_log_fault_impl(&dword_0, v24, OS_LOG_TYPE_FAULT, "HDClinicalDeletedAccountEntity ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }
          id v12 = 0;
          id v15 = v18;
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v23 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v41 = v15;
            _os_log_fault_impl(&dword_0, v23, OS_LOG_TYPE_FAULT, "HDClinicalDeletedAccountEntity SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }
        }

        a1 = v31;
        goto LABEL_18;
      }
LABEL_10:
      id v19 = *(void **)(a1 + 48);
      uint64_t v20 = *(void *)(a1 + 56);
      id v21 = [v12 entity];
      unsigned __int8 v22 = objc_msgSend(v19, "_insertOrUpdateTombstoneWithSyncIdentifier:deletionDate:deletionReason:syncProvenance:syncIdentity:database:error:", v8, v9, v10, v20, objc_msgSend(v21, "persistentID"), v4, a3);

      if ((v22 & 1) == 0)
      {

        uint64_t v25 = 0;
        goto LABEL_21;
      }
LABEL_18:
    }
    id v33 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  }
  while (v33);
LABEL_20:
  uint64_t v25 = 1;
LABEL_21:

  return v25;
}

id sub_55C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDClinicalDeletedAccountJournalEntry alloc] initWithCodableDeletedAccounts:*(void *)(a1 + 32) syncProvenance:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 40) addJournalEntry:v5 error:a3];

  return v6;
}

void sub_56288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_562AC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[HDClinicalDeletedAccountEntity _propertiesForEntity];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_563F0;
  v15[3] = &unk_111758;
  id v16 = *(id *)(a1 + 40);
  id v17 = v5;
  id v18 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  id v12 = v5;
  id v13 = +[HDClinicalDeletedAccountEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDClinicalDeletedAccountEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v11, v10, 0, v7, v9, a3, v15);

  return v13;
}

BOOL sub_563F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = +[HDClinicalDeletedAccountEntity _codableWithRow:a4 error:a8];
  if (v10)
  {
    uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
    id v12 = [*(id *)(a1 + 32) syncIdentityManager];
    id v13 = [v12 identityForEntityID:v11 transaction:*(void *)(a1 + 40) error:a8];

    BOOL v14 = v13 != 0;
    if (v13)
    {
      id v15 = [v13 identity];
      id v16 = [v15 codableSyncIdentity];
      [v10 setSyncIdentity:v16];

      [*(id *)(a1 + 48) addObject:v10];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

id sub_56ACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = HKSafeObject();

  id v5 = 0;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) _shouldInsertReceivedCodableAccount:v4];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AF7D4((uint64_t)v5, v7);
    }
    id v6 = 0;
  }

  return v6;
}

void sub_57640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_57658(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_57668(uint64_t a1)
{
}

uint64_t sub_57670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)objc_opt_class() codableWithRow:a3 accountSyncIdentifier:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

void sub_5783C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_57854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)objc_opt_class() _credentialWithRow:a3];

  return _objc_release_x1();
}

id sub_57DA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a1 + 64;
  uint64_t v7 = [v5 databaseForEntityClass:*(void *)(a1 + 64)];
  uint64_t v8 = self;
  id v9 = [v5 databaseForEntityClass:v8];

  uint64_t v10 = +[HDClinicalAccountEntity existingAccountEntityWithSyncIdentifier:*(void *)(a1 + 32) database:v9 error:a3];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = [v10 accountInDatabase:v9 error:a3];
    if (!v12)
    {
      id v15 = 0;
LABEL_48:

      goto LABEL_49;
    }
    id v13 = [v11 credentialIDInDatabase:v9];
    if (v13)
    {
      BOOL v14 = +[HDFHIRCredentialEntity codableCredentialWithAccountSyncIdentifier:*(void *)(a1 + 32) persistentID:v13 database:v7 error:a3];
      if (*a3)
      {
        id v15 = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
    id v16 = *(void **)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    id v66 = 0;
    uint64_t v62 = v14;
    unsigned int v19 = [v16 _shouldReplaceCurrentCredential:v14 withIncomingCredential:v17 account:v12 profile:v18 recordEvent:&v66 error:a3];
    id v20 = v66;
    id v21 = v20;
    if (*a3)
    {
      id v15 = 0;
      BOOL v14 = v62;
LABEL_46:

      goto LABEL_47;
    }
    uint64_t v61 = v20;
    if (!v19)
    {
      uint64_t v42 = *(void *)(a1 + 48);
      id v63 = 0;
      int v43 = +[HDClinicalAccountEventEntity insertEvent:v20 profile:v42 error:&v63];
      id v44 = v63;
      if ((v43 & 1) == 0)
      {
        _HKInitializeLogging();
        unsigned __int8 v45 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_AF9A8(v6, v45, (uint64_t)v44);
        }
      }
      id v15 = &dword_0 + 1;
      BOOL v14 = v62;
      goto LABEL_44;
    }
    _HKInitializeLogging();
    unsigned __int8 v22 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = v22;
      id v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v68 = v25;
      __int16 v69 = 2114;
      uint64_t v70 = v26;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ will use incoming credential for account with sync identifier %{public}@ and delete the existing one", buf, 0x16u);
    }
    if (v62)
    {
      uint64_t v59 = *(void *)(a1 + 48);
      id v27 = [*(id *)(a1 + 56) identifier];
      id v55 = [v62 identifier];
      id v28 = +[NSUUID hk_UUIDWithData:v55];
      LODWORD(v59) = objc_msgSend(v11, "deleteCredentialWithProfile:transaction:deleteTokens:credentialIdentifier:error:", v59, v5, objc_msgSend(v27, "isEqual:", v28) ^ 1, 0, a3);

      if (!v59)
      {
        id v15 = 0;
        BOOL v14 = v62;
LABEL_45:
        id v21 = v61;
        goto LABEL_46;
      }
    }
    id v29 = [*(id *)(a1 + 48) syncIdentityManager];
    uint64_t v60 = [v29 legacySyncIdentity];

    if (![*(id *)(a1 + 40) hasSyncIdentity]) {
      goto LABEL_20;
    }
    unsigned __int8 v30 = [*(id *)(a1 + 40) syncIdentity];
    id v65 = 0;
    uint64_t v31 = +[HDSyncIdentity syncIdentityWithCodable:v30 error:&v65];
    id v56 = v65;

    if (v31)
    {
      id v51 = [*(id *)(a1 + 48) syncIdentityManager];
      id v64 = v56;
      uint64_t v47 = [v51 concreteIdentityForIdentity:v31 shouldCreate:1 transaction:v5 error:&v64];
      id v49 = v64;

      if (v47)
      {

        uint64_t v60 = (void *)v47;
LABEL_20:
        uint64_t v32 = *(void **)(a1 + 64);
        uint64_t v52 = *(void *)(a1 + 72);
        id v57 = *(id *)(a1 + 40);
        id v33 = [v60 entity];
        objc_msgSend(v32, "_insertCodableCredential:syncProvenance:syncIdentity:transaction:error:", v57, v52, objc_msgSend(v33, "persistentID"), v5, a3);
        id v34 = (id)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          id v15 = 0;
          BOOL v14 = v62;
LABEL_42:
          id v44 = v60;
          goto LABEL_43;
        }
        id v58 = v34;
        id v35 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v34 persistentID]);
        unsigned int v36 = [v11 assignCredentialWithPersistentID:v35 profile:*(void *)(a1 + 48) transaction:v5 error:a3];

        if (!v36)
        {
          id v15 = 0;
          BOOL v14 = v62;
          id v34 = v58;
          id v44 = v60;
LABEL_43:

LABEL_44:
          goto LABEL_45;
        }
        unsigned int v37 = [v12 credentialHasOutdatedScopes:*(void *)(a1 + 56)];
        uint64_t v38 = 2;
        if (!v37) {
          uint64_t v38 = 0;
        }
        uint64_t v50 = v38;
        [v12 credentialState];
        long long v39 = [v61 eventWithUpdatedCredentialStateBefore:HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState()];
        uint64_t v48 = [v39 eventWithUpdatedCredentialStateAfter:HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState()];

        id v53 = [*(id *)(a1 + 48) healthRecordsExtension];
        uint64_t v40 = [v53 accountManager];
        id v15 = [v40 updateCredentialStateForAccount:v12 state:v50 force:1 event:v48 error:a3];

        id v41 = v53;
        id v34 = v58;
        uint64_t v61 = (void *)v48;
        BOOL v14 = v62;
LABEL_41:

        goto LABEL_42;
      }
      id v54 = v31;
      _HKInitializeLogging();
      id v34 = v49;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_AF934();
      }
      uint64_t v60 = 0;
    }
    else
    {
      id v54 = 0;
      _HKInitializeLogging();
      id v34 = v56;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_AF8C0();
      }
    }
    BOOL v14 = v62;
    if (v34)
    {
      id v34 = v34;
      id v15 = 0;
      *a3 = v34;
    }
    else
    {
      id v15 = 0;
    }
    id v41 = v54;
    goto LABEL_41;
  }
  id v15 = 0;
LABEL_49:

  return v15;
}

id sub_583FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDFHIRCredentialInsertCodableJournalEntry alloc] initWithCodableCredential:*(void *)(a1 + 32) syncProvenance:*(void *)(a1 + 48)];
  uint64_t v6 = [*(id *)(a1 + 40) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

uint64_t sub_59088(uint64_t a1)
{
  HDSQLiteBindUUIDToProperty();
  HDSQLiteBindInt64ToProperty();
  [*(id *)(a1 + 40) receivedDate];
  id v2 = HDDecodeDateForValue();
  HDSQLiteBindDateToProperty();

  [*(id *)(a1 + 40) expirationDate];
  id v3 = HDDecodeDateForValue();
  HDSQLiteBindDateToProperty();

  id v4 = [*(id *)(a1 + 40) requestedScopeString];
  HDSQLiteBindStringToProperty();

  id v5 = [*(id *)(a1 + 40) scopeString];
  HDSQLiteBindStringToProperty();

  uint64_t v6 = [*(id *)(a1 + 40) patientID];
  HDSQLiteBindStringToProperty();

  [*(id *)(a1 + 40) deleted];
  HDSQLiteBindBooleanToProperty();

  return HDSQLiteBindInt64ToProperty();
}

void sub_59BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_59C00(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = a1[4];
  id v7 = [v5 protectedDatabase];
  uint64_t v8 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:v6 database:v7 error:a3];

  if (v8)
  {
    id v9 = [v5 databaseForEntityClass:objc_opt_class()];
    uint64_t v10 = +[HDOriginalFHIRResourceEntity maxPersistentIDWithPredicate:0 database:v9 error:a3];
    if (v10)
    {
      uint64_t v11 = HDOriginalFHIRResourceEntityPropertyAccountID;
      id v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 persistentID]);
      id v13 = +[HDSQLiteComparisonPredicate predicateWithProperty:v11 equalToValue:v12];

      BOOL v14 = +[HDOriginalFHIRResourceEntity countValueForProperty:HDSQLEntityPropertyStar predicate:v13 database:v9 error:a3];
      if (v14)
      {
        id v31 = v14;
        uint64_t v15 = HDSQLEntityPropertyPersistentID;
        unsigned __int8 v30 = v10;
        id v28 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDSQLEntityPropertyPersistentID lessThanOrEqualToValue:v10];
        id v29 = v13;
        v36[0] = v13;
        v36[1] = v28;
        id v16 = +[NSArray arrayWithObjects:v36 count:2];
        id v27 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v16];

        id v17 = [objc_alloc((Class)HDSQLiteOrderingTerm) initWithExpression:@"RANDOM()" ascending:0];
        id v26 = objc_alloc_init((Class)NSMutableArray);
        v35[0] = v15;
        v35[1] = HDOriginalFHIRResourceEntityPropertyExtractionHints;
        uint64_t v18 = +[NSArray arrayWithObjects:v35 count:2];
        id v34 = v17;
        unsigned int v19 = +[NSArray arrayWithObjects:&v34 count:1];
        [v31 floatValue];
        unint64_t v21 = vcvtms_s32_f32(v20 * 0.5);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_59FBC;
        v32[3] = &unk_1139A0;
        id v22 = v26;
        id v33 = v22;
        LODWORD(v21) = +[HDOriginalFHIRResourceEntity enumerateQueryResultsFromColumns:v18 properties:v18 predicate:v27 groupBy:0 orderingTerms:v19 limit:v21 database:v9 error:a3 enumerationHandler:v32];

        uint64_t v23 = 0;
        if (v21)
        {
          id v24 = +[HDOriginalFHIRResourceEntity addExtractionHints:4 toResourceEntities:v22 profile:a1[5] error:a3];

          if (v24)
          {
            *(void *)(*(void *)(a1[6] + 8) + 24) = [v22 count];
            uint64_t v23 = 1;
          }
          else
          {
            uint64_t v23 = 0;
          }
        }

        id v13 = v29;
        uint64_t v10 = v30;
        BOOL v14 = v31;
      }
      else
      {
        uint64_t v23 = 0;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

BOOL sub_59FBC(uint64_t a1)
{
  char v2 = HDSQLiteColumnWithNameAsInt64();
  if ((v2 & 4) == 0)
  {
    HDSQLiteColumnWithNameAsNumber();
    id v3 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    if (v3) {
      id v4 = v3;
    }
    else {
      id v4 = &off_11D1D0;
    }
    id v5 = +[HDOriginalFHIRResourceEntity entityWithPersistentID:v4];
    [*(id *)(a1 + 32) addObject:v5];
  }
  return (v2 & 4) == 0;
}

void sub_5A3DC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AFAD0(a1, v6, (uint64_t)v5);
    }
  }
}

void sub_5B470(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_AFC70(a1, (uint64_t)v3, v4);
  }
}

void sub_5CDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t sub_5CDFC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_5CE0C(uint64_t a1)
{
}

uint64_t sub_5CE14(uint64_t a1)
{
  char v2 = HDSQLiteColumnAsString();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v2];

  return 1;
}

void sub_5D140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_5D174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v10 = 0;
  uint64_t v4 = [(id)objc_opt_class() _gatewayWithRow:a3 error:&v10];
  id v5 = v10;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void sub_5D344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_5D35C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v6 = [*(id *)(a1 + 48) existingGatewayEntityWithExternalID:*(void *)(a1 + 32) database:v5 error:a3];
  uint64_t v7 = [v6 gatewayInDatabase:v5 error:a3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  BOOL v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  return v10;
}

uint64_t sub_5D7F0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *(id *)(a1 + 32);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      BOOL v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!objc_msgSend(*(id *)(a1 + 48), "insertOrUpdateGateway:database:profile:error:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v10), v5, *(void *)(a1 + 40), a3, (void)v13))
        {
          uint64_t v11 = 0;
          goto LABEL_11;
        }
        BOOL v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 1;
LABEL_11:

  return v11;
}

id sub_5D924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 48);
  id v7 = [*(id *)(a1 + 40) syncIdentityManager];
  id v8 = [v7 currentSyncIdentity];
  uint64_t v9 = [v8 identity];
  BOOL v10 = [v6 _codableGatewaysFromGateways:v5 syncIdentity:v9 error:a3];

  if (v10) {
    id v11 = [*(id *)(a1 + 48) _insertCodableGateways:v10 syncProvenance:0 profile:*(void *)(a1 + 40) error:a3];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

uint64_t sub_5DB40(id *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 databaseForEntityClass:a1[6]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1[4];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      BOOL v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!objc_msgSend(a1[6], "_updateGatewayIfExists:syncProvenance:syncIdentity:database:profile:error:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v10), 0, objc_msgSend(a1[5], "currentSyncIdentityPersistentID", (void)v13), v5, a1[5], a3))
        {
          uint64_t v11 = 0;
          goto LABEL_11;
        }
        BOOL v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 1;
LABEL_11:

  return v11;
}

id sub_5DC94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 48);
  id v7 = [*(id *)(a1 + 40) syncIdentityManager];
  id v8 = [v7 currentSyncIdentity];
  uint64_t v9 = [v8 identity];
  BOOL v10 = [v6 _codableGatewaysFromGateways:v5 syncIdentity:v9 error:a3];

  if (v10)
  {
    uint64_t v11 = [(HDClinicalGatewayCodableGatewaysJournalEntry *)[HDClinicalGatewayUpdateCodableGatewaysJournalEntry alloc] initWithCodableResources:v10 syncProvencance:0];
    uint64_t v12 = [*(id *)(a1 + 40) database];
    id v13 = [v12 addJournalEntry:v11 error:a3];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

BOOL sub_5DE38(id a1, HDSQLiteDatabase *a2, int64_t a3, NSNumber *a4, id *a5)
{
  return 1;
}

id sub_5E0A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 40) _insertGateway:*(void *)(a1 + 32) syncAnchor:a4 syncProvenance:*(void *)(a1 + 48) syncIdentity:*(void *)(a1 + 56) database:a2 error:a5];
}

id sub_5E224(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) externalID];
  HDSQLiteBindStringToProperty();

  [*(id *)(a1 + 32) lastReportedStatus];
  HDSQLiteBindInt64ToProperty();
  [*(id *)(a1 + 32) revision];
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindDataToProperty();
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);

  return [v5 _bindSyncAnchor:v6 syncProvenance:v7 syncIdentity:v8 binder:a2];
}

id sub_5E674(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) lastReportedStatus];
  HDSQLiteBindInt64ToProperty();
  [*(id *)(a1 + 32) revision];
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindDataToProperty();
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);

  return [v4 _bindSyncAnchor:v5 syncProvenance:v6 syncIdentity:v7 binder:a2];
}

uint64_t sub_5E938(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v5 = [*(id *)(a1 + 48) _gatewaysFromCodableGateways:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) transaction:v4];
  uint64_t v6 = [v4 databaseForEntityClass:*(void *)(a1 + 48)];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    id v18 = v4;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = *(void **)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 56);
        long long v14 = [v11 syncIdentity];
        long long v15 = [v14 entity];
        LODWORD(v11) = objc_msgSend(v12, "_insertOrUpdateGateway:syncProvenance:syncIdentity:database:profile:error:", v11, v13, objc_msgSend(v15, "persistentID"), v6, *(void *)(a1 + 40), a3);

        if (!v11)
        {
          uint64_t v16 = 0;
          goto LABEL_11;
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    uint64_t v16 = 1;
LABEL_11:
    id v4 = v18;
  }
  else
  {
    uint64_t v16 = 1;
  }

  return v16;
}

id sub_5EAEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [(HDClinicalGatewayCodableGatewaysJournalEntry *)[HDClinicalGatewayInsertCodableGatewaysJournalEntry alloc] initWithCodableResources:*(void *)(a1 + 32) syncProvencance:*(void *)(a1 + 48)];
  uint64_t v6 = [*(id *)(a1 + 40) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

uint64_t sub_5ECC8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unsigned int v19 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
  [*(id *)(a1 + 48) _gatewaysFromCodableGateways:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) transaction:v5];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    id v17 = v5;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = *(void **)(a1 + 48);
        uint64_t v12 = *(void *)(a1 + 56);
        uint64_t v13 = [v10 syncIdentity];
        long long v14 = [v13 entity];
        LODWORD(v10) = objc_msgSend(v11, "_updateGatewayIfExists:syncProvenance:syncIdentity:database:profile:error:", v10, v12, objc_msgSend(v14, "persistentID"), v19, *(void *)(a1 + 40), a3);

        if (!v10)
        {
          uint64_t v15 = 0;
          goto LABEL_11;
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    uint64_t v15 = 1;
LABEL_11:
    id v5 = v17;
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

id sub_5EE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [(HDClinicalGatewayCodableGatewaysJournalEntry *)[HDClinicalGatewayUpdateCodableGatewaysJournalEntry alloc] initWithCodableResources:*(void *)(a1 + 32) syncProvencance:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 40) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

uint64_t sub_5F018(uint64_t a1)
{
  char v2 = [(id)objc_opt_class() propertyForSyncAnchor];
  HDSQLiteBindNumberToProperty();

  id v3 = [(id)objc_opt_class() propertyForSyncProvenance];
  HDSQLiteBindInt64ToProperty();

  [*(id *)(a1 + 48) currentSyncIdentityPersistentID];

  return HDSQLiteBindInt64ToProperty();
}

void sub_60490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_604B4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = +[HDClinicalGatewayEntity _propertiesForCodable];
  id v6 = [*(id *)(a1 + 64) _syncObjectsGenerationPredicate];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) database];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_60610;
  v16[3] = &unk_111758;
  id v17 = *(id *)(a1 + 40);
  id v18 = v4;
  id v19 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  id v12 = v4;
  id v13 = +[HDClinicalGatewayEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDClinicalGatewayEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v5, v6, v8, v11, v10, 0, v7, v9, a3, v16);

  return v13;
}

BOOL sub_60610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = +[HDClinicalGatewayEntity _codableGatewayWithRow:a4 error:a8];
  if (v10)
  {
    uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
    id v12 = [*(id *)(a1 + 32) syncIdentityManager];
    id v13 = [v12 identityForEntityID:v11 transaction:*(void *)(a1 + 40) error:a8];

    BOOL v14 = v13 != 0;
    if (v13)
    {
      uint64_t v15 = [v13 identity];
      uint64_t v16 = [v15 codableSyncIdentity];
      [v10 setSyncIdentity:v16];

      [*(id *)(a1 + 48) addObject:v10];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

id sub_60A08(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = HKSafeObject();

  id v5 = 0;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 40) _shouldInsertReceivedCodableGateway:v4 profile:*(void *)(a1 + 32)];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AFF04(a1, v7, (uint64_t)v5);
    }
    id v6 = 0;
  }

  return v6;
}

void sub_613DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_61690(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = (void *)HKLogHealthRecords;
  if (v6)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B0294(a1, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_B0204(a1, v7);
    }
    uint64_t v8 = [*(id *)(a1 + 32) resultWithUpdatedSignedClinicalDataRecordsInParsingResult:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_61860(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = (void *)HKLogHealthRecords;
  if (!v6)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_B046C(a1, v7);
    }
    char v15 = 0;
    uint64_t v8 = *(void **)(a1 + 32);
    id v14 = 0;
    uint64_t v9 = [v8 storeDataFromParsingResult:v5 existingAccountIdentifier:0 insertOriginalRecords:1 allRecordsWereDuplicates:&v15 error:&v14];
    id v10 = v14;
    _HKInitializeLogging();
    uint64_t v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
    {
      sub_B03DC(a1 + 32, v11);
      if (v9)
      {
LABEL_9:
        uint64_t v12 = *(void *)(a1 + 40);
        if (v15)
        {
          id v13 = +[NSError hk_error:115 description:@"All stored records were duplicates of existing records"];
          (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v9, v13);
        }
        else
        {
          (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v9, 0);
        }
        goto LABEL_14;
      }
    }
    else if (v9)
    {
      goto LABEL_9;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_14:

    goto LABEL_15;
  }
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_B04FC(a1, v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_15:
}

void sub_6211C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

BOOL sub_62160(id a1, HDCodableOriginalSignedClinicalDataRecord *a2)
{
  return [(HDCodableOriginalSignedClinicalDataRecord *)a2 deleted] ^ 1;
}

void sub_62180(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = (void *)HKLogHealthRecords;
  if (v6)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B0770(a1, v7);
    }
    v20[1] = _NSConcreteStackBlock;
    v20[2] = (id)3221225472;
    v20[3] = sub_6244C;
    v20[4] = &unk_112318;
    id v21 = *(id *)(a1 + 48);
    id v22 = v6;
    HKWithUnfairLock();

    id v8 = v21;
  }
  else
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_B06D0(a1, v7);
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v20[0] = 0;
    uint64_t v11 = [v9 storeDataFromParsingResult:v5 existingAccountIdentifier:v10 insertOriginalRecords:0 allRecordsWereDuplicates:0 error:v20];
    id v8 = v20[0];
    if (!v11)
    {
      _HKInitializeLogging();
      uint64_t v12 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        id v13 = v12;
        id v14 = (objc_class *)objc_opt_class();
        char v15 = NSStringFromClass(v14);
        uint64_t v16 = *(void *)(a1 + 40);
        id v17 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        long long v24 = v15;
        __int16 v25 = 2114;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        id v28 = v17;
        _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "%{public}@: reextractOriginalSignedClinicalDataRecords failed to store parsed records for account %{public}@ with error %{public}@", buf, 0x20u);
      }
      id v18 = *(id *)(a1 + 48);
      id v19 = v8;
      HKWithUnfairLock();
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

id sub_6244C(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

id sub_62458(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

id sub_62630(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serialQueue_didReceiveOriginalSyncEntities");
}

id sub_6278C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 mainRecord];
  id v5 = [v4 sourceRevision];

  if (v5) {
    goto LABEL_2;
  }
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v4 issuerIdentifier];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    uint64_t v12 = *(void **)(a1 + 40);
    id v13 = [v4 issuerIdentifier];
    id v14 = [v12 titleForIssuerWithIdentifier:v13];

    if ([v14 length])
    {
      char v15 = +[NSUUID UUID];
      uint64_t v16 = +[HKSource _privateSourceForClinicalAccountIdentifier:v15 name:v14];

      id v9 = [objc_alloc((Class)HKSourceRevision) initWithSource:v16 version:0];
      id v17 = *(void **)(a1 + 32);
      id v18 = [v4 issuerIdentifier];
      [v17 setObject:v9 forKeyedSubscript:v18];

      if (v9) {
        goto LABEL_4;
      }
    }
    else
    {
    }
LABEL_2:
    id v6 = v3;
    goto LABEL_5;
  }
LABEL_4:
  [v4 _setSourceRevision:v9];
  uint64_t v10 = [v3 originalRecord];
  id v6 = [v3 copyWithOriginalRecord:v10 mainRecord:v4];

LABEL_5:

  return v6;
}

void sub_62D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void *sub_62D64(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [*(id *)(a1 + 32) items];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[NSError hk_assignError:a3, 125, @"storage of %@ items is not implemented", v12 code format];
          id v13 = 0;
          goto LABEL_13;
        }
        id v13 = [*(id *)(a1 + 40) _storeDataFromClinicalItem:v12 existingAccountIdentifier:*(void *)(a1 + 48) insertOriginalRecords:*(unsigned __int8 *)(a1 + 80) accountEntityMap:v6 numOriginalRecordsInserted:*(void *)(*(void *)(a1 + 64) + 8) + 24 numDuplicateRecords:*(void *)(*(void *)(a1 + 72) + 8) + 24 transaction:v5 error:a3];
        if (!v13) {
          goto LABEL_13;
        }
        objc_msgSend(*(id *)(a1 + 56), "hk_addNonNilObject:", v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      id v13 = &dword_0 + 1;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v13 = &dword_0 + 1;
  }
LABEL_13:

  return v13;
}

BOOL sub_62F24(id a1, NSError *a2, id *a3)
{
  id v4 = a2;
  if (v4)
  {
    if (a3) {
      *a3 = v4;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return 0;
}

id sub_64188(uint64_t a1)
{
  return [*(id *)(a1 + 32) reextractSignedClinicalDataRecordsForAccountWithIdentifier:*(void *)(a1 + 40) completion:&stru_113C38];
}

id sub_641A0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

id sub_641AC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

void sub_6532C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 items];
    id v8 = [v7 count];

    if (v8)
    {
      id v9 = [v5 items];
      uint64_t v10 = [v9 objectAtIndexedSubscript:0];
      uint64_t v11 = [v10 originalRecord];
      id v12 = [v11 signatureStatus];

      id v13 = [*(id *)(a1 + 40) signatureStatus];
      _HKInitializeLogging();
      id v14 = HKLogHealthRecords;
      BOOL v15 = os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT);
      if (v13 == v12)
      {
        if (v15)
        {
          long long v16 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          id v31 = v16;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ reverifySignatureForRecord result produced the same signature status that the record already has, skipping database update.", buf, 0xCu);
        }
        (*(void (**)(void, uint64_t, id, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), 1, [*(id *)(a1 + 40) signatureStatus], 0);
      }
      else
      {
        if (v15)
        {
          id v19 = v14;
          long long v20 = (objc_class *)objc_opt_class();
          id v21 = NSStringFromClass(v20);
          id v22 = NSStringForSignedClinicalDataRecordSignatureStatus();
          *(_DWORD *)buf = 138543618;
          id v31 = v21;
          __int16 v32 = 2114;
          id v33 = v22;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: reverifySignatureForRecord, signature verification complete result was: %{public}@", buf, 0x16u);
        }
        long long v23 = [*(id *)(a1 + 48) syncIdentifier];
        long long v24 = +[NSUUID hk_UUIDWithData:v23];
        uint64_t v25 = *(void *)(a1 + 56);
        id v29 = 0;
        unsigned __int8 v26 = +[HDOriginalSignedClinicalDataRecordEntity replaceOriginalRecordWithSyncIdentifier:v24 newSignatureStatus:v12 profile:v25 error:&v29];
        id v27 = v29;

        if (v26)
        {
          [*(id *)(a1 + 32) _scheduleExtractionWithReason:@"replaced record after signature reverification"];
        }
        else
        {
          _HKInitializeLogging();
          id v28 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
            sub_B0B48(a1, v28);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
    }
    else
    {
      long long v18 = +[NSError hk_error:100 format:@"reverifySignatureForRecord returned a parsing result with no items"];
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B0AD4();
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    _HKInitializeLogging();
    long long v17 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B0A30(a1, v17);
    }
    (*(void (**)(void, void, uint64_t, id))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), 0, 1, v6);
  }
}

uint64_t sub_65884(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = [v4 databaseForEntityClass:objc_opt_class()];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 32);
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v6)
  {
    uint64_t v18 = 1;
    goto LABEL_20;
  }
  id v7 = v6;
  id v21 = v4;
  uint64_t v8 = *(void *)v25;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      uint64_t v11 = +[HDOriginalSignedClinicalDataRecordEntity accountEntityForCodableRecord:v10 issuerIdentifierToAccountMap:*(void *)(a1 + 40) gatewayExternalIDToAccountMap:*(void *)(a1 + 48) database:v5 error:a3];
      if (!v11)
      {
        _HKInitializeLogging();
        id v12 = HKLogHealthRecords;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_B0BEC(a1, v10, v12);
        }
        goto LABEL_19;
      }
      id v12 = v11;
      id v13 = +[NSNumber numberWithLongLong:[v11 persistentID]];
      id v14 = [*(id *)(a1 + 64) objectForKeyedSubscript:v13];
      if (v14) {
        goto LABEL_10;
      }
      uint64_t v15 = [v12 identifierInDatabase:v5];
      if (!v15)
      {
        id v19 = +[NSError hk_error:100 description:@"found an account without an identifier, which is impossible"];

LABEL_19:
        id v4 = v21;

        uint64_t v18 = 0;
        goto LABEL_20;
      }
      id v14 = (void *)v15;
      [*(id *)(a1 + 64) setObject:v15 forKeyedSubscript:v13];
LABEL_10:
      id v16 = [*(id *)(a1 + 72) objectForKeyedSubscript:v14];
      if (!v16)
      {
        id v16 = objc_alloc_init((Class)NSMutableArray);
        [*(id *)(a1 + 72) setObject:v16 forKeyedSubscript:v14];
      }
      long long v17 = [v10 asOriginalSignedClinicalDataRecord];
      [v16 addObject:v17];
    }
    id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7) {
      continue;
    }
    break;
  }
  uint64_t v18 = 1;
  id v4 = v21;
LABEL_20:

  return v18;
}

uint64_t sub_65DAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_66040(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_661A4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  _HKInitializeLogging();
  uint64_t v10 = (void *)HKLogHealthRecords;
  if (v9)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B0ECC(a1, v10);
    }
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      id v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      int v15 = 138543362;
      id v16 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@.triggerDownloadIssuerRegistryWithOptions received result, returning version and entries", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v11();
}

void sub_66464(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  _HKInitializeLogging();
  uint64_t v10 = (void *)HKLogHealthRecords;
  if (v9)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B0F70(a1, v10);
    }
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      id v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      int v15 = 138543362;
      id v16 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@.triggerDownloadPublicKeysWithOptions received result, returning version and entries", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v11();
}

id sub_66930(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) extractUnextractedOriginalRecordsWithReason:*(void *)(a1 + 40) ignoreExtractionVersion:*(unsigned __int8 *)(a1 + 48) completion:a2];
}

void sub_66B88(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_66BB8()
{
  return objc_opt_class();
}

id sub_66BD0(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t sub_66BE8()
{
  return objc_opt_class();
}

void sub_66C00(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_68B00(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] ingestQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_68BF4;
  block[3] = &unk_113D50;
  id v9 = v3;
  id v5 = a1[5];
  id v6 = a1[4];
  id v10 = v5;
  id v11 = v6;
  id v12 = a1[6];
  id v13 = a1[7];
  id v7 = v3;
  dispatch_async(v4, block);
}

void sub_68BF4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) taskError];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) taskError];
    [v3 addObject:v4];
  }
  _HKInitializeLogging();
  id v5 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = v5;
    id v8 = [v6 logPrefix];
    uint64_t v9 = *(void *)(a1 + 56);
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished background ingestion on profile %{public}@", (uint8_t *)&v10, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void sub_68D18(uint64_t a1)
{
  _HKInitializeLogging();
  uint64_t v2 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B132C(a1, v2);
  }
  if ([*(id *)(a1 + 40) count])
  {
    id v3 = [*(id *)(a1 + 40) firstObject];
    if ((unint64_t)[*(id *)(a1 + 40) count] >= 2)
    {
      uint64_t v4 = *(void *)(a1 + 40);
      NSErrorUserInfoKey v7 = NSMultipleUnderlyingErrorsKey;
      uint64_t v8 = v4;
      id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
      uint64_t v6 = +[NSError hk_error:100 userInfo:v5];

      id v3 = (void *)v6;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_6921C(uint64_t a1)
{
  _HKInitializeLogging();
  uint64_t v2 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 logPrefix];
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ performing periodic activity %{public}@", buf, 0x16u);
  }
  NSErrorUserInfoKey v7 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_69384;
  v9[3] = &unk_113D78;
  v9[4] = v7;
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 56);
  objc_msgSend(v7, "_ingestQueue_triggerBackgroundIngestionOnAllProfilesWithProfileManager:completion:", v8, v9);
}

void sub_69384(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)HKLogHealthRecords;
  if (a2)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B159C((uint64_t)a1, v6);
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    NSErrorUserInfoKey v7 = (void *)a1[4];
    uint64_t v8 = v6;
    uint64_t v9 = [v7 logPrefix];
    uint64_t v10 = a1[5];
    int v11 = 138543618;
    __int16 v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ periodic activity %{public}@ completed successfully", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(double))(a1[6] + 16))(0.0);
}

void sub_69D58(void *a1)
{
  _HKInitializeLogging();
  uint64_t v2 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = v2;
    id v5 = [v3 debugDescription];
    uint64_t v6 = HKClinicalDataCollectionReasonToString();
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%{public}@ opt-in data collection (%{public}@) triggered", buf, 0x16u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_69EBC;
  v9[3] = &unk_113DA0;
  uint64_t v7 = a1[6];
  uint64_t v8 = (void *)a1[5];
  id v10 = (id)a1[4];
  uint64_t v12 = v7;
  id v11 = v8;
  objc_msgSend(v10, "_queue_triggerClinicalOptInDataCollectionWithCompletion:", v9);
}

void sub_69EBC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)HKLogHealthRecords;
  if (a2)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      uint64_t v9 = [v7 debugDescription];
      id v10 = HKClinicalDataCollectionReasonToString();
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}@: opt-in data collection (%{public}@) successful", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_B1648(a1, v6, (uint64_t)v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_6A0A0(uint64_t a1)
{
  uint64_t v1 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v3 = [WeakRetained database];
  id v37 = 0;
  uint64_t v4 = +[HDClinicalAccountEntity allAccountsInHealthDatabase:v3 error:&v37];
  id v5 = v37;

  if (!v4)
  {
    id v22 = *(void (**)(void))(*(void *)(v1 + 40) + 16);
LABEL_23:
    v22();
    goto LABEL_24;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  id v30 = [v6 countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (!v30)
  {

LABEL_20:
    _HKInitializeLogging();
    long long v23 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      long long v24 = *(void **)(v1 + 32);
      long long v25 = v23;
      long long v26 = [v24 debugDescription];
      *(_DWORD *)buf = 138543362;
      long long v39 = v26;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "%{public}@ opt-in data collection anchors were reset", buf, 0xCu);
    }
    id v22 = *(void (**)(void))(*(void *)(v1 + 40) + 16);
    goto LABEL_23;
  }
  long long v27 = v4;
  id v7 = 0;
  uint64_t v29 = *(void *)v34;
  id obj = v6;
  do
  {
    for (i = 0; i != v30; i = (char *)i + 1)
    {
      id v31 = v7;
      uint64_t v9 = v5;
      if (*(void *)v34 != v29) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      int v11 = [v10 lastExtractedRulesVersion];
      uint64_t v12 = [v10 identifier];
      uint64_t v13 = v1;
      id v14 = objc_loadWeakRetained((id *)(*(void *)(v1 + 32) + 40));
      __int16 v15 = [v14 database];
      id v32 = v5;
      unsigned __int8 v16 = +[HDClinicalAccountEntity updateAccountLastSubmittedRowID:0 expectedRulesVersion:v11 identifier:v12 healthDatabase:v15 error:&v32];
      id v5 = v32;

      uint64_t v1 = v13;
      if (v16)
      {
        id v7 = v31;
      }
      else
      {
        id v7 = v31;
        if (!v31)
        {
          _HKInitializeLogging();
          long long v17 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = *(void **)(v1 + 32);
            id v19 = v17;
            long long v20 = [v18 debugDescription];
            id v21 = [v10 identifier];
            *(_DWORD *)buf = 138543874;
            long long v39 = v20;
            __int16 v40 = 2114;
            id v41 = v21;
            __int16 v42 = 2114;
            id v43 = v5;
            _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "%{public}@: unable to reset last subbmitted row ID for account %{public}@: %{public}@", buf, 0x20u);
          }
          id v7 = v5;
        }
      }
    }
    id v30 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  }
  while (v30);

  if (!v7)
  {
    uint64_t v4 = v27;
    goto LABEL_20;
  }
  (*(void (**)(void))(*(void *)(v1 + 40) + 16))();

  uint64_t v4 = v27;
LABEL_24:
}

void sub_6A6FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v4)
  {
    [v4 invalidate];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_6AEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose((const void *)(v59 - 160), 8);
  _Unwind_Resume(a1);
}

NSUUID *__cdecl sub_6AEF8(id a1, HDClinicalAccount *a2)
{
  return [(HDClinicalAccount *)a2 identifier];
}

BOOL sub_6AF00(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 protectedDatabase];
  id v6 = [*(id *)(a1 + 32) identifier];
  id v48 = 0;
  id v7 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:v6 database:v5 error:&v48];
  id v8 = v48;

  if (v7)
  {
    id v47 = 0;
    uint64_t v9 = [v7 gatewayInDatabase:v5 error:&v47];
    id v10 = v47;
    if (v9)
    {
      int v11 = *(void **)(a1 + 48);
      uint64_t v12 = [v9 country];
      LOBYTE(v11) = [v11 containsObject:v12];

      if (v11)
      {
        uint64_t v13 = [*(id *)(a1 + 32) lastSubmittedRowID];
        id v38 = [v13 longLongValue];
        id v14 = [*(id *)(a1 + 32) lastExtractedRowID];
        id v15 = [v14 longLongValue];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_6B348;
        v39[3] = &unk_113E58;
        id v16 = *(id *)(a1 + 56);
        uint64_t v17 = *(void *)(a1 + 32);
        id v40 = v16;
        uint64_t v41 = v17;
        id v18 = *(id *)(a1 + 64);
        uint64_t v19 = *(void *)(a1 + 40);
        id v42 = v18;
        uint64_t v43 = v19;
        long long v37 = *(_OWORD *)(a1 + 72);
        id v20 = (id)v37;
        long long v44 = v37;
        long long v46 = *(_OWORD *)(a1 + 96);
        uint64_t v45 = *(void *)(a1 + 88);
        BOOL v21 = +[HDOriginalFHIRResourceEntity enumerateFHIRResourceObjectsWithLocalProvenanceForAccountEntity:v7 startAnchor:v38 endAnchor:v15 database:v5 error:a3 enumerationHandler:v39];

LABEL_16:
        goto LABEL_19;
      }
      _HKInitializeLogging();
      id v30 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = *(void **)(a1 + 40);
        long long v26 = v30;
        long long v27 = [v31 debugDescription];
        id v28 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v27;
        __int16 v51 = 2114;
        uint64_t v52 = v28;
        uint64_t v29 = "%{public}@ gateway for account %{public}@ has Opt-In data upload disabled, skipping";
        goto LABEL_14;
      }
    }
    else
    {
      _HKInitializeLogging();
      long long v24 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        long long v25 = *(void **)(a1 + 40);
        long long v26 = v24;
        long long v27 = [v25 debugDescription];
        id v28 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v27;
        __int16 v51 = 2114;
        uint64_t v52 = v28;
        uint64_t v29 = "%{public}@ account %{public}@ is missing a gateway, skipping Opt-in data";
LABEL_14:
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
      }
    }
    BOOL v21 = 1;
    goto LABEL_16;
  }
  _HKInitializeLogging();
  id v22 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    long long v33 = *(void **)(a1 + 40);
    long long v34 = v22;
    long long v35 = [v33 debugDescription];
    long long v36 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v50 = v35;
    __int16 v51 = 2114;
    uint64_t v52 = v36;
    __int16 v53 = 2114;
    id v54 = v8;
    _os_log_error_impl(&dword_0, v34, OS_LOG_TYPE_ERROR, "%{public}@: Unable to get account enity for account %{public}@: %{public}@", buf, 0x20u);
  }
  id v23 = v8;
  id v10 = v23;
  if (!v23)
  {
LABEL_18:
    BOOL v21 = 0;
    goto LABEL_19;
  }
  if (!a3)
  {
    _HKLogDroppedError();
    goto LABEL_18;
  }
  id v10 = v23;
  BOOL v21 = 0;
  *a3 = v10;
LABEL_19:

  return v21;
}

uint64_t sub_6B348(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a3;
  id v10 = +[NSNumber numberWithLongLong:a2];
  int v11 = *(void **)(a1 + 32);
  uint64_t v12 = [*(id *)(a1 + 40) identifier];
  [v11 setObject:v10 forKeyedSubscript:v12];

  uint64_t v13 = *(void **)(a1 + 40);
  id v14 = *(void **)(a1 + 48);
  id v15 = [v13 identifier];
  [v14 setObject:v13 forKeyedSubscript:v15];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += a4;
    [*(id *)(a1 + 64) addObject:v9];
    if (*(void *)(a1 + 88) && (unint64_t)[*(id *)(a1 + 64) count] >= *(void *)(a1 + 88)
      || (unint64_t v16 = *(void *)(a1 + 96)) != 0 && *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) >= v16)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      *a5 = 1;
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v17 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B18E8(a1, a2, v17);
    }
  }

  return 1;
}

void sub_6B4AC(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v15 = 0;
    unsigned __int8 v6 = objc_msgSend(v3, "_queue_updateSubmittedAnchors:accounts:error:", v4, v5, &v15);
    id v7 = v15;
    if (v6)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        id v8 = [*(id *)(a1 + 56) allObjects];
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
        id v14 = 0;
        id v10 = +[HDClinicalAccountEntity accountsWithIdentifiers:v8 profile:WeakRetained error:&v14];
        id v11 = v14;

        if (v10) {
          objc_msgSend(*(id *)(a1 + 32), "_queue_submitOptInResourcesForAccounts:batchCountLimit:batchSizeLimit:completion:", v10, *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 64));
        }
        else {
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        }

        goto LABEL_14;
      }
      uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    v13();
LABEL_14:

    return;
  }
  uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);

  v12();
}

void sub_6B7D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_6B8B4;
  v12[3] = &unk_1132B8;
  id v13 = v5;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v6;
  uint64_t v15 = v9;
  id v16 = v8;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

id sub_6B8B4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return objc_msgSend(*(id *)(a1 + 48), "_queue_submitAnalyticsForResult:completion:");
  }
  else {
    return (id)(*(uint64_t (**)(void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0, *(void *)(a1 + 40));
  }
}

id sub_6BB2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = [v3 FHIRVersion];
  id v8 = [v7 stringRepresentation];
  uint64_t v9 = [v3 JSONObject];

  id v10 = [v4 _optInJSONForBuild:v6 extractionRulesVersion:v5 FHIRVersion:v8 resource:v9];

  return v10;
}

void sub_6C0D8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if (a2)
  {
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
  }
  else
  {
    if ([v5 code]) {
      v6.n128_u64[0] = 0;
    }
    else {
      v6.n128_f64[0] = (double)XPC_ACTIVITY_INTERVAL_1_MIN;
    }
    (*(void (**)(__n128))(*(void *)(a1 + 32) + 16))(v6);
  }
}

void sub_6D320(uint64_t a1)
{
  HDSQLiteBindUUIDToProperty();
  uint64_t v2 = [*(id *)(a1 + 40) issuerIdentifier];
  HDSQLiteBindStringToProperty();

  id v3 = [*(id *)(a1 + 40) sourceURL];
  HDSQLiteBindStringToProperty();

  [*(id *)(a1 + 40) sourceType];
  HDSQLiteBindInt64ToProperty();
  uint64_t v4 = [*(id *)(a1 + 40) rawContent];
  HDSQLiteBindDataToProperty();

  id v5 = [*(id *)(a1 + 40) uniquenessChecksum];
  HDSQLiteBindDataToProperty();

  HDSQLiteBindStringToProperty();
  __n128 v6 = [*(id *)(a1 + 40) metadata];
  id v7 = [v6 data];
  HDSQLiteBindDataToProperty();

  [*(id *)(a1 + 40) receivedDate];
  HDSQLiteBindDoubleToProperty();
  id v8 = [*(id *)(a1 + 40) receivedDateTimeZoneName];
  HDSQLiteBindStringToProperty();

  [*(id *)(a1 + 40) firstSeenDate];
  HDSQLiteBindDoubleToProperty();
  uint64_t v9 = [*(id *)(a1 + 40) firstSeenDateTimeZoneName];
  HDSQLiteBindStringToProperty();

  [*(id *)(a1 + 40) signatureStatus];
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindInt64ToProperty();
  [*(id *)(a1 + 40) lastModifiedDate];
  HDSQLiteBindDoubleToProperty();
  HDSQLiteBindBooleanToProperty();
  id v10 = [*(id *)(a1 + 56) entity];
  [v10 persistentID];
  HDSQLiteBindInt64ToProperty();
}

id sub_6D7B0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = HDExtractionResultItem_ptr;
  id v44 = a2;
  uint64_t v50 = [v44 databaseForEntityClass:objc_opt_class()];
  id v46 = objc_alloc_init((Class)NSMutableArray);
  id v47 = objc_alloc_init((Class)NSMutableArray);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = *(id *)(a1 + 32);
  id v5 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v54;
    uint64_t v49 = HDOriginalSignedClinicalDataRecordEntityPropertyLastModifiedDate;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v54 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v10 = [v9 messageVersion];
        int v11 = [v10 entityVersion];

        if (v11 <= 0) {
          [v9 setSourceType:1];
        }
        uint64_t v12 = [v9 syncIdentifier];
        id v13 = +[NSUUID hk_UUIDWithData:v12];

        id v14 = v4[26];
        uint64_t v15 = *(void *)(a1 + 40);
        id v52 = 0;
        id v16 = [v14 entityWithSyncIdentifier:v13 profile:v15 error:&v52];
        id v17 = v52;
        id v18 = v17;
        if (v16)
        {
          uint64_t v19 = [v16 dateForProperty:v49 database:v50];
          [v9 lastModifiedDate];
          double v21 = v20;
          [v19 timeIntervalSinceReferenceDate];
          if (v21 > v22)
          {
            [v46 addObject:v9];
            if ([v9 deleted])
            {
              uint64_t v23 = *(void *)(a1 + 40);
              id v51 = 0;
              unsigned __int8 v24 = [v16 deleteDerivedRecordsOnProfile:v23 error:&v51];
              id v25 = v51;
              if ((v24 & 1) == 0)
              {
                _HKInitializeLogging();
                long long v26 = (void *)HKLogHealthRecords;
                if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
                {
                  id v31 = v26;
                  id v32 = (objc_class *)objc_opt_class();
                  uint64_t v45 = NSStringFromClass(v32);
                  *(_DWORD *)buf = 138543618;
                  id v58 = v45;
                  __int16 v59 = 2114;
                  id v60 = v25;
                  _os_log_error_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, "%{public}@ error deleting derived records for existing, deleted original SCD record entity, unable to recover. Error: %{public}@", buf, 0x16u);
                }
              }
            }
          }

          uint64_t v4 = HDExtractionResultItem_ptr;
        }
        else
        {
          if (v17)
          {
            _HKInitializeLogging();
            long long v27 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              id v28 = v27;
              uint64_t v29 = (objc_class *)objc_opt_class();
              id v30 = NSStringFromClass(v29);
              *(_DWORD *)buf = 138543618;
              id v58 = v30;
              __int16 v59 = 2114;
              id v60 = v18;
              _os_log_error_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "%{public}@ error checking for existing original SCD record entity, will insert instead. Error: %{public}@", buf, 0x16u);

              uint64_t v4 = HDExtractionResultItem_ptr;
            }
          }
          [v47 addObject:v9];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
    }
    while (v6);
  }

  _HKInitializeLogging();
  long long v33 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    long long v36 = v33;
    long long v37 = (objc_class *)objc_opt_class();
    id v38 = NSStringFromClass(v37);
    long long v39 = *(void **)(a1 + 40);
    id v40 = [*(id *)(a1 + 32) count];
    id v41 = [v46 count];
    id v42 = [v47 count];
    *(_DWORD *)buf = 138544386;
    id v58 = v38;
    __int16 v59 = 2114;
    id v60 = v39;
    uint64_t v4 = HDExtractionResultItem_ptr;
    __int16 v61 = 2048;
    id v62 = v40;
    __int16 v63 = 2048;
    id v64 = v41;
    __int16 v65 = 2048;
    id v66 = v42;
    _os_log_debug_impl(&dword_0, v36, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ received %lu sync objects, will upsert %lu and insert %lu", buf, 0x34u);
  }
  if ([v4[26] insertCodableOriginalRecords:v46 shouldReplace:1 syncProvenance:*(void *)(a1 + 56) profile:*(void *)(a1 + 40) error:a3])id v34 = objc_msgSend(v4[26], "insertCodableOriginalRecords:shouldReplace:syncProvenance:profile:error:", v47, 0, *(void *)(a1 + 56), *(void *)(a1 + 40), a3); {
  else
  }
    id v34 = 0;

  return v34;
}

id sub_6DCA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry alloc] initWithCodableRecords:*(void *)(a1 + 32) syncProvenance:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 40) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

uint64_t sub_6DF98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v42 = objc_alloc_init((Class)NSMutableDictionary);
  id v41 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v4 = [v3 databaseForEntityClass:*(void *)(a1 + 48)];
  long long v39 = v3;
  id v40 = [v3 databaseForEntityClass:objc_opt_class()];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v5 = *(id *)(a1 + 32);
  id v6 = [v5 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_19;
  }
  id v7 = v6;
  id obj = v5;
  long long v37 = v4;
  id v8 = 0;
  uint64_t v9 = *(void *)v48;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v48 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v47 + 1) + 8 * i);
      uint64_t v12 = *(void **)(a1 + 48);
      id v46 = 0;
      id v13 = [v12 accountEntityForCodableRecord:v11 issuerIdentifierToAccountMap:v42 gatewayExternalIDToAccountMap:v41 database:v40 error:&v46];
      id v14 = v46;
      if (v13)
      {
        uint64_t v15 = *(void **)(a1 + 48);
        uint64_t v16 = *(unsigned __int8 *)(a1 + 64);
        id v17 = [v13 persistentID];
        uint64_t v18 = *(void *)(a1 + 56);
        uint64_t v19 = *(void *)(a1 + 40);
        id v45 = 0;
        double v20 = [v15 insertCodableRecord:v11 shouldReplace:v16 accountPersistentID:v17 syncProvenance:v18 profile:v19 transaction:v39 error:&v45];
        id v21 = v45;

        if (v20)
        {
          ++v8;
        }
        else
        {
          _HKInitializeLogging();
          long long v26 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            long long v27 = v26;
            id v28 = (objc_class *)objc_opt_class();
            uint64_t v29 = NSStringFromClass(v28);
            *(_DWORD *)buf = 138543618;
            id v52 = v29;
            __int16 v53 = 2114;
            id v54 = v21;
            _os_log_error_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "%{public}@ failed to insert codable original signed clinical data record: %{public}@", buf, 0x16u);
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        double v22 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = v22;
          unsigned __int8 v24 = (objc_class *)objc_opt_class();
          id v25 = NSStringFromClass(v24);
          *(_DWORD *)buf = 138543618;
          id v52 = v25;
          __int16 v53 = 2114;
          id v54 = v14;
          _os_log_error_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "%{public}@ unable to insert codable original signed clinical data record because I can't find the appropriate account, dropping record. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    id v7 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
  }
  while (v7);

  if (v8)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    void v43[2] = sub_6E41C;
    v43[3] = &unk_113B88;
    id v44 = *(id *)(a1 + 40);
    id v30 = objc_retainBlock(v43);
    uint64_t v4 = v37;
    [v37 onCommit:v30 orRollback:0];

    id v5 = v44;
LABEL_19:

    goto LABEL_21;
  }
  uint64_t v4 = v37;
LABEL_21:
  _HKInitializeLogging();
  id v31 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = v31;
    long long v33 = (objc_class *)objc_opt_class();
    id v34 = NSStringFromClass(v33);
    id v35 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 138543874;
    id v52 = v34;
    __int16 v53 = 2048;
    id v54 = v8;
    __int16 v55 = 2048;
    id v56 = v35;
    _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ inserted %lu of %lu codable original signed clinical data records", buf, 0x20u);
  }
  return 1;
}

void sub_6E41C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) healthRecordsExtension];
  uint64_t v1 = [v2 signedClinicalDataManager];
  [v1 didReceiveOriginalSignedClinicalDataRecordSyncEntities];
}

id sub_6E478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDOriginalSignedClinicalDataInsertCodableJournalEntry alloc] initWithCodableRecords:*(void *)(a1 + 32) shouldReplace:*(unsigned __int8 *)(a1 + 56) syncProvenance:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 40) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

void sub_6F76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

BOOL sub_6F7B4(uint64_t a1, void *a2)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6F87C;
  v8[3] = &unk_113FC0;
  id v9 = a2;
  id v3 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v4 = v9;
  id v5 = objc_msgSend(v3, "hk_firstObjectPassingTest:", v8);
  BOOL v6 = v5 == 0;

  return v6;
}

id sub_6F87C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 isEquivalent:*(void *)(a1 + 32)];
  if (v4)
  {
    id v5 = [v3 UUID];
    BOOL v6 = [*(id *)(a1 + 32) UUID];
    unsigned __int8 v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = [*(id *)(a1 + 32) UUID];
      id v9 = *(void **)(a1 + 40);
      id v10 = [v3 UUID];
      [v9 setObject:v8 forKeyedSubscript:v10];
    }
  }

  return v4;
}

BOOL sub_6F944(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6F9F0;
  v9[3] = &unk_113FE8;
  id v10 = v3;
  id v5 = v3;
  BOOL v6 = objc_msgSend(v4, "hk_firstObjectPassingTest:", v9);
  BOOL v7 = v6 == 0;

  return v7;
}

id sub_6F9F0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEquivalent:a2];
}

BOOL sub_6F9FC(id a1, HKMedicalRecord *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL sub_6FA48(id a1, HKMedicalRecord *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id sub_6FA94(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 medicalRecordSampleID];
  BOOL v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = [v3 copyWithMedicalRecordSampleID:v6];
  }
  else {
    id v7 = v3;
  }
  id v8 = v7;

  return v8;
}

id sub_6FB24(uint64_t a1, void *a2)
{
  return [a2 isEquivalent:*(void *)(a1 + 32)];
}

uint64_t sub_6FB30(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 verifiableClinicalRecord];
  unsigned int v6 = [v4 isEquivalent:v5];

  if (v6) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return v6 ^ 1;
}

void sub_6FE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_6FE50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_6FE60(uint64_t a1)
{
}

uint64_t sub_6FE68(void *a1, void *a2, void *a3)
{
  id v5 = [a2 databaseForEntityClass:a1[6]];
  unsigned int v6 = (void *)a1[6];
  uint64_t v7 = a1[4];
  id v15 = 0;
  uint64_t v8 = [v6 entityWithSyncIdentifier:v7 database:v5 error:&v15];
  id v9 = v15;
  uint64_t v10 = *(void *)(a1[5] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  if (*(void *)(*(void *)(a1[5] + 8) + 40)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v9 == 0;
  }
  uint64_t v13 = v12;
  if (!v12)
  {
    if (a3) {
      *a3 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v13;
}

id sub_709E0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  unsigned int v6 = [*(id *)(a1 + 40) propertiesForCodable];
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v7 _predicateForUnextractedOriginalRecordsWithExtractionVersion:*(void *)(a1 + 48) ignoreExtractionVersion:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v9 = kHDSQLiteQueryNoLimit;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_70B0C;
  v14[3] = &unk_111AC8;
  long long v13 = *(_OWORD *)(a1 + 32);
  id v10 = (id)v13;
  long long v15 = v13;
  id v11 = [v7 enumerateQueryResultsFromColumns:v6 properties:v6 predicate:v8 groupBy:0 orderingTerms:0 limit:v9 database:v5 error:a3 enumerationHandler:v14];

  return v11;
}

BOOL sub_70B0C(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 40), "codableWithRow:error:");
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return v2 != 0;
}

void sub_70E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_70E3C(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unsigned int v6 = +[HDOriginalSignedClinicalDataRecordEntity existingEntityBackingMedicalRecord:a1[4] profile:a1[5] error:a3];
  if (v6)
  {
    uint64_t v7 = [v5 databaseForEntityClass:objc_opt_class()];
    uint64_t v8 = [v6 codableInDatabase:v7 error:a3];
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    BOOL v11 = v8 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void sub_71144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_71174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_opt_class();
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v5 codableWithRow:a3 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

id sub_71418(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [v5 databaseForEntityClass:objc_opt_class()];
  uint64_t v8 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:v6 database:v7 error:a3];

  if (v8)
  {
    uint64_t v21 = 0;
    double v22 = &v21;
    uint64_t v23 = 0x3032000000;
    unsigned __int8 v24 = sub_6FE50;
    id v25 = sub_6FE60;
    id v26 = 0;
    uint64_t v9 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
    uint64_t v10 = *(void **)(a1 + 48);
    BOOL v11 = [v10 _predicateForUndeletedRecordsOnAccountEntity:v8];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_7162C;
    v17[3] = &unk_114110;
    id v19 = *(id *)(a1 + 40);
    id v12 = v9;
    id v18 = v12;
    double v20 = &v21;
    id v13 = [v10 enumerateEntitiesInDatabase:v12 predicate:v11 error:a3 enumerationHandler:v17];

    if ((v13 & 1) == 0)
    {
      id v14 = (id)v22[5];
      uint64_t v15 = v14;
      if (v14)
      {
        if (a3) {
          *a3 = v14;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void sub_71610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7162C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v10 = 0;
  uint64_t v3 = (*(uint64_t (**)(void))(v2 + 16))();
  id v4 = v10;
  id v5 = v4;
  if ((v3 & 1) == 0 && v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = v4;
    uint64_t v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  return v3;
}

BOOL sub_7179C(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "signedClinicalDataRecordWithProfile:error:", *(void *)(a1 + 32));
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v3 != 0;
}

BOOL sub_718BC(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "codableInDatabase:error:");
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return v3 != 0;
}

BOOL sub_71A88(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:objc_opt_class()];
  id v7 = +[HDOriginalSignedClinicalDataRecordEntity existingEntityWithSyncIdentifier:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) error:a3];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 codableInDatabase:v6 error:a3];
    if ([v9 signatureStatus] == *(id *)(a1 + 48))
    {
      _HKInitializeLogging();
      id v10 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
        sub_B1C94(a1, v10);
      }
      BOOL v11 = 1;
    }
    else if ([v8 deleteOriginalAndDerivedRecordsOnProfile:*(void *)(a1 + 40) error:a3])
    {
      id v12 = [*(id *)(a1 + 56) accountEntityForCodableRecord:v9 issuerIdentifierToAccountMap:0 gatewayExternalIDToAccountMap:0 database:v6 error:a3];
      if (v12)
      {
        +[NSUUID UUID];
        id v13 = v21 = v12;
        id v14 = objc_msgSend(v13, "hk_dataForUUIDBytes");
        [v9 setSyncIdentifier:v14];

        [v9 setSignatureStatus:*(void *)(a1 + 48)];
        uint64_t v15 = [*(id *)(a1 + 40) syncIdentityManager];
        uint64_t v16 = [v15 currentSyncIdentity];
        id v17 = [v16 identity];
        id v18 = [v17 codableSyncIdentity];
        [v9 setSyncIdentity:v18];

        id v12 = v21;
        id v19 = objc_msgSend(*(id *)(a1 + 56), "insertCodableRecord:shouldReplace:accountPersistentID:syncProvenance:profile:transaction:error:", v9, 0, objc_msgSend(v21, "persistentID"), 0, *(void *)(a1 + 40), v5, a3);
        BOOL v11 = v19 != 0;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

id sub_71CBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry alloc] initWithCodableRecordSyncIdentifier:*(void *)(a1 + 32) signatureStatus:*(void *)(a1 + 48)];
  uint64_t v6 = [*(id *)(a1 + 40) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

void sub_71F2C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) uniquenessChecksum];
  HDSQLiteBindDataToProperty();
}

id sub_721C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _deleteDerivedRecordsWithTransaction:a2 profile:*(void *)(a1 + 40) error:a3];
}

id sub_722AC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) _deleteDerivedRecordsWithTransaction:v5 profile:*(void *)(a1 + 40) error:a3])
  {
    uint64_t v6 = [v5 databaseForEntity:*(void *)(a1 + 32)];
    id v7 = [*(id *)(a1 + 32) codableInDatabase:v6 error:a3];
    if (v7 && [*(id *)(a1 + 32) deleteFromDatabase:v6 error:a3])
    {
      uint64_t v8 = [v7 asTombstone];
      uint64_t v9 = [*(id *)(a1 + 40) syncIdentityManager];
      id v10 = [v9 currentSyncIdentity];
      BOOL v11 = [v10 identity];
      id v12 = [v11 codableSyncIdentity];
      [v8 setSyncIdentity:v12];

      id v13 = objc_opt_class();
      id v17 = v8;
      id v14 = +[NSArray arrayWithObjects:&v17 count:1];
      id v15 = [v13 insertCodableOriginalRecords:v14 shouldReplace:0 syncProvenance:0 profile:*(void *)(a1 + 40) error:a3];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void sub_72640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_72658(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [a2 databaseForEntity:*(void *)(a1 + 40)];
  uint64_t v8 = +[HDMedicalRecordEntity _medicalRecordsWithPredicate:v6 withoutConceptIndex:1 excludeSignedClinicalDataRecords:v5 database:v7 profile:*(void *)(a1 + 48) error:a3];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
}

void sub_73EE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_73F80;
  v6[3] = &unk_111F08;
  id v7 = v3;
  id v5 = v3;
  [v4 sendEvent:@"com.apple.HealthRecords.ProcessingExtractionFailureEvent" block:v6];
}

id sub_73F80(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_74654(uint64_t a1)
{
}

void sub_748D8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v34 = +[NSAssertionHandler currentHandler];
      [v34 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"HDCPSFetchJSONTask.m", 99, @"Invalid parameter not satisfying: %@", @"response == nil || (response != nil && [response isKindOfClass:NSHTTPURLResponse.class])" object file lineNumber description];
    }
  }
  id v10 = v8;
  _HKInitializeLogging();
  BOOL v11 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v11;
    id v12 = objc_opt_class();
    id v13 = *(void **)(a1 + 40);
    id v36 = v12;
    id v14 = [v13 URL];
    id v15 = [v14 absoluteString];
    HKSensitiveLogItem();
    uint64_t v16 = v37 = v7;
    id v17 = v9;
    if (v9) {
      id v18 = "error";
    }
    else {
      id v18 = "response";
    }
    id v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 statusCode]);
    *(_DWORD *)buf = 138544130;
    id v42 = v12;
    __int16 v43 = 2112;
    id v44 = v16;
    __int16 v45 = 2080;
    id v46 = v18;
    id v9 = v17;
    __int16 v47 = 2114;
    long long v48 = v19;
    _os_log_impl(&dword_0, log, OS_LOG_TYPE_DEFAULT, "%{public}@ completed fetch for %@ with %s: %{public}@", buf, 0x2Au);

    id v7 = v37;
  }
  id v20 = v9;
  id v21 = v20;
  if (v8)
  {
    id v21 = [*(id *)(a1 + 32) _errorFromResponse:v10];

    if (v21)
    {
      double v22 = [v21 userInfo];
      uint64_t v23 = [v22 objectForKeyedSubscript:NSUnderlyingErrorKey];

      id v24 = [v23 code];
      id v25 = *(void **)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 64);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_74CD0;
      v38[3] = &unk_111EE0;
      void v38[4] = v25;
      id v39 = *(id *)(a1 + 48);
      LOBYTE(v24) = [v25 _performRetryIfNeededForStatusCode:v24 retryCount:v26 retryHandler:v38];

      if (v24) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
    if (v7)
    {
      id v40 = 0;
      uint64_t v27 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v40];
      id v21 = v40;
      uint64_t v28 = *(void *)(a1 + 32);
      uint64_t v29 = *(void **)(v28 + 48);
      *(void *)(v28 + 4_Block_object_dispose(&STACK[0x220], 8) = v27;
    }
    else
    {
      id v21 = +[NSError hk_error:3 description:@"empty response data"];
    }
  }
  if (v21)
  {
LABEL_17:
    _HKInitializeLogging();
    id v30 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B1F80(a1, v30);
    }
  }
  id v31 = [v21 copy];
  uint64_t v32 = *(void *)(a1 + 32);
  long long v33 = *(void **)(v32 + 40);
  *(void *)(v32 + 40) = v31;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_20:
}

id sub_74CD0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _startTaskWithRetryCount:a2 completion:*(void *)(a1 + 40)];
}

uint64_t sub_75034(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_75558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_7557C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = +[HDOriginalSignedClinicalDataRecordEntity propertiesForCodable];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_756C0;
  v15[3] = &unk_111758;
  id v16 = *(id *)(a1 + 40);
  id v17 = v5;
  id v18 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  id v12 = v5;
  id v13 = +[HDOriginalSignedClinicalDataRecordEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDOriginalSignedClinicalDataRecordEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v8, v11, v10, 0, v7, v9, a3, v15);

  return v13;
}

BOOL sub_756C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = +[HDOriginalSignedClinicalDataRecordEntity codableWithRow:a4 error:a8];
  if (v10)
  {
    uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
    id v12 = [*(id *)(a1 + 32) syncIdentityManager];
    id v13 = [v12 identityForEntityID:v11 transaction:*(void *)(a1 + 40) error:a8];

    BOOL v14 = v13 != 0;
    if (v13)
    {
      id v15 = [v13 identity];
      id v16 = [v15 codableSyncIdentity];
      [v10 setSyncIdentity:v16];

      [*(id *)(a1 + 48) addObject:v10];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

BOOL sub_7585C(id a1, HDSyncCodable *a2)
{
  uint64_t v2 = a2;
  objc_opt_class();
  id v3 = HKSafeObject();

  id v4 = 0;
  if (!v3)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_B210C((uint64_t)v4, v5);
    }
  }

  return v3 != 0;
}

void sub_75E98(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = [a2 payloadForCoreAnalyticsWithEventCount:a3 deviceContext:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

BOOL sub_77A6C(id a1, HKClinicalGatewayFeature *a2)
{
  [(HKClinicalGatewayFeature *)a2 minCompatibleAPIVersion];

  return HKProviderServiceIsMinCompatibleAPIVersionSupported();
}

BOOL sub_77AEC(id a1, HKClinicalGatewayFeature *a2)
{
  uint64_t v2 = [(HKClinicalGatewayFeature *)a2 name];
  unsigned __int8 v3 = [v2 isEqualToString:HKClinicalGatewayFeatureNameClinicalSharing];

  return v3;
}

id sub_77C1C(id a1, id a2, id *a3)
{
  return +[HKClinicalGatewayEndpointSchema endpointSchemaFromDefinition:a2 error:a3];
}

id HDSafeObjectFromDictionary(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  uint64_t v7 = [a1 objectForKeyedSubscript:v6];
  if (v7)
  {
    uint64_t v8 = HKSafeObject();
  }
  else
  {
    +[NSError hk_assignError:a4, 3, @"Unexpectedly found nil for dictionary key \"%@\"", v6 code format];
    uint64_t v8 = 0;
  }

  return v8;
}

id HDSafeObjectFromDictionaryIfExists(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 objectForKeyedSubscript:v3];
  if (v4)
  {
    id v5 = HKSafeObject();
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id sub_78244(id a1, id a2, id *a3)
{
  return +[HKClinicalGatewayEndpointSchemaParameter parameterFromDefinition:a2 error:a3];
}

id sub_78504(id a1, id a2, id *a3)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = HKSafeObject();

  return v4;
}

id sub_78620(id a1, id a2, id *a3)
{
  return +[HKClinicalGatewayFeature gatewayFeatureFromDefinition:a2 error:a3];
}

id sub_788AC(id a1, id a2, id *a3)
{
  return +[HKClinicalGatewayReference gatewayReferenceFromDefinition:a2 error:a3];
}

void sub_79358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_79378(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 64)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "items", 0);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(a1 + 64) processClinicalRecordsInExtractionResultItem:*(void *)(*((void *)&v15 + 1) + 8 * (void)v10) clinicalExternalID:*(void *)(a1 + 40) database:v5 profile:*(void *)(a1 + 48) error:a3];
        if (!v11)
        {
          uint64_t v13 = 0;
          goto LABEL_11;
        }
        id v12 = v11;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v11 integerValue];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1;
LABEL_11:

  return v13;
}

id sub_794E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDClinicalRecordsInExtractionResultJournalEntry alloc] initWithExtractionResult:*(void *)(a1 + 32) clinicalExternalID:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 48) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

BOOL sub_79A90(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 _fetchIdentifierFromDatabase:*(void *)(a1 + 32) error:a3];
  if (v6) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }

  return v6 != 0;
}

id sub_79B00(id a1, HDClinicalRecordEntity *a2)
{
  id v2 = [(HDClinicalRecordEntity *)a2 persistentID];

  return +[NSNumber numberWithLongLong:v2];
}

void sub_7A338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7A364(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7A374(uint64_t a1)
{
}

void sub_7A37C(uint64_t a1)
{
  HDSQLiteColumnWithNameAsString();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = HDSQLiteColumnWithNameAsString();
  if ([v7 length] && objc_msgSend(v2, "length"))
  {
    id v3 = [objc_alloc((Class)HKFHIRIdentifier) initWithResourceType:v7 identifier:v2];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    id v3 = +[NSError hk_error:100, @"unable to construct FHIR identifier from type %@ and identifier %@", v7, v2 format];
    uint64_t v4 = *(void *)(a1 + 40);
  }
  uint64_t v5 = *(void *)(v4 + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t sub_7AB74(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_7ACC8()
{
  return HDSQLiteBindNumberToProperty();
}

uint64_t sub_7ADF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = +[NSNumber numberWithLongLong:a2];
  id v8 = +[HDClinicalRecordEntity entityWithPersistentID:v7];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v15 = 0;
    uint64_t v10 = (*(uint64_t (**)(void))(v9 + 16))();
    id v11 = v15;
    uint64_t v12 = v11;
    if ((v10 & 1) == 0)
    {
      id v13 = v11;
      if (v13)
      {
        if (a5) {
          *a5 = v13;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

id sub_7B914(void *a1)
{
  id v1 = [a1 mutableCopy];
  id v2 = [v1 objectForKeyedSubscript:@"clientSecret"];
  id v3 = [v2 dataUsingEncoding:4];
  id v4 = [v3 mutableCopy];

  if (!v4)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    uint64_t v9 = +[NSString stringWithUTF8String:"NSString * _Nonnull _encryptClientSecret(NSString * _Nonnull __strong)"];
    [v8 handleFailureInFunction:v9 file:@"HDClinicalGateway.m" lineNumber:341 description:@"Encoding failed"];
  }
  uint64_t v5 = sub_7CCF4(v4);
  id v6 = [v5 base64EncodedStringWithOptions:0];
  if (!v6)
  {
    uint64_t v10 = +[NSAssertionHandler currentHandler];
    id v11 = +[NSString stringWithUTF8String:"NSString * _Nonnull _encryptClientSecret(NSString * _Nonnull __strong)"];
    [v10 handleFailureInFunction:v11 file:@"HDClinicalGateway.m" lineNumber:346 description:@"Encoding failed"];
  }
  [v1 setObject:v6 forKeyedSubscript:@"clientSecret"];

  return v1;
}

id sub_7CCF4(void *a1)
{
  id v1 = a1;
  id v2 = [v1 mutableCopy];
  if (!v1)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    id v8 = +[NSString stringWithUTF8String:"NSData * _Nonnull _encryptWithClientSecretKey(NSData * _Nonnull __strong)"];
    [v7 handleFailureInFunction:v8 file:@"HDClinicalGateway.m" lineNumber:352 description:@"nonnull"];
  }
  id v3 = v2;
  id v4 = [v3 mutableBytes];
  if ([v1 length])
  {
    unint64_t v5 = 0;
    do
    {
      v4[v5] ^= byte_F28B8[v5 + -100 * (v5 / 0x64)];
      ++v5;
    }
    while (v5 < (unint64_t)[v1 length]);
  }

  return v3;
}

void sub_7D070(uint64_t a1)
{
}

void sub_7D07C(uint64_t a1, void *a2, void *a3)
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
    uint64_t v9 = [0 URL];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 24) specification];
      id v13 = [v12 connection];
      uint64_t v14 = [v13 gateway];
      id v11 = [v14 baseURL];
    }
    id v15 = [*(id *)(a1 + 32) resourceType];
    long long v16 = +[HKFHIRRequestTaskEndState endStateForCanceledRequestAtURL:resourceType:interactionType:](HKFHIRRequestTaskEndState, "endStateForCanceledRequestAtURL:resourceType:interactionType:", v11, v15, [*(id *)(a1 + 32) interactionType]);

    [*(id *)(a1 + 32) handleError:v8 endState:v16];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_7D3AC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v37 = +[NSAssertionHandler currentHandler];
      [v37 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"HDFHIRRequestTask.m", 90, @"Invalid parameter not satisfying: %@", @"response == nil || (response != nil && [response isKindOfClass:[NSHTTPURLResponse class]])" object file lineNumber description];
    }
  }
  uint64_t v10 = +[NSDate now];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;
  id v13 = v8;
  _HKInitializeLogging();
  uint64_t v14 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    id v15 = v14;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v45 = (id)objc_opt_class();
      os_log_t log = [*(id *)(a1 + 40) HTTPMethod];
      id v41 = [*(id *)(a1 + 40) URL];
      id v39 = [v41 absoluteString];
      HKSensitiveLogItem();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      if (v9) {
        long long v33 = "error";
      }
      else {
        long long v33 = "response";
      }
      id v34 = v9;
      if (!v9)
      {
        id v35 = v32;
        id v34 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 statusCode]);
        id v32 = v35;
      }
      *(_DWORD *)buf = 138544386;
      id v47 = v45;
      __int16 v48 = 2114;
      os_log_t v49 = log;
      __int16 v50 = 2112;
      id v51 = v32;
      __int16 v52 = 2080;
      __int16 v53 = v33;
      __int16 v54 = 2114;
      __int16 v55 = v34;
      id v36 = v32;
      _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "%{public}@ completed for %{public}@ %@ with %s: %{public}@", buf, 0x34u);
      if (!v9) {
    }
      }
  }
  id v16 = objc_alloc((Class)HKFHIRRequestTaskEndState);
  id v17 = [*(id *)(a1 + 40) URL];
  long long v18 = [*(id *)(a1 + 32) resourceType];
  id v19 = objc_msgSend(v16, "initWithRequestedURL:resourceType:interactionType:responseStatusCode:requestEndTime:requestDuration:hadError:errorCode:", v17, v18, objc_msgSend(*(id *)(a1 + 32), "interactionType"), objc_msgSend(v13, "statusCode"), v10, 0, v12 - *(double *)(a1 + 64), 0);

  if (v8)
  {
    uint64_t v20 = [*(id *)(a1 + 32) _errorForRequest:*(void *)(a1 + 40) response:v13 data:v7];
    if (v20)
    {
      id v21 = (id)v20;
      _HKInitializeLogging();
      double v22 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        loga = v22;
        uint64_t v23 = objc_opt_class();
        id v24 = *(void **)(a1 + 40);
        id v44 = v23;
        id v40 = [v24 URL];
        id v38 = [v40 absoluteString];
        id v25 = HKSensitiveLogItem();
        uint64_t v26 = objc_msgSend(v21, "hrs_safelyLoggableDescription");
        *(_DWORD *)buf = 138543874;
        id v47 = v23;
        __int16 v48 = 2112;
        os_log_t v49 = v25;
        __int16 v50 = 2112;
        id v51 = v26;
        _os_log_error_impl(&dword_0, loga, OS_LOG_TYPE_ERROR, "%{public}@ response for request %@: %@", buf, 0x20u);
      }
      goto LABEL_12;
    }
    id v30 = *(void **)(a1 + 32);
    if (v7)
    {
      [*(id *)(a1 + 32) _handleResponse:v13 data:v7 endState:v19];
    }
    else
    {
      id v31 = +[NSData data];
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
      uint64_t v27 = objc_msgSend(v21, "hk_OAuth2_errorCode");
      uint64_t v28 = *(void **)(a1 + 32);
      uint64_t v29 = [v19 asErrorEndStateWithErrorCode:v27];
      [v28 _handleError:v21 endState:v29];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_7DC7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7DC8C(uint64_t a1)
{
}

void sub_7DC94(uint64_t a1)
{
}

void sub_7DDB0(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 32))
  {
    id v4 = +[NSAssertionHandler currentHandler];
    id v5 = (const char *)a1[6];
    uint64_t v6 = a1[4];
    id v7 = NSStringFromSelector(v5);
    [v4 handleFailureInMethod:v5, v6, @"HDFHIRRequestTask.m", 225, @"%@ may be called at most once", v7 object file lineNumber description];

    uint64_t v2 = a1[4];
  }
  id v3 = (void *)a1[5];

  objc_storeStrong((id *)(v2 + 32), v3);
}

uint64_t sub_7DECC()
{
  return NSRequestConcreteImplementation();
}

HDSQLiteComparisonPredicate *HDMedicalDownloadAttachmentPredicateForIdentifier(uint64_t a1)
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDMedicalDownloadableAttachmentEntityPropertyIdentifier equalToValue:a1];
}

id HDMedicalDownloadAttachmentPredicateForStatus(uint64_t a1)
{
  uint64_t v1 = HDMedicalDownloadableAttachmentEntityPropertyStatus;
  uint64_t v2 = +[NSNumber numberWithInteger:a1];
  id v3 = +[HDSQLiteComparisonPredicate predicateWithProperty:v1 equalToValue:v2];

  return v3;
}

id HDMedicalDownloadAttachmentPredicateForErrorStatus(uint64_t a1)
{
  uint64_t v1 = HDMedicalDownloadableAttachmentEntityPropertyErrorStatus;
  uint64_t v2 = +[NSNumber numberWithInteger:a1];
  id v3 = +[HDSQLiteComparisonPredicate predicateWithProperty:v1 equalToValue:v2];

  return v3;
}

void sub_7E36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7E38C(void *a1, void *a2, uint64_t a3)
{
  id v85 = a2;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id obj = [(id)a1[4] items];
  id v82 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
  if (v82)
  {
    uint64_t v81 = *(void *)v109;
    __int16 v95 = a1;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v109 != v81) {
          objc_enumerationMutation(obj);
        }
        uint64_t v83 = v4;
        id v5 = *(void **)(*((void *)&v108 + 1) + 8 * v4);
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v87 = v5;
        uint64_t v6 = [v5 units];
        id v89 = [v6 countByEnumeratingWithState:&v104 objects:v119 count:16];
        if (v89)
        {
          uint64_t v7 = *(void *)v105;
          long long v86 = v6;
          uint64_t v88 = *(void *)v105;
          do
          {
            for (i = 0; i != v89; i = (char *)i + 1)
            {
              if (*(void *)v105 != v7) {
                objc_enumerationMutation(v6);
              }
              id v9 = *(void **)(*((void *)&v104 + 1) + 8 * i);
              uint64_t v10 = [v9 downloadableAttachments];
              if (v10)
              {
                double v11 = (void *)v10;
                [v9 medicalRecord];
                double v12 = v90 = v9;
                v91 = i;
                id v13 = (char *)[v12 state];

                BOOL v14 = v13 == (unsigned char *)&dword_0 + 1;
                i = v91;
                if (!v14)
                {
                  id v15 = [v90 medicalRecord];
                  unsigned int v16 = [v15 enteredInError];

                  if (v16)
                  {
                    id v17 = (void *)a1[8];
                    long long v18 = [v90 medicalRecord];
                    id v19 = [v18 UUID];
                    uint64_t v20 = a1[5];
                    id v103 = 0;
                    unsigned __int8 v21 = [v17 _deleteAttachmentsWithMedicalRecordIdentifier:v19 profile:v20 error:&v103];
                    id v22 = v103;

                    if ((v21 & 1) == 0)
                    {
                      _HKInitializeLogging();
                      uint64_t v23 = HKLogHealthRecords;
                      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v78 = (void *)a1[8];
                        *(_DWORD *)buf = 138543619;
                        v114 = v78;
                        __int16 v115 = 2113;
                        id v116 = v22;
                        _os_log_error_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "%{public}@ Failed to delete MedicalDownloadableAttachments for medical record entered-in-error with error: %{private}@", buf, 0x16u);
                      }
                    }
                    uint64_t v7 = v88;
                    i = v91;
                    goto LABEL_56;
                  }
                  id v24 = [v90 medicalRecord];
                  id v25 = [v87 originalFHIRResource];
                  uint64_t v26 = [v25 existingRowID];
                  uint64_t v27 = [v85 databaseForEntityClass:a1[8]];
                  uint64_t v28 = a1[5];
                  id v102 = 0;
                  __int16 v93 = +[HDMedicalRecordEntity _existingMedicalRecord:v24 originalFHIRResourceRowID:v26 database:v27 profile:v28 error:&v102];
                  id v22 = v102;

                  if (v22)
                  {
                    _HKInitializeLogging();
                    uint64_t v29 = (void *)HKLogHealthRecords;
                    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
                    {
                      id v74 = (void *)a1[8];
                      id v75 = v29;
                      uint64_t v76 = [v87 originalFHIRResource];
                      uint64_t v77 = [v76 existingRowID];
                      *(_DWORD *)buf = 138543875;
                      v114 = v74;
                      __int16 v115 = 2114;
                      id v116 = v77;
                      __int16 v117 = 2113;
                      id v118 = v22;
                      _os_log_error_impl(&dword_0, v75, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find _existingMedicalRecord for FHIR row id %{public}@ with error: %{private}@", buf, 0x20u);
                    }
                    uint64_t v6 = v86;
                    uint64_t v7 = v88;
                    i = v91;
                    goto LABEL_55;
                  }
                  id v30 = [v90 clinicalRecord];

                  if (v30)
                  {
                    id v31 = [v90 clinicalRecord];
                    id v32 = [v87 originalFHIRResource];
                    long long v33 = [v32 existingRowID];
                    uint64_t v34 = a1[5];
                    id v101 = 0;
                    id v35 = +[HDClinicalRecordEntity _existingClinicalRecord:v31 originalFHIRResourceRowID:v33 profile:v34 error:&v101];
                    id v22 = v101;

                    if (v22)
                    {
                      _HKInitializeLogging();
                      id v36 = (void *)HKLogHealthRecords;
                      uint64_t v6 = v86;
                      uint64_t v7 = v88;
                      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
                      {
                        id v37 = (void *)v95[8];
                        id v38 = v36;
                        id v39 = [v87 originalFHIRResource];
                        id v40 = [v39 existingRowID];
                        *(_DWORD *)buf = 138543875;
                        v114 = v37;
                        __int16 v115 = 2114;
                        id v116 = v40;
                        __int16 v117 = 2113;
                        id v118 = v22;
                        _os_log_error_impl(&dword_0, v38, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find _existingClinicalRecord for FHIR row id %{public}@ with error: %{private}@", buf, 0x20u);

                        uint64_t v6 = v86;
                        goto LABEL_53;
                      }
                      goto LABEL_54;
                    }
                  }
                  else
                  {
                    id v35 = 0;
                  }
                  long long v99 = 0u;
                  long long v100 = 0u;
                  long long v97 = 0u;
                  long long v98 = 0u;
                  id v94 = [v90 downloadableAttachments];
                  id v41 = [v94 countByEnumeratingWithState:&v97 objects:v112 count:16];
                  if (v41)
                  {
                    id v42 = v41;
                    id v22 = 0;
                    uint64_t v43 = *(void *)v98;
                    uint64_t v92 = *(void *)v98;
                    do
                    {
                      for (j = 0; j != v42; j = (char *)j + 1)
                      {
                        if (*(void *)v98 != v43) {
                          objc_enumerationMutation(v94);
                        }
                        id v45 = *(void **)(*((void *)&v97 + 1) + 8 * (void)j);
                        if ([v45 type])
                        {
                          _HKInitializeLogging();
                          id v46 = (void *)HKLogHealthRecords;
                          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
                          {
                            id v47 = (objc_class *)v95[8];
                            __int16 v48 = v46;
                            os_log_t v49 = NSStringFromClass(v47);
                            id v50 = [v45 type];
                            *(_DWORD *)buf = 138543618;
                            v114 = v49;
                            __int16 v115 = 2048;
                            id v116 = v50;
                            _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ MedicalDownloadableAttachment type not supported: %ld", buf, 0x16u);
                          }
                        }
                        else
                        {
                          id v51 = [v93 UUID];
                          __int16 v52 = v51;
                          if (v51)
                          {
                            id v53 = v51;
                          }
                          else
                          {
                            id v53 = [v45 medicalRecordIdentifier];
                          }
                          __int16 v54 = v53;

                          __int16 v55 = v35;
                          id v56 = [v35 UUID];
                          id v57 = v56;
                          if (v56)
                          {
                            id v58 = v56;
                          }
                          else
                          {
                            id v58 = [v45 clinicalRecordIdentifier];
                          }
                          __int16 v59 = v58;

                          id v60 = [v45 copyForAccountWithIdentifier:v95[6] medicalRecordIdentifier:v54 clinicalRecordIdentifier:v59];
                          __int16 v61 = (void *)v95[8];
                          uint64_t v62 = v95[5];
                          id v96 = v22;
                          unsigned __int8 v63 = [v61 _processClinicalNotesType:v60 medicalRecord:v93 clinicalRecord:v55 profile:v62 error:&v96];
                          id v64 = v96;

                          if (v63)
                          {
                            ++*(void *)(*(void *)(v95[7] + 8) + 24);
                          }
                          else
                          {
                            _HKInitializeLogging();
                            __int16 v65 = (void *)HKLogHealthRecords;
                            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
                            {
                              id v66 = (void *)v95[8];
                              id v67 = v65;
                              id v68 = [v93 UUID];
                              *(_DWORD *)buf = 138543875;
                              v114 = v66;
                              __int16 v115 = 2114;
                              id v116 = v68;
                              __int16 v117 = 2113;
                              id v118 = v64;
                              _os_log_error_impl(&dword_0, v67, OS_LOG_TYPE_ERROR, "%{public}@ Failed in _processClinicalNotesType for MedicalRecord with UUID %{public}@ with error: %{private}@", buf, 0x20u);
                            }
                          }

                          id v22 = v64;
                          id v35 = v55;
                          uint64_t v43 = v92;
                        }
                      }
                      id v42 = [v94 countByEnumeratingWithState:&v97 objects:v112 count:16];
                    }
                    while (v42);
                  }
                  else
                  {
                    id v22 = 0;
                  }

                  if (v93)
                  {
                    __int16 v69 = (void *)v95[8];
                    uint64_t v70 = [v93 UUID];
                    id v71 = [v90 downloadableAttachments];
                    v72 = [v93 attachmentObjectIdentifier];
                    id v73 = [v35 attachmentObjectIdentifier];
                    [v69 _checkForObsoleteDownloadableAttachmentsForMedicalRecord:v70 extractedDownloadableAttachments:v71 medicalObjectIdentifier:v72 clinicalObjectIdentifier:v73 profile:v95[5] error:a3];
                  }
                  uint64_t v6 = v86;
LABEL_53:
                  uint64_t v7 = v88;
LABEL_54:
                  i = v91;

                  a1 = v95;
LABEL_55:

LABEL_56:
                  continue;
                }
              }
            }
            id v89 = [v6 countByEnumeratingWithState:&v104 objects:v119 count:16];
          }
          while (v89);
        }

        uint64_t v4 = v83 + 1;
      }
      while ((id)(v83 + 1) != v82);
      id v82 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
    }
    while (v82);
  }

  return 1;
}

id sub_7ECAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDMedicalDownloadableAttachmentsInExtractionResultJournalEntry alloc] initWithExtractionResult:*(void *)(a1 + 32) accountIdentifier:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 48) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

void sub_7F3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7F3D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7F3E4(uint64_t a1)
{
}

uint64_t sub_7F3EC(uint64_t a1, uint64_t a2)
{
  return 1;
}

int64_t sub_7F9C8(id a1, HDAttachment *a2, HDAttachment *a3)
{
  uint64_t v4 = a2;
  id v5 = [(HDAttachment *)a3 creationDate];
  uint64_t v6 = [(HDAttachment *)v4 creationDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

uint64_t sub_7FB94(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([*(id *)(a1 + 48) _attachmentMatchesDownloadableAttachment:*(void *)(a1 + 32) hdAttachment:v4])objc_msgSend(*(id *)(a1 + 40), "addObject:", v4); {

  }
  return 1;
}

uint64_t sub_7FD40(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 48) _attachmentMatchesDownloadableAttachment:*(void *)(a1 + 32) hdAttachment:a3])objc_msgSend(*(id *)(a1 + 40), "addObject:", v5); {

  }
  return 1;
}

void sub_801C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_801EC(uint64_t a1, uint64_t a2)
{
  return 1;
}

void sub_8079C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t sub_807DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v23 = a1;
    id obj = v4;
    char v7 = 0;
    uint64_t v25 = *(void *)v27;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v10 = [v3 webURL];
        if (v10)
        {
          double v11 = (void *)v10;
          uint64_t v12 = [v9 webURL];
          if (v12)
          {
            id v13 = (void *)v12;
            BOOL v14 = [v3 webURL];
            id v15 = [v9 webURL];
            unsigned __int8 v16 = [v14 isEqual:v15];

            if (v16)
            {
              char v7 = 1;
              continue;
            }
          }
          else
          {
          }
        }
        id v17 = [v3 inlineDataChecksum];
        if (v17)
        {
          long long v18 = [v9 inlineDataChecksum];
          if (v18)
          {
            id v19 = [v3 inlineDataChecksum];
            uint64_t v20 = [v9 inlineDataChecksum];
            unsigned __int8 v21 = [v19 isEqual:v20];
          }
          else
          {
            unsigned __int8 v21 = 0;
          }
        }
        else
        {
          unsigned __int8 v21 = 0;
        }

        v7 |= v21;
      }
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v6)
      {

        a1 = v23;
        if (v7) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
  }

LABEL_23:
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
LABEL_24:

  return 1;
}

uint64_t sub_80BB0()
{
  HDSQLiteBindUUIDToProperty();
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindNullToProperty();
  HDSQLiteBindNullToProperty();
  HDSQLiteBindInt64ToProperty();

  return HDSQLiteBindNullToProperty();
}

uint64_t sub_80DC0()
{
  return HDSQLiteBindUUIDToProperty();
}

void sub_81000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_8102C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 identifier];
  [v2 addObject:v3];

  return 1;
}

uint64_t sub_81674(uint64_t a1)
{
  return 1;
}

uint64_t sub_81694(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_816B8(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) UUID];
  HDSQLiteBindUUIDToProperty();

  return HDSQLiteBindSecureCodingObjectToProperty();
}

uint64_t sub_81B1C(uint64_t a1)
{
  return 1;
}

void sub_81B3C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) UUID];
  HDSQLiteBindUUIDToProperty();
}

void sub_81D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_81D24(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 48) _attachmentEntityForIdentifier:*(void *)(a1 + 32) databaseTransaction:v5 error:a3];
  if (v6)
  {
    char v7 = [*(id *)(a1 + 48) _propertiesForEntity];
    id v8 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_81E2C;
    v11[3] = &unk_1145D0;
    long long v12 = *(_OWORD *)(a1 + 40);
    id v9 = [v6 getValuesForProperties:v7 database:v8 handler:v11];
  }
  else
  {
    id v9 = &dword_0 + 1;
  }

  return v9;
}

uint64_t sub_81E2C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_msgSend(*(id *)(a1 + 40), "attachmentForRow:");

  return _objc_release_x1();
}

uint64_t sub_81F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v7 = [*(id *)(a1 + 40) attachmentForRow:a4];
  if (v7)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v9 = +[NSError hk_error:129 description:@"Failed to decode HKMedicalDownloadableAttachment from row"];
    if (v9)
    {
      if (a5) {
        *a5 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v8 = 0;
  }

  return v8;
}

void sub_82190(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v1 = +[NSDate now];
  HDSQLiteBindDateToProperty();
}

void sub_82648(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  HDSQLiteBindUUIDToProperty();

  id v3 = [*(id *)(a1 + 32) medicalRecordIdentifier];
  HDSQLiteBindUUIDToProperty();

  id v4 = [*(id *)(a1 + 32) clinicalRecordIdentifier];
  HDSQLiteBindUUIDToProperty();

  id v5 = [*(id *)(a1 + 32) accountIdentifier];
  HDSQLiteBindUUIDToProperty();

  id v6 = [*(id *)(a1 + 32) FHIRVersion];
  char v7 = [v6 stringRepresentation];
  HDSQLiteBindStringToProperty();

  [*(id *)(a1 + 32) type];
  HDSQLiteBindInt64ToProperty();
  [*(id *)(a1 + 32) status];
  HDSQLiteBindInt64ToProperty();
  [*(id *)(a1 + 32) errorStatus];
  HDSQLiteBindInt64ToProperty();
  uint64_t v8 = [*(id *)(a1 + 32) title];
  HDSQLiteBindStringToProperty();

  id v9 = [*(id *)(a1 + 32) webURL];
  uint64_t v10 = [v9 absoluteString];
  HDSQLiteBindStringToProperty();

  double v11 = [*(id *)(a1 + 32) sizeInBytes];
  HDSQLiteBindNumberToProperty();

  long long v12 = [*(id *)(a1 + 32) contentType];
  HDSQLiteBindStringToProperty();

  id v13 = [*(id *)(a1 + 32) locale];
  BOOL v14 = [v13 localeIdentifier];
  HDSQLiteBindStringToProperty();

  id v15 = [*(id *)(a1 + 32) expectedHash];
  HDSQLiteBindDataToProperty();

  unsigned __int8 v16 = [*(id *)(a1 + 32) creationDate];
  HDSQLiteBindDateToProperty();

  [*(id *)(a1 + 32) retryCount];
  HDSQLiteBindInt64ToProperty();
  id v17 = [*(id *)(a1 + 32) nextRetryDate];
  HDSQLiteBindDateToProperty();

  long long v18 = [*(id *)(a1 + 32) lastUpdatedDate];
  HDSQLiteBindDateToProperty();

  id v19 = [*(id *)(a1 + 32) lastError];
  HDSQLiteBindSecureCodingObjectToProperty();

  uint64_t v20 = [*(id *)(a1 + 32) fileURL];
  unsigned __int8 v21 = [v20 path];
  HDSQLiteBindStringToProperty();

  id v22 = [*(id *)(a1 + 32) inlineData];
  HDSQLiteBindDataToProperty();

  uint64_t v23 = [*(id *)(a1 + 32) inlineDataChecksum];
  HDSQLiteBindDataToProperty();

  id v24 = [*(id *)(a1 + 32) attachmentIdentifier];
  HDSQLiteBindUUIDToProperty();

  id v25 = [*(id *)(a1 + 32) metadata];
  HDSQLiteBindSecureCodingObjectToProperty();
}

void sub_83134(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id sub_83D78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performProtectedDataAvailableChecks");
}

uint64_t sub_83E8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_83FA8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 81) = [a2 didUpdateGatewaysFromProviderService];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_841DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

id sub_84284(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didReceiveFHIRResourceSyncEntities");
}

id sub_8446C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _taskWillReallyBegin];
}

id sub_84474(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _taskDidFinish:a2];
}

void *sub_84480(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  uint64_t v3 = result[7];
  if (!v3)
  {
    objc_msgSend(result, "_queue_setIngestionState:", 2);
    uint64_t result = *(void **)(a1 + 32);
    uint64_t v3 = result[7];
  }
  result[7] = v3 + 1;
  return result;
}

id sub_84538(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setIngestionState:", 3);
}

id sub_84804(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    [*(id *)(a1 + 32) _enableCHRNotificationsIfNeeded];
    [*(id *)(a1 + 32) _badgeForNewHealthRecordsFromTask:*(void *)(a1 + 40)];
    uint64_t v2 = *(void *)(a1 + 56);
    unint64_t v3 = *(void *)(a1 + 72);
    if (*(void *)(a1 + 64) > v3 || v2 == 0)
    {
      [*(id *)(a1 + 32) _notifyForNewHealthRecordsFromTask:*(void *)(a1 + 40)];
      if (!v2) {
        goto LABEL_10;
      }
      unint64_t v3 = *(void *)(a1 + 72);
      uint64_t v2 = *(void *)(a1 + 56);
    }
    [*(id *)(a1 + 32) _notifyForNewHealthLabRecordsFromTask:*(void *)(a1 + 40) countOfAllLabs:v3 countOfPinnedLabs:v2];
  }
LABEL_10:
  --*(void *)(*(void *)(a1 + 32) + 56);
  id v5 = *(void **)(a1 + 32);
  if (!v5[7]) {
    objc_msgSend(v5, "_queue_setIngestionState:", 1);
  }
  id v6 = *(void **)(a1 + 48);

  return [v6 invalidate];
}

id sub_84940(uint64_t a1, void *a2)
{
  return [a2 clinicalIngestionManager:*(void *)(a1 + 32) willChangeIngestionState:*(void *)(a1 + 40)];
}

id sub_84B14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performMaintenanceIngestionWithReason:*(void *)(a1 + 40) completion:a2];
}

void sub_84BA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = 0;
}

void sub_84C84(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 taskSuccess] & 1) == 0)
  {
    _HKInitializeLogging();
    id v4 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B2B0C(v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_84DEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 taskSuccess] & 1) == 0)
  {
    _HKInitializeLogging();
    id v4 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B2BAC(a1, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_84F54(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 taskSuccess] & 1) == 0)
  {
    _HKInitializeLogging();
    id v4 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B2C50(a1, v4);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [v3 taskError];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

void sub_851DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_85288;
  v8[3] = &unk_114760;
  void v8[4] = v5;
  id v9 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 _performExtractionWithReason:v4 completion:v8];
}

void sub_85288(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "unitTesting_didCompleteScheduledExtraction");
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_8598C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B3010(a1, v6, (uint64_t)v5);
    }
  }
}

void sub_85C40(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B30DC(a1, (uint64_t)v5, v6);
    }
  }
}

void sub_8620C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_86224(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_86234(uint64_t a1)
{
}

BOOL sub_8623C(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[6];
  id v6 = a2;
  id v7 = [v5 _queryForNextScheduledReminderInTransaction:v6];
  id v8 = (void *)a1[6];
  uint64_t v9 = a1[4];
  id v16 = 0;
  uint64_t v10 = [v8 _firstQueryResultAsReminder:v7 profile:v9 transaction:v6 error:&v16];

  id v11 = v16;
  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;

  id v14 = v11;
  if (v14)
  {
    if (a3) {
      *a3 = v14;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v14 == 0;
}

void sub_86468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_86480(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[6];
  id v6 = a2;
  id v7 = [v5 _queryForLastPostedReminderInTransaction:v6];
  id v8 = (void *)a1[6];
  uint64_t v9 = a1[4];
  id v16 = 0;
  uint64_t v10 = [v8 _firstQueryResultAsReminder:v7 profile:v9 transaction:v6 error:&v16];

  id v11 = v16;
  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;

  id v14 = v11;
  if (v14)
  {
    if (a3) {
      *a3 = v14;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v14 == 0;
}

void sub_86850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_86874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) persistentID];
  id v12 = 0;
  uint64_t v7 = [v5 objectForPersistentID:v6 row:a3 error:&v12];
  id v8 = v12;
  id v9 = v12;
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v8);
  }
}

void sub_86BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_86BF4(void *a1, uint64_t a2, void *a3)
{
  id v5 = (void *)a1[7];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  id v14 = 0;
  uint64_t v8 = [v5 _reminderForSource:v6 profile:v7 transaction:a2 error:&v14];
  id v9 = v14;
  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  id v12 = v9;
  if (v12)
  {
    if (a3) {
      *a3 = v12;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v12 == 0;
}

void sub_86FF4(uint64_t a1)
{
  [*(id *)(a1 + 32) persistentID];
  HDSQLiteBindInt64ToProperty();
  uint64_t v2 = [*(id *)(a1 + 40) creationDate];
  HDSQLiteBindDateToProperty();

  id v3 = [*(id *)(a1 + 40) postDate];
  HDSQLiteBindDateToProperty();
}

void sub_87238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_87250(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v20 = 0;
  uint64_t v9 = [v6 _reminderForSource:v7 profile:v8 transaction:v5 error:&v20];
  id v10 = v20;
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v13 = &dword_0 + 1;
  }
  else
  {
    id v14 = v10;
    if (v14)
    {
      id v15 = v14;
      if (a3)
      {
        id v13 = 0;
        *a3 = v14;
      }
      else
      {
        _HKLogDroppedError();
        id v13 = 0;
      }
    }
    else
    {
      id v15 = objc_alloc_init((Class)NSDate);
      uint64_t v16 = [[HDClinicalAPIReminder alloc] initWithSource:*(void *)(a1 + 32) creationDate:v15 postDate:0];
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      id v13 = [*(id *)(a1 + 56) _insertReminder:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) profile:*(void *)(a1 + 40) transaction:v5 error:a3];
    }
  }
  return v13;
}

void sub_87528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_87540(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 32);
  id v22 = 0;
  uint64_t v8 = [v6 _entityForReminder:v7 transaction:v5 error:&v22];
  id v9 = v22;
  id v10 = v9;
  if (v8)
  {
    CFStringRef v23 = @"date_posted";
    uint64_t v11 = +[NSArray arrayWithObjects:&v23 count:1];
    id v12 = [v5 unprotectedDatabase];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_8777C;
    v20[3] = &unk_111B40;
    id v21 = *(id *)(a1 + 40);
    unsigned int v13 = [v8 updateProperties:v11 database:v12 error:a3 bindingHandler:v20];

    if (v13)
    {
      uint64_t v14 = [v8 _instantiateObjectWithProfile:*(void *)(a1 + 48) transaction:v5 error:a3];
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      BOOL v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
    }
    else
    {
      BOOL v17 = 0;
    }
    a1 = (uint64_t)v21;
    goto LABEL_15;
  }
  if (v9)
  {
    id v18 = v9;
  }
  else
  {
    a1 = HKSensitiveLogItem();
    id v18 = +[NSError hk_error:100, @"No entity for reminder %@", a1 format];
    if (!v18)
    {
LABEL_14:

      BOOL v17 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  if (a3) {
    *a3 = v18;
  }
  else {
    _HKLogDroppedError();
  }

  if (!v10) {
    goto LABEL_14;
  }
  BOOL v17 = 0;
LABEL_16:

  return v17;
}

uint64_t sub_8777C()
{
  return HDSQLiteBindDateToProperty();
}

unint64_t sub_87908(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) sourceManager];
  uint64_t v7 = *(void *)(a1 + 40);
  id v16 = 0;
  uint64_t v8 = [v6 localSourceForBundleIdentifier:v7 error:&v16];
  id v9 = v16;

  if (v8)
  {
    id v10 = *(void **)(a1 + 48);
    id v11 = [v5 unprotectedDatabase];
    id v12 = [*(id *)(a1 + 48) _predicateForReminderWithSourceEntity:v8];
    unint64_t v13 = (unint64_t)[v10 deleteEntitiesInDatabase:v11 predicate:v12 error:a3];
  }
  else
  {
    id v15 = v9;
    id v11 = v15;
    unint64_t v13 = v15 == 0;
    if (v15)
    {
      if (a3)
      {
        id v11 = v15;
        unint64_t v13 = 0;
        *a3 = v11;
      }
      else
      {
        _HKLogDroppedError();
        unint64_t v13 = 0;
      }
    }
  }

  return v13;
}

void sub_87E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_87EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectForPersistentID:row:error:", a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

void sub_88520(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = HKLogHealthRecords;
  if (a2)
  {
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed runMedicalDownloadableAttachmentPipelineWithCompletion successfully", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    sub_B3160(a1, (uint64_t)v5, v6);
  }
}

uint64_t sub_89504(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  return 1;
}

uint64_t sub_896E8(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsUUID();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return 1;
}

uint64_t sub_8A224()
{
  HDSQLiteBindInt64ToProperty();

  return HDSQLiteBindDateToProperty();
}

uint64_t sub_8A420(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) path];
  HDSQLiteBindStringToProperty();

  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindNullToProperty();
  HDSQLiteBindInt64ToProperty();

  return HDSQLiteBindNullToProperty();
}

uint64_t sub_8A6A0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) content];
  HDSQLiteBindDataToProperty();

  uint64_t v3 = [*(id *)(a1 + 32) contentType];
  HDSQLiteBindStringToProperty();

  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindNullToProperty();
  HDSQLiteBindInt64ToProperty();

  return HDSQLiteBindNullToProperty();
}

uint64_t sub_8A91C()
{
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindNullToProperty();
  HDSQLiteBindInt64ToProperty();

  return HDSQLiteBindNullToProperty();
}

uint64_t sub_8ABD0()
{
  HDSQLiteBindInt64ToProperty();
  HDSQLiteBindSecureCodingObjectToProperty();
  HDSQLiteBindInt64ToProperty();

  return HDSQLiteBindDateToProperty();
}

uint64_t sub_8ADB8()
{
  return HDSQLiteBindDateToProperty();
}

void sub_8BA74(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B3618(a1, v6, v5);
    }
  }
  _HKInitializeLogging();
  uint64_t v7 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: downloading batch completed", (uint8_t *)&v9, 0xCu);
  }
}

void sub_8CBC0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) path];
  HDSQLiteBindStringToProperty();
}

void sub_8DCF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v5 attachmentIdentifiers];
    int v9 = (void **)(a1 + 48);
    uint64_t v10 = [*(id *)(a1 + 48) attachmentIdentifier];
    unsigned __int8 v11 = [v8 containsObject:v10];

    if (v11)
    {
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      id v35 = 0;
      unsigned __int8 v14 = [v12 updateStatusAndClearErrorForAttachmentWithIdentifier:v13 status:6 error:&v35];
      id v15 = v35;
      if (v14)
      {
        uint64_t v16 = objc_msgSend(*(id *)(a1 + 32), "unitTesting_didFinishIndexingNotification");
        BOOL v17 = v16;
        if (v16) {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
        }
      }
      else
      {
        _HKInitializeLogging();
        id v25 = (void *)HKLogHealthRecords;
        if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        uint64_t v31 = *(void *)(a1 + 32);
        uint64_t v32 = *(void *)(a1 + 40);
        BOOL v17 = v25;
        long long v33 = [v15 localizedDescription];
        uint64_t v34 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        uint64_t v38 = v31;
        __int16 v39 = 2114;
        uint64_t v40 = v32;
        __int16 v41 = 2114;
        id v42 = v34;
        _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed update status for attachment %{public}@. Error: %{public}@", buf, 0x20u);
      }
LABEL_16:

      goto LABEL_17;
    }
    _HKInitializeLogging();
    id v24 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B37FC(v9, v24);
    }
  }
  else
  {
    id v18 = v6;
    if (!v18)
    {
      id v18 = +[NSError hk_error:2000 format:@"Indexing failed for unknown reason."];
    }
    id v19 = *(void **)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 40);
    id v21 = (char *)[*(id *)(a1 + 48) retryCount];
    id v36 = 0;
    LOBYTE(v20) = [v19 updateErrorStatusAndRetryCountForAttachmentWithIdentifier:v20 errorStatus:4 lastError:v18 retryCount:v21 + 1 error:&v36];
    id v22 = v36;
    if ((v20 & 1) == 0)
    {
      _HKInitializeLogging();
      CFStringRef v23 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = *(void *)(a1 + 40);
        long long v28 = v23;
        long long v29 = [v22 localizedDescription];
        id v30 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        uint64_t v38 = v26;
        __int16 v39 = 2114;
        uint64_t v40 = v27;
        __int16 v41 = 2114;
        id v42 = v30;
        _os_log_error_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "%{public}@: Failed update error status for attachment %{public}@. Error: %{public}@", buf, 0x20u);
      }
    }
  }
LABEL_17:
}

uint64_t sub_8E4F4(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsUUID();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return 1;
}

id sub_8EF48(uint64_t a1, void *a2)
{
  return [a2 downloadableAttachmentDidChangeState:*(void *)(a1 + 32)];
}

uint64_t sub_8F00C()
{
  return v0;
}

void sub_92158(uint64_t a1)
{
  HDSQLiteBindNullToProperty();
  uint64_t v2 = [*(id *)(a1 + 32) loginURL];
  uint64_t v3 = [v2 query];
  HDSQLiteBindStringToProperty();

  uint64_t v4 = [*(id *)(a1 + 32) state];
  HDSQLiteBindUUIDToProperty();

  id v5 = [*(id *)(a1 + 32) pkceVerifier];
  HDSQLiteBindStringToProperty();

  HDSQLiteBindDateToProperty();
  HDSQLiteBindNumberToProperty();
  HDSQLiteBindNumberToProperty();
  id v6 = [*(id *)(a1 + 32) requestedScope];
  HDSQLiteBindStringToProperty();
}

uint64_t sub_9273C()
{
  return HDSQLiteBindStringToProperty();
}

id sub_9289C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = [a2 databaseForEntityClass:v5];
  id v7 = [v5 deleteEntitiesInDatabase:v6 predicate:*(void *)(a1 + 32) error:a3];

  return v7;
}

id sub_92900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [(HDClinicalAuthorizationSessionJournalEntry *)[HDClinicalAuthorizationSessionDeleteJournalEntry alloc] initWithState:*(void *)(a1 + 32)];
  id v6 = [*(id *)(a1 + 40) addJournalEntry:v5 error:a3];

  return v6;
}

void sub_92C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_92C80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_92C90(uint64_t a1)
{
}

void sub_92C98(uint64_t a1)
{
  HDSQLiteColumnWithNameAsString();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    id v2 = objc_alloc((Class)HKOAuth2TokenSession);
    uint64_t v3 = HDSQLiteColumnWithNameAsString();
    uint64_t v4 = HDSQLiteColumnWithNameAsString();
    id v5 = HDSQLiteColumnWithNameAsUUID();
    id v6 = HDSQLiteColumnWithNameAsString();
    id v7 = [v2 initWithCode:v10 query:v3 requestedScope:v4 state:v5 pkceVerifier:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

uint64_t sub_93EB8()
{
  HDSQLiteBindStringToProperty();

  return HDSQLiteBindNumberToProperty();
}

void sub_941FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_9421C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scheduleTriggers];
}

id sub_9433C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleTriggers");
  id v2 = *(void **)(a1 + 40);

  return [v2 invalidate];
}

id sub_94D40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_firePendingReminderIfEligibleUsingPendingReminderID:transaction:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

id sub_950FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleUserNotificationResponse:a3 pendingReminderID:*(void *)(a1 + 40) transaction:*(void *)(a1 + 48)];
}

id sub_95224(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleUserNotificationResponse:pendingReminderID:transaction:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void sub_9557C(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_unitTesting_testingEventListener");
  [v2 launchedClinicalSettingsForSource:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v4 = _HKCreateActivityForCHRAPIAppSettings();

  id v11 = 0;
  id v5 = +[LSApplicationRecord bundleRecordWithApplicationIdentifier:kHKHealthAppBundleIdentifier error:&v11];
  id v6 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v5)
    {
      id v7 = objc_alloc_init((Class)_LSOpenConfiguration);
      uint64_t v8 = +[LSApplicationWorkspace defaultWorkspace];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_95748;
      v9[3] = &unk_1139C8;
      id v10 = v4;
      [v8 openUserActivity:v10 usingApplicationRecord:v5 configuration:v7 completionHandler:v9];
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_B4460();
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_B44C8();
    }
  }
}

void sub_95748(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B4530(a1, (uint64_t)v5, v6);
    }
  }
}

id sub_958AC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleTriggers");
  _HKInitializeLogging();
  id v2 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B45AC(a1, v2, v3, v4, v5, v6, v7, v8);
  }
  return [*(id *)(a1 + 48) invalidate];
}

void sub_95AE4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) profile];
  id v6 = 0;
  uint64_t v4 = +[HDClinicalAPIReminderEntity reminderForSource:v2 createIfNecessary:1 profile:v3 error:&v6];
  id v5 = v6;

  objc_msgSend(*(id *)(a1 + 40), "_queue_scheduleTriggers");
  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v4 != 0, v5);
}

void sub_95D64(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) bundleIdentifier];
  id v5 = 0;
  objc_msgSend(v2, "_queue_deregisterAppWithBundleIdentifier:error:", v3, &v5);
  id v4 = v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleTriggers");
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_96674(id *a1)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = a1[4];
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v19;
    *(void *)&long long v4 = 138412546;
    long long v16 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v7);
        id v9 = a1[5];
        id v17 = 0;
        unsigned __int8 v10 = objc_msgSend(v9, "_queue_deregisterAppWithBundleIdentifier:error:", v8, &v17, v16);
        id v11 = v17;
        if ((v10 & 1) == 0)
        {
          _HKInitializeLogging();
          id v12 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = v12;
            unsigned __int8 v14 = HKSensitiveLogItem();
            *(_DWORD *)buf = v16;
            CFStringRef v23 = v14;
            __int16 v24 = 2114;
            id v25 = v11;
            _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Failed to deregister app with bundle ID %@ from unlimited auth confirmation: %{public}@", buf, 0x16u);
          }
        }

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v5);
  }

  [a1[6] invalidate];
  id v15 = objc_msgSend(a1[5], "_unitTesting_testingEventListener");
  [v15 handledApplicationsUninstalled];
}

id sub_96BF4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stopListeningForHomescreenUnlockNotifications");
}

void sub_96D2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_96D50(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    _HKInitializeLogging();
    id v9 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v21 = 138543362;
      uint64_t v22 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Running XPC activity %{public}@", (uint8_t *)&v21, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _handleFirstUnlock];

    xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 48));
    if (!xpc_activity_set_state(v3, 3))
    {
      _HKInitializeLogging();
      id v12 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B49B8(a1, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  else if (!state)
  {
    _HKInitializeLogging();
    uint64_t v6 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v21 = 138543362;
      uint64_t v22 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Checking in for XPC activity %{public}@", (uint8_t *)&v21, 0xCu);
    }
    xpc_object_t v8 = xpc_activity_copy_criteria(v3);
    if (v8)
    {
    }
    else
    {
      _HKInitializeLogging();
      long long v19 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        int v21 = 138543362;
        uint64_t v22 = v20;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Updating XPC activity criteria for %{public}@", (uint8_t *)&v21, 0xCu);
      }
      xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 40));
    }
  }
}

void sub_97B4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_985A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = *(void **)(a1 + 32);
  if (a2) {
    [v5 _handleTaskCompletedWithData:a2 endState:a3];
  }
  else {
    [v5 _handleTaskError:a4 retryCount:*(void *)(a1 + 40) endState:a3];
  }
  uint64_t v6 = [*(id *)(a1 + 32) fetchGroup];
  dispatch_group_leave(v6);
}

unint64_t HDFHIRQueryModeFromHKFHIRResourceQueryMode(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >= 3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B4CF8();
    }
    return 0;
  }
  return v1;
}

uint64_t sub_98680(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_98690(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_99104(id a1)
{
  id v1 = objc_alloc_init((Class)NSISO8601DateFormatter);
  uint64_t v2 = (void *)qword_137198;
  qword_137198 = (uint64_t)v1;

  [(id)qword_137198 setFormatOptions:275];
  id v3 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [(id)qword_137198 setTimeZone:v3];
}

void sub_99204(id a1)
{
  id v1 = objc_alloc_init((Class)NSISO8601DateFormatter);
  uint64_t v2 = (void *)qword_1371A8;
  qword_1371A8 = (uint64_t)v1;

  [(id)qword_1371A8 setFormatOptions:1907];
  id v3 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [(id)qword_1371A8 setTimeZone:v3];
}

id sub_9A548(uint64_t a1)
{
  uint64_t v1 = [&off_11D7D0 objectForKeyedSubscript:a1];
  uint64_t v2 = (void *)v1;
  id v3 = &off_11D380;
  if (v1) {
    id v3 = (_UNKNOWN **)v1;
  }
  long long v4 = v3;

  id v5 = [v4 integerValue];
  return v5;
}

uint64_t HKFHIRResourceQueryModeFromHDFHIRQueryMode(uint64_t a1)
{
  if (a1 == 1) {
    return 1;
  }
  else {
    return 2 * (a1 == 2);
  }
}

void sub_9C024(id a1)
{
  v3[0] = HDOriginalFHIRResourceEntityPropertyType;
  v3[1] = HDOriginalFHIRResourceEntityPropertyAccountID;
  v3[2] = HDOriginalFHIRResourceEntityPropertyResourceID;
  v3[3] = HDOriginalFHIRResourceEntityPropertySyncProvenance;
  v3[4] = HDOriginalFHIRResourceEntityPropertyRawContent;
  v3[5] = HDOriginalFHIRResourceEntityPropertyUniquenessChecksum;
  v3[6] = HDOriginalFHIRResourceEntityPropertyReceivedDate;
  v3[7] = HDOriginalFHIRResourceEntityPropertyReceivedDateTimeZone;
  v3[8] = HDOriginalFHIRResourceEntityPropertyFirstSeenDate;
  v3[9] = HDOriginalFHIRResourceEntityPropertyFirstSeenDateTimeZone;
  v3[10] = HDOriginalFHIRResourceEntityPropertyFHIRVersion;
  v3[11] = HDOriginalFHIRResourceEntityPropertySourceURL;
  v3[12] = HDOriginalFHIRResourceEntityPropertyExtractionHints;
  v3[13] = HDOriginalFHIRResourceEntityPropertyOriginMajorVersion;
  void v3[14] = HDOriginalFHIRResourceEntityPropertyOriginMinorVersion;
  v3[15] = HDOriginalFHIRResourceEntityPropertyOriginPatchVersion;
  v3[16] = HDOriginalFHIRResourceEntityPropertyOriginBuild;
  v3[17] = HDOriginalFHIRResourceEntityPropertySyncIdentity;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:18];
  uint64_t v2 = (void *)qword_1371B8;
  qword_1371B8 = v1;
}

void sub_9C1E4(id a1)
{
  v3[0] = HDOriginalFHIRResourceEntityPropertyRawContent;
  v3[1] = HDOriginalFHIRResourceEntityPropertyFHIRVersion;
  v3[2] = HDOriginalFHIRResourceEntityPropertySourceURL;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:3];
  uint64_t v2 = (void *)qword_1371C8;
  qword_1371C8 = v1;
}

void sub_9C62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

BOOL sub_9C664(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 80)];
  uint64_t v6 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:*(void *)(a1 + 32) database:v5 error:a3];
  uint64_t v7 = [v6 accountInDatabase:v5 error:a3];
  if (v7)
  {
    uint64_t v8 = HDOriginalFHIRResourceEntityPropertyAccountID;
    uint64_t v9 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 persistentID]);
    uint64_t v10 = +[HDSQLiteComparisonPredicate predicateWithProperty:v8 equalToValue:v9];

    id v11 = [*(id *)(a1 + 40) integerValue];
    id v12 = [v7 lastExtractedRulesVersion];
    id v13 = [v12 integerValue];

    if ((uint64_t)v11 <= (uint64_t)v13)
    {
      uint64_t v15 = [v7 lastExtractedRowID];

      if (v15)
      {
        uint64_t v16 = HDSQLEntityPropertyPersistentID;
        uint64_t v17 = [v7 lastExtractedRowID];
        uint64_t v18 = +[HDSQLiteComparisonPredicate predicateWithProperty:v16 greaterThanValue:v17];

        uint64_t v19 = +[HDSQLitePredicate compoundPredicateWithPredicate:v18 otherPredicate:v10];

        uint64_t v20 = [v7 lastExtractedRowID];
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v20 longValue];

        uint64_t v10 = (void *)v19;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    int v21 = [v7 gateway];
    uint64_t v22 = [v21 country];
    CFStringRef v23 = (void *)v22;
    __int16 v24 = (void *)HKCountryCodeUnknownCountry;
    if (v22) {
      __int16 v24 = (void *)v22;
    }
    id v25 = v24;

    uint64_t v26 = [*(id *)(a1 + 80) _resourceObjectsInDatabase:v5 withPredicate:v10 limitCount:*(void *)(a1 + 88) highestPersistentID:*(void *)(*(void *)(a1 + 72) + 8) + 24 assignCountry:v25 error:a3];

    BOOL v14 = v26 != 0;
    if (v26)
    {
      uint64_t v27 = objc_msgSend(v26, "hk_filter:", &stru_114B88);
      [*(id *)(a1 + 48) addObjectsFromArray:v27];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

BOOL sub_9C8F0(id a1, HDOriginalFHIRResourceObject *a2)
{
  uint64_t v2 = a2;
  if (([(HDOriginalFHIRResourceObject *)v2 extractionHints] & 0x10) != 0) {
    unsigned int v3 = [(HDOriginalFHIRResourceObject *)v2 ingestedOnLocalDevice] ^ 1;
  }
  else {
    LOBYTE(v3) = 1;
  }

  return v3;
}

uint64_t sub_9CA60(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  uint64_t v6 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:*(void *)(a1 + 32) database:v5 error:a3];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 accountInDatabase:v5 error:a3];
    if (v8)
    {
      uint64_t v9 = HDOriginalFHIRResourceEntityPropertyAccountID;
      uint64_t v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v7 persistentID]);
      id v11 = +[HDSQLiteComparisonPredicate predicateWithProperty:v9 equalToValue:v10];

      id v12 = [v8 gateway];
      uint64_t v13 = [v12 country];
      BOOL v14 = (void *)v13;
      uint64_t v15 = (void *)HKCountryCodeUnknownCountry;
      if (v13) {
        uint64_t v15 = (void *)v13;
      }
      id v16 = v15;

      if ([*(id *)(a1 + 40) count])
      {
        id v33 = v16;
        uint64_t v34 = v5;
        id v30 = v8;
        uint64_t v31 = v7;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id obj = *(id *)(a1 + 40);
        id v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v36;
          uint64_t v20 = kHDSQLiteQueryNoLimit;
          while (2)
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v36 != v19) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = [*(id *)(a1 + 56) _predicateForResourceWithIdentifier:*(void *)(*((void *)&v35 + 1) + 8 * i)];
              CFStringRef v23 = +[HDSQLitePredicate compoundPredicateWithPredicate:v11 otherPredicate:v22];
              uint64_t v24 = [*(id *)(a1 + 56) _resourceObjectsInDatabase:v34 withPredicate:v23 limitCount:v20 highestPersistentID:0 assignCountry:v33 error:a3];
              if (!v24)
              {

                uint64_t v26 = 0;
                goto LABEL_18;
              }
              id v25 = (void *)v24;
              [*(id *)(a1 + 48) addObjectsFromArray:v24];
            }
            id v18 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        uint64_t v26 = 1;
LABEL_18:
        uint64_t v8 = v30;
        uint64_t v7 = v31;
        id v16 = v33;
        id v5 = v34;
      }
      else
      {
        uint64_t v27 = [*(id *)(a1 + 56) _resourceObjectsInDatabase:v5 withPredicate:v11 limitCount:kHDSQLiteQueryNoLimit highestPersistentID:0 assignCountry:v16 error:a3];
        if (v27)
        {
          long long v28 = (void *)v27;
          [*(id *)(a1 + 48) addObjectsFromArray:v27];

          uint64_t v26 = 1;
        }
        else
        {
          uint64_t v26 = 0;
        }
      }
    }
    else
    {
      uint64_t v26 = 0;
    }
  }
  else
  {
    uint64_t v26 = 0;
  }

  return v26;
}

void sub_9D030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_9D058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void *)(v6 + 24);
  if (v7 <= a2) {
    uint64_t v7 = a2;
  }
  *(void *)(v6 + 24) = v7;
  uint64_t v8 = *(void **)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  id v18 = 0;
  uint64_t v10 = [v8 _resourceObjectWithRow:a4 rowID:a2 assignCountry:v9 error:&v18];
  id v11 = v18;
  if (v10)
  {
    [*(id *)(a1 + 40) addObject:v10];
  }
  else
  {
    _HKInitializeLogging();
    id v12 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = v12;
      id v16 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      uint64_t v22 = v16;
      __int16 v23 = 2048;
      uint64_t v24 = a2;
      __int16 v25 = 2112;
      id v26 = v11;
      id v17 = v16;
      _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create %{public}@ from data for entity %lld: %@", buf, 0x2Au);
    }
  }

  return 1;
}

NSString *__cdecl sub_9D5C0(id a1)
{
  uint64_t v1 = HDSQLEntityPropertyPersistentID;
  uint64_t v18 = HDOriginalFHIRResourceEntityPropertyRawContent;
  uint64_t v17 = HDOriginalFHIRResourceEntityPropertyUniquenessChecksum;
  uint64_t v16 = HDOriginalFHIRResourceEntityPropertyReceivedDate;
  uint64_t v15 = HDOriginalFHIRResourceEntityPropertyReceivedDateTimeZone;
  uint64_t v14 = HDOriginalFHIRResourceEntityPropertyFirstSeenDate;
  uint64_t v13 = HDOriginalFHIRResourceEntityPropertyFirstSeenDateTimeZone;
  uint64_t v2 = HDOriginalFHIRResourceEntityPropertyFHIRVersion;
  uint64_t v3 = HDOriginalFHIRResourceEntityPropertySourceURL;
  uint64_t v4 = HDOriginalFHIRResourceEntityPropertyExtractionHints;
  uint64_t v5 = HDOriginalFHIRResourceEntityPropertyOriginMajorVersion;
  uint64_t v6 = HDOriginalFHIRResourceEntityPropertyOriginMinorVersion;
  uint64_t v7 = HDOriginalFHIRResourceEntityPropertyOriginPatchVersion;
  uint64_t v8 = HDOriginalFHIRResourceEntityPropertyOriginBuild;
  uint64_t v9 = HDOriginalFHIRResourceEntityPropertySyncProvenance;
  uint64_t v10 = +[HDOriginalFHIRResourceEntity disambiguatedDatabaseTable];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ > ? AND %@ <= ? AND %@ = ?", v1, v18, v17, v16, v15, v14, v13, v2, v3, v4, v5, v6, v7, v8, v9, v10,
    HDOriginalFHIRResourceEntityPropertyAccountID,
    v1,
    v1,
    v9,
  id v11 = 0);

  return (NSString *)v11;
}

uint64_t sub_9D778(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, (sqlite3_int64)[*(id *)(a1 + 32) persistentID]);
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 48));

  return sqlite3_bind_int64(a2, 4, 0);
}

BOOL sub_9D7F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = [*(id *)(a1 + 32) gateway];
  uint64_t v9 = [v8 country];
  id v24 = 0;
  uint64_t v10 = [v7 _resourceObjectWithRow:a2 rowID:v6 assignCountry:v9 error:&v24];
  id v11 = v24;

  if (!v10)
  {
    _HKInitializeLogging();
    id v12 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 48);
      uint64_t v20 = v12;
      __int16 v21 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v19;
      __int16 v27 = 2114;
      long long v28 = v21;
      __int16 v29 = 2048;
      uint64_t v30 = v6;
      __int16 v31 = 2112;
      id v32 = v11;
      id v22 = v21;
      _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create %{public}@ from data for entity %lld: %@", buf, 0x2Au);
    }
  }
  uint64_t v13 = HDSQLiteColumnWithNameAsData();
  buf[0] = 0;
  uint64_t v14 = *(void *)(a1 + 40);
  id v23 = v11;
  LOBYTE(v14) = (*(uint64_t (**)(uint64_t, uint64_t, void *, id, uint8_t *, id *))(v14 + 16))(v14, v6, v10, [v13 length], buf, &v23);
  id v15 = v23;

  if (v14)
  {
    BOOL v16 = buf[0] == 0;
  }
  else
  {
    id v17 = v15;
    if (v17)
    {
      if (a3) {
        *a3 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v16 = 0;
  }

  return v16;
}

void sub_9DCC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_9DCE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_9DCF8(uint64_t a1)
{
}

id sub_9DD00(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 48);
  uint64_t v6 = [a2 databaseForEntityClass:v5];
  uint64_t v7 = [v5 queryWithDatabase:v6 predicate:*(void *)(a1 + 32)];

  uint64_t v8 = [v7 queryDescriptor];
  [v8 setLimitCount:1];

  uint64_t v9 = [*(id *)(a1 + 48) _propertiesForResourceData];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_9DE04;
  v12[3] = &unk_114C70;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v10 = [v7 enumeratePersistentIDsAndProperties:v9 error:a3 enumerationHandler:v12];

  return v10;
}

uint64_t sub_9DE04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "_resourceDataWithROWID:row:error:", a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

void sub_9E034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_9E04C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 48);
  uint64_t v6 = [a2 databaseForEntityClass:v5];
  uint64_t v7 = [v5 queryWithDatabase:v6 predicate:*(void *)(a1 + 32)];

  uint64_t v8 = [v7 queryDescriptor];
  [v8 setLimitCount:1];

  uint64_t v9 = [*(id *)(a1 + 48) _propertiesForResourceData];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_9E150;
  v12[3] = &unk_114C70;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v10 = [v7 enumeratePersistentIDsAndProperties:v9 error:a3 enumerationHandler:v12];

  return v10;
}

uint64_t sub_9E150(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "_resourceDataWithROWID:row:error:", a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

uint64_t sub_9EED4(uint64_t a1, void *a2, void *a3)
{
  id v90 = a2;
  long long v106 = [v90 databaseForEntityClass:*(void *)(a1 + 48)];
  if (objc_msgSend(*(id *)(a1 + 48), "_ensureForeignKeysAreDeferredInDatabase:error:"))
  {
    uint64_t v88 = a3;
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    id v118 = objc_alloc_init((Class)NSMutableDictionary);
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    id v6 = *(id *)(a1 + 32);
    id v7 = [v6 countByEnumeratingWithState:&v132 objects:v144 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v124 = *(void *)v133;
      uint64_t v89 = HDClinicalAccountEntityPropertyIdentifier;
      uint64_t v104 = a1;
      id v112 = v6;
      id v93 = v5;
      do
      {
        uint64_t v9 = 0;
        id v117 = v8;
        do
        {
          if (*(void *)v133 != v124) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v132 + 1) + 8 * (void)v9);
          id v11 = *(void **)(a1 + 48);
          id v131 = 0;
          unsigned __int8 v12 = [v11 _validateCodableFHIRResourceFromSync:v10 error:&v131];
          id v13 = v131;
          if ((v12 & 1) == 0)
          {
            _HKInitializeLogging();
            uint64_t v18 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v19 = *(void *)(a1 + 48);
              uint64_t v20 = v18;
              [v13 localizedDescription];
              v22 = id v21 = v13;
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v19;
              *(_WORD *)&unsigned char buf[12] = 2114;
              *(void *)&buf[14] = v22;
              _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ dropping invalid codable FHIR resource: %{public}@", buf, 0x16u);

              id v13 = v21;
            }
            goto LABEL_66;
          }
          uint64_t v14 = [v10 gatewayExternalID];
          id v15 = [v5 objectForKeyedSubscript:v14];
          BOOL v16 = [v118 objectForKeyedSubscript:v14];
          if (v15)
          {
            id v17 = 0;
            if ([v15 isEqualToNumber:&off_11D398]) {
              goto LABEL_65;
            }
          }
          else
          {
            id v130 = 0;
            id v23 = +[HDClinicalAccountEntity accountEntityForGatewayWithExternalID:v14 database:v106 error:&v130];
            id v24 = v130;
            id v17 = v24;
            if (!v23)
            {
              _HKInitializeLogging();
              id v53 = (void *)HKLogHealthRecords;
              if (v17)
              {
                if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v54 = *(void *)(a1 + 48);
                  __int16 v55 = v53;
                  HKSensitiveLogItem();
                  v57 = id v56 = v13;
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = v54;
                  *(_WORD *)&unsigned char buf[12] = 2112;
                  *(void *)&buf[14] = v57;
                  *(_WORD *)&buf[22] = 2114;
                  v137 = v17;
                  _os_log_error_impl(&dword_0, v55, OS_LOG_TYPE_ERROR, "%{public}@ failed to retrieve account for gateway external ID \"%@\": %{public}@", buf, 0x20u);

                  id v13 = v56;
                }
              }
              else
              {
                if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v72 = *(void *)(a1 + 48);
                  id v73 = v53;
                  HKSensitiveLogItem();
                  id v75 = v74 = v13;
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v72;
                  *(_WORD *)&unsigned char buf[12] = 2112;
                  *(void *)&buf[14] = v75;
                  _os_log_impl(&dword_0, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ there is no account for gateway external ID \"%@\", dropping resources", buf, 0x16u);

                  id v13 = v74;
                }
                [v5 setObject:&off_11D398 forKeyedSubscript:v14];
              }
              id v15 = 0;
              goto LABEL_65;
            }
            id v119 = v24;
            id v122 = v13;
            uint64_t v25 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v23 persistentID]);
            objc_msgSend(v5, "setObject:forKeyedSubscript:");
            uint64_t v26 = (uint64_t)v16;
            if (!v16)
            {
              __int16 v27 = [v23 UUIDForProperty:v89 database:v106];
              uint64_t v26 = [v27 UUIDString];
              objc_msgSend(v118, "setObject:forKeyedSubscript:");
            }
            BOOL v16 = (void *)v26;
            a1 = v104;
            id v15 = (void *)v25;
            id v17 = v119;
            id v13 = v122;
          }
          v123 = v13;
          if (v16)
          {
            long long v28 = [v10 accountIdentifier];
            unsigned __int8 v29 = [v16 isEqualToString:v28];

            if ((v29 & 1) == 0)
            {
              _HKInitializeLogging();
              id v46 = (void *)HKLogHealthRecords;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
              {
                id v102 = v14;
                uint64_t v47 = *(void *)(a1 + 48);
                loga = v46;
                v114 = [v10 resourceType];
                [v10 resourceID];
                v49 = __int16 v48 = v16;
                HKSensitiveLogItem();
                id v50 = v121 = v17;
                id v51 = [v10 accountIdentifier];
                __int16 v52 = [v10 gatewayExternalID];
                *(_DWORD *)buf = 138544642;
                *(void *)&uint8_t buf[4] = v47;
                uint64_t v14 = v102;
                *(_WORD *)&unsigned char buf[12] = 2114;
                *(void *)&buf[14] = v114;
                *(_WORD *)&buf[22] = 2114;
                v137 = v50;
                __int16 v138 = 2114;
                v139 = v48;
                __int16 v140 = 2114;
                v141 = v51;
                __int16 v142 = 2114;
                v143 = v52;
                _os_log_impl(&dword_0, loga, OS_LOG_TYPE_DEFAULT, "%{public}@ will not insert received codable resource \"%{public}@/%{public}@\" because expected account UUID \"%{public}@\" does not match declared account UUID \"%{public}@\" (gateway external ID: \"%{public}@\")", buf, 0x3Eu);

                id v5 = v93;
                BOOL v16 = v48;

                id v17 = v121;
                a1 = v104;
              }
              id v13 = v123;
LABEL_65:

              id v8 = v117;
              id v6 = v112;
LABEL_66:

              goto LABEL_67;
            }
          }
          long long v105 = v16;
          uint64_t v30 = [v10 fhirVersion];
          os_log_t log = +[HKFHIRVersion versionFromVersionString:v30];

          id v31 = objc_alloc((Class)HKFHIRIdentifier);
          id v32 = [v10 resourceType];
          id v33 = [v10 resourceID];
          id v113 = [v31 initWithResourceType:v32 identifier:v33];

          if ([v10 hasOriginVersionMajor]) {
            id v101 = [v10 originVersionMajor];
          }
          else {
            id v101 = &dword_8 + 3;
          }
          if ([v10 hasOriginVersionMinor]) {
            id v100 = [v10 originVersionMinor];
          }
          else {
            id v100 = &dword_0 + 3;
          }
          if ([v10 hasOriginVersionPatch]) {
            id v99 = [v10 originVersionPatch];
          }
          else {
            id v99 = 0;
          }
          uint64_t v34 = [*(id *)(a1 + 40) syncIdentityManager];
          long long v35 = [v34 legacySyncIdentity];

          if ([v10 hasSyncIdentity])
          {
            long long v111 = v35;
            long long v36 = [v10 syncIdentity];
            id v129 = 0;
            id v37 = +[HDSyncIdentity syncIdentityWithCodable:v36 error:&v129];
            id v38 = v129;

            if (!v37)
            {
              _HKInitializeLogging();
              id v71 = HKLogHealthRecords;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v38;
                _os_log_fault_impl(&dword_0, v71, OS_LOG_TYPE_FAULT, "HDFHIRResourceEntity SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
              }
              int v67 = 3;
              goto LABEL_74;
            }
            v120 = v17;
            __int16 v39 = [*(id *)(a1 + 40) syncIdentityManager];
            id v128 = v38;
            long long v35 = [v39 concreteIdentityForIdentity:v37 shouldCreate:1 transaction:v90 error:&v128];
            id v40 = v128;

            if (!v35)
            {
              _HKInitializeLogging();
              uint64_t v76 = HKLogHealthRecords;
              id v17 = v120;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v40;
                _os_log_fault_impl(&dword_0, v76, OS_LOG_TYPE_FAULT, "HDFHIRResourceEntity ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
              }
              long long v111 = 0;
              int v67 = 3;
              id v38 = v40;
              a1 = v104;
              goto LABEL_74;
            }

            a1 = v104;
          }
          else
          {
            v120 = v17;
          }
          long long v97 = *(void **)(a1 + 48);
          id v41 = [v15 longLongValue];
          uint64_t v95 = *(void *)(a1 + 56);
          id v96 = v41;
          long long v111 = v35;
          id v42 = [v35 entity];
          id v94 = [v42 persistentID];
          uint64_t v43 = [v10 rawContent];
          long long v110 = [v10 safeUniquenessChecksum];
          long long v109 = [v10 sourceURL];
          [v10 receivedDate];
          long long v108 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
          long long v107 = [v10 receivedDateTimeZoneName];
          unsigned int v44 = [v10 hasFirstSeenDate];
          long long v98 = v15;
          if (v44)
          {
            [v10 firstSeenDate];
            uint64_t v45 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
            v91 = (void *)v45;
          }
          else
          {
            uint64_t v45 = 0;
          }
          id v58 = (void *)v43;
          unsigned int v59 = [v10 hasFirstSeenDate];
          id v103 = v14;
          if (v59)
          {
            uint64_t v60 = [v10 firstSeenDateTimeZoneName];
            uint64_t v92 = (void *)v60;
          }
          else
          {
            uint64_t v60 = 0;
          }
          id v61 = [v10 extractionHints];
          uint64_t v62 = [v10 originVersionBuild];
          unsigned __int8 v63 = (void *)v62;
          id v127 = v120;
          CFStringRef v64 = @"15E216";
          if (v62) {
            CFStringRef v64 = (const __CFString *)v62;
          }
          *(void *)buf = v101;
          *(void *)&buf[8] = v100;
          *(void *)&buf[16] = v99;
          uint64_t v87 = v60;
          __int16 v65 = v58;
          objc_msgSend(v97, "_insertResourceObjectWithIdentifier:accountID:syncProvenance:syncIdentity:rawContent:uniquenessChecksum:sourceURL:FHIRVersion:receivedDate:receivedDateTimeZoneName:firstSeenDate:firstSeenDateOut:firstSeenDateTimeZoneName:extractionHints:originVersion:originBuild:database:error:", v113, v96, v95, v94, v58, v110, v109, log, v108, v107, v45, 0, v87, v61, buf,
            v64,
            v106,
            &v127);
          id v38 = (id)objc_claimAutoreleasedReturnValue();
          id v66 = v127;

          if (v59) {
          uint64_t v14 = v103;
          }
          id v15 = v98;
          if (v44) {

          }
          a1 = v104;
          if (v38)
          {
            int v67 = 0;
            goto LABEL_75;
          }
          _HKInitializeLogging();
          id v68 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
          {
            uint64_t v69 = *(void *)(v104 + 48);
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v69;
            *(_WORD *)&unsigned char buf[12] = 2114;
            *(void *)&buf[14] = v66;
            _os_log_impl(&dword_0, v68, OS_LOG_TYPE_INFO, "%{public}@ failed to insert codable FHIR resource: %{public}@", buf, 0x16u);
          }
          id v70 = v66;
          id v37 = v70;
          if (!v70) {
            goto LABEL_73;
          }
          if (!v88)
          {
            _HKLogDroppedError();
LABEL_73:
            int v67 = 1;
            id v17 = v37;
            goto LABEL_74;
          }
          id v37 = v70;
          *uint64_t v88 = v37;
          int v67 = 1;
          id v17 = v37;
LABEL_74:

          id v66 = v17;
LABEL_75:

          if (v67)
          {
            BOOL v77 = v67 == 3;
            id v6 = v112;
            id v8 = v117;
            id v5 = v93;
            if (!v77)
            {
              uint64_t v85 = 0;
              goto LABEL_84;
            }
          }
          else
          {
            id v6 = v112;
            id v8 = v117;
            id v5 = v93;
          }
LABEL_67:
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v8 != v9);
        id v78 = [v6 countByEnumeratingWithState:&v132 objects:v144 count:16];
        id v8 = v78;
      }
      while (v78);
    }

    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v125[2] = sub_9FBF4;
    v125[3] = &unk_113B88;
    id v126 = *(id *)(a1 + 40);
    __int16 v79 = objc_retainBlock(v125);
    [v106 onCommit:v79 orRollback:0];
    _HKInitializeLogging();
    uint64_t v80 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v81 = *(void *)(a1 + 48);
      id v82 = *(const char **)(a1 + 64);
      uint64_t v83 = v80;
      id v84 = NSStringFromSelector(v82);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v81;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v84;
      _os_log_impl(&dword_0, v83, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ successfully inserted CodableFHIRResources", buf, 0x16u);
    }
    uint64_t v85 = 1;
    id v6 = v126;
LABEL_84:
  }
  else
  {
    uint64_t v85 = 0;
  }

  return v85;
}

void sub_9FBF4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) healthRecordsExtension];
  uint64_t v1 = [v2 ingestionManager];
  [v1 didReceiveFHIRResourceSyncEntities];
}

id sub_9FC50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[HDFHIRResourcesJournalEntry alloc] initWithCodableResources:*(void *)(a1 + 32) syncProvencance:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 40) database];
  id v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

id sub_9FE44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) daemon];
  id v6 = [v5 behavior];
  id v7 = [v6 localTimeZone];

  BOOL v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_9FFA4;
  uint64_t v19 = &unk_114CC0;
  id v8 = *(void **)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  id v22 = v7;
  id v23 = *(id *)(a1 + 32);
  id v9 = v7;
  id v10 = objc_msgSend(v8, "hk_map:", &v16);
  id v11 = [HDFHIRResourcesJournalEntry alloc];
  unsigned __int8 v12 = -[HDFHIRResourcesJournalEntry initWithCodableResources:syncProvencance:](v11, "initWithCodableResources:syncProvencance:", v10, 0, v16, v17, v18, v19);
  id v13 = [*(id *)(a1 + 32) database];
  id v14 = [v13 addJournalEntry:v12 error:a3];

  return v14;
}

id sub_9FFA4(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v5 = (void *)a1[7];
  id v6 = a2;
  id v7 = [v5 daemon];
  id v8 = [v7 behavior];
  id v9 = [v6 codableFHIRResourceForNewlyIngestedResourceWithGatewayExternalID:v2 accountID:v3 receivedDateTimeZone:v4 behavior:v8];

  return v9;
}

uint64_t sub_A0368(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 80)];
  if ([*(id *)(a1 + 80) _ensureForeignKeysAreDeferredInDatabase:v6 error:a3])
  {
    id v37 = +[HDClinicalAccountEntity existingAccountEntityForGatewayWithExternalID:*(void *)(a1 + 32) database:v6 error:a3];
    if (v37)
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = *(id *)(a1 + 40);
      id v35 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v35)
      {
        long long v36 = v6;
        id v29 = v5;
        uint64_t v33 = *(void *)v48;
        uint64_t v34 = a3;
        uint64_t v32 = a1;
        while (2)
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v48 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v39 = v7;
            id v8 = *(void **)(*((void *)&v47 + 1) + 8 * v7);
            unint64_t v9 = (unint64_t)[v8 extractionHints];
            id v10 = *(void **)(a1 + 80);
            uint64_t v11 = [v8 identifier];
            id v12 = [v37 persistentID];
            uint64_t v41 = *(void *)(a1 + 88);
            id v42 = v12;
            uint64_t v40 = *(void *)(a1 + 96);
            uint64_t v43 = [v8 data];
            unsigned int v44 = [v8 uniquenessChecksum];
            id v13 = [v8 sourceURL];
            id v14 = [v13 absoluteString];
            id v15 = [v8 FHIRVersion];
            id v38 = v8;
            BOOL v16 = [v8 receivedDate];
            uint64_t v17 = [*(id *)(a1 + 48) name];
            id v46 = 0;
            uint64_t v18 = *(void **)(a1 + 56);
            if (v18)
            {
              uint64_t v19 = a1;
              id v20 = (void *)v11;
              [v18 operatingSystemVersion];
              uint64_t v18 = *(void **)(v19 + 56);
            }
            else
            {
              id v20 = (void *)v11;
              memset(v45, 0, sizeof(v45));
            }
            id v21 = [v18 operatingSystemBuild];
            objc_msgSend(v10, "_insertResourceObjectWithIdentifier:accountID:syncProvenance:syncIdentity:rawContent:uniquenessChecksum:sourceURL:FHIRVersion:receivedDate:receivedDateTimeZoneName:firstSeenDate:firstSeenDateOut:firstSeenDateTimeZoneName:extractionHints:originVersion:originBuild:database:error:", v20, v42, v41, v40, v43, v44, v14, v15, v16, v17, 0, &v46, 0, v9 & 0xFFFFFFFFFFFFFFFBLL, v45,
              v21,
              v36,
            id v22 = v34);
            id v23 = v46;

            if (!v22)
            {

              uint64_t v27 = 0;
              goto LABEL_23;
            }
            a1 = v32;
            if (*(void *)(v32 + 64))
            {
              id v24 = v23;
              if (!v23)
              {
                uint64_t v30 = +[NSDate now];
                id v24 = v30;
              }
              id v25 = [v38 copyAsOriginalResourceObjectWithFirstSeenDate:v24 originInformation:*(void *)(v32 + 56) existingRowID:v22 ingestedOnLocalDevice:*(void *)(v32 + 88) == 0 country:*(void *)(v32 + 72)];
              if (!v23) {

              }
              uint64_t v26 = [[HDFHIRResourceObjectPair alloc] initWithProvidedResource:v38 databaseResource:v25];
              [*(id *)(v32 + 64) addObject:v26];
            }
            uint64_t v7 = v39 + 1;
          }
          while (v35 != (id)(v39 + 1));
          id v35 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
          if (v35) {
            continue;
          }
          break;
        }
        uint64_t v27 = 1;
LABEL_23:
        id v5 = v29;
        id v6 = v36;
      }
      else
      {
        uint64_t v27 = 1;
      }
    }
    else
    {
      uint64_t v27 = 0;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

void sub_A1298(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x300], 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

id sub_A1308(uint64_t a1)
{
  uint64_t v1 = HDSQLEntityPropertyPersistentID;
  uint64_t v2 = HDOriginalFHIRResourceEntityPropertyFirstSeenDate;
  uint64_t v3 = HDOriginalFHIRResourceEntityPropertyFirstSeenDateTimeZone;
  uint64_t v4 = HDOriginalFHIRResourceEntityPropertyReceivedDate;
  uint64_t v5 = HDOriginalFHIRResourceEntityPropertyExtractionHints;
  id v6 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v7 = +[NSString stringWithFormat:@"SELECT %@, %@, %@, %@, %@ FROM %@ WHERE %@ LIKE ? AND %@ LIKE ? AND %@ = ? AND %@ LIKE ? AND (%@ = ? OR %@ > ?)", v1, v2, v3, v4, v5, v6, HDOriginalFHIRResourceEntityPropertyType, HDOriginalFHIRResourceEntityPropertyResourceID, HDOriginalFHIRResourceEntityPropertyAccountID, HDOriginalFHIRResourceEntityPropertyFHIRVersion, HDOriginalFHIRResourceEntityPropertyUniquenessChecksum, v4, 0];

  return v7;
}

uint64_t sub_A1420(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 72));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t sub_A14B0(void *a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v3 = *(void *)(a1[4] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = HDSQLiteColumnWithNameAsDate();
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = HDSQLiteColumnWithNameAsString();
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *(void *)(*(void *)(a1[7] + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  uint64_t v11 = HDSQLiteColumnWithNameAsDate();
  uint64_t v12 = *(void *)(a1[8] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  return 1;
}

id sub_A15A8(uint64_t a1)
{
  uint64_t v1 = HDSQLEntityPropertyPersistentID;
  uint64_t v2 = HDOriginalFHIRResourceEntityPropertyFirstSeenDate;
  uint64_t v3 = HDOriginalFHIRResourceEntityPropertyFirstSeenDateTimeZone;
  uint64_t v4 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v5 = +[NSString stringWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE %@ LIKE ? AND %@ LIKE ? AND %@ = ?", v1, v2, v3, v4, HDOriginalFHIRResourceEntityPropertyType, HDOriginalFHIRResourceEntityPropertyResourceID, HDOriginalFHIRResourceEntityPropertyAccountID, 0];

  return v5;
}

uint64_t sub_A167C(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 48);

  return sqlite3_bind_int64(a2, 3, v4);
}

uint64_t sub_A16DC(void *a1)
{
  uint64_t v2 = HDSQLiteColumnAsNumber();
  uint64_t v3 = *(void *)(a1[4] + 8);
  sqlite3_int64 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = HDSQLiteColumnAsDate();
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = HDSQLiteColumnAsString();
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return 1;
}

id sub_A2030(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) addObject:v5];
  uint64_t v6 = *(void *)(a1 + 40);
  id v14 = 0;
  id v7 = [v5 _updateOriginalFHIRResourceROWID:0 database:v6 error:&v14];
  id v8 = v14;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v9 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v5;
      __int16 v19 = 2114;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to un-associate clinical record %{public}@ from the resource with originalFHIRResourceROWID %{public}@: %{public}@", buf, 0x2Au);
    }
    id v10 = v8;
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v7;
}

id sub_A2184(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) addObject:v5];
  uint64_t v6 = *(void *)(a1 + 40);
  id v14 = 0;
  id v7 = [v5 _updateOriginalFHIRResourceROWID:0 database:v6 error:&v14];
  id v8 = v14;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v9 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v5;
      __int16 v19 = 2114;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to un-associate medical record %{public}@ from the resource with originalFHIRResourceROWID %{public}@: %{public}@", buf, 0x2Au);
    }
    id v10 = v8;
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v7;
}

id sub_A2600(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _propertiesForEntity];
  uint64_t v3 = [v1 insertSQLForProperties:v2 shouldReplace:1];

  return v3;
}

uint64_t sub_A2660(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, a1[15]);
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 4, a1[16]);
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 13, a1[17]);
  sqlite3_bind_int64(a2, 14, a1[18]);
  sqlite3_bind_int64(a2, 15, a1[19]);
  sqlite3_bind_int64(a2, 16, a1[20]);
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = a1[21];

  return sqlite3_bind_int64(a2, 18, v4);
}

uint64_t sub_A2968(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 48) _ensureForeignKeysAreDeferredInDatabase:v6 error:a3])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = *(id *)(a1 + 32);
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      id v18 = v6;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v13 = *(void *)(a1 + 56);
          id v14 = [v5 protectedDatabase];
          id v15 = [v12 entityByAddingExtractionHints:v13 database:v14 error:a3];

          if (!v15)
          {
            uint64_t v16 = 0;
            goto LABEL_13;
          }
          [*(id *)(a1 + 40) addObject:v15];
        }
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      uint64_t v16 = 1;
LABEL_13:
      uint64_t v6 = v18;
    }
    else
    {
      uint64_t v16 = 1;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

void sub_A32C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 256), 8);
  _Block_object_dispose((const void *)(v53 - 224), 8);
  _Block_object_dispose((const void *)(v53 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_A3340(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(void *)(*(void *)(a1[6] + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  *(void *)(*(void *)(a1[7] + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  id v8 = (void *)a1[4];
  uint64_t v9 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = [v8 _codableWithRow:a3 gatewayExternalID:@"TEMPORARY_GATEWAY_EXTERNAL_ID_WHILE_REPLACING_RESOURCE" accountUUID:@"TEMPORARY_ACCOUNT_ID_WHILE_REPLACING_RESOURCE" error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  uint64_t v11 = *(void *)(a1[8] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void sub_A3CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_A3D2C(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v5 = +[HDOriginalFHIRResourceEntity _propertiesForEntity];
  uint64_t v6 = [*(id *)(a1 + 96) _syncObjectsGenerationPredicate];
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_A3EC0;
  v19[3] = &unk_114E50;
  uint64_t v27 = *(void *)(a1 + 96);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 40);
  id v22 = *(id *)(a1 + 56);
  id v23 = v4;
  uint64_t v10 = *(void *)(a1 + 120);
  uint64_t v25 = *(void *)(a1 + 80);
  uint64_t v28 = v10;
  id v11 = *(id *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 88);
  id v24 = v11;
  uint64_t v26 = v12;
  uint64_t v14 = *(void *)(a1 + 104);
  uint64_t v13 = *(void *)(a1 + 112);
  id v15 = v4;
  id v16 = +[HDOriginalFHIRResourceEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDOriginalFHIRResourceEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v5, v6, v8, v14, v13, 0, v7, v9, a3, v19);

  return v16;
}

BOOL sub_A3EC0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, uint64_t a8)
{
  id v13 = a2;
  uint64_t v14 = HDSQLiteColumnWithNameAsNumber();
  if (v14)
  {
    uint64_t v35 = a5;
    id v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
    if (v15)
    {
LABEL_3:
      id v16 = [v15 gatewayExternalID];
      __int16 v17 = [v15 accountIdentifier];
      id v18 = [v13 _codableWithRow:a4 gatewayExternalID:v16 accountUUID:v17 error:a8];

      if (!v18)
      {
        BOOL v22 = 0;
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v19 = HDSQLiteColumnWithNameAsInt64();
      id v20 = [*(id *)(a1 + 48) syncIdentityManager];
      id v21 = [v20 identityForEntityID:v19 transaction:*(void *)(a1 + 56) error:a8];

      BOOL v22 = v21 != 0;
      if (!v21)
      {
LABEL_24:

        goto LABEL_25;
      }
      id v23 = [v21 identity];
      id v24 = [v23 codableSyncIdentity];
      [v18 setSyncIdentity:v24];

      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [v18 encodedByteCount];
      if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) > *(void *)(a1 + 96))
      {
        BOOL v22 = 1;
        *a7 = 1;
        goto LABEL_24;
      }
      [*(id *)(a1 + 64) addObject:v18];
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v35;
LABEL_23:
      BOOL v22 = 1;
      goto LABEL_24;
    }
    id v21 = +[HDClinicalAccountEntity entityWithPersistentID:v14];
    uint64_t v26 = *(void *)(a1 + 40);
    id v36 = 0;
    id v15 = [v21 codableInHealthDatabase:v26 error:&v36];
    id v18 = v36;
    if (v15)
    {
      uint64_t v27 = [v15 accountIdentifier];

      if (v27)
      {
        uint64_t v28 = [v15 gatewayExternalID];

        if (v28)
        {
          [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:v14];

          goto LABEL_3;
        }
        _HKInitializeLogging();
        id v29 = HKLogHealthRecords;
        if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
          goto LABEL_23;
        }
        uint64_t v33 = *(void *)(a1 + 88);
        *(_DWORD *)buf = 138544130;
        uint64_t v38 = v33;
        __int16 v39 = 2114;
        uint64_t v40 = v14;
        __int16 v41 = 2048;
        uint64_t v42 = v35;
        __int16 v43 = 2114;
        id v44 = v18;
        id v31 = "%{public}@ retrieved a codable account with a nil gateway external ID for account at row %{public}@. Skipp"
              "ing resource at anchor %lld: %{public}@";
      }
      else
      {
        _HKInitializeLogging();
        id v29 = HKLogHealthRecords;
        if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
          goto LABEL_23;
        }
        uint64_t v32 = *(void *)(a1 + 88);
        *(_DWORD *)buf = 138544130;
        uint64_t v38 = v32;
        __int16 v39 = 2114;
        uint64_t v40 = v14;
        __int16 v41 = 2048;
        uint64_t v42 = v35;
        __int16 v43 = 2114;
        id v44 = v18;
        id v31 = "%{public}@ retrieved a codable account with a nil account ID for account at row %{public}@. Skipping resou"
              "rce at anchor %lld: %{public}@";
      }
    }
    else
    {
      _HKInitializeLogging();
      id v29 = HKLogHealthRecords;
      if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      uint64_t v30 = *(void *)(a1 + 88);
      *(_DWORD *)buf = 138544130;
      uint64_t v38 = v30;
      __int16 v39 = 2114;
      uint64_t v40 = v14;
      __int16 v41 = 2048;
      uint64_t v42 = v35;
      __int16 v43 = 2114;
      id v44 = v18;
      id v31 = "%{public}@ failed to retrieve codable account for account %{public}@. Skipping resource at anchor %lld: %{public}@";
    }
    _os_log_fault_impl(&dword_0, v29, OS_LOG_TYPE_FAULT, v31, buf, 0x2Au);
    goto LABEL_23;
  }
  _HKInitializeLogging();
  uint64_t v25 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
    sub_B535C(a1, a5, v25);
  }
  BOOL v22 = 1;
LABEL_26:

  return v22;
}

id sub_A45E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = HKSafeObject();

  id v5 = 0;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) _shouldInsertReceivedCodableResource:v4];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_B53D8(a1, v7, (uint64_t)v5);
    }
    id v6 = 0;
  }

  return v6;
}

id sub_A5EBC(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_A601C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_A6034(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_A6044(uint64_t a1)
{
}

BOOL sub_A604C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v6) {
    id v7 = [v6 isHealthDataSubmissionAllowed];
  }
  else {
    id v7 = (id)HKImproveHealthAndActivityAnalyticsAllowed();
  }
  id v8 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v10 = [WeakRetained analyticsManager];
  id v11 = [v10 isImproveHealthRecordsDataSubmissionAllowedWithTransaction:v5];

  CFStringRef v25 = @"isImproveHealthAndActivityAllowed";
  uint64_t v12 = +[NSNumber numberWithBool:v8];
  uint64_t v26 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];

  uint64_t v14 = [*(id *)(a1 + 32) _fetchAccountAnalyticsCollectsClinicalOptInData:v11 collectsImproveHealthAndActivityData:v8 error:a3];
  if (v14)
  {
    id v15 = objc_msgSend(v13, "hk_dictionaryByAddingEntriesFromDictionary:", v14);

    id v16 = *(id **)(a1 + 32);
    id v17 = objc_loadWeakRetained(v16 + 1);
    id v18 = [v17 profile];
    uint64_t v19 = [v16 _fetchDeviceContextAnalyticsWithProfile:v18 transaction:v5 error:a3];

    if (v19)
    {
      id v20 = objc_msgSend(v15, "hk_dictionaryByAddingEntriesFromDictionary:", v19);

      id v21 = [*(id *)(a1 + 32) _fetchRecordAndUserDomainConceptAnalyticsHealthDataSubmissionAllowed:v8 collectsClinicalOptInData:v11 transaction:v5 error:a3];
      BOOL v22 = v21 != 0;
      if (v21)
      {
        id v23 = objc_msgSend(v20, "hk_dictionaryByAddingEntriesFromDictionary:", v21);

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v23);
        id v20 = v23;
      }

      id v15 = v20;
    }
    else
    {
      BOOL v22 = 0;
    }

    id v13 = v15;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

BOOL sub_A6F24(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _recordCategoryAnalyticsWithDescription:*(void *)(a1 + 40) nowDate:*(void *)(a1 + 48) transaction:*(void *)(a1 + 56) error:a2];
  if (v3) {
    [*(id *)(a1 + 64) addEntriesFromDictionary:v3];
  }

  return v3 != 0;
}

BOOL sub_A71A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)[*(id *)(a1 + 32) integerValue];
  id v5 = [*(id *)(a1 + 40) _countWithRecordCategoryAnalyticsDescription:*(void *)(a1 + 48) timeScope:v4 nowDate:*(void *)(a1 + 56) transaction:*(void *)(a1 + 64) error:a2];
  if (v5)
  {
    id v6 = [*(id *)(a1 + 48) baseAnalyticKey];
    id v7 = v6;
    if (v4 <= 2591999)
    {
      if (!v4)
      {
LABEL_14:
        [*(id *)(a1 + 72) setObject:v5 forKeyedSubscript:v7];

        goto LABEL_15;
      }
      if (v4 == 604800)
      {
        CFStringRef v8 = @"LastWeek";
        goto LABEL_13;
      }
    }
    else
    {
      switch(v4)
      {
        case 157680000:
          CFStringRef v8 = @"Last5Years";
          goto LABEL_13;
        case 31536000:
          CFStringRef v8 = @"LastYear";
          goto LABEL_13;
        case 2592000:
          CFStringRef v8 = @"LastMonth";
LABEL_13:
          uint64_t v9 = [v6 stringByAppendingString:v8];

          id v7 = (void *)v9;
          goto LABEL_14;
      }
    }
    CFStringRef v8 = &stru_1152E8;
    goto LABEL_13;
  }
LABEL_15:

  return v5 != 0;
}

void sub_A7DC8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    _HKInitializeLogging();
    id v7 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B552C(a1, v7);
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

void sub_A8274(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 copy];
    uint64_t v7 = *(void *)(a1 + 32);
    CFStringRef v8 = *(void **)(v7 + 88);
    *(void *)(v7 + 8_Block_object_dispose(&STACK[0x220], 8) = v6;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B56F0(a1, v9);
    }
    [*(id *)(a1 + 32) setOperationError:v5];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_A8490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  void v8[4] = a6;
  v8[2] = a4;
  return _swift_task_switch(sub_A84B8, 0, 0);
}

uint64_t sub_A84B8()
{
  *(void *)(v0 + 56) = *(void *)(*(void *)(v0 + 16)
                                   + OBJC_IVAR___HDClinicalIngestionAnalyticsAccumulator_accumulator);
  sub_B58A0();
  sub_A9EBC();
  uint64_t v2 = sub_B5910();
  return _swift_task_switch(sub_A8550, v2, v1);
}

uint64_t sub_A8550()
{
  sub_B5860();
  return _swift_task_switch(sub_A85BC, 0, 0);
}

uint64_t sub_A85BC()
{
  uint64_t v1 = *(void (**)(void))(v0 + 40);
  if (v1) {
    v1();
  }
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_A8628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_B5930();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_B5920();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_A99C8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_B5910();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_A89A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  return _swift_task_switch(sub_A89CC, 0, 0);
}

uint64_t sub_A89CC()
{
  uint64_t v1 = (char *)v0[2];
  if (v1)
  {
    uint64_t v2 = *(void *)&v1[OBJC_IVAR___HDClinicalIngestionAnalyticsAccumulator_accumulator];
    v0[6] = v2;
    uint64_t v8 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of IngestionAnalyticsAccumulator.consume(from:)
                                         + async function pointer to dispatch thunk of IngestionAnalyticsAccumulator.consume(from:));
    id v3 = v1;
    swift_retain();
    uint64_t v4 = (void *)swift_task_alloc();
    v0[7] = v4;
    void *v4 = v0;
    v4[1] = sub_A8B14;
    return v8(v2);
  }
  else
  {
    v0[8] = *(void *)(v0[3] + OBJC_IVAR___HDClinicalIngestionAnalyticsAccumulator_accumulator);
    sub_B58A0();
    sub_A9EBC();
    uint64_t v7 = sub_B5910();
    return _swift_task_switch(sub_A8CCC, v7, v6);
  }
}

uint64_t sub_A8B14()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_A8C2C, 0, 0);
}

uint64_t sub_A8C2C()
{
  *(void *)(v0 + 64) = *(void *)(*(void *)(v0 + 24)
                                   + OBJC_IVAR___HDClinicalIngestionAnalyticsAccumulator_accumulator);
  sub_B58A0();
  sub_A9EBC();
  uint64_t v2 = sub_B5910();
  return _swift_task_switch(sub_A8CCC, v2, v1);
}

uint64_t sub_A8CCC()
{
  *(void *)(v0 + 72) = sub_B5870();
  *(void *)(v0 + 80) = v1;
  return _swift_task_switch(sub_A8D38, 0, 0);
}

uint64_t sub_A8D38()
{
  (*(void (**)(void, void))(v0 + 32))(*(void *)(v0 + 72), *(void *)(v0 + 80));
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_A8F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v37 = a1;
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  uint64_t v38 = a2;
  sub_A9724(0, &qword_137118, (uint64_t (*)(uint64_t))&type metadata accessor for TaskPriority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  ((void (*)(void))__chkstk_darwin)();
  id v5 = (char *)&v33 - v4;
  uint64_t v35 = sub_B58D0();
  uint64_t v6 = *(void *)(v35 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v34 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v33 - v9;
  sub_A9724(0, &qword_137120, (uint64_t (*)(uint64_t))&type metadata accessor for AnalyticsReportingConfiguration.OptInStatus, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v11 = sub_B58C0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_F2980;
  unint64_t v16 = v15 + v14;
  id v17 = *(void (**)(unint64_t, void, uint64_t))(v12 + 104);
  v17(v16, enum case for AnalyticsReportingConfiguration.OptInStatus.ihaAccepted(_:), v11);
  v17(v16 + v13, enum case for AnalyticsReportingConfiguration.OptInStatus.ihrAccepted(_:), v11);
  id v18 = v10;
  uint64_t v33 = v10;
  sub_B58B0();
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_B5930();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v5, 1, 1, v19);
  id v21 = v34;
  uint64_t v20 = v35;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v34, v18, v35);
  unint64_t v22 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v23 = (v7 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  CFStringRef v25 = (char *)swift_allocObject();
  *((void *)v25 + 2) = 0;
  *((void *)v25 + 3) = 0;
  uint64_t v26 = v36;
  *((void *)v25 + 4) = v36;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v25[v22], v21, v20);
  uint64_t v27 = &v25[v23];
  uint64_t v28 = v38;
  *(void *)uint64_t v27 = v37;
  *((void *)v27 + 1) = v28;
  id v29 = &v25[v24];
  uint64_t v30 = v40;
  *(void *)id v29 = v39;
  *((void *)v29 + 1) = v30;
  id v31 = v26;
  swift_retain();
  swift_retain();
  sub_A8628((uint64_t)v5, (uint64_t)&unk_137130, (uint64_t)v25);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v33, v20);
}

uint64_t sub_A9304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = a8;
  v8[8] = v10;
  void v8[5] = a6;
  v8[6] = a7;
  v8[3] = a4;
  void v8[4] = a5;
  return _swift_task_switch(sub_A9334, 0, 0);
}

uint64_t sub_A9334()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 72) = *(void *)(*(void *)(v0 + 24)
                                   + OBJC_IVAR___HDClinicalIngestionAnalyticsAccumulator_accumulator);
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  *(void *)(v1 + 32) = v0 + 16;
  sub_B58A0();
  sub_A9EBC();
  uint64_t v3 = sub_B5910();
  return _swift_task_switch(sub_A93EC, v3, v2);
}

uint64_t sub_A93EC()
{
  sub_B5880();
  swift_task_dealloc();
  return _swift_task_switch(sub_A9478, 0, 0);
}

uint64_t sub_A9478()
{
  (*(void (**)(void))(v0 + 56))(*(void *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_A95B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v7 = sub_B58F0();
  NSString v8 = sub_B58F0();
  sub_A9F14();
  Class isa = sub_B58E0().super.isa;
  uint64_t v10 = (*(uint64_t (**)(uint64_t, NSString, NSString, Class))(a6 + 16))(a6, v7, v8, isa);

  return v10;
}

id sub_A9664()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ClinicalIngestionAnalyticsAccumulator()
{
  return self;
}

uint64_t sub_A96D0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_A9708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_A95B8(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

uint64_t sub_A9710()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_A9724(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_A9788()
{
  uint64_t v1 = sub_B58D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_A9890()
{
  uint64_t v2 = *(void *)(sub_B58D0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = v0 + v3;
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v0 + v4);
  long long v9 = *(_OWORD *)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8));
  *(void *)(v1 + 16) = v7;
  *(void *)uint64_t v7 = v1;
  *(void *)(v7 + _Block_object_dispose(&STACK[0x220], 8) = sub_AA224;
  *(_OWORD *)(v7 + 56) = v9;
  *(_OWORD *)(v7 + 40) = v8;
  *(void *)(v7 + 24) = v5;
  *(void *)(v7 + 32) = v6;
  return _swift_task_switch(sub_A9334, 0, 0);
}

uint64_t sub_A99C8(uint64_t a1)
{
  sub_A9724(0, &qword_137118, (uint64_t (*)(uint64_t))&type metadata accessor for TaskPriority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_A9A54(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_A9B30;
  return v6(a1);
}

uint64_t sub_A9B30()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_A9C28()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_A9C60(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_A9D18;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_137138 + dword_137138);
  return v6(a1, v4);
}

uint64_t sub_A9D18()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_A9E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);
  long long v9 = *(void **)(v4 + 32);
  uint64_t v10 = (void *)sub_B5850();
  uint64_t v11 = sub_B5900();
  uint64_t v13 = v12;

  LOBYTE(a4) = v8(v11, v13, a2, a3, a4);
  uint64_t result = swift_bridgeObjectRelease();
  if (a4)
  {
    if (__OFADD__(*v9, 1)) {
      __break(1u);
    }
    else {
      ++*v9;
    }
  }
  return result;
}

unint64_t sub_A9EBC()
{
  unint64_t result = qword_137148;
  if (!qword_137148)
  {
    sub_B58A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_137148);
  }
  return result;
}

unint64_t sub_A9F14()
{
  unint64_t result = qword_137150;
  if (!qword_137150)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_137150);
  }
  return result;
}

void sub_A9F54()
{
  uint64_t v1 = *(void *)(v0 + 16);
  NSString v2 = sub_B58F0();
  (*(void (**)(uint64_t, NSString))(v1 + 16))(v1, v2);
}

uint64_t sub_A9FAC()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_A9FFC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 40);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + _Block_object_dispose(&STACK[0x220], 8) = sub_AA224;
  *(void *)(v4 + 40) = v3;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = v2;
  return _swift_task_switch(sub_A89CC, 0, 0);
}

uint64_t sub_AA0C0()
{
  swift_unknownObjectRelease();

  if (*(void *)(v0 + 56)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_AA120()
{
  long long v6 = *(_OWORD *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + _Block_object_dispose(&STACK[0x220], 8) = sub_A9D18;
  *(void *)(v3 + 4_Block_object_dispose(&STACK[0x220], 8) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  *(_OWORD *)(v3 + 32) = v6;
  return _swift_task_switch(sub_A84B8, 0, 0);
}

uint64_t sub_AA1E8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_AA1F8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_AA208()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_AA228(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "HDSignedClinicalDataIssuerSyncEntity expects HDCodableSignedClinicalDataIssuer, error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_AA2A0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ will not perform ingestion because account preparation failed: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_AA328(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "For file import you must set the HKClinicalIngestionOptionsSkipFetch option.", v1, 2u);
}

void sub_AA36C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  __int16 v5 = [a3 identifier];
  sub_CC6C();
  sub_CC84(&dword_0, v6, v7, "%{public}@ Account %{public}@: fileImportOperation is complete", v8, v9, v10, v11, v12);
}

void sub_AA40C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  __int16 v5 = [a3 account];
  uint64_t v6 = [v5 identifier];
  sub_CC6C();
  sub_CC84(&dword_0, v7, v8, "%{public}@ Account %{public}@: retrieving existing Patient resource", v9, v10, v11, v12, v13);
}

void sub_AA4BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ ending \"never finish\" ingestion task", (uint8_t *)&v2, 0xCu);
}

void sub_AA534()
{
  sub_F00C();
  sub_EFF0(&dword_0, v0, v1, "Failed to remove upload directory, error: %@", v2, v3, v4, v5, v6);
}

void sub_AA59C()
{
  sub_F00C();
  sub_EFF0(&dword_0, v0, v1, "Failed to initialize health wrap configuration for opt in study, error: %@", v2, v3, v4, v5, v6);
}

void sub_AA604()
{
  sub_F00C();
  sub_EFF0(&dword_0, v0, v1, "Failed to load certificate for opt in study, error: %@", v2, v3, v4, v5, v6);
}

void sub_AA66C()
{
  sub_F00C();
  sub_EFF0(&dword_0, v0, v1, "Failed to register for opt-in study. Unable to parse response: %@", v2, v3, v4, v5, v6);
}

void sub_AA6D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_AA70C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_AA744(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_AA77C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&void v3[14] = a1;
  sub_F034(&dword_0, a2, a3, "Failed to register for opt-in study: received status code %ld, response: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_AA7F4()
{
  sub_F00C();
  sub_EFF0(&dword_0, v0, v1, "Failed to register for opt-in study with error: %@", v2, v3, v4, v5, v6);
}

void sub_AA85C()
{
  sub_F00C();
  sub_EFF0(&dword_0, v0, v1, "Failed to read contents of health cloud upload directory, error: %@", v2, v3, v4, v5, v6);
}

void sub_AA8C4()
{
  sub_F00C();
  sub_F034(&dword_0, v0, v1, "Failed to remove file after upload success, filePath: %@, error: %@");
}

void sub_AA938(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "%{public}@ got no kid or added date for one entry while iterating over all keys, which is surprising", (uint8_t *)&v5, 0xCu);
}

void sub_AA9E4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = (objc_class *)objc_opt_class();
  uint8_t v6 = NSStringFromClass(v5);
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "%{public}@ there is no public key entry with kid %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_AAAA8()
{
  sub_11A94();
  sub_F034(&dword_0, v0, v1, "%{public}@: Error notifying health record store about health records supported change with error: %{public}@");
}

void sub_AAB14(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@: received unknown account state change type", (uint8_t *)&v2, 0xCu);
}

void sub_AAB8C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
}

void sub_AAC04()
{
  sub_11A94();
  sub_F034(&dword_0, v0, v1, "%{public}@: unable to retrieve HKHealthRecordsStore client, error: %{public}@");
}

void sub_AAC70(void *a1, void *a2, uint64_t a3)
{
  int v5 = a1;
  uint8_t v6 = [a2 debugDescription];
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@ failed to create a PKCE challenge from verifier, will not use PKCE. Error: %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_AAD30(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to delete access token after failing to store refresh tokens: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_AADA8(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  sub_15694(&dword_0, v5, v6, "%{public}@ failed to determine current IHR opt-in version from disk", v7, v8, v9, v10, 2u);
}

void sub_AAE40(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 debugDescription];
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@ failed to determine whether we have gateway backed account: %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_AAF00(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_AAF8C(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 40);
  id v3 = a2;
  int v4 = [v2 debugDescription];
  sub_15694(&dword_0, v5, v6, "%{public}@: cannot read the content analytics start anchor", v7, v8, v9, v10, 2u);
}

void sub_AB024(void **a1, void *a2, void *a3)
{
  int v4 = *a1;
  uint64_t v5 = a2;
  uint64_t v6 = [v4 debugDescription];
  uint64_t v7 = HKSensitiveLogItem();
  uint64_t v8 = [a3 sourceRevision];
  uint64_t v9 = HKSensitiveLogItem();
  int v10 = 138412802;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  uint8_t v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = v9;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%@ unable to determine the account identifier for %@ from %@", (uint8_t *)&v10, 0x20u);
}

void sub_AB12C(uint8_t *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = a2;
  uint64_t v7 = HKSensitiveLogItem();
  *(_DWORD *)a1 = 138412290;
  *a4 = v7;
  _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Service returned search result without title, skipping: %@", a1, 0xCu);
}

void sub_AB1B0()
{
  sub_17E64();
  sub_F034(&dword_0, v0, v1, "%{public}@ failed to retrieve provider from the service's provider list response: %{public}@");
}

void sub_AB218()
{
  sub_17E64();
  sub_F034(&dword_0, v0, v1, "%{public}@ failed to obtain gateways for provider from provider list response: %{public}@");
}

void sub_AB280(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ gateway parsing: failed to find the requested gateway within a batch result.", (uint8_t *)&v2, 0xCu);
}

void sub_AB2F8(void *a1, uint64_t a2, uint64_t a3)
{
  int v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "%{public}@ gateways from fetched JSON: failed to obtain results from provider response: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_AB3B8(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [a2 debugDescription];
  sub_1A998(&dword_0, v5, v6, "%{public}@ no more resources to extract", v7, v8, v9, v10, 2u);
}

void sub_AB450(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [a2 debugDescription];
  sub_1A998(&dword_0, v5, v6, "%{public}@ extraction beginning", v7, v8, v9, v10, 2u);
}

void sub_AB4E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [(id)sub_1A98C() debugDescription];
  +[NSDate timeIntervalSinceReferenceDate];
  sub_CC84(&dword_0, v5, v6, "%{public}@ extraction took %.3f seconds", v7, v8, v9, v10, 2u);
}

void sub_AB5A8(void *a1, void *a2)
{
  id v3 = a1;
  [a2 debugDescription];
  objc_claimAutoreleasedReturnValue();
  int v4 = [(id)sub_1A98C() debugDescription];
  uint64_t v5 = HKSensitiveLogItem();
  int v6 = 138543618;
  uint64_t v7 = a2;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%{public}@ is calling didCompleteExtractionWithRequest with %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_AB688(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  int v6 = [a2 originalFHIRResource];
  uint64_t v7 = HKSensitiveLogItem();
  __int16 v8 = objc_msgSend(a3, "hk_map:", &stru_112250);
  uint64_t v9 = [v8 componentsJoinedByString:@"; "];
  int v10 = 138543618;
  uint64_t v11 = v7;
  __int16 v12 = 2114;
  uint8_t v13 = v9;
  _os_log_fault_impl(&dword_0, v5, OS_LOG_TYPE_FAULT, "HDClinicalIngestionExtractionOperation._processFHIRResourcesInExtractionResult failed to re-associate provided to processed FHIR resource. item resource: %{public}@, pairs provided: %{public}@", (uint8_t *)&v10, 0x16u);
}

void sub_AB794(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_1A98C() debugDescription];
  sub_1A974();
  sub_CC84(&dword_0, v4, v5, "%{public}@ extraction produced %@ clinical record samples that were saved", v6, v7, v8, v9, v10);
}

void sub_AB830(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_1A98C() debugDescription];
  sub_1A974();
  sub_CC84(&dword_0, v4, v5, "%{public}@ extraction produced %@ medical record samples that were saved", v6, v7, v8, v9, v10);
}

void sub_AB8CC(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_1A98C() debugDescription];
  sub_1A974();
  sub_CC84(&dword_0, v4, v5, "%{public}@ extraction produced %@ medical downloadable attachments that were saved", v6, v7, v8, v9, v10);
}

void sub_AB968(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  sub_1C908();
  sub_1C920(&dword_0, v4, v5, "%{public}@ Migration succeeded but failed to set user version, ignoring. Error: %{public}@", v6, v7, v8, v9, v10);
}

void sub_ABA0C(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  sub_1C908();
  sub_1C920(&dword_0, v4, v5, "%{public}@ Migration from version 1 to 2 failed with error: %{public}@", v6, v7, v8, v9, v10);
}

void sub_ABAB0(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  sub_1C908();
  sub_1C920(&dword_0, v4, v5, "%{public}@ Migration from version 0 to 1 failed with error: %{public}@", v6, v7, v8, v9, v10);
}

void sub_ABB54(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "HDRefreshAccountInformationTask attempted to call completion handler with success but the callback is already gone", v1, 2u);
}

void sub_ABB98(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 debugDescription];
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@ canceling with error %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_ABC5C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  sub_1A998(&dword_0, v5, v6, "%{public}@ asking for fresh access credentials", v7, v8, v9, v10, 2u);
}

void sub_ABCF4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 debugDescription];
  sub_1A998(&dword_0, v5, v6, "%{public}@ done asking for fresh access credentials", v7, v8, v9, v10, 2u);
}

void sub_ABD8C()
{
  sub_20038();
  sub_F034(&dword_0, v0, v1, "%{public}@ Failed to delete MedicalDownloadableAttachments for stale medical record with error: %{private}@");
}

void sub_ABDF4()
{
  sub_20038();
  sub_F034(&dword_0, v0, v1, "%{public}@ Failed to update MedicalDownloadableAttachments for medical records being re-inserted with error: %{private}@");
}

void sub_ABE5C(void *a1)
{
  os_log_t v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "%{public}@ journal entries are no longer supported", (uint8_t *)&v3, 0xCu);
}

void sub_ABF04(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to query existing last seen entry, will try to insert. Error: %@", buf, 0x16u);
}

void sub_ABF6C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "HDSignedClinicalDataIssuerTitleUpdateJournalEntry failed to apply journal entry: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_ABFE4(void *a1)
{
  id v1 = a1;
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_1C908();
  sub_CC84(&dword_0, v4, v5, "%{public}@ remote_updateClinicalSharingStatusForAccountWithIdentifier: did update clinical sharing status on account %{public}@", v6, v7, v8, v9, v10);
}

void sub_AC088(void *a1)
{
  id v1 = a1;
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_1C908();
  sub_CC84(&dword_0, v4, v5, "%{public}@ remote_updateClinicalSharingStatusForAccountWithIdentifier: will update clinical sharing status on account %{public}@", v6, v7, v8, v9, v10);
}

void sub_AC12C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@: Error notifying health record store about account state changes with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_AC1DC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to look up medical record for clinical record with UUID %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_AC264(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to get private source bundle identifier for public identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_AC2DC()
{
  sub_2560C();
  sub_255DC(v2, v3);
  [(id)sub_25618() identifier];
  objc_claimAutoreleasedReturnValue();
  sub_255F4();
  sub_25598();
  sub_255BC(&dword_0, v4, v5, "%{public}@ Account %{public}@: finished running %lu schema operations", v6, v7, v8, v9, v10);
}

void sub_AC370()
{
  sub_2560C();
  sub_255DC(v2, v3);
  [(id)sub_25618() identifier];
  objc_claimAutoreleasedReturnValue();
  sub_255F4();
  sub_25598();
  sub_255BC(&dword_0, v4, v5, "%{public}@ Account %{public}@: starting %lu schema operations", v6, v7, v8, v9, v10);
}

void sub_AC404()
{
  sub_2560C();
  sub_255DC(v2, v3);
  [(id)sub_25618() identifier];
  objc_claimAutoreleasedReturnValue();
  sub_255F4();
  sub_25598();
  sub_255BC(&dword_0, v4, v5, "%{public}@ Account %{public}@: finished running %lu feature operations", v6, v7, v8, v9, v10);
}

void sub_AC498()
{
  sub_2560C();
  sub_255DC(v2, v3);
  [(id)sub_25618() identifier];
  objc_claimAutoreleasedReturnValue();
  sub_255F4();
  sub_25598();
  sub_255BC(&dword_0, v4, v5, "%{public}@ Account %{public}@: starting %lu feature operations", v6, v7, v8, v9, v10);
}

void sub_AC52C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "HDSignedClinicalDataIssuer SyncIdentity from received codable is nil %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_AC5A4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "HDSignedClinicalDataIssuer ConcreteSyncIdentity from received codable is nil %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_AC61C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = a2;
  uint64_t v4 = HKSensitiveLogItem();
  int v5 = 138543618;
  uint64_t v6 = v2;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@ updateIssuerTitlesUsingRegistry failed to update title for issuer, continuing. Error: %{public}@", (uint8_t *)&v5, 0x16u);
}

void sub_AC720(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_AC78C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Failed to set state of activity %{public}@ to DONE", (uint8_t *)&v3, 0xCu);
}

void sub_AC808(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_AC878(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_AC8E8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "HDFHIRCredentialSyncEntity expects HDCodableFHIRCredential, error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_AC960(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Encountered error fetching display name for secondary profiles %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_AC9D8(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v5;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ error: %@", buf, 0x16u);
}

void sub_ACA48(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ failed to instantiate a reference extraction request. Are all resources of the same FHIR release?", buf, 0xCu);
}

void sub_ACAA0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ unable to extract references because there is no extraction service client", buf, 0xCu);
}

void sub_ACAF8(void *a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = [a1 profile];
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@ cannot register for ingestion state changes on profile %{public}@ without ingestion manager", (uint8_t *)&v5, 0x16u);
}

void sub_ACBB4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@: Error notifying health record store about ingestion state changes with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_ACC40(void *a1, uint64_t a2, uint64_t a3)
{
  int v4 = a1;
  uint64_t v5 = (objc_class *)objc_opt_class();
  __int16 v6 = NSStringFromClass(v5);
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to open database: %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_ACD04(void *a1, id *a2)
{
  uint64_t v3 = a1;
  int v4 = [a2 debugDescription];
  uint64_t v5 = [a2[10] name];
  __int16 v6 = HKSensitiveLogItem();
  int v7 = 138543874;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  __int16 v12 = v6;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@ fetching %{public}@ resources failed with error: %@", (uint8_t *)&v7, 0x20u);
}

void sub_ACE00(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [a2 debugDescription];
  sub_1C908();
  sub_1C920(&dword_0, v5, v6, "%{public}@ failed to retrieve refresh token from keychain: %{public}@", v7, v8, v9, v10, v11);
}

void sub_ACEA0(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [a2 debugDescription];
  sub_1C908();
  sub_1C920(&dword_0, v5, v6, "%{public}@ failed to retrieve access token from keychain: %{public}@", v7, v8, v9, v10, v11);
}

void sub_ACF40(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 debugDescription];
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@: Error %{public}@, while uploading opt-in data", (uint8_t *)&v7, 0x16u);
}

void sub_AD000(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 debugDescription];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@: opt-in data upload triggered unsuccessfully", (uint8_t *)&v5, 0xCu);
}

void sub_AD0A8(void *a1, void *a2)
{
  id v3 = a1;
  [a2 debugDescription];
  objc_claimAutoreleasedReturnValue();
  sub_32DC8();
  int v4 = HKSensitiveLogItem();
  int v5 = 138543618;
  uint64_t v6 = a2;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@ canceling with error: %{public}@", (uint8_t *)&v5, 0x16u);
}

void sub_AD178(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_32DC8() debugDescription];
  sub_F00C();
  sub_1A998(&dword_0, v4, v5, "%{public}@ asking for fresh access credentials", v6, v7, v8, v9, v10);
}

void sub_AD208(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_32DC8() debugDescription];
  sub_F00C();
  sub_1A998(&dword_0, v5, v6, "%{public}@ done asking for fresh access credentials", v7, v8, v9, v10, v11);
}

void sub_AD298(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_32DC8() debugDescription];
  uint64_t v4 = [(id)objc_opt_class() featureName];
  sub_32DB0();
  sub_32DD4(&dword_0, v5, v6, "%{public}@ done asking CHR ingestion service to run %{public}@ feature", v7, v8, v9, v10, v11);
}

void sub_AD348(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  uint64_t v5 = [a2 gateway];
  uint64_t v6 = [v5 country];
  sub_32DB0();
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%{public}@ ingestion analytics metrics for country \"%{public}@\" are not enabled", v7, 0x16u);
}

void sub_AD418(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_32DC8() debugDescription];
  uint64_t v4 = [(id)objc_opt_class() featureName];
  sub_32DB0();
  sub_32DD4(&dword_0, v5, v6, "%{public}@ asking CHR ingestion service to run %{public}@ feature", v7, v8, v9, v10, v11);
}

void sub_AD4C8(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_32DC8() debugDescription];
  sub_F00C();
  sub_1A998(&dword_0, v4, v5, "%{public}@ retrieving access token from keychain", v6, v7, v8, v9, v10);
}

void sub_AD558(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_32DC8() debugDescription];
  sub_F00C();
  sub_1A998(&dword_0, v4, v5, "%{public}@ done asking SCD manager to store parsed data", v6, v7, v8, v9, v10);
}

void sub_AD5E8(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_32DC8() profile];
  sub_F00C();
  _os_log_fault_impl(&dword_0, v1, OS_LOG_TYPE_FAULT, "HDClinicalIngestionSignedClinicalDataOperation has no signed clinical data manager on profile %{public}@, cannot store parsing result", v4, 0xCu);
}

void sub_AD688(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 debugDescription];
  sub_F00C();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%{public}@ asking SCD manager to store parsed data for account %{public}@", v7, 0x16u);
}

void sub_AD788(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_1A98C() debugDescription];
  sub_1C908();
  sub_1C920(&dword_0, v5, v6, "%{public}@ failed to prune auth sessions: %{public}@", v7, v8, v9, v10, v11);
}

void sub_AD824(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
}

void sub_AD88C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint64_t v6 = [v4 debugDescription];
  sub_F00C();
  __int16 v9 = 2114;
  uint64_t v10 = v7;
  __int16 v11 = 2114;
  uint64_t v12 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@ unable to delete session with state %{public}@: %{public}@", v8, 0x20u);
}

void sub_AD958(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_1A98C() debugDescription];
  sub_1C908();
  sub_1C920(&dword_0, v5, v6, "%{public}@ unable to store patient ID mismatched credential: %{public}@", v7, v8, v9, v10, v11);
}

void sub_AD9F4(void **a1, void *a2)
{
  id v3 = *a1;
  id v4 = a2;
  [(id)sub_1A98C() debugDescription];
  objc_claimAutoreleasedReturnValue();
  sub_32DC8();
  uint64_t v5 = HKSensitiveLogItem();
  sub_3D500();
  sub_1C920(&dword_0, v6, v7, "%{public}@ failed to refresh account after token exchange, trying to proceed with in-memory account. Error: %{public}@", v8, v9, v10, v11, 2u);
}

void sub_ADAA8(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "HDClinicalAccountManager lost track of its profile extension", v1, 2u);
}

void sub_ADAEC()
{
  sub_3D594();
  id v2 = v1;
  id v3 = [(id)sub_1A98C() debugDescription];
  sub_1C908();
  sub_1C920(&dword_0, v4, v5, "%{public}@ unable to delete account with sync identifier %{public}@, failed to retrieve identifier for account", v6, v7, v8, v9, v10);
}

void sub_ADB84()
{
  sub_3D594();
  id v2 = v1;
  id v3 = [(id)sub_1A98C() identifier];
  sub_1C908();
}

void sub_ADC1C()
{
  sub_3D594();
  id v2 = v1;
  id v3 = [(id)sub_1A98C() identifier];
  sub_1C908();
}

void sub_ADCB4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_ADD30(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_32DC8();
  uint64_t v4 = HKSensitiveLogItem();
  sub_F00C();
  sub_3D54C(&dword_0, v5, v6, "HDClinicalAccountManager failed to record account state event for account: %{public}@", v7, v8, v9, v10, v11);
}

void sub_ADDC0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&void v3[14] = a2;
  sub_3D52C(&dword_0, a2, a3, "HDClinicalAccountManager failed to create new credential for account %{public}@ because authScopeWithError returned nil: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_ADE38()
{
  sub_3D580();
  sub_3D52C(&dword_0, v0, v1, "HDClinicalAccountManager failed to mark account %{public}@ as needing relogin: %{public}@");
}

void sub_ADEA8()
{
  sub_3D594();
  id v3 = v2;
  [(id)sub_1A98C() debugDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)sub_32DC8() object];
  sub_3D500();
  sub_1C920(&dword_0, v5, v6, "%{public}@ got HDClinicalAccountEntityDidChangeEventNotificationChangeNotification with object expected to be HKClinicalAccount but is %{public}@, dropping", v7, v8, v9, v10, 2u);
}

void sub_ADF58(uint64_t a1, void *a2, id *a3)
{
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = a2;
  uint64_t v6 = [v4 debugDescription];
  uint64_t v7 = [*a3 issuerIdentifier];
  uint64_t v8 = HKSensitiveLogItem();
  int v9 = 138543618;
  uint64_t v10 = v6;
  sub_3D500();
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@ there is no account or issuer %{public}@", (uint8_t *)&v9, 0x16u);
}

void sub_AE034(void **a1, void *a2)
{
  id v3 = *a1;
  id v4 = a2;
  [(id)sub_1A98C() debugDescription];
  objc_claimAutoreleasedReturnValue();
  sub_32DC8();
  uint64_t v5 = HKSensitiveLogItem();
  sub_3D500();
  sub_1C920(&dword_0, v6, v7, "%{public}@ failed to create account & issuer: %{public}@", v8, v9, v10, v11, 2u);
}

void sub_AE0E8(void *a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = a2;
  uint64_t v7 = [v5 debugDescription];
  uint64_t v9 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v10 = [a3 taskError];
  sub_3D56C();
  uint64_t v14 = v9;
  __int16 v15 = v11;
  uint64_t v16 = v8;
  __int16 v17 = v11;
  uint64_t v18 = v12;
  _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "%{public}@ failed ingestion with reason \"%{public}@\" for account %{public}@: %{public}@", v13, 0x2Au);
}

void sub_AE1D0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [(id)sub_32DC8() localizedDescription];
  sub_3D56C();
  uint64_t v9 = v3;
  __int16 v10 = v6;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%{public}@ failed to request changes cloud sync for reason: %{public}@ because %{public}@", v8, 0x20u);
}

void sub_AE288()
{
  sub_3D580();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed to request changes cloud sync for reason: %{public}@ with error: %{public}@", v4, 0x20u);
}

void sub_AE310()
{
  sub_F00C();
  sub_3D510(&dword_0, v0, v1, "HDClinicalAccountManager failed to retrieve instance from plugin on profile %{public}@", v2, v3, v4, v5, v6);
}

void sub_AE378(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [(id)sub_32DC8() error];
  int v6 = 138543618;
  uint64_t v7 = v3;
  sub_3D500();
  _os_log_fault_impl(&dword_0, v2, OS_LOG_TYPE_FAULT, "HDClinicalAccountManager journal: unable to end login session with state %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_AE42C()
{
  sub_F00C();
  sub_3D510(&dword_0, v0, v1, "HDClinicalAccountManager failed to retieve plugin from profile %{public}@", v2, v3, v4, v5, v6);
}

void sub_AE4D0(void *a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = [a1 profile];
  int v5 = 138543618;
  uint8_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@ attempting to run on profile %{public}@ which does not have a sharing manager", (uint8_t *)&v5, 0x16u);
}

void sub_AE58C(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_32DC8() debugDescription];
  int v4 = 138543362;
  int v5 = v3;
  _os_log_debug_impl(&dword_0, v1, OS_LOG_TYPE_DEBUG, "%{public}@ stale resources operation finished successfully", (uint8_t *)&v4, 0xCu);
}

void sub_AE630(void *a1, void *a2)
{
  id v4 = a1;
  int v5 = [(id)sub_32DC8() debugDescription];
  uint8_t v6 = [a2 operationError];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  __int16 v10 = v6;
  _os_log_error_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "%{public}@ stale resources operation failed with error %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_AE6FC(void *a1, uint64_t a2)
{
  id v4 = a1;
  int v5 = [(id)sub_32DC8() debugDescription];
  uint64_t v6 = *(void *)(a2 + 72);
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%{public}@ stale resources operation beginning with ingest start date %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_AE7C0(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 debugDescription];
  objc_claimAutoreleasedReturnValue();
  int v4 = 138543618;
  int v5 = a2;
  __int16 v6 = 2050;
  id v7 = [(id)sub_32DC8() count];
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%{public}@ stale resources operation found %{public}lu stale resources", (uint8_t *)&v4, 0x16u);
}

void sub_AE884(uint64_t a1, void *a2, uint64_t a3)
{
  int v4 = a2;
  int v5 = HKSensitiveLogItem();
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Could not parse provider with external id: %@, error: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_AE944(void *a1, uint64_t a2, id *a3)
{
  id v4 = a1;
  id v5 = (id)objc_opt_class();
  id WeakRetained = objc_loadWeakRetained(a3);
  id v7 = [WeakRetained daemon];
  __int16 v8 = [v7 primaryProfile];
  id v9 = objc_loadWeakRetained(a3);
  sub_4197C();
  sub_419BC(&dword_0, v10, v11, "%{public}@ there is no ontology configuration provider on primary profile %{public}@ of profile %{public}@", v12, v13, v14, v15, v16);
}

void sub_AEA38(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = (id)objc_opt_class();
  int v6 = [a3 externalID];
  uint64_t v13 = HKSensitiveLogItem();
  sub_4199C(&dword_0, v7, v8, "%{public}@ will not upsert unsupported gateway with external ID %{public}@", v9, v10, v11, v12, 2u);
}

void sub_AEB18(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = (id)objc_opt_class();
  int v6 = [a3 externalID];
  uint64_t v13 = HKSensitiveLogItem();
  sub_4199C(&dword_0, v7, v8, "%@ This is a fake brand used for testing, not attempting to fetch logo for %@", v9, v10, v11, v12, 2u);
}

void sub_AEBF8()
{
  sub_17E64();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%{public}@ Error determining whether resources need extraction: %{public}@", v1, 0x16u);
}

void sub_AEC70()
{
  sub_17E64();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "%{public}@ Failed to delete tokens from keychain when deleting credential from database: %{public}@", v1, 0x16u);
}

void sub_AECE8(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 accountIdentifier];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_fault_impl(&dword_0, v7, OS_LOG_TYPE_FAULT, "HDClinicalAccount._insertCodableAcounts received an account (%{public}@) with neither gatewayExternalID nor signedClinicalDataIssuerIdentifier", a1, 0xCu);
}

void sub_AED6C(void *a1)
{
  id v1 = a1;
  id v2 = HKSensitiveLogItem();
  sub_3D54C(&dword_0, v3, v4, "HDClinicalAccountEntity failed to record account state event for account: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_AEE04(void *a1)
{
  id v1 = a1;
  id v2 = HKSensitiveLogItem();
  sub_3D54C(&dword_0, v3, v4, "HDClinicalAccountEntity failed to journal account state event for account: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_AEE9C(void *a1)
{
  id v1 = a1;
  id v2 = HKSensitiveLogItem();
  sub_3D54C(&dword_0, v3, v4, "HDClinicalAccountEntity.deleteAccountWithIdentifier has gateway external ID %{public}@ but not the associated ROWID", v5, v6, v7, v8, 2u);
}

void sub_AEF34(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(const char **)(a1 + 40);
  uint64_t v6 = a2;
  uint64_t v7 = NSStringFromSelector(v4);
  int v8 = 138543874;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a3;
  _os_log_fault_impl(&dword_0, v6, OS_LOG_TYPE_FAULT, "%{public}@ %{public}@ %{public}@", (uint8_t *)&v8, 0x20u);
}

void sub_AEFFC(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  uint64_t v5 = [a2 task];
  uint64_t v6 = [v5 profile];
  int v7 = 138543618;
  int v8 = v4;
  __int16 v9 = 2112;
  __int16 v10 = v6;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@ running on profile %@ which does not have an ingestion manager", (uint8_t *)&v7, 0x16u);
}

void sub_AF0DC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 debugDescription];
  int v7 = [a2 account];
  int v8 = [v7 identifier];
  int v9 = 138543874;
  __int16 v10 = v6;
  __int16 v11 = 2114;
  __int16 v12 = v8;
  __int16 v13 = 2112;
  uint64_t v14 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@ account %{public}@ is not fetchable: %@", (uint8_t *)&v9, 0x20u);
}

void sub_AF1D4()
{
  sub_17E64();
  sub_F034(&dword_0, v0, v1, "%{public}@ failed to determine whether Health Records are supported: %{public}@");
}

void sub_AF23C()
{
  sub_17E64();
  sub_F034(&dword_0, v0, v1, "%{public}@ failed to retrieve the supported FHIR configurations: %{public}@");
}

void sub_AF2A4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&void v3[14] = a2;
  sub_F034(&dword_0, a2, a3, "%{public}@ failed to enumerate SCD records after updating account sources, error: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_AF320(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 64);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  sub_54E44();
  sub_1C920(&dword_0, v5, v6, "%{public}@ attempting to register a CHR supported change observer on an unsupported profile: %{public}@", v7, v8, v9, v10, v11);
}

void sub_AF3BC(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 64);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  sub_54E44();
  sub_1C920(&dword_0, v5, v6, "%{public}@ attempting to register an account event observer on an unsupported profile: %{public}@", v7, v8, v9, v10, v11);
}

void sub_AF458(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  sub_1C920(&dword_0, v3, v4, "[%{public}@] Unexpected notification instruction received: %ld", v5, v6, v7, v8, 2u);
}

void sub_AF508(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = sub_54E5C(v2);
  sub_1C920(&dword_0, v4, v5, "[%{public}@] Pending notification dismiss instructions returned nil with error = [%{public}@]", v6, v7, v8, v9, v10);
}

void sub_AF5A4(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = sub_54E5C(v2);
  sub_1C920(&dword_0, v4, v5, "[%{public}@] Mark pending notification instruction as processed failed with error: [%{public}@]", v6, v7, v8, v9, v10);
}

void sub_AF640()
{
  sub_17E64();
  sub_F034(&dword_0, v0, v1, "%{public}@: Failed to delete signed clinical data records: %{public}@");
}

void sub_AF6A8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  int v5 = 138543618;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2114;
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "%{public}@: invalid codable clinical deleted account: %{public}@", (uint8_t *)&v5, 0x16u);
}

void sub_AF75C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "%{public}@ Unable to retrieve account manager from profile", (uint8_t *)&v2, 0xCu);
}

void sub_AF7D4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "HDClinicalDeletedAccountSyncEntity received an invalid sync object: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_AF84C()
{
  sub_F00C();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%{public}@ received invalid credential from sync.", v1, 0xCu);
}

void sub_AF8C0()
{
  sub_F00C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "HDFHIRCredentialEntity SyncIdentity from received codable is nil %{public}@", v1, 0xCu);
}

void sub_AF934()
{
  sub_F00C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "HDFHIRCredentialEntity ConcreteSyncIdentity from received codable is nil %{public}@", v1, 0xCu);
}

void sub_AF9A8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  int v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  sub_F00C();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to record account event. Error: %{public}@", v7, 0x16u);
}

void sub_AFA68(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ failed to randomly mark resources as \"stale\", error: %{public}@", buf, 0x16u);
}

void sub_AFAD0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to schedule clinical sharing: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_AFB90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  int v6 = [a3 identifier];
  [a3 status];
  id v7 = NSStringFromAttachmentStatus();
  int v8 = 138543874;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  uint8_t v11 = v6;
  __int16 v12 = 2114;
  __int16 v13 = v7;
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%{public}@: downloadable attachment with identifier %{public}@ did change, status: %{public}@", (uint8_t *)&v8, 0x20u);
}

void sub_AFC70(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@: Error notifying document store about attachment changes with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_AFCFC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "HDCodableFHIRResource.safeUniquenessChecksum failed to convert codable FHIR resource to resource object: %@", (uint8_t *)&v2, 0xCu);
}

void sub_AFD74(void *a1, void *a2)
{
  uint64_t v3 = a1;
  int v4 = [a2 debugDescription];
  int v5 = 138543362;
  __int16 v6 = v4;
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%{public}@ reference range status operation beginning", (uint8_t *)&v5, 0xCu);
}

void sub_AFE1C(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)a1 + 40);
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = v4;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "HDClinicalGatewayEntity was unable to retrieve gateway entity %lld: %{public}@", buf, 0x16u);
}

void sub_AFE7C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543619;
  uint64_t v4 = a1;
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update gateway source with error %{private}@", (uint8_t *)&v3, 0x16u);
}

void sub_AFF04(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(const char **)(a1 + 48);
  uint64_t v6 = a2;
  uint64_t v7 = NSStringFromSelector(v4);
  int v8 = 138543874;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint8_t v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a3;
  _os_log_fault_impl(&dword_0, v6, OS_LOG_TYPE_FAULT, "%{public}@ %{public}@ %{public}@", (uint8_t *)&v8, 0x20u);
}

void sub_AFFCC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "%{public}@ there is no ontology configuration provider on profile %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_B0054(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = (id)objc_opt_class();
  uint64_t v6 = [a3 localizedDescription];
  uint64_t v7 = [a3 userInfo];
  int v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];
  sub_613C4();
  sub_613DC(&dword_0, v9, v10, "%{public}@ %{public}@. Underlying error: %{public}@", v11, v12, v13, v14, 2u);
}

void sub_B0160(void *a1)
{
  id v2 = a1;
  int v3 = (objc_class *)sub_66BE8();
  id v4 = NSStringFromClass(v3);
  sub_66BA0();
  sub_66C00(&dword_0, v1, v5, "%{public}@: parseSignedClinicalData calling out to XPC client %{public}@", v6);
}

void sub_B0204(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (objc_class *)sub_66BE8();
  uint64_t v5 = NSStringFromClass(v4);
  sub_F00C();
  sub_1A998(&dword_0, v6, v7, "%{public}@: parseSignedClinicalData received result, returning records", v8, v9, v10, v11, v12);
}

void sub_B0294(uint64_t a1, void *a2)
{
  sub_66BD0(a1, a2);
  id v4 = (objc_class *)sub_66BB8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  sub_32DC8();
  uint64_t v5 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v6, v7, "%{public}@: parseSignedClinicalData received error %{public}@", v8, v9, v10, v11, v12);
}

void sub_B0338(void *a1)
{
  id v2 = a1;
  id v3 = (objc_class *)sub_66BE8();
  id v4 = NSStringFromClass(v3);
  sub_66BA0();
  sub_66C00(&dword_0, v1, v5, "%{public}@: storeSignedClinicalData calling out to XPC client %{public}@", v6);
}

void sub_B03DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (objc_class *)sub_66BE8();
  uint64_t v5 = NSStringFromClass(v4);
  sub_F00C();
  sub_1A998(&dword_0, v6, v7, "%{public}@: storeSignedClinicalData did complete", v8, v9, v10, v11, v12);
}

void sub_B046C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (objc_class *)sub_66BE8();
  uint64_t v5 = NSStringFromClass(v4);
  sub_F00C();
  sub_1A998(&dword_0, v6, v7, "%{public}@: storeSignedClinicalData received result, storing data", v8, v9, v10, v11, v12);
}

void sub_B04FC(uint64_t a1, void *a2)
{
  sub_66BD0(a1, a2);
  id v4 = (objc_class *)sub_66BB8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  sub_32DC8();
  uint64_t v5 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v6, v7, "%{public}@: storeSignedClinicalData received error %{public}@", v8, v9, v10, v11, v12);
}

void sub_B05A0(void *a1)
{
  os_log_t v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = HKSensitiveLogItem();
  sub_CC6C();
  sub_66B88(&dword_0, v1, v5, "%{public}@: reextractOriginalSignedClinicalDataRecords failed to look up accounts with error %{public}@", v6);
}

void sub_B0664(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  sub_66B88(&dword_0, a4, a3, "%{public}@: reextractOriginalSignedClinicalDataRecords finished with error %{public}@", (uint8_t *)a3);
}

void sub_B06D0(uint64_t a1, void *a2)
{
  sub_66BD0(a1, a2);
  id v3 = (objc_class *)sub_66BB8();
  id v4 = NSStringFromClass(v3);
  sub_66BA0();
  sub_66C00(&dword_0, v2, v5, "%{public}@: reextractOriginalSignedClinicalDataRecords received result from XCP client for account %{public}@, storing data", v6);
}

void sub_B0770(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = HKSensitiveLogItem();
  int v8 = 138543874;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@: reextractOriginalSignedClinicalDataRecords failed to process records for account %{public}@ via XPC client with error %{public}@", (uint8_t *)&v8, 0x20u);
}

void sub_B0858(void *a1)
{
  id v2 = a1;
  sub_32DC8();
  id v3 = HKSensitiveLogItem();
  sub_F00C();
  sub_3D54C(&dword_0, v4, v5, "HDSignedClinicalDataManager.storeDataFromParsingResult failed to retrieve account for record with error: %{public}@", v6, v7, v8, v9, v10);
}

void sub_B08E8(void *a1, void *a2)
{
  id v3 = a1;
  [a2 persistentID];
  sub_32DC8();
  uint64_t v4 = HKSensitiveLogItem();
  sub_CC6C();
  _os_log_fault_impl(&dword_0, v3, OS_LOG_TYPE_FAULT, "HDSignedClinicalDataManager._storeDataFromClinicalItem failed to retrieve HDClinicalAccount for HDClinicalAccountEntity with persistentID %lld, error: %{public}@", v5, 0x16u);
}

void sub_B09A0(void *a1)
{
  id v2 = a1;
  sub_32DC8();
  id v3 = HKSensitiveLogItem();
  sub_F00C();
  sub_3D54C(&dword_0, v4, v5, "HDSignedClinicalDataManager.deleteSignedClinicalDataRecord cannot delete record %{public}@ because it doesn't have a sync identifier", v6, v7, v8, v9, v10);
}

void sub_B0A30(uint64_t a1, void *a2)
{
  sub_66BD0(a1, a2);
  uint64_t v4 = (objc_class *)sub_66BB8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  sub_32DC8();
  uint64_t v5 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v6, v7, "%{public}@: reverifySignatureForRecord failed to process records via XPC client with error %{public}@", v8, v9, v10, v11, v12);
}

void sub_B0AD4()
{
  sub_F00C();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%{public}@", v1, 0xCu);
}

void sub_B0B48(uint64_t a1, void *a2)
{
  sub_66BD0(a1, a2);
  uint64_t v4 = (objc_class *)sub_66BB8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  sub_32DC8();
  uint64_t v5 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v6, v7, "%{public}@: reverifySignatureForRecord failed to update record after verifying signature %{public}@", v8, v9, v10, v11, v12);
}

void sub_B0BEC(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [a2 gatewayExternalID];
  if (v7) {
    CFStringRef v8 = @"gateway";
  }
  else {
    CFStringRef v8 = @"issuer";
  }
  uint64_t v9 = [a2 gatewayExternalID];
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v10 = [a2 issuerIdentifier];
  }
  int v11 = 138543874;
  uint8_t v12 = v6;
  __int16 v13 = 2114;
  CFStringRef v14 = v8;
  __int16 v15 = 2114;
  uint8_t v16 = v10;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "%{public}@: failed to find account for codable record with %{public}@ %{public}@", (uint8_t *)&v11, 0x20u);
  if (!v9) {
}
  }

void sub_B0D1C()
{
  sub_17E64();
  sub_66B88(&dword_0, v0, (uint64_t)v0, "HDSignedClinicalDataManager.extractUnextractedOriginalRecordsWithReason:completion: error retrieving potentially unextracted SCD records with reason \"%{public}@\", error: %{public}@", v1);
}

void sub_B0D8C()
{
  sub_17E64();
  sub_3D52C(&dword_0, v0, v1, "HDSignedClinicalDataManager.extractUnextractedOriginalRecordsWithReason:completion: error retrieving potentially unextracted SCD records with reason \"%{public}@\", error: %{public}@");
}

void sub_B0DF4()
{
  sub_17E64();
  sub_66B88(&dword_0, v0, (uint64_t)v0, "HDSignedClinicalDataManager.reextractSignedClinicalDataRecordsForAccountWithIdentifier:completion: error retrieving codable SCD records for account %{public}@, error: %{public}@", v1);
}

void sub_B0E64()
{
  sub_17E64();
  sub_3D52C(&dword_0, v0, v1, "HDSignedClinicalDataManager.reextractSignedClinicalDataRecordsForAccountWithIdentifier:completion: error retrieving codable SCD records for account %{public}@, error: %{public}@");
}

void sub_B0ECC(uint64_t a1, void *a2)
{
  sub_66BD0(a1, a2);
  uint64_t v4 = (objc_class *)sub_66BB8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  sub_32DC8();
  uint64_t v5 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v6, v7, "%{public}@.triggerDownloadIssuerRegistryWithOptions received error %{public}@", v8, v9, v10, v11, v12);
}

void sub_B0F70(uint64_t a1, void *a2)
{
  sub_66BD0(a1, a2);
  uint64_t v4 = (objc_class *)sub_66BB8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  sub_32DC8();
  uint64_t v5 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v6, v7, "%{public}@.triggerDownloadPublicKeysWithOptions received error %{public}@", v8, v9, v10, v11, v12);
}

void sub_B1014(void *a1, void *a2)
{
  id v4 = a1;
  uint64_t v5 = (objc_class *)sub_66BB8();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  sub_32DC8();
  uint64_t v6 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v7, v8, "%{public}@: updateIssuerTitlesUsingRegistry failed with error: %{public}@", v9, v10, v11, v12, v13);
}

void sub_B10C0(void *a1)
{
  id v2 = a1;
  id v3 = (objc_class *)sub_66BE8();
  id v4 = NSStringFromClass(v3);
  sub_F00C();
  sub_1A998(&dword_0, v5, v6, "%{public}@: Performing protected data became available checks", v7, v8, v9, v10, v11);
}

void sub_B1150(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = (objc_class *)sub_66BB8();
  uint64_t v7 = NSStringFromClass(v6);
  int v9 = 138543618;
  uint64_t v10 = v7;
  __int16 v11 = 2114;
  uint64_t v12 = a3;
  sub_66C00(&dword_0, v3, v8, "%{public}@: Scheduling SCD extraction on maintenance coordinator with reason: %{public}@", (uint8_t *)&v9);
}

void sub_B1204(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 logPrefix];
  sub_F00C();
  sub_1A998(&dword_0, v5, v6, "%{public}@ waiting on background ingestions to finish", v7, v8, v9, v10, v11);
}

void sub_B1298(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 logPrefix];
  sub_F00C();
  sub_1A998(&dword_0, v5, v6, "%{public}@ triggering background ingestion on all profiles", v7, v8, v9, v10, v11);
}

void sub_B132C(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = [(id)sub_1A98C() logPrefix];
  id v6 = [*(id *)(a1 + 40) count];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  id v10 = v6;
  _os_log_debug_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%{public}@ all background ingestions have completed, %lu with errors", (uint8_t *)&v7, 0x16u);
}

void sub_B13F0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = [(id)sub_1A98C() logPrefix];
  uint8_t v13 = [a3 name];
  sub_1C920(&dword_0, v7, v8, "%{public}@ periodic activity %{public}@ is not an expected activity, not configuring", v9, v10, v11, v12, 2u);
}

void sub_B14B0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "HDHealthRecordsPeriodicIngestionManager lost its handle on healthDaemon, cannot perform periodic ingestion", v1, 2u);
}

void sub_B14F4(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_1A98C() logPrefix];
  sub_F00C();
  sub_1C920(&dword_0, v4, v5, "%{public}@ periodic activity %{public}@ is not an expected activity, not performing", v6, v7, v8, v9, v10);
}

void sub_B159C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_1A98C() logPrefix];
  sub_F00C();
  sub_1C920(&dword_0, v5, v6, "%{public}@ periodic activity %{public}@ completed with an error case", v7, v8, v9, v10, v11);
}

void sub_B1648(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint64_t v6 = [v4 debugDescription];
  uint64_t v7 = HKClinicalDataCollectionReasonToString();
  int v8 = 138543874;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  uint8_t v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@: opt-in data collection (%{public}@) error: %{public}@", (uint8_t *)&v8, 0x20u);
}

void sub_B1728(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@: Cannot begin opt-in data collection without access to protected data", (uint8_t *)&v5, 0xCu);
}

void sub_B17D0(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  int v5 = [a2 profile];
  uint64_t v6 = [v5 daemon];
  uint64_t v7 = [v6 primaryProfile];
  int v8 = [a2 profile];
  int v9 = 138543874;
  __int16 v10 = v4;
  __int16 v11 = 2114;
  __int16 v12 = v7;
  __int16 v13 = 2114;
  CFStringRef v14 = v8;
  _os_log_fault_impl(&dword_0, v3, OS_LOG_TYPE_FAULT, "%{public}@ does not have an ontology configuration provider on primary profile %{public}@ of profile %{public}@", (uint8_t *)&v9, 0x20u);
}

void sub_B18E8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@: Error getting resource %llu", (uint8_t *)&v4, 0x16u);
}

void sub_B1974(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [a2 debugDescription];
  sub_1C908();
  sub_1C920(&dword_0, v5, v6, "%{public}@: Couldn't initialize a PII redactor: %{public}@", v7, v8, v9, v10, v11);
}

void sub_B1A14(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [a2 debugDescription];
  sub_1C908();
  sub_1C920(&dword_0, v5, v6, "%{public}@: Error %{public}@, while submitting opt-in data", v7, v8, v9, v10, v11);
}

void sub_B1AB4()
{
  sub_F00C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "HDOriginalSignedClinical SyncIdentity from received codable is nil %{public}@", v1, 0xCu);
}

void sub_B1B28()
{
  sub_F00C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "HDOriginalSignedClinical ConcreteSyncIdentity from received codable is nil %{public}@", v1, 0xCu);
}

void sub_B1B9C(void *a1, void *a2)
{
  id v3 = a1;
  [a2 persistentID];
  sub_F00C();
  _os_log_fault_impl(&dword_0, v3, OS_LOG_TYPE_FAULT, "HDOriginalSignedClinicalDataRecordEntity found more than one HKSignedClinicalDataRecord associated with persistent ID %lu", v4, 0xCu);
}

void sub_B1C34(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)a1 + 40);
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = v4;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "HDOriginalSignedClinicalDataRecordEntity: unable to retrieve original SCD codable from db %lld: %{public}@", buf, 0x16u);
}

void sub_B1C94(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%{public}@ replaceOriginalRecordWithSyncIdentifier attempted to replace signature status for record but record already had that signature status. Skipping.", (uint8_t *)&v3, 0xCu);
}

void sub_B1D10(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 UUID];
  sub_F00C();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  _os_log_fault_impl(&dword_0, v5, OS_LOG_TYPE_FAULT, "HDOriginalSignedClinicalDataRecordEntity did process a clinical record with an invalid _HKPrivateMetadataKeyMedicalRecordUUID metadata entry. Record: %{public}@, metadata entry: %{public}@", v7, 0x16u);
}

void sub_B1DCC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void **)(a1 + 8);
  id v6 = v4;
  int v7 = 138412546;
  __int16 v8 = v4;
  __int16 v9 = 2048;
  id v10 = [v5 count];
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%@ submitting %zd unknown records metrics as \"com.apple.HealthRecords.ProcessingExtractionFailureEvent\" to CoreAnalytics", (uint8_t *)&v7, 0x16u);
}

void sub_B1E8C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = objc_opt_class();
  id v6 = [a3 URL];
  int v7 = [v6 absoluteString];
  __int16 v8 = HKSensitiveLogItem();
  int v9 = 138543618;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  __int16 v12 = v8;
  _os_log_debug_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "%{public}@ starting at %@", (uint8_t *)&v9, 0x16u);
}

void sub_B1F80(uint64_t a1, void *a2)
{
  int v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [*(id *)(a1 + 40) URL];
  id v6 = [v5 absoluteString];
  int v7 = HKSensitiveLogItem();
  __int16 v8 = HKSensitiveLogItem();
  int v9 = 138543874;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  __int16 v12 = v7;
  __int16 v13 = 2112;
  CFStringRef v14 = v8;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@ error response for %@: %@", (uint8_t *)&v9, 0x20u);
}

void sub_B2094(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Provider Service response error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_B210C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "HDOriginalSignedClinicalDataRecordSyncEntity expects HDCodableOriginalSignedClinicalDataRecord, error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_B2184(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%{public}@ skipping file import", (uint8_t *)&v5, 0xCu);
}

void sub_B222C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update MedicalDownloadableAttachments for medical records being re-inserted with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_B22B4(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  sub_15694(&dword_0, v3, v4, "%{public}@ gatewayScopeWithError failed to get the authorize schema (authorizeSchema == nil)", v5, v6, v7, v8, 2u);
}

void sub_B234C(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  sub_15694(&dword_0, v3, v4, "%{public}@ gatewayScopeWithError failed to get the scope string from the authorize schema (authorizationScopeString == nil)", v5, v6, v7, v8, 2u);
}

void sub_B23E4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 debugDescription];
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@ found PKCE algorithm but was not a string: %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_B24A4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "HDClinicalGateway has an unsupported PKCE algorithm: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_B2618(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = objc_opt_class();
  id v6 = v5;
  int v7 = [a3 HTTPMethod];
  uint64_t v8 = [a3 URL];
  __int16 v9 = [v8 absoluteString];
  uint64_t v10 = HKSensitiveLogItem();
  int v11 = 138543874;
  __int16 v12 = v5;
  __int16 v13 = 2114;
  CFStringRef v14 = v7;
  __int16 v15 = 2112;
  uint8_t v16 = v10;
  _os_log_debug_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "%{public}@ starting with request %{public}@ %@", (uint8_t *)&v11, 0x20u);
}

void sub_B2740(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  sub_8311C();
  sub_83134(&dword_0, v5, v6, "%{public}@ downloadable attachment %{public}@, has no accountIdentifier", v7, v8, v9, v10, v11);
}

void sub_B27E4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  sub_8311C();
  sub_83134(&dword_0, v5, v6, "%{public}@ downloadable attachment %{public}@, has neither a webURL nor an inlineDataChecksum", v7, v8, v9, v10, v11);
}

void sub_B2888(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "HDMedicalDownloadableAttachmentEntity found more than one HKMedicalDownloadableAttachment with matching inlineDataChecksum", v1, 2u);
}

void sub_B28CC(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138477827;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "HDMedicalDownloadableAttachmentEntity found more than one HKMedicalDownloadableAttachment with matching webURL: %{private}@", buf, 0xCu);
}

void sub_B292C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 profile];
  uint64_t v5 = [v4 healthRecordsExtension];
  uint64_t v6 = [a1 profile];
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  __int16 v12 = v6;
  _os_log_fault_impl(&dword_0, v3, OS_LOG_TYPE_FAULT, "%{public}@ unable to find account manager on health records extension %{public}@ for profile %{public}@", (uint8_t *)&v7, 0x20u);
}

void sub_B2A1C()
{
  sub_17E64();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%{public}@ failed to determine whether profile has accounts: %{public}@", v1, 0x16u);
}

void sub_B2A94()
{
  sub_17E64();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%{public}@ reporting account info status %{public}@", v1, 0x16u);
}

void sub_B2B0C(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_32DC8() taskError];
  sub_F00C();
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Failed periodic ingestion: %{public}@", v4, 0xCu);
}

void sub_B2BAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_32DC8() taskError];
  sub_32DB0();
  sub_66B88(&dword_0, v2, v5, "Failed ingestion for reason: %{public}@, error: %{public}@", v6);
}

void sub_B2C50(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_32DC8() taskError];
  sub_32DB0();
  sub_66B88(&dword_0, v2, v5, "Failed extraction for reason: %{public}@, error: %{public}@", v6);
}

void sub_B2CF4()
{
  sub_3D594();
  id v2 = v1;
  id v3 = [(id)sub_1A98C() logDescription];
  sub_F00C();
  sub_CC84(&dword_0, v4, v5, "%{public}@: scheduling extraction on maintenance coordinator with reason: %@", v6, v7, v8, v9, v10);
}

void sub_B2D98()
{
  sub_3D594();
  id v2 = v1;
  id v3 = [(id)sub_1A98C() logDescription];
  sub_1C908();
  sub_66B88(&dword_0, v0, v4, "%{public}@: failed to set enable notifications for health records with error %{public}@", v5);
}

void sub_B2E38()
{
  sub_3D594();
  id v2 = v1;
  id v3 = [(id)sub_1A98C() logDescription];
  sub_1C908();
  sub_CC84(&dword_0, v4, v5, "%{public}@: notification setting %{public}@ is not set, defaulting to ON", v6, v7, v8, v9, v10);
}

void sub_B2ED0()
{
  sub_3D594();
  id v2 = v1;
  id v3 = [(id)sub_1A98C() logDescription];
  sub_1C908();
  sub_66B88(&dword_0, v0, v4, "%{public}@: failed to check if CHR Notifications were enabled with error: %{public}@", v5);
}

void sub_B2F70(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_32DC8() logDescription];
  sub_F00C();
  _os_log_fault_impl(&dword_0, v1, OS_LOG_TYPE_FAULT, "%{public}@: missing notification manager. Can't post notification", v4, 0xCu);
}

void sub_B3010(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint64_t v6 = [v4 logDescription];
  sub_F00C();
  __int16 v9 = 2114;
  uint64_t v10 = v7;
  __int16 v11 = 2114;
  uint64_t v12 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@: posting new health records notification for task %{public}@ failed: %{public}@", v8, 0x20u);
}

void sub_B30DC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  sub_66B88(&dword_0, a3, (uint64_t)a3, "Posting new health lab records notification for task %{public}@ failed: %{public}@", (uint8_t *)&v4);
}

void sub_B3160(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543619;
  uint64_t v5 = v3;
  __int16 v6 = 2113;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ Completed runMedicalDownloadableAttachmentPipelineWithCompletion with error %{private}@", (uint8_t *)&v4, 0x16u);
}

void sub_B31EC()
{
  sub_17E64();
  sub_66B88(&dword_0, v0, (uint64_t)v0, "%{public}@: Failed to get profile. Error: %{public}@", v1);
}

void sub_B325C()
{
  sub_2560C();
  id v2 = v1;
  uint64_t v3 = [(id)sub_8F00C() localizedDescription];
  int v4 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v5, v6, "%{public}@: _beginOrResumeDownloadingAttachmentsWithError failed with error: %{public}@", v7, v8, v9, v10, v11);
}

void sub_B3304()
{
  sub_2560C();
  id v2 = v1;
  uint64_t v3 = [(id)sub_8F00C() localizedDescription];
  int v4 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v5, v6, "%{public}@: processing / indexing HKMedicalDownloadableAttachments failed with error: %{public}@", v7, v8, v9, v10, v11);
}

void sub_B33AC()
{
  sub_2560C();
  id v2 = v1;
  uint64_t v3 = [(id)sub_8F00C() localizedDescription];
  int v4 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v5, v6, "%{public}@: reconcile HKMedicalDownloadableAttachments failed with error: %{public}@", v7, v8, v9, v10, v11);
}

void sub_B3454()
{
  sub_2560C();
  id v2 = v1;
  uint64_t v3 = [(id)sub_8F00C() localizedDescription];
  int v4 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v5, v6, "%{public}@: _createBatchDownloadAttachmentsAwaitingDownloadWithBatchSize failed with error: %{public}@", v7, v8, v9, v10, v11);
}

void sub_B34FC()
{
  sub_F00C();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%{public}@: No identifiers returned in notifyDownloadingCompleteAndRequestMoreWithIdentifiers. The refresh token may have expired.", v1, 0xCu);
}

void sub_B3570()
{
  sub_2560C();
  id v2 = v1;
  uint64_t v3 = [(id)sub_8F00C() localizedDescription];
  int v4 = HKSensitiveLogItem();
  sub_CC6C();
  sub_1C920(&dword_0, v5, v6, "%{public}@: processing / indexing failed with error: %{public}@", v7, v8, v9, v10, v11);
}

void sub_B3618(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  uint64_t v6 = [a3 localizedDescription];
  uint64_t v7 = HKSensitiveLogItem();
  int v9 = 138543618;
  uint64_t v10 = v4;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  sub_66B88(&dword_0, v5, v8, "%{public}@: downloading batch failed with error: %{public}@", (uint8_t *)&v9);
}

void sub_B36E0()
{
  sub_2560C();
  id v2 = v1;
  sub_8F00C();
  uint64_t v3 = HKSensitiveLogItem();
  sub_CC6C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "%{public}@: Failed to remove local file after handing off to HKAttachment. Error: %{public}@", v4, 0x16u);
}

void sub_B3788()
{
  sub_F00C();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%{public}@: HKMedicalDownloadableAttachment HKAttachment already created.", v1, 0xCu);
}

void sub_B37FC(void **a1, void *a2)
{
  id v2 = *a1;
  uint64_t v3 = a2;
  uint64_t v4 = [v2 attachmentIdentifier];
  sub_F00C();
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Indexing results do not contain attachmentIdentifier: %@", v5, 0xCu);
}

void sub_B38A0()
{
  sub_2560C();
  id v3 = v2;
  int v4 = 138543618;
  uint64_t v5 = v0;
  __int16 v6 = 2048;
  id v7 = [(id)sub_8F00C() count];
  _os_log_debug_impl(&dword_0, v1, OS_LOG_TYPE_DEBUG, "%{public}@: Reconciliation %lu HKMedicalDownloadableAttachments", (uint8_t *)&v4, 0x16u);
}

void sub_B394C()
{
  sub_F00C();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%{public}@: Start reconciliation for HKMedicalDownloadableAttachments", v1, 0xCu);
}

void sub_B39C0()
{
  sub_17E64();
  sub_66B88(&dword_0, v0, (uint64_t)v0, "%{public}@: Retry for medical record identifier %{public}@ failed. No HKMedicalDownloadableAttachments found.", v1);
}

void sub_B3A30(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3;
  __int16 v6 = [0 localizedDescription];
  id v7 = HKSensitiveLogItem();
  int v8 = 138543874;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  __int16 v12 = 2114;
  __int16 v13 = v7;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@: reconcile HKMedicalDownloadableAttachment failed for medical record identifier %@ with error: %{public}@", (uint8_t *)&v8, 0x20u);
}

void sub_B3B14()
{
  sub_17E64();
  sub_66B88(&dword_0, v0, (uint64_t)v0, "%{public}@: _downloadableAttachmentDidChange HKMedicalDownloadableAttachment not found in database for identifier: %{public}@", v1);
}

void sub_B3B84()
{
  sub_2560C();
  id v4 = v3;
  uint64_t v5 = [(id)sub_8F00C() identifier];
  [v0 status];
  __int16 v6 = NSStringFromAttachmentStatus();
  int v7 = 138543874;
  uint64_t v8 = v1;
  __int16 v9 = 2114;
  __int16 v10 = v5;
  __int16 v11 = 2114;
  __int16 v12 = v6;
  _os_log_debug_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%{public}@: downloadable attachment with identifier %{public}@ did change, status: %{public}@", (uint8_t *)&v7, 0x20u);
}

void sub_B3C5C(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "%{public}@ credentialHasOutdatedScopes: failed to get the scope string from the authorize schema (gatewayScopeString == nil) %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_B3D1C(void *a1)
{
  uint64_t v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "%{public}@ credentialHasOutdatedScopes: method called on an account with no associated credential", (uint8_t *)&v3, 0xCu);
}

void sub_B3DC4(void *a1)
{
  uint64_t v1 = a1;
  id v2 = HKSensitiveLogItem();
  int v3 = 138543362;
  id v4 = v2;
  _os_log_fault_impl(&dword_0, v1, OS_LOG_TYPE_FAULT, "%{public}@ has no valid provenance", (uint8_t *)&v3, 0xCu);
}

void sub_B3E6C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "HDSignedClinicalDataRecordEntity.willDeleteWithProfile:transaction:error: failed to retrieve original SCD sync identifier, cannot inform ingestion. Original SCD record ROWID: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_B3EE4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "HDSignedClinicalDataRecordEntity.willDeleteWithProfile:transaction:error: failed to convert original SCD sync identifier from data to UUID, cannot inform ingestion", v1, 2u);
}

void sub_B3F28(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "HDSignedClinicalDataRecordEntity.willDeleteWithProfile:transaction:error: running on profile without health records extension, which seems impossible; cannot inform ingestion",
    v1,
    2u);
}

void sub_B3F6C()
{
  sub_F00C();
  sub_2959C(&dword_0, v0, v1, "Scheduling CHR API reminder triggers using date %{public}@", v2, v3, v4, v5, v6);
}

void sub_B3FD4()
{
  sub_F00C();
  sub_EFF0(&dword_0, v0, v1, "Failed to fetch last posted CHR API reminder: %{public}@", v2, v3, v4, v5, v6);
}

void sub_B403C()
{
  sub_F00C();
  sub_EFF0(&dword_0, v0, v1, "Failed to fetch next scheduled CHR API reminder: %{public}@", v2, v3, v4, v5, v6);
}

void sub_B40A4()
{
  sub_F00C();
  sub_2959C(&dword_0, v0, v1, "Next eligible reminder fire date: %{public}@", v2, v3, v4, v5, v6);
}

void sub_B410C()
{
  sub_17E64();
  sub_F034(&dword_0, v0, v1, "Failed to delete reminder %@: %{public}@");
}

void sub_B4174()
{
  sub_F00C();
  sub_2959C(&dword_0, v0, v1, "Began processing next reminder using pending reminder transaction ID: %{public}@", v2, v3, v4, v5, v6);
}

void sub_B41DC()
{
  sub_97B68();
  sub_97B4C(&dword_0, v0, v1, "Firing first eligible Health Records API reminder if exists.", v2, v3, v4, v5, v6);
}

void sub_B4210()
{
  sub_F00C();
  sub_2959C(&dword_0, v0, v1, "Reminder already in flight. Canceling pending reminder ID %{public}@.", v2, v3, v4, v5, v6);
}

void sub_B4278()
{
  sub_F00C();
  sub_2959C(&dword_0, v0, v1, "No eligible reminder fetched. Canceling pending reminder ID %{public}@.", v2, v3, v4, v5, v6);
}

void sub_B42E0(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = HDUserNotificationResponseButtonToString();
  sub_1C908();
  _os_log_debug_impl(&dword_0, v1, OS_LOG_TYPE_DEBUG, "Received notification response %{public}@ for pending reminder ID %{public}@", v3, 0x16u);
}

void sub_B4390()
{
  sub_F00C();
  sub_EFF0(&dword_0, v0, v1, "Failed to set reminder posted date: %{public}@", v2, v3, v4, v5, v6);
}

void sub_B43F8()
{
  sub_F00C();
  sub_3D510(&dword_0, v0, v1, "Received unexpected 'Default' notification response for reminder %@", v2, v3, v4, v5, v6);
}

void sub_B4460()
{
  sub_F00C();
  sub_3D510(&dword_0, v0, v1, "Failed to fetch application proxy for the Health app: %{public}@", v2, v3, v4, v5, v6);
}

void sub_B44C8()
{
  sub_F00C();
  sub_3D510(&dword_0, v0, v1, "Expected to receive an LSApplicationRecord to the health app but got %{public}@", v2, v3, v4, v5, v6);
}

void sub_B4530(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&void v3[14] = a2;
  sub_F034(&dword_0, a2, a3, "Failed to open user activity %@ in the Health app: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_B45AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B461C(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = HKSensitiveLogItem();
  sub_1C908();
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Failed to fetch clinical types authorization records for source %@, so dropping reminder: %{public}@", v3, 0x16u);
}

void sub_B46CC(void *a1)
{
  id v2 = a1;
  sub_32DC8();
  uint64_t v3 = HKSensitiveLogItem();
  sub_F00C();
  sub_15694(&dword_0, v4, v5, "Dropping reminder for source %@ due to no clinical authorization records", v6, v7, v8, v9, v10);
}

void sub_B475C(void *a1)
{
  id v2 = a1;
  sub_32DC8();
  uint64_t v3 = HKSensitiveLogItem();
  sub_F00C();
  sub_15694(&dword_0, v4, v5, "Dropping CHR API reminder for source %@ due to no clinical types authorized for reading", v6, v7, v8, v9, v10);
}

void sub_B47EC(void *a1)
{
  id v2 = a1;
  sub_32DC8();
  uint64_t v3 = HKSensitiveLogItem();
  sub_F00C();
  sub_15694(&dword_0, v4, v5, "Dropping CHR API reminder for source %@ due to non-unlimited authorization mode", v6, v7, v8, v9, v10);
}

void sub_B487C(void *a1)
{
  id v2 = a1;
  sub_32DC8();
  uint64_t v3 = HKSensitiveLogItem();
  sub_F00C();
  _os_log_debug_impl(&dword_0, v1, OS_LOG_TYPE_DEBUG, "Deregistering app %@ from CHR API reminders", v4, 0xCu);
}

void sub_B491C()
{
  sub_97B68();
  sub_97B4C(&dword_0, v0, v1, "Started listening for Homescreen unlock notifications", v2, v3, v4, v5, v6);
}

void sub_B4950()
{
  sub_97B68();
  sub_97B4C(&dword_0, v0, v1, "Stopped listening for Homescreen unlock notifications", v2, v3, v4, v5, v6);
}

void sub_B4984()
{
  sub_97B68();
  sub_97B4C(&dword_0, v0, v1, "Received unlocked to Homescreen notification", v2, v3, v4, v5, v6);
}

void sub_B49B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B4A28()
{
  sub_17E64();
  sub_F034(&dword_0, v0, v1, "Error retrieving time interval for defaults key %{public}@: %{public}@");
}

void sub_B4A90(uint64_t a1, NSObject *a2, double a3)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Time interval for defaults key %{public}@ must be positive. Got: %f", (uint8_t *)&v3, 0x16u);
}

void sub_B4B14(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 logDescription];
  sub_F00C();
  sub_1A998(&dword_0, v5, v6, "%{public}@ finished downloading", v7, v8, v9, v10, v11);
}

void sub_B4BA8(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 logDescription];
  sub_F00C();
  sub_1A998(&dword_0, v5, v6, "%{public}@ starting to download", v7, v8, v9, v10, v11);
}

void sub_B4C3C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 logDescription];
  sub_F00C();
  __int16 v8 = 2048;
  uint64_t v9 = a3;
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%{public}@ fetching with %zd retry(ies) remaining", v7, 0x16u);
}

void sub_B4CF8()
{
  sub_F00C();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Unknown HKFHIRResourceQueryMode %lu, returning \"all\" HDFHIRQueryMode", v1, 0xCu);
}

void sub_B4D6C(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 logDescription];
  uint64_t v7 = objc_msgSend(a3, "hrs_safelyLoggableDescription");
  int v8 = 138543618;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  uint8_t v11 = v7;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@ fetching failed with error: %{public}@", (uint8_t *)&v8, 0x16u);
}

void sub_B4E7C(uint64_t a1, void *a2, const char *a3)
{
  id v4 = a2;
  uint64_t v5 = NSStringFromSelector(a3);
  sub_3D500();
  sub_CC84(&dword_0, v6, v7, "%{public}@ %{public}@ got an empty array, returning early", v8, v9, v10, v11, 2u);
}

void sub_B4F24()
{
  sub_A4B9C();
  sub_F034(&dword_0, v0, v1, "%{public}@ Failed to insert new resource: %@");
}

void sub_B4F8C()
{
  sub_A4B9C();
  sub_F034(&dword_0, v0, v1, "%{public}@ Failed to record last seen date for new resource: %@");
}

void sub_B4FF4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ Failed to query existing resource's first seen date because transaction has been interrupted, aborting", (uint8_t *)&v2, 0xCu);
}

void sub_B506C(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "%{public}@ Failed to query existing resource's first seen date, proceeding to insert: %@", buf, 0x16u);
}

void sub_B50D4()
{
  sub_A4B9C();
  sub_F034(&dword_0, v0, v1, "%{public}@ Failed to record last seen date for existing resource: %@");
}

void sub_B513C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ Failed to query whether resource already exists because transaction has been interrupted, aborting", (uint8_t *)&v2, 0xCu);
}

void sub_B51B4()
{
  sub_A4B9C();
  sub_3D52C(&dword_0, v0, v1, "%{public}@ Failed to query whether resource already exists, will attempt to insert: %@");
}

void sub_B521C(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "%{public}@ Error deferring foreign key constraint: %@", (uint8_t *)&v6, 0x16u);
}

void sub_B52DC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&void v3[14] = *(void *)(*(void *)a2 + 24);
  sub_F034(&dword_0, a2, a3, "%{public}@ FHIRResource at anchor (%lld) exceeds max message size. Skipping.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_B535C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 88);
  *(_WORD *)&v3[12] = 2048;
  *(void *)&void v3[14] = a2;
  sub_3D52C(&dword_0, a2, a3, "%{public}@ unable to fetch account ROWID, skipping resource at anchor %lld", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_B53D8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(const char **)(a1 + 40);
  int v6 = a2;
  id v7 = NSStringFromSelector(v4);
  int v9 = 138543874;
  uint64_t v10 = v5;
  sub_3D500();
  __int16 v11 = v8;
  uint64_t v12 = a3;
  _os_log_fault_impl(&dword_0, v6, OS_LOG_TYPE_FAULT, "%{public}@ %{public}@ %{public}@", (uint8_t *)&v9, 0x20u);
}

void sub_B5498(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  sub_1A974();
  sub_1C920(&dword_0, v2, v3, "%{public}@: submitting HealthRecords daily analytics failed: %@", v4, v5, v6, v7, v8);
}

void sub_B552C(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  sub_1A974();
  sub_1C920(&dword_0, v3, v4, "%{public}@: failed to submit clinical sharing daily analytics, error: %@", v5, v6, v7, v8, v9);
}

void sub_B55C0(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  sub_1A998(&dword_0, v5, v6, "%{public}@ patient comparison done", v7, v8, v9, v10, 2u);
}

void sub_B5658(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  sub_1A998(&dword_0, v5, v6, "%{public}@ patient comparison beginning", v7, v8, v9, v10, 2u);
}

void sub_B56F0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 debugDescription];
  sub_1C908();
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%{public}@ patient comparison failed with error: %{public}@", v5, 0x16u);
}

void sub_B57A0(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  sub_1C908();
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%{public}@ canceling patient comparison with error: %{public}@", v5, 0x16u);
}

uint64_t sub_B5850()
{
  return AnalyticsGateway.countryCode.getter();
}

uint64_t sub_B5860()
{
  return dispatch thunk of IngestionAnalyticsAccumulator.accumulateIngestionAnalytics(from:gateway:)();
}

uint64_t sub_B5870()
{
  return dispatch thunk of IngestionAnalyticsAccumulator.analyticsString.getter();
}

uint64_t sub_B5880()
{
  return dispatch thunk of IngestionAnalyticsAccumulator.enumerateAndResetElementsAsPayload(with:block:)();
}

uint64_t sub_B5890()
{
  return IngestionAnalyticsAccumulator.__allocating_init()();
}

uint64_t sub_B58A0()
{
  return type metadata accessor for IngestionAnalyticsAccumulator();
}

uint64_t sub_B58B0()
{
  return static AnalyticsReportingConfiguration.forCoreAnalytics(optInStatus:)();
}

uint64_t sub_B58C0()
{
  return type metadata accessor for AnalyticsReportingConfiguration.OptInStatus();
}

uint64_t sub_B58D0()
{
  return type metadata accessor for AnalyticsReportingConfiguration();
}

NSDictionary sub_B58E0()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_B58F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_B5900()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B5910()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_B5920()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_B5930()
{
  return type metadata accessor for TaskPriority();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

uint64_t HDCPSDefaultEnvironment()
{
  return _HDCPSDefaultEnvironment();
}

uint64_t HDCPSNameForEnvironment()
{
  return _HDCPSNameForEnvironment();
}

uint64_t HDCreateSerialUtilityDispatchQueue()
{
  return _HDCreateSerialUtilityDispatchQueue();
}

uint64_t HDDecodeDateForValue()
{
  return _HDDecodeDateForValue();
}

uint64_t HDDiagnosticStringFromDate()
{
  return _HDDiagnosticStringFromDate();
}

uint64_t HDEncodeValueForDate()
{
  return _HDEncodeValueForDate();
}

uint64_t HDHealthRecordsPrivateUserAgentString()
{
  return _HDHealthRecordsPrivateUserAgentString();
}

uint64_t HDHealthRecordsPublicUserAgentString()
{
  return _HDHealthRecordsPublicUserAgentString();
}

uint64_t HDMedicalRecordEntityPredicateForFHIRIdentifier()
{
  return _HDMedicalRecordEntityPredicateForFHIRIdentifier();
}

uint64_t HDMedicalRecordEntityPredicateForSortDate()
{
  return _HDMedicalRecordEntityPredicateForSortDate();
}

uint64_t HDSQLiteBindBooleanToProperty()
{
  return _HDSQLiteBindBooleanToProperty();
}

uint64_t HDSQLiteBindDataToProperty()
{
  return _HDSQLiteBindDataToProperty();
}

uint64_t HDSQLiteBindDateToProperty()
{
  return _HDSQLiteBindDateToProperty();
}

uint64_t HDSQLiteBindDoubleToProperty()
{
  return _HDSQLiteBindDoubleToProperty();
}

uint64_t HDSQLiteBindFoundationValueToStatement()
{
  return _HDSQLiteBindFoundationValueToStatement();
}

uint64_t HDSQLiteBindInt64ToProperty()
{
  return _HDSQLiteBindInt64ToProperty();
}

uint64_t HDSQLiteBindNullToProperty()
{
  return _HDSQLiteBindNullToProperty();
}

uint64_t HDSQLiteBindNumberToProperty()
{
  return _HDSQLiteBindNumberToProperty();
}

uint64_t HDSQLiteBindSecureCodingObjectToProperty()
{
  return _HDSQLiteBindSecureCodingObjectToProperty();
}

uint64_t HDSQLiteBindStringToProperty()
{
  return _HDSQLiteBindStringToProperty();
}

uint64_t HDSQLiteBindUUIDToProperty()
{
  return _HDSQLiteBindUUIDToProperty();
}

uint64_t HDSQLiteColumnAsBoolean()
{
  return _HDSQLiteColumnAsBoolean();
}

uint64_t HDSQLiteColumnAsDate()
{
  return _HDSQLiteColumnAsDate();
}

uint64_t HDSQLiteColumnAsInt64()
{
  return _HDSQLiteColumnAsInt64();
}

uint64_t HDSQLiteColumnAsNumber()
{
  return _HDSQLiteColumnAsNumber();
}

uint64_t HDSQLiteColumnAsString()
{
  return _HDSQLiteColumnAsString();
}

uint64_t HDSQLiteColumnAsURL()
{
  return _HDSQLiteColumnAsURL();
}

uint64_t HDSQLiteColumnAsUUID()
{
  return _HDSQLiteColumnAsUUID();
}

uint64_t HDSQLiteColumnWithNameAsBoolean()
{
  return _HDSQLiteColumnWithNameAsBoolean();
}

uint64_t HDSQLiteColumnWithNameAsData()
{
  return _HDSQLiteColumnWithNameAsData();
}

uint64_t HDSQLiteColumnWithNameAsDate()
{
  return _HDSQLiteColumnWithNameAsDate();
}

uint64_t HDSQLiteColumnWithNameAsDouble()
{
  return _HDSQLiteColumnWithNameAsDouble();
}

uint64_t HDSQLiteColumnWithNameAsInt64()
{
  return _HDSQLiteColumnWithNameAsInt64();
}

uint64_t HDSQLiteColumnWithNameAsInteger()
{
  return _HDSQLiteColumnWithNameAsInteger();
}

uint64_t HDSQLiteColumnWithNameAsNumber()
{
  return _HDSQLiteColumnWithNameAsNumber();
}

uint64_t HDSQLiteColumnWithNameAsObject()
{
  return _HDSQLiteColumnWithNameAsObject();
}

uint64_t HDSQLiteColumnWithNameAsObjectWithClasses()
{
  return _HDSQLiteColumnWithNameAsObjectWithClasses();
}

uint64_t HDSQLiteColumnWithNameAsString()
{
  return _HDSQLiteColumnWithNameAsString();
}

uint64_t HDSQLiteColumnWithNameAsURL()
{
  return _HDSQLiteColumnWithNameAsURL();
}

uint64_t HDSQLiteColumnWithNameAsUUID()
{
  return _HDSQLiteColumnWithNameAsUUID();
}

uint64_t HDSampleEntityPredicateForDataType()
{
  return _HDSampleEntityPredicateForDataType();
}

uint64_t HDSampleEntityPredicateForDataTypes()
{
  return _HDSampleEntityPredicateForDataTypes();
}

uint64_t HDUserNotificationResponseButtonToString()
{
  return _HDUserNotificationResponseButtonToString();
}

uint64_t HKAuthorizationStatusAllowsReading()
{
  return _HKAuthorizationStatusAllowsReading();
}

uint64_t HKClinicalContentAnalyticsTriggerOptionsToString()
{
  return _HKClinicalContentAnalyticsTriggerOptionsToString();
}

uint64_t HKClinicalContentAnalyticsTriggerReasonToString()
{
  return _HKClinicalContentAnalyticsTriggerReasonToString();
}

uint64_t HKClinicalDataCollectionReasonToString()
{
  return _HKClinicalDataCollectionReasonToString();
}

uint64_t HKClinicalGatewayFeatureStatusFromString()
{
  return _HKClinicalGatewayFeatureStatusFromString();
}

uint64_t HKClinicalGatewayUnknownBaseURL()
{
  return _HKClinicalGatewayUnknownBaseURL();
}

uint64_t HKCreateConcurrentDispatchQueue()
{
  return _HKCreateConcurrentDispatchQueue();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return _HKCreateSerialDispatchQueue();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return _HKCreateSerialDispatchQueueWithQOSClass();
}

uint64_t HKCreateSerialUtilityDispatchQueue()
{
  return _HKCreateSerialUtilityDispatchQueue();
}

uint64_t HKCurrentOptInVersionOnDiskForOnBoardingBundle()
{
  return _HKCurrentOptInVersionOnDiskForOnBoardingBundle();
}

uint64_t HKDateMax()
{
  return _HKDateMax();
}

uint64_t HKDispatchAsyncOnGlobalConcurrentQueue()
{
  return _HKDispatchAsyncOnGlobalConcurrentQueue();
}

uint64_t HKFHIRResourceQueryModeIncludesFullMode()
{
  return _HKFHIRResourceQueryModeIncludesFullMode();
}

uint64_t HKFHIRServerAuthenticationPKCEAlgorithmFromNSString()
{
  return _HKFHIRServerAuthenticationPKCEAlgorithmFromNSString();
}

uint64_t HKFHIRServerAuthenticationPKCEAlgorithmIsSupported()
{
  return _HKFHIRServerAuthenticationPKCEAlgorithmIsSupported();
}

uint64_t HKHealthKitFrameworkBundle()
{
  return _HKHealthKitFrameworkBundle();
}

uint64_t HKHealthWrapDERDataFromString()
{
  return _HKHealthWrapDERDataFromString();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return _HKImproveHealthAndActivityAnalyticsAllowed();
}

uint64_t HKLogAnalytics()
{
  return _HKLogAnalytics();
}

uint64_t HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState()
{
  return _HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState();
}

uint64_t HKProviderServiceIsMinCompatibleAPIVersionSupported()
{
  return _HKProviderServiceIsMinCompatibleAPIVersionSupported();
}

uint64_t HKProviderServiceMaximumCompatibleAPIVersion()
{
  return _HKProviderServiceMaximumCompatibleAPIVersion();
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

uint64_t HKStringFromHKClinicalIngestionState()
{
  return _HKStringFromHKClinicalIngestionState();
}

uint64_t HKWithAutoreleasePool()
{
  return _HKWithAutoreleasePool();
}

uint64_t HKWithUnfairLock()
{
  return _HKWithUnfairLock();
}

uint64_t NSRequestConcreteImplementation()
{
  return _NSRequestConcreteImplementation();
}

uint64_t NSStringForSignedClinicalDataRecordSignatureStatus()
{
  return _NSStringForSignedClinicalDataRecordSignatureStatus();
}

uint64_t NSStringForSignedClinicalDataSourceType()
{
  return _NSStringForSignedClinicalDataSourceType();
}

uint64_t NSStringFromAccountStateChangeType()
{
  return _NSStringFromAccountStateChangeType();
}

uint64_t NSStringFromAttachmentStatus()
{
  return _NSStringFromAttachmentStatus();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromHDClinicalAnalyticsExtractionFailureCode()
{
  return _NSStringFromHDClinicalAnalyticsExtractionFailureCode();
}

uint64_t NSStringFromHKClinicalAccountCredentialState()
{
  return _NSStringFromHKClinicalAccountCredentialState();
}

uint64_t NSStringFromHKClinicalAccountDeletionReason()
{
  return _NSStringFromHKClinicalAccountDeletionReason();
}

uint64_t NSStringFromHKFHIRResourceQueryMode()
{
  return _NSStringFromHKFHIRResourceQueryMode();
}

uint64_t NSStringFromHKFHIRServerAuthenticationPKCEAlgorithm()
{
  return _NSStringFromHKFHIRServerAuthenticationPKCEAlgorithm();
}

uint64_t NSStringFromHKNotificationInstructionAction()
{
  return _NSStringFromHKNotificationInstructionAction();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HDSQLiteValueForNumber()
{
  return __HDSQLiteValueForNumber();
}

uint64_t _HDSQLiteValueForString()
{
  return __HDSQLiteValueForString();
}

uint64_t _HDSQLiteValueForUUID()
{
  return __HDSQLiteValueForUUID();
}

uint64_t _HKCreateActivityForCHRAPIAppSettings()
{
  return __HKCreateActivityForCHRAPIAppSettings();
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

uint64_t _HKLogDroppedError()
{
  return __HKLogDroppedError();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

id objc_msgSend_APIReminderRegistry(void *a1, const char *a2, ...)
{
  return [a1 APIReminderRegistry];
}

id objc_msgSend_Discoverability(void *a1, const char *a2, ...)
{
  return [a1 Discoverability];
}

id objc_msgSend_FHIRIdentifier(void *a1, const char *a2, ...)
{
  return [a1 FHIRIdentifier];
}

id objc_msgSend_FHIRRelease(void *a1, const char *a2, ...)
{
  return [a1 FHIRRelease];
}

id objc_msgSend_FHIRResource(void *a1, const char *a2, ...)
{
  return [a1 FHIRResource];
}

id objc_msgSend_FHIRVersion(void *a1, const char *a2, ...)
{
  return [a1 FHIRVersion];
}

id objc_msgSend_FHIRVersionString(void *a1, const char *a2, ...)
{
  return [a1 FHIRVersionString];
}

id objc_msgSend_HTTPMethod(void *a1, const char *a2, ...)
{
  return [a1 HTTPMethod];
}

id objc_msgSend_JSONObject(void *a1, const char *a2, ...)
{
  return [a1 JSONObject];
}

id objc_msgSend_PKCEAlgorithm(void *a1, const char *a2, ...)
{
  return [a1 PKCEAlgorithm];
}

id objc_msgSend_Signals(void *a1, const char *a2, ...)
{
  return [a1 Signals];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_URLSession(void *a1, const char *a2, ...)
{
  return [a1 URLSession];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__accessTokenIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _accessTokenIdentifier];
}

id objc_msgSend__addExtractionHintToStaleResources(void *a1, const char *a2, ...)
{
  return [a1 _addExtractionHintToStaleResources];
}

id objc_msgSend__allSupportedCountryCodes(void *a1, const char *a2, ...)
{
  return [a1 _allSupportedCountryCodes];
}

id objc_msgSend__checkIn(void *a1, const char *a2, ...)
{
  return [a1 _checkIn];
}

id objc_msgSend__checkInForFirstUnlockActivity(void *a1, const char *a2, ...)
{
  return [a1 _checkInForFirstUnlockActivity];
}

id objc_msgSend__clinicalAnalyticsKeyValueDomain(void *a1, const char *a2, ...)
{
  return [a1 _clinicalAnalyticsKeyValueDomain];
}

id objc_msgSend__createDefaultURLSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _createDefaultURLSessionConfiguration];
}

id objc_msgSend__createSessionIDIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createSessionIDIfNeeded];
}

id objc_msgSend__creationTimestamp(void *a1, const char *a2, ...)
{
  return [a1 _creationTimestamp];
}

id objc_msgSend__criteriaForFirstUnlockActivity(void *a1, const char *a2, ...)
{
  return [a1 _criteriaForFirstUnlockActivity];
}

id objc_msgSend__criteriaForFirstUnlockActivityCompleted(void *a1, const char *a2, ...)
{
  return [a1 _criteriaForFirstUnlockActivityCompleted];
}

id objc_msgSend__currentCodableMessageVersion(void *a1, const char *a2, ...)
{
  return [a1 _currentCodableMessageVersion];
}

id objc_msgSend__deducedClinicalAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _deducedClinicalAccountIdentifier];
}

id objc_msgSend__defaultRetryCount(void *a1, const char *a2, ...)
{
  return [a1 _defaultRetryCount];
}

id objc_msgSend__deleteSignedClinicalDataRecords(void *a1, const char *a2, ...)
{
  return [a1 _deleteSignedClinicalDataRecords];
}

id objc_msgSend__didStart(void *a1, const char *a2, ...)
{
  return [a1 _didStart];
}

id objc_msgSend__dispatchBlock(void *a1, const char *a2, ...)
{
  return [a1 _dispatchBlock];
}

id objc_msgSend__download(void *a1, const char *a2, ...)
{
  return [a1 _download];
}

id objc_msgSend__downloadAllowed(void *a1, const char *a2, ...)
{
  return [a1 _downloadAllowed];
}

id objc_msgSend__downloadableAttachmentsAwaitingDownloadPredicate(void *a1, const char *a2, ...)
{
  return [a1 _downloadableAttachmentsAwaitingDownloadPredicate];
}

id objc_msgSend__downloadableAttachmentsReadyToIndexPredicate(void *a1, const char *a2, ...)
{
  return [a1 _downloadableAttachmentsReadyToIndexPredicate];
}

id objc_msgSend__downloadableAttachmentsReadyToProcessPredicate(void *a1, const char *a2, ...)
{
  return [a1 _downloadableAttachmentsReadyToProcessPredicate];
}

id objc_msgSend__enableCHRNotificationsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _enableCHRNotificationsIfNeeded];
}

id objc_msgSend__ensureHasIngestStartDate(void *a1, const char *a2, ...)
{
  return [a1 _ensureHasIngestStartDate];
}

id objc_msgSend__ensureProtectedDataAvailable(void *a1, const char *a2, ...)
{
  return [a1 _ensureProtectedDataAvailable];
}

id objc_msgSend__fetchDeviceContextAnalytics(void *a1, const char *a2, ...)
{
  return [a1 _fetchDeviceContextAnalytics];
}

id objc_msgSend__firePendingReminderIfEligible(void *a1, const char *a2, ...)
{
  return [a1 _firePendingReminderIfEligible];
}

id objc_msgSend__handleFirstUnlock(void *a1, const char *a2, ...)
{
  return [a1 _handleFirstUnlock];
}

id objc_msgSend__healthCloudUploadDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 _healthCloudUploadDirectoryPath];
}

id objc_msgSend__ingestionAllowed(void *a1, const char *a2, ...)
{
  return [a1 _ingestionAllowed];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__isApplication(void *a1, const char *a2, ...)
{
  return [a1 _isApplication];
}

id objc_msgSend__isCHRNotifcationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isCHRNotifcationsEnabled];
}

id objc_msgSend__isClinicalSource(void *a1, const char *a2, ...)
{
  return [a1 _isClinicalSource];
}

id objc_msgSend__lastFetchAttemptFailed(void *a1, const char *a2, ...)
{
  return [a1 _lastFetchAttemptFailed];
}

id objc_msgSend__newExtractReferencesOperation(void *a1, const char *a2, ...)
{
  return [a1 _newExtractReferencesOperation];
}

id objc_msgSend__newQueue(void *a1, const char *a2, ...)
{
  return [a1 _newQueue];
}

id objc_msgSend__notifyHealthRecordsSupportedChangeObservers(void *a1, const char *a2, ...)
{
  return [a1 _notifyHealthRecordsSupportedChangeObservers];
}

id objc_msgSend__observedDataTypes(void *a1, const char *a2, ...)
{
  return [a1 _observedDataTypes];
}

id objc_msgSend__parseEndpointSchemas(void *a1, const char *a2, ...)
{
  return [a1 _parseEndpointSchemas];
}

id objc_msgSend__performPreflightChecks(void *a1, const char *a2, ...)
{
  return [a1 _performPreflightChecks];
}

id objc_msgSend__predicateForAccountsWithGateways(void *a1, const char *a2, ...)
{
  return [a1 _predicateForAccountsWithGateways];
}

id objc_msgSend__predicateForAccountsWithIssuers(void *a1, const char *a2, ...)
{
  return [a1 _predicateForAccountsWithIssuers];
}

id objc_msgSend__predicateForActiveDefaultCredentialState(void *a1, const char *a2, ...)
{
  return [a1 _predicateForActiveDefaultCredentialState];
}

id objc_msgSend__predicateForActiveNeedsRelogin(void *a1, const char *a2, ...)
{
  return [a1 _predicateForActiveNeedsRelogin];
}

id objc_msgSend__predicateForContentAnalyticMedicalRecordTypes(void *a1, const char *a2, ...)
{
  return [a1 _predicateForContentAnalyticMedicalRecordTypes];
}

id objc_msgSend__predicateForDefaultCredentialState(void *a1, const char *a2, ...)
{
  return [a1 _predicateForDefaultCredentialState];
}

id objc_msgSend__predicateForFetchable(void *a1, const char *a2, ...)
{
  return [a1 _predicateForFetchable];
}

id objc_msgSend__predicateForGatewaysWithAccounts(void *a1, const char *a2, ...)
{
  return [a1 _predicateForGatewaysWithAccounts];
}

id objc_msgSend__predicateForLegacyResourceTypes(void *a1, const char *a2, ...)
{
  return [a1 _predicateForLegacyResourceTypes];
}

id objc_msgSend__predicateForMissingCredential(void *a1, const char *a2, ...)
{
  return [a1 _predicateForMissingCredential];
}

id objc_msgSend__predicateForNeedsRelogin(void *a1, const char *a2, ...)
{
  return [a1 _predicateForNeedsRelogin];
}

id objc_msgSend__predicateForNonRemovedPublicKeyEntities(void *a1, const char *a2, ...)
{
  return [a1 _predicateForNonRemovedPublicKeyEntities];
}

id objc_msgSend__predicateForPostedReminders(void *a1, const char *a2, ...)
{
  return [a1 _predicateForPostedReminders];
}

id objc_msgSend__predicateForRemindersWithNotDeletedSources(void *a1, const char *a2, ...)
{
  return [a1 _predicateForRemindersWithNotDeletedSources];
}

id objc_msgSend__predicateForRemoteFetchEligible(void *a1, const char *a2, ...)
{
  return [a1 _predicateForRemoteFetchEligible];
}

id objc_msgSend__predicateForUnpostedReminders(void *a1, const char *a2, ...)
{
  return [a1 _predicateForUnpostedReminders];
}

id objc_msgSend__predicateForUserFetchEligible(void *a1, const char *a2, ...)
{
  return [a1 _predicateForUserFetchEligible];
}

id objc_msgSend__propertiesForCodable(void *a1, const char *a2, ...)
{
  return [a1 _propertiesForCodable];
}

id objc_msgSend__propertiesForEntity(void *a1, const char *a2, ...)
{
  return [a1 _propertiesForEntity];
}

id objc_msgSend__propertiesForModel(void *a1, const char *a2, ...)
{
  return [a1 _propertiesForModel];
}

id objc_msgSend__propertiesForModelInsert(void *a1, const char *a2, ...)
{
  return [a1 _propertiesForModelInsert];
}

id objc_msgSend__propertiesForModelUpdate(void *a1, const char *a2, ...)
{
  return [a1 _propertiesForModelUpdate];
}

id objc_msgSend__propertiesForResourceData(void *a1, const char *a2, ...)
{
  return [a1 _propertiesForResourceData];
}

id objc_msgSend__propertiesForSync(void *a1, const char *a2, ...)
{
  return [a1 _propertiesForSync];
}

id objc_msgSend__propertiesForTokenSession(void *a1, const char *a2, ...)
{
  return [a1 _propertiesForTokenSession];
}

id objc_msgSend__recordAnalyticsDescriptions(void *a1, const char *a2, ...)
{
  return [a1 _recordAnalyticsDescriptions];
}

id objc_msgSend__refreshTokenIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _refreshTokenIdentifier];
}

id objc_msgSend__registerForProfileDidBecomeReady(void *a1, const char *a2, ...)
{
  return [a1 _registerForProfileDidBecomeReady];
}

id objc_msgSend__registrationURL(void *a1, const char *a2, ...)
{
  return [a1 _registrationURL];
}

id objc_msgSend__requiredRootKeys(void *a1, const char *a2, ...)
{
  return [a1 _requiredRootKeys];
}

id objc_msgSend__runIngestionDoneOperations(void *a1, const char *a2, ...)
{
  return [a1 _runIngestionDoneOperations];
}

id objc_msgSend__scheduleTriggers(void *a1, const char *a2, ...)
{
  return [a1 _scheduleTriggers];
}

id objc_msgSend__schemaVariableBindings(void *a1, const char *a2, ...)
{
  return [a1 _schemaVariableBindings];
}

id objc_msgSend__secondsBlockedIfLastAttemptFailed(void *a1, const char *a2, ...)
{
  return [a1 _secondsBlockedIfLastAttemptFailed];
}

id objc_msgSend__secondsFetchIsBlocked(void *a1, const char *a2, ...)
{
  return [a1 _secondsFetchIsBlocked];
}

id objc_msgSend__secondsFullFetchIsBlocked(void *a1, const char *a2, ...)
{
  return [a1 _secondsFullFetchIsBlocked];
}

id objc_msgSend__serialIngestionDoneOperations(void *a1, const char *a2, ...)
{
  return [a1 _serialIngestionDoneOperations];
}

id objc_msgSend__shouldFireNotifications(void *a1, const char *a2, ...)
{
  return [a1 _shouldFireNotifications];
}

id objc_msgSend__startObservingApplicationsUninstalledNotification(void *a1, const char *a2, ...)
{
  return [a1 _startObservingApplicationsUninstalledNotification];
}

id objc_msgSend__supportedFHIRConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _supportedFHIRConfiguration];
}

id objc_msgSend__syncObjectsGenerationPredicate(void *a1, const char *a2, ...)
{
  return [a1 _syncObjectsGenerationPredicate];
}

id objc_msgSend__syncProperties(void *a1, const char *a2, ...)
{
  return [a1 _syncProperties];
}

id objc_msgSend__syncableProperties(void *a1, const char *a2, ...)
{
  return [a1 _syncableProperties];
}

id objc_msgSend__unregisterDataObservation(void *a1, const char *a2, ...)
{
  return [a1 _unregisterDataObservation];
}

id objc_msgSend__uploadURL(void *a1, const char *a2, ...)
{
  return [a1 _uploadURL];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_acceptedVersionForImproveHealthRecords(void *a1, const char *a2, ...)
{
  return [a1 acceptedVersionForImproveHealthRecords];
}

id objc_msgSend_accessToken(void *a1, const char *a2, ...)
{
  return [a1 accessToken];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountContext(void *a1, const char *a2, ...)
{
  return [a1 accountContext];
}

id objc_msgSend_accountFetchable(void *a1, const char *a2, ...)
{
  return [a1 accountFetchable];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_accountInformation(void *a1, const char *a2, ...)
{
  return [a1 accountInformation];
}

id objc_msgSend_accountManager(void *a1, const char *a2, ...)
{
  return [a1 accountManager];
}

id objc_msgSend_accountMustLimitRequests(void *a1, const char *a2, ...)
{
  return [a1 accountMustLimitRequests];
}

id objc_msgSend_accountSyncIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountSyncIdentifier];
}

id objc_msgSend_accountsNeedExtractionSQL(void *a1, const char *a2, ...)
{
  return [a1 accountsNeedExtractionSQL];
}

id objc_msgSend_accumulatedErrors(void *a1, const char *a2, ...)
{
  return [a1 accumulatedErrors];
}

id objc_msgSend_added(void *a1, const char *a2, ...)
{
  return [a1 added];
}

id objc_msgSend_allColumns(void *a1, const char *a2, ...)
{
  return [a1 allColumns];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allProfileIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allProfileIdentifiers];
}

id objc_msgSend_allProperties(void *a1, const char *a2, ...)
{
  return [a1 allProperties];
}

id objc_msgSend_allSupportedCountryCodes(void *a1, const char *a2, ...)
{
  return [a1 allSupportedCountryCodes];
}

id objc_msgSend_allTypes(void *a1, const char *a2, ...)
{
  return [a1 allTypes];
}

id objc_msgSend_allUnits(void *a1, const char *a2, ...)
{
  return [a1 allUnits];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allergyRecordType(void *a1, const char *a2, ...)
{
  return [a1 allergyRecordType];
}

id objc_msgSend_analyticsManager(void *a1, const char *a2, ...)
{
  return [a1 analyticsManager];
}

id objc_msgSend_analyticsString(void *a1, const char *a2, ...)
{
  return [a1 analyticsString];
}

id objc_msgSend_analyticsSubmissionCoordinator(void *a1, const char *a2, ...)
{
  return [a1 analyticsSubmissionCoordinator];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asOriginalSignedClinicalDataRecord(void *a1, const char *a2, ...)
{
  return [a1 asOriginalSignedClinicalDataRecord];
}

id objc_msgSend_asTombstone(void *a1, const char *a2, ...)
{
  return [a1 asTombstone];
}

id objc_msgSend_assembleEndStates(void *a1, const char *a2, ...)
{
  return [a1 assembleEndStates];
}

id objc_msgSend_atLeastOneFetchSucceeded(void *a1, const char *a2, ...)
{
  return [a1 atLeastOneFetchSucceeded];
}

id objc_msgSend_attachment(void *a1, const char *a2, ...)
{
  return [a1 attachment];
}

id objc_msgSend_attachmentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 attachmentIdentifier];
}

id objc_msgSend_attachmentIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 attachmentIdentifiers];
}

id objc_msgSend_attachmentManager(void *a1, const char *a2, ...)
{
  return [a1 attachmentManager];
}

id objc_msgSend_attachmentObjectIdentifier(void *a1, const char *a2, ...)
{
  return [a1 attachmentObjectIdentifier];
}

id objc_msgSend_attachmentSchemaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 attachmentSchemaIdentifier];
}

id objc_msgSend_authResponse(void *a1, const char *a2, ...)
{
  return [a1 authResponse];
}

id objc_msgSend_authSchemaDefinitions(void *a1, const char *a2, ...)
{
  return [a1 authSchemaDefinitions];
}

id objc_msgSend_authSchemas(void *a1, const char *a2, ...)
{
  return [a1 authSchemas];
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

id objc_msgSend_authorizationEndpointType(void *a1, const char *a2, ...)
{
  return [a1 authorizationEndpointType];
}

id objc_msgSend_authorizationKey(void *a1, const char *a2, ...)
{
  return [a1 authorizationKey];
}

id objc_msgSend_authorizationOracle(void *a1, const char *a2, ...)
{
  return [a1 authorizationOracle];
}

id objc_msgSend_authorizationSchemas(void *a1, const char *a2, ...)
{
  return [a1 authorizationSchemas];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_baseAnalyticKey(void *a1, const char *a2, ...)
{
  return [a1 baseAnalyticKey];
}

id objc_msgSend_baseSearchURL(void *a1, const char *a2, ...)
{
  return [a1 baseSearchURL];
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return [a1 baseURL];
}

id objc_msgSend_batchCount(void *a1, const char *a2, ...)
{
  return [a1 batchCount];
}

id objc_msgSend_batchID(void *a1, const char *a2, ...)
{
  return [a1 batchID];
}

id objc_msgSend_batchSize(void *a1, const char *a2, ...)
{
  return [a1 batchSize];
}

id objc_msgSend_behavior(void *a1, const char *a2, ...)
{
  return [a1 behavior];
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

id objc_msgSend_brand(void *a1, const char *a2, ...)
{
  return [a1 brand];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_caller(void *a1, const char *a2, ...)
{
  return [a1 caller];
}

id objc_msgSend_canDetectUnmergeFromPatientResource(void *a1, const char *a2, ...)
{
  return [a1 canDetectUnmergeFromPatientResource];
}

id objc_msgSend_canRead(void *a1, const char *a2, ...)
{
  return [a1 canRead];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllIngestionTasks(void *a1, const char *a2, ...)
{
  return [a1 cancelAllIngestionTasks];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_categoryIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifiers];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return [a1 clientID];
}

id objc_msgSend_clientSecret(void *a1, const char *a2, ...)
{
  return [a1 clientSecret];
}

id objc_msgSend_clinicalExternalID(void *a1, const char *a2, ...)
{
  return [a1 clinicalExternalID];
}

id objc_msgSend_clinicalRecord(void *a1, const char *a2, ...)
{
  return [a1 clinicalRecord];
}

id objc_msgSend_clinicalRecordIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clinicalRecordIdentifier];
}

id objc_msgSend_clinicalRecords(void *a1, const char *a2, ...)
{
  return [a1 clinicalRecords];
}

id objc_msgSend_clinicalSharingFirstSharedDate(void *a1, const char *a2, ...)
{
  return [a1 clinicalSharingFirstSharedDate];
}

id objc_msgSend_clinicalSharingGatewayFeature(void *a1, const char *a2, ...)
{
  return [a1 clinicalSharingGatewayFeature];
}

id objc_msgSend_clinicalSharingLastSharedDate(void *a1, const char *a2, ...)
{
  return [a1 clinicalSharingLastSharedDate];
}

id objc_msgSend_clinicalSharingManager(void *a1, const char *a2, ...)
{
  return [a1 clinicalSharingManager];
}

id objc_msgSend_clinicalSharingPrimaryDeviceName(void *a1, const char *a2, ...)
{
  return [a1 clinicalSharingPrimaryDeviceName];
}

id objc_msgSend_clinicalSharingStatus(void *a1, const char *a2, ...)
{
  return [a1 clinicalSharingStatus];
}

id objc_msgSend_clinicalSharingStatusForNewAccountFromSync(void *a1, const char *a2, ...)
{
  return [a1 clinicalSharingStatusForNewAccountFromSync];
}

id objc_msgSend_clinicalSharingUserStatus(void *a1, const char *a2, ...)
{
  return [a1 clinicalSharingUserStatus];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_cloudSyncManager(void *a1, const char *a2, ...)
{
  return [a1 cloudSyncManager];
}

id objc_msgSend_codableAccounts(void *a1, const char *a2, ...)
{
  return [a1 codableAccounts];
}

id objc_msgSend_codableDeletedAccounts(void *a1, const char *a2, ...)
{
  return [a1 codableDeletedAccounts];
}

id objc_msgSend_codableResources(void *a1, const char *a2, ...)
{
  return [a1 codableResources];
}

id objc_msgSend_codableSyncIdentity(void *a1, const char *a2, ...)
{
  return [a1 codableSyncIdentity];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return [a1 collectionType];
}

id objc_msgSend_compatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 compatibilityVersion];
}

id objc_msgSend_completeResources(void *a1, const char *a2, ...)
{
  return [a1 completeResources];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_conditionRecordType(void *a1, const char *a2, ...)
{
  return [a1 conditionRecordType];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_consumeRefreshResult(void *a1, const char *a2, ...)
{
  return [a1 consumeRefreshResult];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentProtectionManager(void *a1, const char *a2, ...)
{
  return [a1 contentProtectionManager];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_contextForWritingProtectedData(void *a1, const char *a2, ...)
{
  return [a1 contextForWritingProtectedData];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countOfAllLabs(void *a1, const char *a2, ...)
{
  return [a1 countOfAllLabs];
}

id objc_msgSend_countOfAllRecords(void *a1, const char *a2, ...)
{
  return [a1 countOfAllRecords];
}

id objc_msgSend_countOfExtractedResources(void *a1, const char *a2, ...)
{
  return [a1 countOfExtractedResources];
}

id objc_msgSend_countOfPinnedLabs(void *a1, const char *a2, ...)
{
  return [a1 countOfPinnedLabs];
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return [a1 country];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_createClinicalAnalyticsManager(void *a1, const char *a2, ...)
{
  return [a1 createClinicalAnalyticsManager];
}

id objc_msgSend_createClinicalSharingClient(void *a1, const char *a2, ...)
{
  return [a1 createClinicalSharingClient];
}

id objc_msgSend_createClinicalSharingManager(void *a1, const char *a2, ...)
{
  return [a1 createClinicalSharingManager];
}

id objc_msgSend_createDownloadableAttachmentManager(void *a1, const char *a2, ...)
{
  return [a1 createDownloadableAttachmentManager];
}

id objc_msgSend_createFakeBrandForTestAccounts(void *a1, const char *a2, ...)
{
  return [a1 createFakeBrandForTestAccounts];
}

id objc_msgSend_createHealthRecordsAPIReminderRegistry(void *a1, const char *a2, ...)
{
  return [a1 createHealthRecordsAPIReminderRegistry];
}

id objc_msgSend_createHealthRecordsClinicalAccountManager(void *a1, const char *a2, ...)
{
  return [a1 createHealthRecordsClinicalAccountManager];
}

id objc_msgSend_createHealthRecordsIngestionServiceClient(void *a1, const char *a2, ...)
{
  return [a1 createHealthRecordsIngestionServiceClient];
}

id objc_msgSend_createHealthRecordsLegacyIngestionServiceClient(void *a1, const char *a2, ...)
{
  return [a1 createHealthRecordsLegacyIngestionServiceClient];
}

id objc_msgSend_createHealthRecordsXPCServiceClient(void *a1, const char *a2, ...)
{
  return [a1 createHealthRecordsXPCServiceClient];
}

id objc_msgSend_createOptInStudy(void *a1, const char *a2, ...)
{
  return [a1 createOptInStudy];
}

id objc_msgSend_createProviderServiceManager(void *a1, const char *a2, ...)
{
  return [a1 createProviderServiceManager];
}

id objc_msgSend_createSignedClinicalDataManager(void *a1, const char *a2, ...)
{
  return [a1 createSignedClinicalDataManager];
}

id objc_msgSend_createSignedClinicalDataRegistry(void *a1, const char *a2, ...)
{
  return [a1 createSignedClinicalDataRegistry];
}

id objc_msgSend_createTableSQL(void *a1, const char *a2, ...)
{
  return [a1 createTableSQL];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
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

id objc_msgSend_credentialState(void *a1, const char *a2, ...)
{
  return [a1 credentialState];
}

id objc_msgSend_credentialStateAfter(void *a1, const char *a2, ...)
{
  return [a1 credentialStateAfter];
}

id objc_msgSend_credentialStateBefore(void *a1, const char *a2, ...)
{
  return [a1 credentialStateBefore];
}

id objc_msgSend_credentialTypes(void *a1, const char *a2, ...)
{
  return [a1 credentialTypes];
}

id objc_msgSend_credentialVendor(void *a1, const char *a2, ...)
{
  return [a1 credentialVendor];
}

id objc_msgSend_credentialedSession(void *a1, const char *a2, ...)
{
  return [a1 credentialedSession];
}

id objc_msgSend_currentAnalyticsAccumulator(void *a1, const char *a2, ...)
{
  return [a1 currentAnalyticsAccumulator];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentCredentialHasOutdatedScopes(void *a1, const char *a2, ...)
{
  return [a1 currentCredentialHasOutdatedScopes];
}

id objc_msgSend_currentCredentialScopeSet(void *a1, const char *a2, ...)
{
  return [a1 currentCredentialScopeSet];
}

id objc_msgSend_currentDeviceSupportsImproveHealthRecordsDataSubmissionOption(void *a1, const char *a2, ...)
{
  return [a1 currentDeviceSupportsImproveHealthRecordsDataSubmissionOption];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentIngestionState(void *a1, const char *a2, ...)
{
  return [a1 currentIngestionState];
}

id objc_msgSend_currentOSBuild(void *a1, const char *a2, ...)
{
  return [a1 currentOSBuild];
}

id objc_msgSend_currentOSVersionStruct(void *a1, const char *a2, ...)
{
  return [a1 currentOSVersionStruct];
}

id objc_msgSend_currentResult(void *a1, const char *a2, ...)
{
  return [a1 currentResult];
}

id objc_msgSend_currentSchemaVersion(void *a1, const char *a2, ...)
{
  return [a1 currentSchemaVersion];
}

id objc_msgSend_currentServiceEnvironment(void *a1, const char *a2, ...)
{
  return [a1 currentServiceEnvironment];
}

id objc_msgSend_currentSubjectID(void *a1, const char *a2, ...)
{
  return [a1 currentSubjectID];
}

id objc_msgSend_currentSyncIdentity(void *a1, const char *a2, ...)
{
  return [a1 currentSyncIdentity];
}

id objc_msgSend_currentSyncIdentityPersistentID(void *a1, const char *a2, ...)
{
  return [a1 currentSyncIdentityPersistentID];
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return [a1 daemon];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataManager(void *a1, const char *a2, ...)
{
  return [a1 dataManager];
}

id objc_msgSend_dataObjectClass(void *a1, const char *a2, ...)
{
  return [a1 dataObjectClass];
}

id objc_msgSend_dataProvenanceManager(void *a1, const char *a2, ...)
{
  return [a1 dataProvenanceManager];
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return [a1 database];
}

id objc_msgSend_databaseEntities(void *a1, const char *a2, ...)
{
  return [a1 databaseEntities];
}

id objc_msgSend_databaseResource(void *a1, const char *a2, ...)
{
  return [a1 databaseResource];
}

id objc_msgSend_databaseSchemaVersionInBuild(void *a1, const char *a2, ...)
{
  return [a1 databaseSchemaVersionInBuild];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultForeignKey(void *a1, const char *a2, ...)
{
  return [a1 defaultForeignKey];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deferralPeriod(void *a1, const char *a2, ...)
{
  return [a1 deferralPeriod];
}

id objc_msgSend_definition(void *a1, const char *a2, ...)
{
  return [a1 definition];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleted(void *a1, const char *a2, ...)
{
  return [a1 deleted];
}

id objc_msgSend_deletionDate(void *a1, const char *a2, ...)
{
  return [a1 deletionDate];
}

id objc_msgSend_deletionReason(void *a1, const char *a2, ...)
{
  return [a1 deletionReason];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptionForAccountEvent(void *a1, const char *a2, ...)
{
  return [a1 descriptionForAccountEvent];
}

id objc_msgSend_deviceContextManager(void *a1, const char *a2, ...)
{
  return [a1 deviceContextManager];
}

id objc_msgSend_diagnosticTestReportType(void *a1, const char *a2, ...)
{
  return [a1 diagnosticTestReportType];
}

id objc_msgSend_diagnosticTestResultType(void *a1, const char *a2, ...)
{
  return [a1 diagnosticTestResultType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didReceiveFHIRResourceSyncEntities(void *a1, const char *a2, ...)
{
  return [a1 didReceiveFHIRResourceSyncEntities];
}

id objc_msgSend_didReceiveOriginalSignedClinicalDataRecordSyncEntities(void *a1, const char *a2, ...)
{
  return [a1 didReceiveOriginalSignedClinicalDataRecordSyncEntities];
}

id objc_msgSend_didSucceed(void *a1, const char *a2, ...)
{
  return [a1 didSucceed];
}

id objc_msgSend_didUpdateGatewaysFromProviderService(void *a1, const char *a2, ...)
{
  return [a1 didUpdateGatewaysFromProviderService];
}

id objc_msgSend_directoryPath(void *a1, const char *a2, ...)
{
  return [a1 directoryPath];
}

id objc_msgSend_disambiguatedDatabaseTable(void *a1, const char *a2, ...)
{
  return [a1 disambiguatedDatabaseTable];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayableDescription(void *a1, const char *a2, ...)
{
  return [a1 displayableDescription];
}

id objc_msgSend_displayedAlertHandler(void *a1, const char *a2, ...)
{
  return [a1 displayedAlertHandler];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_document(void *a1, const char *a2, ...)
{
  return [a1 document];
}

id objc_msgSend_documentData(void *a1, const char *a2, ...)
{
  return [a1 documentData];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadableAttachmentManager(void *a1, const char *a2, ...)
{
  return [a1 downloadableAttachmentManager];
}

id objc_msgSend_downloadableAttachments(void *a1, const char *a2, ...)
{
  return [a1 downloadableAttachments];
}

id objc_msgSend_downloadableAttachmentsDirectory(void *a1, const char *a2, ...)
{
  return [a1 downloadableAttachmentsDirectory];
}

id objc_msgSend_droppedReminderHandler(void *a1, const char *a2, ...)
{
  return [a1 droppedReminderHandler];
}

id objc_msgSend_effectiveRequestURL(void *a1, const char *a2, ...)
{
  return [a1 effectiveRequestURL];
}

id objc_msgSend_electrocardiogramType(void *a1, const char *a2, ...)
{
  return [a1 electrocardiogramType];
}

id objc_msgSend_emetConfiguration(void *a1, const char *a2, ...)
{
  return [a1 emetConfiguration];
}

id objc_msgSend_enableDataCollection(void *a1, const char *a2, ...)
{
  return [a1 enableDataCollection];
}

id objc_msgSend_encodedByteCount(void *a1, const char *a2, ...)
{
  return [a1 encodedByteCount];
}

id objc_msgSend_endStates(void *a1, const char *a2, ...)
{
  return [a1 endStates];
}

id objc_msgSend_enteredInError(void *a1, const char *a2, ...)
{
  return [a1 enteredInError];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return [a1 entity];
}

id objc_msgSend_entityVersion(void *a1, const char *a2, ...)
{
  return [a1 entityVersion];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorStatus(void *a1, const char *a2, ...)
{
  return [a1 errorStatus];
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return [a1 event];
}

id objc_msgSend_eventDescription(void *a1, const char *a2, ...)
{
  return [a1 eventDescription];
}

id objc_msgSend_eventLoggingDescription(void *a1, const char *a2, ...)
{
  return [a1 eventLoggingDescription];
}

id objc_msgSend_eventName(void *a1, const char *a2, ...)
{
  return [a1 eventName];
}

id objc_msgSend_existingRowID(void *a1, const char *a2, ...)
{
  return [a1 existingRowID];
}

id objc_msgSend_expectedHash(void *a1, const char *a2, ...)
{
  return [a1 expectedHash];
}

id objc_msgSend_expectedRulesVersion(void *a1, const char *a2, ...)
{
  return [a1 expectedRulesVersion];
}

id objc_msgSend_expiration(void *a1, const char *a2, ...)
{
  return [a1 expiration];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_externalID(void *a1, const char *a2, ...)
{
  return [a1 externalID];
}

id objc_msgSend_externalIDs(void *a1, const char *a2, ...)
{
  return [a1 externalIDs];
}

id objc_msgSend_extractionError(void *a1, const char *a2, ...)
{
  return [a1 extractionError];
}

id objc_msgSend_extractionHints(void *a1, const char *a2, ...)
{
  return [a1 extractionHints];
}

id objc_msgSend_extractionResult(void *a1, const char *a2, ...)
{
  return [a1 extractionResult];
}

id objc_msgSend_extractionRulesVersion(void *a1, const char *a2, ...)
{
  return [a1 extractionRulesVersion];
}

id objc_msgSend_extractionServiceClientCreateIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 extractionServiceClientCreateIfNecessary];
}

id objc_msgSend_extractionVersion(void *a1, const char *a2, ...)
{
  return [a1 extractionVersion];
}

id objc_msgSend_failedFetchAttemptsCount(void *a1, const char *a2, ...)
{
  return [a1 failedFetchAttemptsCount];
}

id objc_msgSend_failureCode(void *a1, const char *a2, ...)
{
  return [a1 failureCode];
}

id objc_msgSend_failureRecords(void *a1, const char *a2, ...)
{
  return [a1 failureRecords];
}

id objc_msgSend_fallbackDisplayString(void *a1, const char *a2, ...)
{
  return [a1 fallbackDisplayString];
}

id objc_msgSend_feature(void *a1, const char *a2, ...)
{
  return [a1 feature];
}

id objc_msgSend_featureDefinitions(void *a1, const char *a2, ...)
{
  return [a1 featureDefinitions];
}

id objc_msgSend_featureName(void *a1, const char *a2, ...)
{
  return [a1 featureName];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_fetchError(void *a1, const char *a2, ...)
{
  return [a1 fetchError];
}

id objc_msgSend_fetchGroup(void *a1, const char *a2, ...)
{
  return [a1 fetchGroup];
}

id objc_msgSend_fetchSuccess(void *a1, const char *a2, ...)
{
  return [a1 fetchSuccess];
}

id objc_msgSend_fetchedData(void *a1, const char *a2, ...)
{
  return [a1 fetchedData];
}

id objc_msgSend_fhirIdentifier(void *a1, const char *a2, ...)
{
  return [a1 fhirIdentifier];
}

id objc_msgSend_fhirVersion(void *a1, const char *a2, ...)
{
  return [a1 fhirVersion];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_finishedProcessingReminderHandler(void *a1, const char *a2, ...)
{
  return [a1 finishedProcessingReminderHandler];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstSeenDate(void *a1, const char *a2, ...)
{
  return [a1 firstSeenDate];
}

id objc_msgSend_firstSeenDateTimeZoneName(void *a1, const char *a2, ...)
{
  return [a1 firstSeenDateTimeZoneName];
}

id objc_msgSend_firstSharedDate(void *a1, const char *a2, ...)
{
  return [a1 firstSharedDate];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return [a1 flags];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_followUpWorkItems(void *a1, const char *a2, ...)
{
  return [a1 followUpWorkItems];
}

id objc_msgSend_fullRequestURL(void *a1, const char *a2, ...)
{
  return [a1 fullRequestURL];
}

id objc_msgSend_futureMigrationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 futureMigrationsEnabled];
}

id objc_msgSend_gateway(void *a1, const char *a2, ...)
{
  return [a1 gateway];
}

id objc_msgSend_gatewayExternalID(void *a1, const char *a2, ...)
{
  return [a1 gatewayExternalID];
}

id objc_msgSend_gatewayVersions(void *a1, const char *a2, ...)
{
  return [a1 gatewayVersions];
}

id objc_msgSend_getChangesCount(void *a1, const char *a2, ...)
{
  return [a1 getChangesCount];
}

id objc_msgSend_handledApplicationsUninstalled(void *a1, const char *a2, ...)
{
  return [a1 handledApplicationsUninstalled];
}

id objc_msgSend_handledApplicationsUninstalledHandler(void *a1, const char *a2, ...)
{
  return [a1 handledApplicationsUninstalledHandler];
}

id objc_msgSend_hasAtLeastOneResourceTypeScope(void *a1, const char *a2, ...)
{
  return [a1 hasAtLeastOneResourceTypeScope];
}

id objc_msgSend_hasClinicalSharingFirstSharedDate(void *a1, const char *a2, ...)
{
  return [a1 hasClinicalSharingFirstSharedDate];
}

id objc_msgSend_hasClinicalSharingLastSharedDate(void *a1, const char *a2, ...)
{
  return [a1 hasClinicalSharingLastSharedDate];
}

id objc_msgSend_hasClinicalSharingScopes(void *a1, const char *a2, ...)
{
  return [a1 hasClinicalSharingScopes];
}

id objc_msgSend_hasCreationDate(void *a1, const char *a2, ...)
{
  return [a1 hasCreationDate];
}

id objc_msgSend_hasDeleted(void *a1, const char *a2, ...)
{
  return [a1 hasDeleted];
}

id objc_msgSend_hasDeletionDate(void *a1, const char *a2, ...)
{
  return [a1 hasDeletionDate];
}

id objc_msgSend_hasDeletionReason(void *a1, const char *a2, ...)
{
  return [a1 hasDeletionReason];
}

id objc_msgSend_hasExpirationDate(void *a1, const char *a2, ...)
{
  return [a1 hasExpirationDate];
}

id objc_msgSend_hasFailedFetchAttemptsCount(void *a1, const char *a2, ...)
{
  return [a1 hasFailedFetchAttemptsCount];
}

id objc_msgSend_hasFirstSeenDate(void *a1, const char *a2, ...)
{
  return [a1 hasFirstSeenDate];
}

id objc_msgSend_hasFirstSeenDateTimeZoneName(void *a1, const char *a2, ...)
{
  return [a1 hasFirstSeenDateTimeZoneName];
}

id objc_msgSend_hasGatewayExternalID(void *a1, const char *a2, ...)
{
  return [a1 hasGatewayExternalID];
}

id objc_msgSend_hasIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasIdentifier];
}

id objc_msgSend_hasLastFailedFetchDate(void *a1, const char *a2, ...)
{
  return [a1 hasLastFailedFetchDate];
}

id objc_msgSend_hasLastFetchDate(void *a1, const char *a2, ...)
{
  return [a1 hasLastFetchDate];
}

id objc_msgSend_hasLastFullFetchDate(void *a1, const char *a2, ...)
{
  return [a1 hasLastFullFetchDate];
}

id objc_msgSend_hasLastModifiedDate(void *a1, const char *a2, ...)
{
  return [a1 hasLastModifiedDate];
}

id objc_msgSend_hasMessageVersion(void *a1, const char *a2, ...)
{
  return [a1 hasMessageVersion];
}

id objc_msgSend_hasModificationDate(void *a1, const char *a2, ...)
{
  return [a1 hasModificationDate];
}

id objc_msgSend_hasNewRecords(void *a1, const char *a2, ...)
{
  return [a1 hasNewRecords];
}

id objc_msgSend_hasOriginVersionBuild(void *a1, const char *a2, ...)
{
  return [a1 hasOriginVersionBuild];
}

id objc_msgSend_hasOriginVersionMajor(void *a1, const char *a2, ...)
{
  return [a1 hasOriginVersionMajor];
}

id objc_msgSend_hasOriginVersionMinor(void *a1, const char *a2, ...)
{
  return [a1 hasOriginVersionMinor];
}

id objc_msgSend_hasOriginVersionPatch(void *a1, const char *a2, ...)
{
  return [a1 hasOriginVersionPatch];
}

id objc_msgSend_hasPatientHash(void *a1, const char *a2, ...)
{
  return [a1 hasPatientHash];
}

id objc_msgSend_hasRawContent(void *a1, const char *a2, ...)
{
  return [a1 hasRawContent];
}

id objc_msgSend_hasReceivedDate(void *a1, const char *a2, ...)
{
  return [a1 hasReceivedDate];
}

id objc_msgSend_hasReceivedDateTimeZoneName(void *a1, const char *a2, ...)
{
  return [a1 hasReceivedDateTimeZoneName];
}

id objc_msgSend_hasScopeString(void *a1, const char *a2, ...)
{
  return [a1 hasScopeString];
}

id objc_msgSend_hasSignatureStatus(void *a1, const char *a2, ...)
{
  return [a1 hasSignatureStatus];
}

id objc_msgSend_hasSignedClinicalDataIssuerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasSignedClinicalDataIssuerIdentifier];
}

id objc_msgSend_hasSourceType(void *a1, const char *a2, ...)
{
  return [a1 hasSourceType];
}

id objc_msgSend_hasSyncIdentity(void *a1, const char *a2, ...)
{
  return [a1 hasSyncIdentity];
}

id objc_msgSend_hasTitle(void *a1, const char *a2, ...)
{
  return [a1 hasTitle];
}

id objc_msgSend_hasUniquenessChecksum(void *a1, const char *a2, ...)
{
  return [a1 hasUniquenessChecksum];
}

id objc_msgSend_hasUserEnabled(void *a1, const char *a2, ...)
{
  return [a1 hasUserEnabled];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_headerParameters(void *a1, const char *a2, ...)
{
  return [a1 headerParameters];
}

id objc_msgSend_healthAppHiddenOrNotInstalled(void *a1, const char *a2, ...)
{
  return [a1 healthAppHiddenOrNotInstalled];
}

id objc_msgSend_healthAppNotInstalled(void *a1, const char *a2, ...)
{
  return [a1 healthAppNotInstalled];
}

id objc_msgSend_healthCloudDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 healthCloudDirectoryPath];
}

id objc_msgSend_healthDaemon(void *a1, const char *a2, ...)
{
  return [a1 healthDaemon];
}

id objc_msgSend_healthDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 healthDirectoryURL];
}

id objc_msgSend_healthRecordsDaemonExtension(void *a1, const char *a2, ...)
{
  return [a1 healthRecordsDaemonExtension];
}

id objc_msgSend_healthRecordsExtension(void *a1, const char *a2, ...)
{
  return [a1 healthRecordsExtension];
}

id objc_msgSend_healthRecordsIngestionServiceClient(void *a1, const char *a2, ...)
{
  return [a1 healthRecordsIngestionServiceClient];
}

id objc_msgSend_healthRecordsServiceClient(void *a1, const char *a2, ...)
{
  return [a1 healthRecordsServiceClient];
}

id objc_msgSend_healthWrapConfiguration(void *a1, const char *a2, ...)
{
  return [a1 healthWrapConfiguration];
}

id objc_msgSend_highestRowID(void *a1, const char *a2, ...)
{
  return [a1 highestRowID];
}

id objc_msgSend_hkAccount(void *a1, const char *a2, ...)
{
  return [a1 hkAccount];
}

id objc_msgSend_hkAttachment(void *a1, const char *a2, ...)
{
  return [a1 hkAttachment];
}

id objc_msgSend_hkClinicalAccountProvenance(void *a1, const char *a2, ...)
{
  return [a1 hkClinicalAccountProvenance];
}

id objc_msgSend_hkGateway(void *a1, const char *a2, ...)
{
  return [a1 hkGateway];
}

id objc_msgSend_hkState(void *a1, const char *a2, ...)
{
  return [a1 hkState];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return [a1 hostname];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_importer(void *a1, const char *a2, ...)
{
  return [a1 importer];
}

id objc_msgSend_improveHealthRecordsGatedAnalyticsEnabledCountryCodes(void *a1, const char *a2, ...)
{
  return [a1 improveHealthRecordsGatedAnalyticsEnabledCountryCodes];
}

id objc_msgSend_incompleteResources(void *a1, const char *a2, ...)
{
  return [a1 incompleteResources];
}

id objc_msgSend_incrementBatchCount(void *a1, const char *a2, ...)
{
  return [a1 incrementBatchCount];
}

id objc_msgSend_informationURL(void *a1, const char *a2, ...)
{
  return [a1 informationURL];
}

id objc_msgSend_ingestQueue(void *a1, const char *a2, ...)
{
  return [a1 ingestQueue];
}

id objc_msgSend_ingestStartDate(void *a1, const char *a2, ...)
{
  return [a1 ingestStartDate];
}

id objc_msgSend_ingestedOnLocalDevice(void *a1, const char *a2, ...)
{
  return [a1 ingestedOnLocalDevice];
}

id objc_msgSend_ingestionManager(void *a1, const char *a2, ...)
{
  return [a1 ingestionManager];
}

id objc_msgSend_initialWorkItem(void *a1, const char *a2, ...)
{
  return [a1 initialWorkItem];
}

id objc_msgSend_inlineData(void *a1, const char *a2, ...)
{
  return [a1 inlineData];
}

id objc_msgSend_inlineDataChecksum(void *a1, const char *a2, ...)
{
  return [a1 inlineDataChecksum];
}

id objc_msgSend_inputFileHandle(void *a1, const char *a2, ...)
{
  return [a1 inputFileHandle];
}

id objc_msgSend_inputStreams(void *a1, const char *a2, ...)
{
  return [a1 inputStreams];
}

id objc_msgSend_inspectableValue(void *a1, const char *a2, ...)
{
  return [a1 inspectableValue];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
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

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isAppleInternalInstall];
}

id objc_msgSend_isAuthorizationDetermined(void *a1, const char *a2, ...)
{
  return [a1 isAuthorizationDetermined];
}

id objc_msgSend_isAutomaticAppUpdatesAllowed(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticAppUpdatesAllowed];
}

id objc_msgSend_isBackgroundTask(void *a1, const char *a2, ...)
{
  return [a1 isBackgroundTask];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isClinicalNoteRecord(void *a1, const char *a2, ...)
{
  return [a1 isClinicalNoteRecord];
}

id objc_msgSend_isDiagnosticSubmissionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isDiagnosticSubmissionAllowed];
}

id objc_msgSend_isDocumentReference(void *a1, const char *a2, ...)
{
  return [a1 isDocumentReference];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isExpired(void *a1, const char *a2, ...)
{
  return [a1 isExpired];
}

id objc_msgSend_isFakeBrandForTestAccounts(void *a1, const char *a2, ...)
{
  return [a1 isFakeBrandForTestAccounts];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isHealthDataSubmissionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isHealthDataSubmissionAllowed];
}

id objc_msgSend_isImproveHealthRecordsDataSubmissionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isImproveHealthRecordsDataSubmissionAllowed];
}

id objc_msgSend_isInvalidated(void *a1, const char *a2, ...)
{
  return [a1 isInvalidated];
}

id objc_msgSend_isProtectedDataAvailable(void *a1, const char *a2, ...)
{
  return [a1 isProtectedDataAvailable];
}

id objc_msgSend_isRealityDevice(void *a1, const char *a2, ...)
{
  return [a1 isRealityDevice];
}

id objc_msgSend_isRunningStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningStoreDemoMode];
}

id objc_msgSend_isUserEnabled(void *a1, const char *a2, ...)
{
  return [a1 isUserEnabled];
}

id objc_msgSend_issuerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 issuerIdentifier];
}

id objc_msgSend_issuers(void *a1, const char *a2, ...)
{
  return [a1 issuers];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_jwk(void *a1, const char *a2, ...)
{
  return [a1 jwk];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return [a1 keyPath];
}

id objc_msgSend_kid(void *a1, const char *a2, ...)
{
  return [a1 kid];
}

id objc_msgSend_languageAndRegionQueryParameter(void *a1, const char *a2, ...)
{
  return [a1 languageAndRegionQueryParameter];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return [a1 lastError];
}

id objc_msgSend_lastExtractedRowID(void *a1, const char *a2, ...)
{
  return [a1 lastExtractedRowID];
}

id objc_msgSend_lastExtractedRulesVersion(void *a1, const char *a2, ...)
{
  return [a1 lastExtractedRulesVersion];
}

id objc_msgSend_lastFailedFetchDate(void *a1, const char *a2, ...)
{
  return [a1 lastFailedFetchDate];
}

id objc_msgSend_lastFetchDate(void *a1, const char *a2, ...)
{
  return [a1 lastFetchDate];
}

id objc_msgSend_lastFullFetchDate(void *a1, const char *a2, ...)
{
  return [a1 lastFullFetchDate];
}

id objc_msgSend_lastInsertRowID(void *a1, const char *a2, ...)
{
  return [a1 lastInsertRowID];
}

id objc_msgSend_lastModifiedDate(void *a1, const char *a2, ...)
{
  return [a1 lastModifiedDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastReportedStatus(void *a1, const char *a2, ...)
{
  return [a1 lastReportedStatus];
}

id objc_msgSend_lastSharedDate(void *a1, const char *a2, ...)
{
  return [a1 lastSharedDate];
}

id objc_msgSend_lastSubmittedRowID(void *a1, const char *a2, ...)
{
  return [a1 lastSubmittedRowID];
}

id objc_msgSend_lastUpdatedDate(void *a1, const char *a2, ...)
{
  return [a1 lastUpdatedDate];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_launchedClinicalSourceSettingsHandler(void *a1, const char *a2, ...)
{
  return [a1 launchedClinicalSourceSettingsHandler];
}

id objc_msgSend_legacySyncIdentity(void *a1, const char *a2, ...)
{
  return [a1 legacySyncIdentity];
}

id objc_msgSend_legacyXPCIngestionServiceClient(void *a1, const char *a2, ...)
{
  return [a1 legacyXPCIngestionServiceClient];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkCollection(void *a1, const char *a2, ...)
{
  return [a1 linkCollection];
}

id objc_msgSend_links(void *a1, const char *a2, ...)
{
  return [a1 links];
}

id objc_msgSend_literal(void *a1, const char *a2, ...)
{
  return [a1 literal];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return [a1 locale];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logDescription(void *a1, const char *a2, ...)
{
  return [a1 logDescription];
}

id objc_msgSend_logPrefix(void *a1, const char *a2, ...)
{
  return [a1 logPrefix];
}

id objc_msgSend_loginURL(void *a1, const char *a2, ...)
{
  return [a1 loginURL];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_mainRecord(void *a1, const char *a2, ...)
{
  return [a1 mainRecord];
}

id objc_msgSend_maintenanceWorkCoordinator(void *a1, const char *a2, ...)
{
  return [a1 maintenanceWorkCoordinator];
}

id objc_msgSend_majorVersion(void *a1, const char *a2, ...)
{
  return [a1 majorVersion];
}

id objc_msgSend_markDidProduceNewRecords(void *a1, const char *a2, ...)
{
  return [a1 markDidProduceNewRecords];
}

id objc_msgSend_maxRetryCount(void *a1, const char *a2, ...)
{
  return [a1 maxRetryCount];
}

id objc_msgSend_mayMakeRequests(void *a1, const char *a2, ...)
{
  return [a1 mayMakeRequests];
}

id objc_msgSend_medicalRecord(void *a1, const char *a2, ...)
{
  return [a1 medicalRecord];
}

id objc_msgSend_medicalRecordCodings(void *a1, const char *a2, ...)
{
  return [a1 medicalRecordCodings];
}

id objc_msgSend_medicalRecordIdentifier(void *a1, const char *a2, ...)
{
  return [a1 medicalRecordIdentifier];
}

id objc_msgSend_medicalRecordSampleID(void *a1, const char *a2, ...)
{
  return [a1 medicalRecordSampleID];
}

id objc_msgSend_medicalRecords(void *a1, const char *a2, ...)
{
  return [a1 medicalRecords];
}

id objc_msgSend_medicationDispenseRecordType(void *a1, const char *a2, ...)
{
  return [a1 medicationDispenseRecordType];
}

id objc_msgSend_medicationOrderType(void *a1, const char *a2, ...)
{
  return [a1 medicationOrderType];
}

id objc_msgSend_medicationRecordType(void *a1, const char *a2, ...)
{
  return [a1 medicationRecordType];
}

id objc_msgSend_messageIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 messageIdentifiers];
}

id objc_msgSend_messageVersion(void *a1, const char *a2, ...)
{
  return [a1 messageVersion];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metadataManager(void *a1, const char *a2, ...)
{
  return [a1 metadataManager];
}

id objc_msgSend_method(void *a1, const char *a2, ...)
{
  return [a1 method];
}

id objc_msgSend_minCompatibleAPIVersion(void *a1, const char *a2, ...)
{
  return [a1 minCompatibleAPIVersion];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_multiDeviceStatus(void *a1, const char *a2, ...)
{
  return [a1 multiDeviceStatus];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsRelogin(void *a1, const char *a2, ...)
{
  return [a1 needsRelogin];
}

id objc_msgSend_needsScopeUpgrade(void *a1, const char *a2, ...)
{
  return [a1 needsScopeUpgrade];
}

id objc_msgSend_newCompatibleCodableCredential(void *a1, const char *a2, ...)
{
  return [a1 newCompatibleCodableCredential];
}

id objc_msgSend_newCompatibleCodableSignedClinicalDataRecord(void *a1, const char *a2, ...)
{
  return [a1 newCompatibleCodableSignedClinicalDataRecord];
}

id objc_msgSend_nextRetryDate(void *a1, const char *a2, ...)
{
  return [a1 nextRetryDate];
}

id objc_msgSend_nextSearchResultURL(void *a1, const char *a2, ...)
{
  return [a1 nextSearchResultURL];
}

id objc_msgSend_notificationManager(void *a1, const char *a2, ...)
{
  return [a1 notificationManager];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numFailedAttemptsToReachMaxBlockTime(void *a1, const char *a2, ...)
{
  return [a1 numFailedAttemptsToReachMaxBlockTime];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objects(void *a1, const char *a2, ...)
{
  return [a1 objects];
}

id objc_msgSend_ontologyConfigurationProvider(void *a1, const char *a2, ...)
{
  return [a1 ontologyConfigurationProvider];
}

id objc_msgSend_ontologyFeatureEvaluators(void *a1, const char *a2, ...)
{
  return [a1 ontologyFeatureEvaluators];
}

id objc_msgSend_ontologyUpdateCoordinator(void *a1, const char *a2, ...)
{
  return [a1 ontologyUpdateCoordinator];
}

id objc_msgSend_operatingSystemBuild(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemBuild];
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemVersion];
}

id objc_msgSend_operatingSystemVersionString(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemVersionString];
}

id objc_msgSend_operationError(void *a1, const char *a2, ...)
{
  return [a1 operationError];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return [a1 operationQueue];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_optInDataCollectionEnabledCountryCodes(void *a1, const char *a2, ...)
{
  return [a1 optInDataCollectionEnabledCountryCodes];
}

id objc_msgSend_optInDataCollectionManager(void *a1, const char *a2, ...)
{
  return [a1 optInDataCollectionManager];
}

id objc_msgSend_optInDataUploadManager(void *a1, const char *a2, ...)
{
  return [a1 optInDataUploadManager];
}

id objc_msgSend_optInStudy(void *a1, const char *a2, ...)
{
  return [a1 optInStudy];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_orderedProperties(void *a1, const char *a2, ...)
{
  return [a1 orderedProperties];
}

id objc_msgSend_originIdentifier(void *a1, const char *a2, ...)
{
  return [a1 originIdentifier];
}

id objc_msgSend_originInformation(void *a1, const char *a2, ...)
{
  return [a1 originInformation];
}

id objc_msgSend_originVersionBuild(void *a1, const char *a2, ...)
{
  return [a1 originVersionBuild];
}

id objc_msgSend_originVersionMajor(void *a1, const char *a2, ...)
{
  return [a1 originVersionMajor];
}

id objc_msgSend_originVersionMinor(void *a1, const char *a2, ...)
{
  return [a1 originVersionMinor];
}

id objc_msgSend_originVersionPatch(void *a1, const char *a2, ...)
{
  return [a1 originVersionPatch];
}

id objc_msgSend_originalCredential(void *a1, const char *a2, ...)
{
  return [a1 originalCredential];
}

id objc_msgSend_originalFHIRResource(void *a1, const char *a2, ...)
{
  return [a1 originalFHIRResource];
}

id objc_msgSend_originalRecord(void *a1, const char *a2, ...)
{
  return [a1 originalRecord];
}

id objc_msgSend_originalScopes(void *a1, const char *a2, ...)
{
  return [a1 originalScopes];
}

id objc_msgSend_outcome(void *a1, const char *a2, ...)
{
  return [a1 outcome];
}

id objc_msgSend_outcomeInfo(void *a1, const char *a2, ...)
{
  return [a1 outcomeInfo];
}

id objc_msgSend_overrideFailedAttemptsCount(void *a1, const char *a2, ...)
{
  return [a1 overrideFailedAttemptsCount];
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return [a1 page];
}

id objc_msgSend_pageOffset(void *a1, const char *a2, ...)
{
  return [a1 pageOffset];
}

id objc_msgSend_param(void *a1, const char *a2, ...)
{
  return [a1 param];
}

id objc_msgSend_passwordResetURL(void *a1, const char *a2, ...)
{
  return [a1 passwordResetURL];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_patientHash(void *a1, const char *a2, ...)
{
  return [a1 patientHash];
}

id objc_msgSend_patientID(void *a1, const char *a2, ...)
{
  return [a1 patientID];
}

id objc_msgSend_patientPortalURL(void *a1, const char *a2, ...)
{
  return [a1 patientPortalURL];
}

id objc_msgSend_pendingReminderIDsToReminders(void *a1, const char *a2, ...)
{
  return [a1 pendingReminderIDsToReminders];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return [a1 persistentID];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_pkceVerifier(void *a1, const char *a2, ...)
{
  return [a1 pkceVerifier];
}

id objc_msgSend_postDate(void *a1, const char *a2, ...)
{
  return [a1 postDate];
}

id objc_msgSend_predicateForAccountsForLegacySync(void *a1, const char *a2, ...)
{
  return [a1 predicateForAccountsForLegacySync];
}

id objc_msgSend_predicateForFHIRDSTU2Gateways(void *a1, const char *a2, ...)
{
  return [a1 predicateForFHIRDSTU2Gateways];
}

id objc_msgSend_predicateForGatewaysForLegacySync(void *a1, const char *a2, ...)
{
  return [a1 predicateForGatewaysForLegacySync];
}

id objc_msgSend_predicateForUSGateways(void *a1, const char *a2, ...)
{
  return [a1 predicateForUSGateways];
}

id objc_msgSend_preferredFilenameExtension(void *a1, const char *a2, ...)
{
  return [a1 preferredFilenameExtension];
}

id objc_msgSend_primaryDSTU2Version(void *a1, const char *a2, ...)
{
  return [a1 primaryDSTU2Version];
}

id objc_msgSend_primaryDeviceName(void *a1, const char *a2, ...)
{
  return [a1 primaryDeviceName];
}

id objc_msgSend_primaryProfile(void *a1, const char *a2, ...)
{
  return [a1 primaryProfile];
}

id objc_msgSend_procedureRecordType(void *a1, const char *a2, ...)
{
  return [a1 procedureRecordType];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return [a1 profile];
}

id objc_msgSend_profileExtension(void *a1, const char *a2, ...)
{
  return [a1 profileExtension];
}

id objc_msgSend_profileManager(void *a1, const char *a2, ...)
{
  return [a1 profileManager];
}

id objc_msgSend_profileType(void *a1, const char *a2, ...)
{
  return [a1 profileType];
}

id objc_msgSend_propertiesForCodable(void *a1, const char *a2, ...)
{
  return [a1 propertiesForCodable];
}

id objc_msgSend_propertyForSyncAnchor(void *a1, const char *a2, ...)
{
  return [a1 propertyForSyncAnchor];
}

id objc_msgSend_propertyForSyncProvenance(void *a1, const char *a2, ...)
{
  return [a1 propertyForSyncProvenance];
}

id objc_msgSend_propertyName(void *a1, const char *a2, ...)
{
  return [a1 propertyName];
}

id objc_msgSend_protectedDatabase(void *a1, const char *a2, ...)
{
  return [a1 protectedDatabase];
}

id objc_msgSend_providedResource(void *a1, const char *a2, ...)
{
  return [a1 providedResource];
}

id objc_msgSend_providerServiceManager(void *a1, const char *a2, ...)
{
  return [a1 providerServiceManager];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_queryDescriptor(void *a1, const char *a2, ...)
{
  return [a1 queryDescriptor];
}

id objc_msgSend_queryDescriptors(void *a1, const char *a2, ...)
{
  return [a1 queryDescriptors];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_queryMode(void *a1, const char *a2, ...)
{
  return [a1 queryMode];
}

id objc_msgSend_queryParameters(void *a1, const char *a2, ...)
{
  return [a1 queryParameters];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rawContent(void *a1, const char *a2, ...)
{
  return [a1 rawContent];
}

id objc_msgSend_readDataToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 readDataToEndOfFile];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_receivedDate(void *a1, const char *a2, ...)
{
  return [a1 receivedDate];
}

id objc_msgSend_receivedDateTimeZone(void *a1, const char *a2, ...)
{
  return [a1 receivedDateTimeZone];
}

id objc_msgSend_receivedDateTimeZoneName(void *a1, const char *a2, ...)
{
  return [a1 receivedDateTimeZoneName];
}

id objc_msgSend_receivedHomescreenUnlockedAtHomescreenNotification(void *a1, const char *a2, ...)
{
  return [a1 receivedHomescreenUnlockedAtHomescreenNotification];
}

id objc_msgSend_receivedHomescreenUnlockedAtHomescreenNotificationHandler(void *a1, const char *a2, ...)
{
  return [a1 receivedHomescreenUnlockedAtHomescreenNotificationHandler];
}

id objc_msgSend_records(void *a1, const char *a2, ...)
{
  return [a1 records];
}

id objc_msgSend_redactedResources(void *a1, const char *a2, ...)
{
  return [a1 redactedResources];
}

id objc_msgSend_referenceRanges(void *a1, const char *a2, ...)
{
  return [a1 referenceRanges];
}

id objc_msgSend_references(void *a1, const char *a2, ...)
{
  return [a1 references];
}

id objc_msgSend_refreshError(void *a1, const char *a2, ...)
{
  return [a1 refreshError];
}

id objc_msgSend_refreshResult(void *a1, const char *a2, ...)
{
  return [a1 refreshResult];
}

id objc_msgSend_refreshToken(void *a1, const char *a2, ...)
{
  return [a1 refreshToken];
}

id objc_msgSend_refreshedAccount(void *a1, const char *a2, ...)
{
  return [a1 refreshedAccount];
}

id objc_msgSend_refreshedCredential(void *a1, const char *a2, ...)
{
  return [a1 refreshedCredential];
}

id objc_msgSend_removed(void *a1, const char *a2, ...)
{
  return [a1 removed];
}

id objc_msgSend_reportedHost(void *a1, const char *a2, ...)
{
  return [a1 reportedHost];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestedScope(void *a1, const char *a2, ...)
{
  return [a1 requestedScope];
}

id objc_msgSend_requestedScopeString(void *a1, const char *a2, ...)
{
  return [a1 requestedScopeString];
}

id objc_msgSend_requestedURL(void *a1, const char *a2, ...)
{
  return [a1 requestedURL];
}

id objc_msgSend_resetMetric(void *a1, const char *a2, ...)
{
  return [a1 resetMetric];
}

id objc_msgSend_resetMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetMetrics];
}

id objc_msgSend_resolutionError(void *a1, const char *a2, ...)
{
  return [a1 resolutionError];
}

id objc_msgSend_resource(void *a1, const char *a2, ...)
{
  return [a1 resource];
}

id objc_msgSend_resourceBundleData(void *a1, const char *a2, ...)
{
  return [a1 resourceBundleData];
}

id objc_msgSend_resourceID(void *a1, const char *a2, ...)
{
  return [a1 resourceID];
}

id objc_msgSend_resourceKeyPath(void *a1, const char *a2, ...)
{
  return [a1 resourceKeyPath];
}

id objc_msgSend_resourceObjects(void *a1, const char *a2, ...)
{
  return [a1 resourceObjects];
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

id objc_msgSend_resourceTypes(void *a1, const char *a2, ...)
{
  return [a1 resourceTypes];
}

id objc_msgSend_resourceURL(void *a1, const char *a2, ...)
{
  return [a1 resourceURL];
}

id objc_msgSend_resources(void *a1, const char *a2, ...)
{
  return [a1 resources];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_responses(void *a1, const char *a2, ...)
{
  return [a1 responses];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return [a1 retryCount];
}

id objc_msgSend_retryInterval(void *a1, const char *a2, ...)
{
  return [a1 retryInterval];
}

id objc_msgSend_revision(void *a1, const char *a2, ...)
{
  return [a1 revision];
}

id objc_msgSend_rulesVersion(void *a1, const char *a2, ...)
{
  return [a1 rulesVersion];
}

id objc_msgSend_runBlock(void *a1, const char *a2, ...)
{
  return [a1 runBlock];
}

id objc_msgSend_safeDeletionReason(void *a1, const char *a2, ...)
{
  return [a1 safeDeletionReason];
}

id objc_msgSend_safeUniquenessChecksum(void *a1, const char *a2, ...)
{
  return [a1 safeUniquenessChecksum];
}

id objc_msgSend_samplePredicate(void *a1, const char *a2, ...)
{
  return [a1 samplePredicate];
}

id objc_msgSend_sampleType(void *a1, const char *a2, ...)
{
  return [a1 sampleType];
}

id objc_msgSend_sampleTypes(void *a1, const char *a2, ...)
{
  return [a1 sampleTypes];
}

id objc_msgSend_saveableResources(void *a1, const char *a2, ...)
{
  return [a1 saveableResources];
}

id objc_msgSend_scheduleSharing(void *a1, const char *a2, ...)
{
  return [a1 scheduleSharing];
}

id objc_msgSend_schedulerGracePeriod(void *a1, const char *a2, ...)
{
  return [a1 schedulerGracePeriod];
}

id objc_msgSend_schemaName(void *a1, const char *a2, ...)
{
  return [a1 schemaName];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_scope(void *a1, const char *a2, ...)
{
  return [a1 scope];
}

id objc_msgSend_scopeString(void *a1, const char *a2, ...)
{
  return [a1 scopeString];
}

id objc_msgSend_scopes(void *a1, const char *a2, ...)
{
  return [a1 scopes];
}

id objc_msgSend_searchResults(void *a1, const char *a2, ...)
{
  return [a1 searchResults];
}

id objc_msgSend_searchString(void *a1, const char *a2, ...)
{
  return [a1 searchString];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_sharingAuthorizationManager(void *a1, const char *a2, ...)
{
  return [a1 sharingAuthorizationManager];
}

id objc_msgSend_shouldFetchImmediately(void *a1, const char *a2, ...)
{
  return [a1 shouldFetchImmediately];
}

id objc_msgSend_shouldPromptForImproveHealthRecordsDataSubmission(void *a1, const char *a2, ...)
{
  return [a1 shouldPromptForImproveHealthRecordsDataSubmission];
}

id objc_msgSend_shouldRefresh(void *a1, const char *a2, ...)
{
  return [a1 shouldRefresh];
}

id objc_msgSend_shouldReplace(void *a1, const char *a2, ...)
{
  return [a1 shouldReplace];
}

id objc_msgSend_shouldSkipFetch(void *a1, const char *a2, ...)
{
  return [a1 shouldSkipFetch];
}

id objc_msgSend_shouldSkipGatewaysUpdate(void *a1, const char *a2, ...)
{
  return [a1 shouldSkipGatewaysUpdate];
}

id objc_msgSend_shouldSkipIngestionMetricsSubmission(void *a1, const char *a2, ...)
{
  return [a1 shouldSkipIngestionMetricsSubmission];
}

id objc_msgSend_showSensitiveLogItems(void *a1, const char *a2, ...)
{
  return [a1 showSensitiveLogItems];
}

id objc_msgSend_signatureStatus(void *a1, const char *a2, ...)
{
  return [a1 signatureStatus];
}

id objc_msgSend_signedClinicalDataIssuer(void *a1, const char *a2, ...)
{
  return [a1 signedClinicalDataIssuer];
}

id objc_msgSend_signedClinicalDataIssuerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 signedClinicalDataIssuerIdentifier];
}

id objc_msgSend_signedClinicalDataManager(void *a1, const char *a2, ...)
{
  return [a1 signedClinicalDataManager];
}

id objc_msgSend_signedClinicalDataRecordIdentifier(void *a1, const char *a2, ...)
{
  return [a1 signedClinicalDataRecordIdentifier];
}

id objc_msgSend_signedClinicalDataRecordType(void *a1, const char *a2, ...)
{
  return [a1 signedClinicalDataRecordType];
}

id objc_msgSend_signupURL(void *a1, const char *a2, ...)
{
  return [a1 signupURL];
}

id objc_msgSend_sizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 sizeInBytes];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceManager(void *a1, const char *a2, ...)
{
  return [a1 sourceManager];
}

id objc_msgSend_sourceRevision(void *a1, const char *a2, ...)
{
  return [a1 sourceRevision];
}

id objc_msgSend_sourceString(void *a1, const char *a2, ...)
{
  return [a1 sourceString];
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return [a1 sourceType];
}

id objc_msgSend_sourceURL(void *a1, const char *a2, ...)
{
  return [a1 sourceURL];
}

id objc_msgSend_specification(void *a1, const char *a2, ...)
{
  return [a1 specification];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startedListeningForHomescreenUnlockedNotifications(void *a1, const char *a2, ...)
{
  return [a1 startedListeningForHomescreenUnlockedNotifications];
}

id objc_msgSend_startedListeningForHomescreenUnlockedNotificationsHandler(void *a1, const char *a2, ...)
{
  return [a1 startedListeningForHomescreenUnlockedNotificationsHandler];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stoppedListeningForHomescreenUnlockedNotifications(void *a1, const char *a2, ...)
{
  return [a1 stoppedListeningForHomescreenUnlockedNotifications];
}

id objc_msgSend_stoppedListeningForHomescreenUnlockedNotificationsHandler(void *a1, const char *a2, ...)
{
  return [a1 stoppedListeningForHomescreenUnlockedNotificationsHandler];
}

id objc_msgSend_stringRepresentation(void *a1, const char *a2, ...)
{
  return [a1 stringRepresentation];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_study(void *a1, const char *a2, ...)
{
  return [a1 study];
}

id objc_msgSend_studyID(void *a1, const char *a2, ...)
{
  return [a1 studyID];
}

id objc_msgSend_subjectID(void *a1, const char *a2, ...)
{
  return [a1 subjectID];
}

id objc_msgSend_subjectToken(void *a1, const char *a2, ...)
{
  return [a1 subjectToken];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_superclassEncoder(void *a1, const char *a2, ...)
{
  return [a1 superclassEncoder];
}

id objc_msgSend_syncIdentifier(void *a1, const char *a2, ...)
{
  return [a1 syncIdentifier];
}

id objc_msgSend_syncIdentity(void *a1, const char *a2, ...)
{
  return [a1 syncIdentity];
}

id objc_msgSend_syncIdentityManager(void *a1, const char *a2, ...)
{
  return [a1 syncIdentityManager];
}

id objc_msgSend_syncProvenance(void *a1, const char *a2, ...)
{
  return [a1 syncProvenance];
}

id objc_msgSend_syncStoreType(void *a1, const char *a2, ...)
{
  return [a1 syncStoreType];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return [a1 task];
}

id objc_msgSend_taskDescription(void *a1, const char *a2, ...)
{
  return [a1 taskDescription];
}

id objc_msgSend_taskError(void *a1, const char *a2, ...)
{
  return [a1 taskError];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return [a1 taskIdentifier];
}

id objc_msgSend_taskSuccess(void *a1, const char *a2, ...)
{
  return [a1 taskSuccess];
}

id objc_msgSend_throttlingInterval(void *a1, const char *a2, ...)
{
  return [a1 throttlingInterval];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeScopes(void *a1, const char *a2, ...)
{
  return [a1 timeScopes];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_triggerScheduler(void *a1, const char *a2, ...)
{
  return [a1 triggerScheduler];
}

id objc_msgSend_truePredicate(void *a1, const char *a2, ...)
{
  return [a1 truePredicate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_types(void *a1, const char *a2, ...)
{
  return [a1 types];
}

id objc_msgSend_uniquenessChecksum(void *a1, const char *a2, ...)
{
  return [a1 uniquenessChecksum];
}

id objc_msgSend_units(void *a1, const char *a2, ...)
{
  return [a1 units];
}

id objc_msgSend_universalFeatureEvaluator(void *a1, const char *a2, ...)
{
  return [a1 universalFeatureEvaluator];
}

id objc_msgSend_unknownRecordType(void *a1, const char *a2, ...)
{
  return [a1 unknownRecordType];
}

id objc_msgSend_unknownRecordsMetric(void *a1, const char *a2, ...)
{
  return [a1 unknownRecordsMetric];
}

id objc_msgSend_unknownStatus(void *a1, const char *a2, ...)
{
  return [a1 unknownStatus];
}

id objc_msgSend_unprotectedDatabase(void *a1, const char *a2, ...)
{
  return [a1 unprotectedDatabase];
}

id objc_msgSend_unresolvableReferences(void *a1, const char *a2, ...)
{
  return [a1 unresolvableReferences];
}

id objc_msgSend_unschedule(void *a1, const char *a2, ...)
{
  return [a1 unschedule];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateGatewayOperationsByAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 updateGatewayOperationsByAccountIdentifier];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userDomainConceptManager(void *a1, const char *a2, ...)
{
  return [a1 userDomainConceptManager];
}

id objc_msgSend_userEnabled(void *a1, const char *a2, ...)
{
  return [a1 userEnabled];
}

id objc_msgSend_userHasAgreedToHealthRecordsDataSubmission(void *a1, const char *a2, ...)
{
  return [a1 userHasAgreedToHealthRecordsDataSubmission];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userStatus(void *a1, const char *a2, ...)
{
  return [a1 userStatus];
}

id objc_msgSend_vaccinationRecordType(void *a1, const char *a2, ...)
{
  return [a1 vaccinationRecordType];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueType(void *a1, const char *a2, ...)
{
  return [a1 valueType];
}

id objc_msgSend_verifiableClinicalRecord(void *a1, const char *a2, ...)
{
  return [a1 verifiableClinicalRecord];
}

id objc_msgSend_verifiableClinicalRecordType(void *a1, const char *a2, ...)
{
  return [a1 verifiableClinicalRecordType];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilFinished];
}

id objc_msgSend_wasFullFetch(void *a1, const char *a2, ...)
{
  return [a1 wasFullFetch];
}

id objc_msgSend_wasPosted(void *a1, const char *a2, ...)
{
  return [a1 wasPosted];
}

id objc_msgSend_webURL(void *a1, const char *a2, ...)
{
  return [a1 webURL];
}

id objc_msgSend_weekOfYear(void *a1, const char *a2, ...)
{
  return [a1 weekOfYear];
}

id objc_msgSend_wellKnownURL(void *a1, const char *a2, ...)
{
  return [a1 wellKnownURL];
}

id objc_msgSend_wrappedCredential(void *a1, const char *a2, ...)
{
  return [a1 wrappedCredential];
}