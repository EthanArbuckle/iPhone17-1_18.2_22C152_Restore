@interface MCRelayPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)restrictDomains;
- (MCRelayPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)excludedDomains;
- (NSArray)matchDomains;
- (NSArray)onDemandRules;
- (NSArray)relays;
- (NSDictionary)configurationDictionary;
- (NSString)relayUUID;
- (id)filterForUserEnrollmentOutError:(id *)a3;
- (id)installationWarnings;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)verboseDescription;
- (void)setRelayUUID:(id)a3;
@end

@implementation MCRelayPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.relay.managed";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedString(@"RELAY_SINGULAR");
}

+ (id)localizedPluralForm
{
  return MCLocalizedString(@"RELAY_PLURAL");
}

- (MCRelayPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MCRelayPayload;
  v9 = [(MCPayload *)&v38 initWithDictionary:v8 profile:a4 outError:a5];
  v10 = v9;
  if (v9)
  {
    v9->_restrictDomains = 0;
    id v37 = 0;
    uint64_t v11 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"RelayUUID" isRequired:0 outError:&v37];
    id v12 = v37;
    relayUUID = v10->_relayUUID;
    v10->_relayUUID = (NSString *)v11;

    if (!v12)
    {
      id v36 = 0;
      uint64_t v14 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"Relays" isRequired:1 outError:&v36];
      id v12 = v36;
      relays = v10->_relays;
      v10->_relays = (NSArray *)v14;

      if (!v12)
      {
        id v35 = 0;
        uint64_t v16 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"MatchDomains" isRequired:0 outError:&v35];
        id v12 = v35;
        matchDomains = v10->_matchDomains;
        v10->_matchDomains = (NSArray *)v16;

        if (!v12)
        {
          id v34 = 0;
          uint64_t v18 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"ExcludedDomains" isRequired:0 outError:&v34];
          id v12 = v34;
          excludedDomains = v10->_excludedDomains;
          v10->_excludedDomains = (NSArray *)v18;

          if (!v12)
          {
            id v33 = 0;
            uint64_t v20 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"OnDemandRules" isRequired:0 outError:&v33];
            id v12 = v33;
            onDemandRules = v10->_onDemandRules;
            v10->_onDemandRules = (NSArray *)v20;
          }
        }
      }
    }
    if ([v8 count])
    {
      v22 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        v24 = [(MCPayload *)v10 friendlyName];
        *(_DWORD *)buf = 138543618;
        v40 = v24;
        __int16 v41 = 2114;
        id v42 = v8;
        _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
      }
    }
    if (v12)
    {
      v25 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
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
        v40 = v29;
        __int16 v41 = 2114;
        id v42 = v31;
        _os_log_impl(&dword_1A13F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      v10 = 0;
    }
  }
  return v10;
}

- (id)stubDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)MCRelayPayload;
  v3 = [(MCPayload *)&v10 stubDictionary];
  v4 = [(MCRelayPayload *)self relays];
  [v3 setObject:v4 forKeyedSubscript:@"Relays"];

  v5 = [(MCRelayPayload *)self matchDomains];
  [v3 setObject:v5 forKeyedSubscript:@"MatchDomains"];

  v6 = [(MCRelayPayload *)self excludedDomains];
  [v3 setObject:v6 forKeyedSubscript:@"ExcludedDomains"];

  v7 = [(MCRelayPayload *)self relayUUID];
  [v3 setObject:v7 forKeyedSubscript:@"RelayUUID"];

  id v8 = [(MCRelayPayload *)self onDemandRules];
  [v3 setObject:v8 forKeyedSubscript:@"OnDemandRules"];

  return v3;
}

- (NSDictionary)configurationDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  v4 = [(MCPayload *)self displayName];
  [v3 setObject:v4 forKeyedSubscript:@"PayloadDisplayName"];

  v5 = [(MCRelayPayload *)self relays];
  [v3 setObject:v5 forKeyedSubscript:@"Relays"];

  v6 = [(MCRelayPayload *)self matchDomains];
  [v3 setObject:v6 forKeyedSubscript:@"MatchDomains"];

  v7 = [(MCRelayPayload *)self excludedDomains];
  [v3 setObject:v7 forKeyedSubscript:@"ExcludedDomains"];

  id v8 = [(MCRelayPayload *)self onDemandRules];
  [v3 setObject:v8 forKeyedSubscript:@"OnDemandRules"];

  return (NSDictionary *)v3;
}

- (id)verboseDescription
{
  v15.receiver = self;
  v15.super_class = (Class)MCRelayPayload;
  v3 = [(MCPayload *)&v15 verboseDescription];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(MCRelayPayload *)self relays];
  [v4 appendFormat:@"Relays: %@\n", v5];

  v6 = [(MCRelayPayload *)self matchDomains];

  if (v6)
  {
    v7 = [(MCRelayPayload *)self matchDomains];
    [v4 appendFormat:@"Match Domains: %@\n", v7];
  }
  id v8 = [(MCRelayPayload *)self excludedDomains];

  if (v8)
  {
    v9 = [(MCRelayPayload *)self excludedDomains];
    [v4 appendFormat:@"Excluded Domains: %@\n", v9];
  }
  objc_super v10 = [(MCRelayPayload *)self relayUUID];

  if (v10)
  {
    uint64_t v11 = [(MCRelayPayload *)self relayUUID];
    [v4 appendFormat:@"RelayUUID: %@\n", v11];
  }
  id v12 = [(MCRelayPayload *)self onDemandRules];

  if (v12)
  {
    v13 = [(MCRelayPayload *)self onDemandRules];
    [v4 appendFormat:@"On Demand Rules: %@\n", v13];
  }
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v34 = objc_opt_new();
  id v35 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v3 = [(MCRelayPayload *)self relays];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v4) {
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v37;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v37 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [v8 objectForKeyedSubscript:@"HTTP3RelayURL"];
        objc_super v10 = [v8 objectForKeyedSubscript:@"HTTP2RelayURL"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [MCKeyValue alloc];
          id v12 = MCLocalizedString(@"RELAY_URL");
          v13 = v11;
          uint64_t v14 = v9;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            continue;
          }
          objc_super v15 = [MCKeyValue alloc];
          id v12 = MCLocalizedString(@"RELAY_URL");
          v13 = v15;
          uint64_t v14 = v10;
        }
        uint64_t v16 = [(MCKeyValue *)v13 initWithLocalizedString:v14 localizedKey:v12];
        [v35 addObject:v16];

        goto LABEL_16;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v5) {
      continue;
    }
    break;
  }
LABEL_16:

  v17 = [(MCRelayPayload *)self relayUUID];

  if (v17)
  {
    uint64_t v18 = [MCKeyValue alloc];
    v19 = [(MCRelayPayload *)self relayUUID];
    uint64_t v20 = MCLocalizedString(@"RELAY_RELAYUUID");
    v21 = [(MCKeyValue *)v18 initWithLocalizedString:v19 localizedKey:v20];

    [v35 addObject:v21];
  }
  v22 = +[MCKeyValueSection sectionWithKeyValues:v35];
  [v34 addObject:v22];

  v23 = [(MCRelayPayload *)self matchDomains];
  uint64_t v24 = [v23 count];

  if (v24)
  {
    v25 = [(MCRelayPayload *)self matchDomains];
    v26 = MCLocalizedString(@"RELAY_MATCH_DOMAINS");
    v27 = +[MCKeyValueSection sectionWithLocalizedArray:v25 title:v26 footer:0];

    [v34 addObject:v27];
  }
  v28 = [(MCRelayPayload *)self excludedDomains];
  uint64_t v29 = [v28 count];

  if (v29)
  {
    id v30 = [(MCRelayPayload *)self excludedDomains];
    v31 = MCLocalizedString(@"RELAY_EXCLUDED_DOMAINS");
    v32 = +[MCKeyValueSection sectionWithLocalizedArray:v30 title:v31 footer:0];

    [v34 addObject:v32];
  }

  return v34;
}

- (id)installationWarnings
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = MCLocalizedString(@"INSTALL_WARNING_RELAY_TITLE");
  v3 = MCLocalizedStringByDevice(@"INSTALL_WARNING_RELAY");
  uint64_t v4 = +[MCProfileWarning warningWithLocalizedTitle:v2 localizedBody:v3 isLongForm:1];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  self->_restrictDomains = 1;
  return 0;
}

- (NSArray)relays
{
  return self->_relays;
}

- (NSArray)matchDomains
{
  return self->_matchDomains;
}

- (NSArray)excludedDomains
{
  return self->_excludedDomains;
}

- (NSString)relayUUID
{
  return self->_relayUUID;
}

- (void)setRelayUUID:(id)a3
{
}

- (NSArray)onDemandRules
{
  return self->_onDemandRules;
}

- (BOOL)restrictDomains
{
  return self->_restrictDomains;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDemandRules, 0);
  objc_storeStrong((id *)&self->_relayUUID, 0);
  objc_storeStrong((id *)&self->_excludedDomains, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
  objc_storeStrong((id *)&self->_relays, 0);
}

@end