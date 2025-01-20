void sub_100003008(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_100003034(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003044(uint64_t a1)
{
}

id sub_10000304C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) isCancelled];
  if ((v4 & 1) == 0)
  {
    v5 = [[DABackupRestoreLogLine alloc] initWithLogLine:v3];
    if ((id)[(DABackupRestoreLogLine *)v5 backupRestoreEventType] != (id)1000)
    {
LABEL_13:

      goto LABEL_14;
    }
    v6 = [DABackupRestoreEvent alloc];
    v7 = [(DABackupRestoreLogLine *)v5 date];
    v8 = [(DABackupRestoreLogLine *)v5 eventSubType];
    v9 = [(DABackupRestoreEvent *)v6 initWithDate:v7 eventSubType:v8 successfulBackup:[(DABackupRestoreLogLine *)v5 didSucceed] eventCode:[(DABackupRestoreLogLine *)v5 backupCode]];

    if ([(DABackupRestoreEvent *)v9 successfulBackup])
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      if (v11)
      {
        v12 = [v11 date];
        v13 = [(DABackupRestoreEvent *)v9 date];
        [v12 timeIntervalSinceDate:v13];
        double v15 = v14;

        if (v15 >= 0.0) {
          goto LABEL_8;
        }
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      }
      objc_storeStrong((id *)(v10 + 40), v9);
    }
LABEL_8:
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    if (v17)
    {
      v18 = [v17 date];
      v19 = [(DABackupRestoreEvent *)v9 date];
      [v18 timeIntervalSinceDate:v19];
      double v21 = v20;

      if (v21 >= 0.0)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    objc_storeStrong((id *)(v16 + 40), v9);
    goto LABEL_12;
  }
LABEL_14:

  return v4;
}

id stringOrNull(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[NSNull null];
  }
  id v4 = v3;

  return v4;
}

id numberOrNull(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[NSNull null];
  }
  id v4 = v3;

  return v4;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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
  return [super a2];
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_backupCode(void *a1, const char *a2, ...)
{
  return [a1 backupCode];
}

id objc_msgSend_backupRestoreEventCode(void *a1, const char *a2, ...)
{
  return [a1 backupRestoreEventCode];
}

id objc_msgSend_backupRestoreEventType(void *a1, const char *a2, ...)
{
  return [a1 backupRestoreEventType];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didSucceed(void *a1, const char *a2, ...)
{
  return [a1 didSucceed];
}

id objc_msgSend_engine(void *a1, const char *a2, ...)
{
  return [a1 engine];
}

id objc_msgSend_eventSubType(void *a1, const char *a2, ...)
{
  return [a1 eventSubType];
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return [a1 fields];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_sharedFormatter(void *a1, const char *a2, ...)
{
  return [a1 sharedFormatter];
}

id objc_msgSend_successfulBackup(void *a1, const char *a2, ...)
{
  return [a1 successfulBackup];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}