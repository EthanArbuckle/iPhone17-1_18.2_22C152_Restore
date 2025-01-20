int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_1000046B0(id a1)
{
  qword_10000CF78 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.nanonews.sync"];
  _objc_release_x1();
}

void sub_1000047DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000047F4(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_10000CF90)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100004938;
    v3[4] = &unk_100008300;
    v3[5] = v3;
    long long v4 = off_1000082E8;
    uint64_t v5 = 0;
    qword_10000CF90 = _sl_dlopen();
    if (!qword_10000CF90)
    {
      abort_report_np();
LABEL_8:
      sub_100006028();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NPSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_10000CF88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004938()
{
  uint64_t result = _sl_dlopen();
  qword_10000CF90 = result;
  return result;
}

void sub_100004B18(id a1, BOOL a2, id a3)
{
  v3 = (void (**)(void))a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v4 = FCURLsForAppExternalFiles();
  id v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v8);
        v10 = +[NSFileManager defaultManager];
        [v10 removeItemAtURL:v9 error:0];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v6);
  }

  id v11 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
  v12 = NewsCoreUserDefaults();
  uint64_t v13 = FCDefaultsSuiteName;
  v14 = objc_opt_new();
  id v15 = [v11 initWithUserDefaults:v12 domainName:v13 stickyKeys:v14];

  id v16 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
  v17 = NewsCoreSensitiveUserDefaults();
  uint64_t v18 = FCSensitiveDefaultsSuiteName;
  v19 = objc_opt_new();
  id v20 = [v16 initWithUserDefaults:v17 domainName:v18 stickyKeys:v19];

  id v21 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
  v22 = +[NSUserDefaults nanoNewsSyncDefaults];
  v23 = objc_opt_new();
  id v24 = [v21 initWithUserDefaults:v22 domainName:@"com.apple.nanonews.sync" stickyKeys:v23];

  v39[0] = v15;
  v39[1] = v20;
  v39[2] = v24;
  v25 = +[NSArray arrayWithObjects:v39 count:3];
  NSSDestroyUserDefaultsDataWithItems();

  CFBooleanRef v26 = (const __CFBoolean *)MGCopyAnswer();
  int Value = CFBooleanGetValue(v26);
  if (v26) {
    CFRelease(v26);
  }
  if (!Value)
  {
    +[NanoNewsSettingsManager resetSaved];
    +[NanoNewsSettingsManager resetSeen];
  }
  id v28 = objc_alloc((Class)NSSDataContainerDataDestructionItem);
  id v29 = objc_msgSend(v28, "initWithContainerClass:identifier:", NDNewsdDataContainerClass, objc_msgSend(NDNewsdDataContainerIdentifier, "UTF8String"));
  id v30 = objc_alloc((Class)NSSDataContainerDataDestructionItem);
  id v31 = objc_msgSend(v30, "initWithContainerClass:identifier:", 7, objc_msgSend(NSSStocksNewsDataContainerIdentifier, "UTF8String"));
  v38[0] = v29;
  v38[1] = v31;
  v32 = +[NSArray arrayWithObjects:v38 count:2];
  id v33 = (id)NSSDestroyDataContainersWithItems();

  v3[2](v3);
}

void sub_100004EC4(id a1)
{
  qword_10000CFA0 = [[NNArticleIdentifierSyncManager alloc] initWithReadonlyResetKey:@"gizmoSavedResetDate" readwriteResetKey:@"companionSavedResetDate" readonlyKey:@"gizmoSavedStates" readwriteKey:@"companionSavedStates"];
  _objc_release_x1();
}

void sub_100004F78(id a1)
{
  qword_10000CFB0 = [[NNArticleIdentifierSyncManager alloc] initWithReadonlyResetKey:@"gizmoSeenResetDate" readwriteResetKey:@"companionSeenResetDate" readonlyKey:@"gizmoSeenStates" readwriteKey:@"companionSeenStates"];
  _objc_release_x1();
}

void sub_100006028()
{
  CFBooleanRef v0 = (const __CFBoolean *)abort_report_np();
  CFBooleanGetValue(v0);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t FCURLsForAppExternalFiles()
{
  return _FCURLsForAppExternalFiles();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSSDestroyDataContainersWithItems()
{
  return _NSSDestroyDataContainersWithItems();
}

uint64_t NSSDestroyUserDefaultsDataWithItems()
{
  return _NSSDestroyUserDefaultsDataWithItems();
}

uint64_t NSSTerminateNewsProcessesWithItems()
{
  return _NSSTerminateNewsProcessesWithItems();
}

uint64_t NewsCoreSensitiveUserDefaults()
{
  return _NewsCoreSensitiveUserDefaults();
}

uint64_t NewsCoreUserDefaults()
{
  return _NewsCoreUserDefaults();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LSAppRemovalServiceXPCInterface()
{
  return __LSAppRemovalServiceXPCInterface();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__readonlyArticleStateLookup(void *a1, const char *a2, ...)
{
  return [a1 _readonlyArticleStateLookup];
}

id objc_msgSend__readonlyResetDate(void *a1, const char *a2, ...)
{
  return [a1 _readonlyResetDate];
}

id objc_msgSend__readwriteArticleStateLookup(void *a1, const char *a2, ...)
{
  return [a1 _readwriteArticleStateLookup];
}

id objc_msgSend__readwriteResetDate(void *a1, const char *a2, ...)
{
  return [a1 _readwriteResetDate];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_articleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 articleIdentifiers];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clearAllIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 clearAllIdentifiers];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nanoNewsSyncDefaults(void *a1, const char *a2, ...)
{
  return [a1 nanoNewsSyncDefaults];
}

id objc_msgSend_readonlyArticleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 readonlyArticleIdentifiers];
}

id objc_msgSend_readonlyKey(void *a1, const char *a2, ...)
{
  return [a1 readonlyKey];
}

id objc_msgSend_readonlyResetKey(void *a1, const char *a2, ...)
{
  return [a1 readonlyResetKey];
}

id objc_msgSend_readwriteKey(void *a1, const char *a2, ...)
{
  return [a1 readwriteKey];
}

id objc_msgSend_readwriteResetKey(void *a1, const char *a2, ...)
{
  return [a1 readwriteResetKey];
}

id objc_msgSend_resetSaved(void *a1, const char *a2, ...)
{
  return [a1 resetSaved];
}

id objc_msgSend_resetSeen(void *a1, const char *a2, ...)
{
  return [a1 resetSeen];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_savedManager(void *a1, const char *a2, ...)
{
  return [a1 savedManager];
}

id objc_msgSend_seenManager(void *a1, const char *a2, ...)
{
  return [a1 seenManager];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizedKeys(void *a1, const char *a2, ...)
{
  return [a1 synchronizedKeys];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}