uint64_t DMGetUserDataDisposition()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = +[DMConnection connection];
  v2 = v1;
  if (v1)
  {
    v3 = [v1 userDataDisposition];
  }
  else
  {
    _DMLogFunc(v0, 3, @"Can't connect to migrator service!");
    v3 = 0;
  }

  return v3;
}

void *DMGetPreviousBuildVersion()
{
  id v1 = +[DMConnection connection];
  v2 = v1;
  if (v1)
  {
    id v3 = [v1 previousBuildVersion];
    v4 = v3;
    if (v3)
    {
      CFAutorelease(v3);
    }
  }
  else
  {
    _DMLogFunc(v0, 3, @"Can't connect to migrator service!");
    v4 = 0;
  }

  return v4;
}

void _DMLogFunc(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  v4 = _DMCoreLog();
  os_log_shim_with_CFString();
}

id _DMCoreLog()
{
  if (_DMCoreLog_onceToken != -1) {
    dispatch_once(&_DMCoreLog_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)_DMCoreLog_log;

  return v0;
}

uint64_t DMIsMigrationNeeded()
{
  id v1 = +[DMConnection connection];
  v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 isMigrationNeeded];
  }
  else
  {
    _DMLogFunc(v0, 3, @"Can't connect to migrator service!");
    uint64_t v3 = 0;
  }

  return v3;
}

void DMReportMigrationFailure()
{
  if (os_variant_has_internal_content())
  {
    id v1 = getprogname();
    uint64_t v3 = getpid();
    _DMLogFunc(v0, 5, @"DMReportMigrationFailure called by process: %s[%d]");
    id v2 = +[DMConnection connection];
    id v4 = v2;
    if (v2) {
      [v2 reportMigrationFailure];
    }
    else {
      _DMLogFunc(v0, 3, @"Can't connect to migrator service!");
    }
  }
}

void DMForceMigrationOnNextReboot()
{
  id v1 = getprogname();
  uint64_t v3 = getpid();
  _DMLogFunc(v0, 5, @"DMForceMigrationOnNextReboot called by process: %s[%d]");
  id v2 = +[DMConnection connection];
  id v4 = v2;
  if (v2) {
    [v2 forceMigrationOnNextRebootWithUserDataDisposition:0];
  }
  else {
    _DMLogFunc(v0, 3, @"Can't connect to migrator service!");
  }
}

void DMForceMigrationOnNextRebootWithUserDataDisposition(uint64_t a1)
{
  uint64_t v3 = getprogname();
  uint64_t v5 = getpid();
  _DMLogFunc(v1, 5, @"DMForceMigrationOnNextRebootWithUserDataDisposition called by process: %s[%d]");
  id v4 = +[DMConnection connection];
  id v6 = v4;
  if (v4) {
    [v4 forceMigrationOnNextRebootWithUserDataDisposition:a1];
  }
  else {
    _DMLogFunc(v1, 3, @"Can't connect to migrator service!");
  }
}

uint64_t DMCopyUserDataDispositionAuxiliaryData()
{
  id v1 = +[DMConnection connection];
  id v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 userDataDispositionAuxiliaryData];
  }
  else
  {
    _DMLogFunc(v0, 3, @"Can't connect to migrator service!");
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t DMCopyOrderedPluginIndentifiers()
{
  id v1 = +[DMConnection connection];
  id v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 orderedPluginIdentifiers];
  }
  else
  {
    _DMLogFunc(v0, 3, @"Can't connect to migrator service!");
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t DMPerformMigrationReturningAfterPlugin(uint64_t a1)
{
  getprogname();
  getpid();
  _DMLogFunc(v1, 5, @"DMPerformMigrationReturningAfterPlugin called by process: %s[%d], plugin %@");

  return _DMPerformMigration(1, a1, 0);
}

uint64_t _DMPerformMigration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    id v7 = +[DMEnvironment sharedInstance];
    if ([v7 deviceModeIsSharediPad])
    {
      v8 = +[DMEnvironment sharedInstance];
      char v9 = [v8 userSessionIsLoginWindow];

      if (v9) {
        goto LABEL_8;
      }
      v10 = +[DMEnvironment sharedInstance];
      id v7 = [v10 buildVersion];

      v11 = +[DMEnvironment sharedInstance];
      v12 = [v11 lastBuildVersionPref];

      if (+[DMEnvironment isBuildVersion:v7 equalToBuildVersion:v12])
      {
        _DMLogFunc(v3, 5, @"We are in EDU mode and current build version(%@) is equal to last build version(%@). Skip migration.");

LABEL_13:
        uint64_t v14 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_8:
  id v7 = +[DMConnection connection];
  if (!v7)
  {
    _DMLogFunc(v3, 3, @"Can't connect to migrator service!");
    goto LABEL_13;
  }
  v13 = objc_alloc_init(DMClientAPIController);
  uint64_t v14 = [(DMClientAPIController *)v13 _migrateWithConnection:v7 checkNecessity:a1 lastRelevantPlugin:a2 testMigrationInfrastructureOnly:a3];
  if ((v14 & 1) == 0) {
    DMReportMigrationFailure();
  }

LABEL_14:
  return v14;
}

uint64_t DMPerformMigrationIfNeeded()
{
  getprogname();
  getpid();
  _DMLogFunc(v0, 5, @"DMPerformMigrationIfNeeded called by process: %s[%d]");

  return _DMPerformMigration(1, 0, 0);
}

uint64_t DMPerformMigration()
{
  getprogname();
  getpid();
  _DMLogFunc(v0, 5, @"DMPerformMigration called by process: %s[%d], reason: %@");

  return _DMPerformMigration(0, 0, 0);
}

uint64_t DMTestPerformMigrationInfrastructure()
{
  getprogname();
  getpid();
  _DMLogFunc(v0, 5, @"DMTestPerformMigrationInfrastructure called by process: %s[%d]");

  return _DMPerformMigration(0, 0, 1);
}

void DMProgressHostIsReady()
{
  id v2 = getprogname();
  uint64_t v3 = getpid();
  _DMLogFunc(v0, 5, @"DMProgressHostIsReady called by process: %s[%d]");
  uint64_t v1 = objc_alloc_init(DMClientAPIController);
  id v4 = v1;
  if (v1) {
    [(DMClientAPIController *)v1 progressHostIsReady];
  }
  else {
    _DMLogFunc(v0, 3, @"Failed to create client API controller!");
  }
}

void DMChangeGraphicalProgressVisibility(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = +[DMConnection connection];
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __DMChangeGraphicalProgressVisibility_block_invoke;
    v6[3] = &unk_1E6C1E030;
    char v8 = a1;
    id v7 = v4;
    [v5 changeVisibility:a1 completion:v6];
  }
  else
  {
    _DMLogFunc(v2, 3, @"Can't connect to migrator service!");
  }
}

uint64_t __DMChangeGraphicalProgressVisibility_block_invoke(uint64_t a1)
{
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  _DMLogFunc(v1, 5, @"Data migrator visibility change to %@ completed with success: %s.");

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t DMCopyMigrationPhaseDescription()
{
  id v1 = +[DMConnection connection];
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 migrationPhaseDescription];
  }
  else
  {
    _DMLogFunc(v0, 3, @"Can't connect to migrator service!");
    uint64_t v3 = 0;
  }

  return v3;
}

void DMGetMigrationPluginResults(void *a1)
{
  id v2 = a1;
  id v3 = +[DMConnection connection];
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __DMGetMigrationPluginResults_block_invoke;
    v4[3] = &unk_1E6C1E058;
    id v5 = v2;
    [v3 migrationPluginResults:v4];
  }
  else
  {
    _DMLogFunc(v1, 3, @"Can't connect to migrator service!");
    if (v2) {
      (*((void (**)(id, void, uint64_t))v2 + 2))(v2, 0, [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.datamigrator" code:1 userInfo:0]);
    }
  }
}

uint64_t __DMGetMigrationPluginResults_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void DMDeferExit(void *a1)
{
  id v4 = a1;
  id v2 = +[DMConnection connection];
  id v3 = v2;
  if (v2) {
    [v2 deferExit];
  }
  else {
    _DMLogFunc(v1, 3, @"Can't connect to migrator service!");
  }
  if (v4) {
    v4[2]();
  }
}

void DMCancelDeferredExit(void *a1)
{
  id v4 = a1;
  id v2 = +[DMConnection connection];
  id v3 = v2;
  if (v2) {
    [v2 cancelDeferredExit];
  }
  else {
    _DMLogFunc(v1, 3, @"Can't connect to migrator service!");
  }
  if (v4) {
    v4[2]();
  }
}

void DMTestMigrationUI(uint64_t a1, uint64_t a2)
{
  id v5 = +[DMConnection connection];
  id v6 = v5;
  if (v5) {
    [v5 testMigrationUIWithProgress:a1 forceInvert:a2];
  }
  else {
    _DMLogFunc(v2, 3, @"Can't connect to migrator service!");
  }
}

void sub_1DB90464C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB9047B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _DMLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v6 = a6;
  id v7 = _DMCoreLog();
  os_log_shim_with_CFString();
}

id _DMPluginSignpostLog()
{
  if (_DMPluginSignpostLog_onceToken != -1) {
    dispatch_once(&_DMPluginSignpostLog_onceToken, &__block_literal_global_4_0);
  }
  uint64_t v0 = (void *)_DMPluginSignpostLog_log;

  return v0;
}

void DMSetContext(uint64_t a1)
{
  id v2 = +[DMEnvironment sharedInstance];
  [v2 setContext:a1];
}

void __DMContextPath_block_invoke()
{
  id v0 = +[DMEnvironment sharedInstance];
  DMContextPath_retval = [v0 contextPath];
}

void __DMContextPathCStr_block_invoke()
{
  if (DMContextPath_onceToken != -1) {
    dispatch_once(&DMContextPath_onceToken, &__block_literal_global_2);
  }
  CFStringRef v1 = (const __CFString *)DMContextPath_retval;
  CFIndex v2 = CFStringGetLength((CFStringRef)DMContextPath_retval) + 1;
  DMContextPathCStr_retval = (uint64_t)malloc_type_malloc(v2, 0x9239104AuLL);
  if (!CFStringGetCString(v1, (char *)DMContextPathCStr_retval, v2, 0x8000100u))
  {
    _DMLogFunc(v0, 3, @"DMContextPathCStr CFStringGetCString failed to convert our path to a c string!");
  }
}

uint64_t DMCopyCurrentBuildVersion()
{
  uint64_t v0 = +[DMEnvironment sharedInstance];
  uint64_t v1 = [v0 buildVersion];

  return v1;
}

void sub_1DB9074C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1DB907950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1F40D7F70](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FC0](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x1F40D8A88](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AB0](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

uint64_t MKBUserSessionIsLoginWindow()
{
  return MEMORY[0x1F412FA10]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1F412FA18]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CB3A8](a1, *(void *)&a2, *(void *)&a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCF8](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

uint64_t os_log_shim_with_CFString()
{
  return MEMORY[0x1F40CD3A8]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1F40CEA90](xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1F40CECF0]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
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

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}