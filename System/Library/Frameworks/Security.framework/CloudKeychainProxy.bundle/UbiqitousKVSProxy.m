@interface UbiqitousKVSProxy
+ (id)withAccount:(id)a3 store:(id)a4 lockMonitor:(id)a5 persistence:(id)a6;
- (BOOL)ensurePeerRegistration;
- (BOOL)ensurePeerRegistrationEnqueuedButNotStarted;
- (BOOL)hasPendingKey:(id)a3;
- (BOOL)hasPendingNonShadowSyncIDs;
- (BOOL)hasPendingShadowSyncIDs;
- (BOOL)hasPendingSyncIDs;
- (BOOL)hasSyncPendingFor:(id)a3;
- (BOOL)inCallout;
- (BOOL)seenKVSStoreChange;
- (BOOL)shadowEnsurePeerRegistration;
- (CKDAccount)account;
- (CKDLockMonitor)lockMonitor;
- (CKDStore)store;
- (NSDictionary)persistentData;
- (NSMutableArray)freshnessCompletions;
- (NSMutableSet)alwaysKeys;
- (NSMutableSet)firstUnlockKeys;
- (NSMutableSet)pendingKeys;
- (NSMutableSet)pendingSyncBackupPeerIDs;
- (NSMutableSet)pendingSyncPeerIDs;
- (NSMutableSet)shadowPendingKeys;
- (NSMutableSet)shadowPendingSyncBackupPeerIDs;
- (NSMutableSet)shadowPendingSyncPeerIDs;
- (NSMutableSet)unlockedKeys;
- (NSString)accountUUID;
- (NSString)description;
- (NSString)dsid;
- (NSURL)persistenceURL;
- (OS_dispatch_queue)calloutQueue;
- (OS_dispatch_queue)ckdkvsproxy_queue;
- (UbiqitousKVSProxy)initWithAccount:(id)a3 store:(id)a4 lockMonitor:(id)a5 persistence:(id)a6;
- (id)copyAllKeyInterests;
- (id)copyAsDictionary;
- (id)copyValues:(id)a3;
- (id)keysForCurrentLockState;
- (id)objectForKey:(id)a3;
- (id)pendKeysAndGetNewlyPended:(id)a3;
- (id)pendKeysAndGetPendingForCurrentLockState:(id)a3;
- (id)pendingKeysForCurrentLockState;
- (id)shadowFlushBlock;
- (unint64_t)nextFreshnessTime;
- (void)_queue_handleNotification:(const char *)a3;
- (void)_queue_kvsStoreChange;
- (void)_queue_locked;
- (void)_queue_processAllItems;
- (void)_queue_storeAccountChanged;
- (void)_queue_storeKeysChanged:(id)a3 initial:(BOOL)a4;
- (void)_queue_unlocked;
- (void)calloutWith:(id)a3;
- (void)clearStore;
- (void)dealloc;
- (void)doAfterFlush:(id)a3;
- (void)doEnsurePeerRegistration;
- (void)doSyncWithAllPeers;
- (void)doSyncWithPendingPeers;
- (void)handleNotification:(const char *)a3;
- (void)handlePendingEnsurePeerRegistrationRequests:(BOOL)a3;
- (void)intersectWithCurrentLockState:(id)a3;
- (void)locked;
- (void)perfCounters:(id)a3;
- (void)persistState;
- (void)processKeyChangedEvent:(id)a3;
- (void)processPendingKeysForCurrentLockState;
- (void)registerAtTimeKeys:(id)a3;
- (void)registerKeys:(id)a3 forAccount:(id)a4;
- (void)removeKeys:(id)a3 forAccount:(id)a4;
- (void)requestEnsurePeerRegistration;
- (void)requestSyncWithPeerIDs:(id)a3 backupPeerIDs:(id)a4;
- (void)sendKeysCallout:(id)a3;
- (void)setAccountUUID:(id)a3;
- (void)setAlwaysKeys:(id)a3;
- (void)setCalloutQueue:(id)a3;
- (void)setCkdkvsproxy_queue:(id)a3;
- (void)setDsid:(id)a3;
- (void)setEnsurePeerRegistration:(BOOL)a3;
- (void)setEnsurePeerRegistrationEnqueuedButNotStarted:(BOOL)a3;
- (void)setFirstUnlockKeys:(id)a3;
- (void)setFreshnessCompletions:(id)a3;
- (void)setInCallout:(BOOL)a3;
- (void)setNextFreshnessTime:(unint64_t)a3;
- (void)setObjectsFromDictionary:(id)a3;
- (void)setPendingKeys:(id)a3;
- (void)setPendingSyncBackupPeerIDs:(id)a3;
- (void)setPendingSyncPeerIDs:(id)a3;
- (void)setPersistentData:(id)a3;
- (void)setSeenKVSStoreChange:(BOOL)a3;
- (void)setShadowEnsurePeerRegistration:(BOOL)a3;
- (void)setShadowFlushBlock:(id)a3;
- (void)setShadowPendingKeys:(id)a3;
- (void)setShadowPendingSyncBackupPeerIDs:(id)a3;
- (void)setShadowPendingSyncPeerIDs:(id)a3;
- (void)setStoreObjectsFromDictionary:(id)a3;
- (void)setUnlockedKeys:(id)a3;
- (void)storeAccountChanged;
- (void)storeKeysChanged:(id)a3 initial:(BOOL)a4;
- (void)synchronizeStore;
- (void)unlocked;
- (void)waitForSyncDone:(BOOL)a3 error:(id)a4;
- (void)waitForSynchronization:(id)a3;
@end

@implementation UbiqitousKVSProxy

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shadowFlushBlock, 0);
  objc_storeStrong((id *)&self->_ckdkvsproxy_queue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_freshnessCompletions, 0);
  objc_storeStrong((id *)&self->_shadowPendingSyncBackupPeerIDs, 0);
  objc_storeStrong((id *)&self->_pendingSyncBackupPeerIDs, 0);
  objc_storeStrong((id *)&self->_shadowPendingSyncPeerIDs, 0);
  objc_storeStrong((id *)&self->_pendingSyncPeerIDs, 0);
  objc_storeStrong((id *)&self->_accountUUID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_shadowPendingKeys, 0);
  objc_storeStrong((id *)&self->_pendingKeys, 0);
  objc_storeStrong((id *)&self->_unlockedKeys, 0);
  objc_storeStrong((id *)&self->_firstUnlockKeys, 0);
  objc_storeStrong((id *)&self->_alwaysKeys, 0);
  objc_storeStrong((id *)&self->_persistenceURL, 0);
  objc_storeStrong((id *)&self->_lockMonitor, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong(&self->currentiCloudToken, 0);
}

- (void)setShadowFlushBlock:(id)a3
{
}

- (id)shadowFlushBlock
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setCkdkvsproxy_queue:(id)a3
{
}

- (OS_dispatch_queue)ckdkvsproxy_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCalloutQueue:(id)a3
{
}

- (OS_dispatch_queue)calloutQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 168, 1);
}

- (void)setNextFreshnessTime:(unint64_t)a3
{
  self->_nextFreshnessTime = a3;
}

- (unint64_t)nextFreshnessTime
{
  return self->_nextFreshnessTime;
}

- (void)setFreshnessCompletions:(id)a3
{
}

- (NSMutableArray)freshnessCompletions
{
  return self->_freshnessCompletions;
}

- (void)setInCallout:(BOOL)a3
{
  self->_inCallout = a3;
}

- (BOOL)inCallout
{
  return self->_inCallout;
}

- (void)setShadowEnsurePeerRegistration:(BOOL)a3
{
  self->_shadowEnsurePeerRegistration = a3;
}

- (BOOL)shadowEnsurePeerRegistration
{
  return self->_shadowEnsurePeerRegistration;
}

- (void)setEnsurePeerRegistrationEnqueuedButNotStarted:(BOOL)a3
{
  self->_ensurePeerRegistrationEnqueuedButNotStarted = a3;
}

- (BOOL)ensurePeerRegistrationEnqueuedButNotStarted
{
  return self->_ensurePeerRegistrationEnqueuedButNotStarted;
}

- (void)setEnsurePeerRegistration:(BOOL)a3
{
  self->_ensurePeerRegistration = a3;
}

- (BOOL)ensurePeerRegistration
{
  return self->_ensurePeerRegistration;
}

- (void)setShadowPendingSyncBackupPeerIDs:(id)a3
{
}

- (NSMutableSet)shadowPendingSyncBackupPeerIDs
{
  return self->_shadowPendingSyncBackupPeerIDs;
}

- (void)setPendingSyncBackupPeerIDs:(id)a3
{
}

- (NSMutableSet)pendingSyncBackupPeerIDs
{
  return self->_pendingSyncBackupPeerIDs;
}

- (void)setShadowPendingSyncPeerIDs:(id)a3
{
}

- (NSMutableSet)shadowPendingSyncPeerIDs
{
  return self->_shadowPendingSyncPeerIDs;
}

- (void)setPendingSyncPeerIDs:(id)a3
{
}

- (NSMutableSet)pendingSyncPeerIDs
{
  return self->_pendingSyncPeerIDs;
}

- (void)setAccountUUID:(id)a3
{
}

- (NSString)accountUUID
{
  return self->_accountUUID;
}

- (void)setDsid:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setShadowPendingKeys:(id)a3
{
}

- (NSMutableSet)shadowPendingKeys
{
  return self->_shadowPendingKeys;
}

- (void)setPendingKeys:(id)a3
{
}

- (NSMutableSet)pendingKeys
{
  return self->_pendingKeys;
}

- (void)setSeenKVSStoreChange:(BOOL)a3
{
  self->_seenKVSStoreChange = a3;
}

- (BOOL)seenKVSStoreChange
{
  return self->_seenKVSStoreChange;
}

- (void)setUnlockedKeys:(id)a3
{
}

- (NSMutableSet)unlockedKeys
{
  return self->_unlockedKeys;
}

- (void)setFirstUnlockKeys:(id)a3
{
}

- (NSMutableSet)firstUnlockKeys
{
  return self->_firstUnlockKeys;
}

- (void)setAlwaysKeys:(id)a3
{
}

- (NSMutableSet)alwaysKeys
{
  return self->_alwaysKeys;
}

- (NSURL)persistenceURL
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (CKDLockMonitor)lockMonitor
{
  return (CKDLockMonitor *)objc_getProperty(self, a2, 48, 1);
}

- (CKDAccount)account
{
  return (CKDAccount *)objc_getProperty(self, a2, 40, 1);
}

- (CKDStore)store
{
  return (CKDStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)processPendingKeysForCurrentLockState
{
  id v4 = [(UbiqitousKVSProxy *)self pendingKeysForCurrentLockState];
  id v3 = [(UbiqitousKVSProxy *)self copyValues:v4];
  [(UbiqitousKVSProxy *)self processKeyChangedEvent:v3];
}

- (void)processKeyChangedEvent:(id)a3
{
  id v4 = (UbiqitousKVSProxy *)a3;
  v5 = +[NSMutableDictionary dictionary];
  v6 = sub_10000E250("processKeyChangedEvent");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "changedValues:%@", buf, 0xCu);
  }

  +[NSMutableArray array];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000055F4;
  v17[3] = &unk_100018B70;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v7;
  id v8 = v5;
  id v19 = v8;
  [(UbiqitousKVSProxy *)v4 enumerateKeysAndObjectsUsingBlock:v17];
  if ([v7 count])
  {
    pendingKeys = self->_pendingKeys;
    v10 = +[NSSet setWithArray:v7];
    [(NSMutableSet *)pendingKeys minusSet:v10];
  }
  if ([v8 count])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005698;
    v15[3] = &unk_100018B98;
    v15[4] = self;
    id v16 = v8;
    [(UbiqitousKVSProxy *)self sendKeysCallout:v15];
  }
  else
  {
    v11 = sub_10000E250("keytrace");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v7 componentsJoinedByString:@" "];
      v13 = [(NSMutableSet *)self->_pendingKeys allObjects];
      v14 = [v13 componentsJoinedByString:@" "];
      *(_DWORD *)buf = 138412802;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ null: %@ pending: %@", buf, 0x20u);
    }
  }
}

- (id)copyValues:(id)a3
{
  id v4 = a3;
  v5 = [(UbiqitousKVSProxy *)self store];
  +[NSMutableDictionary dictionaryWithCapacity:0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005884;
  v11[3] = &unk_100018B48;
  id v12 = v5;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v6;
  id v7 = v5;
  [v4 enumerateObjectsUsingBlock:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)pendKeysAndGetPendingForCurrentLockState:(id)a3
{
  id v4 = [(UbiqitousKVSProxy *)self pendKeysAndGetNewlyPended:a3];

  return [(UbiqitousKVSProxy *)self pendingKeysForCurrentLockState];
}

- (id)pendingKeysForCurrentLockState
{
  id v3 = [(NSMutableSet *)self->_pendingKeys mutableCopy];
  [(UbiqitousKVSProxy *)self intersectWithCurrentLockState:v3];

  return v3;
}

- (void)intersectWithCurrentLockState:(id)a3
{
  id v4 = a3;
  id v5 = [(UbiqitousKVSProxy *)self keysForCurrentLockState];
  [v4 intersectSet:v5];
}

- (id)pendKeysAndGetNewlyPended:(id)a3
{
  id v4 = a3;
  id v5 = [(UbiqitousKVSProxy *)self copyAllKeyInterests];
  [v5 intersectSet:v4];

  id v6 = [v5 mutableCopy];
  [v6 minusSet:self->_pendingKeys];
  if (!self->_shadowPendingKeys || (objc_msgSend(v6, "minusSet:"), (pendingKeys = self->_shadowPendingKeys) == 0)) {
    pendingKeys = self->_pendingKeys;
  }
  [(NSMutableSet *)pendingKeys unionSet:v5];

  return v6;
}

- (id)keysForCurrentLockState
{
  id v3 = +[NSMutableSet setWithSet:self->_alwaysKeys];
  id v4 = [(UbiqitousKVSProxy *)self lockMonitor];
  unsigned int v5 = [v4 unlockedSinceBoot];

  if (v5) {
    [v3 unionSet:self->_firstUnlockKeys];
  }
  id v6 = [(UbiqitousKVSProxy *)self lockMonitor];
  unsigned __int8 v7 = [v6 locked];

  if ((v7 & 1) == 0) {
    [v3 unionSet:self->_unlockedKeys];
  }

  return v3;
}

- (void)unlocked
{
  ckdkvsproxy_queue = self->_ckdkvsproxy_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005BB0;
  block[3] = &unk_100018E08;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)ckdkvsproxy_queue, block);
}

- (void)locked
{
  ckdkvsproxy_queue = self->_ckdkvsproxy_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C2C;
  block[3] = &unk_100018E08;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)ckdkvsproxy_queue, block);
}

- (void)storeAccountChanged
{
  ckdkvsproxy_queue = self->_ckdkvsproxy_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005CA8;
  block[3] = &unk_100018E08;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)ckdkvsproxy_queue, block);
}

- (void)storeKeysChanged:(id)a3 initial:(BOOL)a4
{
  id v6 = a3;
  ckdkvsproxy_queue = self->_ckdkvsproxy_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005D58;
  block[3] = &unk_100018990;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)ckdkvsproxy_queue, block);
}

- (void)handleNotification:(const char *)a3
{
  ckdkvsproxy_queue = self->_ckdkvsproxy_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005DDC;
  v4[3] = &unk_100018B20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)ckdkvsproxy_queue, v4);
}

- (void)_queue_kvsStoreChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckdkvsproxy_queue);
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_100005E7C;
  activity_block[3] = &unk_100018E08;
  activity_block[4] = self;
  _os_activity_initiate((void *)&_mh_execute_header, "kvsStoreChange", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)_queue_unlocked
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckdkvsproxy_queue);
  id v3 = sub_10000E250("event");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ Unlocked", (uint8_t *)&v4, 0xCu);
  }

  [(UbiqitousKVSProxy *)self handlePendingEnsurePeerRegistrationRequests:0];
  [(UbiqitousKVSProxy *)self processPendingKeysForCurrentLockState];
  if ([(UbiqitousKVSProxy *)self hasPendingSyncIDs]) {
    [(UbiqitousKVSProxy *)self doSyncWithPendingPeers];
  }
}

- (void)_queue_locked
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckdkvsproxy_queue);
  id v3 = sub_10000E250("event");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ Locked", (uint8_t *)&v4, 0xCu);
  }
}

- (void)requestEnsurePeerRegistration
{
  if (self->_inCallout)
  {
    self->_shadowEnsurePeerRegistration = 1;
  }
  else
  {
    self->_ensurePeerRegistration = 1;
    [(UbiqitousKVSProxy *)self handlePendingEnsurePeerRegistrationRequests:1];
    [(UbiqitousKVSProxy *)self persistState];
  }
}

- (BOOL)hasPendingKey:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(UbiqitousKVSProxy *)self pendingKeys];
  if ([v5 containsObject:v4])
  {
    unsigned __int8 v6 = 1;
  }
  else if (self->_shadowPendingKeys)
  {
    unsigned __int8 v7 = [(UbiqitousKVSProxy *)self shadowPendingKeys];
    unsigned __int8 v6 = [v7 containsObject:v4];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)hasSyncPendingFor:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_pendingSyncPeerIDs containsObject:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    shadowPendingSyncPeerIDs = self->_shadowPendingSyncPeerIDs;
    if (shadowPendingSyncPeerIDs) {
      unsigned __int8 v5 = [(NSMutableSet *)shadowPendingSyncPeerIDs containsObject:v4];
    }
    else {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (void)requestSyncWithPeerIDs:(id)a3 backupPeerIDs:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 count] || objc_msgSend(v6, "count"))
  {
    unsigned __int8 v7 = +[NSSet setWithArray:v11];
    id v8 = +[NSSet setWithArray:v6];
    [(NSMutableSet *)self->_pendingSyncPeerIDs unionSet:v7];
    [(NSMutableSet *)self->_pendingSyncBackupPeerIDs unionSet:v8];
    if (self->_inCallout)
    {
      [(NSMutableSet *)self->_shadowPendingSyncPeerIDs unionSet:v7];
      [(NSMutableSet *)self->_shadowPendingSyncBackupPeerIDs unionSet:v8];
    }
    [(UbiqitousKVSProxy *)self persistState];
    [(UbiqitousKVSProxy *)self handlePendingEnsurePeerRegistrationRequests:1];
    if ([(UbiqitousKVSProxy *)self hasPendingSyncIDs])
    {
      if (!self->_inCallout)
      {
        id v9 = [(UbiqitousKVSProxy *)self lockMonitor];
        unsigned __int8 v10 = [v9 locked];

        if ((v10 & 1) == 0) {
          [(UbiqitousKVSProxy *)self doSyncWithPendingPeers];
        }
      }
    }
  }
}

- (BOOL)hasPendingSyncIDs
{
  unsigned int v3 = [(UbiqitousKVSProxy *)self hasPendingNonShadowSyncIDs];
  if (self->_inCallout) {
    v3 |= [(UbiqitousKVSProxy *)self hasPendingShadowSyncIDs];
  }
  return v3;
}

- (BOOL)hasPendingShadowSyncIDs
{
  shadowPendingSyncPeerIDs = self->_shadowPendingSyncPeerIDs;
  if (shadowPendingSyncPeerIDs && ![(NSMutableSet *)shadowPendingSyncPeerIDs isEmpty])
  {
    LOBYTE(shadowPendingSyncBackupPeerIDs) = 1;
  }
  else
  {
    shadowPendingSyncBackupPeerIDs = self->_shadowPendingSyncBackupPeerIDs;
    if (shadowPendingSyncBackupPeerIDs) {
      LOBYTE(shadowPendingSyncBackupPeerIDs) = [(NSMutableSet *)shadowPendingSyncBackupPeerIDs isEmpty] ^ 1;
    }
  }
  return (char)shadowPendingSyncBackupPeerIDs;
}

- (BOOL)hasPendingNonShadowSyncIDs
{
  if ([(NSMutableSet *)self->_pendingSyncPeerIDs isEmpty]) {
    return [(NSMutableSet *)self->_pendingSyncBackupPeerIDs isEmpty] ^ 1;
  }
  else {
    return 1;
  }
}

- (void)doSyncWithAllPeers
{
  [(UbiqitousKVSProxy *)self account];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000064F0;
  v4[3] = &unk_100018AF8;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  [(UbiqitousKVSProxy *)self calloutWith:v4];
}

- (void)doSyncWithPendingPeers
{
  [(UbiqitousKVSProxy *)self account];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006714;
  v4[3] = &unk_100018AA8;
  void v4[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  [(UbiqitousKVSProxy *)self calloutWith:v4];
}

- (void)doEnsurePeerRegistration
{
  id v3 = [(UbiqitousKVSProxy *)self account];
  [(UbiqitousKVSProxy *)self setEnsurePeerRegistrationEnqueuedButNotStarted:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006B74;
  v5[3] = &unk_100018AA8;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [(UbiqitousKVSProxy *)self calloutWith:v5];
}

- (void)handlePendingEnsurePeerRegistrationRequests:(BOOL)a3
{
  calloutQueue = self->_calloutQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006DFC;
  v4[3] = &unk_100018A58;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)calloutQueue, v4);
}

- (void)sendKeysCallout:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006FC8;
  v4[3] = &unk_100018A30;
  BOOL v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(UbiqitousKVSProxy *)v5 calloutWith:v4];
}

- (void)calloutWith:(id)a3
{
  id v4 = a3;
  xpc_transaction_begin();
  calloutQueue = self->_calloutQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000072FC;
  v7[3] = &unk_100018EA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)calloutQueue, v7);
}

- (void)doAfterFlush:(id)a3
{
  if (self->_inCallout)
  {
    self->_shadowFlushBlock = objc_retainBlock(a3);
    _objc_release_x1();
  }
  else
  {
    calloutQueue = self->_calloutQueue;
    dispatch_async((dispatch_queue_t)calloutQueue, a3);
  }
}

- (void)_queue_storeAccountChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckdkvsproxy_queue);
  id v3 = sub_10000E250("event");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  [(UbiqitousKVSProxy *)self setDsid:&stru_100019290];
  uint64_t v5 = kSOSKVSAccountChangedKey;
  id v6 = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [(UbiqitousKVSProxy *)self processKeyChangedEvent:v4];
}

- (void)_queue_storeKeysChanged:(id)a3 initial:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckdkvsproxy_queue);
  self->_seenKVSStoreChange = 1;
  [(NSMutableSet *)self->_pendingKeys minusSet:v6];
  unsigned __int8 v7 = [(UbiqitousKVSProxy *)self pendKeysAndGetPendingForCurrentLockState:v6];
  id v8 = [(UbiqitousKVSProxy *)self copyValues:v7];
  id v9 = v8;
  if (v4) {
    [v8 setObject:@"true" forKeyedSubscript:kSOSKVSInitialSyncKey];
  }
  unsigned __int8 v10 = sub_10000E250("event");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v6 allObjects];
    id v12 = [v11 componentsJoinedByString:@" "];
    id v13 = [v9 allKeys];
    v14 = [v13 componentsJoinedByString:@" "];
    int v15 = 138413058;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    v20 = v14;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ keysChangedInCloud: %@ keysOfInterest: %@ initial: %{BOOL}d", (uint8_t *)&v15, 0x26u);
  }
  if ([v9 count]) {
    [(UbiqitousKVSProxy *)self processKeyChangedEvent:v9];
  }
}

- (void)_queue_handleNotification:(const char *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckdkvsproxy_queue);
  if (!strcmp(a3, "com.apple.security.cloudkeychain.forceupdate"))
  {
    [(UbiqitousKVSProxy *)self _queue_processAllItems];
  }
  else if (!strcmp(a3, "com.apple.security.cloudkeychainproxy.kvstorechange3"))
  {
    [(UbiqitousKVSProxy *)self _queue_kvsStoreChange];
  }
}

- (void)registerKeys:(id)a3 forAccount:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(UbiqitousKVSProxy *)self accountUUID];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [(UbiqitousKVSProxy *)self accountUUID];
      unsigned int v10 = [v6 isEqualToString:v9];

      [(UbiqitousKVSProxy *)self setAccountUUID:v6];
      if (!v10)
      {
        id v11 = +[NSMutableSet set];
        goto LABEL_7;
      }
    }
    else
    {
      [(UbiqitousKVSProxy *)self setAccountUUID:v6];
    }
  }
  id v11 = [(UbiqitousKVSProxy *)self copyAllKeyInterests];
LABEL_7:
  id v12 = v11;
  id v13 = +[NSString stringWithUTF8String:"KeyParameter"];
  v14 = [v28 valueForKey:v13];

  int v15 = +[NSString stringWithUTF8String:"Circle"];
  id v16 = [v28 valueForKey:v15];

  __int16 v17 = +[NSString stringWithUTF8String:"Message"];
  id v18 = [v28 valueForKey:v17];

  __int16 v19 = +[NSMutableSet set];
  alwaysKeys = self->_alwaysKeys;
  self->_alwaysKeys = v19;

  __int16 v21 = +[NSMutableSet set];
  firstUnlockKeys = self->_firstUnlockKeys;
  self->_firstUnlockKeys = v21;

  v23 = +[NSMutableSet set];
  unlockedKeys = self->_unlockedKeys;
  self->_unlockedKeys = v23;

  [(UbiqitousKVSProxy *)self registerAtTimeKeys:v14];
  [(UbiqitousKVSProxy *)self registerAtTimeKeys:v16];
  [(UbiqitousKVSProxy *)self registerAtTimeKeys:v18];
  id v25 = [(UbiqitousKVSProxy *)self copyAllKeyInterests];
  [(NSMutableSet *)self->_pendingKeys intersectSet:v25];
  shadowPendingKeys = self->_shadowPendingKeys;
  if (shadowPendingKeys) {
    [(NSMutableSet *)shadowPendingKeys intersectSet:v25];
  }
  [v25 minusSet:v12];
  v27 = [(UbiqitousKVSProxy *)self pendKeysAndGetNewlyPended:v25];
  [(UbiqitousKVSProxy *)self persistState];
  [(UbiqitousKVSProxy *)self intersectWithCurrentLockState:v27];
  if ([v27 count]) {
    [(UbiqitousKVSProxy *)self processPendingKeysForCurrentLockState];
  }
}

- (void)removeKeys:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_4;
  }
  uint64_t v8 = [(UbiqitousKVSProxy *)self accountUUID];
  if (!v8) {
    goto LABEL_4;
  }
  id v9 = (void *)v8;
  unsigned int v10 = [(UbiqitousKVSProxy *)self accountUUID];
  unsigned __int8 v11 = [v7 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    id v12 = sub_10000E250("proxy");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "not removing keys, account UUID is for a new account", buf, 2u);
    }
  }
  else
  {
LABEL_4:
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100008560;
    v13[3] = &unk_100018DE0;
    v13[4] = self;
    [v6 enumerateObjectsUsingBlock:v13];
  }
}

- (void)registerAtTimeKeys:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v13 = [v4 valueForKey:@"AlwaysKeys"];
    uint64_t v5 = [v4 valueForKey:@"FirstUnlockKeys"];
    id v6 = [v4 valueForKey:@"UnlockedKeys"];

    if (v13)
    {
      alwaysKeys = self->_alwaysKeys;
      uint64_t v8 = +[NSMutableSet setWithArray:v13];
      [(NSMutableSet *)alwaysKeys unionSet:v8];
    }
    if (v5)
    {
      firstUnlockKeys = self->_firstUnlockKeys;
      unsigned int v10 = +[NSMutableSet setWithArray:v5];
      [(NSMutableSet *)firstUnlockKeys unionSet:v10];
    }
    if (v6)
    {
      unlockedKeys = self->_unlockedKeys;
      id v12 = +[NSMutableSet setWithArray:v6];
      [(NSMutableSet *)unlockedKeys unionSet:v12];
    }
  }
}

- (id)copyAllKeyInterests
{
  id v3 = +[NSMutableSet setWithSet:self->_alwaysKeys];
  [v3 unionSet:self->_firstUnlockKeys];
  [v3 unionSet:self->_unlockedKeys];
  return v3;
}

- (void)waitForSyncDone:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4) {
    self->_nextFreshnessTime = dispatch_time(0, 5000000000);
  }
  id v7 = sub_10000E250("fresh");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v17 = "EFRESH";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Completing WFS", buf, 0xCu);
  }

  freshnessCompletions = self->_freshnessCompletions;
  unsigned int v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100008920;
  id v13 = &unk_1000189B8;
  BOOL v15 = v4;
  id v14 = v6;
  id v9 = v6;
  [(NSMutableArray *)freshnessCompletions enumerateObjectsUsingBlock:&v10];
  [(NSMutableArray *)self->_freshnessCompletions removeAllObjects];
}

- (void)waitForSynchronization:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10000E250("fresh");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v17 = "EFRESH";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Requesting WFS", buf, 0xCu);
  }

  freshnessCompletions = self->_freshnessCompletions;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100008B14;
  v14[3] = &unk_100018968;
  id v7 = v4;
  id v15 = v7;
  uint64_t v8 = objc_retainBlock(v14);
  [(NSMutableArray *)freshnessCompletions addObject:v8];

  id v9 = [(UbiqitousKVSProxy *)self freshnessCompletions];
  id v10 = [v9 count];

  if (v10 == (id)1)
  {
    dispatch_time_t nextFreshnessTime = self->_nextFreshnessTime;
    id v12 = dispatch_get_global_queue(0, 0);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100008BF4;
    v13[3] = &unk_100018E08;
    v13[4] = self;
    dispatch_after(nextFreshnessTime, v12, v13);
  }
}

- (void)setObjectsFromDictionary:(id)a3
{
}

- (void)setStoreObjectsFromDictionary:(id)a3
{
  id v4 = (UbiqitousKVSProxy *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [(UbiqitousKVSProxy *)v4 mutableCopy];
    id v7 = [v6 extractObjectForKey:kSOSKVSOfficialDSIDKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    id v10 = [objc_alloc((Class)NSString) initWithData:v9 encoding:134217984];
    if (v10) {
      objc_storeStrong((id *)&self->_dsid, v10);
    }
    uint64_t v11 = [v6 extractObjectForKey:kSOSKVSRequiredKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      p_dsid = (id *)&self->_dsid;
      dsid = self->_dsid;
      if (dsid && ![(NSString *)dsid isEqualToString:&stru_100019290])
      {
        if (([*p_dsid isEqual:v13] & 1) == 0)
        {
          BOOL v22 = sub_10000E250("SecError");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (UbiqitousKVSProxy *)*p_dsid;
            *(_DWORD *)buf = 138412546;
            v26 = v23;
            __int16 v27 = 2112;
            id v28 = v13;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Account DSIDs do not match, cloud keychain proxy: %@, securityd: %@", buf, 0x16u);
          }

          __int16 v19 = sub_10000E250("SecError");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v5;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not going to write these: %@ into KVS!", buf, 0xCu);
          }
          goto LABEL_17;
        }
        __int16 v21 = sub_10000E250("dsid");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "DSIDs match, writing", buf, 2u);
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_dsid, v12);
      }
    }
    id v16 = sub_10000E250("keytrace");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = [v6 allKeys];
      id v18 = [v17 componentsJoinedByString:@" "];
      *(_DWORD *)buf = 138412546;
      v26 = self;
      __int16 v27 = 2112;
      id v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ sending: %@", buf, 0x16u);
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100009094;
    v24[3] = &unk_100018D28;
    v24[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v24];
    __int16 v19 = [(UbiqitousKVSProxy *)self store];
    v20 = [v6 allKeys];
    [v19 pushWrites:v20 requiresForceSync:0];

LABEL_17:
  }
}

- (void)perfCounters:(id)a3
{
  id v4 = a3;
  id v5 = [(UbiqitousKVSProxy *)self store];
  [v5 perfCounters:v4];
}

- (void)persistState
{
  id v3 = [(UbiqitousKVSProxy *)self persistentData];
  id v4 = [(UbiqitousKVSProxy *)self persistenceURL];
  unsigned __int8 v5 = [v4 writePlist:v3];

  if ((v5 & 1) == 0)
  {
    id v6 = sub_10000E250("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(UbiqitousKVSProxy *)self persistenceURL];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to write persistence data to %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)setPersistentData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 objectForKeyedSubscript:@"AlwaysKeys"];
  id v6 = +[NSMutableSet setWithArray:v5];
  alwaysKeys = self->_alwaysKeys;
  self->_alwaysKeys = v6;

  [(NSMutableSet *)self->_alwaysKeys addObject:kSOSKVSKeyParametersKey];
  int v8 = [v4 objectForKeyedSubscript:@"FirstUnlockKeys"];
  id v9 = +[NSMutableSet setWithArray:v8];
  firstUnlockKeys = self->_firstUnlockKeys;
  self->_firstUnlockKeys = v9;

  uint64_t v11 = [v4 objectForKeyedSubscript:@"UnlockedKeys"];
  id v12 = +[NSMutableSet setWithArray:v11];
  unlockedKeys = self->_unlockedKeys;
  self->_unlockedKeys = v12;

  id v14 = [v4 objectForKeyedSubscript:@"PendingKeys"];
  id v15 = +[NSMutableSet setWithArray:v14];
  pendingKeys = self->_pendingKeys;
  self->_pendingKeys = v15;

  __int16 v17 = [v4 objectForKeyedSubscript:@"SyncPeerIDs"];
  id v18 = +[NSMutableSet setWithArray:v17];
  pendingSyncPeerIDs = self->_pendingSyncPeerIDs;
  self->_pendingSyncPeerIDs = v18;

  v20 = [v4 objectForKeyedSubscript:@"SyncBackupPeerIDs"];
  __int16 v21 = +[NSMutableSet setWithArray:v20];
  pendingSyncBackupPeerIDs = self->_pendingSyncBackupPeerIDs;
  self->_pendingSyncBackupPeerIDs = v21;

  v23 = [v4 objectForKeyedSubscript:@"EnsurePeerRegistration"];
  self->_ensurePeerRegistration = [v23 BOOLValue];

  __int16 v24 = [v4 objectForKeyedSubscript:@"DSID"];
  dsid = self->_dsid;
  self->_dsid = v24;

  v26 = [v4 objectForKeyedSubscript:@"KeyAccountUUID"];

  accountUUID = self->_accountUUID;
  self->_accountUUID = v26;
}

- (NSDictionary)persistentData
{
  v14[0] = @"AlwaysKeys";
  id v3 = [(NSMutableSet *)self->_alwaysKeys allObjects];
  v15[0] = v3;
  v14[1] = @"FirstUnlockKeys";
  id v4 = [(NSMutableSet *)self->_firstUnlockKeys allObjects];
  v15[1] = v4;
  v14[2] = @"UnlockedKeys";
  unsigned __int8 v5 = [(NSMutableSet *)self->_unlockedKeys allObjects];
  v15[2] = v5;
  v14[3] = @"PendingKeys";
  id v6 = [(NSMutableSet *)self->_pendingKeys allObjects];
  v15[3] = v6;
  void v14[4] = @"SyncPeerIDs";
  id v7 = [(NSMutableSet *)self->_pendingSyncPeerIDs allObjects];
  v15[4] = v7;
  v14[5] = @"SyncBackupPeerIDs";
  int v8 = [(NSMutableSet *)self->_pendingSyncBackupPeerIDs allObjects];
  void v15[5] = v8;
  v14[6] = @"EnsurePeerRegistration";
  id v9 = +[NSNumber numberWithBool:self->_ensurePeerRegistration];
  dsid = self->_dsid;
  accountUUID = self->_accountUUID;
  v15[6] = v9;
  v15[7] = dsid;
  v14[7] = @"DSID";
  v14[8] = @"KeyAccountUUID";
  v15[8] = accountUUID;
  id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:9];

  return (NSDictionary *)v12;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NSUbiquityIdentityDidChangeNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)UbiqitousKVSProxy;
  [(UbiqitousKVSProxy *)&v5 dealloc];
}

- (void)_queue_processAllItems
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckdkvsproxy_queue);
  id v3 = [(UbiqitousKVSProxy *)self store];
  id v4 = [v3 copyAsDictionary];

  if (v4)
  {
    objc_super v5 = sub_10000E250("event");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 allKeys];
      id v7 = [v6 componentsJoinedByString:@" "];
      int v8 = 138412546;
      id v9 = self;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ sending: %@", (uint8_t *)&v8, 0x16u);
    }
    [(UbiqitousKVSProxy *)self processKeyChangedEvent:v4];
  }
}

- (id)copyAsDictionary
{
  v2 = [(UbiqitousKVSProxy *)self store];
  id v3 = [v2 copyAsDictionary];

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UbiqitousKVSProxy *)self store];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)synchronizeStore
{
  id v3 = [(UbiqitousKVSProxy *)self store];
  v2 = +[NSArray array];
  [v3 pushWrites:v2 requiresForceSync:1];
}

- (void)clearStore
{
  id v2 = [(UbiqitousKVSProxy *)self store];
  [v2 removeAllObjects];
}

- (NSString)description
{
  return (NSString *)@"UbiqitousKVSProxy";
}

- (UbiqitousKVSProxy)initWithAccount:(id)a3 store:(id)a4 lockMonitor:(id)a5 persistence:(id)a6
{
  id v9 = a3;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v50.receiver = self;
  v50.super_class = (Class)UbiqitousKVSProxy;
  id v15 = [(UbiqitousKVSProxy *)&v50 init];
  if (!v15) {
    goto LABEL_6;
  }
  id v16 = sub_10000E250("event");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v49 = a6;
    id v17 = v9;
    id v18 = a4;
    id v19 = a5;
    id v20 = v14;
    id v21 = v13;
    id v22 = v12;
    id v23 = v11;
    uid_t v24 = getuid();
    uid_t v25 = geteuid();
    *(_DWORD *)buf = 138412802;
    v52 = v15;
    __int16 v53 = 1024;
    uid_t v54 = v24;
    id v11 = v23;
    id v12 = v22;
    id v13 = v21;
    id v14 = v20;
    a5 = v19;
    a4 = v18;
    id v9 = v17;
    a6 = v49;
    __int16 v55 = 1024;
    uid_t v56 = v25;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ start UID=%u EUID=%u", buf, 0x18u);
  }

  if (OctagonPlatformSupportsSOS())
  {
    v15->_ensurePeerRegistration = 0;
    id v26 = v11;
    uint64_t v27 = +[NSMutableSet set];
    pendingSyncPeerIDs = v15->_pendingSyncPeerIDs;
    v15->_pendingSyncPeerIDs = (NSMutableSet *)v27;

    uint64_t v29 = +[NSMutableSet set];
    pendingSyncBackupPeerIDs = v15->_pendingSyncBackupPeerIDs;
    v15->_pendingSyncBackupPeerIDs = (NSMutableSet *)v29;

    shadowPendingSyncPeerIDs = v15->_shadowPendingSyncPeerIDs;
    v15->_shadowPendingSyncPeerIDs = 0;

    shadowPendingSyncBackupPeerIDs = v15->_shadowPendingSyncBackupPeerIDs;
    v15->_shadowPendingSyncBackupPeerIDs = 0;

    objc_storeStrong((id *)&v15->_persistenceURL, a6);
    objc_storeStrong((id *)&v15->_account, v9);
    objc_storeStrong((id *)&v15->_store, a4);
    objc_storeStrong((id *)&v15->_lockMonitor, a5);
    dispatch_queue_t v33 = dispatch_queue_create("CKDCallout", 0);
    calloutQueue = v15->_calloutQueue;
    v15->_calloutQueue = (OS_dispatch_queue *)v33;

    dispatch_queue_t v35 = dispatch_queue_create("CKDKVSProxy", 0);
    ckdkvsproxy_queue = v15->_ckdkvsproxy_queue;
    v15->_ckdkvsproxy_queue = (OS_dispatch_queue *)v35;

    uint64_t v37 = +[NSMutableArray array];
    freshnessCompletions = v15->_freshnessCompletions;
    v15->_freshnessCompletions = (NSMutableArray *)v37;

    v39 = +[XPCNotificationDispatcher dispatcher];
    [v39 addListener:v15];

    v40 = [(UbiqitousKVSProxy *)v15 persistenceURL];
    v41 = [v40 readPlist];
    [(UbiqitousKVSProxy *)v15 setPersistentData:v41];

    dsid = v15->_dsid;
    v15->_dsid = (NSString *)&stru_100019290;

    accountUUID = v15->_accountUUID;
    v15->_accountUUID = (NSString *)&stru_100019290;

    v44 = [(UbiqitousKVSProxy *)v15 store];
    [v44 connectToProxy:v15];

    v45 = [(UbiqitousKVSProxy *)v15 lockMonitor];
    [v45 connectTo:v15];

    id v11 = v26;
LABEL_6:
    v46 = v15;
    goto LABEL_10;
  }
  v47 = sub_10000E250("nosos");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Cannot run CloudKeychainProxy on a system with no SOS", buf, 2u);
  }

  v46 = 0;
LABEL_10:

  return v46;
}

+ (id)withAccount:(id)a3 store:(id)a4 lockMonitor:(id)a5 persistence:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithAccount:v13 store:v12 lockMonitor:v11 persistence:v10];

  return v14;
}

@end