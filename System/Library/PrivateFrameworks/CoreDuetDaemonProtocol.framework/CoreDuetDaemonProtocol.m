id _CDDCurrentActiveComplications()
{
  dispatch_semaphore_t v0;
  void *v1;
  Class Class;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  uint64_t (*v12)(id);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __CFString *v21;
  objc_class *v22;
  id v23;
  __CFString *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  unint64_t i;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id v34;
  void v36[4];
  NSObject *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  void *v48;
  long long buf;
  void *v50;
  void *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t vars8;

  v53 = *MEMORY[0x1E4F143B8];
  v0 = dispatch_semaphore_create(0);
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v1 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v48 = (void *)getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    *(void *)&buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v50 = __getNRPairedDeviceRegistryClass_block_invoke;
    v51 = &unk_1E6CC6B80;
    v52 = &v45;
    NanoRegistryLibraryCore();
    Class = objc_getClass("NRPairedDeviceRegistry");
    *(void *)(v52[1] + 24) = Class;
    getNRPairedDeviceRegistryClass_softClass = *(void *)(v52[1] + 24);
    v1 = (void *)v46[3];
  }
  v3 = v1;
  _Block_object_dispose(&v45, 8);
  v4 = [v3 sharedInstance];
  v5 = [v4 getActivePairedDevice];

  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v6 = (void *)getACXDeviceConnectionClass_softClass;
  v48 = (void *)getACXDeviceConnectionClass_softClass;
  if (!getACXDeviceConnectionClass_softClass)
  {
    *(void *)&buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v50 = __getACXDeviceConnectionClass_block_invoke;
    v51 = &unk_1E6CC6B80;
    v52 = &v45;
    __getACXDeviceConnectionClass_block_invoke((uint64_t)&buf);
    v6 = (void *)v46[3];
  }
  v7 = v6;
  _Block_object_dispose(&v45, 8);
  v8 = [v7 sharedDeviceConnection];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = ___CDDCurrentActiveComplications_block_invoke;
  v36[3] = &unk_1E6CC6B58;
  v38 = &v39;
  v9 = v0;
  v37 = v9;
  [v8 fetchInstalledApplicationsForPairedDevice:v5 completion:v36];

  v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v9, v10);
  v11 = v5;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v12 = (uint64_t (*)(id))getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  v48 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
  {
    *(void *)&buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v50 = __getNRWatchOSVersionForRemoteDeviceSymbolLoc_block_invoke;
    v51 = &unk_1E6CC6B80;
    v52 = &v45;
    v13 = (void *)NanoRegistryLibrary();
    v14 = dlsym(v13, "NRWatchOSVersionForRemoteDevice");
    *(void *)(v52[1] + 24) = v14;
    getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = *(_UNKNOWN **)(v52[1] + 24);
    v12 = (uint64_t (*)(id))v46[3];
  }
  _Block_object_dispose(&v45, 8);
  if (!v12) {
    goto LABEL_32;
  }
  v15 = v12(v11);

  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v16 = (uint64_t (*)(uint64_t, uint64_t))getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  v48 = getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  if (!getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr)
  {
    *(void *)&buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v50 = __getNRVersionIsGreaterThanOrEqualSymbolLoc_block_invoke;
    v51 = &unk_1E6CC6B80;
    v52 = &v45;
    v17 = (void *)NanoRegistryLibrary();
    v18 = dlsym(v17, "NRVersionIsGreaterThanOrEqual");
    *(void *)(v52[1] + 24) = v18;
    getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr = *(_UNKNOWN **)(v52[1] + 24);
    v16 = (uint64_t (*)(uint64_t, uint64_t))v46[3];
  }
  _Block_object_dispose(&v45, 8);
  if (!v16)
  {
LABEL_32:
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v19 = v16(v15, 0x40000);
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v20 = (void *)getNPSDomainAccessorClass_softClass;
  v48 = (void *)getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    *(void *)&buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v50 = __getNPSDomainAccessorClass_block_invoke;
    v51 = &unk_1E6CC6B80;
    v52 = &v45;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)&buf);
    v20 = (void *)v46[3];
  }
  if (v19) {
    v21 = @"CLKActiveComplications";
  }
  else {
    v21 = @"activeComplications";
  }
  v22 = v20;
  _Block_object_dispose(&v45, 8);
  v23 = [v22 alloc];
  if (v19) {
    v24 = @"com.apple.ClockKit.activeComplications";
  }
  else {
    v24 = @"com.apple.sockpuppet.activeComplications";
  }
  v25 = (void *)[v23 initWithDomain:v24 pairedDevice:v11];
  v26 = (id)[v25 synchronize];
  v27 = [v25 objectForKey:v21];

  v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (i = 0; i < [v27 count]; ++i)
  {
    v30 = [v27 objectAtIndex:i];
    if (([v30 isEqualToString:&stru_1F38A9DC8] & 1) == 0)
    {
      v31 = [(id)v40[5] objectForKeyedSubscript:v30];
      v32 = v31;
      if (!v31
        || ([v31 objectForKeyedSubscript:@"SPContainerAppBundleId"],
            (v33 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v33 = &stru_1F38A9DC8;
      }
      [v28 addObject:v33];
    }
  }
  v34 = v28;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v34;
    _os_log_impl(&dword_1DD479000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "New list of active complications: %@\n", (uint8_t *)&buf, 0xCu);
  }

  _Block_object_dispose(&v39, 8);
  return v34;
}

void sub_1DD47AEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
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

__CFString *_CDDComplicationChangeNotificationString()
{
  return @"com.apple.sockpuppet.complications.updated";
}

__CFString *_CDDComplicationChangeOverCloudNotificationString()
{
  return @"com.apple.ClockKit.activeComplicationsChangedNotification";
}

uint64_t _CDDExtensionIdForCompanionBundle()
{
  return 0;
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  NanoRegistryLibraryCore();
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRPairedDeviceRegistryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibraryCore()
{
  if (!NanoRegistryLibraryCore_frameworkLibrary) {
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return NanoRegistryLibraryCore_frameworkLibrary;
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getACXDeviceConnectionClass_block_invoke(uint64_t a1)
{
  if (!AppConduitLibraryCore_frameworkLibrary) {
    AppConduitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("ACXDeviceConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getACXDeviceConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppConduitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppConduitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNRWatchOSVersionForRemoteDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRWatchOSVersionForRemoteDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibrary()
{
  uint64_t v0 = NanoRegistryLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getNRVersionIsGreaterThanOrEqualSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRVersionIsGreaterThanOrEqual");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __NanoPreferencesSyncLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6CC6BF0;
    uint64_t v5 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getNPSDomainAccessorClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NPSDomainAccessor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getNPSDomainAccessorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary = result;
  return result;
}

void __getNPSDomainAccessorClass_block_invoke_cold_1()
{
  uint64_t v0 = (const void *)abort_report_np();
  _Block_object_dispose(v0, v1);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}