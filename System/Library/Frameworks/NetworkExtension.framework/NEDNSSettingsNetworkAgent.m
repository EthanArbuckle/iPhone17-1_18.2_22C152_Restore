@interface NEDNSSettingsNetworkAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (NEDNSSettings)settings;
- (id)copyAgentData;
- (void)setSettings:(id)a3;
@end

@implementation NEDNSSettingsNetworkAgent

+ (id)agentFromData:(id)a3
{
  return 0;
}

+ (id)agentType
{
  return @"DNSAgent";
}

+ (id)agentDomain
{
  return @"SystemConfig";
}

- (void).cxx_destruct
{
}

- (void)setSettings:(id)a3
{
}

- (NEDNSSettings)settings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 80, 1);
}

- (id)copyAgentData
{
  v63[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)nw_resolver_config_create();
  nw_resolver_config_set_class();
  v4 = [(NEDNSSettingsNetworkAgent *)self settings];
  uint64_t v5 = [v4 dnsProtocol];

  if (v5 != 1)
  {
    if (v5 == 3)
    {
      v6 = [(NEDNSSettingsNetworkAgent *)self settings];
      [v6 proxyAgentUUID];
    }
    else if (v5 != 2)
    {
      v46 = 0;
      goto LABEL_40;
    }
  }
  nw_resolver_config_set_protocol();
  v63[0] = 0;
  v63[1] = 0;
  v7 = [(NENetworkAgent *)self configurationUUID];
  [v7 getUUIDBytes:v63];

  nw_resolver_config_set_identifier();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v8 = [(NEDNSSettingsNetworkAgent *)self settings];
  v9 = [v8 servers];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v57 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v56 + 1) + 8 * i) UTF8String];
        nw_resolver_config_add_name_server();
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v11);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v14 = [(NEDNSSettingsNetworkAgent *)self settings];
  v15 = [v14 searchDomains];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v52 + 1) + 8 * j) UTF8String];
        nw_resolver_config_add_search_domain();
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v61 count:16];
    }
    while (v17);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v20 = [(NEDNSSettingsNetworkAgent *)self settings];
  v21 = [v20 matchDomains];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * k) UTF8String];
        nw_resolver_config_add_match_domain();
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v23);
  }

  v26 = [(NEDNSSettingsNetworkAgent *)self settings];
  v27 = [v26 proxyAgentUUID];

  if (v27)
  {
    v28 = [(NEDNSSettingsNetworkAgent *)self settings];
    v29 = [v28 proxyAgentUUID];
    v30 = [v29 UUIDString];

    [v30 UTF8String];
    nw_resolver_config_set_proxy_agent();
  }
  v31 = [(NEDNSSettingsNetworkAgent *)self settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v33 = [(NEDNSSettingsNetworkAgent *)self settings];
    v34 = [v33 serverName];

    [v34 UTF8String];
    nw_resolver_config_set_provider_name();
    v35 = [(NEDNSSettingsNetworkAgent *)self settings];
    v36 = [v35 identityReference];

    if (v36)
    {
      [v36 bytes];
      [v36 length];
      nw_resolver_config_set_identity_reference();
    }
  }
  v37 = [(NEDNSSettingsNetworkAgent *)self settings];
  objc_opt_class();
  char v38 = objc_opt_isKindOfClass();

  if (v38)
  {
    v39 = [(NEDNSSettingsNetworkAgent *)self settings];
    v40 = [v39 serverURL];

    v41 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v40 resolvingAgainstBaseURL:0];
    v42 = [v41 percentEncodedHost];
    v43 = [v41 percentEncodedPath];
    [v42 UTF8String];
    nw_resolver_config_set_provider_name();
    [v43 UTF8String];
    nw_resolver_config_set_provider_path();
    v44 = [(NEDNSSettingsNetworkAgent *)self settings];
    v45 = [v44 identityReference];

    if (v45)
    {
      [v45 bytes];
      [v45 length];
      nw_resolver_config_set_identity_reference();
    }
  }
  v46 = (void *)nw_resolver_config_copy_plist_data();
LABEL_40:

  return v46;
}

@end