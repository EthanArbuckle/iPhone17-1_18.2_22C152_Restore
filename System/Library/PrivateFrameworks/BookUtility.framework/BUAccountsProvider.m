@interface BUAccountsProvider
+ (BUAccountsProvider)sharedProvider;
- (ACAccount)activeStoreAccount;
- (ACAccount)localStoreAccount;
- (ACAccount)primaryAppleAccount;
- (BOOL)detectedUserSwitchWithId:(id)a3 outSignedIn:(BOOL *)a4 outSignedOut:(BOOL *)a5 outAccountNumberChanged:(BOOL *)a6;
- (BOOL)hasCloudKitEntitlement;
- (BOOL)hasRecommendationsEnabled;
- (BOOL)isGlobalICloudDriveSyncOptedIn;
- (BOOL)isPrimaryAccountManagedAppleID;
- (BOOL)isStoreAccountManagedAppleID;
- (BOOL)isUserSignedInToiCloud;
- (BOOL)isUserSignedInToiTunes;
- (BUAccountsProvider)init;
- (NSMutableDictionary)accountIdentifiers;
- (NSMutableDictionary)notifyBlocks;
- (NSMutableDictionary)observerHashTables;
- (NSNumber)cachedIsPrimaryAccountManagedAppleID;
- (NSNumber)cachedIsStoreAccountManagedAppleID;
- (NSNumber)lastUsedStoreAccountID;
- (NSObject)appleAccountDidChangeNotificationRegisteredToken;
- (NSObject)storeAccountDidChangeNotificationRegisteredToken;
- (NSString)currentStorefront;
- (NSString)iCloudAccountName;
- (NSString)iCloudIdentity;
- (OS_dispatch_queue)notifyQueue;
- (id)_observersForAccountType:(unint64_t)a3;
- (id)l_activeStoreAccount;
- (id)l_primaryAppleAccount;
- (int)tccObserverToken;
- (int64_t)_addObserver:(id)a3 forAccountType:(unint64_t)a4;
- (int64_t)_observerCountForAccountType:(unint64_t)a3;
- (int64_t)_removeObserver:(id)a3 forAccountType:(unint64_t)a4;
- (unint64_t)_singleAccountTypeForNotification:(id)a3;
- (void)_didReceiveNotification:(id)a3;
- (void)_registerNotificationForAccountTypeIfNeeded:(unint64_t)a3;
- (void)_unregisterNotificationForAccountType:(unint64_t)a3;
- (void)addObserver:(id)a3 accountTypes:(unint64_t)a4;
- (void)clearLastUsedStoreAccountID;
- (void)dealloc;
- (void)nq_resetAppleAccountCachedValues;
- (void)nq_resetStoreAccountCachedValues;
- (void)nq_setupNotifyBlockForAccountType:(unint64_t)a3 currentAccountIdentifier:(id)a4;
- (void)nq_teardownNotifyBlockForAccountType:(unint64_t)a3;
- (void)nq_updateAccountIdentifierAndNotifyObserversForAccountType:(unint64_t)a3;
- (void)nq_updateiCloudAccountIdentifierAndNotifyObservers;
- (void)nq_updateiTunesAccountIdentifierAndNotifyObservers;
- (void)observeTCCAccessChangeNotificationIfNeeded;
- (void)removeObserver:(id)a3 accountTypes:(unint64_t)a4;
- (void)setAccountIdentifiers:(id)a3;
- (void)setActiveStoreAccount:(id)a3;
- (void)setAppleAccountDidChangeNotificationRegisteredToken:(id)a3;
- (void)setCachedIsPrimaryAccountManagedAppleID:(id)a3;
- (void)setCachedIsStoreAccountManagedAppleID:(id)a3;
- (void)setLocalStoreAccount:(id)a3;
- (void)setNotifyBlocks:(id)a3;
- (void)setNotifyQueue:(id)a3;
- (void)setObserverHashTables:(id)a3;
- (void)setPrimaryAppleAccount:(id)a3;
- (void)setStoreAccountDidChangeNotificationRegisteredToken:(id)a3;
- (void)setTccObserverToken:(int)a3;
- (void)ubiquityIdentityDidChange;
- (void)updateLastUsedStoreAccountID;
@end

@implementation BUAccountsProvider

- (id)l_activeStoreAccount
{
  objc_msgSend__registerNotificationForAccountTypeIfNeeded_(self, a2, 1);
  activeStoreAccount = self->_activeStoreAccount;
  if (!activeStoreAccount)
  {
    v6 = objc_msgSend_bu_sharedAccountStore(MEMORY[0x263EFB210], v3, v4);
    objc_msgSend_ams_activeiTunesAccount(v6, v7, v8);
    v9 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v10 = self->_activeStoreAccount;
    self->_activeStoreAccount = v9;

    activeStoreAccount = self->_activeStoreAccount;
  }

  return activeStoreAccount;
}

- (int64_t)_observerCountForAccountType:(unint64_t)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  p_observersLock = &self->_observersLock;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  uint64_t v8 = (void (*)(void *))sub_21E1C8558;
  v9 = &unk_26449E2F8;
  v11 = &v13;
  unint64_t v12 = a3;
  v10 = self;
  uint64_t v4 = v7;
  os_unfair_lock_lock_with_options();
  v8(v4);
  os_unfair_lock_unlock(p_observersLock);

  int64_t v5 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v5;
}

- (ACAccount)activeStoreAccount
{
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_21E1E4C84;
  uint64_t v15 = sub_21E1E4C94;
  id v16 = 0;
  p_storeAccountCacheLock = &self->_storeAccountCacheLock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v7 = sub_21E1C85E8;
  uint64_t v8 = &unk_26449D600;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  ((void (*)(void *))v7)(v3);
  os_unfair_lock_unlock(p_storeAccountCacheLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (ACAccount *)v4;
}

- (int64_t)_addObserver:(id)a3 forAccountType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  p_observersLock = &self->_observersLock;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  uint64_t v13 = (void (*)(void *))sub_21E1C9750;
  v14 = &unk_26449E2A8;
  uint64_t v15 = self;
  unint64_t v18 = a4;
  id v8 = v6;
  id v16 = v8;
  v17 = &v19;
  v9 = v12;
  os_unfair_lock_lock_with_options();
  v13(v9);
  os_unfair_lock_unlock(p_observersLock);

  int64_t v10 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v10;
}

- (BUAccountsProvider)init
{
  v14.receiver = self;
  v14.super_class = (Class)BUAccountsProvider;
  v2 = [(BUAccountsProvider *)&v14 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_observersLock._os_unfair_lock_opaque = 0;
    v2->_appleAccountCacheLock._os_unfair_lock_opaque = 0;
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("BUAccountsProvider.notifyQueue", v4);
    notifyQueue = v3->_notifyQueue;
    v3->_notifyQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    notifyBlocks = v3->_notifyBlocks;
    v3->_notifyBlocks = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    observerHashTables = v3->_observerHashTables;
    v3->_observerHashTables = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    accountIdentifiers = v3->_accountIdentifiers;
    v3->_accountIdentifiers = (NSMutableDictionary *)v11;

    *(void *)&v3->_tccObserverLock._os_unfair_lock_opaque = 0xFFFFFFFF00000000;
  }
  return v3;
}

- (void)addObserver:(id)a3 accountTypes:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  objc_initWeak(&location, self);
  id v8 = self->_notifyQueue;
  if ((v4 & 1) != 0 && objc_msgSend__addObserver_forAccountType_(self, v7, (uint64_t)v6, 1) == 1)
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v31 = sub_21E1C9858;
    v32 = &unk_26449D948;
    v33 = self;
    uint64_t v9 = v30;
    os_unfair_lock_lock_with_options();
    ((void (*)(void *))v31)(v9);
    os_unfair_lock_unlock(&self->_storeAccountCacheLock);

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E1C8878;
    block[3] = &unk_26449E230;
    objc_copyWeak(&v29, &location);
    dispatch_async((dispatch_queue_t)v8, block);
    objc_destroyWeak(&v29);
  }
  if ((v4 & 2) != 0)
  {
    uint64_t v10 = objc_msgSend__addObserver_forAccountType_(self, v7, (uint64_t)v6, 2);
    if (objc_msgSend_hasCloudKitEntitlement(self, v11, v12))
    {
      if (v10 == 1)
      {
        p_appleAccountCacheLock = &self->_appleAccountCacheLock;
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v25 = sub_21E1E5820;
        v26 = &unk_26449D948;
        v27 = self;
        objc_super v14 = v24;
        os_unfair_lock_lock_with_options();
        ((void (*)(void *))v25)(v14);
        os_unfair_lock_unlock(p_appleAccountCacheLock);

        sub_21E1D7894();
        uint64_t v15 = objc_opt_class();
        unint64_t v18 = objc_msgSend_defaultContainer(v15, v16, v17);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = sub_21E1E582C;
        v21[3] = &unk_26449E280;
        uint64_t v22 = v8;
        objc_copyWeak(&v23, &location);
        objc_msgSend_fetchUserRecordIDWithCompletionHandler_(v18, v19, (uint64_t)v21);

        objc_destroyWeak(&v23);
      }
    }
    else
    {
      v20 = BookUtilityLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_21E1F1FE0();
      }
    }
  }

  objc_destroyWeak(&location);
}

- (void)_registerNotificationForAccountTypeIfNeeded:(unint64_t)a3
{
  objc_initWeak(&location, self);
  if (a3 == 2)
  {
    if (objc_msgSend_hasCloudKitEntitlement(self, v5, v6))
    {
      uint64_t v21 = objc_msgSend_appleAccountDidChangeNotificationRegisteredToken(self, v19, v20);

      if (!v21)
      {
        uint64_t v10 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v22, v23);
        uint64_t v13 = sub_21E1D7B10();
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = sub_21E1E65B4;
        v26[3] = &unk_26449E320;
        uint64_t v15 = &v27;
        objc_copyWeak(&v27, &location);
        uint64_t v17 = objc_msgSend_addObserverForName_object_queue_usingBlock_(v10, v24, (uint64_t)v13, 0, 0, v26);
        objc_msgSend_setAppleAccountDidChangeNotificationRegisteredToken_(self, v25, (uint64_t)v17);
        goto LABEL_8;
      }
    }
  }
  else if (a3 == 1)
  {
    uint64_t v7 = objc_msgSend_storeAccountDidChangeNotificationRegisteredToken(self, v5, v6);

    if (!v7)
    {
      uint64_t v10 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v8, v9);
      uint64_t v13 = objc_msgSend_bu_sharedAccountStore(MEMORY[0x263EFB210], v11, v12);
      uint64_t v14 = *MEMORY[0x263EFAE28];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = sub_21E1E6558;
      v28[3] = &unk_26449E320;
      uint64_t v15 = &v29;
      objc_copyWeak(&v29, &location);
      uint64_t v17 = objc_msgSend_addObserverForName_object_queue_usingBlock_(v10, v16, v14, v13, 0, v28);
      objc_msgSend_setStoreAccountDidChangeNotificationRegisteredToken_(self, v18, (uint64_t)v17);
LABEL_8:

      objc_destroyWeak(v15);
    }
  }
  objc_destroyWeak(&location);
}

- (NSObject)storeAccountDidChangeNotificationRegisteredToken
{
  return self->_storeAccountDidChangeNotificationRegisteredToken;
}

- (void)nq_setupNotifyBlockForAccountType:(unint64_t)a3 currentAccountIdentifier:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notifyQueue);
  if (objc_msgSend__observerCountForAccountType_(self, v7, a3) >= 1)
  {
    notifyBlocks = self->_notifyBlocks;
    uint64_t v10 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v8, a3);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(notifyBlocks, v11, (uint64_t)v10);

    if (!v12)
    {
      uint64_t v13 = self->_notifyQueue;
      objc_initWeak(&location, self);
      uint64_t v14 = [BUCoalescingCallBlock alloc];
      uint64_t v32 = MEMORY[0x263EF8330];
      uint64_t v33 = 3221225472;
      v34 = sub_21E1E6994;
      v35 = &unk_26449E370;
      uint64_t v15 = v13;
      v36 = v15;
      objc_copyWeak(v37, &location);
      v37[1] = (id)a3;
      uint64_t v17 = NSStringFromBUAccountsType(a3, v16);
      uint64_t v19 = objc_msgSend_initWithNotifyBlock_blockDescription_(v14, v18, (uint64_t)&v32, v17);

      objc_msgSend_setCoalescingDelay_(v19, v20, v21, 1.0, v32, v33, v34, v35);
      objc_msgSend_setMaximumDelay_(v19, v22, v23, 2.0);
      v24 = self->_notifyBlocks;
      v26 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v25, a3);
      objc_msgSend_setObject_forKeyedSubscript_(v24, v27, (uint64_t)v19, v26);

      accountIdentifiers = self->_accountIdentifiers;
      v30 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v29, a3);
      objc_msgSend_setObject_forKeyedSubscript_(accountIdentifiers, v31, (uint64_t)v6, v30);

      objc_destroyWeak(v37);
      objc_destroyWeak(&location);
    }
  }
}

- (void)setStoreAccountDidChangeNotificationRegisteredToken:(id)a3
{
}

+ (BUAccountsProvider)sharedProvider
{
  if (qword_26AB40538 != -1) {
    dispatch_once(&qword_26AB40538, &unk_26CF10BD8);
  }
  v2 = (void *)qword_26AB40540;

  return (BUAccountsProvider *)v2;
}

- (void)dealloc
{
  p_storeAccountCacheLock = &self->_storeAccountCacheLock;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E1E49E0;
  v16[3] = &unk_26449D948;
  v16[4] = self;
  os_unfair_lock_lock_with_options();
  sub_21E1E49E0((uint64_t)v16);
  os_unfair_lock_unlock(p_storeAccountCacheLock);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21E1E49EC;
  v15[3] = &unk_26449D948;
  v15[4] = self;
  os_unfair_lock_lock_with_options();
  sub_21E1E49EC((uint64_t)v15);
  os_unfair_lock_unlock(&self->_appleAccountCacheLock);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = -1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  uint64_t v7 = sub_21E1E49F8;
  id v8 = &unk_26449D600;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  char v4 = v6;
  os_unfair_lock_lock_with_options();
  v7((uint64_t)v4);
  os_unfair_lock_unlock(&self->_tccObserverLock);

  if (notify_is_valid_token(*((_DWORD *)v12 + 6))) {
    notify_cancel(*((_DWORD *)v12 + 6));
  }
  _Block_object_dispose(&v11, 8);
  v5.receiver = self;
  v5.super_class = (Class)BUAccountsProvider;
  [(BUAccountsProvider *)&v5 dealloc];
}

- (id)l_primaryAppleAccount
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_msgSend__registerNotificationForAccountTypeIfNeeded_(self, a2, 2);
  if (!self->_primaryAppleAccount || (objc_msgSend_hasCloudKitEntitlement(self, v3, v4) & 1) == 0)
  {
    objc_super v5 = BookUtilityLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_21E1C7000, v5, OS_LOG_TYPE_DEFAULT, "[PrimaryAppleAccount] No account available. Calling ams_activeiCloudAccount", (uint8_t *)&v17, 2u);
    }

    id v8 = objc_msgSend_bu_sharedAccountStore(MEMORY[0x263EFB210], v6, v7);
    objc_msgSend_ams_activeiCloudAccount(v8, v9, v10);
    uint64_t v11 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    primaryAppleAccount = self->_primaryAppleAccount;
    self->_primaryAppleAccount = v11;

    uint64_t v13 = BookUtilityLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = self->_primaryAppleAccount;
      int v17 = 138412290;
      unint64_t v18 = v14;
      _os_log_impl(&dword_21E1C7000, v13, OS_LOG_TYPE_DEFAULT, "[PrimaryAppleAccount] primaryAppleAccount: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  uint64_t v15 = self->_primaryAppleAccount;

  return v15;
}

- (ACAccount)primaryAppleAccount
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = sub_21E1E4C84;
  uint64_t v15 = sub_21E1E4C94;
  id v16 = 0;
  p_appleAccountCacheLock = &self->_appleAccountCacheLock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  uint64_t v7 = sub_21E1E4C9C;
  id v8 = &unk_26449D600;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  ((void (*)(void *))v7)(v3);
  os_unfair_lock_unlock(p_appleAccountCacheLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (ACAccount *)v4;
}

- (ACAccount)localStoreAccount
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = sub_21E1E4C84;
  uint64_t v15 = sub_21E1E4C94;
  id v16 = 0;
  p_storeAccountCacheLock = &self->_storeAccountCacheLock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  uint64_t v7 = sub_21E1E4E18;
  id v8 = &unk_26449D8D0;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  ((void (*)(void *))v7)(v3);
  os_unfair_lock_unlock(p_storeAccountCacheLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (ACAccount *)v4;
}

- (NSNumber)cachedIsPrimaryAccountManagedAppleID
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = sub_21E1E4C84;
  uint64_t v15 = sub_21E1E4C94;
  id v16 = 0;
  p_appleAccountCacheLock = &self->_appleAccountCacheLock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  uint64_t v7 = sub_21E1E4FD4;
  id v8 = &unk_26449D8D0;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  ((void (*)(void *))v7)(v3);
  os_unfair_lock_unlock(p_appleAccountCacheLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSNumber *)v4;
}

- (BOOL)isPrimaryAccountManagedAppleID
{
  v3 = objc_msgSend_cachedIsPrimaryAccountManagedAppleID(self, a2, v2);
  char v6 = objc_msgSend_BOOLValue(v3, v4, v5);

  uint64_t v9 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v7, v8);
  char v11 = objc_msgSend_BOOLForKey_(v9, v10, @"BCForceMAIDAccount");

  return v11 | v6;
}

- (NSNumber)cachedIsStoreAccountManagedAppleID
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = sub_21E1E4C84;
  uint64_t v15 = sub_21E1E4C94;
  id v16 = 0;
  p_storeAccountCacheLock = &self->_storeAccountCacheLock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  uint64_t v7 = sub_21E1E5208;
  uint64_t v8 = &unk_26449D8D0;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  ((void (*)(void *))v7)(v3);
  os_unfair_lock_unlock(p_storeAccountCacheLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSNumber *)v4;
}

- (BOOL)isStoreAccountManagedAppleID
{
  v3 = objc_msgSend_cachedIsStoreAccountManagedAppleID(self, a2, v2);
  char v6 = objc_msgSend_BOOLValue(v3, v4, v5);

  uint64_t v9 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v7, v8);
  char v11 = objc_msgSend_BOOLForKey_(v9, v10, @"BCForceMAIDAccount");

  return v11 | v6;
}

- (NSString)currentStorefront
{
  id v4 = objc_msgSend_activeStoreAccount(self, a2, v2);
  uint64_t v7 = v4;
  if (v4)
  {
    uint64_t v8 = objc_msgSend_ams_storefront(v4, v5, v6);
    if (objc_msgSend_length(v8, v9, v10))
    {
      if (v8)
      {
        char v11 = v7;
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v12 = BookUtilityLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_21E1F1FAC();
      }
    }
  }
  char v11 = objc_msgSend_localStoreAccount(self, v5, v6);

  if (v11)
  {
    uint64_t v8 = objc_msgSend_ams_storefront(v11, v13, v14);
    if (objc_msgSend_length(v8, v15, v16))
    {
      if (v8) {
        goto LABEL_16;
      }
    }
    else
    {
    }
  }
  int v17 = BookUtilityLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_21E1F1F78();
  }

  uint64_t v8 = 0;
LABEL_16:

  return (NSString *)v8;
}

- (NSString)iCloudIdentity
{
  v3 = objc_msgSend_primaryAppleAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_aa_altDSID(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)iCloudAccountName
{
  v3 = objc_msgSend_primaryAppleAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_aa_formattedUsername(v3, v4, v5);

  return (NSString *)v6;
}

- (NSNumber)lastUsedStoreAccountID
{
  v3 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, v2);
  uint64_t v5 = objc_msgSend_objectForKey_(v3, v4, @"BKPreviousUserId");

  return (NSNumber *)v5;
}

- (BOOL)isUserSignedInToiTunes
{
  v3 = objc_msgSend_activeStoreAccount(self, a2, v2);
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isUserSignedInToiCloud
{
  v3 = objc_msgSend_primaryAppleAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_accountType(v3, v4, v5);
  uint64_t v9 = objc_msgSend_identifier(v6, v7, v8);
  char isEqualToString = objc_msgSend_isEqualToString_(v9, v10, *MEMORY[0x263EFAE58]);

  return isEqualToString;
}

- (BOOL)isGlobalICloudDriveSyncOptedIn
{
  v3 = objc_msgSend_primaryAppleAccount(self, a2, v2);
  char isEnabledForDataclass = objc_msgSend_isEnabledForDataclass_(v3, v4, *MEMORY[0x263EFB4C0]);

  return isEnabledForDataclass;
}

- (BOOL)hasRecommendationsEnabled
{
  uint64_t v3 = objc_opt_class();
  uint64_t v6 = objc_msgSend_activeStoreAccount(self, v4, v5);
  uint64_t v8 = objc_msgSend_ams_accountFlagValueForAccountFlag_(v6, v7, *MEMORY[0x263F277C8]);
  uint64_t v9 = BUDynamicCast(v3, v8);
  char v12 = objc_msgSend_BOOLValue(v9, v10, v11);

  return v12;
}

- (BOOL)detectedUserSwitchWithId:(id)a3 outSignedIn:(BOOL *)a4 outSignedOut:(BOOL *)a5 outAccountNumberChanged:(BOOL *)a6
{
  id v10 = a3;
  uint64_t v13 = objc_msgSend_activeStoreAccount(self, v11, v12);
  uint64_t v16 = objc_msgSend_ams_DSID(v13, v14, v15);

  if (v10) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 0;
  }
  BOOL v19 = v18;
  if (a5) {
    *a5 = v19;
  }
  if (v10) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = v16 == 0;
  }
  BOOL v21 = !v20;
  if (a4) {
    *a4 = v21;
  }
  LOBYTE(v22) = 0;
  if (v10 && v16) {
    int v22 = objc_msgSend_isEqualToNumber_(v10, v17, (uint64_t)v16) ^ 1;
  }
  if (a6) {
    *a6 = v22;
  }
  char v23 = (v19 || v21) | v22;

  return v23;
}

- (void)updateLastUsedStoreAccountID
{
  uint64_t v3 = objc_msgSend_activeStoreAccount(self, a2, v2);
  objc_msgSend_ams_DSID(v3, v4, v5);
  id v10 = (char *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v6, v7);
  uint64_t v9 = v8;
  if (v10) {
    objc_msgSend_setObject_forKey_(v8, v10, (uint64_t)v10, @"BKPreviousUserId");
  }
  else {
    objc_msgSend_removeObjectForKey_(v8, 0, @"BKPreviousUserId");
  }
}

- (void)clearLastUsedStoreAccountID
{
  objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, v2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v4, v3, @"BKPreviousUserId");
}

- (void)removeObserver:(id)a3 accountTypes:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  objc_initWeak(&location, self);
  if ((v4 & 1) != 0 && !objc_msgSend__removeObserver_forAccountType_(self, v7, (uint64_t)v6, 1))
  {
    notifyQueue = self->_notifyQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = sub_21E1E5B2C;
    v12[3] = &unk_26449E230;
    objc_copyWeak(&v13, &location);
    dispatch_async(notifyQueue, v12);
    objc_destroyWeak(&v13);
    if ((v4 & 2) == 0) {
      goto LABEL_7;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_7;
  }
  if (!objc_msgSend__removeObserver_forAccountType_(self, v7, (uint64_t)v6, 2))
  {
    uint64_t v8 = self->_notifyQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E1E5B70;
    block[3] = &unk_26449E230;
    objc_copyWeak(&v11, &location);
    dispatch_async(v8, block);
    objc_destroyWeak(&v11);
  }
LABEL_7:
  objc_destroyWeak(&location);
}

- (void)observeTCCAccessChangeNotificationIfNeeded
{
  if (objc_msgSend_hasCloudKitEntitlement(self, a2, v2))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_21E1E5C80;
    v5[3] = &unk_26449D948;
    v5[4] = self;
    os_unfair_lock_lock(&self->_tccObserverLock);
    sub_21E1E5C80((uint64_t)v5);
    os_unfair_lock_unlock(&self->_tccObserverLock);
  }
  else
  {
    char v4 = BookUtilityLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_21E1F2094();
    }
  }
}

- (void)ubiquityIdentityDidChange
{
  notifyQueue = self->_notifyQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1E5E9C;
  block[3] = &unk_26449D948;
  void block[4] = self;
  dispatch_sync(notifyQueue, block);
}

- (BOOL)hasCloudKitEntitlement
{
  if (qword_26AB40500 != -1) {
    dispatch_once(&qword_26AB40500, &unk_26CF10BF8);
  }
  return byte_26AB404F8;
}

- (void)nq_resetStoreAccountCachedValues
{
  p_storeAccountCacheLock = &self->_storeAccountCacheLock;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_21E1E6078;
  v3[3] = &unk_26449D948;
  v3[4] = self;
  os_unfair_lock_lock_with_options();
  ((void (*)(void *))sub_21E1E6078)(v3);
  os_unfair_lock_unlock(p_storeAccountCacheLock);
}

- (void)nq_resetAppleAccountCachedValues
{
  p_appleAccountCacheLock = &self->_appleAccountCacheLock;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_21E1E6158;
  v3[3] = &unk_26449D948;
  v3[4] = self;
  os_unfair_lock_lock_with_options();
  sub_21E1E6158((uint64_t)v3);
  os_unfair_lock_unlock(p_appleAccountCacheLock);
}

- (int64_t)_removeObserver:(id)a3 forAccountType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  p_observersLock = &self->_observersLock;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  id v13 = (void (*)(void *))sub_21E1E62F8;
  uint64_t v14 = &unk_26449E2A8;
  uint64_t v15 = self;
  unint64_t v18 = a4;
  id v8 = v6;
  id v16 = v8;
  int v17 = &v19;
  uint64_t v9 = v12;
  os_unfair_lock_lock_with_options();
  v13(v9);
  os_unfair_lock_unlock(p_observersLock);

  int64_t v10 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v10;
}

- (id)_observersForAccountType:(unint64_t)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_21E1E4C84;
  int v17 = sub_21E1E4C94;
  id v18 = 0;
  p_observersLock = &self->_observersLock;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v8 = (void (*)(void *))sub_21E1E64C8;
  uint64_t v9 = &unk_26449E2D0;
  int64_t v10 = self;
  id v11 = &v13;
  unint64_t v12 = a3;
  char v4 = v7;
  os_unfair_lock_lock_with_options();
  v8(v4);
  os_unfair_lock_unlock(p_observersLock);

  id v5 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v5;
}

- (void)_unregisterNotificationForAccountType:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v13 = objc_msgSend_appleAccountDidChangeNotificationRegisteredToken(self, a2, 2);

    if (v13)
    {
      id v16 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v14, v15);
      uint64_t v19 = objc_msgSend_appleAccountDidChangeNotificationRegisteredToken(self, v17, v18);
      BOOL v20 = sub_21E1D7B10();
      objc_msgSend_removeObserver_name_object_(v16, v21, (uint64_t)v19, v20, 0);

      objc_msgSend_setAppleAccountDidChangeNotificationRegisteredToken_(self, v22, 0);
    }
  }
  else if (a3 == 1)
  {
    char v4 = objc_msgSend_storeAccountDidChangeNotificationRegisteredToken(self, a2, 1);

    if (v4)
    {
      uint64_t v7 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v5, v6);
      int64_t v10 = objc_msgSend_storeAccountDidChangeNotificationRegisteredToken(self, v8, v9);
      objc_msgSend_removeObserver_name_object_(v7, v11, (uint64_t)v10, *MEMORY[0x263EFAE28], 0);

      objc_msgSend_setStoreAccountDidChangeNotificationRegisteredToken_(self, v12, 0);
    }
  }
}

- (void)_didReceiveNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  notifyQueue = self->_notifyQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1E6830;
  block[3] = &unk_26449E258;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notifyQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)nq_teardownNotifyBlockForAccountType:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notifyQueue);
  if (!objc_msgSend__observerCountForAccountType_(self, v5, a3))
  {
    notifyBlocks = self->_notifyBlocks;
    id v8 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v6, a3);
    int64_t v10 = objc_msgSend_objectForKeyedSubscript_(notifyBlocks, v9, (uint64_t)v8);

    if (v10)
    {
      unint64_t v12 = self->_notifyBlocks;
      uint64_t v13 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v11, a3);
      objc_msgSend_removeObjectForKey_(v12, v14, (uint64_t)v13);

      accountIdentifiers = self->_accountIdentifiers;
      objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, a3);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectForKey_(accountIdentifiers, v17, (uint64_t)v18);
    }
  }
}

- (void)nq_updateAccountIdentifierAndNotifyObserversForAccountType:(unint64_t)a3
{
  if (a3 == 2)
  {
    objc_msgSend_nq_resetAppleAccountCachedValues(self, a2, 2);
    MEMORY[0x270F9A6D0](self, sel_nq_updateiCloudAccountIdentifierAndNotifyObservers, v5);
  }
  else if (a3 == 1)
  {
    objc_msgSend_nq_resetStoreAccountCachedValues(self, a2, 1);
    MEMORY[0x270F9A6D0](self, sel_nq_updateiTunesAccountIdentifierAndNotifyObservers, v4);
  }
}

- (void)nq_updateiTunesAccountIdentifierAndNotifyObservers
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_notifyQueue(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  id v6 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v5, 1);
  id v9 = objc_msgSend_accountIdentifiers(self, v7, v8);
  id v11 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v6);

  uint64_t v14 = objc_msgSend_activeStoreAccount(self, v12, v13);
  int v17 = objc_msgSend_ams_DSID(v14, v15, v16);

  if (v11 == v17 || (objc_msgSend_isEqual_(v11, v18, (uint64_t)v17) & 1) != 0)
  {
    uint64_t v20 = 0;
  }
  else
  {
    if (v11 && v17)
    {
      uint64_t v20 = 102;
    }
    else if (v11 || !v17)
    {
      if (v17) {
        BOOL v21 = 1;
      }
      else {
        BOOL v21 = v11 == 0;
      }
      if (v21) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = 101;
      }
    }
    else
    {
      uint64_t v20 = 100;
    }
    uint64_t v22 = objc_msgSend_accountIdentifiers(self, v18, v19);
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v17, v6);
  }
  v24 = objc_msgSend__observersForAccountType_(self, v18, 1);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v31, v35, 16);
  if (v26)
  {
    uint64_t v28 = v26;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend_account_didChangeWithReason_(*(void **)(*((void *)&v31 + 1) + 8 * i), v27, 1, v20);
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v31, v35, 16);
    }
    while (v28);
  }
}

- (void)nq_updateiCloudAccountIdentifierAndNotifyObservers
{
  uint64_t v4 = objc_msgSend_notifyQueue(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = self->_notifyQueue;
  objc_initWeak(&location, self);
  if (objc_msgSend_hasCloudKitEntitlement(self, v6, v7)
    && objc_msgSend__observerCountForAccountType_(self, v8, 2) >= 1)
  {
    sub_21E1D7894();
    id v9 = objc_opt_class();
    unint64_t v12 = objc_msgSend_defaultContainer(v9, v10, v11);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_21E1E6FB8;
    v14[3] = &unk_26449E3C0;
    uint64_t v15 = v5;
    objc_copyWeak(&v17, &location);
    uint64_t v16 = self;
    objc_msgSend_fetchUserRecordIDWithCompletionHandler_(v12, v13, (uint64_t)v14);

    objc_destroyWeak(&v17);
  }
  objc_destroyWeak(&location);
}

- (unint64_t)_singleAccountTypeForNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v6 = objc_msgSend_name(v3, v4, v5);
  if (objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x263EFAE28]))
  {
    int64_t v10 = objc_msgSend_userInfo(v3, v8, v9);
    unint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x263EFAF38]);

    if (v12 && !objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x263EFB000]))
    {
      unint64_t v15 = 0;
    }
    else
    {
      uint64_t v14 = BookUtilityLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        BOOL v21 = v12;
        _os_log_impl(&dword_21E1C7000, v14, OS_LOG_TYPE_INFO, "ACAccountStoreDidChangeNotification account type identifier is '%@', treat it as if there was an iTunes account change", (uint8_t *)&v20, 0xCu);
      }

      unint64_t v15 = 1;
    }
  }
  else
  {
    uint64_t v16 = sub_21E1D7B10();
    int isEqualToString = objc_msgSend_isEqualToString_(v6, v17, (uint64_t)v16);

    if (isEqualToString) {
      unint64_t v15 = 2;
    }
    else {
      unint64_t v15 = 0;
    }
  }

  return v15;
}

- (void)setPrimaryAppleAccount:(id)a3
{
}

- (void)setActiveStoreAccount:(id)a3
{
}

- (void)setLocalStoreAccount:(id)a3
{
}

- (NSObject)appleAccountDidChangeNotificationRegisteredToken
{
  return self->_appleAccountDidChangeNotificationRegisteredToken;
}

- (void)setAppleAccountDidChangeNotificationRegisteredToken:(id)a3
{
}

- (int)tccObserverToken
{
  return self->_tccObserverToken;
}

- (void)setTccObserverToken:(int)a3
{
  self->_tccObserverToken = a3;
}

- (void)setCachedIsPrimaryAccountManagedAppleID:(id)a3
{
}

- (void)setCachedIsStoreAccountManagedAppleID:(id)a3
{
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
}

- (NSMutableDictionary)notifyBlocks
{
  return self->_notifyBlocks;
}

- (void)setNotifyBlocks:(id)a3
{
}

- (NSMutableDictionary)observerHashTables
{
  return self->_observerHashTables;
}

- (void)setObserverHashTables:(id)a3
{
}

- (NSMutableDictionary)accountIdentifiers
{
  return self->_accountIdentifiers;
}

- (void)setAccountIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifiers, 0);
  objc_storeStrong((id *)&self->_observerHashTables, 0);
  objc_storeStrong((id *)&self->_notifyBlocks, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_cachedIsStoreAccountManagedAppleID, 0);
  objc_storeStrong((id *)&self->_cachedIsPrimaryAccountManagedAppleID, 0);
  objc_storeStrong((id *)&self->_storeAccountDidChangeNotificationRegisteredToken, 0);
  objc_storeStrong((id *)&self->_appleAccountDidChangeNotificationRegisteredToken, 0);
  objc_storeStrong((id *)&self->_localStoreAccount, 0);
  objc_storeStrong((id *)&self->_activeStoreAccount, 0);

  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
}

@end