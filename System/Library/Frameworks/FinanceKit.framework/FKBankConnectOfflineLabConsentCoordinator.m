@interface FKBankConnectOfflineLabConsentCoordinator
- (BOOL)isOfflineLabPreferenceAvailable;
- (FKBankConnectOfflineLabConsentCoordinator)init;
- (id)offlineLabPrivacyBundleIdentifier;
- (void)loadOfflineLabSharingPermissionWithCompletion:(id)a3;
- (void)loadOfflineLabSharingPreferenceWithCompletion:(id)a3;
- (void)saveOfflineLabSharingPermission:(BOOL)a3 withCompletion:(id)a4;
@end

@implementation FKBankConnectOfflineLabConsentCoordinator

- (FKBankConnectOfflineLabConsentCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectOfflineLabConsentCoordinator;
  v2 = [(FKBankConnectOfflineLabConsentCoordinator *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10FinanceKit39BankConnectOfflineLabConsentCoordinator);
    wrappedCoordinator = v2->_wrappedCoordinator;
    v2->_wrappedCoordinator = v3;
  }
  return v2;
}

- (BOOL)isOfflineLabPreferenceAvailable
{
  return 1;
}

- (void)loadOfflineLabSharingPermissionWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __91__FKBankConnectOfflineLabConsentCoordinator_loadOfflineLabSharingPermissionWithCompletion___block_invoke;
  v6[3] = &unk_2651801E0;
  id v7 = v4;
  id v5 = v4;
  [(FKBankConnectOfflineLabConsentCoordinator *)self loadOfflineLabSharingPreferenceWithCompletion:v6];
}

uint64_t __91__FKBankConnectOfflineLabConsentCoordinator_loadOfflineLabSharingPermissionWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadOfflineLabSharingPreferenceWithCompletion:(id)a3
{
}

- (void)saveOfflineLabSharingPermission:(BOOL)a3 withCompletion:(id)a4
{
}

- (id)offlineLabPrivacyBundleIdentifier
{
  return [(BankConnectOfflineLabConsentCoordinator *)self->_wrappedCoordinator offlineLabPrivacyBundleIdentifier];
}

- (void).cxx_destruct
{
}

@end