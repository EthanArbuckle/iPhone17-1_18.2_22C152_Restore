void sub_3FF8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_4014(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    v6 = qword_11168;
    if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = a3;
      _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Failed to retrieve pending follow up items because %{public}@", buf, 0xCu);
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      uint64_t v10 = SRFollowUpEnableSKIdentifier;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(a2);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v12, "uniqueIdentifier"), "isEqualToString:", v10))
          {
            id v13 = objc_msgSend(objc_msgSend(v12, "userInfo"), "objectForKeyedSubscript:", @"bundlePath");
            if (v13)
            {
              id v14 = v13;
              [objc_loadWeak((id *)(a1 + 40)) setFollowUpBundlePath:v13];
              v15 = qword_11168;
              if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                id v22 = v14;
                _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "Retrieved a follow up item for %{public}@", buf, 0xCu);
              }
              return;
            }
          }
        }
        id v8 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
}

BOOL sub_42DC(uint64_t a1, void *a2)
{
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(a2, "bundleIdentifier"))) {
    return 1;
  }
  if (*(void *)(a1 + 40)) {
    return objc_msgSend(objc_msgSend(a2, "entitlements"), "objectForKey:ofClass:", *(void *)(a1 + 40), objc_opt_class()) != 0;
  }
  return 0;
}

id sub_46FC(uint64_t a1, void *a2)
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id result = [a2 countByEnumeratingWithState:&v35 objects:v42 count:16];
  id v27 = result;
  if (result)
  {
    uint64_t v26 = *(void *)v36;
    uint64_t v25 = PSValueKey;
    *(void *)&long long v3 = 138543362;
    long long v23 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(a2);
        }
        uint64_t v5 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v4);
        id v7 = +[NSBundle sk_bundleWithIdentifier:v5];
        if (v7)
        {
          id v8 = v7;
          uint64_t v29 = v5;
          v30 = v6;
          id v9 = [a2 objectForKeyedSubscript:v5];
          uint64_t v10 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v9 count]);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v11 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v32;
            do
            {
              for (i = 0; i != v12; i = (char *)i + 1)
              {
                if (*(void *)v32 != v13) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                -[NSMutableSet addObject:](v10, "addObject:", objc_msgSend(+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", v15), "authorizationService"));
              }
              id v12 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v12);
          }
          long long v17 = (char *)objc_msgSend(v8, "sr_bundleType", v23);
          v6 = v30;
          if (v17)
          {
            long long v18 = (void **)(a1 + 32);
            if (v17 == (unsigned char *)&dword_0 + 1) {
              goto LABEL_18;
            }
            if (v17 == (unsigned char *)&dword_0 + 2)
            {
              long long v18 = (void **)(a1 + 40);
LABEL_18:
              long long v19 = *v18;
            }
            else
            {
              long long v19 = 0;
            }
            id v21 = [v19 objectForKeyedSubscript:v29];
            if (v21)
            {
              objc_msgSend(v21, "setObject:forKeyedSubscript:", -[NSNumber stringValue](+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", v25), "integerValue")+ (void)-[NSMutableSet count](v10, "count")), "stringValue"), v25);
            }
            else
            {
              id v22 = +[PSSpecifier sk_appSpecifierForBundle:value:cellType:target:](PSSpecifier, "sk_appSpecifierForBundle:value:cellType:target:", v8, [+[NSNumber numberWithUnsignedInteger:[(NSMutableSet *)v10 count]] stringValue], 2, *(void *)(a1 + 48));
              [v19 setObject:v22 forKeyedSubscript:v29];
              [*(id *)(*(void *)(a1 + 48) + 184) addObject:v22];
            }
          }
        }
        else
        {
          v20 = qword_11168;
          if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            uint64_t v41 = v5;
            _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "Error locating bundle %{public}@", buf, 0xCu);
          }
        }
        v4 = (char *)v4 + 1;
      }
      while (v4 != v27);
      id result = [a2 countByEnumeratingWithState:&v35 objects:v42 count:16];
      id v27 = result;
    }
    while (result);
  }
  return result;
}

id sub_4A78(void *a1, void *a2)
{
  id v3 = [a1 name];
  id v4 = [a2 name];

  return [v3 localizedCaseInsensitiveCompare:v4];
}

id sub_5658(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDataCollection:*(unsigned __int8 *)(a1 + 40)];
}

id sub_5668(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"GLOBAL_SWITCH_GROUP"];
}

id sub_5B6C(id *a1, void *a2, uint64_t a3)
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id result = [a2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  id v17 = result;
  if (result)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(a2);
        }
        uint64_t v19 = v6;
        uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * v6);
        if (+[NSBundle sk_bundleWithIdentifier:](NSBundle, "sk_bundleWithIdentifier:", v7, v16))
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v8 = [a2 objectForKeyedSubscript:v7];
          id v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v21;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v21 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
                uint64_t v15 = +[SRAuthorizationGroup authorizationGroupWithServiceName:](SRAuthorizationGroup, "authorizationGroupWithServiceName:", (*(uint64_t (**)(uint64_t, id))(a3 + 16))(a3, +[SRSensorDescription sensorDescriptionForSensor:v13]));
                if ((objc_msgSend(a1[4], "containsObject:", -[SRAuthorizationGroup localizedDisplayName](v15, "localizedDisplayName")) & 1) == 0)
                {
                  objc_msgSend(a1[5], "addObject:", objc_msgSend(a1[6], "authGroupSpecifierForAuthGroup:", v15));
                  objc_msgSend(a1[4], "addObject:", -[SRAuthorizationGroup localizedDisplayName](v15, "localizedDisplayName"));
                }
              }
              id v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v10);
          }
        }
        uint64_t v6 = v19 + 1;
      }
      while ((id)(v19 + 1) != v17);
      id result = [a2 countByEnumeratingWithState:&v24 objects:v29 count:16];
      id v17 = result;
    }
    while (result);
  }
  return result;
}

NSString *__cdecl sub_5DA4(id a1, SRSensorDescription *a2)
{
  return (NSString *)[(SRSensorDescription *)a2 authorizationService];
}

NSString *__cdecl sub_5DAC(id a1, SRSensorDescription *a2)
{
  return (NSString *)[(SRSensorDescription *)a2 writerAuthorizationService];
}

NSMutableDictionary *sub_6218(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 32), "userInfo"));
  uint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", [v4 objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)], (*(uint64_t (**)(uint64_t, id))(a3 + 16))(a3, +[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9))));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return v5;
}

NSString *__cdecl sub_6388(id a1, SRSensorDescription *a2)
{
  return (NSString *)[(SRSensorDescription *)a2 authorizationService];
}

NSString *__cdecl sub_6390(id a1, SRSensorDescription *a2)
{
  return (NSString *)[(SRSensorDescription *)a2 writerAuthorizationService];
}

void sub_6874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_689C(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return [Weak deleteAllSamples];
}

void sub_68DC(id a1, NSError *a2)
{
  v2 = qword_11168;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      uint64_t v5 = a2;
      _os_log_error_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "Failed to remove samples: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_INFO))
  {
    LOWORD(v4) = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Samples are removed", (uint8_t *)&v4, 2u);
  }
}

void sub_6AB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

id sub_6ACC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v4 = qword_11168;
    if (os_log_type_enabled((os_log_t)qword_11168, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      uint64_t v8 = a2;
      _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Error running first run onboarding: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  id Weak = objc_loadWeak((id *)(a1 + 32));
  [Weak setPresentingEnableSensorKit:0];
  return [Weak reloadSpecifiers];
}

id sub_6D28(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  [Weak setFollowUpBundlePath:0];

  return [Weak reloadSpecifiers];
}

void sub_6DC8(id a1)
{
  qword_11170 = (uint64_t)+[NSBundle skui_bundle];
}

uint64_t sub_748C()
{
  self;
  uint64_t result = qword_11188;
  if (!qword_11188)
  {
    self;
    if (qword_11198 != -1) {
      dispatch_once(&qword_11198, &stru_C5B0);
    }
    return qword_11190;
  }
  return result;
}

void sub_7528(id a1)
{
  qword_11190 = objc_alloc_init(SRSensorsCache);
}

void *sub_7810(void *result)
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = [SRSensorDescriptionEnumerator alloc];
    if (v2)
    {
      v4.receiver = v2;
      v4.super_class = (Class)SRSensorDescriptionEnumerator;
      id v3 = objc_msgSendSuper2(&v4, "init");
      if (v3) {
        v3[1] = v1;
      }
    }
    else
    {
      id v3 = 0;
    }
    return v3;
  }
  return result;
}

id sub_78A0()
{
  self;

  return +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/ALMANAC"];
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

uint64_t SRRequestFirstRunOnBoarding()
{
  return _SRRequestFirstRunOnBoarding();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

pid_t getpid(void)
{
  return _getpid();
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
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingPathExtension];
}

id objc_msgSend_allSensorsStore(void *a1, const char *a2, ...)
{
  return [a1 allSensorsStore];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_appsAndStudiesWhenFirstRunCompleteGroup(void *a1, const char *a2, ...)
{
  return [a1 appsAndStudiesWhenFirstRunCompleteGroup];
}

id objc_msgSend_appsSpecifierGroup(void *a1, const char *a2, ...)
{
  return [a1 appsSpecifierGroup];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authStore(void *a1, const char *a2, ...)
{
  return [a1 authStore];
}

id objc_msgSend_authorizationService(void *a1, const char *a2, ...)
{
  return [a1 authorizationService];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_cellType(void *a1, const char *a2, ...)
{
  return [a1 cellType];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectedDataSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 collectedDataSpecifiers];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_dataAndAppsSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 dataAndAppsSpecifiers];
}

id objc_msgSend_dataCollectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 dataCollectionEnabled];
}

id objc_msgSend_dataOptionsSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 dataOptionsSpecifiers];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_fetchPendingApp(void *a1, const char *a2, ...)
{
  return [a1 fetchPendingApp];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstRunGroup(void *a1, const char *a2, ...)
{
  return [a1 firstRunGroup];
}

id objc_msgSend_firstRunOnboardingCompleted(void *a1, const char *a2, ...)
{
  return [a1 firstRunOnboardingCompleted];
}

id objc_msgSend_followUpBundlePath(void *a1, const char *a2, ...)
{
  return [a1 followUpBundlePath];
}

id objc_msgSend_globalSwitchSpecifierGroupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 globalSwitchSpecifierGroupSpecifiers];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isGlobalSwitchOn(void *a1, const char *a2, ...)
{
  return [a1 isGlobalSwitchOn];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_legacyAppsInstalled(void *a1, const char *a2, ...)
{
  return [a1 legacyAppsInstalled];
}

id objc_msgSend_legacyAppsSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 legacyAppsSpecifiers];
}

id objc_msgSend_legacyName(void *a1, const char *a2, ...)
{
  return [a1 legacyName];
}

id objc_msgSend_legacyResearchStudyBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 legacyResearchStudyBundleIDs];
}

id objc_msgSend_legacyResearchStudyEntitlement(void *a1, const char *a2, ...)
{
  return [a1 legacyResearchStudyEntitlement];
}

id objc_msgSend_localizedDisplayName(void *a1, const char *a2, ...)
{
  return [a1 localizedDisplayName];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_pendingAppSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 pendingAppSpecifiers];
}

id objc_msgSend_platforms(void *a1, const char *a2, ...)
{
  return [a1 platforms];
}

id objc_msgSend_presentingEnableSensorKit(void *a1, const char *a2, ...)
{
  return [a1 presentingEnableSensorKit];
}

id objc_msgSend_readerAuthorizationBundleIdValues(void *a1, const char *a2, ...)
{
  return [a1 readerAuthorizationBundleIdValues];
}

id objc_msgSend_relatedSettingsCategories(void *a1, const char *a2, ...)
{
  return [a1 relatedSettingsCategories];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_writerAuthorizationValues(void *a1, const char *a2, ...)
{
  return [a1 writerAuthorizationValues];
}