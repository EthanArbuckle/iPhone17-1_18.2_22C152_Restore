@interface CKDDeviceIDManager
+ (id)currentPersonaID;
+ (id)sharedManager;
- (BOOL)useLegacyKeychain;
- (NSMutableDictionary)deviceIDsByContainerIdentifierByContainerEnvironmentByPersona;
- (NSMutableDictionary)globalDeviceIDsPerPersona;
- (OS_dispatch_queue)queue;
- (__CFDictionary)createQueryForService:(id)a3 lookupKey:(id)a4 sysBound:(BOOL)a5;
- (id)_fetchDeviceIDForService:(id)a3 lookupKey:(id)a4 keychainSuccess:(BOOL *)a5;
- (id)_fetchDeviceIdentifierFromDefaultsForService:(id)a3 lookupKey:(id)a4;
- (id)_globalService;
- (id)_perServiceLookupKeyForContainer:(id)a3;
- (id)_serviceForContainer:(id)a3;
- (id)deviceIDsByContainerIdentifierInContainerEnvironment:(int64_t)a3;
- (id)deviceIdentifierForContainer:(id)a3;
- (id)deviceIdentifierForContainer:(id)a3 skipInMemoryCache:(BOOL)a4 createIfNecessary:(BOOL)a5;
- (id)globalDeviceID;
- (id)globalDeviceIdentifier;
- (id)globalDeviceIdentifierSkipInMemoryCache:(BOOL)a3 createIfNecessary:(BOOL)a4;
- (id)initInternal;
- (void)_deleteDeviceIdentifierForContainer:(id)a3;
- (void)_saveDeviceIdentifier:(id)a3 forContainer:(id)a4;
- (void)_saveDeviceIdentifier:(id)a3 forService:(id)a4 lookupKey:(id)a5 sysBound:(BOOL)a6 success:(BOOL *)a7;
- (void)_saveDeviceIdentifierToDefaults:(id)a3 forService:(id)a4 lookupKey:(id)a5;
- (void)setDeviceIDsByContainerIdentifierByContainerEnvironmentByPersona:(id)a3;
- (void)setGlobalDeviceID:(id)a3;
- (void)setGlobalDeviceIDsPerPersona:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUseLegacyKeychain:(BOOL)a3;
@end

@implementation CKDDeviceIDManager

+ (id)sharedManager
{
  if (qword_1EBBD0000 != -1) {
    dispatch_once(&qword_1EBBD0000, &unk_1F20445D0);
  }
  v2 = (void *)qword_1EBBCFFF8;
  return v2;
}

- (id)initInternal
{
  v16.receiver = self;
  v16.super_class = (Class)CKDDeviceIDManager;
  v2 = [(CKDDeviceIDManager *)&v16 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    v7 = (const char *)objc_msgSend_UTF8String(v4, v5, v6);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    deviceIDsByContainerIdentifierByContainerEnvironmentByPersona = v2->_deviceIDsByContainerIdentifierByContainerEnvironmentByPersona;
    v2->_deviceIDsByContainerIdentifierByContainerEnvironmentByPersona = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    globalDeviceIDsPerPersona = v2->_globalDeviceIDsPerPersona;
    v2->_globalDeviceIDsPerPersona = (NSMutableDictionary *)v13;
  }
  return v2;
}

+ (id)currentPersonaID
{
  v3 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], a2, v2);
  uint64_t v6 = objc_msgSend_currentPersona(v3, v4, v5);

  objc_msgSend_userPersonaUniqueString(v6, v7, v8);
  dispatch_queue_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9) {
    dispatch_queue_t v9 = @"(nil)";
  }
  uint64_t v11 = v9;

  return v11;
}

- (id)globalDeviceID
{
  v4 = objc_msgSend_queue(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  v7 = objc_msgSend_currentPersonaID(CKDDeviceIDManager, v5, v6);
  v10 = objc_msgSend_globalDeviceIDsPerPersona(self, v8, v9);
  v12 = objc_msgSend_objectForKey_(v10, v11, (uint64_t)v7);

  return v12;
}

- (void)setGlobalDeviceID:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_queue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  objc_msgSend_currentPersonaID(CKDDeviceIDManager, v8, v9);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_globalDeviceIDsPerPersona(self, v10, v11);
  objc_msgSend_setObject_forKey_(v12, v13, (uint64_t)v4, v14);
}

- (id)deviceIDsByContainerIdentifierInContainerEnvironment:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_queue(self, a2, a3);
  dispatch_assert_queue_V2(v5);

  uint64_t v8 = objc_msgSend_currentPersonaID(CKDDeviceIDManager, v6, v7);
  uint64_t v11 = objc_msgSend_deviceIDsByContainerIdentifierByContainerEnvironmentByPersona(self, v9, v10);
  uint64_t v13 = objc_msgSend_objectForKey_(v11, v12, (uint64_t)v8);

  if (!v13)
  {
    uint64_t v13 = objc_opt_new();
    v17 = objc_msgSend_deviceIDsByContainerIdentifierByContainerEnvironmentByPersona(self, v15, v16);
    objc_msgSend_setObject_forKey_(v17, v18, (uint64_t)v13, v8);
  }
  v19 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v14, a3);
  v21 = objc_msgSend_objectForKeyedSubscript_(v13, v20, (uint64_t)v19);

  if (!v21)
  {
    v21 = objc_opt_new();
    v23 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v22, a3);
    objc_msgSend_setObject_forKeyedSubscript_(v13, v24, (uint64_t)v21, v23);
  }
  return v21;
}

- (id)_globalService
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@", *MEMORY[0x1E4F1A5E8]);
}

- (id)_serviceForContainer:(id)a3
{
  v3 = NSString;
  uint64_t v4 = *MEMORY[0x1E4F1A5E8];
  uint64_t v5 = objc_msgSend_containerID(a3, a2, (uint64_t)a3);
  objc_msgSend_environment(v5, v6, v7);
  uint64_t v8 = CKContainerEnvironmentString();
  uint64_t v10 = objc_msgSend_stringWithFormat_(v3, v9, @"%@.%@.%@", v4, @"deviceIdentifier", v8);

  return v10;
}

- (id)_perServiceLookupKeyForContainer:(id)a3
{
  v3 = objc_msgSend_containerID(a3, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_containerIdentifier(v3, v4, v5);

  return v6;
}

- (id)_fetchDeviceIDForService:(id)a3 lookupKey:(id)a4 keychainSuccess:(BOOL *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v12 = objc_msgSend_currentProcess(CKDDaemonProcess, v10, v11);
  char isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v12, v13, v14);

  if ((isSystemInstalledBinary & 1) == 0)
  {
    uint64_t v17 = objc_msgSend__fetchDeviceIdentifierFromDefaultsForService_lookupKey_(self, v16, (uint64_t)v8, v9);
    if (v17)
    {
      v18 = (void *)v17;
      char v19 = 0;
      if (!a5) {
        goto LABEL_29;
      }
LABEL_28:
      *a5 = v19 ^ 1;
      goto LABEL_29;
    }
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], (const void *)*MEMORY[0x1E4F1A5E8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], v8);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v9);
  v21 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
  if (!*MEMORY[0x1E4F1A4E0] || (objc_msgSend_useLegacyKeychain(self, v22, v23) & 1) == 0) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD08], v21);
  }
  CFTypeRef result = 0;
  OSStatus v24 = SecItemCopyMatching(Mutable, &result);
  if (v24 == -25300)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v27 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v28 = v27;
      v31 = objc_msgSend_currentPersonaID(CKDDeviceIDManager, v29, v30);
      *(_DWORD *)buf = 138412802;
      id v53 = v8;
      __int16 v54 = 2112;
      id v55 = v9;
      __int16 v56 = 2112;
      id v57 = v31;
      _os_log_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_INFO, "No deviceID found in keychain (service: %@, lookupKey: %@, persona: %@)", buf, 0x20u);
    }
    goto LABEL_19;
  }
  OSStatus v25 = v24;
  if (!v24)
  {
LABEL_19:
    char v19 = 0;
    goto LABEL_20;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v26 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    v47 = v26;
    v50 = objc_msgSend_currentPersonaID(CKDDeviceIDManager, v48, v49);
    *(_DWORD *)buf = 138413058;
    id v53 = v8;
    __int16 v54 = 2112;
    id v55 = v9;
    __int16 v56 = 2112;
    id v57 = v50;
    __int16 v58 = 2048;
    v59 = (void *)v25;
    _os_log_error_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_ERROR, "Failed to retrieve deviceID from keychain (service: %@, lookupKey: %@, persona: %@). SecItemCopyMatching() failed: %ld", buf, 0x2Au);
  }
  char v19 = 1;
LABEL_20:
  CFRelease(Mutable);
  if (result)
  {
    id v32 = [NSString alloc];
    v18 = objc_msgSend_initWithData_encoding_(v32, v33, (uint64_t)result, 4);
    CFRelease(result);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v34 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v37 = v34;
      v40 = objc_msgSend_currentPersonaID(CKDDeviceIDManager, v38, v39);
      *(_DWORD *)buf = 138544130;
      id v53 = v18;
      __int16 v54 = 2112;
      id v55 = v8;
      __int16 v56 = 2112;
      id v57 = v9;
      __int16 v58 = 2112;
      v59 = v40;
      _os_log_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_INFO, "Successfully retrieved deviceID %{public}@ from keychain (service: %@, lookupKey: %@, persona: %@)", buf, 0x2Au);
    }
    v41 = objc_msgSend_currentProcess(CKDDaemonProcess, v35, v36);
    char v44 = objc_msgSend_isSystemInstalledBinary(v41, v42, v43);

    if ((v44 & 1) == 0) {
      objc_msgSend__saveDeviceIdentifierToDefaults_forService_lookupKey_(self, v45, (uint64_t)v18, v8, v9);
    }
    if (a5) {
      goto LABEL_28;
    }
  }
  else
  {
    v18 = 0;
    if (a5) {
      goto LABEL_28;
    }
  }
LABEL_29:

  return v18;
}

- (void)_saveDeviceIdentifierToDefaults:(id)a3 forService:(id)a4 lookupKey:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v10, v11);
  uint64_t v14 = objc_msgSend_dictionaryForKey_(v12, v13, (uint64_t)v8);

  uint64_t v17 = objc_msgSend_mutableCopy(v14, v15, v16);
  v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_opt_new();
  }
  v20 = v19;

  objc_msgSend_setObject_forKeyedSubscript_(v20, v21, (uint64_t)v7, v9);
  OSStatus v24 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v22, v23);
  objc_msgSend_setObject_forKey_(v24, v25, (uint64_t)v20, v8);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v26 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v27 = v26;
    uint64_t v30 = objc_msgSend_currentPersonaID(CKDDeviceIDManager, v28, v29);
    int v31 = 138413058;
    id v32 = v7;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    __int16 v37 = 2112;
    v38 = v30;
    _os_log_debug_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEBUG, "Saved deviceID %@ to standardUserDefaults (service: %@, lookupKey: %@, persona: %@)", (uint8_t *)&v31, 0x2Au);
  }
}

- (id)_fetchDeviceIdentifierFromDefaultsForService:(id)a3 lookupKey:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v9 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v7, v8);
  uint64_t v11 = objc_msgSend_dictionaryForKey_(v9, v10, (uint64_t)v5);
  uint64_t v13 = objc_msgSend_objectForKey_(v11, v12, (uint64_t)v6);

  if (v13)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v14 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = v14;
      id v19 = objc_msgSend_currentPersonaID(CKDDeviceIDManager, v17, v18);
      int v20 = 138413058;
      v21 = v13;
      __int16 v22 = 2112;
      id v23 = v5;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_debug_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_DEBUG, "Retrieved deviceID %@ from standardUserDefaults (service: %@, lookupKey: %@, persona: %@)", (uint8_t *)&v20, 0x2Au);
    }
  }

  return v13;
}

- (__CFDictionary)createQueryForService:(id)a3 lookupKey:(id)a4 sysBound:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], (const void *)*MEMORY[0x1E4F1A5E8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], v9);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v8);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B598]);
  if (v5) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B888], &unk_1F20AC918);
  }
  if (!*MEMORY[0x1E4F1A4E0] || (objc_msgSend_useLegacyKeychain(self, v11, v12) & 1) == 0) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD08], (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  return Mutable;
}

- (void)_saveDeviceIdentifier:(id)a3 forService:(id)a4 lookupKey:(id)a5 sysBound:(BOOL)a6 success:(BOOL *)a7
{
  BOOL v8 = a6;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  QueryForService_lookupKey_sysBound = (__CFDictionary *)objc_msgSend_createQueryForService_lookupKey_sysBound_(self, v15, (uint64_t)v13, v14, v8);
  uint64_t v18 = (const void *)objc_msgSend_dataUsingEncoding_(v12, v17, 4);
  id v19 = (const void *)*MEMORY[0x1E4F3BD38];
  CFDictionaryAddValue(QueryForService_lookupKey_sysBound, (const void *)*MEMORY[0x1E4F3BD38], v18);
  OSStatus v20 = SecItemAdd(QueryForService_lookupKey_sysBound, 0);
  OSStatus v21 = v20;
  if (v20 == -25299)
  {
    CFDictionaryRemoveValue(QueryForService_lookupKey_sysBound, v19);
    id v22 = v14;
    id v23 = v13;
    id v24 = v12;
    id v25 = self;
    __int16 v26 = a7;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryAddValue(Mutable, v19, v18);
    OSStatus v21 = SecItemUpdate(QueryForService_lookupKey_sysBound, Mutable);
    uint64_t v28 = Mutable;
    a7 = v26;
    self = v25;
    id v12 = v24;
    id v13 = v23;
    id v14 = v22;
    OSStatus v20 = -25299;
    CFRelease(v28);
  }
  CFRelease(QueryForService_lookupKey_sysBound);
  BOOL v29 = v21 == 0;
  uint64_t v30 = (void *)*MEMORY[0x1E4F1A548];
  if (v21)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v30);
    }
    int v31 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      if (v20 == -25299) {
        id v32 = @"update";
      }
      else {
        id v32 = @"save";
      }
      __int16 v33 = a7;
      id v34 = v31;
      __int16 v37 = objc_msgSend_currentPersonaID(CKDDeviceIDManager, v35, v36);
      *(_DWORD *)buf = 138413570;
      id v53 = v32;
      __int16 v54 = 2114;
      id v55 = v12;
      __int16 v56 = 2112;
      id v57 = v13;
      __int16 v58 = 2112;
      id v59 = v14;
      __int16 v60 = 2112;
      v61 = v37;
      __int16 v62 = 2048;
      uint64_t v63 = v21;
      _os_log_error_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_ERROR, "Failed to %@ device ID %{public}@ in keychain (service: %@, lookupKey: %@, persona: %@). SecItemAdd()/SecItemUpdate() failed: %ld", buf, 0x3Eu);

      a7 = v33;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v30);
    }
    v38 = a7;
    uint64_t v39 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      if (v20 == -25299) {
        v42 = @"updated";
      }
      else {
        v42 = @"saved";
      }
      uint64_t v43 = v39;
      v46 = objc_msgSend_currentPersonaID(CKDDeviceIDManager, v44, v45);
      *(_DWORD *)buf = 138413314;
      id v53 = v42;
      __int16 v54 = 2114;
      id v55 = v12;
      __int16 v56 = 2112;
      id v57 = v13;
      __int16 v58 = 2112;
      id v59 = v14;
      __int16 v60 = 2112;
      v61 = v46;
      _os_log_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_INFO, "Successfully %@ device ID %{public}@ in keychain (service: %@, lookupKey: %@, persona: %@)", buf, 0x34u);
    }
    v47 = objc_msgSend_currentProcess(CKDDaemonProcess, v40, v41);
    char isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v47, v48, v49);

    a7 = v38;
    if ((isSystemInstalledBinary & 1) == 0) {
      objc_msgSend__saveDeviceIdentifierToDefaults_forService_lookupKey_(self, v51, (uint64_t)v12, v13, v14);
    }
  }
  if (a7) {
    *a7 = v29;
  }
}

- (void)_saveDeviceIdentifier:(id)a3 forContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend__serviceForContainer_(self, v8, (uint64_t)v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend__perServiceLookupKeyForContainer_(self, v9, (uint64_t)v6);

  objc_msgSend__saveDeviceIdentifier_forService_lookupKey_sysBound_success_(self, v11, (uint64_t)v7, v12, v10, 0, 0);
}

- (void)_deleteDeviceIdentifierForContainer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v6 = objc_msgSend__serviceForContainer_(self, v5, (uint64_t)v4);
  BOOL v8 = objc_msgSend__perServiceLookupKeyForContainer_(self, v7, (uint64_t)v4);

  CFDictionaryRef QueryForService_lookupKey_sysBound = (const __CFDictionary *)objc_msgSend_createQueryForService_lookupKey_sysBound_(self, v9, (uint64_t)v6, v8, 0);
  OSStatus v11 = SecItemDelete(QueryForService_lookupKey_sysBound);
  if (v11)
  {
    OSStatus v12 = v11;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v13 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v14 = 134217984;
      uint64_t v15 = v12;
      _os_log_error_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_ERROR, "SecItemDelete() for device identifier failed: %ld", (uint8_t *)&v14, 0xCu);
    }
  }
  CFRelease(QueryForService_lookupKey_sysBound);
}

- (id)deviceIdentifierForContainer:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_deviceIdentifierForContainer_skipInMemoryCache_createIfNecessary_, a3);
}

- (id)globalDeviceIdentifier
{
  return (id)MEMORY[0x1F4181798](self, sel_globalDeviceIdentifierSkipInMemoryCache_createIfNecessary_, 0);
}

- (id)deviceIdentifierForContainer:(id)a3 skipInMemoryCache:(BOOL)a4 createIfNecessary:(BOOL)a5
{
  id v8 = a3;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_1C4F9BFD8;
  __int16 v37 = sub_1C4F9BFE8;
  id v38 = 0;
  OSStatus v11 = objc_msgSend_currentProcess(CKDDaemonProcess, v9, v10);
  uint64_t v14 = objc_msgSend_processType(v11, v12, v13);

  if (v14 == 1)
  {
    id v16 = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend__serviceForContainer_(self, v15, (uint64_t)v8);
    id v19 = objc_msgSend__perServiceLookupKeyForContainer_(self, v18, (uint64_t)v8);
    id v22 = objc_msgSend_queue(self, v20, v21);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1C4F9BFF0;
    v26[3] = &unk_1E64F7988;
    v26[4] = self;
    BOOL v31 = a4;
    id v27 = v8;
    id v28 = v17;
    id v29 = v19;
    uint64_t v30 = &v33;
    BOOL v32 = a5;
    id v23 = v19;
    id v24 = v17;
    dispatch_sync(v22, v26);

    id v16 = (id)v34[5];
  }
  _Block_object_dispose(&v33, 8);

  return v16;
}

- (id)globalDeviceIdentifierSkipInMemoryCache:(BOOL)a3 createIfNecessary:(BOOL)a4
{
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_1C4F9BFD8;
  uint64_t v30 = sub_1C4F9BFE8;
  id v31 = 0;
  id v7 = objc_msgSend_currentProcess(CKDDaemonProcess, a2, a3);
  uint64_t v10 = objc_msgSend_processType(v7, v8, v9);

  if (v10 == 1)
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v14 = objc_msgSend__globalService(self, v11, v12);
    uint64_t v17 = objc_msgSend_queue(self, v15, v16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4F9C6D8;
    block[3] = &unk_1E64F79B0;
    BOOL v24 = a3;
    block[4] = self;
    id v21 = v14;
    id v22 = @"globalDeviceIdentifier";
    id v23 = &v26;
    BOOL v25 = a4;
    id v18 = v14;
    dispatch_sync(v17, block);

    id v13 = (id)v27[5];
  }
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)useLegacyKeychain
{
  return self->_useLegacyKeychain;
}

- (void)setUseLegacyKeychain:(BOOL)a3
{
  self->_useLegacyKeychain = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)deviceIDsByContainerIdentifierByContainerEnvironmentByPersona
{
  return self->_deviceIDsByContainerIdentifierByContainerEnvironmentByPersona;
}

- (void)setDeviceIDsByContainerIdentifierByContainerEnvironmentByPersona:(id)a3
{
}

- (NSMutableDictionary)globalDeviceIDsPerPersona
{
  return self->_globalDeviceIDsPerPersona;
}

- (void)setGlobalDeviceIDsPerPersona:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalDeviceIDsPerPersona, 0);
  objc_storeStrong((id *)&self->_deviceIDsByContainerIdentifierByContainerEnvironmentByPersona, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end