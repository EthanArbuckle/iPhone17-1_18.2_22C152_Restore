id acc_userDefaults_BOOLForKey(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = +[ACCUserDefaults sharedDefaults];
  v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

id acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  id v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setObject:a2 forKey:a1];
}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setInteger:a2 forKey:a1];
}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setDouble:a1 forKey:a2];
}

id acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  id v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

id acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  id v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

id acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsLogging];
  id v3 = [v2 BOOLForKey:a1];

  return v3;
}

int main(int argc, const char **argv, const char **envp)
{
  init_logging();
  id v3 = objc_opt_new();
  double v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  v2 = "T@\"NSObject<OS_dispatch_semaphore>\",&,V_setup_complete_semaphore";
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(const char **)(v6 + v3);
      if (!v7)
      {
        v7 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v12) = v4;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v6 = *(void *)(a1 + 32);
          v7 = "<Undefined>";
        }
      }
      v8 = *(const char **)(v6 + v3 + 8);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v15, v4, &v16);
          v8 = "<Undefined>";
        }
      }
      os_log_t v9 = os_log_create(v7, v8);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v9;
      if (v9)
      {
        ++v5;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v12 = v7;
          __int16 v13 = 2080;
          v14 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = v7;
        __int16 v13 = 2080;
        v14 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v10);
    v2 = "T@\"NSObject<OS_dispatch_semaphore>\",&,V_setup_complete_semaphore";
  }
  else
  {
    LODWORD(v10) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 276);
    LODWORD(v12) = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v10) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v10;
}

void init_logging_signposts()
{
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1) {
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
  }
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  v2 = "T@\"NSObject<OS_dispatch_semaphore>\",&,V_setup_complete_semaphore";
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(const char **)(v6 + v3);
      if (!v7)
      {
        v7 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v12) = v4;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          uint64_t v6 = *(void *)(a1 + 32);
          v7 = "<Undefined>";
        }
      }
      v8 = *(const char **)(v6 + v3 + 8);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v15, v4, &v16);
          v8 = "<Undefined>";
        }
      }
      os_log_t v9 = os_log_create(v7, v8);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v9;
      if (v9)
      {
        ++v5;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v12 = v7;
          __int16 v13 = 2080;
          v14 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = v7;
        __int16 v13 = 2080;
        v14 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v10);
    v2 = "T@\"NSObject<OS_dispatch_semaphore>\",&,V_setup_complete_semaphore";
  }
  else
  {
    LODWORD(v10) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 276);
    LODWORD(v12) = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v10) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(void *)(a1 + 40);
  gNumLogSignpostObjects = v10;
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createBagForSubProfile(void *a1, const char *a2, ...)
{
  return [a1 createBagForSubProfile];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return [a1 perform];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaults];
}

id objc_msgSend_sharedDefaultsIapd(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaultsIapd];
}

id objc_msgSend_sharedDefaultsLogging(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaultsLogging];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
      v23 =                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              +[NSError errorWithDomain:NSCocoaErrorDomain code:0 userInfo:v63];
    }

    v20 = v83;
    goto LABEL_128;
  }
LABEL_129:

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v77 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[ACCFeatureAudioProductService init]();
    }
    v77 = &_os_log_default;
    v78 = &_os_log_default;
  }
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v106 = (uint64_t)v23;
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "ACCFeatureAudioProductService: processAudioProductCerts, finished, error %@", buf, 0xCu);
  }

  if (v16 && v23) {
    v16[2](v16, v23);
  }
}

- (OS_dispatch_queue)processingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProcessingQueue:(id)a3
{
}

- (OS_dispatch_semaphore)setup_complete_semaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSetup_complete_semaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setup_complete_semaphore, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, &_os_log_default, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)processAudioProductCerts:(uint64_t)a1 forModel:(NSObject *)a2 firstConnectionAfterPair:connection:endpoint:completionHandler:.cold.8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "ACCFeatureAudioProductService: processAudioProductCerts, certs %@", (uint8_t *)&v2, 0xCu);
}

@end