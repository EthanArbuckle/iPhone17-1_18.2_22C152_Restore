void sub_4B40(id a1)
{
  +[ICNoteContext startSharedContextWithOptions:2056];
}

void sub_5170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_51B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_51C4(uint64_t a1)
{
}

void sub_51CC(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v2 = +[ICAccount cloudKitAccountWithIdentifier:v5 context:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_5248(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _noteContext];
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    id v5 = [v4 childAccounts];
    v6 = [v3 _syncingAccountForParentAccount:v4 withChildren:v5];

    v7 = [v6 identifier];
    uint64_t v8 = [v2 accountForAccountId:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      v11 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_6424(a1 + 48, v11);
      }

      v12 = *(void **)(a1 + 32);
      objc_opt_class();
      v13 = ICCheckedDynamicCast();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v12 htmlAccountHasLocalUnsyncedData:v13];
    }
  }
}

void sub_5470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5488(uint64_t a1)
{
  uint64_t v2 = +[ICCloudContext sharedContext];
  uint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5548;
  v4[3] = &unk_8258;
  v4[4] = *(void *)(a1 + 40);
  [v2 enumerateAllCloudObjectsInContext:v3 batchSize:0 saveAfterBatch:0 usingBlock:v4];
}

void sub_5548(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if ([v7 needsToBePushedToCloud]) {
    char v6 = [v7 shouldBeIgnoredForSync] ^ 1;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v6;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a3 = 1;
  }
}

void sub_56E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5700(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stores];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "ic_containsObjectPassingTest:", &stru_82C0);
}

BOOL sub_5764(id a1, NoteStoreObject *a2, BOOL *a3)
{
  uint64_t v3 = [(NoteStoreObject *)a2 changes];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

void sub_5B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5B2C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _noteContext];
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  BOOL v4 = [v2 accountForAccountId:v3];

  id v5 = os_log_create("com.apple.notes", "Accounts");
  char v6 = v5;
  if (!v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_650C(v6, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_65E8();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 deleteAccount:v4];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v24 = 0;
    unsigned __int8 v7 = [v2 save:&v24];
    char v6 = v24;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v8 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_657C();
      }

      if (+[NoteContext databaseIsCorrupt:v6])
      {
        uint64_t v9 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_6544(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }
    }
LABEL_14:
  }
}

void sub_5D94(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _noteContext];
  uint64_t v3 = [v2 localAccount];
  BOOL v4 = [v2 allNotesInCollection:v3];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        [v2 deleteNoteRegardlessOfConstraints:*(void *)(*((void *)&v21 + 1) + 8 * (void)v8)];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
  id v20 = 0;
  unsigned __int8 v9 = [v2 save:&v20];
  id v10 = v20;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_657C();
    }

    if (+[NoteContext databaseIsCorrupt:v10])
    {
      uint64_t v12 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_6544(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
}

void sub_629C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_62B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_62D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_62E8(uint64_t a1, NSObject *a2)
{
  int v2 = *(unsigned __int8 *)(*(void *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "has local unsynced data %d", (uint8_t *)v3, 8u);
}

void sub_6368(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_62D0(&dword_0, a3, (uint64_t)a3, "found ICAccount %@", (uint8_t *)a2);
}

void sub_63B8()
{
  sub_6290();
  sub_62D0(&dword_0, v0, v1, "checking for unsynced data on account %@", v2);
}

void sub_6424(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) accountIdentifier];
  sub_6290();
  sub_62D0(&dword_0, a2, v4, "found NoteAccountObject %@", v5);
}

void sub_64BC(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_62B8(&dword_0, a3, (uint64_t)a3, "Could not find a notes-syncable account for this ACAccount: %@", (uint8_t *)a2);
}

void sub_650C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6544(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_657C()
{
  sub_6290();
  sub_62B8(&dword_0, v0, v1, "Failed to save: %@", v2);
}

void sub_65E8()
{
  sub_6290();
  sub_62D0(&dword_0, v0, v1, "Removing NoteAccountObject %@", v2);
}

void sub_6654(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 username];
  sub_6290();
  sub_62B8(&dword_0, a2, v4, "No account syncing Notes found on parent account %@.", v5);
}

uint64_t ICCheckedDynamicCast()
{
  return _ICCheckedDynamicCast();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__drainLocalStore(void *a1, const char *a2, ...)
{
  return [a1 _drainLocalStore];
}

id objc_msgSend__noteContext(void *a1, const char *a2, ...)
{
  return [a1 _noteContext];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return [a1 changes];
}

id objc_msgSend_childAccounts(void *a1, const char *a2, ...)
{
  return [a1 childAccounts];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_didChooseToMigrate(void *a1, const char *a2, ...)
{
  return [a1 didChooseToMigrate];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_initWithPrivateQueue(void *a1, const char *a2, ...)
{
  return [a1 initWithPrivateQueue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_localAccount(void *a1, const char *a2, ...)
{
  return [a1 localAccount];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_needsToBePushedToCloud(void *a1, const char *a2, ...)
{
  return [a1 needsToBePushedToCloud];
}

id objc_msgSend_parentAccount(void *a1, const char *a2, ...)
{
  return [a1 parentAccount];
}

id objc_msgSend_setUpSharedContextIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 setUpSharedContextIfNecessary];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return [a1 sharedContext];
}

id objc_msgSend_shouldBeIgnoredForSync(void *a1, const char *a2, ...)
{
  return [a1 shouldBeIgnoredForSync];
}

id objc_msgSend_stores(void *a1, const char *a2, ...)
{
  return [a1 stores];
}

id objc_msgSend_supportedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 supportedDataclasses];
}

id objc_msgSend_syncableDataclasses(void *a1, const char *a2, ...)
{
  return [a1 syncableDataclasses];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_workerManagedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 workerManagedObjectContext];
}