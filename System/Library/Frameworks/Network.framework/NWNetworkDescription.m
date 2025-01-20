@interface NWNetworkDescription
+ (int64_t)getNewStateFromPathMatch:(BOOL)a3 oldState:(int64_t)a4 probeExists:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPath:(id)a3;
- (NSSet)dnsSearchDomainOptions;
- (NSSet)dnsServerAddressOptions;
- (NSSet)interfaceTypeOptions;
- (NSSet)ssidOptions;
- (NSString)privateDescription;
- (NSURL)probeURL;
- (NWNetworkDescription)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)roamingPreference;
- (int64_t)state;
- (unint64_t)hash;
- (void)setDnsSearchDomainOptions:(id)a3;
- (void)setDnsServerAddressOptions:(id)a3;
- (void)setInterfaceTypeOptions:(id)a3;
- (void)setProbeURL:(id)a3;
- (void)setRoamingPreference:(int64_t)a3;
- (void)setSsidOptions:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updateStateWithPath:(id)a3;
@end

@implementation NWNetworkDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeURL, 0);
  objc_storeStrong((id *)&self->_dnsServerAddressOptions, 0);
  objc_storeStrong((id *)&self->_dnsSearchDomainOptions, 0);
  objc_storeStrong((id *)&self->_ssidOptions, 0);

  objc_storeStrong((id *)&self->_interfaceTypeOptions, 0);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setProbeURL:(id)a3
{
}

- (NSURL)probeURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRoamingPreference:(int64_t)a3
{
  self->_roamingPreference = a3;
}

- (int64_t)roamingPreference
{
  return self->_roamingPreference;
}

- (void)setDnsServerAddressOptions:(id)a3
{
}

- (NSSet)dnsServerAddressOptions
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDnsSearchDomainOptions:(id)a3
{
}

- (NSSet)dnsSearchDomainOptions
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSsidOptions:(id)a3
{
}

- (NSSet)ssidOptions
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInterfaceTypeOptions:(id)a3
{
}

- (NSSet)interfaceTypeOptions
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v3 = [(NWNetworkDescription *)self interfaceTypeOptions];
  uint64_t v4 = [v3 hash];
  v5 = [(NWNetworkDescription *)self ssidOptions];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(NWNetworkDescription *)self dnsSearchDomainOptions];
  uint64_t v8 = [v7 hash];
  v9 = [(NWNetworkDescription *)self dnsServerAddressOptions];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  int64_t v11 = [(NWNetworkDescription *)self roamingPreference];
  v12 = [(NWNetworkDescription *)self probeURL];
  unint64_t v13 = v10 ^ v11 ^ [v12 hash];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(NWNetworkDescription *)self interfaceTypeOptions];
    v7 = [v5 interfaceTypeOptions];
    int v8 = areNSSetsEqual(v6, v7);

    if (!v8) {
      goto LABEL_10;
    }
    v9 = [(NWNetworkDescription *)self ssidOptions];
    uint64_t v10 = [v5 ssidOptions];
    int v11 = areNSSetsEqual(v9, v10);

    if (!v11) {
      goto LABEL_10;
    }
    v12 = [(NWNetworkDescription *)self dnsSearchDomainOptions];
    unint64_t v13 = [v5 dnsSearchDomainOptions];
    int v14 = areNSSetsEqual(v12, v13);

    if (!v14) {
      goto LABEL_10;
    }
    v15 = [(NWNetworkDescription *)self dnsServerAddressOptions];
    v16 = [v5 dnsServerAddressOptions];
    int v17 = areNSSetsEqual(v15, v16);

    if (!v17) {
      goto LABEL_10;
    }
    int64_t v18 = [(NWNetworkDescription *)self roamingPreference];
    if (v18 == [v5 roamingPreference])
    {
      v19 = [(NWNetworkDescription *)self probeURL];
      v20 = [v5 probeURL];
      char v21 = NWUtilsAreNSObjectsEqual(v19, v20);
    }
    else
    {
LABEL_10:
      char v21 = 0;
    }
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  id v5 = [(NWNetworkDescription *)self interfaceTypeOptions];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    int v8 = [(NWNetworkDescription *)self interfaceTypeOptions];
    v9 = (void *)[v7 initWithSet:v8 copyItems:1];
    [v4 setInterfaceTypeOptions:v9];
  }
  uint64_t v10 = [(NWNetworkDescription *)self ssidOptions];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    unint64_t v13 = [(NWNetworkDescription *)self ssidOptions];
    int v14 = (void *)[v12 initWithSet:v13 copyItems:1];
    [v4 setSsidOptions:v14];
  }
  v15 = [(NWNetworkDescription *)self dnsSearchDomainOptions];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    int64_t v18 = [(NWNetworkDescription *)self dnsSearchDomainOptions];
    v19 = (void *)[v17 initWithSet:v18 copyItems:1];
    [v4 setDnsSearchDomainOptions:v19];
  }
  v20 = [(NWNetworkDescription *)self dnsServerAddressOptions];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v23 = [(NWNetworkDescription *)self dnsServerAddressOptions];
    v24 = (void *)[v22 initWithSet:v23 copyItems:1];
    [v4 setDnsServerAddressOptions:v24];
  }
  objc_msgSend(v4, "setRoamingPreference:", -[NWNetworkDescription roamingPreference](self, "roamingPreference"));
  v25 = [(NWNetworkDescription *)self probeURL];

  if (v25)
  {
    v26 = [(NWNetworkDescription *)self probeURL];
    v27 = (void *)[v26 copy];
    [v4 setProbeURL:v27];
  }
  return v4;
}

- (NSString)privateDescription
{
  v2 = [(NWNetworkDescription *)self descriptionWithIndent:0 showFullContent:1];

  return (NSString *)v2;
}

- (id)description
{
  v2 = [(NWNetworkDescription *)self descriptionWithIndent:0 showFullContent:0];

  return v2;
}

- (NWNetworkDescription)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  int v8 = [(NWNetworkDescription *)self interfaceTypeOptions];
  [v7 appendPrettyObject:v8 withName:@"interfaceType" indent:v5 showFullContent:1];

  v9 = [(NWNetworkDescription *)self ssidOptions];
  [v7 appendPrettyObject:v9 withName:@"ssid" indent:v5 showFullContent:1];

  uint64_t v10 = [(NWNetworkDescription *)self dnsSearchDomainOptions];
  [v7 appendPrettyObject:v10 withName:@"dnsSearchDomain" indent:v5 showFullContent:1];

  uint64_t v11 = [(NWNetworkDescription *)self dnsServerAddressOptions];
  [v7 appendPrettyObject:v11 withName:@"dnsServerAddress" indent:v5 showFullContent:1];

  int64_t v12 = [(NWNetworkDescription *)self roamingPreference];
  unint64_t v13 = (NWNetworkDescription *)v7;
  int v14 = @"roaming";
  if (v12 == 1)
  {
    v15 = @"%@Required";
  }
  else
  {
    if (v12 != 2) {
      goto LABEL_6;
    }
    v15 = @"%@Prohibited";
  }
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", v15, @"roaming");
  [(NWNetworkDescription *)v13 appendPrettyBOOL:1 withName:v16 indent:v5];

LABEL_6:
  id v17 = [(NWNetworkDescription *)self probeURL];
  int64_t v18 = [v17 absoluteString];
  [(NWNetworkDescription *)v13 appendPrettyObject:v18 withName:@"probeURL" indent:v5 showFullContent:1];

  if (v4)
  {
    unint64_t v19 = [(NWNetworkDescription *)self state];
    if (v19 >= 4) {
      v20 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown[%lld]", v19);
    }
    else {
      v20 = off_1E5241D00[v19];
    }
    [(NWNetworkDescription *)v13 appendPrettyObject:v20 withName:@"state" indent:v5 showFullContent:1];
  }
  return v13;
}

- (void)updateStateWithPath:(id)a3
{
  BOOL v4 = [(NWNetworkDescription *)self matchesPath:a3];
  int64_t v5 = [(NWNetworkDescription *)self state];
  id v6 = [(NWNetworkDescription *)self probeURL];
  [(NWNetworkDescription *)self setState:+[NWNetworkDescription getNewStateFromPathMatch:v4 oldState:v5 probeExists:v6 != 0]];
}

- (BOOL)matchesPath:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v66 = "-[NWNetworkDescription matchesPath:]";
    int v14 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v59 = 0;
    if (__nwlog_fault(v14, type, &v59))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        os_log_type_t v16 = type[0];
        if (!os_log_type_enabled(v15, type[0])) {
          goto LABEL_39;
        }
        *(_DWORD *)buf = 136446210;
        v66 = "-[NWNetworkDescription matchesPath:]";
        id v17 = "%{public}s called with null path";
LABEL_37:
        v31 = v15;
        os_log_type_t v32 = v16;
        goto LABEL_38;
      }
      if (!v59)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        os_log_type_t v16 = type[0];
        if (!os_log_type_enabled(v15, type[0])) {
          goto LABEL_39;
        }
        *(_DWORD *)buf = 136446210;
        v66 = "-[NWNetworkDescription matchesPath:]";
        id v17 = "%{public}s called with null path, backtrace limit exceeded";
        goto LABEL_37;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v15 = (id)gLogObj;
      os_log_type_t v19 = type[0];
      BOOL v20 = os_log_type_enabled(v15, type[0]);
      if (!backtrace_string)
      {
        if (!v20)
        {
LABEL_39:

          if (!v14) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136446210;
        v66 = "-[NWNetworkDescription matchesPath:]";
        id v17 = "%{public}s called with null path, no backtrace";
        v31 = v15;
        os_log_type_t v32 = v19;
LABEL_38:
        _os_log_impl(&dword_1830D4000, v31, v32, v17, buf, 0xCu);
        goto LABEL_39;
      }
      if (v20)
      {
        *(_DWORD *)buf = 136446466;
        v66 = "-[NWNetworkDescription matchesPath:]";
        __int16 v67 = 2082;
        v68 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v15, v19, "%{public}s called with null path, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v14) {
      goto LABEL_24;
    }
LABEL_23:
    free(v14);
    goto LABEL_24;
  }
  if ([v5 status] == 1)
  {
    id v7 = [(NWNetworkDescription *)self interfaceTypeOptions];
    int v8 = v7;
    if (v7)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v3 = *(Class **)v56;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(Class **)v56 != v3) {
              objc_enumerationMutation(v9);
            }
            if (objc_msgSend(v6, "usesInterfaceType:", objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * i), "integerValue")))
            {

              goto LABEL_26;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v55 objects:v64 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      goto LABEL_81;
    }
LABEL_26:
    int v22 = [v6 isRoaming];
    int64_t v23 = [(NWNetworkDescription *)self roamingPreference];
    uint64_t v24 = 1;
    if (v22) {
      uint64_t v24 = 2;
    }
    if (v23 && v24 == v23) {
      goto LABEL_79;
    }
    v25 = [(NWNetworkDescription *)self ssidOptions];

    if (v25)
    {
      v26 = [v6 interface];
      if ([v26 subtype] == 5001)
      {
        int v27 = [v6 usesInterfaceType:1];

        if (v27)
        {
          v28 = (void *)[v6 copyDataFromNetworkAgentWithDomain:@"com.apple.networkrelay" type:@"CompanionNetworkDescription"];
          v29 = (void *)[[NSString alloc] initWithData:v28 encoding:4];
          v3 = [(NWNetworkDescription *)self ssidOptions];
          char v30 = NWUtilsStringMatchesPatternSet(v29, v3);

          if (v30) {
            goto LABEL_58;
          }
        }
      }
      else
      {
      }
      v33 = [v6 interface];
      uint64_t v34 = [v33 type];

      if (v34 != 1) {
        goto LABEL_79;
      }
      id v9 = [v6 interface];
      v35 = [v9 interfaceName];
      gotLoadHelper_x24__OBJC_CLASS___CWFInterface(v36);
      if (!objc_opt_class())
      {

LABEL_81:
        LOBYTE(v21) = 0;
        goto LABEL_84;
      }
      v3 = (Class *)objc_alloc_init(v3[100]);
      [(Class *)v3 activate];
      long long v62 = 0u;
      long long v63 = 0u;
      *(_OWORD *)type = 0u;
      long long v61 = 0u;
      v37 = [(Class *)v3 interfaceNames];
      uint64_t v38 = [v37 countByEnumeratingWithState:type objects:buf count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v61;
        while (2)
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v61 != v40) {
              objc_enumerationMutation(v37);
            }
            if ([*(id *)(*(void *)&type[8] + 8 * j) isEqual:v35])
            {

              v42 = [(Class *)v3 networkName];
              goto LABEL_56;
            }
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:type objects:buf count:16];
          if (v39) {
            continue;
          }
          break;
        }
      }

      v42 = 0;
LABEL_56:
      [(Class *)v3 invalidate];

      if (!v42) {
        goto LABEL_79;
      }
      v43 = [(NWNetworkDescription *)self ssidOptions];
      int v44 = NWUtilsStringMatchesPatternSet(v42, v43);

      if (!v44) {
        goto LABEL_79;
      }
    }
LABEL_58:
    v45 = [(NWNetworkDescription *)self dnsServerAddressOptions];

    if (v45)
    {
      id v9 = [v6 dnsServersAsStrings];
      uint64_t v46 = [v6 overrideDNSServersAsStrings];
      v47 = (void *)v46;
      if (v9)
      {
        v3 = [(NWNetworkDescription *)self dnsServerAddressOptions];
        if (NWUtilsAnyStringsMatchPatternSet(v9, v3))
        {

          goto LABEL_70;
        }
        if (!v47)
        {
LABEL_80:

          goto LABEL_81;
        }
      }
      else if (!v46)
      {
        goto LABEL_79;
      }
      v48 = [(NWNetworkDescription *)self dnsServerAddressOptions];
      int matched = NWUtilsAnyStringsMatchPatternSet(v47, v48);

      if (v9)
      {

        if ((matched & 1) == 0) {
          goto LABEL_79;
        }
      }
      else
      {

        if (!matched) {
          goto LABEL_79;
        }
      }
    }
LABEL_70:
    v50 = [(NWNetworkDescription *)self dnsSearchDomainOptions];

    if (!v50) {
      goto LABEL_83;
    }
    id v9 = [v6 dnsSearchDomains];
    uint64_t v51 = [v6 overrideDNSSearchDomains];
    v52 = (void *)v51;
    if (!v9)
    {
      if (!v51) {
        goto LABEL_79;
      }
      goto LABEL_77;
    }
    v3 = [(NWNetworkDescription *)self dnsSearchDomainOptions];
    if (NWUtilsAnyStringsMatchPatternSet(v9, v3))
    {

      goto LABEL_83;
    }
    if (v52)
    {
LABEL_77:
      v53 = [(NWNetworkDescription *)self dnsSearchDomainOptions];
      int v21 = NWUtilsAnyStringsMatchPatternSet(v52, v53);

      if (v9)
      {

        if (v21) {
          goto LABEL_83;
        }
LABEL_79:
        LOBYTE(v21) = 0;
LABEL_84:

        goto LABEL_85;
      }

      if (!v21) {
        goto LABEL_84;
      }
LABEL_83:
      LOBYTE(v21) = 1;
      goto LABEL_84;
    }
    goto LABEL_80;
  }
LABEL_24:
  LOBYTE(v21) = 0;
LABEL_85:

  return v21;
}

+ (int64_t)getNewStateFromPathMatch:(BOOL)a3 oldState:(int64_t)a4 probeExists:(BOOL)a5
{
  int64_t v5 = 1;
  if (a5) {
    int64_t v5 = 2;
  }
  if (a3) {
    int64_t v6 = a4;
  }
  else {
    int64_t v6 = 0;
  }
  if (!a3) {
    int64_t v5 = 0;
  }
  if (a4) {
    return v6;
  }
  else {
    return v5;
  }
}

@end