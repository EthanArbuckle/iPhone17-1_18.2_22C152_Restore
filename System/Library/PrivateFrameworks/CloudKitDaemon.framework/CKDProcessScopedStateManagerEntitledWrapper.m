@interface CKDProcessScopedStateManagerEntitledWrapper
- (CKDProcessScopedStateManagerEntitledWrapper)initWithEntitlements:(id)a3;
- (CKEntitlements)entitlements;
- (void)accountWithID:(id)a3 changedWithChangeType:(int64_t)a4;
- (void)accountsDidGrantAccessToBundleID:(id)a3 containerIdentifiers:(id)a4;
- (void)accountsDidRevokeAccessToBundleID:(id)a3 containerIdentifiers:(id)a4;
- (void)accountsWillDeleteAccount:(id)a3 completionHandler:(id)a4;
- (void)clearPCSCachesForKnownContainersWithCompletionHandler:(id)a3;
- (void)dumpAllClientsStatusReportToFileHandle:(id)a3 completionHandler:(id)a4;
- (void)fetchUsabilityForTestAccountCredentials:(id)a3 completionHandler:(id)a4;
- (void)globalDeviceIdentifierWithCompletionHandler:(id)a3;
- (void)maxInlineMergeableDeltaSizeWithCompletionHandler:(id)a3;
- (void)updatePushTokens;
- (void)wipeAllCachesAndDie;
- (void)wipeServerConfigurationsAndDie;
@end

@implementation CKDProcessScopedStateManagerEntitledWrapper

- (CKDProcessScopedStateManagerEntitledWrapper)initWithEntitlements:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKDProcessScopedStateManagerEntitledWrapper;
  v6 = [(CKDProcessScopedStateManagerEntitledWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entitlements, a3);
  }

  return v7;
}

- (void)dumpAllClientsStatusReportToFileHandle:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dumpAllClientsStatusReportToFileHandle_completionHandler_(v10, v9, (uint64_t)v6, v5);
}

- (void)clearPCSCachesForKnownContainersWithCompletionHandler:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearPCSCachesForKnownContainersWithCompletionHandler_(v7, v6, (uint64_t)v3);
}

- (void)accountsDidGrantAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountsDidGrantAccessToBundleID_containerIdentifiers_(v10, v9, (uint64_t)v6, v5);
}

- (void)accountsDidRevokeAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountsDidRevokeAccessToBundleID_containerIdentifiers_(v10, v9, (uint64_t)v6, v5);
}

- (void)accountsWillDeleteAccount:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountsWillDeleteAccount_completionHandler_(v10, v9, (uint64_t)v6, v5);
}

- (void)accountWithID:(id)a3 changedWithChangeType:(int64_t)a4
{
  id v5 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountWithID_changedWithChangeType_(v9, v8, (uint64_t)v5, a4);
}

- (void)fetchUsabilityForTestAccountCredentials:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchUsabilityForTestAccountCredentials_completionHandler_(v10, v9, (uint64_t)v6, v5);
}

- (void)wipeAllCachesAndDie
{
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wipeAllCachesAndDie(v5, v3, v4);
}

- (void)wipeServerConfigurationsAndDie
{
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wipeServerConfigurationsAndDie(v5, v3, v4);
}

- (void)updatePushTokens
{
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatePushTokens(v5, v3, v4);
}

- (void)maxInlineMergeableDeltaSizeWithCompletionHandler:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_maxInlineMergeableDeltaSizeWithCompletionHandler_(v7, v6, (uint64_t)v3);
}

- (void)globalDeviceIdentifierWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v5, v6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = objc_msgSend_entitlements(self, v7, v8);
  objc_msgSend__globalDeviceIdentifierWithEntitlements_completionHandler_(v11, v10, (uint64_t)v9, v4);
}

- (CKEntitlements)entitlements
{
  return (CKEntitlements *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end