void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const char *OUTLINED_FUNCTION_2_1(sqlite3 **a1)
{
  v2 = *a1;
  return sqlite3_errmsg(v2);
}

void sub_221340C48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getREMDatabaseMigrationContextClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __ReminderKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2645A43B8;
    uint64_t v5 = 0;
    ReminderKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary) {
    __getREMDatabaseMigrationContextClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("REMDatabaseMigrationContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMDatabaseMigrationContextClass_block_invoke_cold_2();
  }
  getREMDatabaseMigrationContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReminderKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2213478B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2213479BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ReminderKitLibraryCore()
{
  if (!ReminderKitLibraryCore_frameworkLibrary_0) {
    ReminderKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return ReminderKitLibraryCore_frameworkLibrary_0;
}

uint64_t __ReminderKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getREMSaveRequestClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary();
  Class result = objc_getClass("REMSaveRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMSaveRequestClass_block_invoke_cold_1();
  }
  getREMSaveRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ReminderKitLibrary()
{
  v0 = 0;
  if (!ReminderKitLibraryCore()) {
    ReminderKitLibrary_cold_1(&v0);
  }
}

Class __getREMUserDefaultsClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary();
  Class result = objc_getClass("REMUserDefaults");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMUserDefaultsClass_block_invoke_cold_1();
  }
  getREMUserDefaultsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_221349D9C(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_221349E3C(_Unwind_Exception *a1)
{
}

void sub_221349E5C(void *a1)
{
}

void sub_22134B430(_Unwind_Exception *a1)
{
}

void sub_22134B450(void *a1)
{
}

void sub_22134B648(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    long long v4 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[CalCalendarDatabaseReminderMigrator _attemptMigrationForDatabase:inCalendarDirectory:withContext:]();
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v3;
        id v5 = +[CalMigrationErrorUtils errorFromException:v6];
      }
      else
      {
        id v5 = 0;
      }
    }
    [v2 recordMigrationFailureWithDescription:@"Exception thrown during migration" inStage:0 underlyingError:v5];
    [v2 finishMigrationWithSave:0];
    objc_exception_throw(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_22134BCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22134CCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22134D3E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

Class __getREMColorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __ReminderKitLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2645A4690;
    uint64_t v5 = 0;
    ReminderKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_1) {
    __getREMColorClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("REMColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMColorClass_block_invoke_cold_2();
  }
  getREMColorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReminderKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_22134EE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void __getREMDatabaseMigrationContextClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CalDefaultReminderKitDatabaseMigrationContext.m", 16, @"%s", *a1);

  __break(1u);
}

void __getREMDatabaseMigrationContextClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMDatabaseMigrationContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CalDefaultReminderKitDatabaseMigrationContext.m", 17, @"Unable to find class %s", "REMDatabaseMigrationContext");

  __break(1u);
}

void __getREMSaveRequestClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMSaveRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CalDefaultReminderKitProvider.m", 16, @"Unable to find class %s", "REMSaveRequest");

  __break(1u);
}

void ReminderKitLibrary_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CalDefaultReminderKitProvider.m", 15, @"%s", *a1);

  __break(1u);
}

void __getREMUserDefaultsClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMUserDefaultsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CalDefaultReminderKitProvider.m", 17, @"Unable to find class %s", "REMUserDefaults");

  __break(1u);
}

void __getREMColorClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CalCalendarDatabaseReminderMigrator.m", 33, @"%s", *a1);

  __break(1u);
}

void __getREMColorClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMColorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CalCalendarDatabaseReminderMigrator.m", 34, @"Unable to find class %s", "REMColor");

  __break(1u);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CalCalendarCanContainEntityType()
{
  return MEMORY[0x270F13750]();
}

uint64_t CalCalendarCopyColorStringForDisplay()
{
  return MEMORY[0x270F13768]();
}

uint64_t CalCalendarCopyExternalID()
{
  return MEMORY[0x270F13778]();
}

uint64_t CalCalendarCopyExternalModificationTag()
{
  return MEMORY[0x270F13788]();
}

uint64_t CalCalendarCopyPushKey()
{
  return MEMORY[0x270F137D0]();
}

uint64_t CalCalendarCopyStore()
{
  return MEMORY[0x270F13810]();
}

uint64_t CalCalendarCopySymbolicColorName()
{
  return MEMORY[0x270F13820]();
}

uint64_t CalCalendarCopyTasks()
{
  return MEMORY[0x270F13830]();
}

uint64_t CalCalendarCopyTitle()
{
  return MEMORY[0x270F13838]();
}

uint64_t CalCalendarCopyUUID()
{
  return MEMORY[0x270F13848]();
}

uint64_t CalCalendarGetDisplayOrder()
{
  return MEMORY[0x270F13870]();
}

uint64_t CalCalendarIsHidden()
{
  return MEMORY[0x270F138E0]();
}

uint64_t CalCalendarIsInbox()
{
  return MEMORY[0x270F138F0]();
}

uint64_t CalCalendarIsNotificationsCollection()
{
  return MEMORY[0x270F13908]();
}

uint64_t CalCalendarIsSharingInvitation()
{
  return MEMORY[0x270F13920]();
}

uint64_t CalCalendarIsSubscribed()
{
  return MEMORY[0x270F13928]();
}

uint64_t CalCalendarItemCopyUUID()
{
  return MEMORY[0x270F139F0]();
}

uint64_t CalCalendarSetCanContainEntityType()
{
  return MEMORY[0x270F13B88]();
}

uint64_t CalCalendarSetSyncToken()
{
  return MEMORY[0x270F13CE0]();
}

uint64_t CalCreateiCalendarDataFromCalEntities()
{
  return MEMORY[0x270F13D00]();
}

uint64_t CalDatabaseClearAllChangeHistoryForAllClients()
{
  return MEMORY[0x270F13D18]();
}

uint64_t CalDatabaseCopyDefaultCalendarForNewTasksForReminderMigration()
{
  return MEMORY[0x270F13DD0]();
}

uint64_t CalDatabaseCopyDirectoryPath()
{
  return MEMORY[0x270F13DE0]();
}

uint64_t CalDatabaseCopyDirectoryPathForDatabase()
{
  return MEMORY[0x270F13DE8]();
}

uint64_t CalDatabaseCopyOfAllStores()
{
  return MEMORY[0x270F13EB0]();
}

uint64_t CalDatabaseCreateWithConfiguration()
{
  return MEMORY[0x270F13F98]();
}

uint64_t CalDatabaseRemoveAllCalendarItemsWithCalendarAndEntityType()
{
  return MEMORY[0x270F14008]();
}

uint64_t CalDatabaseSave()
{
  return MEMORY[0x270F14018]();
}

uint64_t CalEventCopyDetachedEvents()
{
  return MEMORY[0x270F14128]();
}

uint64_t CalRemoveCalendar()
{
  return MEMORY[0x270F14498]();
}

uint64_t CalRemoveStore()
{
  return MEMORY[0x270F144C8]();
}

uint64_t CalStoreAllowsEvents()
{
  return MEMORY[0x270F14558]();
}

uint64_t CalStoreAllowsTasksPrivate()
{
  return MEMORY[0x270F14570]();
}

uint64_t CalStoreCopyCalendars()
{
  return MEMORY[0x270F14580]();
}

uint64_t CalStoreCopyName()
{
  return MEMORY[0x270F145B0]();
}

uint64_t CalStoreCopyUUID()
{
  return MEMORY[0x270F145C0]();
}

uint64_t CalStoreGetType()
{
  return MEMORY[0x270F14608]();
}

uint64_t CalStoreIsEnabled()
{
  return MEMORY[0x270F14618]();
}

uint64_t CalStoreSetAllowsTasksPrivate()
{
  return MEMORY[0x270F146B8]();
}

uint64_t CalStoreSetWasMigrated()
{
  return MEMORY[0x270F14868]();
}

uint64_t EKSymbolicColorToRGBMapping()
{
  return MEMORY[0x270F149C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x270F9B708](filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}