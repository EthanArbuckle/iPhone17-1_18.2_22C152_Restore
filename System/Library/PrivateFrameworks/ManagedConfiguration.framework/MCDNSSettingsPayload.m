@interface MCDNSSettingsPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCDNSSettingsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)onDemandRules;
- (NSDictionary)configurationDictionary;
- (NSDictionary)dnsSettings;
- (NSNumber)prohibitDisablement;
- (id)installationWarnings;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)verboseDescription;
@end

@implementation MCDNSSettingsPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.dnsSettings.managed";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedString(@"DNS_SETTINGS_SINGULAR");
}

+ (id)localizedPluralForm
{
  return MCLocalizedString(@"DNS_SETTINGS_PLURAL");
}

- (MCDNSSettingsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MCDNSSettingsPayload;
  v9 = [(MCPayload *)&v34 initWithDictionary:v8 profile:a4 outError:a5];
  if (!v9) {
    goto LABEL_21;
  }
  id v33 = 0;
  uint64_t v10 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"DNSSettings" isRequired:1 outError:&v33];
  id v11 = v33;
  dnsSettings = v9->_dnsSettings;
  v9->_dnsSettings = (NSDictionary *)v10;

  if (!v11)
  {
    id v32 = 0;
    uint64_t v13 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"OnDemandRules" isRequired:0 outError:&v32];
    id v11 = v32;
    onDemandRules = v9->_onDemandRules;
    v9->_onDemandRules = (NSArray *)v13;

    if (!v11)
    {
      id v31 = 0;
      uint64_t v15 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ProhibitDisablement" isRequired:0 outError:&v31];
      id v11 = v31;
      prohibitDisablement = v9->_prohibitDisablement;
      v9->_prohibitDisablement = (NSNumber *)v15;

      if (!v11)
      {
        v17 = [(MCPayload *)v9 profile];
        if (([v17 isStub] & 1) != 0 || !-[NSNumber BOOLValue](v9->_prohibitDisablement, "BOOLValue"))
        {
        }
        else
        {
          v18 = [MEMORY[0x1E4F73168] sharedConfiguration];
          char v19 = [v18 isSupervised];

          if ((v19 & 1) == 0)
          {
            id v11 = +[MCPayload badFieldValueErrorWithField:@"ProhibitDisablement"];
            goto LABEL_11;
          }
        }
        id v11 = 0;
      }
    }
  }
LABEL_11:
  if ([v8 count])
  {
    v20 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v21 = v20;
      v22 = [(MCPayload *)v9 friendlyName];
      *(_DWORD *)buf = 138543618;
      v36 = v22;
      __int16 v37 = 2114;
      id v38 = v8;
      _os_log_impl(&dword_1A13F0000, v21, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }
  if (v11)
  {
    v23 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
    v24 = v23;
    if (a5) {
      *a5 = v23;
    }
    v25 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      v27 = objc_opt_class();
      id v28 = v27;
      v29 = [v24 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      __int16 v37 = 2114;
      id v38 = v29;
      _os_log_impl(&dword_1A13F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v9 = 0;
  }

LABEL_21:
  return v9;
}

- (id)stubDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)MCDNSSettingsPayload;
  v3 = [(MCPayload *)&v8 stubDictionary];
  v4 = [(MCDNSSettingsPayload *)self dnsSettings];
  [v3 setObject:v4 forKeyedSubscript:@"DNSSettings"];

  v5 = [(MCDNSSettingsPayload *)self onDemandRules];
  [v3 setObject:v5 forKeyedSubscript:@"OnDemandRules"];

  v6 = [(MCDNSSettingsPayload *)self prohibitDisablement];
  [v3 setObject:v6 forKeyedSubscript:@"ProhibitDisablement"];

  return v3;
}

- (NSDictionary)configurationDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  v4 = [(MCPayload *)self displayName];
  [v3 setObject:v4 forKeyedSubscript:@"PayloadDisplayName"];

  v5 = [(MCDNSSettingsPayload *)self dnsSettings];
  [v3 setObject:v5 forKeyedSubscript:@"DNSSettings"];

  v6 = [(MCDNSSettingsPayload *)self onDemandRules];
  [v3 setObject:v6 forKeyedSubscript:@"OnDemandRules"];

  v7 = [(MCDNSSettingsPayload *)self prohibitDisablement];
  [v3 setObject:v7 forKeyedSubscript:@"ProhibitDisablement"];

  return (NSDictionary *)v3;
}

- (id)verboseDescription
{
  v11.receiver = self;
  v11.super_class = (Class)MCDNSSettingsPayload;
  v3 = [(MCPayload *)&v11 verboseDescription];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(MCDNSSettingsPayload *)self dnsSettings];
  [v4 appendFormat:@"DNS Settings: %@\n", v5];

  v6 = [(MCDNSSettingsPayload *)self onDemandRules];

  if (v6)
  {
    v7 = [(MCDNSSettingsPayload *)self onDemandRules];
    [v4 appendFormat:@"On Demand Rules: %@\n", v7];
  }
  objc_super v8 = [(MCDNSSettingsPayload *)self prohibitDisablement];

  if (v8)
  {
    v9 = [(MCDNSSettingsPayload *)self prohibitDisablement];
    [v4 appendFormat:@"Prohibit Disablement: %@\n", v9];
  }
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(MCDNSSettingsPayload *)self dnsSettings];
  v5 = [v4 objectForKeyedSubscript:@"ServerName"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [MCKeyValue alloc];
    v7 = MCLocalizedString(@"DNS_SETTINGS_SERVER_NAME");
    objc_super v8 = [(MCKeyValue *)v6 initWithLocalizedString:v5 localizedKey:v7];
    [v3 addObject:v8];
  }
  v9 = [(MCDNSSettingsPayload *)self dnsSettings];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"ServerURL"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v11 = [MCKeyValue alloc];
    v12 = MCLocalizedString(@"DNS_SETTINGS_SERVER_URL");
    uint64_t v13 = [(MCKeyValue *)v11 initWithLocalizedString:v10 localizedKey:v12];
    [v3 addObject:v13];
  }
  v14 = +[MCKeyValueSection sectionWithKeyValues:v3];
  v17[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  return v15;
}

- (id)installationWarnings
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = MCLocalizedString(@"INSTALL_WARNING_DNS_SETTINGS_TITLE");
  v3 = MCLocalizedStringByDevice(@"INSTALL_WARNING_DNS_SETTINGS");
  v4 = +[MCProfileWarning warningWithLocalizedTitle:v2 localizedBody:v3 isLongForm:1];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (NSDictionary)dnsSettings
{
  return self->_dnsSettings;
}

- (NSArray)onDemandRules
{
  return self->_onDemandRules;
}

- (NSNumber)prohibitDisablement
{
  return self->_prohibitDisablement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prohibitDisablement, 0);
  objc_storeStrong((id *)&self->_onDemandRules, 0);
  objc_storeStrong((id *)&self->_dnsSettings, 0);
}

@end