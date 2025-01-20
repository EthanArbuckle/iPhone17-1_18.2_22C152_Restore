@interface CKDPCSNotifier
+ (id)sharedNotifier;
- (BOOL)checkAndClearTestOverrides:(id)a3;
- (BOOL)hasOutstandingServicesNeedingDBRReauthentication;
- (BOOL)serviceNeedsDBRReauthentication:(id)a3;
- (CKDPCSNotifier)init;
- (NSMutableDictionary)missingIdentitiesContextMap;
- (NSMutableDictionary)testOverrides;
- (NSMutableSet)mutableServicesNeedingDBRReauthentication;
- (NSSet)servicesNeedingDBRReauthentication;
- (OS_dispatch_queue)synchronizeQueue;
- (OS_dispatch_source)pcsUpdateSource;
- (void)addContext:(id)a3 forManagerUUID:(id)a4;
- (void)addMissingIdentityPublicKeys:(id)a3 forManagerUUID:(id)a4 withAccount:(id)a5;
- (void)addServicesNeedingDBRReauthentication:(id)a3;
- (void)addServicesWithMissingIdentities:(id)a3 forManagerUUID:(id)a4 withAccount:(id)a5;
- (void)addTestOverrides:(id)a3;
- (void)clearContextIfUnnecessaryForManagerUUID:(id)a3;
- (void)clearServicesAndPublicKeysForManagerUUID:(id)a3;
- (void)clearServicesNeedingDBRReauthentication;
- (void)dealloc;
- (void)securityViewBecameReady:(id)a3;
- (void)setMissingIdentitiesContextMap:(id)a3;
- (void)setMutableServicesNeedingDBRReauthentication:(id)a3;
- (void)setPcsUpdateSource:(id)a3;
- (void)setSynchronizeQueue:(id)a3;
- (void)setTestOverrides:(id)a3;
- (void)setupGuitarfishRepairNotificationHandling;
- (void)setupIdentityUpdateNotificationHandling;
@end

@implementation CKDPCSNotifier

- (BOOL)serviceNeedsDBRReauthentication:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_mutableServicesNeedingDBRReauthentication(self, v5, v6);
  objc_sync_enter(v7);
  v10 = objc_msgSend_mutableServicesNeedingDBRReauthentication(self, v8, v9);
  LOBYTE(self) = objc_msgSend_containsObject_(v10, v11, (uint64_t)v4);

  objc_sync_exit(v7);
  return (char)self;
}

- (NSMutableSet)mutableServicesNeedingDBRReauthentication
{
  return self->_mutableServicesNeedingDBRReauthentication;
}

+ (id)sharedNotifier
{
  if (qword_1EBBCFC88 != -1) {
    dispatch_once(&qword_1EBBCFC88, &unk_1F20435F0);
  }
  v2 = (void *)qword_1EBBCFC90;
  return v2;
}

- (CKDPCSNotifier)init
{
  v22.receiver = self;
  v22.super_class = (Class)CKDPCSNotifier;
  id v4 = [(CKDPCSNotifier *)&v22 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v2, v3);
    uint64_t v6 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v5;

    uint64_t v7 = objc_opt_new();
    v8 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v7;

    v10 = objc_msgSend_stringWithFormat_(NSString, v9, @"%s", "com.apple.cloudkit.pcsnotifier.queue");
    v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    v16 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v15;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v4 + 2), "com.apple.cloudkit.pcsnotifier.queue", (void *)1, 0);
    objc_msgSend_setupIdentityUpdateNotificationHandling(v4, v17, v18);
    objc_msgSend_setupGuitarfishRepairNotificationHandling(v4, v19, v20);
  }
  return (CKDPCSNotifier *)v4;
}

- (void)addTestOverrides:(id)a3
{
  id v14 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend_testOverrides(v4, v5, v6);

  if (!v7)
  {
    v10 = objc_opt_new();
    objc_msgSend_setTestOverrides_(v4, v11, (uint64_t)v10);
  }
  uint64_t v12 = objc_msgSend_testOverrides(v4, v8, v9);
  objc_msgSend_addEntriesFromDictionary_(v12, v13, (uint64_t)v14);

  objc_sync_exit(v4);
}

- (BOOL)checkAndClearTestOverrides:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (!*MEMORY[0x1E4F1A4E0])
  {
    objc_super v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, v6, @"CKDPCSNotifier.m", 80, @"Only suitable for testing");
  }
  uint64_t v9 = objc_msgSend_testOverrides(v6, v7, v8);

  if (!v9)
  {
    uint64_t v12 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v10, v11);
    objc_msgSend_setTestOverrides_(v6, v13, (uint64_t)v12);
  }
  id v14 = objc_msgSend_testOverrides(v6, v10, v11);
  v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v5);

  v19 = objc_msgSend_testOverrides(v6, v17, v18);
  objc_msgSend_removeObjectForKey_(v19, v20, (uint64_t)v5);

  objc_sync_exit(v6);
  return v16 != 0;
}

- (void)setupIdentityUpdateNotificationHandling
{
  id v4 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], a2, v2);
  objc_msgSend_addObserver_selector_name_object_(v4, v5, (uint64_t)self, sel_securityViewBecameReady_, @"com.apple.security.view-become-ready", 0);

  uint64_t v6 = (unsigned char *)MEMORY[0x1E4F1A4E0];
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v7 = NSString;
    uint64_t v8 = CKTestNotificationPrefix();
    v10 = objc_msgSend_stringWithFormat_(v7, v9, @"%@%@", v8, @"com.apple.security.view-become-ready");

    v13 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], v11, v12);
    objc_msgSend_addObserver_selector_name_object_(v13, v14, (uint64_t)self, sel_securityViewBecameReady_, v10, 0);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1C4E58A2C, @"com.apple.security.view-change.PCS", 0, (CFNotificationSuspensionBehavior)1025);
  if (*v6)
  {
    v16 = NSString;
    v17 = CKTestNotificationPrefix();
    objc_msgSend_stringWithFormat_(v16, v18, @"%@%@", v17, @"com.apple.security.view-change.PCS");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v20 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v20, self, (CFNotificationCallback)sub_1C4E58A2C, v19, 0, (CFNotificationSuspensionBehavior)1025);
  }
  v21 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v21, self, (CFNotificationCallback)sub_1C4E58A2C, @"com.apple.ProtectedCloudStorage.HaveCredentials", 0, (CFNotificationSuspensionBehavior)1025);
  v24 = objc_msgSend_synchronizeQueue(self, v22, v23);
  v25 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, v24);
  pcsUpdateSource = self->_pcsUpdateSource;
  self->_pcsUpdateSource = v25;

  objc_initWeak(&location, self);
  v27 = self->_pcsUpdateSource;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C4E58B68;
  v29[3] = &unk_1E64F01E8;
  objc_copyWeak(&v30, &location);
  v29[4] = self;
  v28 = v29;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1C4E5A9CC;
  handler[3] = &unk_1E64F0A80;
  id v33 = v28;
  dispatch_source_set_event_handler(v27, handler);

  dispatch_resume((dispatch_object_t)self->_pcsUpdateSource);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)securityViewBecameReady:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _os_activity_create(&dword_1C4CFF000, "CKDPCSNotifier/SecurityViewBecameReady", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  id v5 = NSString;
  uint64_t v6 = CKTestNotificationPrefix();
  uint64_t v7 = *MEMORY[0x1E4F1A5D8];
  uint64_t v9 = objc_msgSend_stringWithFormat_(v5, v8, @"%@%@", v6, *MEMORY[0x1E4F1A5D8]);

  uint64_t v12 = objc_msgSend_userInfo(v3, v10, v11);
  objc_msgSend_objectForKey_(v12, v13, @"view");
  id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (objc_msgSend_isEqualToString_(v14, v15, @"unknown"))
    {
      v16 = v14;
      id v14 = 0;
    }
    else
    {
      v17 = NSString;
      v16 = CKTestNotificationPrefix();
      uint64_t v19 = objc_msgSend_stringWithFormat_(v17, v18, @"%@%@-%@", v16, v7, v14);

      uint64_t v9 = (void *)v19;
    }
  }
  else
  {
    v16 = 0;
  }

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v20 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v24 = @" named ";
    v25 = &stru_1F2044F30;
    if (v14) {
      v25 = v14;
    }
    else {
      v24 = &stru_1F2044F30;
    }
    *(_DWORD *)buf = 138543874;
    v29 = v24;
    v26 = @"Posting a notification to all clients.";
    if (v14) {
      v26 = @"Posting a scoped notification.";
    }
    __int16 v30 = 2114;
    v31 = v25;
    __int16 v32 = 2112;
    id v33 = v26;
    _os_log_debug_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_DEBUG, "Security view%{public}@%{public}@ became ready. %@", buf, 0x20u);
  }
  uint64_t v23 = (const char *)objc_msgSend_UTF8String(v9, v21, v22);
  notify_post(v23);

  os_activity_scope_leave(&state);
}

- (void)dealloc
{
  id v4 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], a2, v2);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, @"com.apple.security.view-become-ready", 0);

  uint64_t v6 = (unsigned char *)MEMORY[0x1E4F1A4E0];
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v7 = NSString;
    uint64_t v8 = CKTestNotificationPrefix();
    v10 = objc_msgSend_stringWithFormat_(v7, v9, @"%@%@", v8, @"com.apple.security.view-become-ready");

    v13 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], v11, v12);
    objc_msgSend_removeObserver_name_object_(v13, v14, (uint64_t)self, v10, 0);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.security.view-change.PCS", 0);
  if (*v6)
  {
    v16 = NSString;
    v17 = CKTestNotificationPrefix();
    objc_msgSend_stringWithFormat_(v16, v18, @"%@%@", v17, @"com.apple.security.view-change.PCS");
    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v20 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v20, self, v19, 0);
  }
  v21 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v21, self, @"com.apple.ProtectedCloudStorage.HaveCredentials", 0);
  dispatch_source_cancel((dispatch_source_t)self->_pcsUpdateSource);
  while (1)
  {
    v24 = objc_msgSend_pcsUpdateSource(self, v22, v23);
    intptr_t v25 = dispatch_source_testcancel(v24);

    if (v25) {
      break;
    }
    usleep(0xAu);
  }
  v26.receiver = self;
  v26.super_class = (Class)CKDPCSNotifier;
  [(CKDPCSNotifier *)&v26 dealloc];
}

- (void)addContext:(id)a3 forManagerUUID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_missingIdentitiesContextMap(self, v7, v8);
  objc_sync_enter(v9);
  uint64_t v12 = objc_msgSend_missingIdentitiesContextMap(self, v10, v11);
  objc_msgSend_setObject_forKey_(v12, v13, (uint64_t)v14, v6);

  objc_sync_exit(v9);
}

- (void)addServicesWithMissingIdentities:(id)a3 forManagerUUID:(id)a4 withAccount:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  uint64_t v12 = objc_msgSend_missingIdentitiesContextMap(self, v10, v11);
  objc_sync_enter(v12);
  dispatch_queue_t v15 = objc_msgSend_missingIdentitiesContextMap(self, v13, v14);
  v17 = objc_msgSend_objectForKey_(v15, v16, (uint64_t)v9);

  if (v17)
  {
    if (objc_msgSend_count(v8, v18, v19))
    {
      objc_msgSend_setAccount_(v17, v20, (uint64_t)v32);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v21 = v8;
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v33, v39, 16);
      if (v25)
      {
        uint64_t v26 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v21);
            }
            uint64_t v28 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            v29 = objc_msgSend_servicesWithMissingIdentities(v17, v23, v24);
            objc_msgSend_addObject_(v29, v30, v28);
          }
          uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v33, v39, 16);
        }
        while (v25);
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v31 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v9;
      _os_log_error_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_ERROR, "No manager context found for manager UUID: %@", buf, 0xCu);
    }
  }

  objc_sync_exit(v12);
}

- (void)addMissingIdentityPublicKeys:(id)a3 forManagerUUID:(id)a4 withAccount:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  uint64_t v12 = objc_msgSend_missingIdentitiesContextMap(self, v10, v11);
  objc_sync_enter(v12);
  dispatch_queue_t v15 = objc_msgSend_missingIdentitiesContextMap(self, v13, v14);
  v17 = objc_msgSend_objectForKey_(v15, v16, (uint64_t)v9);

  if (v17)
  {
    if (objc_msgSend_count(v8, v18, v19))
    {
      objc_msgSend_setAccount_(v17, v20, (uint64_t)v32);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v21 = v8;
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v33, v39, 16);
      if (v25)
      {
        uint64_t v26 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v21);
            }
            uint64_t v28 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            v29 = objc_msgSend_missingIdentityPublicKeys(v17, v23, v24);
            objc_msgSend_addObject_(v29, v30, v28);
          }
          uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v33, v39, 16);
        }
        while (v25);
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v31 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v9;
      _os_log_error_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_ERROR, "No manager context found for manager UUID: %@", buf, 0xCu);
    }
  }

  objc_sync_exit(v12);
}

- (void)clearContextIfUnnecessaryForManagerUUID:(id)a3
{
  id v26 = a3;
  id v6 = objc_msgSend_missingIdentitiesContextMap(self, v4, v5);
  objc_sync_enter(v6);
  id v9 = objc_msgSend_missingIdentitiesContextMap(self, v7, v8);
  uint64_t v11 = objc_msgSend_objectForKey_(v9, v10, (uint64_t)v26);

  uint64_t v14 = objc_msgSend_copyOfServicesWithMissingIdentities(v11, v12, v13);
  if (objc_msgSend_count(v14, v15, v16)) {
    goto LABEL_2;
  }
  uint64_t v19 = objc_msgSend_copyOfMissingIdentityPublicKeys(v11, v17, v18);
  uint64_t v22 = objc_msgSend_count(v19, v20, v21);

  if (!v22)
  {
    uint64_t v14 = objc_msgSend_missingIdentitiesContextMap(self, v23, v24);
    objc_msgSend_removeObjectForKey_(v14, v25, (uint64_t)v26);
LABEL_2:
  }
  objc_sync_exit(v6);
}

- (void)clearServicesAndPublicKeysForManagerUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_missingIdentitiesContextMap(self, v5, v6);
  objc_sync_enter(v7);
  v10 = objc_msgSend_missingIdentitiesContextMap(self, v8, v9);
  uint64_t v12 = objc_msgSend_objectForKey_(v10, v11, (uint64_t)v4);

  if (v12)
  {
    dispatch_queue_t v15 = objc_msgSend_servicesWithMissingIdentities(v12, v13, v14);
    objc_msgSend_removeAllObjects(v15, v16, v17);

    uint64_t v20 = objc_msgSend_missingIdentityPublicKeys(v12, v18, v19);
    objc_msgSend_removeAllObjects(v20, v21, v22);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v23 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v24 = 138412290;
      id v25 = v4;
      _os_log_error_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_ERROR, "No manager context found for manager UUID: %@", (uint8_t *)&v24, 0xCu);
    }
  }

  objc_sync_exit(v7);
}

- (NSSet)servicesNeedingDBRReauthentication
{
  id v4 = objc_msgSend_mutableServicesNeedingDBRReauthentication(self, a2, v2);
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend_mutableServicesNeedingDBRReauthentication(self, v5, v6);
  v10 = objc_msgSend_copy(v7, v8, v9);

  objc_sync_exit(v4);
  return (NSSet *)v10;
}

- (BOOL)hasOutstandingServicesNeedingDBRReauthentication
{
  id v4 = objc_msgSend_mutableServicesNeedingDBRReauthentication(self, a2, v2);
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend_mutableServicesNeedingDBRReauthentication(self, v5, v6);
  BOOL v10 = objc_msgSend_count(v7, v8, v9) != 0;

  objc_sync_exit(v4);
  return v10;
}

- (void)addServicesNeedingDBRReauthentication:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_mutableServicesNeedingDBRReauthentication(self, v5, v6);
  objc_sync_enter(v7);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v8 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_debug_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEBUG, "Adding services: %@ to services needing DBR re-authentication set.", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v11 = objc_msgSend_mutableServicesNeedingDBRReauthentication(self, v9, v10);
  objc_msgSend_addObjectsFromArray_(v11, v12, (uint64_t)v4);

  objc_msgSend_invalidateCachedAccountInfo(MEMORY[0x1E4F19E20], v13, v14);
  objc_sync_exit(v7);
}

- (void)clearServicesNeedingDBRReauthentication
{
  objc_msgSend_mutableServicesNeedingDBRReauthentication(self, a2, v2);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  uint64_t v6 = objc_msgSend_mutableServicesNeedingDBRReauthentication(self, v4, v5);
  objc_msgSend_removeAllObjects(v6, v7, v8);

  objc_msgSend_invalidateCachedAccountInfo(MEMORY[0x1E4F19E20], v9, v10);
  objc_sync_exit(obj);
}

- (void)setupGuitarfishRepairNotificationHandling
{
  if (*MEMORY[0x1E4F1A4E0])
  {
    id v3 = NSString;
    id v4 = CKTestNotificationPrefix();
    objc_msgSend_stringWithFormat_(v3, v5, @"%@%@", v4, @"com.apple.ProtectedCloudStorage.GuitarfishRepairCompleted");
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1C4E5A7BC, v6, 0, (CFNotificationSuspensionBehavior)1025);
  }
  uint64_t v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v8, self, (CFNotificationCallback)sub_1C4E5A7BC, @"com.apple.ProtectedCloudStorage.GuitarfishRepairCompleted", 0, (CFNotificationSuspensionBehavior)1025);
}

- (OS_dispatch_source)pcsUpdateSource
{
  return self->_pcsUpdateSource;
}

- (void)setPcsUpdateSource:(id)a3
{
}

- (OS_dispatch_queue)synchronizeQueue
{
  return self->_synchronizeQueue;
}

- (void)setSynchronizeQueue:(id)a3
{
}

- (NSMutableDictionary)missingIdentitiesContextMap
{
  return self->_missingIdentitiesContextMap;
}

- (void)setMissingIdentitiesContextMap:(id)a3
{
}

- (void)setMutableServicesNeedingDBRReauthentication:(id)a3
{
}

- (NSMutableDictionary)testOverrides
{
  return self->_testOverrides;
}

- (void)setTestOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testOverrides, 0);
  objc_storeStrong((id *)&self->_mutableServicesNeedingDBRReauthentication, 0);
  objc_storeStrong((id *)&self->_missingIdentitiesContextMap, 0);
  objc_storeStrong((id *)&self->_synchronizeQueue, 0);
  objc_storeStrong((id *)&self->_pcsUpdateSource, 0);
}

@end