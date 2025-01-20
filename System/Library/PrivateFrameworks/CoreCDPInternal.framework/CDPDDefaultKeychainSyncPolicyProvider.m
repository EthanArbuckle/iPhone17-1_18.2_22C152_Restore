@interface CDPDDefaultKeychainSyncPolicyProvider
- (BOOL)isBuddyFinished;
- (BOOL)keychainSyncAllowedByMDM;
- (BOOL)keychainSyncAllowedByServer;
- (BOOL)userHasExplicitlyDisabledSync;
- (CDPContext)context;
- (CDPDAccount)account;
- (CDPDDefaultKeychainSyncPolicyProvider)initWithContext:(id)a3;
- (void)setUserHasExplicitlyDisabledSync:(BOOL)a3;
@end

@implementation CDPDDefaultKeychainSyncPolicyProvider

- (CDPDDefaultKeychainSyncPolicyProvider)initWithContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDPDDefaultKeychainSyncPolicyProvider;
  v6 = [(CDPDDefaultKeychainSyncPolicyProvider *)&v11 init];
  if (v6)
  {
    v7 = [[CDPDAccount alloc] initWithContext:v5];
    account = v6->_account;
    v6->_account = v7;

    objc_storeStrong((id *)&v6->_context, a3);
    v9 = v6;
  }

  return v6;
}

- (BOOL)keychainSyncAllowedByMDM
{
  v2 = [(CDPDDefaultKeychainSyncPolicyProvider *)self context];
  char v3 = [v2 keychainSyncAllowedByMDM];

  return v3;
}

- (BOOL)keychainSyncAllowedByServer
{
  v2 = [(CDPDDefaultKeychainSyncPolicyProvider *)self context];
  char v3 = [v2 keychainSyncAllowedByServer];

  return v3;
}

- (BOOL)userHasExplicitlyDisabledSync
{
  v2 = [(CDPDDefaultKeychainSyncPolicyProvider *)self account];
  char v3 = [v2 hasDisabledKeychainExplicitly];

  return v3;
}

- (BOOL)isBuddyFinished
{
  return [MEMORY[0x263F34400] isBuddyFinished];
}

- (void)setUserHasExplicitlyDisabledSync:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CDPDDefaultKeychainSyncPolicyProvider *)self account];
  [v4 setHasDisabledKeychainExplicitly:v3];
}

- (CDPDAccount)account
{
  return self->_account;
}

- (CDPContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end