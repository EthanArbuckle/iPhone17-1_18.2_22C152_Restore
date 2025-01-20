@interface NCABTinkerContactsManagementStateManager
+ (BOOL)_familyMemberIsEligibleForScreenTime:(id)a3;
+ (id)managerForBuddyControllerDelegate:(id)a3;
- (BOOL)_checkContactsCountStatusNotYetSyncedTimedOut;
- (BOOL)_shouldRunAgainAfterSyncEnabled_LOCKED;
- (BOOL)autoEnableContactsManagement;
- (BOOL)contactsSyncAndNetworkAccessEnabled;
- (BOOL)extendedFamilyMemberContactsSyncTimeout;
- (FAFamilyMember)familyMember;
- (NCABTinkerContactsManagementStateManager)initWithFamilyMember:(id)a3 autoEnableIfPossible:(BOOL)a4;
- (NSDate)contactsCountSyncStatusRetryTimeoutDate;
- (NSTimer)contactsCountSyncStatusRetryTimeoutTimer;
- (NSTimer)contactsCountSyncStatusRetryTimer;
- (STManagementState)stManagementState;
- (double)contactsCountSyncStatusRetryTimeoutInterval;
- (int)contactsCountStatus;
- (int)lastKnownContactsManagementState;
- (void)__contactStoreDidChange:(id)a3;
- (void)__contactsSyncRetryNow;
- (void)__contactsSyncRetryTimer:(id)a3;
- (void)__contactsSyncTimeoutTimer:(id)a3;
- (void)_addFetchCompletionHandler:(id)a3;
- (void)_enableContactsManagementForFamilyMember:(id)a3 request:(BOOL)a4 completionHandler:(id)a5;
- (void)_fetchContactsCountStatusWithDeterminedStatusHandler:(id)a3 notTryingToSyncHandler:(id)a4 syncTimedOutHandler:(id)a5;
- (void)_fetchContactsManagementState;
- (void)_installContactsCountRetryAndTimeoutHandlers;
- (void)_processSTContactManagementState:(int64_t)a3 familyMember:(id)a4 error:(id)a5;
- (void)_removeContactsCountRetryAndTimeoutHandlers;
- (void)_removeContactsCountRetryAndTimeoutHandlers_SYNC;
- (void)_runCompletionHandlersWithContactsManagementState:(int)a3 error:(id)a4;
- (void)_setContactsManagementStateFromContactsCountStatus:(int)a3;
- (void)_startFetchingContactsManagementState;
- (void)_updateContactsManagementState:(int)a3 error:(id)a4;
- (void)_waitOnContactsSyncWithRetries;
- (void)dealloc;
- (void)fetchContactsManagementStateWithCompletionHandler:(id)a3;
- (void)requestContactsManagementForFamilyMember:(id)a3 completionHandler:(id)a4;
- (void)setContactsCountSyncStatusRetryTimeoutDate:(id)a3;
- (void)setContactsCountSyncStatusRetryTimeoutInterval:(double)a3;
- (void)setContactsCountSyncStatusRetryTimeoutTimer:(id)a3;
- (void)setContactsCountSyncStatusRetryTimer:(id)a3;
- (void)setContactsSyncAndNetworkAccessEnabled:(BOOL)a3;
- (void)setExtendedFamilyMemberContactsSyncTimeout:(BOOL)a3;
- (void)setStManagementState:(id)a3;
@end

@implementation NCABTinkerContactsManagementStateManager

+ (id)managerForBuddyControllerDelegate:(id)a3
{
  v3 = (NCABTinkerContactsManagementStateManager *)a3;
  v4 = [(NCABTinkerContactsManagementStateManager *)v3 setupFlowUserInfo];
  v5 = [v4 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

  objc_getAssociatedObject(v3, "managerForBuddyControllerDelegate:");
  v6 = (NCABTinkerContactsManagementStateManager *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    v8 = [(NCABTinkerContactsManagementStateManager *)v6 familyMember];

    v9 = NCABCMS_Accounts_log();
    v10 = v9;
    if (v8 != v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_6BBC(v7, (uint64_t)v5, v10);
      }
      goto LABEL_14;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    int v15 = 136446978;
    v16 = "+[NCABTinkerContactsManagementStateManager managerForBuddyControllerDelegate:]";
    __int16 v17 = 2112;
    v18 = v7;
    __int16 v19 = 2112;
    v20 = v5;
    __int16 v21 = 2112;
    v22 = v3;
    v11 = "%{public}s - Fetched existing tinkerContactsManagementStateManager: %@ for familyMember: %@, from delegate: %@";
    v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
LABEL_10:
    _os_log_impl(&dword_0, v12, v13, v11, (uint8_t *)&v15, 0x2Au);
    goto LABEL_14;
  }
  if (v5)
  {
    v7 = [[NCABTinkerContactsManagementStateManager alloc] initWithFamilyMember:v5 autoEnableIfPossible:1];
    objc_setAssociatedObject(v3, "managerForBuddyControllerDelegate:", v7, (char *)&dword_0 + 1);
    v10 = NCABCMS_Accounts_log();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v15 = 136446978;
    v16 = "+[NCABTinkerContactsManagementStateManager managerForBuddyControllerDelegate:]";
    __int16 v17 = 2112;
    v18 = v7;
    __int16 v19 = 2112;
    v20 = v5;
    __int16 v21 = 2112;
    v22 = v3;
    v11 = "%{public}s - Created tinkerContactsManagementStateManager: %@ for familyMember: %@, attached to delegate: %@";
    v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_10;
  }
  v10 = NCABCMS_Accounts_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136446466;
    v16 = "+[NCABTinkerContactsManagementStateManager managerForBuddyControllerDelegate:]";
    __int16 v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s - Deferring creation of tinkerContactsManagementStateManager (no familyMember); delegate: %@",
      (uint8_t *)&v15,
      0x16u);
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (NCABTinkerContactsManagementStateManager)initWithFamilyMember:(id)a3 autoEnableIfPossible:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NCABTinkerContactsManagementStateManager;
  v8 = [(NCABTinkerContactsManagementStateManager *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_familyMember, a3);
    uint64_t v10 = objc_opt_new();
    stManagementState = v9->_stManagementState;
    v9->_stManagementState = (STManagementState *)v10;

    v9->_autoEnableContactsManagement = a4;
    v9->_completionHandlersLock._os_unfair_lock_opaque = 0;
    v9->_stateLock._os_unfair_lock_opaque = 0;
    [(NCABTinkerContactsManagementStateManager *)v9 setExtendedFamilyMemberContactsSyncTimeout:0];
    +[NCABContactsSyncHelper triggerContactsSyncForFamilyMember:v9->_familyMember];
  }

  return v9;
}

- (void)dealloc
{
  [(NCABTinkerContactsManagementStateManager *)self _removeContactsCountRetryAndTimeoutHandlers_SYNC];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NCABTinkerContactsManagementStateManager;
  [(NCABTinkerContactsManagementStateManager *)&v4 dealloc];
}

- (void)setExtendedFamilyMemberContactsSyncTimeout:(BOOL)a3
{
  BOOL v3 = a3;
  self->_extendedFamilyMemberContactsSyncTimeout = a3;
  double v5 = 120.0;
  if (a3) {
    double v5 = 300.0;
  }
  [(NCABTinkerContactsManagementStateManager *)self setContactsCountSyncStatusRetryTimeoutInterval:v5];
  v6 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [(NCABTinkerContactsManagementStateManager *)self contactsCountSyncStatusRetryTimeoutInterval];
    int v8 = 136446722;
    v9 = "-[NCABTinkerContactsManagementStateManager setExtendedFamilyMemberContactsSyncTimeout:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: %d - updated contactsCountSyncStatusRetryTimeoutInterval => %0.1f", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)fetchContactsManagementStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  double v5 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 136446466;
    v28 = "-[NCABTinkerContactsManagementStateManager fetchContactsManagementStateWithCompletionHandler:]";
    __int16 v29 = 2114;
    id v30 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%{public}s: %{public}@", buf, 0x16u);
  }
  if (!v4)
  {
    int v8 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_6C7C(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_11;
  }
  uint64_t v7 = [(NCABTinkerContactsManagementStateManager *)self familyMember];

  if (!v7)
  {
    v16 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_6CF4(v16, v17, v18, v19, v20, v21, v22, v23);
    }

    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"No familyMember";
    v24 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    int v8 = +[NSError errorWithDomain:@"NCABErrorDomain" code:1 userInfo:v24];

    (*((void (**)(id, void, NSObject *))v4 + 2))(v4, 0, v8);
LABEL_11:

    goto LABEL_12;
  }
  [(NCABTinkerContactsManagementStateManager *)self _addFetchCompletionHandler:v4];
  [(NCABTinkerContactsManagementStateManager *)self _fetchContactsManagementState];
LABEL_12:
}

- (int)lastKnownContactsManagementState
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LODWORD(v2) = v2->_contactsManagementState;
  os_unfair_lock_unlock(p_stateLock);
  return (int)v2;
}

- (void)requestContactsManagementForFamilyMember:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446466;
    uint64_t v11 = "-[NCABTinkerContactsManagementStateManager requestContactsManagementForFamilyMember:completionHandler:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = [(NCABTinkerContactsManagementStateManager *)self familyMember];
  [(NCABTinkerContactsManagementStateManager *)self _enableContactsManagementForFamilyMember:v9 request:1 completionHandler:v7];
}

- (int)contactsCountStatus
{
  p_contactsCountStatus = &self->_contactsCountStatus;
  if (self->_contactsCountStatus <= 3u)
  {
    id v4 = [(NCABTinkerContactsManagementStateManager *)self familyMember];
    self->_contactsCountStatus = +[NCABContactsSyncHelper contactsCountStatusForFamilyMember:v4 contactsSyncAndNetworkAccessEnabled:[(NCABTinkerContactsManagementStateManager *)self contactsSyncAndNetworkAccessEnabled]];

    double v5 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *p_contactsCountStatus;
      int v9 = 136446466;
      int v10 = "-[NCABTinkerContactsManagementStateManager contactsCountStatus]";
      __int16 v11 = 1024;
      int v12 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - fetched contactsCountStatus:%d", (uint8_t *)&v9, 0x12u);
    }
  }
  id v7 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_6D6C();
  }

  return *p_contactsCountStatus;
}

- (void)_addFetchCompletionHandler:(id)a3
{
  id v9 = a3;
  p_completionHandlersLock = &self->_completionHandlersLock;
  os_unfair_lock_lock(&self->_completionHandlersLock);
  completionHandlersArray = self->_completionHandlersArray;
  if (!completionHandlersArray)
  {
    int v6 = +[NSMutableArray array];
    id v7 = self->_completionHandlersArray;
    self->_completionHandlersArray = v6;

    completionHandlersArray = self->_completionHandlersArray;
  }
  id v8 = objc_retainBlock(v9);
  [(NSMutableArray *)completionHandlersArray addObject:v8];

  os_unfair_lock_unlock(p_completionHandlersLock);
}

- (void)_runCompletionHandlersWithContactsManagementState:(int)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v20 = "-[NCABTinkerContactsManagementStateManager _runCompletionHandlersWithContactsManagementState:error:]";
    __int16 v21 = 1024;
    int v22 = a3;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s - managementState: %d, error: %{public}@", buf, 0x1Cu);
  }

  os_unfair_lock_lock(&self->_completionHandlersLock);
  id v8 = [(NSMutableArray *)self->_completionHandlersArray copy];
  [(NSMutableArray *)self->_completionHandlersArray removeAllObjects];
  os_unfair_lock_unlock(&self->_completionHandlersLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13));
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)_updateContactsManagementState:(int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v28 = "-[NCABTinkerContactsManagementStateManager _updateContactsManagementState:error:]";
    __int16 v29 = 1024;
    int v30 = v4;
    __int16 v31 = 2114;
    v32[0] = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: %d, error: %{public}@", buf, 0x1Cu);
  }

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if ((self->_contactsManagementRequestState - 1) >= 3)
  {
    __int16 v21 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_6E68();
    }

    os_unfair_lock_unlock(p_stateLock);
  }
  else
  {
    if (v4 == 2
      && [(NCABTinkerContactsManagementStateManager *)self autoEnableContactsManagement])
    {
      if (self->_contactsManagementRequestState == 3)
      {
        id v9 = NCABCMS_Tinker_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_6DF0(v9, v10, v11, v12, v13, v14, v15, v16);
        }

        NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
        CFStringRef v34 = @"Couldn't auto-enable contacts management";
        long long v17 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        uint64_t v18 = +[NSError errorWithDomain:@"NCABErrorDomain" code:2 userInfo:v17];

        int v19 = 4;
        int v20 = 1;
        id v6 = (id)v18;
      }
      else
      {
        int v20 = 0;
        int v19 = 3;
      }
    }
    else
    {
      int v19 = 4;
      int v20 = 1;
    }
    self->_contactsManagementRequestState = v19;
    self->_contactsManagementState = v4;
    objc_storeStrong((id *)&self->_contactsManagementFetchError, v6);
    int v22 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v28 = "-[NCABTinkerContactsManagementStateManager _updateContactsManagementState:error:]";
      __int16 v29 = 1024;
      int v30 = v19;
      __int16 v31 = 1024;
      LODWORD(v32[0]) = v4;
      WORD2(v32[0]) = 2114;
      *(void *)((char *)v32 + 6) = v6;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}s: newRequestState: %d, newManagementState: %d, error: %{public}@", buf, 0x22u);
    }

    os_unfair_lock_unlock(&self->_stateLock);
    if (v20)
    {
      [(NCABTinkerContactsManagementStateManager *)self _runCompletionHandlersWithContactsManagementState:v4 error:v6];
    }
    else
    {
      objc_initWeak((id *)buf, self);
      __int16 v23 = [(NCABTinkerContactsManagementStateManager *)self familyMember];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_322C;
      v24[3] = &unk_C348;
      objc_copyWeak(&v25, (id *)buf);
      int v26 = v4;
      [(NCABTinkerContactsManagementStateManager *)self _enableContactsManagementForFamilyMember:v23 request:0 completionHandler:v24];

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_processSTContactManagementState:(int64_t)a3 familyMember:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v24 = "-[NCABTinkerContactsManagementStateManager _processSTContactManagementState:familyMember:error:]";
    __int16 v25 = 2048;
    int64_t v26 = a3;
    __int16 v27 = 2114;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s - stContactManagementState: %lld, error: %{public}@ for familyMember: %@ -  ", buf, 0x2Au);
  }

  switch(a3)
  {
    case 2:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_3744;
      v16[3] = &unk_C370;
      v16[4] = self;
      v14[4] = self;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_3754;
      v15[3] = &unk_C398;
      v15[4] = self;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_3764;
      v14[3] = &unk_C398;
      uint64_t v11 = v16;
      uint64_t v12 = v15;
      uint64_t v13 = v14;
LABEL_10:
      [(NCABTinkerContactsManagementStateManager *)self _fetchContactsCountStatusWithDeterminedStatusHandler:v11 notTryingToSyncHandler:v12 syncTimedOutHandler:v13];
      break;
    case 1:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_3714;
      v19[3] = &unk_C370;
      v19[4] = self;
      v17[4] = self;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_3724;
      v18[3] = &unk_C398;
      v18[4] = self;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_3734;
      v17[3] = &unk_C398;
      uint64_t v11 = v19;
      uint64_t v12 = v18;
      uint64_t v13 = v17;
      goto LABEL_10;
    case 0:
      if (([(id)objc_opt_class() _familyMemberIsEligibleForScreenTime:v8] & 1) == 0)
      {
        [(NCABTinkerContactsManagementStateManager *)self _updateContactsManagementState:1 error:0];
        break;
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_36E8;
      v22[3] = &unk_C370;
      v22[4] = self;
      v20[4] = self;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_36F4;
      v21[3] = &unk_C398;
      v21[4] = self;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_3704;
      v20[3] = &unk_C398;
      uint64_t v11 = v22;
      uint64_t v12 = v21;
      uint64_t v13 = v20;
      goto LABEL_10;
  }
}

- (void)_setContactsManagementStateFromContactsCountStatus:(int)a3
{
  double v5 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[NCABTinkerContactsManagementStateManager _setContactsManagementStateFromContactsCountStatus:]";
    __int16 v8 = 1024;
    int v9 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: %d", (uint8_t *)&v6, 0x12u);
  }

  if ((a3 - 3) <= 2) {
    [(NCABTinkerContactsManagementStateManager *)self _updateContactsManagementState:dword_87D8[a3 - 3] error:0];
  }
}

- (void)_fetchContactsCountStatusWithDeterminedStatusHandler:(id)a3 notTryingToSyncHandler:(id)a4 syncTimedOutHandler:(id)a5
{
  id v8 = a3;
  int v9 = (void (**)(void))a4;
  uint64_t v10 = (void (**)(void))a5;
  unsigned int v11 = [(NCABTinkerContactsManagementStateManager *)self contactsSyncAndNetworkAccessEnabled];
  uint64_t v12 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_retainBlock(v8);
    uint64_t v14 = objc_retainBlock(v9);
    uint64_t v15 = objc_retainBlock(v10);
    int v26 = 136447234;
    __int16 v27 = "-[NCABTinkerContactsManagementStateManager _fetchContactsCountStatusWithDeterminedStatusHandler:notTryingToSyn"
          "cHandler:syncTimedOutHandler:]";
    __int16 v28 = 2048;
    *(void *)__int16 v29 = v13;
    *(_WORD *)&v29[8] = 2048;
    *(void *)&v29[10] = v14;
    __int16 v30 = 2048;
    __int16 v31 = v15;
    __int16 v32 = 1024;
    unsigned int v33 = v11;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}s :%p:%p:%p - syncEnabled:%d", (uint8_t *)&v26, 0x30u);
  }
  if (v11)
  {
    uint64_t v16 = [(NCABTinkerContactsManagementStateManager *)self contactsCountStatus];
    long long v17 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v26 = 136446722;
      __int16 v27 = "-[NCABTinkerContactsManagementStateManager _fetchContactsCountStatusWithDeterminedStatusHandler:notTryingToS"
            "yncHandler:syncTimedOutHandler:]";
      __int16 v28 = 1024;
      *(_DWORD *)__int16 v29 = v16;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v16 == 2;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "%{public}s - contactsCountStatus:%d => waitingOnContactsSync:%d", (uint8_t *)&v26, 0x18u);
    }

    if (v16 == 2)
    {
      unsigned int v18 = [(NCABTinkerContactsManagementStateManager *)self _checkContactsCountStatusNotYetSyncedTimedOut];
      int v19 = NCABCMS_Tinker_log();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v20)
        {
          __int16 v21 = objc_retainBlock(v10);
          int v26 = 136446466;
          __int16 v27 = "-[NCABTinkerContactsManagementStateManager _fetchContactsCountStatusWithDeterminedStatusHandler:notTryin"
                "gToSyncHandler:syncTimedOutHandler:]";
          __int16 v28 = 2048;
          *(void *)__int16 v29 = v21;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}s timedOut => syncTimedOutHandler():%p", (uint8_t *)&v26, 0x16u);
        }
        if (v10) {
          v10[2](v10);
        }
      }
      else
      {
        if (v20)
        {
          int v26 = 136446210;
          __int16 v27 = "-[NCABTinkerContactsManagementStateManager _fetchContactsCountStatusWithDeterminedStatusHandler:notTryin"
                "gToSyncHandler:syncTimedOutHandler:]";
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}s waiting to sync => _waitOnContactsSyncWithRetries", (uint8_t *)&v26, 0xCu);
        }

        [(NCABTinkerContactsManagementStateManager *)self _waitOnContactsSyncWithRetries];
      }
    }
    else
    {
      id v24 = NCABCMS_Tinker_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = objc_retainBlock(v8);
        int v26 = 136446722;
        __int16 v27 = "-[NCABTinkerContactsManagementStateManager _fetchContactsCountStatusWithDeterminedStatusHandler:notTryingT"
              "oSyncHandler:syncTimedOutHandler:]";
        __int16 v28 = 1024;
        *(_DWORD *)__int16 v29 = v16;
        *(_WORD *)&v29[4] = 2048;
        *(void *)&v29[6] = v25;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "%{public}s => determinedStatusHandler(%d):%p", (uint8_t *)&v26, 0x1Cu);
      }
      if (v8) {
        (*((void (**)(id, uint64_t))v8 + 2))(v8, v16);
      }
    }
  }
  else
  {
    int v22 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = objc_retainBlock(v9);
      int v26 = 136446466;
      __int16 v27 = "-[NCABTinkerContactsManagementStateManager _fetchContactsCountStatusWithDeterminedStatusHandler:notTryingToS"
            "yncHandler:syncTimedOutHandler:]";
      __int16 v28 = 2048;
      *(void *)__int16 v29 = v23;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}s !syncEnabled => notTryingToSyncHandler():%p", (uint8_t *)&v26, 0x16u);
    }
    if (v9) {
      v9[2](v9);
    }
  }
}

- (BOOL)_checkContactsCountStatusNotYetSyncedTimedOut
{
  BOOL v3 = [(NCABTinkerContactsManagementStateManager *)self contactsCountSyncStatusRetryTimeoutDate];

  if (!v3)
  {
    [(NCABTinkerContactsManagementStateManager *)self contactsCountSyncStatusRetryTimeoutInterval];
    uint64_t v4 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
    [(NCABTinkerContactsManagementStateManager *)self setContactsCountSyncStatusRetryTimeoutDate:v4];

    double v5 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(NCABTinkerContactsManagementStateManager *)self contactsCountSyncStatusRetryTimeoutDate];
      int v13 = 136446466;
      uint64_t v14 = "-[NCABTinkerContactsManagementStateManager _checkContactsCountStatusNotYetSyncedTimedOut]";
      __int16 v15 = 2114;
      uint64_t v16 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - set contactsCountSyncStatusRetryTimeoutDate:%{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  id v7 = [(NCABTinkerContactsManagementStateManager *)self contactsCountSyncStatusRetryTimeoutDate];
  [v7 timeIntervalSinceNow];
  double v9 = v8;

  uint64_t v10 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [(NCABTinkerContactsManagementStateManager *)self contactsCountSyncStatusRetryTimeoutDate];
    int v13 = 136446978;
    uint64_t v14 = "-[NCABTinkerContactsManagementStateManager _checkContactsCountStatusNotYetSyncedTimedOut]";
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    double v18 = v9;
    __int16 v19 = 1024;
    BOOL v20 = v9 < 0.0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s - contactsCountSyncStatusRetryTimeoutDate:%{public}@ remainingTimeoutSeconds:%0.2f => timedOut:%d", (uint8_t *)&v13, 0x26u);
  }
  return v9 < 0.0;
}

- (void)_waitOnContactsSyncWithRetries
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_contactsManagementRequestState = 2;
  os_unfair_lock_unlock(p_stateLock);
  [(NCABTinkerContactsManagementStateManager *)self _installContactsCountRetryAndTimeoutHandlers];
  id v4 = +[NCABContactsSyncHelper localDeviceContactsCount];
}

- (void)_installContactsCountRetryAndTimeoutHandlers
{
  BOOL v3 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    int v6 = "-[NCABTinkerContactsManagementStateManager _installContactsCountRetryAndTimeoutHandlers]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3F8C;
  block[3] = &unk_C398;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_removeContactsCountRetryAndTimeoutHandlers_SYNC
{
  BOOL v3 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    double v8 = "-[NCABTinkerContactsManagementStateManager _removeContactsCountRetryAndTimeoutHandlers_SYNC]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:CNContactStoreDidChangeNotification object:0];

  [(NSTimer *)self->_contactsCountSyncStatusRetryTimeoutTimer invalidate];
  contactsCountSyncStatusRetryTimeoutTimer = self->_contactsCountSyncStatusRetryTimeoutTimer;
  self->_contactsCountSyncStatusRetryTimeoutTimer = 0;

  [(NSTimer *)self->_contactsCountSyncStatusRetryTimer invalidate];
  contactsCountSyncStatusRetryTimer = self->_contactsCountSyncStatusRetryTimer;
  self->_contactsCountSyncStatusRetryTimer = 0;
}

- (void)_removeContactsCountRetryAndTimeoutHandlers
{
  BOOL v3 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    int v6 = "-[NCABTinkerContactsManagementStateManager _removeContactsCountRetryAndTimeoutHandlers]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4474;
  block[3] = &unk_C398;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)__contactsSyncRetryNow
{
  p_contactsManagementRequestState = &self->_contactsManagementRequestState;
  if (self->_contactsManagementRequestState != 2)
  {
    id v4 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_6F8C(p_contactsManagementRequestState, (uint64_t)self, v4);
    }
  }
  [(NCABTinkerContactsManagementStateManager *)self _fetchContactsManagementState];
}

- (void)__contactsSyncTimeoutTimer:(id)a3
{
  id v4 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    int v6 = "-[NCABTinkerContactsManagementStateManager __contactsSyncTimeoutTimer:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  [(NCABTinkerContactsManagementStateManager *)self __contactsSyncRetryNow];
}

- (void)__contactsSyncRetryTimer:(id)a3
{
  id v4 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    int v6 = "-[NCABTinkerContactsManagementStateManager __contactsSyncRetryTimer:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  [(NCABTinkerContactsManagementStateManager *)self __contactsSyncRetryNow];
}

- (void)__contactStoreDidChange:(id)a3
{
  id v4 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    int v6 = "-[NCABTinkerContactsManagementStateManager __contactStoreDidChange:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  [(NCABTinkerContactsManagementStateManager *)self __contactsSyncRetryNow];
}

- (BOOL)_shouldRunAgainAfterSyncEnabled_LOCKED
{
  BOOL v3 = [(NCABTinkerContactsManagementStateManager *)self contactsSyncAndNetworkAccessEnabled];
  if (v3) {
    LOBYTE(v3) = (self->_contactsManagementState - 100) < 3;
  }
  return v3;
}

- (void)_fetchContactsManagementState
{
  BOOL v3 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136446210;
    __int16 v17 = "-[NCABTinkerContactsManagementStateManager _fetchContactsManagementState]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v16, 0xCu);
  }

  [(NCABTinkerContactsManagementStateManager *)self _removeContactsCountRetryAndTimeoutHandlers];
  os_unfair_lock_lock(&self->_stateLock);
  unsigned int v4 = [(NCABTinkerContactsManagementStateManager *)self _shouldRunAgainAfterSyncEnabled_LOCKED];
  int v5 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int contactsManagementRequestState = self->_contactsManagementRequestState;
    int contactsManagementState = self->_contactsManagementState;
    int v16 = 136446978;
    __int16 v17 = "-[NCABTinkerContactsManagementStateManager _fetchContactsManagementState]";
    __int16 v18 = 1024;
    int v19 = contactsManagementRequestState;
    __int16 v20 = 1024;
    int v21 = contactsManagementState;
    __int16 v22 = 1024;
    unsigned int v23 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - _contactsManagementRequestState: %d, _contactsManagementState: %d, shouldRunAgainAfterSyncEnabled: %d", (uint8_t *)&v16, 0x1Eu);
  }

  int v8 = self->_contactsManagementRequestState;
  if (v8 == 4) {
    char v9 = v4;
  }
  else {
    char v9 = 1;
  }
  if (v9)
  {
    if (!v8)
    {
LABEL_13:
      self->_int contactsManagementRequestState = 1;
      goto LABEL_14;
    }
    if (v8 == 2)
    {
LABEL_14:
      os_unfair_lock_unlock(&self->_stateLock);
      uint64_t v10 = NCABCMS_Tinker_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = self->_contactsManagementRequestState;
        int v16 = 136446466;
        __int16 v17 = "-[NCABTinkerContactsManagementStateManager _fetchContactsManagementState]";
        __int16 v18 = 1024;
        int v19 = v11;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s - starting fetch - _contactsManagementRequestState: %d", (uint8_t *)&v16, 0x12u);
      }

      [(NCABTinkerContactsManagementStateManager *)self _startFetchingContactsManagementState];
      return;
    }
    if (v4)
    {
      if ((v8 | 4) == 4) {
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    os_unfair_lock_unlock(&self->_stateLock);
    __int16 v15 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136446210;
      __int16 v17 = "-[NCABTinkerContactsManagementStateManager _fetchContactsManagementState]";
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}s - fetch already in progress; nothing to do",
        (uint8_t *)&v16,
        0xCu);
    }
  }
  else
  {
    uint64_t v12 = self->_contactsManagementState;
    int v13 = self->_contactsManagementFetchError;
    os_unfair_lock_unlock(&self->_stateLock);
    uint64_t v14 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136446210;
      __int16 v17 = "-[NCABTinkerContactsManagementStateManager _fetchContactsManagementState]";
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}s - sync running completion handlers", (uint8_t *)&v16, 0xCu);
    }

    [(NCABTinkerContactsManagementStateManager *)self _runCompletionHandlersWithContactsManagementState:v12 error:v13];
  }
}

- (void)_startFetchingContactsManagementState
{
  BOOL v3 = [(NCABTinkerContactsManagementStateManager *)self familyMember];
  unsigned int v4 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v12 = "-[NCABTinkerContactsManagementStateManager _startFetchingContactsManagementState]";
    __int16 v13 = 2112;
    uint64_t v14 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s - familyMember: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  int v5 = [(NCABTinkerContactsManagementStateManager *)self stManagementState];
  int v6 = [v3 dsid];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4BDC;
  v8[3] = &unk_C3C0;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = v3;
  id v9 = v7;
  [v5 contactManagementStateForDSID:v6 completionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)_enableContactsManagementForFamilyMember:(id)a3 request:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  uint64_t v10 = [(NCABTinkerContactsManagementStateManager *)self lastKnownContactsManagementState];
  int v11 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v24 = "-[NCABTinkerContactsManagementStateManager _enableContactsManagementForFamilyMember:request:completionHandler:]";
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 1024;
    unsigned int v28 = v6;
    __int16 v29 = 1024;
    LODWORD(v30) = v10;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: %@ request: %d lastKnownContactsManagementState: %d", buf, 0x22u);
  }

  unsigned int v12 = [(NCABTinkerContactsManagementStateManager *)self lastKnownContactsManagementState];
  if ((v12 > 5 || ((1 << v12) & 0x23) == 0) && v12 - 100 >= 3) {
    goto LABEL_14;
  }
  __int16 v13 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_702C(self, v13);
  }

  NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
  uint64_t v14 = +[NSString stringWithFormat:@"Attempted to enable contacts management from bad state: %d", v10];
  __int16 v32 = v14;
  __int16 v15 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  id v16 = +[NSError errorWithDomain:@"NCABErrorDomain" code:3 userInfo:v15];

  if (v16)
  {
    unsigned int v17 = 0;
  }
  else
  {
LABEL_14:
    int v19 = [(NCABTinkerContactsManagementStateManager *)self stManagementState];
    __int16 v20 = [v8 dsid];
    id v22 = 0;
    unsigned int v17 = [v19 enableScreenTimeForDSID:v20 error:&v22];
    id v16 = v22;

    if (v17 && !v16)
    {
      id v16 = [(NCABTinkerContactsManagementStateManager *)self stManagementState];
      int v21 = [v8 dsid];
      if (v6) {
        [v16 requestToManageContactsForDSID:v21 completionHandler:v9];
      }
      else {
        [v16 setManageContactsEnabled:1 forDSID:v21 completionHandler:v9];
      }

      goto LABEL_20;
    }
  }
  __int16 v18 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    id v24 = "-[NCABTinkerContactsManagementStateManager _enableContactsManagementForFamilyMember:request:completionHandler:]";
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 1024;
    unsigned int v28 = v17;
    __int16 v29 = 2114;
    id v30 = v16;
    _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "%{public}s - failed to enable Screen Time for family member: %@, enabledST: %d, error: %{public}@", buf, 0x26u);
  }

  v9[2](v9, v16);
LABEL_20:
}

+ (BOOL)_familyMemberIsEligibleForScreenTime:(id)a3
{
  id v3 = a3;
  unsigned int v4 = v3;
  if (v3) {
    BOOL v5 = [v3 memberType] == (char *)&dword_0 + 1
  }
      || [v4 memberType] == (char *)&dword_0 + 2;
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (BOOL)contactsSyncAndNetworkAccessEnabled
{
  return self->_contactsSyncAndNetworkAccessEnabled;
}

- (void)setContactsSyncAndNetworkAccessEnabled:(BOOL)a3
{
  self->_contactsSyncAndNetworkAccessEnabled = a3;
}

- (BOOL)extendedFamilyMemberContactsSyncTimeout
{
  return self->_extendedFamilyMemberContactsSyncTimeout;
}

- (STManagementState)stManagementState
{
  return self->_stManagementState;
}

- (void)setStManagementState:(id)a3
{
}

- (BOOL)autoEnableContactsManagement
{
  return self->_autoEnableContactsManagement;
}

- (double)contactsCountSyncStatusRetryTimeoutInterval
{
  return self->_contactsCountSyncStatusRetryTimeoutInterval;
}

- (void)setContactsCountSyncStatusRetryTimeoutInterval:(double)a3
{
  self->_contactsCountSyncStatusRetryTimeoutInterval = a3;
}

- (NSDate)contactsCountSyncStatusRetryTimeoutDate
{
  return self->_contactsCountSyncStatusRetryTimeoutDate;
}

- (void)setContactsCountSyncStatusRetryTimeoutDate:(id)a3
{
}

- (NSTimer)contactsCountSyncStatusRetryTimeoutTimer
{
  return self->_contactsCountSyncStatusRetryTimeoutTimer;
}

- (void)setContactsCountSyncStatusRetryTimeoutTimer:(id)a3
{
}

- (NSTimer)contactsCountSyncStatusRetryTimer
{
  return self->_contactsCountSyncStatusRetryTimer;
}

- (void)setContactsCountSyncStatusRetryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsCountSyncStatusRetryTimer, 0);
  objc_storeStrong((id *)&self->_contactsCountSyncStatusRetryTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_contactsCountSyncStatusRetryTimeoutDate, 0);
  objc_storeStrong((id *)&self->_stManagementState, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_contactsManagementFetchError, 0);

  objc_storeStrong((id *)&self->_completionHandlersArray, 0);
}

@end