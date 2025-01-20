@interface NEConfiguration
+ (BOOL)supportsSecureCoding;
+ (CFDictionaryRef)copyConfigurationForProtocol:(const __SCNetworkService *)a3 inService:;
+ (NEConfiguration)configurationWithProfilePayload:(id)a3;
+ (NEConfiguration)configurationWithProfilePayload:(id)a3 grade:(int64_t)a4;
+ (uint64_t)setConfiguration:(const __CFString *)a3 forProtocol:(const __SCNetworkService *)a4 inService:;
+ (void)addError:(void *)a3 toList:;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)configureVpnOnDemand:(void *)a3 vpnType:;
- (BOOL)configureVpnOnDemandRules:(void *)a1;
- (BOOL)ingestDisconnectOptions:(void *)a1;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupportedBySC;
- (BOOL)isTransparentProxy;
- (BOOL)setAppLayerVPNUUID:(id)a3 andSafariDomains:(id)a4;
- (BOOL)setAssociatedDomains:(id)a3;
- (BOOL)setCalendarDomains:(id)a3;
- (BOOL)setCalendarDomains:(id)a3 accountIdentifiers:(id)a4;
- (BOOL)setCertificates:(id)a3;
- (BOOL)setCertificates:(id)a3 keyRefs:(id)a4 specs:(id)a5;
- (BOOL)setConfigurationVPNPassword:(void *)a1;
- (BOOL)setContactsDomains:(id)a3;
- (BOOL)setContactsDomains:(id)a3 accountIdentifiers:(id)a4;
- (BOOL)setExcludedDomains:(id)a3;
- (BOOL)setMailDomains:(id)a3;
- (BOOL)setMailDomains:(id)a3 accountIdentifiers:(id)a4;
- (BOOL)setPayloadInfoCommon:(id)a3 payloadOrganization:(id)a4;
- (BOOL)setPayloadInfoIdentity:(id)a3;
- (BOOL)setPerAppRuleSettings:(id)a3 withAppIdentifier:(id)a4;
- (BOOL)setPerAppUUID:(id)a3 andSafariDomains:(id)a4;
- (BOOL)setProfileInfo:(id)a3;
- (BOOL)setRestrictDomains:(BOOL)a3;
- (BOOL)setSMBDomains:(id)a3;
- (BOOL)usesPolicyBasedRouting;
- (NEAOVPN)alwaysOnVPN;
- (NEAppPush)appPush;
- (NEConfiguration)initWithCoder:(id)a3;
- (NEConfiguration)initWithName:(id)a3 grade:(int64_t)a4;
- (NEContentFilter)contentFilter;
- (NEDNSProxy)dnsProxy;
- (NEDNSSettingsBundle)dnsSettings;
- (NEPathController)pathController;
- (NEProfileIngestionPayloadInfo)payloadInfo;
- (NERelayConfiguration)relay;
- (NEVPN)VPN;
- (NEVPNApp)appVPN;
- (NSObject)copyMachOUUIDsFromBundleIdentifier:(uint64_t)a1;
- (NSObject)initWithContentFilterPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (NSString)application;
- (NSString)applicationIdentifier;
- (NSString)applicationName;
- (NSString)externalIdentifier;
- (NSString)name;
- (NSString)pluginType;
- (NSUUID)identifier;
- (__CFString)initWithAlwaysOnVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)copyProviderMachOUUIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithOptions:(unint64_t)a3;
- (id)generateSignature;
- (id)getCertificates;
- (id)getConfigurationIdentifier;
- (id)getConfigurationProtocol;
- (id)getPendingCertificateInfo:(id)a3;
- (id)getPendingCertificateUUIDs:(id)a3;
- (id)getPendingCertificateUUIDsDNSSettings:(void *)a1;
- (id)getPendingCertificateUUIDsInternal:(void *)a1;
- (id)getPendingCertificateUUIDsRelay:(void *)a1;
- (id)initWithAppLayerVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)initWithDNSProxyPayload:(id)a1 configurationName:(void *)a2 grade:(void *)a3;
- (id)initWithDNSSettingsPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)initWithIdentifier:(id *)a1;
- (id)initWithPathControllerPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)initWithRelayPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)initWithVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:;
- (id)mergeArray:(void *)a3 withArray:;
- (int64_t)grade;
- (uint64_t)applyChangesToSCServiceInPreferences:(void *)a1;
- (uint64_t)configureIKE:(void *)a3 vpnType:(void *)a4 payloadBase:(void *)a5 vpn:;
- (uint64_t)configurePPPWithVPNOptions:(void *)a3 payloadBase:;
- (uint64_t)configurePluginWithPayload:(void *)a3 pluginType:(void *)a4 payloadType:(void *)a5 vpnType:;
- (uint64_t)ingestDNSOptions:(void *)a1;
- (uint64_t)ingestIPSecDict:(void *)a3 vpnType:(void *)a4 vpn:;
- (uint64_t)ingestProxyOptions:(void *)a1;
- (uint64_t)setCertificateContentFilter:(void *)a1;
- (uint64_t)setCertificateDNSSettings:(void *)a1;
- (uint64_t)setCertificatesRelay:(void *)a3 keyRefs:(void *)a4 specs:;
- (uint64_t)updateFromSCService:(void *)a1;
- (uint64_t)validateStrings:(uint64_t)a1;
- (unint64_t)hash;
- (void)applyOverrides;
- (void)clearKeychainInDomain:(void *)a1;
- (void)clearSystemKeychain;
- (void)copyPasswordsFromSystemKeychain;
- (void)encodeWithCoder:(id)a3;
- (void)setAlwaysOnVPN:(id)a3;
- (void)setAppPush:(id)a3;
- (void)setAppVPN:(id)a3;
- (void)setApplication:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setContentFilter:(id)a3;
- (void)setDnsProxy:(id)a3;
- (void)setDnsSettings:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPathController:(id)a3;
- (void)setPayloadInfo:(id)a3;
- (void)setRelay:(id)a3;
- (void)setVPN:(id)a3;
- (void)syncWithKeychainInDomain:(void *)a1;
@end

@implementation NEConfiguration

- (NEPathController)pathController
{
  return (NEPathController *)objc_getProperty(self, a2, 112, 1);
}

- (NEVPN)VPN
{
  return (NEVPN *)objc_getProperty(self, a2, 80, 1);
}

- (NERelayConfiguration)relay
{
  return (NERelayConfiguration *)objc_getProperty(self, a2, 144, 1);
}

- (NEVPNApp)appVPN
{
  return (NEVPNApp *)objc_getProperty(self, a2, 96, 1);
}

- (NEAOVPN)alwaysOnVPN
{
  return (NEAOVPN *)objc_getProperty(self, a2, 88, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NEConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)NEConfiguration;
  v5 = [(NEConfiguration *)&v37 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExternalIdentifierString"];
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Application"];
    application = v5->_application;
    v5->_application = (NSString *)v10;

    v5->_grade = (int)[v4 decodeInt32ForKey:@"Grade"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VPN"];
    VPN = v5->_VPN;
    v5->_VPN = (NEVPN *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AlwaysOnVPN"];
    alwaysOnVPN = v5->_alwaysOnVPN;
    v5->_alwaysOnVPN = (NEAOVPN *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppVPN"];
    appVPN = v5->_appVPN;
    v5->_appVPN = (NEVPNApp *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContentFilter"];
    contentFilter = v5->_contentFilter;
    v5->_contentFilter = (NEContentFilter *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
    name = v5->_name;
    v5->_name = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProfileInfo"];
    payloadInfo = v5->_payloadInfo;
    v5->_payloadInfo = (NEProfileIngestionPayloadInfo *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ApplicationName"];
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v24;

    objc_storeStrong((id *)&v5->_applicationIdentifier, v5->_application);
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PathController"];
    pathController = v5->_pathController;
    v5->_pathController = (NEPathController *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNSProxy"];
    dnsProxy = v5->_dnsProxy;
    v5->_dnsProxy = (NEDNSProxy *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNSSettings"];
    dnsSettings = v5->_dnsSettings;
    v5->_dnsSettings = (NEDNSSettingsBundle *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppPush"];
    appPush = v5->_appPush;
    v5->_appPush = (NEAppPush *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Relay"];
    relay = v5->_relay;
    v5->_relay = (NERelayConfiguration *)v34;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerMachOUUIDs, 0);
  objc_storeStrong((id *)&self->_relay, 0);
  objc_storeStrong((id *)&self->_appPush, 0);
  objc_storeStrong((id *)&self->_dnsSettings, 0);
  objc_storeStrong((id *)&self->_dnsProxy, 0);
  objc_storeStrong((id *)&self->_pathController, 0);
  objc_storeStrong((id *)&self->_contentFilter, 0);
  objc_storeStrong((id *)&self->_appVPN, 0);
  objc_storeStrong((id *)&self->_alwaysOnVPN, 0);
  objc_storeStrong((id *)&self->_VPN, 0);
  objc_storeStrong((id *)&self->_payloadInfo, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setRelay:(id)a3
{
}

- (void)setAppPush:(id)a3
{
}

- (NEAppPush)appPush
{
  return (NEAppPush *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDnsSettings:(id)a3
{
}

- (NEDNSSettingsBundle)dnsSettings
{
  return (NEDNSSettingsBundle *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDnsProxy:(id)a3
{
}

- (NEDNSProxy)dnsProxy
{
  return (NEDNSProxy *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPathController:(id)a3
{
}

- (void)setContentFilter:(id)a3
{
}

- (NEContentFilter)contentFilter
{
  return (NEContentFilter *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAppVPN:(id)a3
{
}

- (void)setAlwaysOnVPN:(id)a3
{
}

- (void)setVPN:(id)a3
{
}

- (void)setPayloadInfo:(id)a3
{
}

- (NEProfileIngestionPayloadInfo)payloadInfo
{
  return (NEProfileIngestionPayloadInfo *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExternalIdentifier:(id)a3
{
}

- (NSString)externalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)applicationName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)grade
{
  return self->_grade;
}

- (BOOL)usesPolicyBasedRouting
{
  v3 = [(NEConfiguration *)self VPN];
  if (v3
    || ([(NEConfiguration *)self appVPN], (v3 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(NEConfiguration *)self alwaysOnVPN], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    uint64_t v12 = [(NEConfiguration *)self relay];

    if (!v12) {
      return 0;
    }
  }
  uint64_t v4 = [(NEConfiguration *)self VPN];
  if (!v4) {
    return 1;
  }
  v5 = (void *)v4;
  uint64_t v6 = [(NEConfiguration *)self VPN];
  v7 = [v6 protocol];
  if ([v7 includeAllNetworks])
  {
    char v8 = 1;
  }
  else
  {
    v9 = [(NEConfiguration *)self VPN];
    uint64_t v10 = [v9 protocol];
    char v8 = [v10 enforceRoutes];
  }
  return v8;
}

- (void)applyOverrides
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!os_variant_has_internal_content() || csr_check()) {
    return;
  }
  v3 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"NEHelper control settings", @"/Library/Preferences/com.apple.networkextension.control.plist");
  if (v3)
  {
    uint64_t v4 = v3;
    CFPropertyListRef Value = SCPreferencesGetValue(v3, @"ConfigurationOverrides");
    uint64_t v6 = (void *)Value;
    if (NEInitCFTypes_onceToken == -1)
    {
      if (Value)
      {
LABEL_6:
        uint64_t v7 = CFDICTIONARY_TYPE;
        if (CFGetTypeID(v6) == v7 && CFDictionaryGetCount((CFDictionaryRef)v6) >= 1) {
          uint64_t v6 = (void *)[v6 copy];
        }
        else {
          uint64_t v6 = 0;
        }
      }
    }
    else
    {
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
      if (v6) {
        goto LABEL_6;
      }
    }
    CFRelease(v4);
    goto LABEL_12;
  }
  uint64_t v6 = 0;
LABEL_12:
  if (isa_nsdictionary(v6))
  {
    uint64_t v20 = v6;
    char v8 = [(NEConfiguration *)self name];
    v19 = [v20 objectForKeyedSubscript:v8];

    v9 = v19;
    if (isa_nsdictionary(v19))
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = v19;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (isa_nsstring(v14))
            {
              v15 = [v10 objectForKeyedSubscript:v14];
              if (isa_nsstring(v15)
                && [v15 isEqualToString:@"nil"])
              {

                v15 = 0;
              }
              [(NEConfiguration *)self setValue:v15 forKeyPath:v14];
              uint64_t v16 = ne_log_obj();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                v17 = [(NEConfiguration *)self name];
                *(_DWORD *)buf = 138412802;
                uint64_t v26 = v17;
                __int16 v27 = 2112;
                uint64_t v28 = v14;
                __int16 v29 = 2112;
                uint64_t v30 = v15;
                _os_log_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEFAULT, "%@: configuration overrides set %@ to %@", buf, 0x20u);
              }
            }
            else
            {
              v15 = ne_log_obj();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                uint64_t v18 = [(NEConfiguration *)self name];
                *(_DWORD *)buf = 138412546;
                uint64_t v26 = v18;
                __int16 v27 = 2112;
                uint64_t v28 = v14;
                _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "%@: Key path in overrides is not a string: %@", buf, 0x16u);
              }
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
        }
        while (v11);
      }

      v9 = v19;
    }

    uint64_t v6 = v20;
  }
}

- (void)copyPasswordsFromSystemKeychain
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(NEConfiguration *)self VPN];
  uint64_t v4 = [v3 protocol];

  if (v4
    || ([(NEConfiguration *)self appVPN],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 protocol],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    [v4 copyPasswordsFromKeychainInDomain:0];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(NEConfiguration *)self relay];
  uint64_t v7 = [v6 relays];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) copyPasswordsFromKeychainInDomain:0];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)isEnabled
{
  v3 = [(NEConfiguration *)self VPN];

  if (v3)
  {
    uint64_t v4 = [(NEConfiguration *)self VPN];
LABEL_19:
    long long v13 = v4;
    char v14 = [v4 isEnabled];

    return v14;
  }
  v5 = [(NEConfiguration *)self appVPN];

  if (v5)
  {
    uint64_t v4 = [(NEConfiguration *)self appVPN];
    goto LABEL_19;
  }
  uint64_t v6 = [(NEConfiguration *)self pathController];

  if (v6)
  {
    uint64_t v4 = [(NEConfiguration *)self pathController];
    goto LABEL_19;
  }
  uint64_t v7 = [(NEConfiguration *)self appPush];

  if (v7)
  {
    uint64_t v4 = [(NEConfiguration *)self appPush];
    goto LABEL_19;
  }
  uint64_t v8 = [(NEConfiguration *)self contentFilter];

  if (v8)
  {
    uint64_t v4 = [(NEConfiguration *)self contentFilter];
    goto LABEL_19;
  }
  uint64_t v9 = [(NEConfiguration *)self dnsProxy];

  if (v9)
  {
    uint64_t v4 = [(NEConfiguration *)self dnsProxy];
    goto LABEL_19;
  }
  uint64_t v10 = [(NEConfiguration *)self dnsSettings];

  if (v10)
  {
    uint64_t v4 = [(NEConfiguration *)self dnsSettings];
    goto LABEL_19;
  }
  uint64_t v11 = [(NEConfiguration *)self relay];

  if (v11)
  {
    uint64_t v4 = [(NEConfiguration *)self relay];
    goto LABEL_19;
  }
  long long v12 = [(NEConfiguration *)self alwaysOnVPN];

  if (v12)
  {
    uint64_t v4 = [(NEConfiguration *)self alwaysOnVPN];
    goto LABEL_19;
  }
  return 0;
}

- (BOOL)isTransparentProxy
{
  v3 = [(NEConfiguration *)self VPN];
  if (v3)
  {
    uint64_t v4 = [(NEConfiguration *)self VPN];
    if ([v4 tunnelType] == 2)
    {
      v5 = [(NEConfiguration *)self VPN];
      uint64_t v6 = [v5 protocol];
      if (v6)
      {
        uint64_t v7 = [(NEConfiguration *)self VPN];
        uint64_t v8 = [v7 protocol];
        BOOL v9 = [v8 type] == 4;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)pluginType
{
  v3 = [(NEConfiguration *)self VPN];
  if (v3)
  {
    uint64_t v4 = [(NEConfiguration *)self VPN];
    v5 = [v4 protocol];
    uint64_t v6 = [v5 type];

    if (v6 == 4)
    {
      uint64_t v7 = [(NEConfiguration *)self VPN];
      uint64_t v8 = [v7 protocol];
      v3 = [v8 pluginType];
    }
    else
    {
      v3 = 0;
    }
  }
  uint64_t v9 = [(NEConfiguration *)self appVPN];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(NEConfiguration *)self appVPN];
    long long v12 = [v11 protocol];
    uint64_t v13 = [v12 type];

    if (v13 == 4)
    {
      char v14 = [(NEConfiguration *)self appVPN];
      long long v15 = [v14 protocol];
      uint64_t v16 = [v15 pluginType];
      if (v3)
      {
        char v17 = [v3 isEqualToString:v16];

        if (v17) {
          goto LABEL_12;
        }
        uint64_t v16 = 0;
        char v14 = v3;
      }
      else
      {
      }
      v3 = v16;
    }
  }
LABEL_12:
  uint64_t v18 = [(NEConfiguration *)self contentFilter];

  if (!v18) {
    goto LABEL_18;
  }
  v19 = [(NEConfiguration *)self contentFilter];
  uint64_t v20 = [v19 provider];
  long long v21 = [v20 pluginType];
  if (v3)
  {
    char v22 = [v3 isEqualToString:v21];

    if (v22) {
      goto LABEL_18;
    }
    long long v21 = 0;
    v19 = v3;
  }
  else
  {
  }
  v3 = v21;
LABEL_18:
  long long v23 = [(NEConfiguration *)self dnsProxy];

  if (!v23) {
    goto LABEL_24;
  }
  long long v24 = [(NEConfiguration *)self dnsProxy];
  v25 = [v24 protocol];
  uint64_t v26 = [v25 pluginType];
  if (v3)
  {
    char v27 = [v3 isEqualToString:v26];

    if (v27) {
      goto LABEL_24;
    }
    uint64_t v26 = 0;
    long long v24 = v3;
  }
  else
  {
  }
  v3 = v26;
LABEL_24:
  uint64_t v28 = [(NEConfiguration *)self appPush];

  if (!v28) {
    goto LABEL_30;
  }
  __int16 v29 = [(NEConfiguration *)self appPush];
  uint64_t v30 = [v29 pluginType];
  if (v3)
  {
    char v31 = [v3 isEqualToString:v30];

    if (v31) {
      goto LABEL_30;
    }
    uint64_t v30 = 0;
  }
  else
  {
    v3 = v29;
  }

  v3 = v30;
LABEL_30:

  return (NSString *)v3;
}

- (void)clearSystemKeychain
{
}

- (void)clearKeychainInDomain:(void *)a1
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if ([a1 grade] == 2)
  {
    uint64_t v4 = [a1 VPN];
    v5 = [v4 protocol];
    if ([v5 type] == 1)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v7 = [a1 VPN];
      uint64_t v8 = [v7 protocol];
      BOOL v6 = [v8 type] == 5;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  BOOL v9 = !v6;
  uint64_t v10 = [a1 VPN];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    long long v12 = [a1 VPN];
    uint64_t v13 = [v12 protocol];

    if (v13)
    {
      char v14 = [a1 VPN];
LABEL_14:
      v19 = v14;
      uint64_t v20 = [v14 protocol];
      [v20 removeKeychainItemsInDomain:a2 keepIdentity:!v6];

      goto LABEL_15;
    }
  }
  uint64_t v15 = [a1 appVPN];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    char v17 = [a1 appVPN];
    uint64_t v18 = [v17 protocol];

    if (v18)
    {
      char v14 = [a1 appVPN];
      goto LABEL_14;
    }
  }
  __int16 v29 = [a1 alwaysOnVPN];

  if (!v29) {
    goto LABEL_16;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v30 = [a1 alwaysOnVPN];
  v19 = [v30 interfaceProtocolMapping];

  uint64_t v31 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(v19);
        }
        uint64_t v35 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        v36 = [a1 alwaysOnVPN];
        objc_super v37 = [v36 interfaceProtocolMapping];
        v38 = [v37 objectForKeyedSubscript:v35];

        [v38 removeKeychainItemsInDomain:a2 keepIdentity:v9];
      }
      uint64_t v32 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v32);
  }
LABEL_15:

LABEL_16:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v21 = objc_msgSend(a1, "relay", 0);
  char v22 = [v21 relays];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        char v27 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        uint64_t v28 = [a1 payloadInfo];
        [v27 clearKeychainItemsInDomain:a2 removeItems:v28 == 0];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v24);
  }

  -[NEConfiguration syncWithKeychainInDomain:](a1, a2);
}

- (void)syncWithKeychainInDomain:(void *)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 VPN];
  if (v4)
  {
    v5 = (void *)v4;
    BOOL v6 = [a1 VPN];
    uint64_t v7 = [v6 protocol];

    if (v7)
    {
      uint64_t v8 = [a1 VPN];
      BOOL v9 = [v8 protocol];
      [v9 syncWithKeychainInDomain:a2 configuration:a1 suffix:0];
    }
  }
  uint64_t v10 = [a1 appVPN];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    long long v12 = [a1 appVPN];
    uint64_t v13 = [v12 protocol];

    if (v13)
    {
      char v14 = [a1 appVPN];
      uint64_t v15 = [v14 protocol];
      [v15 syncWithKeychainInDomain:a2 configuration:a1 suffix:0];
    }
  }
  uint64_t v16 = [a1 alwaysOnVPN];

  if (v16)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    char v17 = [a1 alwaysOnVPN];
    uint64_t v18 = [v17 interfaceProtocolMapping];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v38;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * v22);
          uint64_t v24 = [a1 alwaysOnVPN];
          uint64_t v25 = [v24 interfaceProtocolMapping];
          uint64_t v26 = [v25 objectForKeyedSubscript:v23];

          [v26 syncWithKeychainInDomain:a2 configuration:a1 suffix:v23];
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v20);
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  char v27 = objc_msgSend(a1, "relay", 0);
  uint64_t v28 = [v27 relays];

  uint64_t v29 = [v28 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v34;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(v28);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * v32++) syncWithKeychainInDomain:a2 configuration:a1 suffix:0];
      }
      while (v30 != v32);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v30);
  }
}

- (id)descriptionWithOptions:(unint64_t)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  [v5 appendString:@"{"];
  BOOL v6 = [(NEConfiguration *)self name];
  [v5 appendPrettyObject:v6 withName:@"name" andIndent:0 options:a3 | 1];

  uint64_t v7 = [(NEConfiguration *)self identifier];
  [v5 appendPrettyObject:v7 withName:@"identifier" andIndent:0 options:a3];

  uint64_t v8 = [(NEConfiguration *)self externalIdentifier];
  [v5 appendPrettyObject:v8 withName:@"externalIdentifier" andIndent:0 options:a3 | 1];

  BOOL v9 = [(NEConfiguration *)self applicationName];
  [v5 appendPrettyObject:v9 withName:@"applicationName" andIndent:0 options:a3];

  uint64_t v10 = [(NEConfiguration *)self application];
  [v5 appendPrettyObject:v10 withName:@"application" andIndent:0 options:a3];

  objc_msgSend(v5, "appendPrettyInt:withName:andIndent:options:", -[NEConfiguration grade](self, "grade"), @"grade", 0, a3);
  uint64_t v11 = [(NEConfiguration *)self VPN];
  [v5 appendPrettyObject:v11 withName:@"VPN" andIndent:0 options:a3];

  long long v12 = [(NEConfiguration *)self alwaysOnVPN];
  [v5 appendPrettyObject:v12 withName:@"alwaysOnVPN" andIndent:0 options:a3];

  uint64_t v13 = [(NEConfiguration *)self appVPN];
  [v5 appendPrettyObject:v13 withName:@"appVPN" andIndent:0 options:a3];

  char v14 = [(NEConfiguration *)self contentFilter];
  [v5 appendPrettyObject:v14 withName:@"contentFilter" andIndent:0 options:a3];

  uint64_t v15 = [(NEConfiguration *)self pathController];
  [v5 appendPrettyObject:v15 withName:@"pathController" andIndent:0 options:a3];

  uint64_t v16 = [(NEConfiguration *)self payloadInfo];
  [v5 appendPrettyObject:v16 withName:@"payloadInfo" andIndent:0 options:a3];

  char v17 = [(NEConfiguration *)self dnsProxy];
  [v5 appendPrettyObject:v17 withName:@"dnsProxy" andIndent:0 options:a3];

  uint64_t v18 = [(NEConfiguration *)self dnsSettings];
  [v5 appendPrettyObject:v18 withName:@"dnsSettings" andIndent:0 options:a3];

  uint64_t v19 = [(NEConfiguration *)self appPush];
  [v5 appendPrettyObject:v19 withName:@"appPush" andIndent:0 options:a3];

  uint64_t v20 = [(NEConfiguration *)self relay];
  [v5 appendPrettyObject:v20 withName:@"relay" andIndent:0 options:a3];

  [v5 appendString:@"\n}"];

  return v5;
}

- (id)description
{
  return [(NEConfiguration *)self descriptionWithOptions:0];
}

- (id)generateSignature
{
  return +[NEHasher hashObject:self];
}

- (id)copyProviderMachOUUIDs
{
  if (self->_resolvedProviderMachOUUIDs)
  {
    providerMachOUUIDs = self->_providerMachOUUIDs;
    return providerMachOUUIDs;
  }
  v5 = [(NEConfiguration *)self VPN];

  if (v5)
  {
    BOOL v6 = [(NEConfiguration *)self VPN];
    uint64_t v7 = [v6 protocol];

    uint64_t v8 = [(NEConfiguration *)self VPN];
  }
  else
  {
    uint64_t v7 = [(NEConfiguration *)self appVPN];

    if (!v7) {
      goto LABEL_33;
    }
    BOOL v9 = [(NEConfiguration *)self appVPN];
    uint64_t v7 = [v9 protocol];

    uint64_t v8 = [(NEConfiguration *)self appVPN];
  }
  uint64_t v10 = v8;
  uint64_t v11 = [v8 tunnelType];

  id v12 = 0;
  if (!v7 || (unint64_t)(v11 - 1) > 1) {
    goto LABEL_34;
  }
  if (v11 != 2) {
    uint64_t v11 = 5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = [v7 providerBundleIdentifier];
    char v14 = [(NEConfiguration *)self pluginType];
    uint64_t v15 = +[NELaunchServices pluginProxyWithIdentifier:v13 type:v14 pluginClass:v11 extensionPoint:0];

    uint64_t v16 = [v15 machOUUIDs];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      uint64_t v18 = [v15 machOUUIDs];
      [v12 addObjectsFromArray:v18];
    }
    uint64_t v19 = [v7 authenticationPluginType];
    uint64_t v20 = +[NELaunchServices pluginProxyWithIdentifier:v19 type:0 pluginClass:v11 extensionPoint:0];
    uint64_t v21 = [v20 machOUUIDs];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      uint64_t v23 = [v20 machOUUIDs];
      [v12 addObjectsFromArray:v23];
    }
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v25 = "com.apple.racoon";
LABEL_32:
      id v12 = -[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]((uint64_t)self, (uint64_t)v25);
      goto LABEL_34;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v24 = -[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]((uint64_t)self, (uint64_t)"com.apple.pppd");
      if ([v24 count]) {
        [v12 addObjectsFromArray:v24];
      }
      uint64_t v26 = -[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]((uint64_t)self, (uint64_t)"com.apple.racoon");
      if ([v26 count]) {
        [v12 addObjectsFromArray:v26];
      }

      goto LABEL_21;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v25 = "com.apple.pppd";
      goto LABEL_32;
    }
LABEL_33:
    id v12 = 0;
    goto LABEL_34;
  }
  uint64_t v24 = +[NELaunchServices pluginProxyWithIdentifier:@"com.apple.NetworkExtension.IKEv2Provider" type:0 pluginClass:v11 extensionPoint:0];
  id v12 = [v24 machOUUIDs];
LABEL_21:

LABEL_34:
  self->_resolvedProviderMachOUUIDs = 1;
  if ([v12 count])
  {
    char v27 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v12];
    uint64_t v28 = self->_providerMachOUUIDs;
    self->_providerMachOUUIDs = v27;
  }
  uint64_t v29 = self->_providerMachOUUIDs;

  return v29;
}

- (NSObject)copyMachOUUIDsFromBundleIdentifier:(uint64_t)a1
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (a2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v3 = NEHelperCacheCopyAppUUIDMapping();
    uint64_t v4 = (void *)v3;
    if (v3 && MEMORY[0x19F3B92C0](v3) == MEMORY[0x1E4F14568])
    {
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __54__NEConfiguration_copyMachOUUIDsFromBundleIdentifier___block_invoke;
      applier[3] = &unk_1E5991810;
      uint64_t v8 = v2;
      xpc_array_apply(v4, applier);
    }
    if ([v2 count]) {
      v5 = v2;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]";
      _os_log_fault_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_FAULT, "%s called with null bundleIdentifier", buf, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

uint64_t __54__NEConfiguration_copyMachOUUIDsFromBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x19F3B92C0](v4) == MEMORY[0x1E4F14600])
  {
    BOOL v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:xpc_uuid_get_bytes(v5)];
    [v6 addObject:v7];
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEConfiguration allocWithZone:a3];
  v5 = self;
  if (v4)
  {
    v28.receiver = v4;
    v28.super_class = (Class)NEConfiguration;
    id v4 = [(NEConfiguration *)&v28 init];
    if (v4)
    {
      v4->_grade = [(NEConfiguration *)v5 grade];
      uint64_t v6 = [(NEConfiguration *)v5 name];
      name = v4->_name;
      v4->_name = (NSString *)v6;

      uint64_t v8 = [(NEConfiguration *)v5 identifier];
      uint64_t v9 = [v8 copy];
      identifier = v4->_identifier;
      v4->_identifier = (NSUUID *)v9;

      uint64_t v11 = [(NEConfiguration *)v5 externalIdentifier];
      externalIdentifier = v4->_externalIdentifier;
      v4->_externalIdentifier = (NSString *)v11;

      uint64_t v13 = [(NEConfiguration *)v5 application];
      application = v4->_application;
      v4->_application = (NSString *)v13;

      uint64_t v15 = [(NEConfiguration *)v5 applicationName];
      applicationName = v4->_applicationName;
      v4->_applicationName = (NSString *)v15;

      objc_storeStrong((id *)&v4->_applicationIdentifier, v4->_application);
    }
  }

  uint64_t v17 = [(NEConfiguration *)v5 VPN];
  [(NEConfiguration *)v4 setVPN:v17];

  uint64_t v18 = [(NEConfiguration *)v5 alwaysOnVPN];
  [(NEConfiguration *)v4 setAlwaysOnVPN:v18];

  uint64_t v19 = [(NEConfiguration *)v5 appVPN];
  [(NEConfiguration *)v4 setAppVPN:v19];

  uint64_t v20 = [(NEConfiguration *)v5 contentFilter];
  [(NEConfiguration *)v4 setContentFilter:v20];

  uint64_t v21 = [(NEConfiguration *)v5 payloadInfo];
  [(NEConfiguration *)v4 setPayloadInfo:v21];

  uint64_t v22 = [(NEConfiguration *)v5 pathController];
  [(NEConfiguration *)v4 setPathController:v22];

  uint64_t v23 = [(NEConfiguration *)v5 dnsProxy];
  [(NEConfiguration *)v4 setDnsProxy:v23];

  uint64_t v24 = [(NEConfiguration *)v5 dnsSettings];
  [(NEConfiguration *)v4 setDnsSettings:v24];

  uint64_t v25 = [(NEConfiguration *)v5 appPush];
  [(NEConfiguration *)v4 setAppPush:v25];

  uint64_t v26 = [(NEConfiguration *)v5 relay];
  [(NEConfiguration *)v4 setRelay:v26];

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v5 = [(NEConfiguration *)self identifier];
  char v6 = v5 != 0;

  if (!v5) {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing configuration identifier", v4);
  }
  uint64_t v7 = [(NEConfiguration *)self name];

  if (!v7)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing name", v4);
    char v6 = 0;
  }
  if ([(NEConfiguration *)self grade] < 1 || [(NEConfiguration *)self grade] >= 4)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid configuration grade", v4);
    char v6 = 0;
  }
  uint64_t v8 = [(NEConfiguration *)self VPN];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(NEConfiguration *)self VPN];
    char v11 = [v10 checkValidityAndCollectErrors:v4];

    v6 &= v11;
  }
  uint64_t v12 = [(NEConfiguration *)self alwaysOnVPN];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    char v14 = [(NEConfiguration *)self alwaysOnVPN];
    char v15 = [v14 checkValidityAndCollectErrors:v4];

    v6 &= v15;
  }
  uint64_t v16 = [(NEConfiguration *)self appVPN];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    uint64_t v18 = [(NEConfiguration *)self appVPN];
    char v19 = [v18 checkValidityAndCollectErrors:v4];

    v6 &= v19;
  }
  uint64_t v20 = [(NEConfiguration *)self contentFilter];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    uint64_t v22 = [(NEConfiguration *)self contentFilter];
    char v23 = [v22 checkValidityAndCollectErrors:v4];

    v6 &= v23;
  }
  uint64_t v24 = [(NEConfiguration *)self pathController];
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    uint64_t v26 = [(NEConfiguration *)self pathController];
    char v27 = [v26 checkValidityAndCollectErrors:v4];

    v6 &= v27;
  }
  uint64_t v28 = [(NEConfiguration *)self dnsProxy];
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    uint64_t v30 = [(NEConfiguration *)self dnsProxy];
    char v31 = [v30 checkValidityAndCollectErrors:v4];

    v6 &= v31;
  }
  uint64_t v32 = [(NEConfiguration *)self dnsSettings];
  if (v32)
  {
    long long v33 = (void *)v32;
    long long v34 = [(NEConfiguration *)self dnsSettings];
    char v35 = [v34 checkValidityAndCollectErrors:v4];

    v6 &= v35;
  }
  uint64_t v36 = [(NEConfiguration *)self appPush];
  if (v36)
  {
    long long v37 = (void *)v36;
    long long v38 = [(NEConfiguration *)self appPush];
    char v39 = [v38 checkValidityAndCollectErrors:v4];

    v6 &= v39;
  }
  uint64_t v40 = [(NEConfiguration *)self relay];
  if (v40)
  {
    long long v41 = (void *)v40;
    long long v42 = [(NEConfiguration *)self relay];
    char v43 = [v42 checkValidityAndCollectErrors:v4];

    v6 &= v43;
  }

  return v6;
}

+ (void)addError:(void *)a3 toList:
{
  id v4 = a3;
  id v5 = a2;
  self;
  [v4 addObject:v5];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NEConfiguration *)self identifier];
  [v4 encodeObject:v5 forKey:@"Identifier"];

  char v6 = [(NEConfiguration *)self externalIdentifier];
  [v4 encodeObject:v6 forKey:@"ExternalIdentifierString"];

  uint64_t v7 = [(NEConfiguration *)self application];
  [v4 encodeObject:v7 forKey:@"Application"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[NEConfiguration grade](self, "grade"), @"Grade");
  uint64_t v8 = [(NEConfiguration *)self VPN];
  [v4 encodeObject:v8 forKey:@"VPN"];

  uint64_t v9 = [(NEConfiguration *)self alwaysOnVPN];
  [v4 encodeObject:v9 forKey:@"AlwaysOnVPN"];

  uint64_t v10 = [(NEConfiguration *)self appVPN];
  [v4 encodeObject:v10 forKey:@"AppVPN"];

  char v11 = [(NEConfiguration *)self contentFilter];
  [v4 encodeObject:v11 forKey:@"ContentFilter"];

  uint64_t v12 = [(NEConfiguration *)self name];
  [v4 encodeObject:v12 forKey:@"Name"];

  uint64_t v13 = [(NEConfiguration *)self payloadInfo];
  [v4 encodeObject:v13 forKey:@"ProfileInfo"];

  char v14 = [(NEConfiguration *)self applicationName];
  [v4 encodeObject:v14 forKey:@"ApplicationName"];

  char v15 = [(NEConfiguration *)self pathController];
  [v4 encodeObject:v15 forKey:@"PathController"];

  uint64_t v16 = [(NEConfiguration *)self dnsProxy];
  [v4 encodeObject:v16 forKey:@"DNSProxy"];

  uint64_t v17 = [(NEConfiguration *)self dnsSettings];
  [v4 encodeObject:v17 forKey:@"DNSSettings"];

  uint64_t v18 = [(NEConfiguration *)self appPush];
  [v4 encodeObject:v18 forKey:@"AppPush"];

  id v19 = [(NEConfiguration *)self relay];
  [v4 encodeObject:v19 forKey:@"Relay"];
}

- (NEConfiguration)initWithName:(id)a3 grade:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEConfiguration;
  uint64_t v8 = [(NEConfiguration *)&v13 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_grade = a4;
    objc_storeStrong((id *)&v8->_name, a3);
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(NEConfiguration *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = [v4 identifier];
    uint64_t v8 = [(NEConfiguration *)self identifier];
    char v6 = [v7 isEqual:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (NEConfiguration)configurationWithProfilePayload:(id)a3
{
  return +[NEConfiguration configurationWithProfilePayload:a3 grade:1];
}

+ (NEConfiguration)configurationWithProfilePayload:(id)a3 grade:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [[NEProfilePayloadBase alloc] initWithPayload:v5];
  id v7 = [v5 objectForKeyedSubscript:@"PayloadType"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"UserDefinedName"];
  if ((isa_nsstring(v8) & 1) == 0)
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:@"PayloadDisplayName"];

    if (isa_nsstring(v9))
    {
      uint64_t v8 = v9;
    }
    else
    {
      if ([v7 isEqualToString:@"com.apple.webcontent-filter"]) {
        uint64_t v10 = @"PluginBundleID";
      }
      else {
        uint64_t v10 = @"VPNType";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v10];
    }
  }
  if ([v7 isEqualToString:@"com.apple.vpn.managed"])
  {
    char v11 = -[NEConfiguration initWithVPNPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
LABEL_22:
    uint64_t v12 = v11;
    goto LABEL_23;
  }
  if ([v7 isEqualToString:@"com.apple.vpn.managed.alwayson"])
  {
    char v11 = -[NEConfiguration initWithAlwaysOnVPNPayload:configurationName:grade:]((__CFString *)[NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  if ([v7 isEqualToString:@"com.apple.vpn.managed.applayer"])
  {
    char v11 = -[NEConfiguration initWithAppLayerVPNPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  if ([v7 isEqualToString:@"com.apple.webcontent-filter"])
  {
    char v11 = -[NEConfiguration initWithContentFilterPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  if ([v7 isEqualToString:@"com.apple.networkusagerules"])
  {
    char v11 = -[NEConfiguration initWithPathControllerPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  if ([v7 isEqualToString:@"com.apple.dnsSettings.managed"])
  {
    char v11 = -[NEConfiguration initWithDNSSettingsPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  if ([v7 isEqualToString:@"com.apple.relay.managed"])
  {
    char v11 = -[NEConfiguration initWithRelayPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  char v14 = ne_log_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138412290;
    uint64_t v16 = v7;
    _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "Failed to create a NEConfiguration from profile payload with type '%@'", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v12 = 0;
LABEL_23:

  return (NEConfiguration *)v12;
}

- (id)initWithIdentifier:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NEConfiguration;
    id v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      v5[2] = (id)1;
      objc_storeStrong(v5 + 3, a2);
    }
  }

  return a1;
}

- (BOOL)setAssociatedDomains:(id)a3
{
  id v4 = a3;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v4))
  {
    if ([v4 count])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v5 setObject:@"identifier \"com.apple.swcd\" and anchor apple" forKeyedSubscript:@"DesignatedRequirement"];
      [v5 setObject:@"/usr/libexec/swcd" forKeyedSubscript:@"Path"];
      [v5 setObject:v4 forKeyedSubscript:@"DNSDomainMatch"];
      BOOL v6 = [(NEConfiguration *)self setPerAppRuleSettings:v5 withAppIdentifier:@"com.apple.swcd"];
      if (!v6)
      {
        objc_super v7 = ne_log_obj();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Failed to add an app rule for swcd", v9, 2u);
        }
      }
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)validateStrings:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (!isa_nsstring(*(void **)(*((void *)&v12 + 1) + 8 * v9)))
          {
            uint64_t v10 = 0;
            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v10 = 1;
LABEL_12:
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)setExcludedDomains:(id)a3
{
  id v4 = a3;
  if (!-[NEConfiguration validateStrings:]((uint64_t)self, v4)) {
    goto LABEL_9;
  }
  if ([v4 count])
  {
    id v5 = [(NEConfiguration *)self appVPN];

    if (v5)
    {
      uint64_t v6 = [(NEConfiguration *)self appVPN];
      [v6 setExcludedDomains:v4];

      goto LABEL_5;
    }
    uint64_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "Cannot set excluded domains on a non-per-app VPN configuration", v10, 2u);
    }

LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
LABEL_5:
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)setRestrictDomains:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NEConfiguration *)self appVPN];

  if (v5)
  {
    uint64_t v6 = [(NEConfiguration *)self appVPN];
    [v6 setRestrictDomains:v3];
LABEL_8:

    return 1;
  }
  BOOL v7 = [(NEConfiguration *)self relay];

  if (v7)
  {
    if (v3)
    {
      uint64_t v8 = [(NEConfiguration *)self relay];
      uint64_t v9 = [v8 perApp];

      if (!v9)
      {
        uint64_t v10 = objc_alloc_init(NEPerApp);
        char v11 = [(NEConfiguration *)self relay];
        [v11 setPerApp:v10];
      }
    }
    uint64_t v6 = [(NEConfiguration *)self relay];
    long long v12 = [v6 perApp];
    [v12 setRestrictDomains:v3];

    goto LABEL_8;
  }
  long long v14 = ne_log_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long v15 = 0;
    _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "Cannot restrict domains, configuration is not a per-app VPN or relay configuration", v15, 2u);
  }

  return 0;
}

- (BOOL)setContactsDomains:(id)a3 accountIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v6)
    && -[NEConfiguration validateStrings:]((uint64_t)self, v7))
  {
    if (![v6 count] && !objc_msgSend(v7, "count"))
    {
      BOOL v10 = 1;
      goto LABEL_24;
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v8 setObject:@"identifier \"com.apple.AddressBook\" and anchor apple" forKeyedSubscript:@"DesignatedRequirement"];
    if ([v6 count]) {
      [v8 setObject:v6 forKeyedSubscript:@"DNSDomainMatch"];
    }
    if ([v7 count]) {
      [v8 setObject:v7 forKeyedSubscript:@"AccountIdentifierMatch"];
    }
    if ([(NEConfiguration *)self setPerAppRuleSettings:v8 withAppIdentifier:@"com.apple.MobileAddressBook"])
    {
      uint64_t v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v9 setObject:@"/System/Library/PrivateFrameworks/DataAccess.framework/Support/dataaccessd" forKeyedSubscript:@"Path"];
      if ([v6 count]) {
        [v9 setObject:v6 forKeyedSubscript:@"DNSDomainMatch"];
      }
      if ([v7 count]) {
        [v9 setObject:v7 forKeyedSubscript:@"AccountIdentifierMatch"];
      }
      if ([(NEConfiguration *)self setPerAppRuleSettings:v9 withAppIdentifier:@"com.apple.dataaccessd"])
      {
        BOOL v10 = 1;
LABEL_23:

        goto LABEL_24;
      }
      char v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long v13 = 0;
        _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "Failed to add an app rule for dataaccessd", v13, 2u);
      }
    }
    else
    {
      uint64_t v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "Failed to add an app rule for Contacts", buf, 2u);
      }
    }
    BOOL v10 = 0;
    goto LABEL_23;
  }
  BOOL v10 = 0;
LABEL_24:

  return v10;
}

- (BOOL)setContactsDomains:(id)a3
{
  return [(NEConfiguration *)self setContactsDomains:a3 accountIdentifiers:0];
}

- (BOOL)setCalendarDomains:(id)a3 accountIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v6)
    && -[NEConfiguration validateStrings:]((uint64_t)self, v7))
  {
    if ([v6 count] || objc_msgSend(v7, "count"))
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ([v6 count]) {
        [v8 setObject:v6 forKeyedSubscript:@"DNSDomainMatch"];
      }
      if ([v7 count]) {
        [v8 setObject:v7 forKeyedSubscript:@"AccountIdentifierMatch"];
      }
      if ([(NEConfiguration *)self setPerAppRuleSettings:v8 withAppIdentifier:@"com.apple.mobilecal"])
      {
        if ([(NEConfiguration *)self setPerAppRuleSettings:v8 withAppIdentifier:@"com.apple.reminders"])
        {
          uint64_t v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v9 setObject:@"/System/Library/PrivateFrameworks/DataAccess.framework/Support/dataaccessd" forKeyedSubscript:@"Path"];
          if ([v6 count]) {
            [v9 setObject:v6 forKeyedSubscript:@"DNSDomainMatch"];
          }
          if ([v7 count]) {
            [v9 setObject:v7 forKeyedSubscript:@"AccountIdentifierMatch"];
          }
          if ([(NEConfiguration *)self setPerAppRuleSettings:v9 withAppIdentifier:@"com.apple.dataaccessd"])
          {
            BOOL v10 = 1;
LABEL_28:

            goto LABEL_29;
          }
          long long v13 = ne_log_obj();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long v15 = 0;
            _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "Failed to add an app rule for dataaccessd", v15, 2u);
          }

LABEL_27:
          BOOL v10 = 0;
          goto LABEL_28;
        }
        uint64_t v9 = ne_log_obj();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_WORD *)buf = 0;
        char v11 = "Failed to add an app rule for Reminders";
        long long v12 = buf;
      }
      else
      {
        uint64_t v9 = ne_log_obj();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        __int16 v17 = 0;
        char v11 = "Failed to add an app rule for Calendar";
        long long v12 = (uint8_t *)&v17;
      }
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, v11, v12, 2u);
      goto LABEL_27;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_29:

  return v10;
}

- (BOOL)setCalendarDomains:(id)a3
{
  return [(NEConfiguration *)self setCalendarDomains:a3 accountIdentifiers:0];
}

- (BOOL)setMailDomains:(id)a3 accountIdentifiers:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v6)
    && -[NEConfiguration validateStrings:]((uint64_t)self, v7))
  {
    if ([v6 count] || objc_msgSend(v7, "count"))
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v8 setObject:@"identifier \"com.apple.mail\" and anchor apple" forKeyedSubscript:@"DesignatedRequirement"];
      if ([v6 count]) {
        [v8 setObject:v6 forKeyedSubscript:@"DNSDomainMatch"];
      }
      if ([v7 count]) {
        [v8 setObject:v7 forKeyedSubscript:@"AccountIdentifierMatch"];
      }
      if ([(NEConfiguration *)self setPerAppRuleSettings:v8 withAppIdentifier:@"com.apple.mobilemail"])
      {
        [v8 setObject:@"/System/Library/PrivateFrameworks/EmailDaemon.framework/maild" forKeyedSubscript:@"Path"];
        if ([(NEConfiguration *)self setPerAppRuleSettings:v8 withAppIdentifier:@"com.apple.email.maild"])
        {
          [v8 setObject:@"/System/Library/PrivateFrameworks/ExchangeSync.framework/Support/exchangesyncd" forKeyedSubscript:@"Path"];
          if ([(NEConfiguration *)self setPerAppRuleSettings:v8 withAppIdentifier:@"com.apple.datausage.dataaccess.activesync"])
          {
            [v8 removeObjectForKey:@"Path"];
            if ([(NEConfiguration *)self setPerAppRuleSettings:v8 withAppIdentifier:@"com.apple.mobilenotes"])
            {
              BOOL v9 = 1;
LABEL_26:

              goto LABEL_27;
            }
            BOOL v10 = ne_log_obj();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
LABEL_25:

              BOOL v9 = 0;
              goto LABEL_26;
            }
            int v15 = 138412290;
            uint64_t v16 = @"com.apple.mobilenotes";
            char v11 = "Failed to add an app rule for %@";
            long long v12 = v10;
            uint32_t v13 = 12;
LABEL_23:
            _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, v13);
            goto LABEL_25;
          }
          BOOL v10 = ne_log_obj();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
          LOWORD(v15) = 0;
          char v11 = "Failed to add an app rule for exchangesyncd";
        }
        else
        {
          BOOL v10 = ne_log_obj();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
          LOWORD(v15) = 0;
          char v11 = "Failed to add an app rule for maild";
        }
      }
      else
      {
        BOOL v10 = ne_log_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        LOWORD(v15) = 0;
        char v11 = "Failed to add an app rule for Mail";
      }
      long long v12 = v10;
      uint32_t v13 = 2;
      goto LABEL_23;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_27:

  return v9;
}

- (BOOL)setMailDomains:(id)a3
{
  return [(NEConfiguration *)self setMailDomains:a3 accountIdentifiers:0];
}

- (BOOL)setSMBDomains:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v11[0] = @"DNSDomainMatch";
    v11[1] = @"Path";
    v12[0] = v4;
    v12[1] = @"/System/Library/PrivateFrameworks/SMBClientProvider.framework/smbclientd";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    BOOL v6 = [(NEConfiguration *)self setPerAppRuleSettings:v5 withAppIdentifier:@"com.apple.smbclientd"];
    if (!v6)
    {
      id v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Failed to add an app rule for SMB domains (%@)", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)setAppLayerVPNUUID:(id)a3 andSafariDomains:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315394;
    long long v12 = "-[NEConfiguration(NEProfileIngestionMethods) setAppLayerVPNUUID:andSafariDomains:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_debug_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEBUG, "%s: vpnUUID %@", (uint8_t *)&v11, 0x16u);
  }

  BOOL v9 = [(NEConfiguration *)self setPerAppUUID:v6 andSafariDomains:v7];
  return v9;
}

- (BOOL)setPerAppUUID:(id)a3 andSafariDomains:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[NEConfiguration(NEProfileIngestionMethods) setPerAppUUID:andSafariDomains:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_debug_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEBUG, "%s: perAppUUID %@", buf, 0x16u);
  }

  if (v6)
  {
    BOOL v9 = (void *)[[NSString alloc] initWithString:v6];
    [(NEConfiguration *)self setExternalIdentifier:v9];
  }
  if ([v7 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 setObject:v7 forKeyedSubscript:@"DNSDomainMatch"];
    if ([(NEConfiguration *)self setPerAppRuleSettings:v10 withAppIdentifier:@"com.apple.mobilesafari"])
    {
      uint64_t v16 = @"DNSDomainMatch";
      id v17 = v7;
      BOOL v11 = 1;
      long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      BOOL v13 = [(NEConfiguration *)self setPerAppRuleSettings:v12 withAppIdentifier:@"com.apple.webapp"];

      if (v13)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
LABEL_16:
        _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "setPerAppUUID could not add Safari perApp rules", buf, 2u);
      }
    }
    else
    {
      id v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        goto LABEL_16;
      }
    }

    BOOL v11 = 0;
    goto LABEL_13;
  }
  BOOL v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)setPerAppRuleSettings:(id)a3 withAppIdentifier:(id)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  uint64_t v8 = [(NEConfiguration *)self appVPN];
  BOOL v9 = [(NEConfiguration *)self contentFilter];
  id v10 = [v9 perApp];

  if (v10)
  {
    BOOL v11 = [(NEConfiguration *)self contentFilter];
LABEL_7:
    uint64_t v16 = v11;
    uint64_t v17 = [v11 perApp];

    goto LABEL_8;
  }
  long long v12 = [(NEConfiguration *)self dnsProxy];
  BOOL v13 = [v12 perApp];

  if (v13)
  {
    BOOL v11 = [(NEConfiguration *)self dnsProxy];
    goto LABEL_7;
  }
  id v14 = [(NEConfiguration *)self relay];
  uint64_t v15 = [v14 perApp];

  if (v15)
  {
    BOOL v11 = [(NEConfiguration *)self relay];
    goto LABEL_7;
  }
  uint64_t v17 = 0;
LABEL_8:
  uint64_t v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v82 = (id)objc_opt_class();
    __int16 v83 = 2112;
    v84 = v7;
    id v31 = v82;
    _os_log_debug_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_DEBUG, "%@ setPerAppRuleSettings: appID %@", buf, 0x16u);
  }
  if (!(v8 | v17))
  {
    id v21 = ne_log_obj();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      BOOL v22 = 0;
      goto LABEL_68;
    }
    v50 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v82 = v50;
    id v19 = v50;
    _os_log_error_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_ERROR, "%@ setPerAppRuleSettings: perApp not initialized", buf, 0xCu);
LABEL_55:

    goto LABEL_16;
  }
  if (!v6 || !v7)
  {
    id v21 = ne_log_large_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v53 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      id v82 = v53;
      __int16 v83 = 2112;
      v84 = v7;
      __int16 v85 = 2112;
      id v86 = v6;
      id v54 = v53;
      _os_log_debug_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_DEBUG, "%@ setPerAppRuleSettings: skip rule setting for empty ID or rules %@, %@", buf, 0x20u);
    }
    BOOL v22 = 1;
    goto LABEL_68;
  }
  id v19 = [[NEAppRule alloc] initWithSigningIdentifier:v7];
  if (v8) {
    __int16 v20 = (void *)v8;
  }
  else {
    __int16 v20 = (void *)v17;
  }
  -[NEAppRule setNoRestriction:](v19, "setNoRestriction:", [v20 noRestriction]);
  char v23 = [v6 objectForKeyedSubscript:@"AccountIdentifierMatch"];
  uint64_t v24 = v23;
  if (v23)
  {
    if (!isa_nsarray(v23))
    {
      uint64_t v30 = ne_log_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v58 = objc_opt_class();
        id v71 = v58;
        v59 = [v6 objectForKeyedSubscript:@"AccountIdentifierMatch"];
        v60 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v82 = v58;
        __int16 v83 = 2112;
        v84 = @"AccountIdentifierMatch";
        __int16 v85 = 2112;
        id v86 = v60;
        id v61 = v60;
        _os_log_error_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_ERROR, "%@ setPerAppRuleSettings: failed to set %@, unsupported type %@", buf, 0x20u);
      }
      BOOL v22 = 0;
      id v21 = v24;
      goto LABEL_68;
    }
    [(NEAppRule *)v19 setMatchAccountIdentifiers:v24];
  }
  id v21 = [v6 objectForKeyedSubscript:@"DNSDomainMatch"];

  if (v21)
  {
    if (isa_nsarray(v21))
    {
      [(NEAppRule *)v19 setMatchDomains:v21];
      goto LABEL_27;
    }
    uint64_t v32 = ne_log_obj();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v62 = objc_opt_class();
      id v69 = v62;
      v63 = [v6 objectForKeyedSubscript:@"DNSDomainMatch"];
      v64 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      id v82 = v62;
      __int16 v83 = 2112;
      v84 = @"DNSDomainMatch";
      __int16 v85 = 2112;
      id v86 = v64;
      id v65 = v64;
      _os_log_error_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_ERROR, "%@ setPerAppRuleSettings: failed to set %@, unsupported type %@", buf, 0x20u);
    }
    goto LABEL_55;
  }
LABEL_27:
  uint64_t v25 = [v6 objectForKeyedSubscript:@"Path"];
  int v26 = isa_nsstring(v25);

  if (v26)
  {
    char v27 = [v6 objectForKeyedSubscript:@"Path"];
    [(NEAppRule *)v19 setMatchPath:v27];
  }
  if ([(NEAppRule *)v19 noRestriction])
  {
    uint64_t v28 = [v6 objectForKeyedSubscript:@"NoDivertDNS"];
    if (isa_nsnumber(v28)) {
      -[NEAppRule setNoDivertDNS:](v19, "setNoDivertDNS:", [v28 BOOLValue]);
    }
  }
  v74 = v7;
  id v75 = v6;
  v72 = (void *)v17;
  v73 = (void *)v8;
  v70 = v21;
  if (v8) {
    uint64_t v29 = (void *)v8;
  }
  else {
    uint64_t v29 = (void *)v17;
  }
  [v29 appRules];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [v33 countByEnumeratingWithState:&v76 objects:v80 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v77;
    while (2)
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v77 != v36) {
          objc_enumerationMutation(v33);
        }
        long long v38 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        char v39 = [v38 matchSigningIdentifier];
        uint64_t v40 = [(NEAppRule *)v19 matchSigningIdentifier];
        int v41 = [v39 isEqualToString:v40];

        if (v41)
        {
          char v43 = [v38 matchDomains];
          long long v44 = [(NEAppRule *)v19 matchDomains];
          long long v45 = -[NEConfiguration mergeArray:withArray:](self, v43, v44);
          [v38 setMatchDomains:v45];

          long long v46 = [v38 matchAccountIdentifiers];
          v47 = [(NEAppRule *)v19 matchAccountIdentifiers];
          v48 = -[NEConfiguration mergeArray:withArray:](self, v46, v47);
          [v38 setMatchAccountIdentifiers:v48];

          uint64_t v49 = v33;
          id v7 = v74;
          id v6 = v75;
          uint64_t v17 = (uint64_t)v72;
          uint64_t v8 = (uint64_t)v73;
          id v21 = v70;
          goto LABEL_65;
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v76 objects:v80 count:16];
      if (v35) {
        continue;
      }
      break;
    }
  }

  if (v33) {
    id v42 = (id)[v33 mutableCopy];
  }
  else {
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v49 = v42;
  uint64_t v8 = (uint64_t)v73;
  id v7 = v74;
  id v21 = v70;
  uint64_t v17 = (uint64_t)v72;
  id v6 = v75;
  if (v42)
  {
    [v42 addObject:v19];
    if (v73) {
      v51 = v73;
    }
    else {
      v51 = v72;
    }
    [v51 setAppRules:v49];
LABEL_65:

    v52 = ne_log_obj();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      id v56 = (id)objc_opt_class();
      if (v8) {
        v57 = (void *)v8;
      }
      else {
        v57 = (void *)v17;
      }
      v66 = [v57 appRules];
      *(_DWORD *)buf = 138412546;
      id v82 = v56;
      __int16 v83 = 2112;
      v84 = v66;
      _os_log_debug_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_DEBUG, "%@ setPerAppRuleSettings: done with %@", buf, 0x16u);
    }
    BOOL v22 = 1;
  }
  else
  {
    v52 = ne_log_obj();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v67 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v82 = v67;
      id v68 = v67;
      _os_log_error_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_ERROR, "%@ setPerAppRuleSettings: failed to allocate for app rules", buf, 0xCu);

      uint64_t v8 = (uint64_t)v73;
      uint64_t v17 = (uint64_t)v72;
      id v21 = v70;
    }
    BOOL v22 = 0;
  }

LABEL_68:
  return v22;
}

- (id)mergeArray:(void *)a3 withArray:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    id v6 = (void *)[a2 mutableCopy];
    if ([v6 count])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            if ((objc_msgSend(v6, "containsObject:", v12, (void)v15) & 1) == 0) {
              [v6 addObject:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }

      id v13 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6];
    }
    else
    {
      id v13 = v5;
    }
    a1 = v13;
  }

  return a1;
}

- (BOOL)setProfileInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ne_log_large_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)char v23 = 138412546;
    *(void *)&v23[4] = objc_opt_class();
    *(_WORD *)&v23[12] = 2112;
    *(void *)&v23[14] = v4;
    id v22 = *(id *)&v23[4];
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@ setProfileInfo %@", v23, 0x16u);
  }
  id v6 = [(NEConfiguration *)self payloadInfo];

  if (v6
    || (id v7 = objc_alloc_init(NEProfileIngestionPayloadInfo),
        [(NEConfiguration *)self setPayloadInfo:v7],
        v7,
        [(NEConfiguration *)self payloadInfo],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    uint64_t v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"PayloadOrganization", *(_OWORD *)v23, *(void *)&v23[16], v24);

    if (v9)
    {
      uint64_t v10 = [v4 objectForKeyedSubscript:@"PayloadOrganization"];
      BOOL v11 = [(NEConfiguration *)self payloadInfo];
      [v11 setProfileOrganization:v10];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"PayloadUUID"];
    id v13 = [(NEConfiguration *)self payloadInfo];
    [v13 setProfileUUID:v12];

    id v14 = [v4 objectForKeyedSubscript:@"PayloadIdentifier"];
    long long v15 = [(NEConfiguration *)self payloadInfo];
    [v15 setProfileIdentifier:v14];

    long long v16 = [(NEConfiguration *)self payloadInfo];
    [v16 setProfileSource:1];

    long long v17 = [v4 objectForKeyedSubscript:@"isInstalledByMDM"];
    if (isa_nsnumber(v17))
    {
      if ([v17 BOOLValue]) {
        uint64_t v18 = 2;
      }
      else {
        uint64_t v18 = 1;
      }
      id v19 = [(NEConfiguration *)self payloadInfo];
      [v19 setProfileSource:v18];
    }
    BOOL v20 = 1;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)setPayloadInfoCommon:(id)a3 payloadOrganization:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long v17 = 138412802;
    *(void *)&v17[4] = objc_opt_class();
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = v6;
    *(_WORD *)&v17[22] = 2112;
    id v18 = v7;
    id v16 = *(id *)&v17[4];
    _os_log_debug_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEBUG, "%@ setPayloadInfoCommon payload UUID '%@', organization '%@'", v17, 0x20u);
  }
  uint64_t v9 = [(NEConfiguration *)self payloadInfo];

  if (v9
    || (uint64_t v10 = objc_alloc_init(NEProfileIngestionPayloadInfo),
        [(NEConfiguration *)self setPayloadInfo:v10],
        v10,
        [(NEConfiguration *)self payloadInfo],
        BOOL v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    uint64_t v12 = [(NEConfiguration *)self payloadInfo];
    [v12 setPayloadUUID:v6];

    id v13 = [(NEConfiguration *)self payloadInfo];
    [v13 setPayloadOrganization:v7];

    if ([(NEConfiguration *)self grade] == 2) {
      [(NEConfiguration *)self setApplicationName:v7];
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)setPayloadInfoIdentity:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NEConfiguration *)self alwaysOnVPN];

  if (v5)
  {
    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "setPayloadInfoIdentity called for AlwaysOn, not applicable", buf, 2u);
    }
    goto LABEL_70;
  }
  id v7 = ne_log_large_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEBUG, "setPayloadInfoIdentity", buf, 2u);
  }

  uint64_t v8 = v4;
  uint64_t v9 = v8;
  if (!self)
  {

    __int16 v83 = v9;
    id v6 = v83;
    goto LABEL_70;
  }
  uint64_t v10 = -[NEConfiguration getConfigurationProtocol](self);
  if (!v10)
  {
    id v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v80 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v91 = v80;
      id v81 = v80;
      _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "%@ setPayloadInfoIdentityUserNameAndPassword: missing protocol info", buf, 0xCu);
    }
    goto LABEL_22;
  }
  if (v9) {
    BOOL v11 = (void *)v9[5];
  }
  else {
    BOOL v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    if (v9) {
      id v13 = (void *)v9[5];
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    [v10 setUsername:v14];
  }
  if (v9) {
    long long v15 = (void *)v9[6];
  }
  else {
    long long v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    if (v9) {
      long long v17 = (void *)v9[6];
    }
    else {
      long long v17 = 0;
    }
    id v18 = v17;
    -[NEConfiguration setConfigurationVPNPassword:](self, v18);
LABEL_22:
  }
  uint64_t v19 = v9;
  BOOL v20 = -[NEConfiguration getConfigurationProtocol](self);
  if (v19)
  {
    id v21 = (id)v19[7];
    if (v21)
    {

      goto LABEL_28;
    }
    id v22 = (void *)v19[8];
  }
  else
  {
    id v22 = 0;
  }
  id v23 = v22;

  if (!v23)
  {
    char v39 = ne_log_obj();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_38;
    }
    id v82 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v91 = v82;
    id v40 = v82;
    _os_log_debug_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_DEBUG, "%@ setPayloadInfoIdentityProxy: skipped, not in payload.", buf, 0xCu);
    goto LABEL_34;
  }
LABEL_28:
  if (v20)
  {
    uint64_t v24 = [v20 proxySettings];
    uint64_t v25 = [v24 HTTPServer];
    [v25 setAuthenticationRequired:1];

    if (v19)
    {
      id v26 = (id)v19[7];
      char v27 = [v20 proxySettings];
      uint64_t v28 = [v27 HTTPServer];
      [v28 setUsername:v26];

      uint64_t v29 = (void *)v19[8];
    }
    else
    {
      v84 = [v20 proxySettings];
      __int16 v85 = [v84 HTTPServer];
      [v85 setUsername:0];

      uint64_t v29 = 0;
    }
    id v30 = v29;
    id v31 = [v20 proxySettings];
    uint64_t v32 = [v31 HTTPServer];
    [v32 setPassword:v30];

    id v33 = [v20 proxySettings];
    uint64_t v34 = [v33 HTTPSServer];
    [v34 setAuthenticationRequired:1];

    if (v19)
    {
      id v35 = (id)v19[7];
      uint64_t v36 = [v20 proxySettings];
      long long v37 = [v36 HTTPSServer];
      [v37 setUsername:v35];

      long long v38 = (void *)v19[8];
    }
    else
    {
      id v86 = [v20 proxySettings];
      uint64_t v87 = [v86 HTTPSServer];
      [v87 setUsername:0];

      long long v38 = 0;
    }
    char v39 = v38;
    id v40 = [v20 proxySettings];
    int v41 = [v40 HTTPSServer];
    [v41 setPassword:v39];
  }
  else
  {
    char v39 = ne_log_obj();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    id v42 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v91 = v42;
    id v40 = v42;
    _os_log_error_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_ERROR, "%@ setPayloadInfoIdentityProxy: missing  protocol info", buf, 0xCu);
  }
LABEL_34:

LABEL_38:
  if (v19)
  {
    char v43 = (__CFString *)(id)v19[9];
    if (v43) {
      goto LABEL_50;
    }
  }
  long long v44 = [(NEConfiguration *)self VPN];
  long long v45 = [v44 protocol];
  if ([v45 type] == 5)
  {
  }
  else
  {
    long long v46 = [(NEConfiguration *)self VPN];
    v47 = [v46 protocol];
    uint64_t v48 = [v47 type];

    if (v48 != 1)
    {
LABEL_47:
      v51 = ne_log_obj();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_DEBUG, "setPayloadInfoIdentityIPSecSharedSecret: no SharedSecret found, set to blank", buf, 2u);
      }

      char v43 = &stru_1EF054CB8;
LABEL_50:
      v50 = v43;
      v52 = [(NEConfiguration *)self VPN];
      v53 = [v52 protocol];
      uint64_t v54 = [v53 type];

      if (v54 != 5)
      {
        if (v54 == 2)
        {
          v63 = [NEKeychainItem alloc];
          id v56 = [(NEConfiguration *)self VPN];
          uint64_t v64 = [v56 protocol];
          id v65 = (void *)v64;
          if (v64) {
            uint64_t v66 = *(void *)(v64 + 80);
          }
          else {
            uint64_t v66 = 0;
          }
          v88 = [(NEConfiguration *)self VPN];
          Property = [v88 protocol];
          id v69 = Property;
          id v89 = v4;
          if (Property) {
            Property = objc_getProperty(Property, v68, 88, 1);
          }
          id v70 = Property;
          id v71 = [(NEKeychainItem *)v63 initWithPassword:v50 domain:v66 accessGroup:v70];
          v72 = [(NEConfiguration *)self VPN];
          v73 = [v72 protocol];
          [v73 setSharedSecretKeychainItem:v71];

          id v4 = v89;
          goto LABEL_62;
        }
        if (v54 != 1)
        {
LABEL_63:

          goto LABEL_64;
        }
      }
      v55 = [(NEConfiguration *)self VPN];
      id v56 = [v55 protocol];

      v58 = [NEKeychainItem alloc];
      if (v56)
      {
        uint64_t v59 = v56[10];
        id v60 = objc_getProperty(v56, v57, 88, 1);
      }
      else
      {
        uint64_t v59 = 0;
        id v60 = 0;
      }
      id v61 = v60;
      v62 = [(NEKeychainItem *)v58 initWithPassword:v50 domain:v59 accessGroup:v61];
      [v56 setSharedSecretKeychainItem:v62];

      if (![v56 authenticationMethod]) {
        [v56 setAuthenticationMethod:2];
      }
LABEL_62:

      goto LABEL_63;
    }
  }
  uint64_t v49 = [(NEConfiguration *)self VPN];
  v50 = [v49 protocol];

  if (([(__CFString *)v50 authenticationMethod]
     || ([(__CFString *)v50 useExtendedAuthentication] & 1) == 0)
    && [(__CFString *)v50 authenticationMethod] != 1)
  {

    goto LABEL_47;
  }
LABEL_64:

  v74 = v19;
  id v6 = v74;
  if (v19) {
    Class isa = v74[10].isa;
  }
  else {
    Class isa = 0;
  }
  long long v76 = isa;

  if (v76)
  {
    if (v19) {
      Class v77 = v6[10].isa;
    }
    else {
      Class v77 = 0;
    }
    long long v78 = v77;
    -[NEConfiguration setConfigurationVPNPassword:](self, v78);
  }
LABEL_70:

  return 1;
}

- (BOOL)setConfigurationVPNPassword:(void *)a1
{
  id v3 = a2;
  id v4 = -[NEConfiguration getConfigurationProtocol](a1);
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 passwordKeychainItem];

    if (!v6)
    {
      uint64_t v8 = v5[10];
      uint64_t v9 = [NEKeychainItem alloc];
      id v11 = objc_getProperty(v5, v10, 88, 1);
      id v12 = [(NEKeychainItem *)v9 initWithPassword:v3 domain:v8 accessGroup:v11];
      [v5 setPasswordKeychainItem:v12];

      goto LABEL_8;
    }
    id v7 = [v5 passwordKeychainItem];
    [v7 setPassword:v3];
  }
  else
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "setConfigurationVPNPassword failed: VPN not allocated", v14, 2u);
    }
  }

LABEL_8:
  return v5 != 0;
}

- (id)getConfigurationProtocol
{
  id v1 = a1;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 VPN];
    id v3 = [v2 protocol];

    if (v3)
    {
      id v4 = [v1 VPN];
LABEL_6:
      id v7 = v4;
      id v1 = [v4 protocol];

      goto LABEL_7;
    }
    id v5 = [v1 appVPN];
    id v6 = [v5 protocol];

    if (v6)
    {
      id v4 = [v1 appVPN];
      goto LABEL_6;
    }
    uint64_t v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      id v12 = (id)objc_opt_class();
      id v10 = v12;
      _os_log_debug_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEBUG, "%@ getConfigurationProtocol: protocol info to be initialized", (uint8_t *)&v11, 0xCu);
    }
    id v1 = 0;
  }
LABEL_7:

  return v1;
}

- (id)getConfigurationIdentifier
{
  v2 = [(NEConfiguration *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (id)getPendingCertificateInfo:(id)a3
{
  return -[NEConfiguration getPendingCertificateUUIDsInternal:](self, a3);
}

- (id)getPendingCertificateUUIDsInternal:(void *)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    id v6 = [a1 VPN];

    if (v6)
    {
      id v7 = v5;
      uint64_t v8 = -[NEConfiguration getConfigurationProtocol](a1);
      uint64_t v9 = [a1 VPN];

      a1 = 0;
      if (!v9 || !v8) {
        goto LABEL_61;
      }
      switch([v8 type])
      {
        case 1:
        case 4:
          if ([v8 authenticationMethod] == 1) {
            goto LABEL_36;
          }
          goto LABEL_48;
        case 2:
          uint64_t v27 = [v8 machineAuthenticationMethod];
          if (v27 == 2)
          {
            a1 = [v8 machineIdentityReference];
            if (!a1)
            {
              BOOL v14 = 1;
              goto LABEL_56;
            }
            if ([v8 authenticationMethod] != 3)
            {
LABEL_44:
              BOOL v14 = 0;
              goto LABEL_56;
            }
          }
          else if ([v8 authenticationMethod] != 3)
          {
LABEL_48:
            BOOL v14 = 0;
            goto LABEL_57;
          }
          id v30 = [v8 identityReferenceInternal];
          BOOL v14 = v30 == 0;

          if (v27 != 2) {
            goto LABEL_57;
          }
LABEL_56:

LABEL_57:
          id v33 = ne_log_obj();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_58;
          }
          uint64_t v34 = [v7 pendingCertificates];
          LODWORD(v38) = 67109378;
          HIDWORD(v38) = v14;
          LOWORD(v39) = 2112;
          *(void *)((char *)&v39 + 2) = v34;
          id v35 = "NEConfiguration getPendingCertificateUUIDsVPN: pending %d, cert UUIDs %@";
          break;
        case 3:
          if ([v8 authenticationMethod] != 3) {
            goto LABEL_48;
          }
LABEL_36:
          a1 = [v8 identityReferenceInternal];
          BOOL v14 = a1 == 0;
          goto LABEL_56;
        case 5:
          a1 = [v7 pendingCertificates];
          if (!a1) {
            goto LABEL_44;
          }
          uint64_t v28 = [v8 identityReferenceInternal];
          BOOL v14 = v28 == 0;

          goto LABEL_56;
        default:
          goto LABEL_48;
      }
      goto LABEL_67;
    }
    id v10 = [a1 appVPN];

    if (v10)
    {
      id v7 = v5;
      uint64_t v8 = -[NEConfiguration getConfigurationProtocol](a1);
      int v11 = [a1 appVPN];

      a1 = 0;
      if (!v11 || !v8) {
        goto LABEL_61;
      }
      uint64_t v12 = [v8 type];
      switch(v12)
      {
        case 1:
          goto LABEL_14;
        case 5:
          uint64_t v13 = [v7 pendingCertificates];
          if (v13)
          {
            uint64_t v29 = [v8 identityReferenceInternal];
            BOOL v14 = v29 == 0;
          }
          else
          {
            BOOL v14 = 0;
          }
          goto LABEL_52;
        case 4:
LABEL_14:
          if ([v8 authenticationMethod] == 1)
          {
            uint64_t v13 = [v8 identityReferenceInternal];
            BOOL v14 = v13 == 0;
LABEL_52:

            goto LABEL_53;
          }
          break;
      }
      BOOL v14 = 0;
LABEL_53:
      id v33 = ne_log_obj();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_58;
      }
      uint64_t v34 = [v7 pendingCertificates];
      LODWORD(v38) = 67109378;
      HIDWORD(v38) = v14;
      LOWORD(v39) = 2112;
      *(void *)((char *)&v39 + 2) = v34;
      id v35 = "NEConfiguration getPendingCertificateUUIDsAppVPN: pending %d, cert UUIDs %@";
LABEL_67:
      _os_log_debug_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_DEBUG, v35, (uint8_t *)&v38, 0x12u);

LABEL_58:
      if (v14)
      {
LABEL_59:
        a1 = objc_msgSend(v7, "pendingCertificates", v38, v39, v40);
        goto LABEL_61;
      }
      goto LABEL_60;
    }
    long long v15 = [a1 alwaysOnVPN];

    if (!v15)
    {
      uint64_t v25 = [a1 contentFilter];

      if (!v25)
      {
        id v31 = [a1 dnsSettings];

        if (v31)
        {
          uint64_t v32 = -[NEConfiguration getPendingCertificateUUIDsDNSSettings:](a1, v5);
        }
        else
        {
          long long v37 = [a1 relay];

          if (!v37)
          {
            a1 = 0;
            goto LABEL_62;
          }
          uint64_t v32 = -[NEConfiguration getPendingCertificateUUIDsRelay:](a1, v5);
        }
        a1 = (void *)v32;
LABEL_62:

        goto LABEL_63;
      }
      id v7 = v5;
      id v26 = [a1 contentFilter];
      uint64_t v8 = v26;
      if (v26)
      {
        a1 = [v26 provider];

        if (!a1) {
          goto LABEL_61;
        }
        goto LABEL_59;
      }
LABEL_60:
      a1 = 0;
      goto LABEL_61;
    }
    id v7 = v5;
    id v16 = [a1 alwaysOnVPN];
    uint64_t v8 = v16;
    if (v16)
    {
      a1 = [v16 interfaceProtocolMapping];

      if (a1)
      {
        long long v17 = [v8 interfaceProtocolMapping];
        id v18 = [v17 objectForKeyedSubscript:@"AlwaysOnVPNInterfaceCellular"];

        if (v18
          && ([v7 pendingCertificates], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0)
          && (BOOL v20 = (void *)v19,
              [v18 identityReferenceInternal],
              id v21 = objc_claimAutoreleasedReturnValue(),
              v21,
              v20,
              !v21))
        {
          id v23 = v18;
        }
        else
        {
          id v22 = [v8 interfaceProtocolMapping];
          id v23 = [v22 objectForKeyedSubscript:@"AlwaysOnVPNInterfaceWiFi"];

          if (!v23) {
            goto LABEL_25;
          }
          a1 = [v7 pendingCertificates];
          if (!a1)
          {
LABEL_41:

LABEL_61:
            goto LABEL_62;
          }
          uint64_t v24 = [v23 identityReferenceInternal];

          if (v24)
          {
LABEL_25:
            a1 = 0;
            goto LABEL_41;
          }
        }
        a1 = [v7 pendingCertificates];
        goto LABEL_41;
      }
    }
    else
    {
      a1 = 0;
    }
    id v23 = 0;
    goto LABEL_41;
  }
LABEL_63:

  return a1;
}

- (id)getPendingCertificateUUIDsDNSSettings:(void *)a1
{
  id v3 = a2;
  id v4 = [a1 dnsSettings];
  id v5 = [v4 settings];

  if (v5)
  {
    id v6 = [v3 pendingCertificates];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)getPendingCertificateUUIDsRelay:(void *)a1
{
  id v3 = a2;
  id v4 = [a1 relay];

  if (v4)
  {
    id v4 = [v3 pendingCertificates];
  }

  return v4;
}

- (id)getPendingCertificateUUIDs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = -[NEConfiguration getPendingCertificateUUIDsInternal:](self, a3);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = [v3 allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = [v3 objectForKeyedSubscript:v8];
        uint64_t v10 = [v9 objectForKeyedSubscript:@"PayloadUUID"];
        if (v10)
        {
          int v11 = (void *)v10;
          uint64_t v12 = [v9 objectForKeyedSubscript:@"PayloadUUID"];
          int v13 = isa_nsstring(v12);

          if (v13)
          {
            BOOL v14 = [v9 objectForKeyedSubscript:@"PayloadUUID"];
            [v3 setObject:v14 forKeyedSubscript:v8];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)getCertificates
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = -[NEConfiguration getConfigurationProtocol](self);
  uint64_t v6 = v4;
  if (v4)
  {
    id v7 = objc_getProperty(v4, v5, 96, 1);

    if (v7)
    {
      id v9 = objc_getProperty(v6, v8, 96, 1);
      uint64_t v10 = [v9 persistentReference];
      if (v10)
      {
        int v11 = (void *)v10;
        uint64_t v12 = [v9 accessGroup];

        if (v12)
        {
          int v13 = [v9 persistentReference];
          [v3 addObject:v13];
        }
      }
    }
  }

  return v3;
}

- (BOOL)setCertificates:(id)a3
{
  return [(NEConfiguration *)self setCertificates:a3 keyRefs:0 specs:0];
}

- (BOOL)setCertificates:(id)a3 keyRefs:(id)a4 specs:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && (isa_nsdictionary(v8) & 1) != 0)
  {
    int v11 = [(NEConfiguration *)self VPN];

    if (v11)
    {
      id v12 = v8;
      id v13 = v9;
      id v14 = v10;
      if (self)
      {
        long long v15 = -[NEConfiguration getConfigurationProtocol](self);
        id v16 = [(NEConfiguration *)self VPN];

        LOBYTE(self) = 0;
        if (v16 && v15)
        {
          v62 = v13;
          LODWORD(self) = 0;
          long long v17 = 0;
          v63 = 0;
          long long v18 = 0;
          switch([v15 type])
          {
            case 1:
            case 4:
              goto LABEL_35;
            case 2:
              long long v19 = [v12 objectForKeyedSubscript:@"_PayloadMachineCertificateRef"];
              long long v17 = v19;
              if (v19 && isa_nsdata(v19)) {
                [v15 setMachineIdentityReference:v17];
              }
              goto LABEL_11;
            case 3:
              break;
            case 5:
LABEL_11:
              long long v18 = [v12 objectForKeyedSubscript:@"_PayloadCertificateRef"];

              long long v17 = [v62 objectForKeyedSubscript:@"_PayloadCertificateRef"];
              v63 = [v14 objectForKeyedSubscript:@"_PayloadCertificateRef"];
              long long v20 = ne_log_obj();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                id v65 = v63;
                __int16 v66 = 1024;
                LODWORD(v67) = [v63 BOOLValue];
                _os_log_debug_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificatesVPN: isModernSystem %@ (%d)", buf, 0x12u);
              }

              if (v18 && isa_nsdata(v18) && v17 && isa_nsdata(v17))
              {
                id v21 = [NEIdentityKeychainItem alloc];
                unsigned int v61 = [v63 BOOLValue];
                uint64_t v60 = v15[10];
                LODWORD(self) = 1;
                id v59 = objc_getProperty(v15, v22, 88, 1);
                id v23 = [(NEKeychainItem *)v21 initWithPersistentReference:v18 keyReference:v17 isModernSystem:v61 domain:v60 accessGroup:v59];
                objc_setProperty_atomic(v15, v24, v23, 96);
              }
              else
              {
LABEL_35:
                id v33 = v18;
                long long v18 = [v12 objectForKeyedSubscript:@"_PayloadCertificateRef"];

                if (v18 && isa_nsdata(v18)) {
                  [v15 setIdentityReferenceInternal:v18];
                }
                LODWORD(self) = 1;
              }
              break;
            default:
              v63 = 0;
              long long v18 = 0;
              break;
          }
          uint64_t v34 = ne_log_obj();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v65) = self;
            _os_log_debug_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificatesVPN: done (OK %d)", buf, 8u);
          }

          id v13 = v62;
        }
      }
      goto LABEL_85;
    }
    id v26 = [(NEConfiguration *)self appVPN];

    if (v26)
    {
      id v12 = v8;
      if (self)
      {
        uint64_t v27 = -[NEConfiguration getConfigurationProtocol](self);
        uint64_t v28 = [(NEConfiguration *)self appVPN];

        LOBYTE(self) = 0;
        if (v28 && v27)
        {
          unint64_t v29 = [v27 type];
          LODWORD(self) = 0;
          id v30 = 0;
          if (v29 <= 5 && ((1 << v29) & 0x32) != 0)
          {
            id v31 = [v12 objectForKeyedSubscript:@"_PayloadCertificateRef"];
            id v30 = v31;
            if (v31 && isa_nsdata(v31)) {
              [v27 setIdentityReferenceInternal:v30];
            }
            LODWORD(self) = 1;
          }
          uint64_t v32 = ne_log_obj();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v65) = self;
            _os_log_debug_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificatesAppVPN: done (OK %d)", buf, 8u);
          }
        }
        goto LABEL_84;
      }
LABEL_85:

      goto LABEL_86;
    }
    id v35 = [(NEConfiguration *)self alwaysOnVPN];

    if (v35)
    {
      id v12 = v8;
      if (!self) {
        goto LABEL_85;
      }
      uint64_t v27 = [(NEConfiguration *)self alwaysOnVPN];
      uint64_t v36 = ne_log_obj();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v53 = [v27 interfaceProtocolMapping];
        *(_DWORD *)buf = 138412546;
        id v65 = (const char *)v12;
        __int16 v66 = 2112;
        v67 = v53;
        _os_log_debug_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificatesAOVpn: certs %@, mapping %@", buf, 0x16u);
      }
      if (!v27) {
        goto LABEL_55;
      }
      uint64_t v37 = [v27 interfaceProtocolMapping];
      if (!v37
        || (uint64_t v38 = (void *)v37,
            [v27 interfaceProtocolMapping],
            long long v39 = objc_claimAutoreleasedReturnValue(),
            uint64_t v40 = [v39 count],
            v39,
            v38,
            !v40))
      {
LABEL_55:
        long long v44 = ne_log_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_ERROR, "NEConfiguration setCertificatesAOVpn: alwaysOnVPN Tunnel Configuration missing", buf, 2u);
        }

        goto LABEL_58;
      }
      int v41 = [v27 interfaceProtocolMapping];
      id v42 = [v41 objectForKeyedSubscript:@"AlwaysOnVPNInterfaceCellular"];

      if (v42)
      {
        if ([v42 authenticationMethod] == 1)
        {
          char v43 = [v12 objectForKeyedSubscript:@"_PayloadCertificateRefForCellular"];
          if (isa_nsdata(v43))
          {
            [v42 setIdentityReferenceInternal:v43];
          }
          else if (([v42 useExtendedAuthentication] & 1) == 0)
          {
            uint64_t v54 = ne_log_obj();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              v57 = "invalid";
              if (!v43) {
                v57 = "missing";
              }
              *(_DWORD *)buf = 136315138;
              id v65 = v57;
              _os_log_error_impl(&dword_19DDAF000, v54, OS_LOG_TYPE_ERROR, "NEConfiguration setCertificatesAOVpn: tunnel cert %s for Cellular tunnel", buf, 0xCu);
            }

            goto LABEL_58;
          }
LABEL_69:
          uint64_t v49 = [v27 interfaceProtocolMapping];
          self = [v49 objectForKeyedSubscript:@"AlwaysOnVPNInterfaceWiFi"];

          if (!self)
          {
            v51 = ne_log_obj();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_INFO, "NEConfiguration setCertificatesAOVpn: no WiFi tunnel config", buf, 2u);
            }

            goto LABEL_83;
          }
          if ([(NEConfiguration *)self authenticationMethod] != 1)
          {
LABEL_83:
            buf[0] = 1;

            LOBYTE(self) = buf[0];
            goto LABEL_84;
          }
          v50 = [v12 objectForKeyedSubscript:@"_PayloadCertificateRefForWifi"];

          if (isa_nsdata(v50))
          {
            [(NEConfiguration *)self setIdentityReferenceInternal:v50];
LABEL_82:
            char v43 = v50;
            goto LABEL_83;
          }
          if ([(NEConfiguration *)self useExtendedAuthentication]) {
            goto LABEL_82;
          }
          id v56 = ne_log_obj();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v58 = "invalid";
            if (!v50) {
              v58 = "missing";
            }
            *(_DWORD *)buf = 136315138;
            id v65 = v58;
            _os_log_error_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_ERROR, "NEConfiguration setCertificatesAOVpn: tunnel cert %s for WiFi tunnel", buf, 0xCu);
          }

LABEL_58:
          LOBYTE(self) = 0;
LABEL_84:

          goto LABEL_85;
        }
      }
      else
      {
        uint64_t v48 = ne_log_obj();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_INFO, "NEConfiguration setCertificatesAOVpn: no cellular tunnel configs", buf, 2u);
        }
      }
      char v43 = 0;
      goto LABEL_69;
    }
    long long v45 = [(NEConfiguration *)self contentFilter];

    if (v45)
    {
      id v12 = [v8 objectForKeyedSubscript:@"_PayloadCertificateRef"];
      char v46 = -[NEConfiguration setCertificateContentFilter:](self, v12);
LABEL_64:
      LOBYTE(self) = v46;
      goto LABEL_85;
    }
    v47 = [(NEConfiguration *)self dnsSettings];

    if (v47)
    {
      id v12 = [v8 objectForKeyedSubscript:@"_PayloadCertificateRef"];
      char v46 = -[NEConfiguration setCertificateDNSSettings:](self, v12);
      goto LABEL_64;
    }
    v52 = [(NEConfiguration *)self relay];

    if (v52)
    {
      LOBYTE(self) = -[NEConfiguration setCertificatesRelay:keyRefs:specs:](self, v8, v9, v10);
      goto LABEL_86;
    }
  }
  else
  {
    uint64_t v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v65 = (const char *)v8;
      _os_log_debug_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificates: malformed certificate references %@", buf, 0xCu);
    }
  }
  LOBYTE(self) = 0;
LABEL_86:

  return (char)self;
}

- (uint64_t)setCertificateContentFilter:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 contentFilter];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 provider];

      if (v6)
      {
        if (isa_nsdata(v3))
        {
          id v7 = [v5 provider];
          [v7 setIdentityReference:v3];
        }
        id v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id v10 = 0;
          _os_log_debug_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificateContentFilter: done", v10, 2u);
        }

        uint64_t v6 = 1;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)setCertificateDNSSettings:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 dnsSettings];
    uint64_t v5 = [v4 settings];

    if (v5 && isa_nsdata(v3) && ([v5 dnsProtocol] & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      [v5 setIdentityReference:v3];
      uint64_t v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v9 = 0;
        _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificateDNSSettings: done", v9, 2u);
      }

      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)setCertificatesRelay:(void *)a3 keyRefs:(void *)a4 specs:
{
  id v7 = a2;
  id v33 = a3;
  id v32 = a4;
  if (!a1) {
    goto LABEL_27;
  }
  uint64_t v8 = [a1 relay];
  if (!v8) {
    goto LABEL_28;
  }
  id v9 = [a1 relay];
  id v10 = [v9 relays];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
LABEL_27:
    uint64_t v8 = 0;
    goto LABEL_28;
  }
  id v12 = [a1 relay];
  id v13 = [v12 relays];
  unsigned int v14 = [v13 count];

  uint64_t v31 = v14;
  if (v14)
  {
    uint64_t v15 = 0;
    id v30 = a1;
    do
    {
      id v16 = [a1 relay];
      long long v17 = [v16 relays];
      long long v18 = [v17 objectAtIndexedSubscript:v15];

      if (!v18) {
        break;
      }
      long long v19 = [NSString stringWithFormat:@"%@%u", @"_PayloadCertificateRef", v15];
      long long v20 = [v7 objectForKeyedSubscript:v19];
      id v21 = [v33 objectForKeyedSubscript:v19];
      uint64_t v22 = [v32 objectForKeyedSubscript:v19];
      uint64_t v36 = v21;
      uint64_t v37 = v19;
      id v35 = (void *)v22;
      if (v21 && (uint64_t v23 = v22, isa_nsdata(v21)))
      {
        if (!v23)
        {
          uint64_t v28 = ne_log_obj();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_ERROR, "NEConfiguration setCertificatesRelay: Key not in system keychain", buf, 2u);
          }

          goto LABEL_27;
        }
        [v18 setIdentityWithKey:v20 keyRef:v21];
      }
      else if (isa_nsdata(v20))
      {
        [v18 setIdentityReference:v20];
      }
      uint64_t v34 = v18;
      uint64_t v24 = 0;
      id v25 = 0;
      while (1)
      {
        id v26 = [NSString stringWithFormat:@"%@%u-%u", @"_PayloadCertificateRef", v15, v24];
        uint64_t v27 = [v7 objectForKeyedSubscript:v26];
        if (!isa_nsdata(v27)) {
          break;
        }
        if (!v25) {
          id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v25 addObject:v27];

        uint64_t v24 = (v24 + 1);
        if (v24 == 4) {
          goto LABEL_20;
        }
      }

LABEL_20:
      if (v25) {
        [v34 setCertificateReferences:v25];
      }

      ++v15;
      a1 = v30;
    }
    while (v15 != v31);
  }
  uint64_t v8 = 1;
LABEL_28:

  return v8;
}

- (uint64_t)configurePluginWithPayload:(void *)a3 pluginType:(void *)a4 payloadType:(void *)a5 vpnType:
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = a4;
  id v12 = a5;
  id v13 = [v9 payloadAtom];
  unsigned int v14 = [v13 objectForKeyedSubscript:@"VPN"];
  if (!v14)
  {
    if ([v12 isEqualToString:@"TransparentProxy"])
    {
      unsigned int v14 = [v13 objectForKeyedSubscript:@"TransparentProxy"];
    }
    else
    {
      unsigned int v14 = 0;
    }
  }
  uint64_t v15 = ne_log_large_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v111 = v11;
    _os_log_debug_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEBUG, "configurePluginWithPayload: start with type %@", buf, 0xCu);
  }

  if (!v14)
  {
    uint64_t v24 = ne_log_obj();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

LABEL_29:
      unsigned __int8 v109 = 0;
      goto LABEL_103;
    }
    *(_WORD *)buf = 0;
    long long v44 = "configurePluginWithPayload: plugin info missing";
    long long v45 = v24;
    uint32_t v46 = 2;
LABEL_38:
    _os_log_error_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_ERROR, v44, buf, v46);
    goto LABEL_17;
  }
  if (!v10)
  {
    id v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, "configurePluginWithPayload: pluginType missing", buf, 2u);
    }

    id v10 = 0;
    goto LABEL_29;
  }
  if ([(__CFString *)v11 isEqualToString:@"com.apple.vpn.managed"])
  {
    id v16 = [v9 pluginUpgradeInfo];

    if (v16)
    {
      long long v17 = [v9 pluginUpgradeInfo];
      uint64_t v18 = [v17 objectForKeyedSubscript:@"PluginType"];

      id v10 = (id)v18;
    }
    long long v19 = [a1 VPN];
    long long v20 = [v19 protocol];

    if (v20) {
      goto LABEL_41;
    }
    if (([v12 isEqualToString:@"TransparentProxy"] & 1) != 0
      || ([a1 VPN],
          id v21 = objc_claimAutoreleasedReturnValue(),
          uint64_t v22 = [v21 tunnelType],
          v21,
          v22 == 2))
    {
      uint64_t v23 = NETransparentProxyProviderProtocol;
    }
    else
    {
      uint64_t v23 = NETunnelProviderProtocol;
    }
    v47 = (void *)[[v23 alloc] initWithPluginType:v10];
    uint64_t v48 = [a1 VPN];
    [v48 setProtocol:v47];

    uint64_t v49 = [a1 VPN];
    v50 = [v49 protocol];

    if (v50)
    {
LABEL_41:
      v51 = [a1 VPN];
      char v43 = [v51 protocol];

      [v43 setServerAddress:&stru_1EF054CB8];
      goto LABEL_42;
    }
    uint64_t v24 = ne_log_obj();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412290;
    v111 = @"com.apple.vpn.managed";
    long long v44 = "configurePluginWithPayload: failed to allocate for %@ protocol";
    long long v45 = v24;
    uint32_t v46 = 12;
    goto LABEL_38;
  }
  if (![(__CFString *)v11 isEqualToString:@"com.apple.vpn.managed.applayer"])
  {
    id v33 = ne_log_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v111 = v11;
      _os_log_error_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_ERROR, "configurePluginWithPayload: unsupported payload type %@", buf, 0xCu);
    }

    goto LABEL_29;
  }
  id v26 = [v9 pluginUpgradeInfo];

  if (!v26)
  {
    id v34 = v10;
    goto LABEL_34;
  }
  id v105 = v12;
  uint64_t v27 = [v9 pluginUpgradeInfo];
  uint64_t v107 = [v27 objectForKeyedSubscript:@"PluginType"];

  uint64_t v28 = [v9 pluginUpgradeInfo];
  unint64_t v29 = [v28 objectForKeyedSubscript:@"HasAppProxy"];
  if (isa_nsnumber(v29))
  {
    id v30 = [v9 pluginUpgradeInfo];
    uint64_t v31 = [v30 objectForKeyedSubscript:@"HasAppProxy"];
    char v32 = [v31 BOOLValue];

    if (v32) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  id v35 = [a1 appVPN];
  [v35 setTunnelType:1];

LABEL_33:
  id v12 = v105;
  id v34 = (id)v107;
LABEL_34:
  uint64_t v36 = [a1 appVPN];
  uint64_t v37 = [v36 protocol];

  if (v37) {
    goto LABEL_36;
  }
  uint64_t v38 = [[NETunnelProviderProtocol alloc] initWithPluginType:v34];
  long long v39 = [a1 appVPN];
  [v39 setProtocol:v38];

  uint64_t v40 = [a1 appVPN];
  int v41 = [v40 protocol];

  if (v41)
  {
LABEL_36:
    id v42 = [a1 appVPN];
    char v43 = [v42 protocol];

    id v10 = v34;
LABEL_42:
    if (!+[NETunnelProviderProtocol isLegacyPluginType:v10])
    {
      [a1 setApplication:v10];
      [a1 setApplicationIdentifier:v10];
      if (v43) {
        objc_setProperty_atomic(v43, v52, @"com.apple.managed.vpn.shared", 88);
      }
    }
    v53 = [v14 objectForKeyedSubscript:@"RemoteAddress"];
    [v43 setServerAddress:v53];

    uint64_t v54 = [v14 objectForKeyedSubscript:@"AuthName"];
    [v43 setUsername:v54];

    [v43 setPasswordReference:0];
    [v43 setPasswordKeychainItem:0];
    v55 = [v14 objectForKeyedSubscript:@"AuthPassword"];
    -[NEConfiguration setConfigurationVPNPassword:](a1, v55);

    [v43 setIdentityReferenceInternal:0];
    id v56 = [v13 objectForKeyedSubscript:@"PayloadCertificateUUID"];

    if (v56)
    {
      v57 = v13;
    }
    else
    {
      v58 = [v14 objectForKeyedSubscript:@"PayloadCertificateUUID"];

      if (!v58)
      {
        v90 = [v13 objectForKeyedSubscript:@"LocalCertificate"];

        if (v90)
        {
          id v61 = v12;
          v91 = v13;
        }
        else
        {
          v93 = [v14 objectForKeyedSubscript:@"LocalCertificate"];

          if (!v93) {
            goto LABEL_53;
          }
          id v61 = v12;
          v91 = v14;
        }
        uint64_t v60 = [v91 objectForKeyedSubscript:@"LocalCertificate"];
        setLocalCertificate(v60);
        id v63 = (id)objc_claimAutoreleasedReturnValue();
        [v43 setIdentityReferenceInternal:v63];
LABEL_52:

        id v12 = v61;
LABEL_53:
        uint64_t v64 = [v14 objectForKeyedSubscript:@"AuthenticationMethod"];
        id v65 = [v14 objectForKeyedSubscript:@"PayloadCertificateUUID"];
        v108 = v64;
        if (v65
          || ([v13 objectForKeyedSubscript:@"PayloadCertificateUUID"],
              (id v65 = objc_claimAutoreleasedReturnValue()) != 0))
        {
        }
        else if (([v64 isEqualToString:@"Certificate"] & 1) == 0)
        {
          if ([v64 isEqualToString:@"Password"])
          {
            uint64_t v66 = 0;
          }
          else
          {
            uint64_t v96 = [v43 username];
            if (!v96
              || (v97 = (void *)v96,
                  [v14 objectForKeyedSubscript:@"AuthPassword"],
                  v98 = objc_claimAutoreleasedReturnValue(),
                  v98,
                  v97,
                  !v98))
            {
              v101 = ne_log_obj();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
              {
                v102 = (__CFString *)objc_opt_class();
                *(_DWORD *)buf = 138412546;
                v111 = v102;
                __int16 v112 = 2112;
                v113 = v108;
                v103 = v102;
                _os_log_error_impl(&dword_19DDAF000, v101, OS_LOG_TYPE_ERROR, "%@ configurePluginWithPayload: unsupported authen type %@.", buf, 0x16u);
              }
              unsigned __int8 v109 = 0;
              goto LABEL_101;
            }
            uint64_t v66 = 0;
            uint64_t v64 = v108;
          }
LABEL_57:
          [v43 setAuthenticationMethod:v66];
          v67 = [v13 objectForKeyedSubscript:@"VendorConfig"];

          if (v67)
          {
            uint64_t v68 = [v13 objectForKeyedSubscript:@"VendorConfig"];
            id v69 = (void *)[v68 copy];
            [v43 setProviderConfiguration:v69];

            uint64_t v64 = v108;
          }
          id v70 = [v14 objectForKeyedSubscript:@"AuthPasswordPluginType"];
          [v43 setAuthenticationPluginType:v70];

          if (!-[NEConfiguration ingestDisconnectOptions:](a1, v14))
          {
            unsigned __int8 v109 = 0;

LABEL_102:
            goto LABEL_103;
          }
          id v71 = [v14 objectForKeyedSubscript:@"ProviderBundleIdentifier"];
          [v43 setProviderBundleIdentifier:v71];

          v72 = [v14 objectForKeyedSubscript:@"ExtensibleSSOProvider"];
          [v43 setExtensibleSSOProvider:v72];

          v73 = [v14 objectForKeyedSubscript:@"IncludeAllNetworks"];
          if (isa_nsnumber(v73)) {
            objc_msgSend(v43, "setIncludeAllNetworks:", objc_msgSend(v73, "BOOLValue"));
          }
          id v106 = v12;
          v74 = [v14 objectForKeyedSubscript:@"ExcludeLocalNetworks"];

          if (isa_nsnumber(v74)) {
            objc_msgSend(v43, "setExcludeLocalNetworks:", objc_msgSend(v74, "BOOLValue"));
          }
          id v75 = [v14 objectForKeyedSubscript:@"ExcludeCellularServices"];

          if (isa_nsnumber(v75)) {
            objc_msgSend(v43, "setExcludeCellularServices:", objc_msgSend(v75, "BOOLValue"));
          }
          long long v76 = [v14 objectForKeyedSubscript:@"ExcludeAPNs"];

          if (isa_nsnumber(v76)) {
            objc_msgSend(v43, "setExcludeAPNs:", objc_msgSend(v76, "BOOLValue"));
          }
          Class v77 = [v14 objectForKeyedSubscript:@"ExcludeDeviceCommunication"];

          if (isa_nsnumber(v77)) {
            objc_msgSend(v43, "setExcludeDeviceCommunication:", objc_msgSend(v77, "BOOLValue"));
          }
          long long v78 = [v14 objectForKeyedSubscript:@"EnforceRoutes"];

          if (isa_nsnumber(v78)) {
            objc_msgSend(v43, "setEnforceRoutes:", objc_msgSend(v78, "BOOLValue"));
          }
          long long v79 = objc_msgSend(v9, "payloadAtom", v78);
          v80 = [v79 objectForKeyedSubscript:@"CellularSliceUUID"];

          if (v80)
          {
            id v81 = [v9 payloadAtom];
            id v82 = [v81 objectForKeyedSubscript:@"CellularSliceUUID"];
            [v43 setSliceUUID:v82];
          }
          __int16 v83 = [a1 VPN];
          v84 = [v83 protocol];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v86 = [v14 objectForKeyedSubscript:@"Order"];
            if (isa_nsnumber(v86))
            {
              uint64_t v87 = [a1 VPN];
              v88 = [v87 protocol];

              id v12 = v106;
              if ([(__CFString *)v86 integerValue] < 0
                || (unint64_t)[(__CFString *)v86 unsignedIntegerValue] >> 31)
              {
                id v89 = ne_log_obj();
                if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v111 = v86;
                  _os_log_error_impl(&dword_19DDAF000, v89, OS_LOG_TYPE_ERROR, "Transparent proxy order is invalid: %@", buf, 0xCu);
                }

                unsigned __int8 v109 = 0;
LABEL_100:

LABEL_101:
                goto LABEL_102;
              }
              objc_msgSend(v88, "setOrder:", -[__CFString unsignedIntegerValue](v86, "unsignedIntegerValue"));
            }
          }
          v94 = ne_log_obj();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            v99 = [v43 serverAddress];
            v100 = [v43 providerConfiguration];
            *(_DWORD *)buf = 138412546;
            v111 = v99;
            __int16 v112 = 2112;
            v113 = v100;
            _os_log_debug_impl(&dword_19DDAF000, v94, OS_LOG_TYPE_DEBUG, "configurePluginWithPayload: done, serverAddress %@, providerConfiguration %@", buf, 0x16u);
          }
          unsigned __int8 v109 = 1;
          id v12 = v106;
          goto LABEL_100;
        }
        uint64_t v66 = 1;
        goto LABEL_57;
      }
      v57 = v14;
    }
    uint64_t v60 = [v57 objectForKeyedSubscript:@"PayloadCertificateUUID"];
    id v61 = v12;
    if (v43) {
      id Property = objc_getProperty(v43, v59, 88, 1);
    }
    else {
      id Property = 0;
    }
    id v63 = Property;
    [v9 addCertificatePending:v60 certificateTag:@"_PayloadCertificateRef" accessGroup:v63];
    goto LABEL_52;
  }
  uint64_t v92 = ne_log_obj();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v111 = @"com.apple.vpn.managed.applayer";
    _os_log_error_impl(&dword_19DDAF000, v92, OS_LOG_TYPE_ERROR, "configurePluginWithPayload: failed to allocate for %@ protocol", buf, 0xCu);
  }

  unsigned __int8 v109 = 0;
  id v10 = v34;
LABEL_103:

  return v109;
}

- (BOOL)ingestDisconnectOptions:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = -[NEConfiguration getConfigurationProtocol](a1);
  uint64_t v5 = ne_log_large_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v16 = 138412290;
    *(void *)&v16[4] = objc_opt_class();
    id v13 = *(id *)&v16[4];
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@ ingestDisconnectOptions start", v16, 0xCu);
  }
  if (v4)
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"DisconnectOnIdle"];
    if (isa_nsnumber(v6)) {
      objc_msgSend(v4, "setDisconnectOnIdle:", objc_msgSend(v6, "BOOLValue"));
    }
    id v7 = objc_msgSend(v3, "objectForKeyedSubscript:", @"DisconnectOnIdleTimer", *(_OWORD *)v16);

    if (isa_nsnumber(v7)) {
      objc_msgSend(v4, "setDisconnectOnIdleTimeout:", objc_msgSend(v7, "intValue"));
    }
    uint64_t v8 = [v3 objectForKeyedSubscript:@"DisconnectOnSleep"];

    if (isa_nsnumber(v8)) {
      objc_msgSend(v4, "setDisconnectOnSleep:", objc_msgSend(v8, "BOOLValue"));
    }
    id v9 = [v3 objectForKeyedSubscript:@"DisconnectOnWake"];

    if (isa_nsnumber(v9)) {
      objc_msgSend(v4, "setDisconnectOnWake:", objc_msgSend(v9, "BOOLValue"));
    }
    id v10 = [v3 objectForKeyedSubscript:@"DisconnectOnWakeTimer"];

    if (isa_nsnumber(v10)) {
      objc_msgSend(v4, "setDisconnectOnWakeTimeout:", objc_msgSend(v10, "intValue"));
    }
  }
  else
  {
    uint64_t v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v14 = objc_opt_class();
      *(_DWORD *)id v16 = 138412290;
      *(void *)&v16[4] = v14;
      id v15 = v14;
      _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "%@ ingestDisconnectOptions failed: protocol not allocated", v16, 0xCu);
    }
    id v10 = 0;
  }

  return v4 != 0;
}

- (uint64_t)ingestDNSOptions:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = -[NEConfiguration getConfigurationProtocol](a1);
  uint64_t v5 = [v3 objectForKeyedSubscript:@"DNS"];

  if (v5)
  {
    if (!isa_nsdictionary(v5))
    {
      uint64_t v7 = 0;
      goto LABEL_7;
    }
    if ([v5 count])
    {
      id v6 = [[NEDNSSettings alloc] initFromLegacyDictionary:v5];
      [v4 setDNSSettings:v6];
    }
  }
  uint64_t v7 = 1;
LABEL_7:

  return v7;
}

- (uint64_t)configurePPPWithVPNOptions:(void *)a3 payloadBase:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"VPN"];
  uint64_t v7 = -[NEConfiguration getConfigurationProtocol](a1);
  uint64_t v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v21) = 0;
    _os_log_debug_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEBUG, "configurePPPWithVPNOptions", (uint8_t *)&v21, 2u);
  }

  id v9 = [a1 appVPN];

  if (!v9)
  {
    id v12 = [a1 VPN];
    if (v12) {
      BOOL v13 = v7 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    uint64_t v11 = !v13;

    if (v11)
    {
      if (v6)
      {
        if (isa_nsdictionary(v6))
        {
          unsigned int v14 = [v6 objectForKeyedSubscript:@"AuthenticationMethod"];
          id v10 = [v6 objectForKeyedSubscript:@"AuthPassword"];

          id v15 = [v7 identityReferenceInternal];

          if (v15) {
            goto LABEL_5;
          }
          id v16 = [v6 objectForKeyedSubscript:@"LocalCertificate"];

          if (v16)
          {
            uint64_t v17 = [v6 objectForKeyedSubscript:@"LocalCertificate"];
            uint64_t v18 = setLocalCertificate(v17);
            [v7 setIdentityReferenceInternal:v18];
          }
          else
          {
            long long v20 = [v6 objectForKeyedSubscript:@"PayloadCertificateUUID"];

            if (!v20) {
              goto LABEL_5;
            }
            uint64_t v17 = [v6 objectForKeyedSubscript:@"PayloadCertificateUUID"];
            [v5 addCertificatePending:v17 certificateTag:@"_PayloadCertificateRef"];
          }
LABEL_25:

          goto LABEL_26;
        }
        uint64_t v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v21 = 138412290;
          uint64_t v22 = @"VPN";
          _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_INFO, "configurePPPWithVPNOptions: invalid %@ dictionary", (uint8_t *)&v21, 0xCu);
        }
      }
      else
      {
        uint64_t v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int v21 = 138412290;
          uint64_t v22 = @"VPN";
          _os_log_debug_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_DEBUG, "configurePPPWithVPNOptions: nothing to do, empty %@ dictionary", (uint8_t *)&v21, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "configurePPPWithVPNOptions: L2TP not initialized", (uint8_t *)&v21, 2u);
      }
    }
    id v10 = 0;
    goto LABEL_25;
  }
  id v10 = 0;
LABEL_5:
  uint64_t v11 = 1;
LABEL_26:

  return v11;
}

- (uint64_t)ingestProxyOptions:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = -[NEConfiguration getConfigurationProtocol](a1);
  if (!v4)
  {
    ne_log_obj();
    id v5 = (NEProxySettings *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = (id)objc_opt_class();
      id v8 = v18;
      _os_log_error_impl(&dword_19DDAF000, &v5->super, OS_LOG_TYPE_ERROR, "%@ ingestProxyOptions: missing protocol info", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_14;
  }
  id v5 = [v3 objectForKeyedSubscript:@"Proxies"];
  id v6 = ne_log_large_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    id v18 = (id)objc_opt_class();
    id v12 = v18;
    _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%@ ingestProxyOptions", (uint8_t *)&v17, 0xCu);
  }
  if (!v5)
  {
    id v5 = objc_alloc_init(NEProxySettings);
    [v4 setProxySettings:v5];
    goto LABEL_10;
  }
  if (!isa_nsdictionary(v5))
  {
    id v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = objc_opt_class();
      id v14 = v13;
      id v15 = objc_opt_class();
      int v17 = 138412546;
      id v18 = v13;
      __int16 v19 = 2112;
      long long v20 = v15;
      id v16 = v15;
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "%@ ingestProxyOptions: unsupported proxy data type %@", (uint8_t *)&v17, 0x16u);
    }
LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  id v7 = [[NEProxySettings alloc] initFromLegacyDictionary:v5];
  [v4 setProxySettings:v7];

LABEL_10:
  uint64_t v9 = 1;
LABEL_15:

  return v9;
}

- (uint64_t)configureIKE:(void *)a3 vpnType:(void *)a4 payloadBase:(void *)a5 vpn:
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = ne_log_large_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v18 = (id)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v169 = v18;
    _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "%@ configureIKE", buf, 0xCu);
  }
  if (!v12)
  {
    id v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "configureIKE: protocol not initialized", buf, 2u);
    }
    goto LABEL_197;
  }
  id v14 = [v12 protocol];

  if (!v14)
  {
    if ([v10 isEqualToString:@"IPSec"])
    {
      id v15 = NEVPNProtocolIPSec;
    }
    else
    {
      if (![v10 isEqualToString:@"L2TP"])
      {
        id v17 = [v11 payloadAtom];
        __int16 v19 = [v17 objectForKeyedSubscript:@"VPNSubType"];
        int v20 = isa_nsstring(v19);

        if (v20)
        {
          uint64_t v21 = [NEVPNProtocolIKEv2 alloc];
          uint64_t v22 = [v17 objectForKeyedSubscript:@"VPNSubType"];
          uint64_t v23 = -[NEVPNProtocolIKEv2 initWithPluginType:](v21, v22);
          [v12 setProtocol:v23];
        }
        else
        {
          uint64_t v22 = objc_alloc_init(NEVPNProtocolIKEv2);
          [v12 setProtocol:v22];
        }

        goto LABEL_16;
      }
      id v15 = NEVPNProtocolL2TP;
    }
    id v17 = objc_alloc_init(v15);
    [v12 setProtocol:v17];
LABEL_16:
  }
  v158 = a1;
  uint64_t v24 = [v12 protocol];
  if (!v24)
  {
    id v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_197;
    }
    uint64_t v27 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v169 = v27;
    uint64_t v28 = v27;
    _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "%@ configureIKE failed to locate protocol for ipsec", buf, 0xCu);
    goto LABEL_111;
  }
  id v16 = v24;
  id v25 = [v12 protocol];
  uint64_t v26 = [v25 type];

  if (v26 == 5)
  {
    v162 = [v12 protocol];
    v160 = 0;
LABEL_26:
    v161 = 0;
    goto LABEL_27;
  }
  if (v26 == 2)
  {
    v160 = [v12 protocol];
    v162 = 0;
    goto LABEL_26;
  }
  if (v26 != 1)
  {
    uint64_t v28 = ne_log_obj();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v143 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v169 = v143;
      id v144 = v143;
      _os_log_error_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_ERROR, "%@ configureIKE failed to find protocol object for ipsec", buf, 0xCu);
    }
LABEL_111:

    goto LABEL_197;
  }
  [v12 protocol];
  v161 = v160 = 0;
  v162 = 0;
LABEL_27:
  unint64_t v29 = [v9 objectForKeyedSubscript:@"RemoteAddress"];
  if (isa_nsstring(v29))
  {
    id v30 = [v12 protocol];
    [v30 setServerAddress:v29];
  }
  uint64_t v31 = [v9 objectForKeyedSubscript:@"EnforceRoutes"];

  if (isa_nsnumber(v31))
  {
    uint64_t v32 = [v31 BOOLValue];
    id v33 = [v12 protocol];
    [v33 setEnforceRoutes:v32];
  }
  id v34 = [v9 objectForKeyedSubscript:@"ExcludeLocalNetworks"];

  if (isa_nsnumber(v34))
  {
    uint64_t v35 = [v34 BOOLValue];
    uint64_t v36 = [v12 protocol];
    [v36 setExcludeLocalNetworks:v35];
  }
  uint64_t v37 = [v9 objectForKeyedSubscript:@"ExcludeCellularServices"];

  if (isa_nsnumber(v37))
  {
    uint64_t v38 = [v37 BOOLValue];
    long long v39 = [v12 protocol];
    [v39 setExcludeCellularServices:v38];
  }
  self = v16;
  uint64_t v40 = [v9 objectForKeyedSubscript:@"ExcludeAPNs"];

  if (isa_nsnumber(v40))
  {
    uint64_t v41 = [v40 BOOLValue];
    id v42 = [v12 protocol];
    [v42 setExcludeAPNs:v41];
  }
  id v159 = v12;
  char v43 = [v9 objectForKeyedSubscript:@"ExcludeDeviceCommunication"];

  if (isa_nsnumber(v43))
  {
    uint64_t v44 = [v43 BOOLValue];
    long long v45 = [v12 protocol];
    [v45 setExcludeDeviceCommunication:v44];
  }
  uint32_t v46 = [v11 payloadAtom];
  v47 = [v46 objectForKeyedSubscript:@"CellularSliceUUID"];

  if (v47)
  {
    uint64_t v48 = [v11 payloadAtom];
    uint64_t v49 = [v48 objectForKeyedSubscript:@"CellularSliceUUID"];
    v50 = [v12 protocol];
    [v50 setSliceUUID:v49];
  }
  if (!v160)
  {
    v51 = [v9 objectForKeyedSubscript:@"PasswordReference"];

    if (isa_nsdata(v51))
    {
      v52 = [v12 protocol];
      [v52 setPasswordReference:v51];
    }
    v53 = [v9 objectForKeyedSubscript:@"SharedSecretReference"];

    if (isa_nsdata(v53)) {
      [self setSharedSecretReference:v53];
    }
    uint64_t v54 = [v9 objectForKeyedSubscript:@"XAuthPasswordEncryption"];

    if (isa_nsstring(v54) && [v54 isEqualToString:@"Prompt"]) {
      [self setExtendedAuthPasswordPrompt:1];
    }
    char v43 = [v9 objectForKeyedSubscript:@"IdentityDataPasswordKeyStr"];

    if (v43)
    {
      v55 = [NEKeychainItem alloc];
      Class isa = self[10].isa;
      id v58 = objc_getProperty(self, v57, 88, 1);
      id v59 = [(NEKeychainItem *)v55 initWithPassword:v43 domain:isa accessGroup:v58];
      [self setIdentityDataPasswordKeychainItem:v59];
    }
  }
  if (!v161)
  {
    if (v162)
    {
      v80 = [v9 objectForKeyedSubscript:@"AuthName"];

      if (v80 && isa_nsstring(v80)) {
        [v162 setUsername:v80];
      }
      id v81 = [v162 pluginType];

      if (v81)
      {
        id v82 = [v162 pluginType];
        [a1 setApplication:v82];
      }
      goto LABEL_113;
    }
    goto LABEL_122;
  }
  uint64_t v60 = [v9 objectForKeyedSubscript:@"XAuthName"];

  if (v60 && isa_nsstring(v60)) {
    [v161 setUsername:v60];
  }
  id v61 = [v9 objectForKeyedSubscript:@"ExchangeMode"];

  if (v61 && isa_nsarray(v61)) {
    [v161 setLegacyExchangeMode:v61];
  }
  v62 = [v9 objectForKeyedSubscript:@"Proposals"];

  if (!v62 || !isa_nsarray(v62)) {
    goto LABEL_100;
  }
  id v63 = v62;
  if (![v63 count]) {
    goto LABEL_99;
  }
  v153 = v62;
  id v154 = v11;
  id v155 = v10;
  id v156 = v9;
  v163 = [MEMORY[0x1E4F1CA48] array];
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  id v152 = v63;
  id v64 = v63;
  uint64_t v65 = [v64 countByEnumeratingWithState:&v164 objects:v172 count:16];
  if (!v65) {
    goto LABEL_96;
  }
  uint64_t v66 = v65;
  uint64_t v67 = *(void *)v165;
  do
  {
    uint64_t v68 = 0;
    do
    {
      if (*(void *)v165 != v67) {
        objc_enumerationMutation(v64);
      }
      id v69 = *(void **)(*((void *)&v164 + 1) + 8 * v68);
      if (isa_nsdictionary(v69))
      {
        id v70 = objc_alloc_init(NEVPNIKEv1ProposalParameters);
        id v71 = [v69 objectForKeyedSubscript:@"EncryptionAlgorithm"];
        v72 = [v69 objectForKeyedSubscript:@"HashAlgorithm"];
        v73 = [v69 objectForKeyedSubscript:@"DHGroup"];
        v74 = [v69 objectForKeyedSubscript:@"Lifetime"];
        if (!isa_nsstring(v71)) {
          goto LABEL_77;
        }
        if ([v71 isEqualToString:@"DES"])
        {
          uint64_t v75 = 1;
          goto LABEL_76;
        }
        if ([v71 isEqualToString:@"3DES"])
        {
          uint64_t v75 = 2;
          goto LABEL_76;
        }
        if ([v71 isEqualToString:@"AES"])
        {
          uint64_t v75 = 3;
          goto LABEL_76;
        }
        if ([v71 isEqualToString:@"AES256"])
        {
          uint64_t v75 = 4;
LABEL_76:
          -[NEVPNIKEv1ProposalParameters setEncryptionAlgorithm:](v70, "setEncryptionAlgorithm:", v75, v152);
          int v76 = 1;
        }
        else
        {
LABEL_77:
          int v76 = 0;
        }
        if (isa_nsstring(v72))
        {
          if ([v72 isEqualToString:@"SHA1"])
          {
            uint64_t v77 = 1;
            goto LABEL_83;
          }
          if ([v72 isEqualToString:@"MD5"])
          {
            uint64_t v77 = 2;
LABEL_83:
            -[NEVPNIKEv1ProposalParameters setIntegrityAlgorithm:](v70, "setIntegrityAlgorithm:", v77, v152);
            int v76 = 1;
          }
        }
        if (isa_nsnumber(v73))
        {
          -[NEVPNIKEv1ProposalParameters setDiffieHellmanGroup:](v70, "setDiffieHellmanGroup:", [v73 intValue]);
          if (!isa_nsnumber(v74))
          {
LABEL_89:
            objc_msgSend(v163, "addObject:", v70, v152);
            goto LABEL_90;
          }
        }
        else if ((isa_nsnumber(v74) & 1) == 0)
        {
          if (v76) {
            goto LABEL_89;
          }
LABEL_90:

          goto LABEL_91;
        }
        -[NEVPNIKEv1ProposalParameters setLifetimeSeconds:](v70, "setLifetimeSeconds:", objc_msgSend(v74, "intValue", v152));
        goto LABEL_89;
      }
LABEL_91:
      ++v68;
    }
    while (v66 != v68);
    uint64_t v78 = [v64 countByEnumeratingWithState:&v164 objects:v172 count:16];
    uint64_t v66 = v78;
  }
  while (v78);
LABEL_96:

  if ([v163 count]) {
    [v161 setLegacyProposals:v163];
  }

  id v10 = v155;
  id v9 = v156;
  v62 = v153;
  id v11 = v154;
  id v63 = v152;
LABEL_99:

LABEL_100:
  char v43 = objc_msgSend(v9, "objectForKeyedSubscript:", @"XAuthPassword", v152);

  if (v43)
  {
    if (isa_nsdata(v43))
    {
      uint64_t v79 = [[NSString alloc] initWithData:v43 encoding:4];

      char v43 = (void *)v79;
      goto LABEL_118;
    }
    if (isa_nsstring(v43))
    {
LABEL_118:
      v84 = [NEKeychainItem alloc];
      __int16 v85 = v161;
      uint64_t v86 = v161[10];
      id Property = objc_getProperty(v161, v87, 88, 1);
      goto LABEL_121;
    }
    unsigned __int8 v109 = ne_log_obj();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      v110 = objc_opt_class();
      id v111 = v110;
      __int16 v112 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v169 = v110;
      __int16 v170 = 2112;
      v171 = v112;
      id v113 = v112;
      uint64_t v114 = "%@ configureIKE: unsupported Xauth password data type %@";
      goto LABEL_200;
    }
    goto LABEL_145;
  }
  v80 = 0;
  if (!v162) {
    goto LABEL_122;
  }
LABEL_113:
  char v43 = [v9 objectForKeyedSubscript:@"AuthPassword"];

  if (!v43)
  {
    char v43 = [v9 objectForKeyedSubscript:@"XAuthPassword"];
    if (!v43) {
      goto LABEL_122;
    }
  }
  if (!isa_nsdata(v43))
  {
    if (isa_nsstring(v43)) {
      goto LABEL_120;
    }
    unsigned __int8 v109 = ne_log_obj();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      v149 = objc_opt_class();
      id v111 = v149;
      v150 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v169 = v149;
      __int16 v170 = 2112;
      v171 = v150;
      id v113 = v150;
      uint64_t v114 = "%@ configureIKE: unsupported password data type %@";
LABEL_200:
      _os_log_error_impl(&dword_19DDAF000, v109, OS_LOG_TYPE_ERROR, v114, buf, 0x16u);
    }
LABEL_145:

    uint64_t v115 = 0;
    id v12 = v159;
    id v16 = self;
    goto LABEL_198;
  }
  uint64_t v83 = [[NSString alloc] initWithData:v43 encoding:4];

  char v43 = (void *)v83;
LABEL_120:
  v84 = [NEKeychainItem alloc];
  __int16 v85 = v162;
  uint64_t v86 = v162[10];
  id Property = objc_getProperty(v162, v89, 88, 1);
LABEL_121:
  id v90 = Property;
  v91 = [(NEKeychainItem *)v84 initWithPassword:v43 domain:v86 accessGroup:v90];
  [v85 setPasswordKeychainItem:v91];

LABEL_122:
  uint64_t v92 = [v9 objectForKeyedSubscript:@"SharedSecret"];

  id v12 = v159;
  id v16 = self;
  if (!v92)
  {
LABEL_130:
    v101 = [v9 objectForKeyedSubscript:@"LocalCertificate"];
    v102 = v101;
    if (v101 && isa_nsdata(v101))
    {
      setLocalCertificate(v102);
      v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v160) {
        [v160 setMachineIdentityReference:v103];
      }
      else {
        [self setIdentityReferenceInternal:v103];
      }
    }
    else
    {
      v104 = [v9 objectForKeyedSubscript:@"PayloadCertificateUUID"];

      if (!v104 || !isa_nsstring(v104))
      {
LABEL_148:
        if (v161
          && (v116 = (__CFString *)*MEMORY[0x1E4F41C28],
              [v9 objectForKeyedSubscript:*MEMORY[0x1E4F41C28]],
              v117 = objc_claimAutoreleasedReturnValue(),
              int v118 = isa_nsnumber(v117),
              v117,
              v118))
        {
          v119 = v9;
          v120 = v116;
        }
        else
        {
          if (!v162
            || ([v9 objectForKeyedSubscript:@"ExtendedAuthEnabled"],
                v121 = objc_claimAutoreleasedReturnValue(),
                int v122 = isa_nsnumber(v121),
                v121,
                !v122))
          {
LABEL_155:
            v124 = [v9 objectForKeyedSubscript:@"LocalIdentifier"];

            if (v124 && isa_nsstring(v124))
            {
              v125 = v160;
              if (!v160) {
                v125 = self;
              }
              [v125 setLocalIdentifier:v124];
            }
            if (v162)
            {
              v126 = [v9 objectForKeyedSubscript:@"RemoteIdentifier"];

              if (isa_nsstring(v126)) {
                [v162 setRemoteIdentifier:v126];
              }
            }
            else
            {
              v126 = v124;
            }
            v127 = [v9 objectForKeyedSubscript:@"AuthenticationMethod"];

            if (isa_nsstring(v127))
            {
              if ([v127 isEqualToString:@"SharedSecret"])
              {
                v128 = v160;
                if (v160)
                {
                  uint64_t v129 = 1;
LABEL_173:
                  [v128 setMachineAuthenticationMethod:v129];
                  goto LABEL_185;
                }
                v135 = self;
                uint64_t v136 = 2;
LABEL_184:
                [v135 setAuthenticationMethod:v136];
                goto LABEL_185;
              }
              if ([v127 isEqualToString:@"Certificate"])
              {
                v128 = v160;
                if (v160)
                {
                  uint64_t v129 = 2;
                  goto LABEL_173;
                }
                v135 = self;
                uint64_t v136 = 1;
                goto LABEL_184;
              }
              char v133 = [v127 isEqualToString:@"None"];
              v130 = v162;
              if (!v162 || (v133 & 1) == 0)
              {
                v134 = ne_log_obj();
                if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                {
                  id v151 = (id)objc_opt_class();
                  *(_DWORD *)buf = 138412546;
                  id v169 = v151;
                  __int16 v170 = 2112;
                  v171 = v127;
                  _os_log_error_impl(&dword_19DDAF000, v134, OS_LOG_TYPE_ERROR, "%@ configureIKE: unsupported authentication type %@.", buf, 0x16u);
                }
LABEL_185:
                if (v162) {
                  goto LABEL_186;
                }
LABEL_191:
                if (!-[NEConfiguration ingestDisconnectOptions:](v158, v9))
                {

                  goto LABEL_196;
                }
                v138 = ne_log_obj();
                if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
                {
                  id v140 = (id)objc_opt_class();
                  v141 = [v158 VPN];
                  v142 = [v141 protocol];
                  *(_DWORD *)buf = 138412546;
                  id v169 = v140;
                  __int16 v170 = 2112;
                  v171 = v142;
                  _os_log_debug_impl(&dword_19DDAF000, v138, OS_LOG_TYPE_DEBUG, "%@ configureIKE, done with %@", buf, 0x16u);
                }
                uint64_t v115 = 1;
                goto LABEL_198;
              }
            }
            else
            {
              v130 = v162;
              if (!v162)
              {
                if (v127)
                {
                  v131 = ne_log_obj();
                  if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
                  {
                    id v132 = (id)objc_opt_class();
                    *(_DWORD *)buf = 138412546;
                    id v169 = v132;
                    __int16 v170 = 2112;
                    v171 = v127;
                    _os_log_error_impl(&dword_19DDAF000, v131, OS_LOG_TYPE_ERROR, "%@ configureIKE: unsupported authentication type %@.", buf, 0x16u);
                  }
                  goto LABEL_190;
                }
                goto LABEL_191;
              }
            }
            [v130 setAuthenticationMethod:0];
LABEL_186:
            v137 = [v9 objectForKeyedSubscript:@"IncludeAllNetworks"];
            if (isa_nsnumber(v137)) {
              objc_msgSend(v162, "setIncludeAllNetworks:", objc_msgSend(v137, "BOOLValue"));
            }
            v131 = [v9 objectForKeyedSubscript:@"EnableFallback"];

            if (isa_nsnumber(v131)) {
              objc_msgSend(v162, "setEnableFallback:", -[NSObject BOOLValue](v131, "BOOLValue"));
            }
LABEL_190:

            goto LABEL_191;
          }
          v120 = @"ExtendedAuthEnabled";
          v119 = v9;
        }
        v123 = [v119 objectForKeyedSubscript:v120];
        -[NSObject setUseExtendedAuthentication:](self, "setUseExtendedAuthentication:", [v123 BOOLValue]);

        goto LABEL_155;
      }
      id v105 = @"_PayloadMachineCertificateRef";
      if (!v160) {
        id v105 = @"_PayloadCertificateRef";
      }
      v103 = v105;
      id v107 = objc_getProperty(self, v106, 88, 1);
      [v11 addCertificatePending:v104 certificateTag:v103 accessGroup:v107];

      v102 = v104;
    }

    v104 = v102;
    goto LABEL_148;
  }
  if (isa_nsdata(v92))
  {
    uint64_t v93 = [[NSString alloc] initWithData:v92 encoding:4];

    uint64_t v92 = (void *)v93;
    goto LABEL_126;
  }
  if (isa_nsstring(v92))
  {
LABEL_126:
    v95 = [NEKeychainItem alloc];
    if (v160)
    {
      uint64_t v96 = (uint64_t)v160[10].isa;
      id v97 = objc_getProperty(v160, v94, 88, 1);
      v98 = [(NEKeychainItem *)v95 initWithPassword:v92 domain:v96 accessGroup:v97];
      v99 = v160;
    }
    else
    {
      Class v100 = self[10].isa;
      id v97 = objc_getProperty(self, v94, 88, 1);
      v98 = [(NEKeychainItem *)v95 initWithPassword:v92 domain:v100 accessGroup:v97];
      v99 = self;
    }
    [v99 setSharedSecretKeychainItem:v98];

    goto LABEL_130;
  }
  v108 = ne_log_obj();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
  {
    v145 = objc_opt_class();
    id v146 = v145;
    v147 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v169 = v145;
    __int16 v170 = 2112;
    v171 = v147;
    id v148 = v147;
    _os_log_error_impl(&dword_19DDAF000, v108, OS_LOG_TYPE_ERROR, "%@ configureIKE: unsupported shared secret data type %@", buf, 0x16u);
  }
LABEL_196:

LABEL_197:
  uint64_t v115 = 0;
LABEL_198:

  return v115;
}

- (BOOL)configureVpnOnDemandRules:(void *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [a1 VPN];
  if (v4) {
    [a1 VPN];
  }
  else {
  id v5 = [a1 appVPN];
  }

  id v6 = ne_log_large_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v21 = 138412290;
    *(void *)&v21[4] = objc_opt_class();
    id v18 = *(id *)&v21[4];
    _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%@ configureVpnOnDemandRules: start", v21, 0xCu);
  }
  if (v5)
  {
    id v7 = [v5 onDemandRules];

    if (v7)
    {
      id v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = objc_opt_class();
        *(_DWORD *)uint64_t v21 = 138412290;
        *(void *)&v21[4] = v9;
        id v10 = v9;
        id v11 = "%@ configureVpnOnDemandRules: VPN OnDemand rules already ingested. Skip current dictionary.";
LABEL_12:
        _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, v11, v21, 0xCu);
      }
    }
    else
    {
      BOOL v13 = +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)NEOnDemandRule, v3);
      [v5 setOnDemandRules:v13];

      id v14 = [v3 objectForKeyedSubscript:@"OnDemandEnabled"];
      if (isa_nsnumber(v14)) {
        objc_msgSend(v5, "setOnDemandEnabled:", objc_msgSend(v14, "BOOLValue"));
      }
      id v15 = objc_msgSend(v3, "objectForKeyedSubscript:", @"DisconnectOnDemandEnabled", *(_OWORD *)v21);

      if (isa_nsnumber(v15)) {
        objc_msgSend(v5, "setDisconnectOnDemandEnabled:", objc_msgSend(v15, "BOOLValue"));
      }
      id v8 = [v3 objectForKeyedSubscript:@"OnDemandUserOverrideDisabled"];

      if (isa_nsnumber(v8)) {
        objc_msgSend(v5, "setOnDemandUserOverrideDisabled:", -[NSObject BOOLValue](v8, "BOOLValue"));
      }
      id v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        __int16 v19 = objc_opt_class();
        *(_DWORD *)uint64_t v21 = 138412546;
        *(void *)&v21[4] = v19;
        *(_WORD *)&v21[12] = 2112;
        *(void *)&v21[14] = v5;
        id v20 = v19;
        _os_log_debug_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEBUG, "%@ configureVpnOnDemandRules done: onDemand rules %@", v21, 0x16u);
      }
    }
  }
  else
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_opt_class();
      *(_DWORD *)uint64_t v21 = 138412290;
      *(void *)&v21[4] = v12;
      id v10 = v12;
      id v11 = "%@ configureVpnOnDemandRules failed: VPN not initialized";
      goto LABEL_12;
    }
  }

  return v5 != 0;
}

- (BOOL)configureVpnOnDemand:(void *)a3 vpnType:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:v6];
  if ([v6 isEqualToString:@"L2TP"])
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"PPP"];

    id v7 = (void *)v8;
  }
  if (!v7 || !-[NEConfiguration configureVpnOnDemandRules:](a1, v7)) {
    goto LABEL_8;
  }

  if (![v6 isEqualToString:@"L2TP"])
  {
    id v7 = 0;
LABEL_10:
    BOOL v9 = -[NEConfiguration configureVpnOnDemandRules:](a1, v5);
    goto LABEL_11;
  }
  id v7 = [v5 objectForKeyedSubscript:@"IPSec"];
  if (!v7 || -[NEConfiguration configureVpnOnDemandRules:](a1, v7)) {
    goto LABEL_10;
  }
LABEL_8:
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (uint64_t)ingestIPSecDict:(void *)a3 vpnType:(void *)a4 vpn:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = a3;
  id v9 = a4;
  id v10 = [v7 payloadAtom];
  int v11 = [(__CFString *)v8 isEqualToString:@"IKEv2"];
  id v12 = @"IPSec";
  if (v11) {
    id v12 = @"IKEv2";
  }
  BOOL v13 = v12;
  id v14 = [v10 objectForKeyedSubscript:v13];
  id v15 = ne_log_large_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v58 = (id)objc_opt_class();
    __int16 v59 = 2112;
    uint64_t v60 = v8;
    id v35 = v58;
    _os_log_debug_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEBUG, "%@ ingestIPSecDict for type %@", buf, 0x16u);
  }
  if (!v14)
  {
    char v16 = [(__CFString *)v8 isEqualToString:@"L2TP"];
    id v14 = ne_log_obj();
    BOOL v17 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if ((v16 & 1) == 0)
    {
      if (v17)
      {
        char v43 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v58 = v43;
        __int16 v59 = 2112;
        uint64_t v60 = v13;
        id v44 = v43;
        _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%@ ingestIPSecDict: empty %@ dict", buf, 0x16u);
      }
      goto LABEL_31;
    }
    if (v17)
    {
      uint64_t v41 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v58 = v41;
      id v42 = v41;
      _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%@ ingestIPSecDict: empty IPSec dict for L2TP. Apply defaults.", buf, 0xCu);
    }
    id v14 = MEMORY[0x1E4F1CC08];
  }
  uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v14];
  if (!v18)
  {
    uint64_t v28 = ne_log_obj();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      unint64_t v29 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v58 = v29;
      id v30 = v29;
      _os_log_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_INFO, "%@ ingestIPSecDict: can't alloc dictionary", buf, 0xCu);
    }
LABEL_31:
    uint64_t v33 = 0;
    goto LABEL_46;
  }
  __int16 v19 = (void *)v18;
  id v56 = v9;
  uint64_t v20 = [v10 objectForKeyedSubscript:@"_certificateData"];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    uint64_t v22 = v13;
    uint64_t v23 = a1;
    uint64_t v24 = [v10 objectForKeyedSubscript:@"_certificatePassphrase"];
    if (v24)
    {
      id v25 = +[NEIdentityKeychainItem importPKCS12Data:v21 passphrase:v24];
      uint64_t v26 = v25;
      if (v25 && [v25 count])
      {
        uint64_t v27 = [v26 objectAtIndex:0];
        if (v27)
        {
          v55 = v27;
          [v19 setObject:v27 forKey:@"LocalCertificate"];
          if (![(__CFString *)v8 isEqualToString:@"IKEv2"]
            || ([v19 objectForKeyedSubscript:@"AuthenticationMethod"],
                uint64_t v54 = objc_claimAutoreleasedReturnValue(),
                v54,
                uint64_t v27 = v55,
                !v54))
          {
            [v19 setObject:@"Certificate" forKey:@"AuthenticationMethod"];
            uint64_t v27 = v55;
          }
        }
      }
    }

    a1 = v23;
    BOOL v13 = v22;
    goto LABEL_39;
  }
  uint64_t v31 = [v14 objectForKeyedSubscript:@"LocalCertificate"];
  if (v31)
  {
    uint64_t v21 = (void *)v31;
    if (![(__CFString *)v8 isEqualToString:@"IKEv2"]
      || ([v19 objectForKeyedSubscript:@"AuthenticationMethod"],
          uint64_t v32 = objc_claimAutoreleasedReturnValue(),
          v32,
          !v32))
    {
      [v19 setObject:@"Certificate" forKey:@"AuthenticationMethod"];
    }
    goto LABEL_39;
  }
  id v34 = [v14 objectForKeyedSubscript:@"PayloadCertificateUUID"];
  if (v34)
  {

LABEL_35:
    if (![(__CFString *)v8 isEqualToString:@"IKEv2"]
      || ([v19 objectForKeyedSubscript:@"AuthenticationMethod"],
          uint64_t v37 = objc_claimAutoreleasedReturnValue(),
          v37,
          !v37))
    {
      [v19 setObject:@"Certificate" forKey:@"AuthenticationMethod"];
    }
    goto LABEL_38;
  }
  uint64_t v36 = [v10 objectForKeyedSubscript:@"PayloadCertificateUUID"];

  if (v36) {
    goto LABEL_35;
  }
  if ([(__CFString *)v8 isEqualToString:@"IKEv2"]
    && ([v14 objectForKeyedSubscript:@"ExtensibleSSOProvider"],
        long long v45 = objc_claimAutoreleasedReturnValue(),
        v45,
        v45))
  {
    uint32_t v46 = ne_log_obj();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v58 = v47;
      id v48 = v47;
      _os_log_impl(&dword_19DDAF000, v46, OS_LOG_TYPE_INFO, "%@ ingestIPSecDict: assuming authentication by certificate", buf, 0xCu);
    }
    uint64_t v49 = @"Certificate";
  }
  else
  {
    v50 = ne_log_obj();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v58 = v51;
      id v52 = v51;
      _os_log_impl(&dword_19DDAF000, v50, OS_LOG_TYPE_INFO, "%@ ingestIPSecDict: assuming authentication by sharedsecret", buf, 0xCu);
    }
    if ([(__CFString *)v8 isEqualToString:@"IKEv2"])
    {
      v53 = [v19 objectForKeyedSubscript:@"AuthenticationMethod"];

      if (v53) {
        goto LABEL_58;
      }
    }
    uint64_t v49 = @"SharedSecret";
  }
  [v19 setObject:v49 forKey:@"AuthenticationMethod"];
LABEL_58:
  [v19 removeObjectForKey:@"ExportedSharedSecret"];
  [v19 removeObjectForKey:@"IPSecSharedSecretObf"];
LABEL_38:
  uint64_t v21 = 0;
LABEL_39:
  uint64_t v38 = [v19 objectForKeyedSubscript:@"AuthenticationMethod"];
  if (v38 && ([(__CFString *)v8 isEqualToString:@"IKEv2"] & 1) == 0)
  {
    if ([v38 isEqualToString:@"Certificate"])
    {
      [v19 removeObjectForKey:@"LocalIdentifier"];
      long long v39 = @"LocalIdentifierType";
    }
    else
    {
      long long v39 = @"LocalCertificate";
    }
    [v19 removeObjectForKey:v39];
  }
  uint64_t v33 = -[NEConfiguration configureIKE:vpnType:payloadBase:vpn:](a1, v19, v8, v7, v56);

  id v9 = v56;
LABEL_46:

  return v33;
}

- (id)initWithVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = a3;
  if (!a1)
  {
    id v34 = 0;
    goto LABEL_44;
  }
  id v9 = v7;
  id v10 = [v9 payloadAtom];
  int v11 = ne_log_large_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v156 = (id)objc_opt_class();
    id v37 = v156;
    _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithVPNPayload", buf, 0xCu);
  }
  if (!v10)
  {
    BOOL v13 = ne_log_obj();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    uint64_t v31 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v156 = v31;
    id v32 = v31;
    uint64_t v33 = "%@ initWithVPNPayload: empty payload atom";
LABEL_65:
    _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);

    goto LABEL_32;
  }
  uint64_t v12 = [v10 objectForKeyedSubscript:@"VPNType"];
  if (v12)
  {
    BOOL v13 = v12;
    v154[0] = @"IPSec";
    v154[1] = @"L2TP";
    v154[2] = @"IKEv2";
    v154[3] = @"VPN";
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:4];
    if ([v14 containsObject:v13])
    {
      uint64_t v15 = [a1 initWithName:v8 grade:a4];
      if (!v15)
      {
        uint64_t v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v68 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v156 = v68;
          __int16 v157 = 2112;
          v158 = v8;
          id v69 = v68;
          _os_log_error_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_ERROR, "%@ initWithVPNPayload failed for config '%@'", buf, 0x16u);
        }
        __int16 v19 = 0;
        a1 = 0;
        goto LABEL_38;
      }
      a1 = (id)v15;
      char v16 = objc_alloc_init(NEVPN);
      [a1 setVPN:v16];

      BOOL v17 = [a1 VPN];

      if (v17)
      {
        uint64_t v18 = [a1 VPN];
        [v18 setEnabled:1];

        __int16 v19 = [v10 objectForKeyedSubscript:@"Enabled"];
        if (isa_nsnumber(v19))
        {
          uint64_t v20 = [v19 BOOLValue];
          uint64_t v21 = [a1 VPN];
          [v21 setEnabled:v20];
        }
        v153 = v14;
        if (![v13 isEqualToString:@"L2TP"])
        {
          if (([v13 isEqualToString:@"IPSec"] & 1) != 0
            || [v13 isEqualToString:@"IKEv2"])
          {
            uint64_t v41 = ne_log_obj();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              v72 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v156 = v72;
              __int16 v157 = 2112;
              v158 = (__CFString *)v13;
              id v73 = v72;
              _os_log_debug_impl(&dword_19DDAF000, v41, OS_LOG_TYPE_DEBUG, "%@ initWithVPNPayload: ingest %@", buf, 0x16u);
            }
          }
LABEL_52:
          if (([v13 isEqualToString:@"IPSec"] & 1) == 0
            && ([v13 isEqualToString:@"L2TP"] & 1) == 0
            && ![v13 isEqualToString:@"IKEv2"])
          {
            goto LABEL_178;
          }
          id v42 = [a1 VPN];
          int v43 = -[NEConfiguration ingestIPSecDict:vpnType:vpn:](a1, v9, v13, v42);

          if (v43)
          {
            if (![v13 isEqualToString:@"IKEv2"]) {
              goto LABEL_178;
            }
            id v44 = [v10 objectForKeyedSubscript:@"VPNSubType"];
            long long v45 = [v10 objectForKeyedSubscript:@"IKEv2"];
            [a1 VPN];
            uint32_t v46 = v147 = v19;
            v47 = [v46 protocol];
            int v150 = ingestIKEv2Dict(v44, v45, v47);

            id v14 = v153;
            __int16 v19 = v147;

            if (v150)
            {
LABEL_178:
              if (([v13 isEqualToString:@"VPN"] & 1) != 0
                || [v13 isEqualToString:@"TransparentProxy"])
              {
                id v48 = [v10 objectForKeyedSubscript:@"VPNSubType"];
                if ([v13 isEqualToString:@"VPN"])
                {
                  id v151 = v48;
                  uint64_t v49 = [v10 objectForKeyedSubscript:v13];
                  v50 = [v49 objectForKeyedSubscript:@"ProviderType"];

                  if (isa_nsstring(v50)
                    && [v50 isEqualToString:@"app-proxy"])
                  {
                    v51 = [a1 VPN];
                    id v52 = v51;
                    uint64_t v53 = 2;
                  }
                  else
                  {
                    v51 = [a1 VPN];
                    id v52 = v51;
                    uint64_t v53 = 1;
                  }
                  [v51 setTunnelType:v53];

                  id v48 = v151;
                }
                else
                {
                  v50 = [a1 VPN];
                  [v50 setTunnelType:2];
                }

                int v60 = -[NEConfiguration configurePluginWithPayload:pluginType:payloadType:vpnType:](a1, v9, v48, @"com.apple.vpn.managed", v13);
                if (!v60) {
                  goto LABEL_80;
                }
              }
              if (!-[NEConfiguration configureVpnOnDemand:vpnType:](a1, v10, v13))
              {
LABEL_80:
                id v14 = v153;
              }
              else
              {
                uint64_t v61 = v19;
                v62 = [v10 objectForKeyedSubscript:@"PayloadCertificateHash"];
                int v63 = isa_nsdata(v62);

                if (v63)
                {
                  id v64 = [v10 objectForKeyedSubscript:@"PayloadCertificateHash"];
                  uint64_t v65 = [a1 VPN];
                  uint64_t v66 = [v65 protocol];
                  [v66 setIdentityDataHash:v64];
                }
                id v14 = v153;
                __int16 v19 = v61;
                if (-[NEConfiguration ingestDNSOptions:](a1, v10)
                  && -[NEConfiguration ingestProxyOptions:](a1, v10))
                {
                  uint64_t v67 = ne_log_obj();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                  {
                    v94 = objc_opt_class();
                    id v152 = v94;
                    id v148 = [a1 VPN];
                    v145 = [v148 protocol];
                    v95 = [v145 serverAddress];
                    *(_DWORD *)buf = 138412546;
                    id v156 = v94;
                    id v14 = v153;
                    __int16 v157 = 2112;
                    v158 = v95;
                    _os_log_debug_impl(&dword_19DDAF000, v67, OS_LOG_TYPE_DEBUG, "%@ initWithVPNPayload: done, serverAddress %@", buf, 0x16u);

                    __int16 v19 = v61;
                  }

                  a1 = a1;
                  id v34 = a1;
LABEL_42:

                  goto LABEL_43;
                }
              }
            }
          }
LABEL_39:
          id v35 = ne_log_obj();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            uint64_t v54 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            id v156 = v54;
            v55 = v19;
            id v56 = v14;
            id v57 = v54;
            _os_log_error_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_ERROR, "%@ initWithVPNPayload: failed", buf, 0xCu);

            id v14 = v56;
            __int16 v19 = v55;
          }

          id v34 = 0;
          goto LABEL_42;
        }
        id v146 = v19;
        uint64_t v22 = v10;
        v149 = v13;
        uint64_t v23 = [v22 objectForKeyedSubscript:@"PPP"];
        uint64_t v24 = ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          id v70 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v156 = v70;
          __int16 v157 = 2112;
          v158 = (__CFString *)v149;
          id v71 = v70;
          _os_log_debug_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_DEBUG, "%@ ingestPPPData for %@", buf, 0x16u);
        }
        id v144 = (void *)v23;
        if (!v23) {
          goto LABEL_27;
        }
        if (![v149 isEqualToString:@"L2TP"])
        {
LABEL_104:

          id v14 = v153;
          __int16 v19 = v146;
          goto LABEL_38;
        }
        v143 = v22;
        id v25 = -[NEConfiguration getConfigurationProtocol](a1);
        uint64_t v26 = ne_log_obj();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_DEBUG, "configureL2TPwithPPPOptions", buf, 2u);
        }

        uint64_t v27 = [a1 appVPN];

        if (v27) {
          goto LABEL_26;
        }
        if (v25)
        {
LABEL_20:
          v142 = v143;
          v141 = -[NEConfiguration getConfigurationProtocol](a1);
          uint64_t v28 = ne_log_obj();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_DEBUG, "configurePPPCommon start", buf, 2u);
          }

          unint64_t v29 = [a1 appVPN];

          if (v29 || [a1 grade] == 2)
          {
            id v30 = 0;
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          id v140 = v25;
          uint64_t v83 = [a1 VPN];
          if (v83) {
            BOOL v84 = v141 == 0;
          }
          else {
            BOOL v84 = 1;
          }
          char v85 = !v84;

          if ((v85 & 1) == 0)
          {
            uint64_t v92 = ne_log_obj();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19DDAF000, v92, OS_LOG_TYPE_ERROR, "configurePPPCommon failed: VPN not initialized", buf, 2u);
            }
            uint64_t v93 = 0;
            goto LABEL_132;
          }
          char v136 = v85;
          id v139 = [v142 objectForKeyedSubscript:@"PPP"];
          self = -[NEConfiguration getConfigurationProtocol](a1);
          uint64_t v86 = ne_log_large_obj();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_DEBUG, "ingestPPPDict start", buf, 2u);
          }

          SEL v87 = [a1 appVPN];

          if (v87 || [a1 grade] == 2)
          {
LABEL_98:

            v88 = v142;
            SEL v89 = [v142 objectForKeyedSubscript:@"IPv4"];
            if (isa_nsdictionary(v89))
            {
              id v90 = [[NEIPv4Settings alloc] initFromLegacyDictionary:v89];
              if (v90)
              {
                [v141 setIPv4Settings:v90];
              }
              else
              {
                v103 = ne_log_large_obj();
                if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_19DDAF000, v103, OS_LOG_TYPE_DEBUG, "configurePPPCommon: IPv4 settings are Off for payload dictionary", buf, 2u);
                }
              }
              v88 = v142;
            }
            id v30 = [v88 objectForKeyedSubscript:@"IPv6"];

            if (!isa_nsdictionary(v30))
            {
              id v25 = v140;
              goto LABEL_25;
            }
            uint64_t v93 = v30;
            v104 = [[NEIPv6Settings alloc] initFromLegacyDictionary:v30];
            if (v104)
            {
              uint64_t v92 = v104;
              [v141 setIPv6Settings:v104];
            }
            else
            {
              id v105 = ne_log_obj();
              if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_19DDAF000, v105, OS_LOG_TYPE_ERROR, "configurePPPCommon: invalid IPv6 dictionary", buf, 2u);
              }

              uint64_t v92 = 0;
            }
            char v85 = v136;
LABEL_132:

            if ((v85 & 1) == 0) {
              goto LABEL_104;
            }
LABEL_27:

            id v14 = v153;
            __int16 v19 = v146;
            if ((-[NEConfiguration configurePPPWithVPNOptions:payloadBase:](a1, v22, v9) & 1) == 0) {
              goto LABEL_39;
            }
            goto LABEL_52;
          }
          uint64_t v96 = [a1 VPN];

          if (!v96 || !self)
          {
            log = ne_log_obj();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19DDAF000, log, OS_LOG_TYPE_ERROR, "ingestPPPDict failed: VPN not initialized", buf, 2u);
            }
            goto LABEL_138;
          }
          if (!v139)
          {
LABEL_139:

            v91 = v140;
            id v81 = v142;
            goto LABEL_103;
          }
          id v97 = [v139 objectForKeyedSubscript:@"CommRemoteAddress"];
          v98 = v97;
          if (v97 && isa_nsstring(v97)) {
            [self setServerAddress:v98];
          }
          v99 = [v139 objectForKeyedSubscript:@"AuthName"];

          if (v99 && isa_nsstring(v99)) {
            [self setUsername:v99];
          }
          Class v100 = [v139 objectForKeyedSubscript:@"AuthPassword"];

          log = v100;
          if (v100)
          {
            if (isa_nsdata(v100))
            {
              v101 = (void *)[[NSString alloc] initWithData:v100 encoding:4];

              v102 = v101;
LABEL_149:
              v108 = v102;
              loga = [NEKeychainItem alloc];
              uint64_t v109 = self[10];
              id v133 = objc_getProperty(self, v110, 88, 1);
              id v111 = [(NEKeychainItem *)loga initWithPassword:v108 domain:v109 accessGroup:v133];
              [self setPasswordKeychainItem:v111];

              [self setAuthenticationMethod:1];
              log = v108;

LABEL_150:
              __int16 v112 = [v139 objectForKeyedSubscript:@"VerboseLogging"];
              int v113 = isa_nsnumber(v112);

              if (v113)
              {
                uint64_t v114 = [v139 objectForKeyedSubscript:@"VerboseLogging"];
                objc_msgSend(self, "setVerboseLoggingEnabled:", objc_msgSend(v114, "BOOLValue"));
              }
              -[NEConfiguration ingestDisconnectOptions:](a1, v139);
              uint64_t v115 = ne_log_obj();
              if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
              {
                v117 = objc_opt_class();
                *(_DWORD *)buf = 138412290;
                id v156 = v117;
                id v118 = v117;
                _os_log_debug_impl(&dword_19DDAF000, v115, OS_LOG_TYPE_DEBUG, "%@ ingestPPPDict: done", buf, 0xCu);
              }
              goto LABEL_98;
            }
            if (isa_nsstring(v100))
            {
              v102 = v100;
              goto LABEL_149;
            }
            v116 = ne_log_obj();
            if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
            {
              v123 = objc_opt_class();
              id v124 = v123;
              v125 = (__CFString *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v156 = v123;
              __int16 v157 = 2112;
              v158 = v125;
              v126 = v125;
              _os_log_error_impl(&dword_19DDAF000, v116, OS_LOG_TYPE_ERROR, "%@ ingestPPPDict: unsupported password data type %@", buf, 0x16u);
            }
            goto LABEL_138;
          }
          log = [v139 objectForKeyedSubscript:@"AuthProtocol"];
          if (isa_nsarray(log)
            && [log containsObject:@"EAP"])
          {
            SEL v106 = [v139 objectForKeyedSubscript:@"AuthEAPPlugins"];
            if (!isa_nsarray(v106) || ![v106 count]) {
              goto LABEL_170;
            }
            id v132 = [v106 objectAtIndexedSubscript:0];
            if (!isa_nsstring(v132))
            {
LABEL_169:

LABEL_170:
LABEL_171:
              v127 = [v139 objectForKeyedSubscript:@"TokenCard"];
              int v128 = isa_nsnumber(v127);

              if (v128) {
                [self setAuthenticationMethod:5];
              }
              goto LABEL_150;
            }
            if ([v132 isEqualToString:@"EAP-RSA"])
            {
              uint64_t v107 = 2;
LABEL_168:
              [self setAuthenticationMethod:v107];
              goto LABEL_169;
            }
            if ([v132 isEqualToString:@"EAP-TLS"])
            {
              uint64_t v107 = 3;
              goto LABEL_168;
            }
            if ([v132 isEqualToString:@"EAP-KRB"])
            {
              uint64_t v107 = 4;
              goto LABEL_168;
            }
            uint64_t v129 = ne_log_obj();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            {
              v130 = objc_opt_class();
              *(_DWORD *)buf = 138412802;
              id v156 = v130;
              __int16 v157 = 2112;
              v158 = @"AuthEAPPlugins";
              __int16 v159 = 2112;
              v160 = v132;
              id v131 = v130;
              _os_log_error_impl(&dword_19DDAF000, v129, OS_LOG_TYPE_ERROR, "%@ ingestPPPDict: unsupported %@ type %@", buf, 0x20u);
            }
            int v122 = v132;
          }
          else
          {
            if (!log) {
              goto LABEL_171;
            }
            SEL v106 = ne_log_obj();
            if (!os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
              goto LABEL_157;
            }
            v119 = objc_opt_class();
            id v137 = v119;
            v120 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            id v156 = v119;
            __int16 v157 = 2112;
            v158 = @"AuthProtocol";
            __int16 v159 = 2112;
            v160 = v120;
            id v121 = v120;
            _os_log_error_impl(&dword_19DDAF000, v106, OS_LOG_TYPE_ERROR, "%@ ingestPPPDict: invalid %@ type %@", buf, 0x20u);

            int v122 = v137;
          }

LABEL_157:
LABEL_138:

          goto LABEL_139;
        }
        v74 = [a1 VPN];

        if (v74)
        {
          uint64_t v75 = [a1 VPN];
          int v76 = [v75 protocol];

          if (!v76)
          {
            uint64_t v77 = objc_alloc_init(NEVPNProtocolL2TP);
            uint64_t v78 = [a1 VPN];
            [v78 setProtocol:v77];
          }
          uint64_t v79 = [a1 VPN];
          v80 = [v79 protocol];

          if (v80) {
            goto LABEL_20;
          }
          id v81 = ne_log_obj();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            id v82 = "configureL2TPwithPPPOptions failed to allocate for L2TP";
LABEL_135:
            _os_log_error_impl(&dword_19DDAF000, v81, OS_LOG_TYPE_ERROR, v82, buf, 2u);
          }
        }
        else
        {
          id v81 = ne_log_obj();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            id v82 = "configureL2TPwithPPPOptions failed: app-layer VPN not supported";
            goto LABEL_135;
          }
        }
        v91 = 0;
LABEL_103:

        goto LABEL_104;
      }
      uint64_t v22 = ne_log_obj();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v156 = v38;
        __int16 v157 = 2112;
        v158 = v8;
        id v39 = v38;
        uint64_t v40 = "%@ initWithVPNPayload failed, can't create VPN for config '%@'";
LABEL_67:
        _os_log_error_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_ERROR, v40, buf, 0x16u);
      }
    }
    else
    {
      uint64_t v22 = ne_log_obj();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v59 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v156 = v59;
        __int16 v157 = 2112;
        v158 = (__CFString *)v13;
        id v39 = v59;
        uint64_t v40 = "%@ initWithVPNPayload : VPN type '%@' not supported";
        goto LABEL_67;
      }
    }
    __int16 v19 = 0;
LABEL_38:

    goto LABEL_39;
  }
  BOOL v13 = ne_log_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v58 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v156 = v58;
    id v32 = v58;
    uint64_t v33 = "%@ initWithVPNPayload: couldn't extract VPN type from payload";
    goto LABEL_65;
  }
LABEL_32:
  id v34 = 0;
LABEL_43:

LABEL_44:
  return v34;
}

- (id)initWithAppLayerVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  v145[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    id v44 = 0;
    goto LABEL_40;
  }
  id v9 = v7;
  id v10 = [v9 payloadAtom];
  int v11 = ne_log_large_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v140 = (id)objc_opt_class();
    v47 = v10;
    id v48 = v140;
    _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithAppLayerVPNPayload", buf, 0xCu);

    id v10 = v47;
  }

  if (!v10)
  {
    BOOL v13 = ne_log_obj();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    uint64_t v41 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v140 = v41;
    id v42 = v41;
    int v43 = "%@ initWithAppLayerVPNPayload: empty payload atom";
LABEL_43:
    _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, v43, buf, 0xCu);

    goto LABEL_24;
  }
  uint64_t v12 = [v10 objectForKeyedSubscript:@"VPNType"];
  if (v12)
  {
    BOOL v13 = v12;
    v145[0] = @"IPSec";
    v145[1] = @"IKEv2";
    v145[2] = @"VPN";
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:3];
    if ([v14 containsObject:v13])
    {
      uint64_t v15 = [a1 initWithName:v8 grade:a4];
      if (!v15)
      {
        long long v45 = v14;
        uint32_t v46 = ne_log_obj();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          uint64_t v93 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v140 = v93;
          __int16 v141 = 2112;
          *(void *)v142 = v8;
          id v94 = v93;
          _os_log_error_impl(&dword_19DDAF000, v46, OS_LOG_TYPE_ERROR, "%@ initWithAppLayerVPNPayload: initWithName failed for '%@'", buf, 0x16u);
        }
        uint64_t v20 = 0;
        a1 = 0;
        goto LABEL_34;
      }
      a1 = (id)v15;
      char v16 = objc_alloc_init(NEVPNApp);
      [a1 setAppVPN:v16];

      BOOL v17 = [a1 appVPN];

      if (v17)
      {
        uint64_t v18 = [a1 appVPN];
        [v18 setEnabled:1];

        __int16 v19 = [a1 appVPN];
        [v19 setNoRestriction:1];

        uint64_t v20 = [v10 objectForKeyedSubscript:@"Enabled"];
        if (isa_nsnumber(v20))
        {
          uint64_t v21 = [v20 BOOLValue];
          [a1 appVPN];
          v23 = uint64_t v22 = v13;
          [v23 setEnabled:v21];

          BOOL v13 = v22;
        }
        uint64_t v24 = [v10 objectForKeyedSubscript:v13];

        if (v24)
        {
          id v127 = v9;
          if (([v13 isEqualToString:@"IPSec"] & 1) != 0
            || [v13 isEqualToString:@"IKEv2"])
          {
            id v25 = [a1 appVPN];
            [v25 setTunnelType:1];

            uint64_t v26 = [a1 appVPN];
            uint64_t v27 = v13;
            int v28 = -[NEConfiguration ingestIPSecDict:vpnType:vpn:](a1, v9, v13, v26);

            if (!v28)
            {
              BOOL v13 = v27;
              goto LABEL_35;
            }
            BOOL v13 = v27;
            if ([v27 isEqualToString:@"IKEv2"])
            {
              unint64_t v29 = [v10 objectForKeyedSubscript:@"VPNSubType"];
              [v10 objectForKeyedSubscript:@"IKEv2"];
              id v30 = v121 = v27;
              [a1 appVPN];
              v120 = v14;
              id v32 = v31 = v10;
              uint64_t v33 = [v32 protocol];
              int v34 = ingestIKEv2Dict(v29, v30, v33);

              id v9 = v127;
              id v10 = v31;
              id v14 = v120;

              BOOL v13 = v121;
              if (!v34) {
                goto LABEL_35;
              }
            }
          }
          v123 = v10;
          if (![v13 isEqualToString:@"VPN"]) {
            goto LABEL_48;
          }
          id v35 = v13;
          uint64_t v36 = [v10 objectForKeyedSubscript:v13];
          id v37 = [v36 objectForKeyedSubscript:@"ProviderType"];

          if (isa_nsstring(v37)
            && [v37 isEqualToString:@"packet-tunnel"])
          {
            uint64_t v38 = [a1 appVPN];
            id v39 = v38;
            uint64_t v40 = 1;
          }
          else
          {
            uint64_t v38 = [a1 appVPN];
            id v39 = v38;
            uint64_t v40 = 2;
          }
          [v38 setTunnelType:v40];

          __int16 v59 = [v10 objectForKeyedSubscript:@"VPNSubType"];
          int v60 = -[NEConfiguration configurePluginWithPayload:pluginType:payloadType:vpnType:](a1, v9, v59, @"com.apple.vpn.managed.applayer", v35);

          BOOL v13 = v35;
          if (!v60)
          {
            id v10 = v123;
          }
          else
          {
LABEL_48:
            id v10 = v123;
            if (-[NEConfiguration configureVpnOnDemand:vpnType:](a1, v123, v13)
              && -[NEConfiguration ingestProxyOptions:](a1, v123))
            {
              uint64_t v61 = [v123 objectForKeyedSubscript:v13];
              v62 = [v61 objectForKeyedSubscript:@"OnDemandMatchAppEnabled"];

              int v63 = v62;
              if (isa_nsnumber(v62))
              {
                uint64_t v64 = [v62 BOOLValue];
                [a1 appVPN];
                v66 = uint64_t v65 = v13;
                [v66 setOnDemandEnabled:v64];

                BOOL v13 = v65;
              }
              id v118 = v63;
              id v119 = v8;
              int v122 = v13;
              if (ne_session_disable_restrictions())
              {
                uint64_t v67 = [v123 objectForKeyedSubscript:@"AppRules"];
                if (isa_nsdictionary(v67))
                {
                  id v117 = v7;
                  long long v137 = 0u;
                  long long v138 = 0u;
                  long long v135 = 0u;
                  long long v136 = 0u;
                  id v68 = v67;
                  uint64_t v129 = [v68 countByEnumeratingWithState:&v135 objects:v144 count:16];
                  if (v129)
                  {
                    uint64_t v69 = *(void *)v136;
                    id v125 = v68;
                    v126 = v67;
                    uint64_t v124 = *(void *)v136;
                    do
                    {
                      for (uint64_t i = 0; i != v129; ++i)
                      {
                        if (*(void *)v136 != v69) {
                          objc_enumerationMutation(v68);
                        }
                        id v71 = objc_msgSend(v68, "objectForKeyedSubscript:", *(void *)(*((void *)&v135 + 1) + 8 * i), v117);
                        if (isa_nsdictionary(v71))
                        {
                          uint64_t v128 = i;
                          id v72 = v9;
                          id v73 = [v71 objectForKeyedSubscript:@"ExecutableMatch"];
                          if (isa_nsarray(v73))
                          {
                            long long v133 = 0u;
                            long long v134 = 0u;
                            long long v131 = 0u;
                            long long v132 = 0u;
                            id v74 = v73;
                            uint64_t v75 = [v74 countByEnumeratingWithState:&v131 objects:v143 count:16];
                            int v76 = v73;
                            if (v75)
                            {
                              uint64_t v77 = v75;
                              uint64_t v78 = *(void *)v132;
                              do
                              {
                                for (uint64_t j = 0; j != v77; ++j)
                                {
                                  if (*(void *)v132 != v78) {
                                    objc_enumerationMutation(v74);
                                  }
                                  v80 = *(void **)(*((void *)&v131 + 1) + 8 * j);
                                  if (isa_nsdictionary(v80))
                                  {
                                    id v81 = [v80 objectForKeyedSubscript:@"SigningIdentifier"];
                                    if (isa_nsstring(v81))
                                    {
                                      [a1 appVPN];
                                      v83 = id v82 = v76;
                                      [v83 removeAppRuleByID:v81];

                                      int v76 = v82;
                                      if (([a1 setPerAppRuleSettings:v71 withAppIdentifier:v81] & 1) == 0)
                                      {
                                        BOOL v84 = ne_log_obj();
                                        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                                        {
                                          *(_DWORD *)buf = 138412290;
                                          id v140 = v81;
                                          _os_log_error_impl(&dword_19DDAF000, v84, OS_LOG_TYPE_ERROR, "initWithAppLayerVPNPayload: Could not set App-layer VPN rule for identifier %@", buf, 0xCu);
                                        }

                                        int v76 = v82;
                                      }
                                    }
                                  }
                                }
                                uint64_t v77 = [v74 countByEnumeratingWithState:&v131 objects:v143 count:16];
                              }
                              while (v77);
                            }

                            uint64_t v67 = v126;
                            id v72 = v127;
                            id v73 = v76;
                            uint64_t v69 = v124;
                            id v68 = v125;
                          }

                          id v9 = v72;
                          uint64_t i = v128;
                        }
                      }
                      uint64_t v129 = [v68 countByEnumeratingWithState:&v135 objects:v144 count:16];
                    }
                    while (v129);
                  }

                  id v7 = v117;
                }
              }
              char v85 = objc_msgSend(a1, "appVPN", v117);
              uint64_t v86 = [v85 protocol];
              uint64_t v87 = [v86 sliceUUID];
              if (v87)
              {
                v88 = (void *)v87;
                SEL v89 = v14;
                id v90 = v7;
                v91 = [a1 appVPN];
                uint64_t v92 = [v91 protocol];
                if ([v92 disconnectOnIdle])
                {

                  id v9 = v127;
                  id v10 = v123;
                  id v14 = v89;
                }
                else
                {
                  v98 = [a1 appVPN];
                  int v99 = [v98 isOnDemandEnabled];

                  id v9 = v127;
                  id v10 = v123;
                  id v14 = v89;
                  if (!v99) {
                    goto LABEL_87;
                  }
                  Class v100 = [a1 appVPN];
                  v101 = [v100 protocol];
                  [v101 setDisconnectOnIdle:1];

                  v102 = [a1 appVPN];
                  v103 = [v102 protocol];
                  [v103 setDisconnectOnIdleTimeout:60];

                  char v85 = ne_log_obj();
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
                  {
                    v104 = objc_opt_class();
                    id v130 = v104;
                    id v105 = [a1 appVPN];
                    SEL v106 = [v105 protocol];
                    int v107 = [v106 disconnectOnIdle];
                    v108 = [a1 appVPN];
                    uint64_t v109 = [v108 protocol];
                    int v110 = [v109 disconnectOnIdleTimeout];
                    *(_DWORD *)buf = 138412802;
                    id v140 = v104;
                    __int16 v141 = 1024;
                    *(_DWORD *)v142 = v107;
                    id v14 = v89;
                    *(_WORD *)&v142[4] = 1024;
                    *(_DWORD *)&v142[6] = v110;
                    _os_log_impl(&dword_19DDAF000, v85, OS_LOG_TYPE_INFO, "%@ VPN Slice: onDemand on slice - disconnectOnIdle %d disconnectOnIdleTimeout %d", buf, 0x18u);

                    id v9 = v127;
                    id v10 = v123;
                  }
                }
              }
              else
              {
                id v90 = v7;

                id v10 = v123;
              }

LABEL_87:
              v95 = ne_log_obj();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
              {
                id v111 = objc_opt_class();
                id v112 = v111;
                int v113 = [a1 appVPN];
                uint64_t v114 = [v113 protocol];
                [v114 serverAddress];
                v116 = uint64_t v115 = v14;
                *(_DWORD *)buf = 138412546;
                id v140 = v111;
                id v10 = v123;
                __int16 v141 = 2112;
                *(void *)v142 = v116;
                _os_log_debug_impl(&dword_19DDAF000, v95, OS_LOG_TYPE_DEBUG, "%@ initWithAppLayerVPNPayload: done, serverAddress %@", buf, 0x16u);

                id v14 = v115;
                id v9 = v127;
              }
              a1 = a1;
              id v44 = a1;
              id v7 = v90;
              uint64_t v20 = v118;
              id v8 = v119;
              BOOL v13 = v122;
LABEL_38:

              goto LABEL_39;
            }
          }
LABEL_35:
          id v52 = ne_log_obj();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v54 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            id v140 = v54;
            v55 = v13;
            id v56 = v54;
            _os_log_debug_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_DEBUG, "%@ initWithAppLayerVPNPayload: failed", buf, 0xCu);

            BOOL v13 = v55;
          }

          id v44 = 0;
          goto LABEL_38;
        }
        long long v45 = v14;
        uint32_t v46 = ne_log_obj();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          uint64_t v96 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v140 = v96;
          __int16 v141 = 2112;
          *(void *)v142 = v13;
          id v97 = v96;
          _os_log_error_impl(&dword_19DDAF000, v46, OS_LOG_TYPE_ERROR, "%@ initWithAppLayerVPNPayload failed, missing %@ configuration", buf, 0x16u);
        }
LABEL_34:

        id v14 = v45;
        goto LABEL_35;
      }
      long long v45 = v14;
      uint32_t v46 = ne_log_obj();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        uint64_t v49 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v140 = v49;
        __int16 v141 = 2112;
        *(void *)v142 = v8;
        id v50 = v49;
        v51 = "%@ initWithAppLayerVPNPayload failed, can't create VPN for config '%@'";
LABEL_45:
        _os_log_error_impl(&dword_19DDAF000, v46, OS_LOG_TYPE_ERROR, v51, buf, 0x16u);
      }
    }
    else
    {
      long long v45 = v14;
      uint32_t v46 = ne_log_obj();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        id v58 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v140 = v58;
        __int16 v141 = 2112;
        *(void *)v142 = v13;
        id v50 = v58;
        v51 = "%@ initWithVPNPayload : VPN type '%@' not supported";
        goto LABEL_45;
      }
    }
    uint64_t v20 = 0;
    goto LABEL_34;
  }
  BOOL v13 = ne_log_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v57 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v140 = v57;
    id v42 = v57;
    int v43 = "%@ initWithAppLayerVPNPayload: VPN type missing";
    goto LABEL_43;
  }
LABEL_24:
  id v44 = 0;
LABEL_39:

LABEL_40:
  return v44;
}

- (__CFString)initWithAlwaysOnVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v269 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    long long v165 = 0;
    goto LABEL_228;
  }
  id v9 = v7;
  id v10 = [v9 payloadAtom];
  int v11 = ne_log_large_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v262 = (id)objc_opt_class();
    v172 = a1;
    id v173 = v262;
    _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithAlwaysOnVPNPayload", buf, 0xCu);

    a1 = v172;
  }

  if (!v10)
  {
    long long v164 = ne_log_obj();
    if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
    {
      v176 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v262 = v176;
      id v177 = v176;
      _os_log_error_impl(&dword_19DDAF000, v164, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload: empty payload atom", buf, 0xCu);
    }
    long long v165 = 0;
    goto LABEL_227;
  }
  uint64_t v12 = [v10 objectForKeyedSubscript:@"AlwaysOn"];
  if ((isa_nsdictionary(v12) & 1) == 0)
  {
    long long v166 = ne_log_obj();
    if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
    {
      v178 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v262 = v178;
      __int16 v263 = 2112;
      v264 = @"AlwaysOn";
      id v168 = v178;
      id v169 = "%@ initWithAlwaysOnVPNPayload: missing %@ dictionary";
      __int16 v170 = v166;
      uint32_t v171 = 22;
      goto LABEL_202;
    }
LABEL_188:

    goto LABEL_189;
  }
  uint64_t v13 = [(__CFString *)a1 initWithName:v8 grade:a4];
  if (!v13)
  {
    long long v164 = ne_log_obj();
    if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
    {
      v183 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v262 = v183;
      id v184 = v183;
      _os_log_error_impl(&dword_19DDAF000, v164, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload failed", buf, 0xCu);
    }
    long long v165 = 0;
    a1 = (__CFString *)v12;
    goto LABEL_227;
  }
  a1 = (__CFString *)v13;
  id v14 = objc_alloc_init(NEAOVPN);
  [(__CFString *)a1 setAlwaysOnVPN:v14];

  uint64_t v15 = [(__CFString *)a1 alwaysOnVPN];

  if (!v15)
  {
    long long v166 = ne_log_obj();
    if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
    {
      long long v167 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v262 = v167;
      id v168 = v167;
      id v169 = "%@ initWithAlwaysOnVPNPayload failed, can't create VPN";
      __int16 v170 = v166;
      uint32_t v171 = 12;
LABEL_202:
      _os_log_error_impl(&dword_19DDAF000, v170, OS_LOG_TYPE_ERROR, v169, buf, v171);

      goto LABEL_188;
    }
    goto LABEL_188;
  }
  char v16 = [(__CFString *)a1 alwaysOnVPN];
  [v16 setEnabled:1];
  BOOL v17 = [v12 objectForKeyedSubscript:@"UIToggleEnabled"];
  if (isa_nsnumber(v17)) {
    objc_msgSend(v16, "setToggleEnabled:", objc_msgSend(v17, "BOOLValue"));
  }
  uint64_t v18 = [v12 objectForKeyedSubscript:@"AllowCaptiveWebSheet"];

  if (isa_nsnumber(v18)) {
    objc_msgSend(v16, "setAllowCaptiveWebSheet:", objc_msgSend(v18, "BOOLValue"));
  }
  __int16 v19 = [v12 objectForKeyedSubscript:@"AllowAllCaptiveNetworkPlugins"];

  v227 = v19;
  if (isa_nsnumber(v19)) {
    objc_msgSend(v16, "setAllowAllCaptiveNetworkPlugins:", objc_msgSend(v19, "BOOLValue"));
  }
  uint64_t v20 = [v12 objectForKeyedSubscript:@"ServiceExceptions"];
  id v224 = v8;
  id v225 = v7;
  v228 = v9;
  v229 = v10;
  v230 = a1;
  v234 = v12;
  if (!isa_nsarray(v20) || ![v20 count])
  {
LABEL_36:
    id v32 = [v12 objectForKeyedSubscript:@"ApplicationExceptions"];

    uint64_t v33 = v32;
    if (isa_nsarray(v32) && [v32 count])
    {
      v216 = v16;
      int v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
      long long v248 = 0u;
      long long v249 = 0u;
      long long v250 = 0u;
      long long v251 = 0u;
      v232 = v33;
      id v35 = v33;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v248 objects:v259 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v249;
        id v39 = &off_1E598D000;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v249 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v41 = *(void **)(*((void *)&v248 + 1) + 8 * i);
            id v42 = [v41 objectForKeyedSubscript:@"BundleIdentifier"];
            if (isa_nsstring(v42))
            {
              id v43 = objc_alloc_init((Class)v39[9]);
              id v44 = v43;
              if (v43)
              {
                [v43 setBundleIdentifier:v42];
                long long v45 = [v41 objectForKeyedSubscript:@"LimitToProtocols"];
                if (isa_nsarray(v45) && [v45 count])
                {
                  id v46 = v35;
                  v47 = v39;
                  id v48 = v34;
                  uint64_t v49 = (void *)[v45 copy];
                  [v44 setLimitToProtocols:v49];

                  int v34 = v48;
                  id v39 = v47;
                  id v35 = v46;
                }
                [v44 setAction:1];
                [v34 setObject:v44 forKeyedSubscript:v42];
              }
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v248 objects:v259 count:16];
        }
        while (v37);
      }

      char v16 = v216;
      if ([v34 count]) {
        [v216 setApplicationExceptions:v34];
      }

      id v8 = v224;
      id v7 = v225;
      id v9 = v228;
      id v10 = v229;
      a1 = v230;
      uint64_t v33 = v232;
      uint64_t v12 = v234;
    }
    uint64_t v50 = [v12 objectForKeyedSubscript:@"AllowedCaptiveNetworkPlugins"];
    v51 = v33;
    id v52 = (void *)v50;

    v226 = v52;
    if (isa_nsarray(v52) && [v52 count])
    {
      uint64_t v53 = v16;
      uint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
      long long v244 = 0u;
      long long v245 = 0u;
      long long v246 = 0u;
      long long v247 = 0u;
      id v55 = v52;
      uint64_t v56 = [v55 countByEnumeratingWithState:&v244 objects:v258 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v245;
        do
        {
          for (uint64_t j = 0; j != v57; ++j)
          {
            if (*(void *)v245 != v58) {
              objc_enumerationMutation(v55);
            }
            int v60 = [*(id *)(*((void *)&v244 + 1) + 8 * j) objectForKeyedSubscript:@"BundleIdentifier"];
            if (isa_nsstring(v60))
            {
              uint64_t v61 = objc_alloc_init(NEAOVPNException);
              v62 = v61;
              if (v61)
              {
                [(NEAOVPNException *)v61 setBundleIdentifier:v60];
                [(NEAOVPNException *)v62 setAction:1];
                [v54 setObject:v62 forKeyedSubscript:v60];
              }
            }
          }
          uint64_t v57 = [v55 countByEnumeratingWithState:&v244 objects:v258 count:16];
        }
        while (v57);
      }

      char v16 = v53;
      if ([v54 count]) {
        [v53 setAllowedCaptiveNetworkPlugins:v54];
      }

      id v8 = v224;
      id v7 = v225;
      id v9 = v228;
      id v10 = v229;
      a1 = v230;
      uint64_t v12 = v234;
    }
    id v63 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v63)
    {
      v222 = v63;
      uint64_t v64 = [v12 objectForKeyedSubscript:@"TunnelConfigurations"];
      if ((isa_nsarray(v64) & 1) == 0)
      {
        v175 = ne_log_obj();
        if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
        {
          v196 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v262 = v196;
          __int16 v263 = 2112;
          v264 = @"TunnelConfigurations";
          id v197 = v196;
          _os_log_error_impl(&dword_19DDAF000, v175, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload: missing %@ array", buf, 0x16u);
        }
        long long v165 = 0;
        long long v164 = v12;
        goto LABEL_206;
      }
      v217 = v16;
      long long v242 = 0u;
      long long v243 = 0u;
      long long v240 = 0u;
      long long v241 = 0u;
      obuint64_t j = v64;
      uint64_t v65 = [obj countByEnumeratingWithState:&v240 objects:v257 count:16];
      if (!v65)
      {
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        uint64_t v69 = 0;
        a1 = v230;
LABEL_208:

        char v180 = v67;
        id v8 = v224;
        id v7 = v225;
        id v9 = v228;
        id v10 = v229;
        if (v180 & 1) != 0 || (v68)
        {
          v182 = v69;
          id v73 = v234;
LABEL_215:
          [v217 setInterfaceProtocolMapping:v222];
          v185 = ne_log_obj();
          if (os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
          {
            v200 = objc_opt_class();
            id v235 = v200;
            uint64_t v201 = [v217 interfaceProtocolMapping];
            *(_DWORD *)buf = 138412802;
            id v262 = v200;
            __int16 v263 = 2112;
            v264 = (__CFString *)v201;
            v202 = (void *)v201;
            __int16 v265 = 2112;
            v266 = v230;
            _os_log_debug_impl(&dword_19DDAF000, v185, OS_LOG_TYPE_DEBUG, "%@ initWithAlwaysOnVPNPayload: aovpn tunnel configs %@, self %@", buf, 0x20u);

            a1 = v230;
          }

          a1 = a1;
          long long v164 = v73;
          long long v165 = a1;
        }
        else
        {
          v181 = ne_log_obj();
          if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
          {
            v203 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            id v262 = v203;
            __int16 v263 = 2112;
            v264 = @"Cellular";
            __int16 v265 = 2112;
            v266 = @"WiFi";
            id v204 = v203;
            _os_log_error_impl(&dword_19DDAF000, v181, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload: must have one of %@ or %@ configs", buf, 0x20u);
          }
          long long v165 = 0;
          long long v164 = v234;
        }
        goto LABEL_227;
      }
      uint64_t v66 = v65;
      int v67 = 0;
      int v68 = 0;
      uint64_t v69 = 0;
      uint64_t v70 = *(void *)v241;
      a1 = v230;
      uint64_t v210 = *(void *)v241;
LABEL_75:
      uint64_t v71 = 0;
      id v72 = v69;
      uint64_t v211 = v66;
      while (1)
      {
        if (*(void *)v241 != v70) {
          objc_enumerationMutation(obj);
        }
        id v73 = v234;
        if (v68 & v67)
        {
          v182 = v72;

          id v8 = v224;
          id v7 = v225;
          id v9 = v228;
          id v10 = v229;
          goto LABEL_215;
        }
        uint64_t v233 = v71;
        id v74 = *(void **)(*((void *)&v240 + 1) + 8 * v71);
        if (isa_nsdictionary(v74)) {
          break;
        }
        uint64_t v69 = v72;
LABEL_158:
        uint64_t v71 = v233 + 1;
        if (v233 + 1 == v66)
        {
          uint64_t v163 = [obj countByEnumeratingWithState:&v240 objects:v257 count:16];
          uint64_t v66 = v163;
          if (!v163) {
            goto LABEL_208;
          }
          goto LABEL_75;
        }
      }
      uint64_t v75 = [v74 objectForKeyedSubscript:@"Interfaces"];
      v219 = v75;
      v220 = v72;
      int v218 = v68;
      int v223 = v67;
      if (isa_nsarray(v75))
      {
        long long v238 = 0u;
        long long v239 = 0u;
        long long v236 = 0u;
        long long v237 = 0u;
        id v76 = v75;
        uint64_t v77 = [v76 countByEnumeratingWithState:&v236 objects:v256 count:16];
        if (v77)
        {
          uint64_t v78 = v77;
          char v79 = 0;
          char v80 = 0;
          uint64_t v81 = *(void *)v237;
          do
          {
            for (uint64_t k = 0; k != v78; ++k)
            {
              if (*(void *)v237 != v81) {
                objc_enumerationMutation(v76);
              }
              uint64_t v83 = *(void *)(*((void *)&v236 + 1) + 8 * k);
              if ([@"Cellular" isEqualToString:v83])
              {
                char v80 = 1;
              }
              else if ([@"WiFi" isEqualToString:v83])
              {
                char v79 = 1;
              }
            }
            uint64_t v78 = [v76 countByEnumeratingWithState:&v236 objects:v256 count:16];
          }
          while (v78);
        }
        else
        {
          char v79 = 0;
          char v80 = 0;
        }

        int v84 = v79 & 1;
        int v85 = v80 & 1;
        a1 = v230;
        id v73 = v234;
        int v68 = v218;
        int v67 = v223;
      }
      else
      {
        int v84 = 1;
        int v85 = 1;
      }
      if ((v85 & v67) == 1)
      {
        v186 = ne_log_obj();
        if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
        {
          v187 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v262 = v187;
          __int16 v263 = 2112;
          v264 = @"Cellular";
          id v188 = v187;
          v189 = "%@ initWithAlwaysOnVPNPayload: multiple %@ configurations detected";
          goto LABEL_222;
        }
LABEL_224:
        id v8 = v224;
        id v7 = v225;
        id v9 = v228;
        id v10 = v229;

LABEL_226:
        long long v165 = 0;
        long long v164 = v73;
        goto LABEL_227;
      }
      if ((v84 & v68) == 1)
      {
        v186 = ne_log_obj();
        if (!os_log_type_enabled(v186, OS_LOG_TYPE_ERROR)) {
          goto LABEL_224;
        }
        v190 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v262 = v190;
        __int16 v263 = 2112;
        v264 = @"WiFi";
        id v188 = v190;
        v189 = "%@ initWithAlwaysOnVPNPayload: multiple %@ configurations detected";
LABEL_222:
        v191 = v186;
        uint32_t v192 = 22;
LABEL_230:
        _os_log_error_impl(&dword_19DDAF000, v191, OS_LOG_TYPE_ERROR, v189, buf, v192);

        goto LABEL_224;
      }
      if (((v85 | v84) & 1) == 0)
      {
        v186 = ne_log_obj();
        if (!os_log_type_enabled(v186, OS_LOG_TYPE_ERROR)) {
          goto LABEL_224;
        }
        v205 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v262 = v205;
        id v188 = v205;
        v189 = "%@ initWithAlwaysOnVPNPayload: invalid tunnel configuration interfaces";
        v191 = v186;
        uint32_t v192 = 12;
        goto LABEL_230;
      }
      char v212 = v85;
      uint64_t v86 = [v229 objectForKeyedSubscript:@"VPNSubType"];
      if (v84) {
        uint64_t v87 = @"WiFi";
      }
      else {
        uint64_t v87 = @"Cellular";
      }
      id v213 = v86;
      id v88 = v74;
      SEL v89 = v87;
      id v90 = objc_alloc_init(NEVPNProtocolIKEv2);
      v91 = ne_log_large_obj();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19DDAF000, v91, OS_LOG_TYPE_DEBUG, "NEConfiguration configureAOVPNTunnelFromTunnelDict called", buf, 2u);
      }

      if (!v90)
      {
        v103 = ne_log_obj();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v103, OS_LOG_TYPE_ERROR, "NEConfiguration configureAOVPNTunnelFromTunnelDict failed to create object", buf, 2u);
        }

        int v99 = 0;
        goto LABEL_142;
      }
      uint64_t v92 = [v88 objectForKeyedSubscript:@"RemoteAddress"];
      [(NEVPNProtocol *)v90 setServerAddress:v92];

      uint64_t v93 = [v88 objectForKeyedSubscript:@"AuthName"];
      [(NEVPNProtocol *)v90 setUsername:v93];

      [(NEVPNProtocol *)v90 setDisconnectOnIdleTimeout:0];
      [(NEVPNProtocol *)v90 setDisconnectOnSleep:0];
      [(NEVPNProtocol *)v90 setIdentityReferenceInternal:0];
      v90->_wakeForRekey = 1;
      [(NEVPNProtocolIKEv2 *)v90 setNatKeepAliveOffloadEnable:2];
      if ([(__CFString *)v89 isEqualToString:@"WiFi"]) {
        uint64_t v94 = 20;
      }
      else {
        uint64_t v94 = 110;
      }
      [(NEVPNProtocolIKEv2 *)v90 setNatKeepAliveOffloadInterval:v94];
      [(NEVPNProtocol *)v90 setIncludeAllNetworks:0];
      [(NEVPNProtocol *)v90 setExcludeLocalNetworks:0];
      [(NEVPNProtocol *)v90 setExcludeCellularServices:0];
      [(NEVPNProtocol *)v90 setExcludeAPNs:0];
      [(NEVPNProtocol *)v90 setExcludeDeviceCommunication:0];
      [(NEVPNProtocol *)v90 setEnforceRoutes:0];
      [(NEVPNProtocol *)v90 setSliceUUID:0];
      v95 = [v88 objectForKeyedSubscript:@"ExtendedAuthEnabled"];
      int v96 = isa_nsnumber(v95);

      if (v96)
      {
        id v97 = [v88 objectForKeyedSubscript:@"ExtendedAuthEnabled"];
        -[NEVPNProtocolIPSec setUseExtendedAuthentication:](v90, "setUseExtendedAuthentication:", [v97 BOOLValue]);
      }
      v98 = [v88 objectForKeyedSubscript:@"AuthPassword"];
      int v99 = v98;
      if (v98)
      {
        if (isa_nsdata(v98))
        {
          v209 = v89;
          int v100 = v84;
          id v101 = v88;
          uint64_t v102 = [[NSString alloc] initWithData:v99 encoding:4];

          int v99 = (__CFString *)v102;
        }
        else
        {
          if ((isa_nsstring(v99) & 1) == 0)
          {
            id v117 = ne_log_obj();
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
            {
              id v118 = objc_opt_class();
              id v119 = v88;
              id v120 = v118;
              id v121 = (__CFString *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v262 = v118;
              __int16 v263 = 2112;
              v264 = v121;
              int v122 = v121;
              _os_log_error_impl(&dword_19DDAF000, v117, OS_LOG_TYPE_ERROR, "%@ configureAOVPNTunnelFromTunnelDict: unsupported password data type %@", buf, 0x16u);

              a1 = v230;
              id v88 = v119;
            }
            goto LABEL_141;
          }
          v209 = v89;
          int v100 = v84;
          id v101 = v88;
        }
        v104 = [NEKeychainItem alloc];
        int64_t keychainDomain = v90->super.super._keychainDomain;
        id v107 = objc_getProperty(v90, v106, 88, 1);
        v108 = [(NEKeychainItem *)v104 initWithPassword:v99 domain:keychainDomain accessGroup:v107];
        [(NEVPNProtocol *)v90 setPasswordKeychainItem:v108];

        id v88 = v101;
        int v84 = v100;
        SEL v89 = v209;
      }
      if ([(NEVPNProtocolIPSec *)v90 useExtendedAuthentication]
        && ([(NEVPNProtocol *)v90 username], (uint64_t v109 = objc_claimAutoreleasedReturnValue()) != 0)
        && (int v110 = (void *)v109,
            [(NEVPNProtocol *)v90 passwordKeychainItem],
            id v111 = objc_claimAutoreleasedReturnValue(),
            v111,
            v110,
            !v111))
      {
        long long v134 = ne_log_obj();
        if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
        {
          uint64_t v161 = objc_opt_class();
          *(_DWORD *)buf = 138413058;
          id v262 = v161;
          __int16 v263 = 2112;
          v264 = @"AuthPassword";
          __int16 v265 = 2112;
          v266 = @"AuthName";
          __int16 v267 = 2112;
          uint64_t v268 = @"ExtendedAuthEnabled";
          id v162 = v161;
          _os_log_error_impl(&dword_19DDAF000, v134, OS_LOG_TYPE_ERROR, "%@ configureAOVPNTunnelFromTunnelDict: %@ required for %@ with %@ method", buf, 0x2Au);
        }
        uint64_t v69 = 0;
        a1 = v230;
      }
      else
      {
        id v112 = [v88 objectForKeyedSubscript:@"LocalIdentifier"];
        [(NEVPNProtocolIPSec *)v90 setLocalIdentifier:v112];

        int v113 = [v88 objectForKeyedSubscript:@"RemoteIdentifier"];
        [(NEVPNProtocolIPSec *)v90 setRemoteIdentifier:v113];

        uint64_t v114 = [v88 objectForKeyedSubscript:@"AuthenticationMethod"];

        a1 = v230;
        if (!v114) {
          goto LABEL_134;
        }
        if (isa_nsstring(v114))
        {
          if ([(__CFString *)v114 isEqualToString:@"SharedSecret"]) {
            uint64_t v115 = 2;
          }
          else {
            uint64_t v115 = [(__CFString *)v114 isEqualToString:@"Certificate"];
          }
          [(NEVPNProtocolIPSec *)v90 setAuthenticationMethod:v115];
LABEL_134:
          int v99 = [v88 objectForKeyedSubscript:@"ProtocolType"];

          if (v99
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && ([(__CFString *)v99 isEqualToString:@"IKEv2"] & 1) != 0)
          {
            v123 = [v88 objectForKeyedSubscript:@"SharedSecret"];

            if (v123)
            {
              if (isa_nsdata(v123))
              {
                uint64_t v124 = [[NSString alloc] initWithData:v123 encoding:4];

                v123 = (__CFString *)v124;
              }
              else if ((isa_nsstring(v123) & 1) == 0)
              {
                int v99 = v123;
                id v117 = ne_log_obj();
                if (!os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_141;
                }
                v158 = objc_opt_class();
                id v136 = v158;
                __int16 v159 = (__CFString *)objc_opt_class();
                *(_DWORD *)buf = 138412546;
                id v262 = v158;
                __int16 v263 = 2112;
                v264 = v159;
                v160 = v159;
                _os_log_error_impl(&dword_19DDAF000, v117, OS_LOG_TYPE_ERROR, "%@ configureAOVPNTunnelFromTunnelDict: unsupported shared secret data type %@", buf, 0x16u);

                goto LABEL_166;
              }
              id v140 = [NEKeychainItem alloc];
              int64_t v141 = v90->super.super._keychainDomain;
              id v143 = objc_getProperty(v90, v142, 88, 1);
              id v144 = [(NEKeychainItem *)v140 initWithPassword:v123 domain:v141 accessGroup:v143];
              [(NEVPNProtocolIPSec *)v90 setSharedSecretKeychainItem:v144];

              int v99 = v123;
              a1 = v230;
            }
            else
            {
              int v99 = 0;
            }
            if ([(NEVPNProtocolIPSec *)v90 authenticationMethod] != NEVPNIKEAuthenticationMethodSharedSecret
              || ([(NEVPNProtocolIPSec *)v90 sharedSecretKeychainItem],
                  v145 = objc_claimAutoreleasedReturnValue(),
                  v145,
                  v145))
            {
              if (!ingestIKEv2Dict(v213, v88, v90)) {
                goto LABEL_142;
              }
              id v146 = [(NEVPNProtocolIKEv2 *)v90 IKESecurityAssociationParameters];
              if ([v146 diffieHellmanGroup] <= 13)
              {
              }
              else
              {
                v147 = [(NEVPNProtocolIKEv2 *)v90 childSecurityAssociationParameters];
                id v148 = v88;
                uint64_t v149 = [v147 diffieHellmanGroup];

                a1 = v230;
                BOOL v150 = v149 <= 13;
                id v88 = v148;
                if (!v150)
                {
                  uint64_t v69 = v90;
                  goto LABEL_143;
                }
              }
              id v117 = ne_log_obj();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
              {
                id v151 = objc_opt_class();
                id v207 = v151;
                v206 = [(NEVPNProtocolIKEv2 *)v90 IKESecurityAssociationParameters];
                id v208 = v88;
                uint64_t v152 = [v206 diffieHellmanGroup];
                v153 = [(NEVPNProtocolIKEv2 *)v90 childSecurityAssociationParameters];
                uint64_t v154 = [v153 diffieHellmanGroup];
                *(_DWORD *)buf = 138413058;
                id v262 = v151;
                a1 = v230;
                __int16 v263 = 2048;
                v264 = (__CFString *)v152;
                id v88 = v208;
                __int16 v265 = 2048;
                v266 = (__CFString *)v154;
                __int16 v267 = 2048;
                uint64_t v268 = 14;
                _os_log_error_impl(&dword_19DDAF000, v117, OS_LOG_TYPE_ERROR, "%@ configureAOVPNTunnelFromTunnelDict: Invalid DH group (parent %ld child %ld), mininum allowed is %ld", buf, 0x2Au);
              }
LABEL_141:

LABEL_142:
              uint64_t v69 = 0;
              goto LABEL_143;
            }
            id v117 = ne_log_obj();
            if (!os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
              goto LABEL_141;
            }
            __int16 v157 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            id v262 = v157;
            __int16 v263 = 2112;
            v264 = @"SharedSecret";
            __int16 v265 = 2112;
            v266 = @"SharedSecret";
            id v136 = v157;
            long long v137 = v117;
            long long v138 = "%@ configureAOVPNTunnelFromTunnelDict: %@ required with %@ method";
            uint32_t v139 = 32;
          }
          else
          {
            id v117 = ne_log_obj();
            if (!os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
              goto LABEL_141;
            }
            long long v135 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            id v262 = v135;
            __int16 v263 = 2112;
            v264 = v99;
            id v136 = v135;
            long long v137 = v117;
            long long v138 = "%@ configureAOVPNTunnelFromTunnelDict: invalid ProtocolType (%@),  IKEv2 expected";
            uint32_t v139 = 22;
          }
          _os_log_error_impl(&dword_19DDAF000, v137, OS_LOG_TYPE_ERROR, v138, buf, v139);
LABEL_166:

          a1 = v230;
          goto LABEL_141;
        }
        v116 = ne_log_obj();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        {
          id v155 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v262 = v155;
          __int16 v263 = 2112;
          v264 = v114;
          id v156 = v155;
          _os_log_error_impl(&dword_19DDAF000, v116, OS_LOG_TYPE_ERROR, "%@ configureAOVPNTunnelFromTunnelDict: invalid authen type %@.", buf, 0x16u);

          a1 = v230;
        }

        uint64_t v69 = 0;
        int v99 = v114;
      }
LABEL_143:

      if (!v69)
      {
        v220 = 0;
        id v8 = v224;
        id v7 = v225;
        id v9 = v228;
        id v10 = v229;
        id v73 = v234;
        goto LABEL_226;
      }
      if (v84)
      {
        v221 = v69;
        [v222 setObject:v69 forKey:@"AlwaysOnVPNInterfaceWiFi"];
        id v125 = [v88 objectForKeyedSubscript:@"PayloadCertificateUUID"];

        if (v125)
        {
          v126 = [v88 objectForKeyedSubscript:@"PayloadCertificateUUID"];
          [v228 addCertificatePending:v126 certificateTag:@"_PayloadCertificateRefForWifi"];
        }
        id v127 = v88;
        uint64_t v128 = v219;
        uint64_t v66 = v211;
        int v67 = v223;
        if ((v212 & 1) == 0)
        {
          int v68 = 1;
LABEL_155:
          uint64_t v69 = v221;
LABEL_157:

          id v72 = v69;
          uint64_t v70 = v210;
          goto LABEL_158;
        }
        uint64_t v129 = (void *)[(NEVPNProtocolIKEv2 *)v221 copy];
        id v130 = [MEMORY[0x1E4F29128] UUID];
        [v129 setIdentifier:v130];

        [v222 setObject:v129 forKey:@"AlwaysOnVPNInterfaceCellular"];
        int v68 = 1;
      }
      else
      {
        if ((v212 & 1) == 0)
        {
          uint64_t v128 = v219;
          uint64_t v66 = v211;
          int v68 = v218;
          int v67 = v223;
          goto LABEL_157;
        }
        long long v131 = v69;
        id v127 = v88;
        v221 = v131;
        objc_msgSend(v222, "setObject:forKey:");
        uint64_t v128 = v219;
        uint64_t v66 = v211;
        int v68 = v218;
      }
      long long v132 = [v127 objectForKeyedSubscript:@"PayloadCertificateUUID"];

      if (v132)
      {
        long long v133 = [v127 objectForKeyedSubscript:@"PayloadCertificateUUID"];
        [v228 addCertificatePending:v133 certificateTag:@"_PayloadCertificateRefForCellular"];
      }
      int v67 = 1;
      goto LABEL_155;
    }
    v174 = ne_log_obj();
    if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
    {
      v194 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v262 = v194;
      id v195 = v194;
      _os_log_error_impl(&dword_19DDAF000, v174, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload: failed to create tunnel configs", buf, 0xCu);
    }
LABEL_189:
    long long v165 = 0;
    long long v164 = v12;
    goto LABEL_227;
  }
  v215 = v16;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  long long v252 = 0u;
  long long v253 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  v231 = v20;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v252 objects:v260 count:16];
  if (!v23) {
    goto LABEL_33;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *(void *)v253;
LABEL_18:
  uint64_t v26 = 0;
  while (1)
  {
    if (*(void *)v253 != v25) {
      objc_enumerationMutation(v22);
    }
    uint64_t v27 = *(void **)(*((void *)&v252 + 1) + 8 * v26);
    int v28 = [v27 objectForKeyedSubscript:@"ServiceName"];
    if (!isa_nsstring(v28)) {
      goto LABEL_31;
    }
    unint64_t v29 = objc_alloc_init(NEAOVPNException);
    if (v29) {
      break;
    }
LABEL_30:

LABEL_31:
    if (v24 == ++v26)
    {
      uint64_t v24 = [v22 countByEnumeratingWithState:&v252 objects:v260 count:16];
      if (!v24)
      {
LABEL_33:

        char v16 = v215;
        if ([v21 count]) {
          [v215 setServiceExceptions:v21];
        }

        id v7 = v225;
        id v9 = v228;
        id v10 = v229;
        uint64_t v20 = v231;
        uint64_t v12 = v234;
        goto LABEL_36;
      }
      goto LABEL_18;
    }
  }
  id v30 = [v27 objectForKeyedSubscript:@"Action"];
  if (!isa_nsstring(v30))
  {
LABEL_29:
    [(NEAOVPNException *)v29 setServiceName:v28];
    [v21 setObject:v29 forKeyedSubscript:v28];

    goto LABEL_30;
  }
  if ([v30 isEqualToString:@"Allow"])
  {
    uint64_t v31 = 1;
LABEL_28:
    [(NEAOVPNException *)v29 setAction:v31];
    goto LABEL_29;
  }
  if ([v30 isEqualToString:@"Drop"])
  {
    uint64_t v31 = 2;
    goto LABEL_28;
  }
  v179 = ne_log_obj();
  if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
  {
    v198 = objc_opt_class();
    *(_DWORD *)buf = 138413058;
    id v262 = v198;
    __int16 v263 = 2112;
    v264 = @"ServiceExceptions";
    __int16 v265 = 2112;
    v266 = @"Action";
    __int16 v267 = 2112;
    uint64_t v268 = (uint64_t)v30;
    id v199 = v198;
    _os_log_error_impl(&dword_19DDAF000, v179, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload: invalid %@ %@ option '%@'", buf, 0x2Au);
  }
  long long v165 = 0;
  long long v164 = v234;
  id v7 = v225;
  id v9 = v228;
  id v10 = v229;
LABEL_206:
  a1 = v230;
LABEL_227:

LABEL_228:
  return v165;
}

- (NSObject)initWithContentFilterPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  if (!a1)
  {
    uint64_t v23 = 0;
    goto LABEL_20;
  }
  id v10 = v8;
  int v11 = [v10 payloadAtom];
  uint64_t v12 = ne_log_large_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v106 = (id)objc_opt_class();
    id v4 = v106;
    _os_log_debug_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_DEBUG, "%@ initWithContentFilterPayload", buf, 0xCu);
  }
  if (!v11) {
    goto LABEL_16;
  }
  uint64_t v13 = [v11 objectForKeyedSubscript:@"FilterType"];
  if (v13)
  {
    id v4 = [v11 objectForKeyedSubscript:@"FilterType"];
    if (([@"Plugin" isEqualToString:v4] & 1) == 0)
    {

LABEL_16:
      id v22 = ne_log_obj();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      unint64_t v29 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v106 = v29;
      id v27 = v29;
      int v28 = "%@ initWithContentFilterPayload: empty payload atom or plugin type, or wrong filter type";
LABEL_26:
      _os_log_error_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);

      goto LABEL_17;
    }
  }
  id v14 = [v11 objectForKeyedSubscript:@"PluginBundleID"];

  if (v13)
  {
  }
  if (!v14) {
    goto LABEL_16;
  }
  uint64_t v15 = [a1 initWithName:v9 grade:a4];
  if (v15)
  {
    a1 = v15;
    char v16 = objc_alloc_init(NEContentFilter);
    [a1 setContentFilter:v16];

    BOOL v17 = [a1 contentFilter];

    if (!v17)
    {
      id v22 = ne_log_obj();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      uint64_t v26 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v106 = v26;
      id v27 = v26;
      int v28 = "%@ initWithContentFilterPayload failed, can't create content filter";
      goto LABEL_26;
    }
    uint64_t v18 = [v11 objectForKeyedSubscript:@"FilterGrade"];
    if (isa_nsstring(v18))
    {
      if ([v18 isEqualToString:@"firewall"])
      {
        __int16 v19 = [a1 contentFilter];
        uint64_t v20 = v19;
        uint64_t v21 = 1;
      }
      else
      {
        if (![v18 isEqualToString:@"inspector"])
        {
          uint64_t v50 = ne_log_obj();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v106 = v18;
            _os_log_error_impl(&dword_19DDAF000, v50, OS_LOG_TYPE_ERROR, "Invalid filter grade: %@", buf, 0xCu);
          }
          goto LABEL_71;
        }
        __int16 v19 = [a1 contentFilter];
        uint64_t v20 = v19;
        uint64_t v21 = 2;
      }
      [v19 setGrade:v21];
    }
    id v30 = objc_alloc_init(NEFilterProviderConfiguration);
    uint64_t v31 = [a1 contentFilter];
    [v31 setProvider:v30];

    id v32 = [a1 contentFilter];
    uint64_t v33 = [v32 provider];

    if (v33)
    {
      int v34 = [v11 objectForKeyedSubscript:@"PluginBundleID"];
      id v35 = [a1 contentFilter];
      uint64_t v36 = [v35 provider];
      [v36 setPluginType:v34];

      uint64_t v37 = [a1 contentFilter];
      uint64_t v38 = [v37 provider];
      uint64_t v40 = v38;
      if (v38) {
        objc_setProperty_atomic_copy(v38, v39, @"com.apple.managed.vpn.shared", 96);
      }

      uint64_t v41 = [a1 contentFilter];
      id v42 = [v41 provider];
      id v43 = [v42 pluginType];
      [a1 setApplication:v43];

      id v44 = [a1 contentFilter];
      long long v45 = [v44 provider];
      id v46 = [v45 pluginType];
      [a1 setApplicationIdentifier:v46];

      v47 = [v11 objectForKeyedSubscript:@"Enabled"];
      if (isa_nsnumber(v47))
      {
        id v48 = [v11 objectForKeyedSubscript:@"Enabled"];
        int v49 = [v48 BOOLValue];

        if (!v49)
        {
LABEL_40:
          uint64_t v54 = [a1 contentFilter];
          uint64_t v50 = [v54 provider];

          id v55 = [v11 objectForKeyedSubscript:@"VendorConfig"];
          [v50 setVendorConfiguration:v55];

          uint64_t v56 = [v11 objectForKeyedSubscript:@"ServerAddress"];
          [v50 setServerAddress:v56];

          uint64_t v57 = [v11 objectForKeyedSubscript:@"UserName"];
          [v50 setUsername:v57];

          uint64_t v58 = [v11 objectForKeyedSubscript:@"Organization"];
          [v50 setOrganization:v58];

          __int16 v59 = [v11 objectForKeyedSubscript:@"FilterDataProviderDesignatedRequirement"];
          [v50 setDataProviderDesignatedRequirement:v59];

          int v60 = [v11 objectForKeyedSubscript:@"FilterDataProviderBundleIdentifier"];
          [v50 setFilterDataProviderBundleIdentifier:v60];

          uint64_t v61 = [v11 objectForKeyedSubscript:@"FilterPacketProviderDesignatedRequirement"];
          [v50 setPacketProviderDesignatedRequirement:v61];

          v62 = [v11 objectForKeyedSubscript:@"FilterPacketProviderBundleIdentifier"];
          [v50 setFilterPacketProviderBundleIdentifier:v62];

          id v63 = [v11 objectForKeyedSubscript:@"FilterSockets"];
          int v64 = isa_nsnumber(v63);

          if (v64)
          {
            uint64_t v65 = [v11 objectForKeyedSubscript:@"FilterSockets"];
            -[NSObject setFilterSockets:](v50, "setFilterSockets:", [v65 BOOLValue]);
          }
          uint64_t v66 = [v11 objectForKeyedSubscript:@"FilterPackets"];
          int v67 = isa_nsnumber(v66);

          if (v67)
          {
            int v68 = [v11 objectForKeyedSubscript:@"FilterPackets"];
            -[NSObject setFilterPackets:](v50, "setFilterPackets:", [v68 BOOLValue]);
          }
          uint64_t v69 = [v11 objectForKeyedSubscript:@"DisableDefaultDrop"];
          int v70 = isa_nsnumber(v69);

          if (v70)
          {
            uint64_t v71 = [v11 objectForKeyedSubscript:@"DisableDefaultDrop"];
            -[NSObject setDisableDefaultDrop:](v50, "setDisableDefaultDrop:", [v71 BOOLValue]);
          }
          id v72 = [v11 objectForKeyedSubscript:@"FilterBrowsers"];
          int v73 = isa_nsnumber(v72);

          if (v73)
          {
            id v74 = [v11 objectForKeyedSubscript:@"FilterBrowsers"];
            -[NSObject setFilterBrowsers:](v50, "setFilterBrowsers:", [v74 BOOLValue]);
          }
          if (([v50 filterSockets] & 1) == 0
            && ([v50 filterBrowsers] & 1) == 0
            && ([v50 filterPackets] & 1) == 0)
          {
            uint64_t v75 = [a1 contentFilter];
            [v75 setEnabled:0];
          }
          uint64_t v76 = [v11 objectForKeyedSubscript:@"Password"];
          if (v76)
          {
            uint64_t v77 = (void *)v76;
            uint64_t v78 = [v50 username];
            v103 = v18;
            if (isa_nsdata(v77))
            {
              uint64_t v79 = [[NSString alloc] initWithData:v77 encoding:4];

              uint64_t v77 = (void *)v79;
            }
            else if ((isa_nsstring(v77) & 1) == 0)
            {
              uint64_t v94 = ne_log_obj();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              {
                v98 = objc_opt_class();
                id v100 = v98;
                int v99 = objc_opt_class();
                *(_DWORD *)buf = 138412546;
                id v106 = v98;
                __int16 v107 = 2112;
                v108 = v99;
                id v102 = v99;
                _os_log_error_impl(&dword_19DDAF000, v94, OS_LOG_TYPE_ERROR, "%@ initWithContentFilterPayload: unsupported password data type %@", buf, 0x16u);
              }
              uint64_t v23 = 0;
              uint64_t v18 = v103;
              goto LABEL_72;
            }
            id v80 = v77;
            id v82 = [NEKeychainItem alloc];
            if (v50) {
              id Property = objc_getProperty(v50, v81, 96, 1);
            }
            else {
              id Property = 0;
            }
            id v84 = Property;
            int v85 = [(NEKeychainItem *)v82 initWithPassword:v80 domain:1 accessGroup:v84];

            [(NEKeychainItem *)v85 syncUsingConfiguration:a1 accountName:v78 passwordType:0 identifierSuffix:0];
            uint64_t v86 = [(NEKeychainItem *)v85 persistentReference];
            [v50 setPasswordReference:v86];

            uint64_t v18 = v103;
          }
          [v50 setIdentityReference:0];
          uint64_t v87 = [v11 objectForKeyedSubscript:@"PayloadCertificateUUID"];

          if (v87)
          {
            SEL v89 = [v11 objectForKeyedSubscript:@"PayloadCertificateUUID"];
            if (v50) {
              id v90 = objc_getProperty(v50, v88, 96, 1);
            }
            else {
              id v90 = 0;
            }
            id v91 = v90;
            [v10 addCertificatePending:v89 certificateTag:@"_PayloadCertificateRef" accessGroup:v91];
          }
          else
          {
            uint64_t v92 = [v11 objectForKeyedSubscript:@"LocalCertificate"];

            if (!v92)
            {
LABEL_66:
              uint64_t v93 = ne_log_obj();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                v95 = objc_opt_class();
                id v101 = v95;
                [a1 contentFilter];
                int v96 = v104 = v18;
                id v97 = [v96 provider];
                *(_DWORD *)buf = 138412546;
                id v106 = v95;
                __int16 v107 = 2112;
                v108 = v97;
                _os_log_debug_impl(&dword_19DDAF000, v93, OS_LOG_TYPE_DEBUG, "%@ initWithContentFilterPayload: provider %@", buf, 0x16u);

                uint64_t v18 = v104;
              }

              uint64_t v23 = a1;
              goto LABEL_72;
            }
            SEL v89 = [v11 objectForKeyedSubscript:@"LocalCertificate"];
            setLocalCertificate(v89);
            id v91 = (id)objc_claimAutoreleasedReturnValue();
            [v50 setIdentityReference:v91];
          }

          goto LABEL_66;
        }
      }
      else
      {
      }
      uint64_t v53 = [a1 contentFilter];
      [v53 setEnabled:1];

      goto LABEL_40;
    }
    uint64_t v50 = ne_log_obj();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v106 = v51;
      id v52 = v51;
      _os_log_error_impl(&dword_19DDAF000, v50, OS_LOG_TYPE_ERROR, "%@ initWithContentFilterPayload failed, can't create provider", buf, 0xCu);
    }
LABEL_71:
    uint64_t v23 = 0;
LABEL_72:

    goto LABEL_19;
  }
  a1 = ne_log_obj();
  if (!os_log_type_enabled(a1, OS_LOG_TYPE_ERROR)) {
    goto LABEL_18;
  }
  uint64_t v25 = objc_opt_class();
  *(_DWORD *)buf = 138412290;
  id v106 = v25;
  id v22 = v25;
  _os_log_error_impl(&dword_19DDAF000, a1, OS_LOG_TYPE_ERROR, "%@ initWithContentFilterPayload failed", buf, 0xCu);
LABEL_17:

LABEL_18:
  uint64_t v23 = 0;
LABEL_19:

LABEL_20:
  return v23;
}

- (id)initWithPathControllerPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    id v35 = 0;
    goto LABEL_47;
  }
  id v9 = [v7 payloadAtom];
  id v10 = ne_log_large_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v78 = (id)objc_opt_class();
    id v41 = v78;
    _os_log_debug_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEBUG, "%@ initWithPathControllerPayload", buf, 0xCu);
  }
  if ((isa_nsdictionary(v9) & 1) == 0)
  {
    int v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v78 = v36;
      id v37 = v36;
      _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: empty payload atom", buf, 0xCu);
    }
    goto LABEL_45;
  }
  int v11 = [v9 objectForKeyedSubscript:@"ApplicationRules"];
  if ((isa_nsarray(v11) & 1) == 0)
  {
    uint64_t v38 = ne_log_obj();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v48 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v78 = v48;
      id v47 = v48;
      _os_log_error_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: ApplicationRules missing", buf, 0xCu);
      goto LABEL_54;
    }
LABEL_39:

LABEL_45:
    id v35 = 0;
    goto LABEL_46;
  }
  uint64_t v68 = a4;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  int v11 = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (!v12) {
    goto LABEL_29;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v74;
  id v66 = v8;
  id v67 = v7;
  uint64_t v64 = *(void *)v74;
  uint64_t v65 = v9;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v74 != v14) {
        objc_enumerationMutation(v11);
      }
      char v16 = *(void **)(*((void *)&v73 + 1) + 8 * i);
      if ((isa_nsdictionary(v16) & 1) == 0)
      {
        uint64_t v18 = ne_log_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v49 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          id v78 = v49;
          id v50 = v49;
          _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: ApplicationRules malformed", buf, 0xCu);
        }
LABEL_66:
        id v8 = v66;
        id v7 = v67;
        id v9 = v65;
LABEL_44:

        goto LABEL_45;
      }
      BOOL v17 = [v16 objectForKeyedSubscript:@"AppIdentifierMatches"];
      uint64_t v18 = v17;
      if (v17)
      {
        if ((isa_nsarray(v17) & 1) == 0)
        {
          __int16 v19 = ne_log_obj();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v53 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            id v78 = v53;
            id v54 = v53;
            _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: AppIdentifierMatches malformed", buf, 0xCu);
          }
LABEL_43:
          id v8 = v66;
          id v7 = v67;
          id v9 = v65;

          goto LABEL_44;
        }
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        __int16 v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v69 objects:v81 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v70;
          while (2)
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v70 != v22) {
                objc_enumerationMutation(v19);
              }
              if ((isa_nsstring(*(void **)(*((void *)&v69 + 1) + 8 * j)) & 1) == 0)
              {
                id v39 = ne_log_obj();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  v51 = objc_opt_class();
                  *(_DWORD *)buf = 138412290;
                  id v78 = v51;
                  id v52 = v51;
                  _os_log_error_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: AppIdentifierMatches malformed", buf, 0xCu);
                }
                uint64_t v18 = v19;
                goto LABEL_43;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v69 objects:v81 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        uint64_t v14 = v64;
      }
      uint64_t v24 = [v16 objectForKeyedSubscript:@"AllowRoamingCellularData"];
      uint64_t v25 = v24;
      if (v24 && (isa_nsnumber(v24) & 1) == 0)
      {
        id v55 = ne_log_obj();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          int v60 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          id v78 = v60;
          id v61 = v60;
          _os_log_error_impl(&dword_19DDAF000, v55, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: AllowRoamingCellularData malformed", buf, 0xCu);
        }
LABEL_65:

        goto LABEL_66;
      }
      uint64_t v26 = [v16 objectForKeyedSubscript:@"AllowCellularData"];
      id v27 = v26;
      if (v26 && (isa_nsnumber(v26) & 1) == 0)
      {
        uint64_t v56 = ne_log_obj();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v62 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          id v78 = v62;
          id v63 = v62;
          _os_log_error_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: AllowCellularData malformed", buf, 0xCu);
        }
        goto LABEL_65;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v73 objects:v82 count:16];
    id v8 = v66;
    id v7 = v67;
    id v9 = v65;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_29:

  a1 = (id)[a1 initWithName:v8 grade:v68];
  if (!a1)
  {
    id v42 = ne_log_obj();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_51;
    }
    id v43 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v78 = v43;
    __int16 v79 = 2112;
    id v80 = v8;
    id v44 = v43;
    long long v45 = "%@ initWithPathControllerPayload: initWithName failed for '%@'";
    goto LABEL_68;
  }
  int v28 = objc_alloc_init(NEPathController);
  [a1 setPathController:v28];

  unint64_t v29 = [a1 pathController];

  if (!v29)
  {
    id v42 = ne_log_obj();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_51;
    }
    __int16 v59 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v78 = v59;
    __int16 v79 = 2112;
    id v80 = v8;
    id v44 = v59;
    long long v45 = "%@ initWithPathControllerPayload failed, could not create Path Controller for config '%@'";
LABEL_68:
    _os_log_error_impl(&dword_19DDAF000, v42, OS_LOG_TYPE_ERROR, v45, buf, 0x16u);

LABEL_51:
    uint64_t v38 = ne_log_obj();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      id v46 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v78 = v46;
      id v47 = v46;
      _os_log_debug_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_DEBUG, "%@ initWithPathControllerPayload: failed", buf, 0xCu);
LABEL_54:

      goto LABEL_39;
    }
    goto LABEL_39;
  }
  id v30 = [a1 pathController];
  [v30 setEnabled:1];

  uint64_t v31 = [a1 pathController];
  uint64_t v33 = v31;
  if (v31) {
    objc_setProperty_atomic_copy(v31, v32, v11, 32);
  }

  int v34 = ne_log_obj();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v57 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v78 = v57;
    id v58 = v57;
    _os_log_debug_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_DEBUG, "%@ initWithPathControllerPayload: done", buf, 0xCu);
  }
  a1 = a1;
  id v35 = a1;
LABEL_46:

LABEL_47:
  return v35;
}

- (id)initWithDNSProxyPayload:(id)a1 configurationName:(void *)a2 grade:(void *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    id v28 = 0;
    goto LABEL_20;
  }
  id v7 = [v5 payloadAtom];
  id v8 = ne_log_large_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v44 = 138412290;
    id v45 = (id)objc_opt_class();
    id v39 = v45;
    _os_log_debug_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEBUG, "%@ initWithDNSProxyPayload", (uint8_t *)&v44, 0xCu);
  }
  if (v7)
  {
    a1 = (id)[a1 initWithName:v6 grade:1];
    if (a1)
    {
      id v9 = objc_alloc_init(NEDNSProxy);
      [a1 setDnsProxy:v9];

      id v10 = [a1 dnsProxy];

      if (v10)
      {
        int v11 = [a1 dnsProxy];
        [v11 setEnabled:1];

        uint64_t v12 = [NEDNSProxyProviderProtocol alloc];
        uint64_t v13 = [v7 objectForKeyedSubscript:@"AppBundleIdentifier"];
        uint64_t v14 = [(NEDNSProxyProviderProtocol *)v12 initWithPluginType:v13];
        uint64_t v15 = [a1 dnsProxy];
        [v15 setProtocol:v14];

        char v16 = [a1 dnsProxy];
        BOOL v17 = [v16 protocol];

        if (v17)
        {
          uint64_t v18 = [v7 objectForKeyedSubscript:@"ProviderBundleIdentifier"];
          __int16 v19 = [a1 dnsProxy];
          uint64_t v20 = [v19 protocol];
          [v20 setProviderBundleIdentifier:v18];

          uint64_t v21 = [v7 objectForKeyedSubscript:@"ProviderConfiguration"];
          uint64_t v22 = [a1 dnsProxy];
          uint64_t v23 = [v22 protocol];
          [v23 setProviderConfiguration:v21];

          uint64_t v24 = [v7 objectForKeyedSubscript:@"ProviderDesignatedRequirement"];
          uint64_t v25 = [a1 dnsProxy];
          uint64_t v26 = [v25 protocol];
          [v26 setDesignatedRequirement:v24];

          id v27 = ne_log_obj();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            id v41 = objc_opt_class();
            int v44 = 138412290;
            id v45 = v41;
            id v42 = v41;
            _os_log_debug_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_DEBUG, "%@ initWithDNSProxyPayload: done", (uint8_t *)&v44, 0xCu);
          }
          a1 = a1;
          id v28 = a1;
          goto LABEL_19;
        }
        unint64_t v29 = ne_log_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = objc_opt_class();
          int v44 = 138412290;
          id v45 = v38;
          id v31 = v38;
          id v32 = "%@ initWithDNSProxyPayload failed to allocate protocol";
          goto LABEL_13;
        }
        goto LABEL_18;
      }
      uint64_t v33 = ne_log_obj();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        unint64_t v29 = ne_log_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v40 = objc_opt_class();
          int v44 = 138412290;
          id v45 = v40;
          id v31 = v40;
          _os_log_debug_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_DEBUG, "%@ initWithDNSProxyPayload: failed", (uint8_t *)&v44, 0xCu);
          goto LABEL_24;
        }
        goto LABEL_18;
      }
      id v43 = objc_opt_class();
      int v44 = 138412546;
      id v45 = v43;
      __int16 v46 = 2112;
      id v47 = v6;
      id v35 = v43;
      uint64_t v36 = "%@ initWithDNSProxyPayload failed, can't create dnsProxy for config '%@'";
    }
    else
    {
      uint64_t v33 = ne_log_obj();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      int v34 = objc_opt_class();
      int v44 = 138412546;
      id v45 = v34;
      __int16 v46 = 2112;
      id v47 = v6;
      id v35 = v34;
      uint64_t v36 = "%@ initWithDNSProxyPayload: initWithName failed for '%@'";
    }
    _os_log_error_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_ERROR, v36, (uint8_t *)&v44, 0x16u);

    goto LABEL_17;
  }
  unint64_t v29 = ne_log_obj();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    id v30 = objc_opt_class();
    int v44 = 138412290;
    id v45 = v30;
    id v31 = v30;
    id v32 = "%@ initWithDNSProxyPayload: empty payload atom";
LABEL_13:
    _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v44, 0xCu);
LABEL_24:
  }
LABEL_18:

  id v28 = 0;
LABEL_19:

LABEL_20:
  return v28;
}

- (id)initWithDNSSettingsPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    id v20 = 0;
    goto LABEL_46;
  }
  id v9 = v7;
  id v10 = [v9 payloadAtom];
  int v11 = ne_log_large_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = (id)objc_opt_class();
    id v32 = v56;
    _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithDNSSettingsPayload", buf, 0xCu);
  }
  if ((isa_nsdictionary(v10) & 1) == 0)
  {
    uint64_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v45 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v56 = v45;
      id v46 = v45;
      _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "%@ initWithDNSSettingsPayload: empty payload atom", buf, 0xCu);
    }
    id v20 = 0;
    goto LABEL_45;
  }
  uint64_t v12 = [v10 objectForKeyedSubscript:@"DNSSettings"];
  if (isa_nsdictionary(v12))
  {
    uint64_t v13 = [v10 objectForKeyedSubscript:@"ProhibitDisablement"];
    int v14 = isa_nsnumber(v13);

    if (v14)
    {
      uint64_t v15 = [v10 objectForKeyedSubscript:@"ProhibitDisablement"];
      int v16 = [v15 BOOLValue];

      if (v16) {
        a4 = 1;
      }
    }
    BOOL v17 = v12;
    self;
    uint64_t v18 = [v17 objectForKeyedSubscript:@"DNSProtocol"];
    if (isa_nsstring(v18))
    {
      if ([v18 isEqualToString:@"HTTPS"])
      {
        __int16 v19 = off_1E598D0D8;
      }
      else
      {
        if (![v18 isEqualToString:@"TLS"])
        {
          uint64_t v21 = 0;
LABEL_19:

          if (!v21)
          {
            uint64_t v26 = ne_log_obj();
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              goto LABEL_40;
            }
            id v27 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            id v56 = v27;
            id v28 = v27;
            unint64_t v29 = "%@ initWithDNSSettingsPayload: failed to parse DNSSettings";
            id v30 = v26;
            uint32_t v31 = 12;
LABEL_49:
            _os_log_error_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);

LABEL_40:
            uint64_t v23 = ne_log_obj();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              id v47 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              id v56 = v47;
              id v48 = v47;
              _os_log_debug_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEBUG, "%@ initWithDNSSettingsPayload: failed", buf, 0xCu);
            }
            goto LABEL_42;
          }
          uint64_t v24 = [v17 objectForKeyedSubscript:@"PayloadCertificateUUID"];

          if (v24)
          {
            uint64_t v25 = [v17 objectForKeyedSubscript:@"PayloadCertificateUUID"];
            [v9 addCertificatePending:v25 certificateTag:@"_PayloadCertificateRef"];
          }
          else
          {
            uint64_t v33 = [v17 objectForKeyedSubscript:@"LocalCertificate"];

            if (!v33) {
              goto LABEL_31;
            }
            uint64_t v34 = [v21 dnsProtocol];
            if (v34 != 3 && v34 != 2) {
              goto LABEL_31;
            }
            id v35 = v21;
            uint64_t v25 = [v17 objectForKeyedSubscript:@"LocalCertificate"];
            id v54 = setLocalCertificate(v25);
            [v35 setIdentityReference:v54];
          }
LABEL_31:
          uint64_t v36 = [a1 initWithName:v8 grade:a4];
          if (!v36)
          {
            uint64_t v26 = ne_log_obj();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v51 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v56 = v51;
              __int16 v57 = 2112;
              id v58 = v8;
              id v52 = v51;
              _os_log_error_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_ERROR, "%@ initWithDNSSettingsPayload: initWithName failed for '%@'", buf, 0x16u);
            }
            a1 = 0;
            goto LABEL_40;
          }
          a1 = (id)v36;
          id v37 = objc_alloc_init(NEDNSSettingsBundle);
          [a1 setDnsSettings:v37];

          uint64_t v38 = [a1 dnsSettings];

          if (v38)
          {
            id v39 = [a1 dnsSettings];
            [v39 setSettings:v21];

            uint64_t v40 = +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)NEOnDemandRule, v10);
            id v41 = [a1 dnsSettings];
            [v41 setOnDemandRules:v40];

            id v42 = [a1 dnsSettings];
            [v42 setEnabled:1];

            id v43 = ne_log_obj();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              int v49 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              id v56 = v49;
              id v50 = v49;
              _os_log_debug_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_DEBUG, "%@ initWithDNSSettingsPayload: done", buf, 0xCu);
            }
            a1 = a1;
            id v20 = a1;
            goto LABEL_44;
          }
          uint64_t v26 = ne_log_obj();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            goto LABEL_40;
          }
          uint64_t v53 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v56 = v53;
          __int16 v57 = 2112;
          id v58 = v8;
          id v28 = v53;
          unint64_t v29 = "%@ initWithDNSSettingsPayload failed, could not create DNS Settings for config '%@'";
          id v30 = v26;
          uint32_t v31 = 22;
          goto LABEL_49;
        }
        __int16 v19 = off_1E598D0E0;
      }
    }
    else
    {
      __int16 v19 = off_1E598D118;
    }
    uint64_t v21 = [objc_alloc(*v19) initFromLegacyDictionary:v17];
    goto LABEL_19;
  }
  uint64_t v21 = ne_log_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v56 = v22;
    uint64_t v23 = v22;
    _os_log_error_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_ERROR, "%@ initWithDNSSettingsPayload: DNSSettings missing", buf, 0xCu);
LABEL_42:
  }
  id v20 = 0;
LABEL_44:

LABEL_45:
LABEL_46:

  return v20;
}

- (id)initWithRelayPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    id v74 = 0;
    goto LABEL_110;
  }
  id v9 = v7;
  id v10 = [v9 payloadAtom];
  int v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v139 = (id)objc_opt_class();
    id v78 = v139;
    _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithRelayPayload", buf, 0xCu);
  }
  if ((isa_nsdictionary(v10) & 1) == 0)
  {
    uint64_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v81 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v139 = v81;
      id v82 = v81;
      _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "%@ initWithRelayPayload failed, empty payload atom", buf, 0xCu);
    }
    id v74 = 0;
    goto LABEL_109;
  }
  uint64_t v12 = [v10 objectForKeyedSubscript:@"Relays"];
  if ((isa_nsarray(v12) & 1) == 0)
  {
    int v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_107:
      id v74 = 0;
      goto LABEL_108;
    }
    long long v75 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v139 = v75;
    id v76 = v75;
    uint64_t v77 = "%@ initWithRelayPayload failed, relays missing";
LABEL_102:
    _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, v77, buf, 0xCu);

    goto LABEL_107;
  }
  uint64_t v13 = [a1 initWithName:v8 grade:a4];
  if (!v13)
  {
    int v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v87 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v139 = v87;
      id v88 = v87;
      _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "%@ initWithRelayPayload failed, cannot initialize", buf, 0xCu);
    }
    a1 = 0;
    goto LABEL_107;
  }
  a1 = (void *)v13;
  int v14 = objc_alloc_init(NERelayConfiguration);
  [a1 setRelay:v14];

  uint64_t v15 = [a1 relay];

  if (!v15)
  {
    int v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_107;
    }
    SEL v89 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v139 = v89;
    id v76 = v89;
    uint64_t v77 = "%@ initWithRelayPayload failed, cannot create relay";
    goto LABEL_102;
  }
  id v95 = v8;
  id v96 = v7;
  int v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v98 = [v12 count];
  if (!v98)
  {
LABEL_72:
    id v55 = [a1 relay];
    [v55 setRelays:v16];

    id v56 = [v10 objectForKeyedSubscript:@"MatchDomains"];
    if (isa_nsarray(v56))
    {
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v57 = v56;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v112 objects:v133 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v113;
LABEL_75:
        uint64_t v61 = 0;
        while (1)
        {
          if (*(void *)v113 != v60) {
            objc_enumerationMutation(v57);
          }
          if (!isa_nsstring(*(void **)(*((void *)&v112 + 1) + 8 * v61))) {
            break;
          }
          if (v59 == ++v61)
          {
            uint64_t v59 = [v57 countByEnumeratingWithState:&v112 objects:v133 count:16];
            if (v59) {
              goto LABEL_75;
            }
            goto LABEL_81;
          }
        }
      }
      else
      {
LABEL_81:

        v62 = [a1 relay];
        [v62 setMatchDomains:v57];
        id v57 = v62;
      }
    }
    id v102 = v56;
    v103 = [v10 objectForKeyedSubscript:@"ExcludedDomains"];
    id v7 = v96;
    if (isa_nsarray(v103))
    {
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v63 = v103;
      uint64_t v64 = [v63 countByEnumeratingWithState:&v108 objects:v132 count:16];
      if (v64)
      {
        uint64_t v65 = v64;
        uint64_t v66 = *(void *)v109;
LABEL_86:
        uint64_t v67 = 0;
        while (1)
        {
          if (*(void *)v109 != v66) {
            objc_enumerationMutation(v63);
          }
          if (!isa_nsstring(*(void **)(*((void *)&v108 + 1) + 8 * v67))) {
            break;
          }
          if (v65 == ++v67)
          {
            uint64_t v65 = [v63 countByEnumeratingWithState:&v108 objects:v132 count:16];
            if (v65) {
              goto LABEL_86;
            }
            goto LABEL_92;
          }
        }
      }
      else
      {
LABEL_92:

        uint64_t v68 = [a1 relay];
        [v68 setExcludedDomains:v63];
        id v63 = v68;
      }
    }
    long long v69 = +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)NEOnDemandRule, v10);
    long long v70 = [a1 relay];
    [v70 setOnDemandRules:v69];

    long long v71 = [v10 objectForKeyedSubscript:@"Enabled"];
    if (isa_nsnumber(v71))
    {
      long long v72 = [v10 objectForKeyedSubscript:@"Enabled"];
      int v73 = [v72 BOOLValue];

      id v8 = v95;
      if (!v73) {
        goto LABEL_113;
      }
    }
    else
    {

      id v8 = v95;
    }
    id v80 = [a1 relay];
    [v80 setEnabled:1];

LABEL_113:
    id v74 = a1;
    goto LABEL_120;
  }
  uint64_t v17 = 0;
  uint64_t v93 = v12;
  uint64_t v94 = a1;
  uint64_t v92 = v16;
  while (1)
  {
    uint64_t v18 = [v12 objectAtIndexedSubscript:v17];
    id v102 = v18;
    if ((isa_nsdictionary(v18) & 1) == 0) {
      break;
    }
    uint64_t v104 = v17;
    __int16 v19 = [v18 objectForKeyedSubscript:@"HTTP3RelayURL"];
    id v106 = [v18 objectForKeyedSubscript:@"HTTP2RelayURL"];
    v103 = v19;
    if ((isa_nsstring(v19) & 1) == 0 && (isa_nsstring(v106) & 1) == 0)
    {
      uint64_t v86 = ne_log_obj();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        id v90 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v139 = v90;
        id v91 = v90;
        _os_log_error_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_ERROR, "%@ initWithRelayPayload failed, relay dictionary has no URL", buf, 0xCu);
      }
      goto LABEL_119;
    }
    __int16 v107 = objc_alloc_init(NERelay);
    if (isa_nsstring(v19))
    {
      id v20 = [MEMORY[0x1E4F1CB10] URLWithString:v19];
      [(NERelay *)v107 setHTTP3RelayURL:v20];
    }
    if (isa_nsstring(v106))
    {
      uint64_t v21 = [MEMORY[0x1E4F1CB10] URLWithString:v106];
      [(NERelay *)v107 setHTTP2RelayURL:v21];
    }
    uint64_t v22 = [v18 objectForKeyedSubscript:@"DNSOverHTTPSURL"];
    if (isa_nsstring(v22))
    {
      uint64_t v23 = [MEMORY[0x1E4F1CB10] URLWithString:v22];
      [(NERelay *)v107 setDnsOverHTTPSURL:v23];
    }
    uint64_t v24 = [v18 objectForKeyedSubscript:@"SyntheticDNSAnswerIPv4Prefix"];
    if (isa_nsstring(v24)) {
      [(NERelay *)v107 setSyntheticDNSAnswerIPv4Prefix:v24];
    }
    id v100 = v24;
    id v101 = v22;
    uint64_t v25 = [v18 objectForKeyedSubscript:@"SyntheticDNSAnswerIPv6Prefix"];
    if (isa_nsstring(v25)) {
      [(NERelay *)v107 setSyntheticDNSAnswerIPv6Prefix:v25];
    }
    int v99 = v25;
    id v105 = [v18 objectForKeyedSubscript:@"AdditionalHTTPHeaderFields"];
    if (isa_nsdictionary(v105))
    {
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      uint64_t v26 = [v105 allKeys];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v128 objects:v137 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v129;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v129 != v29) {
              objc_enumerationMutation(v26);
            }
            if (!isa_nsstring(*(void **)(*((void *)&v128 + 1) + 8 * i)))
            {
              int v31 = 0;
              goto LABEL_34;
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v128 objects:v137 count:16];
          if (v28) {
            continue;
          }
          break;
        }
      }
      int v31 = 1;
LABEL_34:

      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      id v32 = [v105 allValues];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v124 objects:v136 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v125;
        while (2)
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v125 != v35) {
              objc_enumerationMutation(v32);
            }
            if (!isa_nsstring(*(void **)(*((void *)&v124 + 1) + 8 * j)))
            {

              uint64_t v18 = v102;
              __int16 v19 = v103;
              goto LABEL_45;
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v124 objects:v136 count:16];
          __int16 v19 = v103;
          if (v34) {
            continue;
          }
          break;
        }
      }

      uint64_t v18 = v102;
      if (v31) {
        [(NERelay *)v107 setAdditionalHTTPHeaderFields:v105];
      }
    }
LABEL_45:
    [(NERelay *)v107 setIdentityReference:0];
    id v37 = [v18 objectForKeyedSubscript:@"PayloadCertificateUUID"];

    if (v37)
    {
      uint64_t v38 = [NSString stringWithFormat:@"%@%u", @"_PayloadCertificateRef", v104];
      id v39 = [v18 objectForKeyedSubscript:@"PayloadCertificateUUID"];
      [v9 addCertificatePending:v39 certificateTag:v38];

      id v40 = [v18 objectForKeyedSubscript:@"PayloadIntermediateCertificateUUIDs"];
      if (isa_nsarray(v40) && (unint64_t)[v40 count] <= 4)
      {
        id v97 = v38;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        id v40 = v40;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v120 objects:v135 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = 0;
          uint64_t v44 = *(void *)v121;
          do
          {
            for (uint64_t k = 0; k != v42; ++k)
            {
              if (*(void *)v121 != v44) {
                objc_enumerationMutation(v40);
              }
              id v46 = *(void **)(*((void *)&v120 + 1) + 8 * k);
              if (isa_nsstring(v46))
              {
                id v47 = [NSString stringWithFormat:@"%@%u-%u", @"_PayloadCertificateRef", v104, v43];
                [v9 addCertificatePending:v46 certificateTag:v47];
                uint64_t v43 = (v43 + 1);
              }
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v120 objects:v135 count:16];
          }
          while (v42);
        }

        uint64_t v12 = v93;
        a1 = v94;
        int v16 = v92;
        uint64_t v18 = v102;
        __int16 v19 = v103;
        uint64_t v38 = v97;
      }
      goto LABEL_60;
    }
    id v48 = [v18 objectForKeyedSubscript:@"LocalCertificate"];

    if (v48)
    {
      uint64_t v38 = [v18 objectForKeyedSubscript:@"LocalCertificate"];
      setLocalCertificate(v38);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      [(NERelay *)v107 setIdentityReference:v40];
LABEL_60:
    }
    int v49 = [v18 objectForKeyedSubscript:@"RawPublicKeys"];
    if (isa_nsarray(v49))
    {
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v50 = v49;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v116 objects:v134 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v117;
LABEL_64:
        uint64_t v54 = 0;
        while (1)
        {
          if (*(void *)v117 != v53) {
            objc_enumerationMutation(v50);
          }
          if (!isa_nsdata(*(void **)(*((void *)&v116 + 1) + 8 * v54))) {
            break;
          }
          if (v52 == ++v54)
          {
            uint64_t v52 = [v50 countByEnumeratingWithState:&v116 objects:v134 count:16];
            if (v52) {
              goto LABEL_64;
            }
            break;
          }
        }
      }

      [(NERelay *)v107 setRawPublicKeys:v50];
      uint64_t v18 = v102;
      __int16 v19 = v103;
    }
    [v16 addObject:v107];

    uint64_t v17 = v104 + 1;
    if (v104 + 1 == v98) {
      goto LABEL_72;
    }
  }
  uint64_t v83 = ne_log_obj();
  v103 = v83;
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
  {
    id v84 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v139 = v84;
    id v85 = v84;
    _os_log_error_impl(&dword_19DDAF000, v83, OS_LOG_TYPE_ERROR, "%@ initWithRelayPayload failed, relay is not dictionary", buf, 0xCu);
  }
LABEL_119:
  id v74 = 0;
  id v7 = v96;
  id v8 = v95;
LABEL_120:

LABEL_108:
LABEL_109:

LABEL_110:
  return v74;
}

- (BOOL)isSupportedBySC
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    v2 = [a1 VPN];
    if (v2)
    {
      id v3 = [(id)v1 VPN];
      id v4 = [v3 protocol];
      if (v4)
      {
        id v5 = [(id)v1 VPN];
        id v6 = [v5 protocol];
        if ([v6 type] == 5)
        {
          BOOL v1 = 0;
        }
        else
        {
          id v7 = [(id)v1 VPN];
          BOOL v1 = [v7 tunnelType] != 2 && objc_msgSend((id)v1, "grade") != 2;
        }
      }
      else
      {
        BOOL v1 = 0;
      }
    }
    else
    {
      BOOL v1 = 0;
    }
  }
  return v1;
}

- (uint64_t)applyChangesToSCServiceInPreferences:(void *)a1
{
  uint64_t v2 = (uint64_t)a1;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return v2;
  }
  if (!-[NEConfiguration isSupportedBySC](a1)) {
    return 1;
  }
  id v4 = [(id)v2 pluginType];
  if (v4)
  {
    id v5 = [(id)v2 identifier];
    id v6 = SCNetworkServiceCopy(a2, (CFStringRef)[v5 UUIDString]);

    if (v6)
    {
      Interface = SCNetworkServiceGetInterface(v6);
      if (Interface)
      {
        id v8 = Interface;
        CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
        if (CFEqual(InterfaceType, (CFStringRef)*MEMORY[0x1E4F41B78]))
        {
          uint64_t v26 = SCNetworkInterfaceGetInterface(v8);
          if (v26)
          {
            CFStringRef v27 = SCNetworkInterfaceGetInterfaceType(v26);
            if (v27)
            {
              if (CFStringCompare(v27, v4, 0) && !SCNetworkServiceRemove(v6))
              {
                uint64_t v28 = ne_log_obj();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  CFErrorRef Error = SCCopyLastError();
                  int v75 = 138412546;
                  id v76 = v6;
                  __int16 v77 = 2112;
                  id v78 = Error;
                  _os_log_error_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_ERROR, "Failed to remove SCNetworkService %@: %@", (uint8_t *)&v75, 0x16u);
                }
              }
            }
          }
        }
      }
      CFRelease(v6);
    }
  }
  id v10 = [(id)v2 identifier];
  int v11 = SCNetworkServiceCopy(a2, (CFStringRef)[v10 UUIDString]);

  if (v11)
  {
    CFStringRef Name = SCNetworkServiceGetName(v11);
    uint64_t v13 = [(id)v2 name];

    if (Name && v13 && !CFStringHasPrefix(Name, v13))
    {
      for (CFStringRef i = [(id)v2 name];
      {
        if (SCNetworkServiceSetName(v11, i))
        {
          CFStringRef v33 = i;
          goto LABEL_36;
        }
        if (SCError() != 1005) {
          break;
        }
        CFStringRef v15 = copyNextName(i);
        CFRelease(i);
      }
      uint64_t v53 = ne_log_obj();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        long long v71 = [(id)v2 name];
        int v72 = SCError();
        int v73 = SCErrorString(v72);
        int v75 = 138412546;
        id v76 = v71;
        __int16 v77 = 2080;
        id v78 = (void *)v73;
        _os_log_error_impl(&dword_19DDAF000, v53, OS_LOG_TYPE_ERROR, "Failed to set the serve name for configuration \"%@\": %s", (uint8_t *)&v75, 0x16u);
      }
      CFRelease(i);
      goto LABEL_85;
    }
  }
  else
  {
    int v16 = [(id)v2 VPN];
    uint64_t v17 = [v16 protocol];
    uint64_t v18 = (const __SCNetworkInterface *)[v17 createInterface];

    if (!v18)
    {
      uint64_t v25 = ne_log_obj();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        long long v70 = [(id)v2 name];
        int v75 = 138412290;
        id v76 = v70;
        _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, "Failed to create interface for configuration \"%@\"", (uint8_t *)&v75, 0xCu);
      }
      int v11 = 0;
      goto LABEL_84;
    }
    int v11 = SCNetworkServiceCreate(a2, v18);
    CFRelease(v18);
    __int16 v19 = [(id)v2 identifier];
    [v19 UUIDString];
    int v20 = _SCNetworkServiceSetServiceID();

    if (!v20)
    {
      uint64_t v25 = ne_log_obj();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_84:

LABEL_85:
        uint64_t v2 = 0;
        goto LABEL_86;
      }
      uint64_t v29 = [(id)v2 name];
      int v30 = SCError();
      int v31 = SCErrorString(v30);
      int v75 = 138412546;
      id v76 = v29;
      __int16 v77 = 2080;
      id v78 = (void *)v31;
      id v32 = "Failed to re-set the service ID for configuration \"%@\": %s";
LABEL_78:
      _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v75, 0x16u);

      goto LABEL_84;
    }
    uint64_t v21 = [(id)v2 name];
    int v22 = SCNetworkServiceSetName(v11, v21);

    if (!v22)
    {
      uint64_t v25 = ne_log_obj();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_84;
      }
      uint64_t v29 = [(id)v2 name];
      int v54 = SCError();
      id v55 = SCErrorString(v54);
      int v75 = 138412546;
      id v76 = v29;
      __int16 v77 = 2080;
      id v78 = (void *)v55;
      id v32 = "Failed to set the service name for configuration \"%@\": %s";
      goto LABEL_78;
    }
    if (!SCNetworkServiceEstablishDefaultConfiguration(v11))
    {
      uint64_t v25 = ne_log_obj();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_84;
      }
      uint64_t v29 = [(id)v2 name];
      int v58 = SCError();
      uint64_t v59 = SCErrorString(v58);
      int v75 = 138412546;
      id v76 = v29;
      __int16 v77 = 2080;
      id v78 = (void *)v59;
      id v32 = "Failed to set up default service configuration for configuration \"%@\": %s";
      goto LABEL_78;
    }
    CFStringRef v23 = SCNetworkServiceGetName(v11);
    if (v23) {
      CFStringRef v24 = (const __CFString *)CFRetain(v23);
    }
    else {
      CFStringRef v24 = 0;
    }
    SCNetworkSetRef v60 = SCNetworkSetCopyCurrent(a2);
    if (!v60)
    {
LABEL_74:
      if (v24) {
        CFRelease(v24);
      }
      uint64_t v25 = ne_log_obj();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_84;
      }
      uint64_t v29 = [(id)v2 name];
      int v64 = SCError();
      uint64_t v65 = SCErrorString(v64);
      int v75 = 138412546;
      id v76 = v29;
      __int16 v77 = 2080;
      id v78 = (void *)v65;
      id v32 = "Failed to add the network service for configuration \"%@\" to the current network set: %s";
      goto LABEL_78;
    }
    SCNetworkSetRef v61 = v60;
    while (!SCNetworkSetAddService(v61, v11))
    {
      if (SCError() != 1005)
      {
        CFStringRef v62 = v24;
LABEL_73:
        CFRelease(v61);
        CFStringRef v24 = v62;
        goto LABEL_74;
      }
      CFStringRef v62 = copyNextName(v24);
      int v63 = SCNetworkServiceSetName(v11, v62);
      CFRelease(v24);
      CFStringRef v24 = v62;
      if (!v63) {
        goto LABEL_73;
      }
    }
    CFRelease(v61);
    if (v24)
    {
      CFStringRef v33 = v24;
LABEL_36:
      CFRelease(v33);
    }
  }
  uint64_t v34 = [(id)v2 VPN];
  int v35 = SCNetworkServiceSetEnabled(v11, [v34 isEnabled]);

  if (!v35)
  {
    uint64_t v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_84;
    }
    uint64_t v29 = [(id)v2 name];
    int v45 = SCError();
    id v46 = SCErrorString(v45);
    int v75 = 138412546;
    id v76 = v29;
    __int16 v77 = 2080;
    id v78 = (void *)v46;
    id v32 = "SCNetworkServiceSetEnabled failed for configuration \"%@\": %s";
    goto LABEL_78;
  }
  SCNetworkInterfaceRef v36 = SCNetworkServiceGetInterface(v11);
  if (!v36)
  {
    uint64_t v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_84;
    }
    uint64_t v29 = [(id)v2 name];
    int v47 = SCError();
    id v48 = SCErrorString(v47);
    int v75 = 138412546;
    id v76 = v29;
    __int16 v77 = 2080;
    id v78 = (void *)v48;
    id v32 = "SCNetworkInterface for configuration \"%@\" is NULL: %s";
    goto LABEL_78;
  }
  id v37 = v36;
  uint64_t v38 = [(id)v2 VPN];
  uint64_t v25 = [v38 copyLegacyDictionary];

  if (!v25)
  {
    uint64_t v44 = ne_log_obj();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      int v49 = [(id)v2 name];
      int v75 = 138412290;
      id v76 = v49;
      id v50 = "Failed to create a legacy dictionary for configuration \"%@\"";
      uint64_t v51 = v44;
      uint32_t v52 = 12;
LABEL_60:
      _os_log_error_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_ERROR, v50, (uint8_t *)&v75, v52);
    }
LABEL_83:

    goto LABEL_84;
  }
  if (!SCNetworkInterfaceSetConfiguration(v37, (CFDictionaryRef)v25))
  {
    uint64_t v44 = ne_log_obj();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      int v49 = [(id)v2 name];
      int v56 = SCError();
      id v57 = SCErrorString(v56);
      int v75 = 138412546;
      id v76 = v49;
      __int16 v77 = 2080;
      id v78 = (void *)v57;
      id v50 = "Failed to set the interface configuration for configuration \"%@\": %s";
      uint64_t v51 = v44;
      uint32_t v52 = 22;
      goto LABEL_60;
    }
    goto LABEL_83;
  }
  id v39 = [(id)v2 VPN];
  id v40 = [v39 protocol];
  int v41 = [v40 setServiceProtocolsInService:v11];

  if (!v41) {
    goto LABEL_84;
  }
  uint64_t v42 = [(id)v2 payloadInfo];

  if (v42)
  {
    uint64_t v43 = [(id)v2 payloadInfo];
    uint64_t v44 = [v43 copyLegacyDictionary];

    if (v44)
    {
      if (+[NEConfiguration setConfiguration:forProtocol:inService:]((uint64_t)NEConfiguration, (const __CFDictionary *)v44, @"com.apple.payload", v11))
      {

        goto LABEL_46;
      }
      uint64_t v66 = ne_log_obj();
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        goto LABEL_82;
      }
      uint64_t v67 = [(id)v2 name];
      int v75 = 138412290;
      id v76 = v67;
      uint64_t v68 = "Failed to set the profile payload info for configuration \"%@\"";
    }
    else
    {
      uint64_t v66 = ne_log_obj();
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
LABEL_82:

        goto LABEL_83;
      }
      uint64_t v67 = [(id)v2 name];
      int v75 = 138412290;
      id v76 = v67;
      uint64_t v68 = "Failed to create a legacy profile payload dictionary for configuration \"%@\"";
    }
    _os_log_error_impl(&dword_19DDAF000, v66, OS_LOG_TYPE_ERROR, v68, (uint8_t *)&v75, 0xCu);

    goto LABEL_82;
  }
LABEL_46:

  uint64_t v2 = 1;
LABEL_86:
  if (v11) {
    CFRelease(v11);
  }

  return v2;
}

+ (uint64_t)setConfiguration:(const __CFString *)a3 forProtocol:(const __SCNetworkService *)a4 inService:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  self;
  SCNetworkProtocolRef v7 = SCNetworkServiceCopyProtocol(a4, a3);
  SCNetworkProtocolRef v8 = v7;
  if (a2 && !v7)
  {
    if (!SCNetworkServiceAddProtocolType(a4, a3))
    {
      id v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = SCError();
        int v17 = 138412546;
        CFStringRef v18 = a3;
        __int16 v19 = 2080;
        int v20 = SCErrorString(v15);
        _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "SCNetworkServiceAddProtocolType(%@) failed: %s", (uint8_t *)&v17, 0x16u);
      }

      return 0;
    }
    SCNetworkProtocolRef v8 = SCNetworkServiceCopyProtocol(a4, a3);
  }
  if (v8)
  {
    if (a2 && !SCNetworkProtocolSetConfiguration(v8, a2))
    {
      int v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v16 = SCError();
        int v17 = 138412546;
        CFStringRef v18 = a3;
        __int16 v19 = 2080;
        int v20 = SCErrorString(v16);
        uint64_t v13 = "SCNetworkProtocolSetConfiguration(%@) failed: %s";
        goto LABEL_21;
      }
    }
    else
    {
      if (SCNetworkProtocolSetEnabled(v8, a2 != 0))
      {
        uint64_t v9 = 1;
LABEL_18:
        CFRelease(v8);
        return v9;
      }
      int v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = SCError();
        int v17 = 138412546;
        CFStringRef v18 = a3;
        __int16 v19 = 2080;
        int v20 = SCErrorString(v12);
        uint64_t v13 = "SCNetworkProtocolSetEnabled(%@) failed: %s";
LABEL_21:
        _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, 0x16u);
      }
    }

    uint64_t v9 = 0;
    goto LABEL_18;
  }
  return 1;
}

- (uint64_t)updateFromSCService:(void *)a1
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  Interface = SCNetworkServiceGetInterface(service);
  id v5 = (void *)[[NSString alloc] initWithString:SCNetworkServiceGetName(service)];
  [a1 setName:v5];

  if (Interface)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:SCNetworkInterfaceGetConfiguration(Interface)];
    CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
    SCNetworkProtocolRef v8 = (void *)SCNetworkServiceCopyExternalID();
    uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F41F10]];
    if (isa_nsarray(v9))
    {
      int v10 = 1;
    }
    else
    {
      int v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F41FA8]];
      int v13 = isa_nsnumber(v12);
      if (v8) {
        int v10 = 1;
      }
      else {
        int v10 = v13;
      }
    }
    [a1 setExternalIdentifier:v8];

    if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x1E4F41B60], 0))
    {
      if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x1E4F41B70], 0))
      {
        if (CFEqual(InterfaceType, (CFStringRef)*MEMORY[0x1E4F41B78]))
        {
          int v14 = SCNetworkInterfaceGetInterface(Interface);
          if (v14)
          {
            CFStringRef v15 = SCNetworkInterfaceGetInterfaceType(v14);
            if (v15)
            {
              int v16 = (void *)[[NSString alloc] initWithString:v15];
              [v6 setObject:v16 forKeyedSubscript:@"__NEVPNPluginType"];

              uint64_t v17 = 4;
              goto LABEL_16;
            }
          }
        }
LABEL_37:
        uint64_t v11 = 0;
LABEL_63:

        return v11;
      }
      uint64_t v66 = SCNetworkInterfaceGetInterface(Interface);
      if (!v66) {
        goto LABEL_37;
      }
      CFStringRef v67 = SCNetworkInterfaceGetInterfaceType(v66);
      if (CFStringCompare(v67, (CFStringRef)*MEMORY[0x1E4F41B68], 0)) {
        goto LABEL_37;
      }
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v17 = 1;
    }
LABEL_16:
    CFStringRef v18 = [NSNumber numberWithInteger:v17];
    [v6 setObject:v18 forKeyedSubscript:@"__NEVPNProtocolType"];

    int Enabled = SCNetworkServiceGetEnabled(service);
    if (v10)
    {
      int v20 = [a1 appVPN];
      uint64_t v21 = [v20 protocol];
      if (v21)
      {
        int v22 = (void *)v21;
        CFStringRef v23 = [a1 appVPN];
        CFStringRef v24 = [v23 protocol];
        uint64_t v25 = [v24 identifier];

        if (!v25)
        {
LABEL_21:
          uint64_t v28 = [a1 appVPN];
          uint64_t v29 = [v28 protocol];
          int v30 = [v29 passwordKeychainItem];

          if (v30)
          {
            int v31 = NSNumber;
            id v32 = [a1 appVPN];
            CFStringRef v33 = [v32 protocol];
            uint64_t v34 = [v33 passwordKeychainItem];
            int v35 = objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v34, "domain"));
            [v6 setObject:v35 forKeyedSubscript:@"__NEVPNKeychainDomain"];
          }
          SCNetworkInterfaceRef v36 = [a1 appVPN];
          uint64_t v37 = [v36 isDisconnectOnDemandEnabled];

          id v38 = [[NEVPNApp alloc] initFromLegacyDictionary:v6];
          [a1 setAppVPN:v38];

          id v39 = [a1 appVPN];

          if (v39)
          {
            id v40 = [a1 appVPN];
            [v40 setEnabled:Enabled != 0];

            int v41 = [a1 appVPN];
            goto LABEL_33;
          }
          __int16 v77 = ne_log_obj();
          if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
            goto LABEL_61;
          }
          int v85 = 138412290;
          CFStringRef Name = (void *)SCNetworkServiceGetName(service);
          id v78 = "Failed to initialize an NEVPNApp object from service %@";
          goto LABEL_60;
        }
        int v20 = [a1 appVPN];
        uint64_t v26 = [v20 protocol];
        CFStringRef v27 = [v26 identifier];
        [v6 setObject:v27 forKeyedSubscript:@"__NEVPNProtocolIdentifier"];
      }
      goto LABEL_21;
    }
    uint64_t v42 = [a1 VPN];
    uint64_t v43 = [v42 protocol];
    if (v43)
    {
      uint64_t v44 = (void *)v43;
      int v45 = [a1 VPN];
      id v46 = [v45 protocol];
      int v47 = [v46 identifier];

      if (!v47)
      {
LABEL_29:
        id v50 = [a1 VPN];
        uint64_t v51 = [v50 protocol];
        uint32_t v52 = [v51 passwordKeychainItem];

        if (v52)
        {
          uint64_t v53 = NSNumber;
          int v54 = [a1 VPN];
          id v55 = [v54 protocol];
          int v56 = [v55 passwordKeychainItem];
          id v57 = objc_msgSend(v53, "numberWithInteger:", objc_msgSend(v56, "domain"));
          [v6 setObject:v57 forKeyedSubscript:@"__NEVPNKeychainDomain"];
        }
        int v58 = [a1 VPN];
        uint64_t v37 = [v58 isDisconnectOnDemandEnabled];

        id v59 = [[NEVPN alloc] initFromLegacyDictionary:v6];
        [a1 setVPN:v59];

        SCNetworkSetRef v60 = [a1 VPN];

        if (v60)
        {
          SCNetworkSetRef v61 = [a1 VPN];
          [v61 setEnabled:Enabled != 0];

          int v41 = [a1 VPN];
LABEL_33:
          CFStringRef v62 = v41;
          [v41 setDisconnectOnDemandEnabled:v37];

          int v63 = [a1 VPN];
          int v64 = [v63 protocol];

          if (v64)
          {
            uint64_t v65 = [a1 VPN];
            goto LABEL_40;
          }
          uint64_t v68 = [a1 appVPN];
          long long v69 = [v68 protocol];

          if (v69)
          {
            uint64_t v65 = [a1 appVPN];
LABEL_40:
            long long v70 = v65;
            long long v71 = [v65 protocol];
            [v71 updateWithServiceProtocolsFromService:service];

            SCPreferencesRef v72 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"NE migrate passwords", 0, 0);
            if (!v72)
            {
              id v76 = ne_log_obj();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
              {
                int v84 = SCError();
                int v85 = 136315138;
                CFStringRef Name = (void *)SCErrorString(v84);
                _os_log_error_impl(&dword_19DDAF000, v76, OS_LOG_TYPE_ERROR, "Failed to create a SCPreferencesRef for migrating passwords: %s", (uint8_t *)&v85, 0xCu);
              }

              goto LABEL_54;
            }
            SCPreferencesRef v73 = v72;
            id v74 = [a1 VPN];

            if (v74)
            {
              int v75 = [a1 VPN];
            }
            else
            {
              uint64_t v79 = [a1 appVPN];

              if (!v79)
              {
LABEL_53:
                CFRelease(v73);
LABEL_54:
                __int16 v77 = +[NEConfiguration copyConfigurationForProtocol:inService:]((uint64_t)NEConfiguration, @"com.apple.payload", service);
                if (v77)
                {
                  id v82 = [[NEProfileIngestionPayloadInfo alloc] initFromLegacyDictionary:v77];
                  [a1 setPayloadInfo:v82];
                }
                uint64_t v11 = 1;
                goto LABEL_62;
              }
              int v75 = [a1 appVPN];
            }
            id v80 = v75;
            uint64_t v81 = [v75 protocol];
            [v81 migratePasswordsFromPreferences:v73];

            goto LABEL_53;
          }
          __int16 v77 = ne_log_obj();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            int v85 = 138412290;
            CFStringRef Name = (void *)SCNetworkServiceGetName(service);
            id v78 = "Failed to initialize the NEVPNProtocol from service %@";
            goto LABEL_60;
          }
LABEL_61:
          uint64_t v11 = 0;
LABEL_62:

          goto LABEL_63;
        }
        __int16 v77 = ne_log_obj();
        if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          goto LABEL_61;
        }
        int v85 = 138412290;
        CFStringRef Name = (void *)SCNetworkServiceGetName(service);
        id v78 = "Failed to initialize an NEVPN object from service %@";
LABEL_60:
        _os_log_error_impl(&dword_19DDAF000, v77, OS_LOG_TYPE_ERROR, v78, (uint8_t *)&v85, 0xCu);
        goto LABEL_61;
      }
      uint64_t v42 = [a1 VPN];
      id v48 = [v42 protocol];
      int v49 = [v48 identifier];
      [v6 setObject:v49 forKeyedSubscript:@"__NEVPNProtocolIdentifier"];
    }
    goto LABEL_29;
  }
  return 1;
}

+ (CFDictionaryRef)copyConfigurationForProtocol:(const __SCNetworkService *)a3 inService:
{
  self;
  id v5 = SCNetworkServiceCopyProtocol(a3, a2);
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  CFDictionaryRef Configuration = SCNetworkProtocolGetConfiguration(v5);
  CFDictionaryRef v8 = Configuration;
  if (Configuration) {
    CFRetain(Configuration);
  }
  CFRelease(v6);
  return v8;
}

@end