@interface MCDNSProxyPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCDNSProxyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSDictionary)configurationDictionary;
- (NSDictionary)providerConfiguration;
- (NSString)appBundleIdentifier;
- (NSString)dnsProxyUUID;
- (NSString)providerBundleIdentifier;
- (id)installationWarnings;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Label;
- (id)subtitle2Label;
- (id)verboseDescription;
@end

@implementation MCDNSProxyPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.dnsProxy.managed";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedString(@"DNS_PROXY_SINGULAR");
}

+ (id)localizedPluralForm
{
  return MCLocalizedString(@"DNS_PROXY_PLURAL");
}

- (MCDNSProxyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v37.receiver = self;
  v37.super_class = (Class)MCDNSProxyPayload;
  v9 = [(MCPayload *)&v37 initWithDictionary:v8 profile:a4 outError:a5];
  if (v9)
  {
    id v36 = 0;
    uint64_t v10 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"AppBundleIdentifier" isRequired:1 outError:&v36];
    id v11 = v36;
    appBundleIdentifier = v9->_appBundleIdentifier;
    v9->_appBundleIdentifier = (NSString *)v10;

    if (v9->_appBundleIdentifier)
    {
      id v35 = v11;
      uint64_t v13 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProviderBundleIdentifier" isRequired:0 outError:&v35];
      id v14 = v35;

      providerBundleIdentifier = v9->_providerBundleIdentifier;
      v9->_providerBundleIdentifier = (NSString *)v13;

      if (v9->_providerBundleIdentifier) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = v14 == 0;
      }
      if (v16)
      {
        id v34 = v14;
        uint64_t v17 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ProviderConfiguration" isRequired:0 outError:&v34];
        id v11 = v34;

        providerConfiguration = v9->_providerConfiguration;
        v9->_providerConfiguration = (NSDictionary *)v17;

        if (v9->_providerBundleIdentifier || !v11)
        {
          id v33 = v11;
          uint64_t v19 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"DNSProxyUUID" isRequired:0 outError:&v33];
          id v20 = v33;

          dnsProxyUUID = v9->_dnsProxyUUID;
          v9->_dnsProxyUUID = (NSString *)v19;

          id v11 = v20;
        }
      }
      else
      {
        id v11 = v14;
      }
    }
    if ([v8 count])
    {
      v22 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        v24 = [(MCPayload *)v9 friendlyName];
        *(_DWORD *)buf = 138543618;
        v39 = v24;
        __int16 v40 = 2114;
        id v41 = v8;
        _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
      }
    }
    if (v11)
    {
      v25 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
      v26 = v25;
      if (a5) {
        *a5 = v25;
      }
      v27 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v28 = v27;
        v29 = objc_opt_class();
        id v30 = v29;
        v31 = [v26 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v39 = v29;
        __int16 v40 = 2114;
        id v41 = v31;
        _os_log_impl(&dword_1A13F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      v9 = 0;
    }
  }
  return v9;
}

- (id)stubDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)MCDNSProxyPayload;
  v3 = [(MCPayload *)&v8 stubDictionary];
  v4 = [(MCDNSProxyPayload *)self appBundleIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"AppBundleIdentifier"];

  v5 = [(MCDNSProxyPayload *)self providerBundleIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"ProviderBundleIdentifier"];

  v6 = [(MCDNSProxyPayload *)self dnsProxyUUID];
  [v3 setObject:v6 forKeyedSubscript:@"DNSProxyUUID"];

  return v3;
}

- (NSDictionary)configurationDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  v4 = [(MCPayload *)self displayName];
  [v3 setObject:v4 forKeyedSubscript:@"PayloadDisplayName"];

  v5 = [(MCDNSProxyPayload *)self appBundleIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"AppBundleIdentifier"];

  v6 = [(MCDNSProxyPayload *)self providerBundleIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"ProviderBundleIdentifier"];

  v7 = [(MCDNSProxyPayload *)self providerConfiguration];
  [v3 setObject:v7 forKeyedSubscript:@"ProviderConfiguration"];

  return (NSDictionary *)v3;
}

- (id)verboseDescription
{
  v13.receiver = self;
  v13.super_class = (Class)MCDNSProxyPayload;
  v3 = [(MCPayload *)&v13 verboseDescription];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(MCDNSProxyPayload *)self appBundleIdentifier];
  [v4 appendFormat:@"App: %@\n", v5];

  v6 = [(MCDNSProxyPayload *)self providerBundleIdentifier];

  if (v6)
  {
    v7 = [(MCDNSProxyPayload *)self providerBundleIdentifier];
    [v4 appendFormat:@"App's provider: %@\n", v7];
  }
  objc_super v8 = [(MCDNSProxyPayload *)self providerConfiguration];

  if (v8)
  {
    v9 = [(MCDNSProxyPayload *)self providerConfiguration];
    [v4 appendFormat:@"Provider's configuration: %@\n", v9];
  }
  uint64_t v10 = [(MCDNSProxyPayload *)self dnsProxyUUID];

  if (v10)
  {
    id v11 = [(MCDNSProxyPayload *)self dnsProxyUUID];
    [v4 appendFormat:@"DNSProxyUUID            : %@\n", v11];
  }
  return v4;
}

- (id)subtitle1Label
{
  return MCLocalizedFormat(@"DNS_PROXY_APP_COLON", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)subtitle2Label
{
  uint64_t v9 = [(MCDNSProxyPayload *)self subtitle2Description];
  if (v9)
  {
    uint64_t v10 = MCLocalizedFormat(@"DNS_PROXY_PROVIDER_BUNDLE_COLON", v2, v3, v4, v5, v6, v7, v8, v12);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)payloadDescriptionKeyValueSections
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v4 = [MCKeyValue alloc];
  uint64_t v5 = [(MCDNSProxyPayload *)self appBundleIdentifier];
  uint64_t v6 = MCLocalizedString(@"DNS_PROXY_APP");
  uint64_t v7 = [(MCKeyValue *)v4 initWithLocalizedString:v5 localizedKey:v6];
  [v3 addObject:v7];

  uint64_t v8 = [(MCDNSProxyPayload *)self providerBundleIdentifier];

  if (v8)
  {
    uint64_t v9 = [MCKeyValue alloc];
    uint64_t v10 = [(MCDNSProxyPayload *)self providerBundleIdentifier];
    id v11 = MCLocalizedString(@"DNS_PROXY_PROVIDER_BUNDLE");
    uint64_t v12 = [(MCKeyValue *)v9 initWithLocalizedString:v10 localizedKey:v11];
    [v3 addObject:v12];
  }
  objc_super v13 = [(MCDNSProxyPayload *)self dnsProxyUUID];

  if (v13)
  {
    id v14 = [MCKeyValue alloc];
    v15 = [(MCDNSProxyPayload *)self dnsProxyUUID];
    BOOL v16 = MCLocalizedString(@"DNS_PROXY_UUID");
    uint64_t v17 = [(MCKeyValue *)v14 initWithLocalizedString:v15 localizedKey:v16];
    [v3 addObject:v17];
  }
  v18 = +[MCKeyValueSection sectionWithKeyValues:v3];
  v21[0] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

  return v19;
}

- (id)installationWarnings
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MCLocalizedString(@"INSTALL_WARNING_DNS_PROXY_TITLE");
  uint64_t v3 = MCLocalizedStringByDevice(@"INSTALL_WARNING_DNS_PROXY");
  uint64_t v4 = +[MCProfileWarning warningWithLocalizedTitle:v2 localizedBody:v3 isLongForm:1];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSString)providerBundleIdentifier
{
  return self->_providerBundleIdentifier;
}

- (NSDictionary)providerConfiguration
{
  return self->_providerConfiguration;
}

- (NSString)dnsProxyUUID
{
  return self->_dnsProxyUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsProxyUUID, 0);
  objc_storeStrong((id *)&self->_providerConfiguration, 0);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end