@interface NEVPNProtocol
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)disconnectOnIdle;
- (BOOL)disconnectOnLogout;
- (BOOL)disconnectOnSleep;
- (BOOL)disconnectOnUserSwitch;
- (BOOL)disconnectOnWake;
- (BOOL)enforceRoutes;
- (BOOL)excludeAPNs;
- (BOOL)excludeCellularServices;
- (BOOL)excludeDeviceCommunication;
- (BOOL)excludeLocalNetworks;
- (BOOL)identityDataImported;
- (BOOL)includeAllNetworks;
- (BOOL)needToUpdateKeychain;
- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3;
- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3;
- (NEDNSSettings)DNSSettings;
- (NEKeychainItem)identityDataPasswordKeychainItem;
- (NEKeychainItem)passwordKeychainItem;
- (NEProxySettings)proxySettings;
- (NEVPNProtocol)initWithCoder:(id)a3;
- (NEVPNProtocol)initWithProtocolIdentifier:(id)a3;
- (NEVPNProtocol)initWithType:(int64_t)a3;
- (NSData)identityDataHash;
- (NSData)identityDataInternal;
- (NSData)identityReferenceInternal;
- (NSData)passwordReference;
- (NSString)extensibleSSOProvider;
- (NSString)identityDataPassword;
- (NSString)passwordEncryption;
- (NSString)serverAddress;
- (NSString)sliceUUID;
- (NSString)username;
- (NSUUID)identifier;
- (__SCNetworkInterface)createInterface;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int)disconnectOnIdleTimeout;
- (int)disconnectOnWakeTimeout;
- (int64_t)type;
- (void)addDisconnectOptions:(id)a3;
- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initDisconnectOptions:(id)a3;
- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3;
- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4;
- (void)setDNSSettings:(id)a3;
- (void)setDisconnectOnIdle:(BOOL)a3;
- (void)setDisconnectOnIdleTimeout:(int)a3;
- (void)setDisconnectOnLogout:(BOOL)a3;
- (void)setDisconnectOnSleep:(BOOL)disconnectOnSleep;
- (void)setDisconnectOnUserSwitch:(BOOL)a3;
- (void)setDisconnectOnWake:(BOOL)a3;
- (void)setDisconnectOnWakeTimeout:(int)a3;
- (void)setEnforceRoutes:(BOOL)enforceRoutes;
- (void)setExcludeAPNs:(BOOL)excludeAPNs;
- (void)setExcludeCellularServices:(BOOL)excludeCellularServices;
- (void)setExcludeDeviceCommunication:(BOOL)a3;
- (void)setExcludeLocalNetworks:(BOOL)excludeLocalNetworks;
- (void)setExtensibleSSOProvider:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentityData:(NSData *)identityData;
- (void)setIdentityDataHash:(id)a3;
- (void)setIdentityDataImported:(BOOL)a3;
- (void)setIdentityDataInternal:(id)a3;
- (void)setIdentityDataPassword:(NSString *)identityDataPassword;
- (void)setIdentityDataPasswordKeychainItem:(id)a3;
- (void)setIdentityReferenceInternal:(id)a3;
- (void)setIncludeAllNetworks:(BOOL)includeAllNetworks;
- (void)setPasswordEncryption:(id)a3;
- (void)setPasswordKeychainItem:(id)a3;
- (void)setPasswordReference:(NSData *)passwordReference;
- (void)setProxySettings:(NEProxySettings *)proxySettings;
- (void)setServerAddress:(NSString *)serverAddress;
- (void)setSliceUUID:(id)a3;
- (void)setUsername:(NSString *)username;
- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5;
- (void)syncWithKeychainInDomainCommon:(int64_t)a3;
@end

@implementation NEVPNProtocol

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensibleSSOProvider, 0);
  objc_storeStrong((id *)&self->_DNSSettings, 0);
  objc_storeStrong((id *)&self->_identityDataPasswordKeychainItem, 0);
  objc_storeStrong((id *)&self->_identityDataHash, 0);
  objc_storeStrong((id *)&self->_identityDataInternal, 0);
  objc_storeStrong((id *)&self->_passwordEncryption, 0);
  objc_storeStrong((id *)&self->_passwordKeychainItem, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_sliceUUID, 0);
  objc_storeStrong((id *)&self->_proxySettings, 0);
  objc_storeStrong((id *)&self->_identityDataPassword, 0);
  objc_storeStrong((id *)&self->_passwordReference, 0);
  objc_storeStrong((id *)&self->_username, 0);

  objc_storeStrong((id *)&self->_serverAddress, 0);
}

- (void)setDisconnectOnLogout:(BOOL)a3
{
  self->_disconnectOnLogout = a3;
}

- (BOOL)disconnectOnLogout
{
  return self->_disconnectOnLogout;
}

- (void)setDisconnectOnUserSwitch:(BOOL)a3
{
  self->_disconnectOnUserSwitch = a3;
}

- (BOOL)disconnectOnUserSwitch
{
  return self->_disconnectOnUserSwitch;
}

- (void)setDisconnectOnIdleTimeout:(int)a3
{
  self->_disconnectOnIdleTimeout = a3;
}

- (int)disconnectOnIdleTimeout
{
  return self->_disconnectOnIdleTimeout;
}

- (void)setDisconnectOnIdle:(BOOL)a3
{
  self->_disconnectOnIdle = a3;
}

- (BOOL)disconnectOnIdle
{
  return self->_disconnectOnIdle;
}

- (void)setExtensibleSSOProvider:(id)a3
{
}

- (NSString)extensibleSSOProvider
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDNSSettings:(id)a3
{
}

- (NEDNSSettings)DNSSettings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 160, 1);
}

- (void)setIdentityDataPasswordKeychainItem:(id)a3
{
}

- (NEKeychainItem)identityDataPasswordKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 152, 1);
}

- (void)setIdentityDataHash:(id)a3
{
}

- (NSData)identityDataHash
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (void)setIdentityDataImported:(BOOL)a3
{
  self->_identityDataImported = a3;
}

- (BOOL)identityDataImported
{
  return self->_identityDataImported;
}

- (void)setIdentityDataInternal:(id)a3
{
}

- (NSData)identityDataInternal
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPasswordEncryption:(id)a3
{
}

- (NSString)passwordEncryption
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPasswordKeychainItem:(id)a3
{
}

- (NEKeychainItem)passwordKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDisconnectOnWakeTimeout:(int)a3
{
  self->_disconnectOnWakeTimeout = a3;
}

- (int)disconnectOnWakeTimeout
{
  return self->_disconnectOnWakeTimeout;
}

- (void)setDisconnectOnWake:(BOOL)a3
{
  self->_disconnectOnWake = a3;
}

- (BOOL)disconnectOnWake
{
  return self->_disconnectOnWake;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSliceUUID:(id)a3
{
}

- (NSString)sliceUUID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEnforceRoutes:(BOOL)enforceRoutes
{
  self->_enforceRoutes = enforceRoutes;
}

- (BOOL)enforceRoutes
{
  return self->_enforceRoutes;
}

- (void)setExcludeDeviceCommunication:(BOOL)a3
{
  self->_excludeDeviceCommunication = a3;
}

- (BOOL)excludeDeviceCommunication
{
  return self->_excludeDeviceCommunication;
}

- (void)setExcludeAPNs:(BOOL)excludeAPNs
{
  self->_excludeAPNs = excludeAPNs;
}

- (BOOL)excludeAPNs
{
  return self->_excludeAPNs;
}

- (void)setExcludeCellularServices:(BOOL)excludeCellularServices
{
  self->_excludeCellularServices = excludeCellularServices;
}

- (BOOL)excludeCellularServices
{
  return self->_excludeCellularServices;
}

- (void)setExcludeLocalNetworks:(BOOL)excludeLocalNetworks
{
  self->_excludeLocalNetworks = excludeLocalNetworks;
}

- (BOOL)excludeLocalNetworks
{
  return self->_excludeLocalNetworks;
}

- (void)setIncludeAllNetworks:(BOOL)includeAllNetworks
{
  self->_includeAllNetworks = includeAllNetworks;
}

- (BOOL)includeAllNetworks
{
  return self->_includeAllNetworks;
}

- (void)setProxySettings:(NEProxySettings *)proxySettings
{
}

- (NEProxySettings)proxySettings
{
  return (NEProxySettings *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisconnectOnSleep:(BOOL)disconnectOnSleep
{
  self->_disconnectOnSleep = disconnectOnSleep;
}

- (BOOL)disconnectOnSleep
{
  return self->_disconnectOnSleep;
}

- (void)setIdentityDataPassword:(NSString *)identityDataPassword
{
}

- (NSString)identityDataPassword
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPasswordReference:(NSData *)passwordReference
{
}

- (NSData)passwordReference
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUsername:(NSString *)username
{
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServerAddress:(NSString *)serverAddress
{
}

- (NSString)serverAddress
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)description
{
  return [(NEVPNProtocol *)self descriptionWithIndent:0 options:0];
}

- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3
{
  if (!a3)
  {
    v4 = [(NEVPNProtocol *)self proxySettings];
    [v4 copyPasswordsFromKeychain];

    v5 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];

    if (v5)
    {
      id v7 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];
      v6 = (void *)[v7 copyPassword];
      [(NEVPNProtocol *)self setIdentityDataPassword:v6];
    }
  }
}

- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3
{
  id v4 = [(NEVPNProtocol *)self passwordKeychainItem];
  [v4 migrateFromPreferences:a3];
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  uint64_t v7 = [(NEVPNProtocol *)self passwordKeychainItem];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(NEVPNProtocol *)self passwordKeychainItem];
    uint64_t v10 = [v9 domain];

    if (v10 == a3)
    {
      v11 = [(NEVPNProtocol *)self passwordKeychainItem];
      [v11 setIdentifier:0];
    }
  }
  if (!a3)
  {
    v12 = [(NEVPNProtocol *)self proxySettings];
    v13 = v12;
    if (v12)
    {
      v14 = [v12 HTTPServer];
      -[NEProxyServer removeFromKeychain](v14);

      v15 = [v13 HTTPSServer];
      -[NEProxyServer removeFromKeychain](v15);

      v16 = [v13 FTPServer];
      -[NEProxyServer removeFromKeychain](v16);

      v17 = [v13 RTSPServer];
      -[NEProxyServer removeFromKeychain](v17);

      v18 = [v13 gopherServer];
      -[NEProxyServer removeFromKeychain](v18);

      v19 = [v13 SOCKSServer];
      -[NEProxyServer removeFromKeychain](v19);
    }
  }
  uint64_t v20 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];
  if (v20)
  {
    v22 = (void *)v20;
    v23 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];
    uint64_t v24 = [v23 domain];

    if (v24 == a3)
    {
      v25 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];
      [v25 setIdentifier:0];
    }
  }
  if (!a4 && self && objc_getProperty(self, v21, 96, 1))
  {
    objc_msgSend(objc_getProperty(self, v26, 96, 1), "remove");
    [(NEVPNProtocol *)self setIdentityData:0];
  }
}

- (BOOL)needToUpdateKeychain
{
  uint64_t v3 = [(NEVPNProtocol *)self passwordKeychainItem];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(NEVPNProtocol *)self passwordKeychainItem];
    uint64_t v6 = [v5 password];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      v8 = [(NEVPNProtocol *)self passwordKeychainItem];
      v9 = [v8 password];
      uint64_t v10 = [v9 length];

      if (v10) {
        return 1;
      }
    }
    else
    {
    }
  }
  v12 = [(NEVPNProtocol *)self proxySettings];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 HTTPServer];
    BOOL updated = -[NEProxyServer needToUpdateKeychain](v14);

    if (updated) {
      goto LABEL_12;
    }
    v16 = [v13 HTTPSServer];
    BOOL v17 = -[NEProxyServer needToUpdateKeychain](v16);

    if (v17) {
      goto LABEL_12;
    }
    v18 = [v13 FTPServer];
    BOOL v19 = -[NEProxyServer needToUpdateKeychain](v18);

    if (v19) {
      goto LABEL_12;
    }
    uint64_t v20 = [v13 RTSPServer];
    BOOL v21 = -[NEProxyServer needToUpdateKeychain](v20);

    if (v21
      || ([v13 gopherServer],
          v22 = objc_claimAutoreleasedReturnValue(),
          BOOL v23 = -[NEProxyServer needToUpdateKeychain](v22),
          v22,
          v23))
    {
LABEL_12:
      BOOL v11 = 1;
    }
    else
    {
      v25 = [v13 SOCKSServer];
      BOOL v11 = -[NEProxyServer needToUpdateKeychain](v25);
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v25 = a4;
  id v8 = a5;
  [(NEVPNProtocol *)self syncWithKeychainInDomainCommon:a3];
  uint64_t v9 = [(NEVPNProtocol *)self username];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    BOOL v11 = [(NEVPNProtocol *)self passwordKeychainItem];

    if (!v11)
    {
      v12 = [NEKeychainItem alloc];
      v13 = [v25 identifier];
      v15 = [v13 UUIDString];
      if (self)
      {
        int64_t keychainDomain = self->_keychainDomain;
        id Property = objc_getProperty(self, v14, 88, 1);
      }
      else
      {
        int64_t keychainDomain = 0;
        id Property = 0;
      }
      v18 = [(NEKeychainItem *)v12 initWithIdentifier:v15 domain:keychainDomain accessGroup:Property];
      [(NEVPNProtocol *)self setPasswordKeychainItem:v18];
    }
  }
  uint64_t v19 = [(NEVPNProtocol *)self passwordKeychainItem];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    BOOL v21 = [(NEVPNProtocol *)self passwordKeychainItem];
    uint64_t v22 = [v21 domain];

    if (v22 == a3)
    {
      BOOL v23 = [(NEVPNProtocol *)self passwordKeychainItem];
      uint64_t v24 = [(NEVPNProtocol *)self username];
      [v23 syncUsingConfiguration:v25 accountName:v24 passwordType:0 identifierSuffix:v8];
    }
  }
}

- (void)syncWithKeychainInDomainCommon:(int64_t)a3
{
  if (self)
  {
    id v5 = objc_getProperty(self, a2, 96, 1);
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = objc_msgSend(objc_getProperty(self, v6, 96, 1), "domain");

      if (v8 == a3) {
        objc_msgSend(objc_getProperty(self, v9, 96, 1), "sync");
      }
    }
  }
  if (!a3)
  {
    uint64_t v10 = [(NEVPNProtocol *)self proxySettings];
    BOOL v11 = v10;
    if (v10)
    {
      v12 = [v10 HTTPServer];
      -[NEProxyServer syncWithKeychain](v12);

      v13 = [v11 HTTPSServer];
      -[NEProxyServer syncWithKeychain](v13);

      v14 = [v11 FTPServer];
      -[NEProxyServer syncWithKeychain](v14);

      v15 = [v11 RTSPServer];
      -[NEProxyServer syncWithKeychain](v15);

      v16 = [v11 gopherServer];
      -[NEProxyServer syncWithKeychain](v16);

      BOOL v17 = [v11 SOCKSServer];
      -[NEProxyServer syncWithKeychain](v17);
    }
    [(NEVPNProtocol *)self setIdentityDataPassword:0];
  }
}

- (void)setIdentityData:(NSData *)identityData
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = identityData;
  -[NEVPNProtocol setIdentityDataInternal:](self, "setIdentityDataInternal:", v4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v4)
  {
    CC_SHA1_Init(&v7);
    id v5 = v4;
    CC_SHA1_Update(&v7, [(NSData *)v5 bytes], [(NSData *)v5 length]);
    CC_SHA1_Final(md, &v7);
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
    [(NEVPNProtocol *)self setIdentityDataHash:v6];
  }
  else
  {
    [(NEVPNProtocol *)self setIdentityDataHash:0];
  }
}

- (NSData)identityReferenceInternal
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && objc_getProperty(v2, v3, 96, 1))
  {
    id v5 = objc_getProperty(v2, v4, 96, 1);
    uint64_t v6 = [v5 persistentReference];
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_sync_exit(v2);

  return (NSData *)v6;
}

- (void)setIdentityReferenceInternal:(id)a3
{
  id v14 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v14)
  {
    if (v4 && objc_getProperty(v4, v5, 96, 1))
    {
      id v7 = objc_getProperty(v4, v6, 96, 1);
      [v7 setPersistentReference:v14];
    }
    else
    {
      uint64_t v9 = [NEIdentityKeychainItem alloc];
      if (v4)
      {
        int64_t keychainDomain = v4->_keychainDomain;
        id Property = objc_getProperty(v4, v8, 88, 1);
      }
      else
      {
        int64_t keychainDomain = 0;
        id Property = 0;
      }
      id v7 = Property;
      v13 = [(NEKeychainItem *)v9 initWithPersistentReference:v14 domain:keychainDomain accessGroup:v7];
      if (v4) {
        objc_setProperty_atomic(v4, v12, v13, 96);
      }
    }
  }
  else if (v4)
  {
    objc_setProperty_atomic(v4, v5, 0, 96);
  }
  objc_sync_exit(v4);
}

- (__SCNetworkInterface)createInterface
{
  return 0;
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  CFDictionaryRef v5 = +[NEConfiguration copyConfigurationForProtocol:inService:]((uint64_t)NEConfiguration, (const __CFString *)*MEMORY[0x1E4F41B98], a3);
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    id v7 = [[NEProxySettings alloc] initFromLegacyDictionary:v5];
    [(NEVPNProtocol *)self setProxySettings:v7];

    CFRelease(v6);
  }
  CFDictionaryRef v8 = +[NEConfiguration copyConfigurationForProtocol:inService:]((uint64_t)NEConfiguration, (const __CFString *)*MEMORY[0x1E4F41B80], a3);
  if (v8)
  {
    CFDictionaryRef v9 = v8;
    id v10 = [[NEDNSSettings alloc] initFromLegacyDictionary:v8];
    [(NEVPNProtocol *)self setDNSSettings:v10];

    CFRelease(v9);
  }
  return 1;
}

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  CFDictionaryRef v5 = [(NEVPNProtocol *)self proxySettings];

  if (v5)
  {
    CFDictionaryRef v6 = [(NEVPNProtocol *)self proxySettings];
    CFDictionaryRef v5 = (void *)[v6 copyLegacyDictionary];
  }
  int v7 = +[NEConfiguration setConfiguration:forProtocol:inService:]((uint64_t)NEConfiguration, (const __CFDictionary *)v5, (const __CFString *)*MEMORY[0x1E4F41B98], a3);
  if (v5) {
    CFRelease(v5);
  }
  if (!v7) {
    return 0;
  }
  CFDictionaryRef v8 = [(NEVPNProtocol *)self DNSSettings];

  if (v8)
  {
    CFDictionaryRef v9 = [(NEVPNProtocol *)self DNSSettings];
    CFDictionaryRef v10 = (const __CFDictionary *)[v9 copyLegacyDictionary];
  }
  else
  {
    CFDictionaryRef v10 = 0;
  }
  char v11 = +[NEConfiguration setConfiguration:forProtocol:inService:]((uint64_t)NEConfiguration, v10, (const __CFString *)*MEMORY[0x1E4F41B80], a3);
  if (v10) {
    CFRelease(v10);
  }
  return v11;
}

- (void)initDisconnectOptions:(id)a3
{
  id v9 = a3;
  id v4 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F41F58]];
  if (isa_nsnumber(v4)) {
    self->_disconnectOnIdle = [v4 BOOLValue];
  }
  CFDictionaryRef v5 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F41F60]];

  if (isa_nsnumber(v5)) {
    self->_disconnectOnIdleTimeout = [v5 intValue];
  }
  CFDictionaryRef v6 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F41F70]];

  if (isa_nsnumber(v6)) {
    self->_disconnectOnSleep = [v6 BOOLValue];
  }
  int v7 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F41F78]];

  if (isa_nsnumber(v7)) {
    self->_disconnectOnWake = [v7 BOOLValue];
  }
  CFDictionaryRef v8 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F41F80]];

  if (isa_nsnumber(v8)) {
    self->_disconnectOnWakeTimeout = [v8 intValue];
  }
}

- (void)addDisconnectOptions:(id)a3
{
  id v4 = a3;
  if ([(NEVPNProtocol *)self disconnectOnIdle]) {
    CFDictionaryRef v5 = &unk_1EF08D240;
  }
  else {
    CFDictionaryRef v5 = &unk_1EF08D258;
  }
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F41F58]];
  CFDictionaryRef v6 = objc_msgSend(NSNumber, "numberWithInt:", -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"));
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F41F60]];

  if ([(NEVPNProtocol *)self disconnectOnSleep]) {
    int v7 = &unk_1EF08D240;
  }
  else {
    int v7 = &unk_1EF08D258;
  }
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F41F70]];
  if ([(NEVPNProtocol *)self disconnectOnWake]) {
    CFDictionaryRef v8 = &unk_1EF08D240;
  }
  else {
    CFDictionaryRef v8 = &unk_1EF08D258;
  }
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F41F78]];
  objc_msgSend(NSNumber, "numberWithInt:", -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F41F80]];
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
  int v6 = isa_nsuuid(v5);

  if (v6)
  {
    int v7 = [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
    CFDictionaryRef v8 = [(NEVPNProtocol *)self initWithProtocolIdentifier:v7];

    if (!v8) {
      goto LABEL_27;
    }
  }
  else
  {
    CFDictionaryRef v8 = [(NEVPNProtocol *)self init];
    if (!v8) {
      goto LABEL_27;
    }
  }
  id v9 = [v4 objectForKeyedSubscript:@"__NEVPNProtocolType"];
  int v10 = isa_nsnumber(v9);

  if (v10)
  {
    char v11 = [v4 objectForKeyedSubscript:@"__NEVPNProtocolType"];
    v8->_type = (int)[v11 intValue];
  }
  v12 = [v4 objectForKeyedSubscript:@"__NEVPNKeychainDomain"];
  int v13 = isa_nsnumber(v12);

  if (v13)
  {
    id v14 = [v4 objectForKeyedSubscript:@"__NEVPNKeychainDomain"];
    v8->_int64_t keychainDomain = (int)[v14 intValue];
  }
  uint64_t v15 = *MEMORY[0x1E4F42038];
  v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42038]];
  int v17 = isa_nsstring(v16);

  if (v17)
  {
    v18 = [v4 objectForKeyedSubscript:v15];
    uint64_t v19 = [v18 copy];
    serverAddress = v8->_serverAddress;
    v8->_serverAddress = (NSString *)v19;
  }
  else
  {
    v18 = v8->_serverAddress;
    v8->_serverAddress = (NSString *)&stru_1EF054CB8;
  }

  uint64_t v21 = *MEMORY[0x1E4F41F20];
  uint64_t v22 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41F20]];
  int v23 = isa_nsstring(v22);

  if (v23)
  {
    uint64_t v24 = [v4 objectForKeyedSubscript:v21];
    uint64_t v25 = [v24 copy];
    username = v8->_username;
    v8->_username = (NSString *)v25;
  }
  uint64_t v27 = *MEMORY[0x1E4F41F28];
  v28 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41F28]];
  int v29 = isa_nsstring(v28);

  if (v29)
  {
    uint64_t v30 = *MEMORY[0x1E4F41F30];
    v31 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41F30]];
    int v32 = isa_nsstring(v31);

    if (v32)
    {
      uint64_t v33 = [v4 objectForKeyedSubscript:v30];
      passwordEncryption = v8->_passwordEncryption;
      v8->_passwordEncryption = (NSString *)v33;

      if ([(NSString *)v8->_passwordEncryption isEqualToString:*MEMORY[0x1E4F42138]])
      {
        v35 = [NEKeychainItem alloc];
        v36 = [v4 objectForKeyedSubscript:v27];
        uint64_t v37 = [(NEKeychainItem *)v35 initWithLegacyIdentifier:v36 domain:v8->_keychainDomain accessGroup:v8->_keychainAccessGroup];
        passwordKeychainItem = v8->_passwordKeychainItem;
        v8->_passwordKeychainItem = (NEKeychainItem *)v37;
      }
    }
    if (!v8->_passwordKeychainItem)
    {
      v39 = [NEKeychainItem alloc];
      v40 = [v4 objectForKeyedSubscript:v27];
      uint64_t v41 = [(NEKeychainItem *)v39 initWithPassword:v40 domain:v8->_keychainDomain accessGroup:v8->_keychainAccessGroup];
      v42 = v8->_passwordKeychainItem;
      v8->_passwordKeychainItem = (NEKeychainItem *)v41;
    }
  }
  v43 = [v4 objectForKeyedSubscript:@"PasswordReference"];
  int v44 = isa_nsdata(v43);

  if (v44)
  {
    v45 = [v4 objectForKeyedSubscript:@"PasswordReference"];
    [(NEVPNProtocol *)v8 setPasswordReference:v45];
  }
  uint64_t v46 = *MEMORY[0x1E4F41F88];
  v47 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41F88]];
  int v48 = isa_nsdata(v47);

  if (v48)
  {
    v49 = [NEIdentityKeychainItem alloc];
    v50 = [v4 objectForKeyedSubscript:v46];
    v52 = [(NEKeychainItem *)v49 initWithPersistentReference:v50 domain:v8->_keychainDomain accessGroup:objc_getProperty(v8, v51, 88, 1)];
    objc_setProperty_atomic(v8, v53, v52, 96);
  }
  [(NEVPNProtocol *)v8 initDisconnectOptions:v4];
  uint64_t v54 = *MEMORY[0x1E4F41B40];
  v55 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41B40]];
  int v56 = isa_nsdictionary(v55);

  if (v56)
  {
    v57 = [NEProxySettings alloc];
    v58 = [v4 objectForKeyedSubscript:v54];
    uint64_t v59 = [(NEProxySettings *)v57 initFromLegacyDictionary:v58];
    proxySettings = v8->_proxySettings;
    v8->_proxySettings = (NEProxySettings *)v59;
  }
  v61 = v8;
LABEL_27:

  return v8;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NEVPNProtocol *)self serverAddress];

  if (v4)
  {
    CFDictionaryRef v5 = [(NEVPNProtocol *)self serverAddress];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F42038]];
  }
  int v6 = [(NEVPNProtocol *)self username];

  if (v6)
  {
    int v7 = [(NEVPNProtocol *)self username];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F41F20]];
  }
  CFDictionaryRef v8 = [(NEVPNProtocol *)self passwordKeychainItem];

  if (v8)
  {
    id v9 = [(NEVPNProtocol *)self passwordEncryption];
    int v10 = [v9 isEqualToString:*MEMORY[0x1E4F42138]];

    char v11 = [(NEVPNProtocol *)self passwordKeychainItem];
    v12 = v11;
    if (v10) {
      [v11 identifier];
    }
    else {
    int v13 = [v11 password];
    }

    if (v13) {
      [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F41F28]];
    }
  }
  id v14 = [(NEVPNProtocol *)self passwordReference];

  if (v14)
  {
    uint64_t v15 = [(NEVPNProtocol *)self passwordReference];
    [v3 setObject:v15 forKeyedSubscript:@"PasswordReference"];
  }
  v16 = [(NEVPNProtocol *)self passwordEncryption];

  if (v16)
  {
    v18 = [(NEVPNProtocol *)self passwordEncryption];
    [v3 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F41F30]];
  }
  if (self && objc_getProperty(self, v17, 96, 1))
  {
    uint64_t v20 = objc_msgSend(objc_getProperty(self, v19, 96, 1), "persistentReference");
    [v3 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F41F88]];
  }
  [(NEVPNProtocol *)self addDisconnectOptions:v3];
  uint64_t v21 = [(NEVPNProtocol *)self proxySettings];

  if (v21)
  {
    uint64_t v22 = [(NEVPNProtocol *)self proxySettings];
    int v23 = (void *)[v22 copyLegacyDictionary];
    [v3 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F41B40]];
  }
  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFF7;
  if (self)
  {
    unint64_t v9 = [(NEVPNProtocol *)self type] - 1;
    if (v9 > 5) {
      int v10 = @"<unknown>";
    }
    else {
      int v10 = off_1E5993400[v9];
    }
  }
  else
  {
    int v10 = 0;
  }
  [v7 appendPrettyObject:v10 withName:@"type" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];
  char v11 = [(NEVPNProtocol *)self identifier];
  [v7 appendPrettyObject:v11 withName:@"identifier" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  v12 = [(NEVPNProtocol *)self serverAddress];
  unint64_t v13 = a4 | 9;
  [v7 appendPrettyObject:v12 withName:@"serverAddress" andIndent:v5 options:a4 | 9];

  id v14 = [(NEVPNProtocol *)self username];
  [v7 appendPrettyObject:v14 withName:@"username" andIndent:v5 options:a4 | 9];

  uint64_t v15 = [(NEVPNProtocol *)self passwordKeychainItem];
  [v7 appendPrettyObject:v15 withName:@"password" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  v16 = [(NEVPNProtocol *)self passwordEncryption];
  [v7 appendPrettyObject:v16 withName:@"passwordEncryption" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  int v17 = [(NEVPNProtocol *)self passwordReference];
  unint64_t v18 = a4 | 8;
  [v7 appendPrettyObject:v17 withName:@"passwordReference" andIndent:v5 options:v18];

  if (self) {
    id Property = objc_getProperty(self, v19, 96, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"identity" andIndent:v5 options:v8];
  uint64_t v21 = [(NEVPNProtocol *)self identityDataInternal];
  if (v21)
  {
    uint64_t v22 = NSString;
    int v23 = [(NEVPNProtocol *)self identityDataInternal];
    uint64_t v24 = objc_msgSend(v22, "stringWithFormat:", @"%lu bytes", objc_msgSend(v23, "length"));
    [v7 appendPrettyObject:v24 withName:@"identityData" andIndent:v5 options:v18];
  }
  else
  {
    [v7 appendPrettyObject:0 withName:@"identityData" andIndent:v5 options:v18];
  }

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol identityDataImported](self, "identityDataImported"), @"identityDataImported", v5, v8);
  uint64_t v25 = [(NEVPNProtocol *)self identityDataHash];
  [v7 appendPrettyObject:v25 withName:@"identityDataHash" andIndent:v5 options:v8];

  v26 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];
  [v7 appendPrettyObject:v26 withName:@"identityDataPassword" andIndent:v5 options:v8];

  uint64_t v27 = [(NEVPNProtocol *)self identityReference];
  [v7 appendPrettyObject:v27 withName:@"identityReference" andIndent:v5 options:v18];

  v28 = [(NEVPNProtocol *)self identityDataPassword];
  [v7 appendPrettyObject:v28 withName:@"identityDataPassword" andIndent:v5 options:v13];

  int v29 = [(NEVPNProtocol *)self proxySettings];
  [v7 appendPrettyObject:v29 withName:@"proxySettings" andIndent:v5 options:v18];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol disconnectOnSleep](self, "disconnectOnSleep"), @"disconnectOnSleep", v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol disconnectOnIdle](self, "disconnectOnIdle"), @"disconnectOnIdle", v5, v8);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"), @"disconnectOnIdleTimeout", v5, v8);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol disconnectOnWake](self, "disconnectOnWake"), @"disconnectOnWake", v5, v8);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"), @"disconnectOnWakeTimeout", v5, v8);
  uint64_t v30 = [(NEVPNProtocol *)self DNSSettings];
  [v7 appendPrettyObject:v30 withName:@"DNSSettings" andIndent:v5 options:v8];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol includeAllNetworks](self, "includeAllNetworks"), @"includeAllNetworks", v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol excludeLocalNetworks](self, "excludeLocalNetworks"), @"excludeLocalNetworks", v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol excludeCellularServices](self, "excludeCellularServices"), @"excludeCellularServices", v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol excludeAPNs](self, "excludeAPNs"), @"excludeAPNs", v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol excludeDeviceCommunication](self, "excludeDeviceCommunication"), @"excludeDeviceCommunication", v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol enforceRoutes](self, "enforceRoutes"), @"enforceRoutes", v5, v18);
  v31 = [(NEVPNProtocol *)self extensibleSSOProvider];
  [v7 appendPrettyObject:v31 withName:@"extensibleSSOProvider" andIndent:v5 options:v8];

  int v32 = [(NEVPNProtocol *)self sliceUUID];
  [v7 appendPrettyObject:v32 withName:@"cellularSliceUUID" andIndent:v5 options:v13];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  if ([(NEVPNProtocol *)self type] == 2
    || ([(NEVPNProtocol *)self serverAddress],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        (id)v5,
        v5))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing server address", v4);
  }
  uint64_t v6 = [(NEVPNProtocol *)self proxySettings];
  if (v6)
  {
    int v7 = (void *)v6;
    unint64_t v8 = [(NEVPNProtocol *)self proxySettings];
    char v9 = [v8 checkValidityAndCollectErrors:v4];

    LOBYTE(v5) = v5 & v9;
  }
  uint64_t v10 = [(NEVPNProtocol *)self DNSSettings];
  if (v10)
  {
    char v11 = (void *)v10;
    v12 = [(NEVPNProtocol *)self DNSSettings];
    char v13 = [v12 checkValidityAndCollectErrors:v4];

    LOBYTE(v5) = v5 & v13;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(NEVPNProtocol *)self identifier];
  uint64_t v6 = (void *)[v4 initWithProtocolIdentifier:v5];

  int v7 = [(NEVPNProtocol *)self serverAddress];
  [v6 setServerAddress:v7];

  unint64_t v8 = [(NEVPNProtocol *)self username];
  [v6 setUsername:v8];

  char v9 = [(NEVPNProtocol *)self passwordReference];
  [v6 setPasswordReference:v9];

  if (self)
  {
    id Property = objc_getProperty(self, v10, 96, 1);
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id Property = 0;
  if (v6) {
LABEL_3:
  }
    objc_setProperty_atomic(v6, v10, Property, 96);
LABEL_4:
  v12 = [(NEVPNProtocol *)self identityDataInternal];
  [v6 setIdentityDataInternal:v12];

  char v13 = [(NEVPNProtocol *)self identityDataPassword];
  [v6 setIdentityDataPassword:v13];

  id v14 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];
  [v6 setIdentityDataPasswordKeychainItem:v14];

  objc_msgSend(v6, "setIdentityDataImported:", -[NEVPNProtocol identityDataImported](self, "identityDataImported"));
  uint64_t v15 = [(NEVPNProtocol *)self identityDataHash];
  [v6 setIdentityDataHash:v15];

  v16 = [(NEVPNProtocol *)self proxySettings];
  [v6 setProxySettings:v16];

  objc_msgSend(v6, "setDisconnectOnIdle:", -[NEVPNProtocol disconnectOnIdle](self, "disconnectOnIdle"));
  objc_msgSend(v6, "setDisconnectOnIdleTimeout:", -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"));
  objc_msgSend(v6, "setDisconnectOnSleep:", -[NEVPNProtocol disconnectOnSleep](self, "disconnectOnSleep"));
  objc_msgSend(v6, "setDisconnectOnWake:", -[NEVPNProtocol disconnectOnWake](self, "disconnectOnWake"));
  objc_msgSend(v6, "setDisconnectOnWakeTimeout:", -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"));
  int v17 = [(NEVPNProtocol *)self passwordKeychainItem];
  [v6 setPasswordKeychainItem:v17];

  unint64_t v18 = [(NEVPNProtocol *)self passwordEncryption];
  [v6 setPasswordEncryption:v18];

  if (!self)
  {
    int64_t keychainDomain = 0;
    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  int64_t keychainDomain = self->_keychainDomain;
  if (v6) {
LABEL_6:
  }
    v6[10] = keychainDomain;
LABEL_7:
  uint64_t v20 = [(NEVPNProtocol *)self DNSSettings];
  [v6 setDNSSettings:v20];

  objc_msgSend(v6, "setIncludeAllNetworks:", -[NEVPNProtocol includeAllNetworks](self, "includeAllNetworks"));
  objc_msgSend(v6, "setExcludeLocalNetworks:", -[NEVPNProtocol excludeLocalNetworks](self, "excludeLocalNetworks"));
  objc_msgSend(v6, "setExcludeCellularServices:", -[NEVPNProtocol excludeCellularServices](self, "excludeCellularServices"));
  objc_msgSend(v6, "setExcludeAPNs:", -[NEVPNProtocol excludeAPNs](self, "excludeAPNs"));
  objc_msgSend(v6, "setExcludeDeviceCommunication:", -[NEVPNProtocol excludeDeviceCommunication](self, "excludeDeviceCommunication"));
  objc_msgSend(v6, "setEnforceRoutes:", -[NEVPNProtocol enforceRoutes](self, "enforceRoutes"));
  uint64_t v21 = [(NEVPNProtocol *)self extensibleSSOProvider];
  [v6 setExtensibleSSOProvider:v21];

  uint64_t v22 = [(NEVPNProtocol *)self sliceUUID];
  [v6 setSliceUUID:v22];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  objc_msgSend(v20, "encodeInt32:forKey:", -[NEVPNProtocol type](self, "type"), @"Type");
  id v4 = [(NEVPNProtocol *)self identifier];
  [v20 encodeObject:v4 forKey:@"Identifier"];

  uint64_t v5 = [(NEVPNProtocol *)self passwordReference];
  [v20 encodeObject:v5 forKey:@"PasswordReference"];

  uint64_t v6 = [(NEVPNProtocol *)self serverAddress];
  [v20 encodeObject:v6 forKey:@"ServerAddress"];

  int v7 = [(NEVPNProtocol *)self username];
  [v20 encodeObject:v7 forKey:@"Username"];

  unint64_t v8 = [(NEVPNProtocol *)self passwordKeychainItem];
  [v20 encodeObject:v8 forKey:@"Password"];

  char v9 = [(NEVPNProtocol *)self passwordEncryption];
  [v20 encodeObject:v9 forKey:@"PasswordEncryption"];

  if (self) {
    id Property = objc_getProperty(self, v10, 96, 1);
  }
  else {
    id Property = 0;
  }
  [v20 encodeObject:Property forKey:@"Identity"];
  v12 = [(NEVPNProtocol *)self identityDataInternal];
  [v20 encodeObject:v12 forKey:@"IdentityData"];

  char v13 = [(NEVPNProtocol *)self identityDataPassword];
  [v20 encodeObject:v13 forKey:@"IdentityDataPassword"];

  id v14 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];
  [v20 encodeObject:v14 forKey:@"IdentityDataPasswordKeychainItem"];

  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol identityDataImported](self, "identityDataImported"), @"IdentityDataImported");
  uint64_t v15 = [(NEVPNProtocol *)self identityDataHash];
  [v20 encodeObject:v15 forKey:@"IdentityDataHash"];

  v16 = [(NEVPNProtocol *)self proxySettings];
  [v20 encodeObject:v16 forKey:@"ProxySettings"];

  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol disconnectOnIdle](self, "disconnectOnIdle"), @"DisconnectOnIdle");
  objc_msgSend(v20, "encodeInt32:forKey:", -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"), @"DisconnectOnIdleTimeout");
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol disconnectOnSleep](self, "disconnectOnSleep"), @"DisconnectOnSleep");
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol disconnectOnWake](self, "disconnectOnWake"), @"DisconnectOnWake");
  objc_msgSend(v20, "encodeInt32:forKey:", -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"), @"DisconnectOnWakeTimeout");
  int v17 = [(NEVPNProtocol *)self DNSSettings];
  [v20 encodeObject:v17 forKey:@"DNSSettings"];

  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol includeAllNetworks](self, "includeAllNetworks"), @"IncludeAllNetworks");
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol excludeLocalNetworks](self, "excludeLocalNetworks"), @"ExcludeLocalNetworks");
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol excludeCellularServices](self, "excludeCellularServices"), @"ExcludeCellularServices");
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol excludeAPNs](self, "excludeAPNs"), @"ExcludeAPNs");
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol excludeDeviceCommunication](self, "excludeDeviceCommunication"), @"ExcludeDeviceCommunication");
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol enforceRoutes](self, "enforceRoutes"), @"EnforceRoutes");
  unint64_t v18 = [(NEVPNProtocol *)self extensibleSSOProvider];
  [v20 encodeObject:v18 forKey:@"ExtensibleSSOProvider"];

  uint64_t v19 = [(NEVPNProtocol *)self sliceUUID];
  [v20 encodeObject:v19 forKey:@"CellularSliceUUID"];
}

- (NEVPNProtocol)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEVPNProtocol *)self init];
  if (v5)
  {
    v5->_type = (int)[v4 decodeInt32ForKey:@"Type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    int v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v8;
    }
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PasswordReference"];
    passwordReference = v5->_passwordReference;
    v5->_passwordReference = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerAddress"];
    serverAddress = v5->_serverAddress;
    v5->_serverAddress = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Username"];
    username = v5->_username;
    v5->_username = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Password"];
    passwordKeychainItem = v5->_passwordKeychainItem;
    v5->_passwordKeychainItem = (NEKeychainItem *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PasswordEncryption"];
    passwordEncryption = v5->_passwordEncryption;
    v5->_passwordEncryption = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identity"];
    identity = v5->_identity;
    v5->_identity = (NEIdentityKeychainItem *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityData"];
    identityDataInternal = v5->_identityDataInternal;
    v5->_identityDataInternal = (NSData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataPassword"];
    identityDataPassword = v5->_identityDataPassword;
    v5->_identityDataPassword = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataPasswordKeychainItem"];
    identityDataPasswordKeychainItem = v5->_identityDataPasswordKeychainItem;
    v5->_identityDataPasswordKeychainItem = (NEKeychainItem *)v26;

    v5->_identityDataImported = [v4 decodeBoolForKey:@"IdentityDataImported"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataHash"];
    identityDataHash = v5->_identityDataHash;
    v5->_identityDataHash = (NSData *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxySettings"];
    proxySettings = v5->_proxySettings;
    v5->_proxySettings = (NEProxySettings *)v30;

    v5->_disconnectOnIdle = [v4 decodeBoolForKey:@"DisconnectOnIdle"];
    v5->_disconnectOnIdleTimeout = [v4 decodeInt32ForKey:@"DisconnectOnIdleTimeout"];
    v5->_disconnectOnSleep = [v4 decodeBoolForKey:@"DisconnectOnSleep"];
    v5->_disconnectOnWake = [v4 decodeBoolForKey:@"DisconnectOnWake"];
    v5->_disconnectOnWakeTimeout = [v4 decodeInt32ForKey:@"DisconnectOnWakeTimeout"];
    v5->_disconnectOnUserSwitch = [v4 decodeBoolForKey:@"DisconnectOnUserSwitch"];
    v5->_disconnectOnLogout = [v4 decodeBoolForKey:@"DisconnectOnLogoutKey"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNSSettings"];
    DNSSettings = v5->_DNSSettings;
    v5->_DNSSettings = (NEDNSSettings *)v32;

    v5->_includeAllNetworks = [v4 decodeBoolForKey:@"IncludeAllNetworks"];
    if ([v4 containsValueForKey:@"ExcludeLocalNetworks"]) {
      v5->_excludeLocalNetworks = [v4 decodeBoolForKey:@"ExcludeLocalNetworks"];
    }
    if ([v4 containsValueForKey:@"ExcludeCellularServices"]) {
      v5->_excludeCellularServices = [v4 decodeBoolForKey:@"ExcludeCellularServices"];
    }
    if ([v4 containsValueForKey:@"ExcludeAPNs"]) {
      v5->_excludeAPNs = [v4 decodeBoolForKey:@"ExcludeAPNs"];
    }
    if ([v4 containsValueForKey:@"ExcludeDeviceCommunication"]) {
      v5->_excludeDeviceCommunication = [v4 decodeBoolForKey:@"ExcludeDeviceCommunication"];
    }
    v5->_enforceRoutes = [v4 decodeBoolForKey:@"EnforceRoutes"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExtensibleSSOProvider"];
    extensibleSSOProvider = v5->_extensibleSSOProvider;
    v5->_extensibleSSOProvider = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CellularSliceUUID"];
    sliceUUID = v5->_sliceUUID;
    v5->_sliceUUID = (NSString *)v36;
  }
  return v5;
}

- (NEVPNProtocol)initWithProtocolIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEVPNProtocol *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    *(_DWORD *)&v5->_excludeLocalNetworks = 16843009;
  }

  return v5;
}

- (NEVPNProtocol)initWithType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NEVPNProtocol;
  id v4 = [(NEVPNProtocol *)&v9 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_int64_t keychainDomain = 0;
    v4->_type = a3;
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    *(_DWORD *)&v5->_excludeLocalNetworks = 16843009;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end