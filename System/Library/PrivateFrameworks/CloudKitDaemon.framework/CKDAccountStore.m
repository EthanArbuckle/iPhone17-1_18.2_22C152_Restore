@interface CKDAccountStore
+ (CKDAccountStore)sharedAccountStore;
- (ACAccount)primaryAccount;
- (ACAccountStore)accountStore;
- (CKDAccountStore)init;
- (CKDAccountStore)initWithAccountStore:(id)a3;
- (CKDAccountStoreDelegate)delegate;
- (NSArray)cachedAccounts;
- (id)_accountForKey:(id)a3 matchBlock:(id)a4 createBlock:(id)a5;
- (id)_primaryAccount;
- (id)accountWithAltDSID:(id)a3;
- (id)accountWithIdentifier:(id)a3;
- (id)primaryAccountWithPersonaIdentifier:(id)a3;
- (unint64_t)countLimit;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)invalidateCache;
- (void)setCountLimit:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CKDAccountStore

- (ACAccount)primaryAccount
{
  v5 = CKCurrentPersonaID();
  if (v5) {
    objc_msgSend_primaryAccountWithPersonaIdentifier_(self, v3, (uint64_t)v5);
  }
  else {
  v6 = objc_msgSend__primaryAccount(self, v3, v4);
  }

  return (ACAccount *)v6;
}

- (id)_primaryAccount
{
  uint64_t v4 = objc_msgSend_null(MEMORY[0x1E4F1CA98], a2, v2);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1C4F7223C;
  v10[4] = sub_1C4F7224C;
  id v11 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4F72254;
  v9[3] = &unk_1E64F70F8;
  v9[4] = self;
  v9[5] = v10;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4D0A894;
  v8[3] = &unk_1E64F7120;
  v8[4] = self;
  v8[5] = v10;
  v6 = objc_msgSend__accountForKey_matchBlock_createBlock_(self, v5, (uint64_t)v4, v9, v8);
  _Block_object_dispose(v10, 8);

  return v6;
}

- (id)_accountForKey:(id)a3 matchBlock:(id)a4 createBlock:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void))a5;
  v14 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, self, @"CKDAccountStore.m", 160, @"Invalid parameter not satisfying: %@", @"key");

    if (v14) {
      goto LABEL_3;
    }
  }
  v34 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, self, @"CKDAccountStore.m", 161, @"Invalid parameter not satisfying: %@", @"createBlock");

LABEL_3:
  v15 = self;
  objc_sync_enter(v15);
  if (v15) {
    cache = v15->_cache;
  }
  else {
    cache = 0;
  }
  v17 = cache;
  v19 = objc_msgSend_objectForKey_(v17, v18, (uint64_t)v9);

  if (v19) {
    goto LABEL_21;
  }
  if (v15) {
    v20 = v15->_cache;
  }
  else {
    v20 = 0;
  }
  v21 = v20;
  v24 = objc_msgSend_allObjects(v21, v22, v23);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1C4F72AA4;
  v36[3] = &unk_1E64F7198;
  id v37 = v10;
  v19 = objc_msgSend_CKFirstObjectPassingTest_(v24, v25, (uint64_t)v36);

  if (v19)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v26 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v39 = v9;
      __int16 v40 = 2112;
      v41 = v19;
      goto LABEL_25;
    }
    goto LABEL_17;
  }
  v19 = v14[2](v14);
  if (v19)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v26 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v39 = v9;
      __int16 v40 = 2112;
      v41 = v19;
LABEL_25:
      _os_log_debug_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_DEBUG, v27, buf, 0x16u);
      if (!v15) {
        goto LABEL_26;
      }
      goto LABEL_18;
    }
LABEL_17:
    if (!v15)
    {
LABEL_26:
      v28 = 0;
      goto LABEL_19;
    }
LABEL_18:
    v28 = v15->_cache;
LABEL_19:
    v29 = v28;
    objc_msgSend_setObject_forKey_(v29, v30, (uint64_t)v19, v9);
  }
LABEL_21:
  objc_sync_exit(v15);

  return v19;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

+ (CKDAccountStore)sharedAccountStore
{
  if (qword_1EBBCFFE0 != -1) {
    dispatch_once(&qword_1EBBCFFE0, &unk_1F20444B0);
  }
  uint64_t v2 = (void *)qword_1EBBCFFD8;
  return (CKDAccountStore *)v2;
}

- (CKDAccountStore)init
{
  uint64_t v4 = objc_msgSend_currentProcess(CKDDaemonProcess, a2, v2);
  uint64_t v7 = objc_msgSend_processType(v4, v5, v6);

  if ((v7 | 2) == 2)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F179C8]);
    v12 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v10, v11);
    v15 = objc_msgSend_bundleIdentifier(v12, v13, v14);
    v17 = objc_msgSend_initWithEffectiveBundleID_(v9, v16, (uint64_t)v15);
  }
  else
  {
    v17 = 0;
  }
  v18 = (CKDAccountStore *)objc_msgSend_initWithAccountStore_(self, v8, (uint64_t)v17);

  return v18;
}

- (CKDAccountStore)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDAccountStore;
  uint64_t v6 = [(CKDAccountStore *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v7->_cache;
    v7->_cache = v8;

    objc_msgSend_setName_(v7->_cache, v10, @"com.apple.cloudkit.accountStore");
    objc_msgSend_setCountLimit_(v7->_cache, v11, 16);
    objc_msgSend_setMinimumObjectCount_(v7->_cache, v12, 1);
    objc_msgSend_setDelegate_(v7->_cache, v13, (uint64_t)v7);
  }

  return v7;
}

- (unint64_t)countLimit
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    cache = v2->_cache;
  }
  else {
    cache = 0;
  }
  uint64_t v4 = cache;
  unint64_t v7 = objc_msgSend_countLimit(v4, v5, v6);

  objc_sync_exit(v2);
  return v7;
}

- (void)setCountLimit:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj) {
    cache = obj->_cache;
  }
  else {
    cache = 0;
  }
  id v5 = cache;
  objc_msgSend_setCountLimit_(v5, v6, a3);

  objc_sync_exit(obj);
}

- (NSArray)cachedAccounts
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    cache = v2->_cache;
  }
  else {
    cache = 0;
  }
  uint64_t v4 = cache;
  unint64_t v7 = objc_msgSend_allObjects(v4, v5, v6);

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (id)primaryAccountWithPersonaIdentifier:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CKDAccountStore.m", 117, @"Invalid parameter not satisfying: %@", @"persona");
  }
  v8 = objc_msgSend_stringWithFormat_(NSString, v5, @"persona:%@", v7);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4F72498;
  v17[3] = &unk_1E64F7148;
  id v18 = v7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4F7250C;
  v15[3] = &unk_1E64F7170;
  v15[4] = self;
  id v16 = v18;
  id v9 = v18;
  uint64_t v11 = objc_msgSend__accountForKey_matchBlock_createBlock_(self, v10, (uint64_t)v8, v17, v15);

  return v11;
}

- (id)accountWithIdentifier:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CKDAccountStore.m", 130, @"Invalid parameter not satisfying: %@", @"accountID");
  }
  v8 = objc_msgSend_stringWithFormat_(NSString, v5, @"identifier:%@", v7);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4F727E0;
  v17[3] = &unk_1E64F7148;
  id v18 = v7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4F72824;
  v15[3] = &unk_1E64F7170;
  v15[4] = self;
  id v16 = v18;
  id v9 = v18;
  uint64_t v11 = objc_msgSend__accountForKey_matchBlock_createBlock_(self, v10, (uint64_t)v8, v17, v15);

  return v11;
}

- (id)accountWithAltDSID:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CKDAccountStore.m", 141, @"Invalid parameter not satisfying: %@", @"altDSID");
  }
  v8 = objc_msgSend_stringWithFormat_(NSString, v5, @"alt-dsid:%@", v7);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4F72A08;
  v17[3] = &unk_1E64F7148;
  id v18 = v7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4F72A4C;
  v15[3] = &unk_1E64F7170;
  v15[4] = self;
  id v16 = v18;
  id v9 = v18;
  uint64_t v11 = objc_msgSend__accountForKey_matchBlock_createBlock_(self, v10, (uint64_t)v8, v17, v15);

  return v11;
}

- (void)invalidateCache
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    v9[0] = 0;
    _os_log_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_INFO, "Invalidating account cache", (uint8_t *)v9, 2u);
  }
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    cache = v4->_cache;
  }
  else {
    cache = 0;
  }
  uint64_t v6 = cache;
  objc_msgSend_removeAllObjects(v6, v7, v8);

  objc_sync_exit(v4);
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v8 = objc_msgSend_identifier(v5, v6, v7);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v9 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    objc_super v15 = v8;
    _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Account store evicting cached account: %@", (uint8_t *)&v14, 0xCu);
  }
  v12 = objc_msgSend_delegate(self, v10, v11);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_accountStore_willEvictCachedAccount_(v12, v13, (uint64_t)self, v5);
  }
}

- (CKDAccountStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CKDAccountStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end