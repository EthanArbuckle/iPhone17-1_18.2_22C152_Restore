@interface SOKerberosAgentContext
- (BOOL)authRequestPending;
- (BOOL)discoveryInProgress;
- (NSOperationQueue)contextKerberosWorkQueue;
- (NSOperationQueue)contextNetworkWorkQueue;
- (SOADSiteDiscovery)siteDiscovery;
- (SOAuthorizationWrapper)authWrapper;
- (SOAuthorizationWrapper)passwordChangeAuthWrapper;
- (SOAuthorizationWrapper)passwordSyncAuthWrapper;
- (SOAuthorizationWrapper)receivedTGTAuthWrapper;
- (SOFullProfile)profile;
- (SOKerberosAgentContext)initWithProfile:(id)a3;
- (SOKerberosExtensionData)extensionData;
- (SOKerberosRealmSettings)settings;
- (SONetworkIdentity)identity;
- (void)setAuthRequestPending:(BOOL)a3;
- (void)setAuthWrapper:(id)a3;
- (void)setDiscoveryInProgress:(BOOL)a3;
- (void)setExtensionData:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setPasswordChangeAuthWrapper:(id)a3;
- (void)setPasswordSyncAuthWrapper:(id)a3;
- (void)setProfile:(id)a3;
- (void)setReceivedTGTAuthWrapper:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSiteDiscovery:(id)a3;
@end

@implementation SOKerberosAgentContext

- (SOKerberosAgentContext)initWithProfile:(id)a3
{
  id v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SOKerberosAgentContext;
  v6 = [(SOKerberosAgentContext *)&v42 init];
  if (v6)
  {
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    contextNetworkWorkQueue = v6->_contextNetworkWorkQueue;
    v6->_contextNetworkWorkQueue = v7;

    v9 = NSString;
    v10 = [v5 realm];
    v11 = [v9 stringWithFormat:@"com.apple.kerberosextension.%@.network", v10];
    [(NSOperationQueue *)v6->_contextNetworkWorkQueue setName:v11];

    [(NSOperationQueue *)v6->_contextNetworkWorkQueue setSuspended:1];
    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    contextKerberosWorkQueue = v6->_contextKerberosWorkQueue;
    v6->_contextKerberosWorkQueue = v12;

    v14 = NSString;
    v15 = [v5 realm];
    v16 = [v14 stringWithFormat:@"com.apple.kerberosextension.%@.kerberos", v15];
    [(NSOperationQueue *)v6->_contextKerberosWorkQueue setName:v16];

    [(NSOperationQueue *)v6->_contextKerberosWorkQueue setSuspended:1];
    objc_storeStrong((id *)&v6->_profile, a3);
    v17 = [SOKerberosRealmSettings alloc];
    v18 = [v5 realm];
    uint64_t v19 = [(SOKerberosRealmSettings *)v17 initWithRealm:v18];
    settings = v6->_settings;
    v6->_settings = (SOKerberosRealmSettings *)v19;

    v21 = [SOKerberosExtensionData alloc];
    v22 = [v5 extensionData];
    uint64_t v23 = [(SOKerberosExtensionData *)v21 initWithDictionary:v22];
    extensionData = v6->_extensionData;
    v6->_extensionData = (SOKerberosExtensionData *)v23;

    v25 = [SONetworkIdentity alloc];
    v26 = [v5 realm];
    uint64_t v27 = [(SONetworkIdentity *)v25 initForRealm:v26 bundleIdentifier:0 auditToken:0];
    identity = v6->_identity;
    v6->_identity = (SONetworkIdentity *)v27;

    v29 = [SOADSiteDiscovery alloc];
    v30 = [(SOFullProfile *)v6->_profile realm];
    uint64_t v31 = [(SOADSiteDiscovery *)v29 initWithRealm:v30];
    siteDiscovery = v6->_siteDiscovery;
    v6->_siteDiscovery = (SOADSiteDiscovery *)v31;

    v33 = objc_alloc_init(SOAuthorizationWrapper);
    authWrapper = v6->_authWrapper;
    v6->_authWrapper = v33;

    v35 = objc_alloc_init(SOAuthorizationWrapper);
    receivedTGTAuthWrapper = v6->_receivedTGTAuthWrapper;
    v6->_receivedTGTAuthWrapper = v35;

    v37 = objc_alloc_init(SOAuthorizationWrapper);
    passwordSyncAuthWrapper = v6->_passwordSyncAuthWrapper;
    v6->_passwordSyncAuthWrapper = v37;

    v39 = objc_alloc_init(SOAuthorizationWrapper);
    passwordChangeAuthWrapper = v6->_passwordChangeAuthWrapper;
    v6->_passwordChangeAuthWrapper = v39;

    *(_WORD *)&v6->_authRequestPending = 0;
  }

  return v6;
}

- (BOOL)authRequestPending
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL authRequestPending = v2->_authRequestPending;
  objc_sync_exit(v2);

  return authRequestPending;
}

- (void)setAuthRequestPending:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL authRequestPending = a3;
  objc_sync_exit(obj);
}

- (NSOperationQueue)contextNetworkWorkQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (NSOperationQueue)contextKerberosWorkQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (SOFullProfile)profile
{
  return (SOFullProfile *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProfile:(id)a3
{
}

- (SOKerberosRealmSettings)settings
{
  return (SOKerberosRealmSettings *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSettings:(id)a3
{
}

- (SOKerberosExtensionData)extensionData
{
  return (SOKerberosExtensionData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensionData:(id)a3
{
}

- (SONetworkIdentity)identity
{
  return (SONetworkIdentity *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdentity:(id)a3
{
}

- (SOADSiteDiscovery)siteDiscovery
{
  return (SOADSiteDiscovery *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSiteDiscovery:(id)a3
{
}

- (SOAuthorizationWrapper)authWrapper
{
  return (SOAuthorizationWrapper *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAuthWrapper:(id)a3
{
}

- (SOAuthorizationWrapper)receivedTGTAuthWrapper
{
  return (SOAuthorizationWrapper *)objc_getProperty(self, a2, 80, 1);
}

- (void)setReceivedTGTAuthWrapper:(id)a3
{
}

- (SOAuthorizationWrapper)passwordSyncAuthWrapper
{
  return (SOAuthorizationWrapper *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPasswordSyncAuthWrapper:(id)a3
{
}

- (SOAuthorizationWrapper)passwordChangeAuthWrapper
{
  return (SOAuthorizationWrapper *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPasswordChangeAuthWrapper:(id)a3
{
}

- (BOOL)discoveryInProgress
{
  return self->_discoveryInProgress;
}

- (void)setDiscoveryInProgress:(BOOL)a3
{
  self->_discoveryInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordChangeAuthWrapper, 0);
  objc_storeStrong((id *)&self->_passwordSyncAuthWrapper, 0);
  objc_storeStrong((id *)&self->_receivedTGTAuthWrapper, 0);
  objc_storeStrong((id *)&self->_authWrapper, 0);
  objc_storeStrong((id *)&self->_siteDiscovery, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_contextKerberosWorkQueue, 0);
  objc_storeStrong((id *)&self->_contextNetworkWorkQueue, 0);
}

@end