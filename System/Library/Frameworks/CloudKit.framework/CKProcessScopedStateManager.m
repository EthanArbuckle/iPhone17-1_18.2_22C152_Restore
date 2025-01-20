@interface CKProcessScopedStateManager
+ (id)sharedManager;
- (id)untrustedEntitlements;
- (void)__refreshAccountAccessAuthorization;
- (void)__registerForAccountChangeNotifications;
- (void)__registerForAuthorizationChangeNotifications;
- (void)clearFakeEntitlementForKey:(id)a3;
- (void)connectionBecameInvalid:(id)a3;
- (void)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 reply:(id)a5;
- (void)handleSignificantIssueBehavior:(unint64_t)a3 reason:(id)a4;
- (void)noteSystemIsAvailable;
- (void)setFakeEntitlement:(id)a3 forKey:(id)a4;
@end

@implementation CKProcessScopedStateManager

- (id)untrustedEntitlements
{
  if (self) {
    self = (CKProcessScopedStateManager *)self->_resolvedEntitlements;
  }
  return self;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B04623C;
  block[3] = &unk_1E545FFA8;
  block[4] = a1;
  if (qword_1EB279B28 != -1) {
    dispatch_once(&qword_1EB279B28, block);
  }
  v2 = (void *)qword_1EB279B30;

  return v2;
}

- (void)setFakeEntitlement:(id)a3 forKey:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v11 = v18;
  if (!v18)
  {
    v11 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v8, v9, v10);
  }
  if (v7) {
    fakeEntitlements = v7->_fakeEntitlements;
  }
  else {
    fakeEntitlements = 0;
  }
  v13 = fakeEntitlements;
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v11, (uint64_t)v6);

  if (!v18) {
  sub_18B0464C8((uint64_t)v7, v15, v16, v17);
  }
  objc_sync_exit(v7);
}

- (void)clearFakeEntitlementForKey:(id)a3
{
  id v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    fakeEntitlements = v4->_fakeEntitlements;
  }
  else {
    fakeEntitlements = 0;
  }
  id v6 = fakeEntitlements;
  objc_msgSend_setObject_forKeyedSubscript_(v6, v7, 0, (uint64_t)v11);

  sub_18B0464C8((uint64_t)v4, v8, v9, v10);
  objc_sync_exit(v4);
}

- (void)__registerForAuthorizationChangeNotifications
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B046BF0;
  aBlock[3] = &unk_1E5461AC0;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  int out_token = -1;
  v4 = NSString;
  v5 = CKTestNotificationPrefix();
  v8 = objc_msgSend_stringWithFormat_(v4, v6, @"%@%@", v7, v5, @"com.apple.cloudd.authorizationChanged");

  v12 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  if (self) {
    notificationQueue = self->_notificationQueue;
  }
  else {
    notificationQueue = 0;
  }
  notify_register_dispatch(v12, &out_token, notificationQueue, v3);
}

- (void)__refreshAccountAccessAuthorization
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    registeredContainers = v2->_registeredContainers;
  }
  else {
    registeredContainers = 0;
  }
  v4 = registeredContainers;
  v8 = objc_msgSend_allObjects(v4, v5, v6, v7);

  objc_sync_exit(v2);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  uint64_t v9 = dispatch_group_create();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v8;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v32, (uint64_t)v37, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        dispatch_group_enter(v9);
        objc_initWeak(&location, v14);
        id v18 = objc_msgSend_containerID(v14, v15, v16, v17);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = sub_18B047088;
        v26[3] = &unk_1E5461B10;
        v29 = v36;
        objc_copyWeak(&v30, &location);
        id v19 = v18;
        id v27 = v19;
        v28 = v9;
        objc_msgSend__refreshAccountAccessAuthorizationWithCompletionHandler_(v14, v20, (uint64_t)v26, v21);

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v32, (uint64_t)v37, 16);
    }
    while (v11);
  }

  if (v2) {
    notificationQueue = v2->_notificationQueue;
  }
  else {
    notificationQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B047284;
  block[3] = &unk_1E545FF40;
  block[4] = v36;
  dispatch_group_notify(v9, notificationQueue, block);

  _Block_object_dispose(v36, 8);
}

- (void)__registerForAccountChangeNotifications
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B0475AC;
  aBlock[3] = &unk_1E5461AC0;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  int out_token = -1;
  v4 = NSString;
  v5 = CKTestNotificationPrefix();
  v8 = objc_msgSend_stringWithFormat_(v4, v6, @"%@%@", v7, v5, @"com.apple.cloudd.accountChanged");

  uint64_t v12 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  if (self) {
    notificationQueue = self->_notificationQueue;
  }
  else {
    notificationQueue = 0;
  }
  notify_register_dispatch(v12, &out_token, notificationQueue, v3);
  uint64_t v17 = objc_msgSend_untrustedEntitlements(self, v14, v15, v16);
  unsigned int v18 = sub_18B180360(v17);

  if (v18)
  {
    int out_token = -1;
    id v19 = NSString;
    v20 = CKTestNotificationPrefix();
    v23 = objc_msgSend_stringWithFormat_(v19, v21, @"%@%@", v22, v20, @"com.apple.cloudd.accountWarmingUp");

    id v27 = (const char *)objc_msgSend_UTF8String(v23, v24, v25, v26);
    if (self) {
      v28 = self->_notificationQueue;
    }
    else {
      v28 = 0;
    }
    notify_register_dispatch(v27, &out_token, v28, v3);
    v8 = v23;
  }
}

- (void)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 reply:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = (void (**)(id, void, id))a5;
  id v14 = 0;
  uint64_t v10 = objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(CKAsset, v9, (uint64_t)a3, (uint64_t)v7, &v14);
  id v11 = v14;
  if (!v10)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v13 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_debug_impl(&dword_18AF10000, v13, OS_LOG_TYPE_DEBUG, "Failed to get metadata for %@: %@", buf, 0x16u);
      if (!v8) {
        goto LABEL_12;
      }
    }
    else if (!v8)
    {
      goto LABEL_12;
    }
    v8[2](v8, 0, v11);
    goto LABEL_12;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v12 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v10;
    _os_log_debug_impl(&dword_18AF10000, v12, OS_LOG_TYPE_DEBUG, "Got metadata %@", buf, 0xCu);
    if (!v8) {
      goto LABEL_12;
    }
    goto LABEL_6;
  }
  if (v8) {
LABEL_6:
  }
    ((void (**)(id, void *, id))v8)[2](v8, v10, 0);
LABEL_12:
}

- (void)connectionBecameInvalid:(id)a3
{
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_error_impl(&dword_18AF10000, v5, OS_LOG_TYPE_ERROR, "The connection to cloudd failed before receiving system availability.", v9, 2u);
  }
  objc_msgSend_noteSystemIsAvailable(self, v6, v7, v8);
}

- (void)noteSystemIsAvailable
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2)
  {
    v2->_systemIsAvailable = 1;
    BOOL hasDeferredAuthorizationChangeNotice = v2->_hasDeferredAuthorizationChangeNotice;
    BOOL hasDeferredAccountChangeNotice = v2->_hasDeferredAccountChangeNotice;
    *(_WORD *)&v2->_BOOL hasDeferredAuthorizationChangeNotice = 0;
  }
  else
  {
    BOOL hasDeferredAuthorizationChangeNotice = 0;
    BOOL hasDeferredAccountChangeNotice = 0;
  }
  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v3, v4, v5);
  uint64_t v12 = sub_18B046744(v2, v9, v10, v11);
  objc_msgSend_removeObserver_name_object_(v8, v13, (uint64_t)v2, @"CKXPCConnectionInterrupted", v12);

  objc_sync_exit(v2);
  if (hasDeferredAuthorizationChangeNotice) {
    objc_msgSend___refreshAccountAccessAuthorization(v2, v14, v15, v16);
  }
  if (hasDeferredAccountChangeNotice)
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v14, v15, v16);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v17 = CKAccountChangedNotificationName();
    objc_msgSend_postNotificationName_object_(v19, v18, (uint64_t)v17, 0);
  }
}

- (void)handleSignificantIssueBehavior:(unint64_t)a3 reason:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_fakeEntitlements, 0);
  objc_storeStrong((id *)&self->_resolvedEntitlements, 0);
  objc_storeStrong((id *)&self->_baseEntitlements, 0);

  objc_storeStrong((id *)&self->_registeredContainers, 0);
}

@end