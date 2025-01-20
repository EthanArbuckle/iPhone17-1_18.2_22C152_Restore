@interface NEOnDemandRule
+ (BOOL)supportsSecureCoding;
+ (id)createOnDemandRulesFromLegacyDictionary:(uint64_t)a1;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NEOnDemandRule)initWithAction:(int64_t)a3;
- (NEOnDemandRule)initWithCoder:(id)a3;
- (NEOnDemandRuleAction)action;
- (NEOnDemandRuleInterfaceType)interfaceTypeMatch;
- (NSArray)DNSSearchDomainMatch;
- (NSArray)DNSServerAddressMatch;
- (NSArray)SSIDMatch;
- (NSURL)probeURL;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDNSSearchDomainMatch:(NSArray *)DNSSearchDomainMatch;
- (void)setDNSServerAddressMatch:(NSArray *)DNSServerAddressMatch;
- (void)setInterfaceTypeMatch:(NEOnDemandRuleInterfaceType)interfaceTypeMatch;
- (void)setProbeURL:(NSURL *)probeURL;
- (void)setSSIDMatch:(NSArray *)SSIDMatch;
@end

@implementation NEOnDemandRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeURL, 0);
  objc_storeStrong((id *)&self->_SSIDMatch, 0);
  objc_storeStrong((id *)&self->_DNSServerAddressMatch, 0);

  objc_storeStrong((id *)&self->_DNSSearchDomainMatch, 0);
}

- (void)setProbeURL:(NSURL *)probeURL
{
}

- (NSURL)probeURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSSIDMatch:(NSArray *)SSIDMatch
{
}

- (NSArray)SSIDMatch
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInterfaceTypeMatch:(NEOnDemandRuleInterfaceType)interfaceTypeMatch
{
  self->_interfaceTypeMatch = interfaceTypeMatch;
}

- (NEOnDemandRuleInterfaceType)interfaceTypeMatch
{
  return self->_interfaceTypeMatch;
}

- (void)setDNSServerAddressMatch:(NSArray *)DNSServerAddressMatch
{
}

- (NSArray)DNSServerAddressMatch
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDNSSearchDomainMatch:(NSArray *)DNSSearchDomainMatch
{
}

- (NSArray)DNSSearchDomainMatch
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NEOnDemandRuleAction)action
{
  return self->_action;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)NEOnDemandRule;
  v5 = [(NEOnDemandRule *)&v37 init];
  if (!v5) {
    goto LABEL_29;
  }
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41FC8]];
  if (isa_nsstring(v6))
  {
    if ([v6 isEqualToString:*MEMORY[0x1E4F42170]])
    {
      uint64_t v7 = 4;
LABEL_12:
      v5->_action = v7;
      goto LABEL_13;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F42158]])
    {
      uint64_t v7 = 1;
      goto LABEL_12;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F42160]])
    {
      uint64_t v7 = 2;
      goto LABEL_12;
    }
    if (([v6 isEqualToString:*MEMORY[0x1E4F42168]] & 1) != 0
      || [v6 isEqualToString:*MEMORY[0x1E4F42150]])
    {
      uint64_t v7 = 3;
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v8 = *MEMORY[0x1E4F41FF8];
  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41FF8]];
  int v10 = isa_nsarray(v9);

  if (v10)
  {
    v11 = [v4 objectForKeyedSubscript:v8];
    uint64_t v12 = [v11 copy];
    DNSSearchDomainMatch = v5->_DNSSearchDomainMatch;
    v5->_DNSSearchDomainMatch = (NSArray *)v12;
  }
  uint64_t v14 = *MEMORY[0x1E4F42000];
  v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42000]];
  int v16 = isa_nsarray(v15);

  if (v16)
  {
    v17 = [v4 objectForKeyedSubscript:v14];
    uint64_t v18 = [v17 copy];
    DNSServerAddressMatch = v5->_DNSServerAddressMatch;
    v5->_DNSServerAddressMatch = (NSArray *)v18;
  }
  v20 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42008]];
  if (!isa_nsstring(v20)) {
    goto LABEL_24;
  }
  if ([v20 isEqualToString:@"Cellular"])
  {
    uint64_t v21 = 3;
  }
  else
  {
    if (([v20 isEqualToString:*MEMORY[0x1E4F42188]] & 1) != 0
      || ![v20 isEqualToString:*MEMORY[0x1E4F42190]])
    {
      goto LABEL_24;
    }
    uint64_t v21 = 2;
  }
  v5->_interfaceTypeMatch = v21;
LABEL_24:
  uint64_t v22 = *MEMORY[0x1E4F42010];
  v23 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42010]];
  int v24 = isa_nsarray(v23);

  if (v24)
  {
    v25 = [v4 objectForKeyedSubscript:v22];
    uint64_t v26 = [v25 copy];
    SSIDMatch = v5->_SSIDMatch;
    v5->_SSIDMatch = (NSArray *)v26;
  }
  uint64_t v28 = *MEMORY[0x1E4F42018];
  v29 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42018]];
  int v30 = isa_nsstring(v29);

  if (v30)
  {
    v31 = (void *)MEMORY[0x1E4F1CB10];
    v32 = [v4 objectForKeyedSubscript:v28];
    uint64_t v33 = [v31 URLWithString:v32];
    probeURL = v5->_probeURL;
    v5->_probeURL = (NSURL *)v33;
  }
  v35 = v5;

LABEL_29:
  return v5;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v4 = [(NEOnDemandRule *)self action] - 1;
  if (v4 <= 3) {
    [v3 setObject:**((void **)&unk_1E5991AE8 + v4) forKeyedSubscript:*MEMORY[0x1E4F41FC8]];
  }
  v5 = [(NEOnDemandRule *)self DNSSearchDomainMatch];

  if (v5)
  {
    v6 = [(NEOnDemandRule *)self DNSSearchDomainMatch];
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F41FF8]];
  }
  uint64_t v7 = [(NEOnDemandRule *)self DNSServerAddressMatch];

  if (v7)
  {
    uint64_t v8 = [(NEOnDemandRule *)self DNSServerAddressMatch];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F42000]];
  }
  NEOnDemandRuleInterfaceType v9 = [(NEOnDemandRule *)self interfaceTypeMatch];
  if (v9 == NEOnDemandRuleInterfaceTypeCellular)
  {
    uint64_t v11 = *MEMORY[0x1E4F42008];
    int v10 = @"Cellular";
  }
  else
  {
    if (v9 != NEOnDemandRuleInterfaceTypeWiFi) {
      goto LABEL_12;
    }
    int v10 = (__CFString *)*MEMORY[0x1E4F42190];
    uint64_t v11 = *MEMORY[0x1E4F42008];
  }
  [v3 setObject:v10 forKeyedSubscript:v11];
LABEL_12:
  uint64_t v12 = [(NEOnDemandRule *)self SSIDMatch];

  if (v12)
  {
    v13 = [(NEOnDemandRule *)self SSIDMatch];
    [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F42010]];
  }
  uint64_t v14 = [(NEOnDemandRule *)self probeURL];

  if (v14)
  {
    v15 = [(NEOnDemandRule *)self probeURL];
    int v16 = [v15 absoluteString];
    [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F42018]];
  }
  return v3;
}

- (id)description
{
  return [(NEOnDemandRule *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  unint64_t v8 = [(NEOnDemandRule *)self action] - 1;
  if (v8 <= 3) {
    [v7 appendPrettyObject:off_1E5991AC8[v8] withName:@"action" andIndent:v5 options:a4];
  }
  NEOnDemandRuleInterfaceType v9 = [(NEOnDemandRule *)self DNSSearchDomainMatch];
  unint64_t v10 = a4 | 1;
  [v7 appendPrettyObject:v9 withName:@"DNSSearchDomainMatch" andIndent:v5 options:a4 | 1];

  uint64_t v11 = [(NEOnDemandRule *)self DNSServerAddressMatch];
  [v7 appendPrettyObject:v11 withName:@"DNSServerAddressMatch" andIndent:v5 options:a4 | 1];

  NEOnDemandRuleInterfaceType v12 = [(NEOnDemandRule *)self interfaceTypeMatch];
  if (v12)
  {
    if (v12 == NEOnDemandRuleInterfaceTypeWiFi)
    {
      v13 = @"WiFi";
    }
    else
    {
      if (v12 != NEOnDemandRuleInterfaceTypeCellular) {
        goto LABEL_10;
      }
      v13 = @"cellular";
    }
  }
  else
  {
    v13 = @"any";
  }
  [v7 appendPrettyObject:v13 withName:@"interfaceTypeMatch" andIndent:v5 options:a4];
LABEL_10:
  uint64_t v14 = [(NEOnDemandRule *)self SSIDMatch];
  [v7 appendPrettyObject:v14 withName:@"SSIDMatch" andIndent:v5 options:v10];

  v15 = [(NEOnDemandRule *)self probeURL];
  int v16 = [v15 absoluteString];
  [v7 appendPrettyObject:v16 withName:@"probeURL" andIndent:v5 options:v10];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NEOnDemandRule *)self action] >= NEOnDemandRuleActionConnect
    && [(NEOnDemandRule *)self action] < (NEOnDemandRuleActionIgnore|NEOnDemandRuleActionConnect))
  {
    char v5 = 1;
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid action", v4);
    char v5 = 0;
  }
  v6 = [(NEOnDemandRule *)self DNSSearchDomainMatch];

  if (v6)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = [(NEOnDemandRule *)self DNSSearchDomainMatch];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v23 + 1) + 8 * v11)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid search domain", v4);
            char v5 = 0;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v9);
    }
  }
  NEOnDemandRuleInterfaceType v12 = [(NEOnDemandRule *)self DNSServerAddressMatch];

  if (v12)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v13 = [(NEOnDemandRule *)self DNSServerAddressMatch];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v19 + 1) + 8 * v17)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid DNS server", v4);
            char v5 = 0;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v15);
    }
  }
  return v5 & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAction:", -[NEOnDemandRule action](self, "action"));
  char v5 = [(NEOnDemandRule *)self DNSSearchDomainMatch];
  [v4 setDNSSearchDomainMatch:v5];

  v6 = [(NEOnDemandRule *)self DNSServerAddressMatch];
  [v4 setDNSServerAddressMatch:v6];

  objc_msgSend(v4, "setInterfaceTypeMatch:", -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch"));
  uint64_t v7 = [(NEOnDemandRule *)self SSIDMatch];
  [v4 setSSIDMatch:v7];

  uint64_t v8 = [(NEOnDemandRule *)self probeURL];
  [v4 setProbeURL:v8];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEOnDemandRule action](self, "action"), @"Action");
  char v5 = [(NEOnDemandRule *)self DNSSearchDomainMatch];
  [v4 encodeObject:v5 forKey:@"DNSSearchDomainMatch"];

  v6 = [(NEOnDemandRule *)self DNSServerAddressMatch];
  [v4 encodeObject:v6 forKey:@"DNSServerAddressMatch"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch"), @"InterfaceTypeMatch");
  uint64_t v7 = [(NEOnDemandRule *)self SSIDMatch];
  [v4 encodeObject:v7 forKey:@"SSIDMatch"];

  id v8 = [(NEOnDemandRule *)self probeURL];
  [v4 encodeObject:v8 forKey:@"ProbeURL"];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NEOnDemandRuleAction v6 = [(NEOnDemandRule *)self action];
    if (v6 == [v5 action])
    {
      uint64_t v7 = [(NEOnDemandRule *)self DNSSearchDomainMatch];
      id v8 = [v5 DNSSearchDomainMatch];
      if (v7 != v8)
      {
        uint64_t v9 = [(NEOnDemandRule *)self DNSSearchDomainMatch];
        v34 = [v5 DNSSearchDomainMatch];
        v35 = v9;
        if (!objc_msgSend(v9, "isEqualToArray:"))
        {
          char v10 = 0;
          goto LABEL_26;
        }
      }
      uint64_t v11 = [(NEOnDemandRule *)self DNSServerAddressMatch];
      NEOnDemandRuleInterfaceType v12 = [v5 DNSServerAddressMatch];
      if (v11 != v12)
      {
        id v3 = [(NEOnDemandRule *)self DNSServerAddressMatch];
        v13 = [v5 DNSServerAddressMatch];
        if (![v3 isEqualToArray:v13])
        {
          char v10 = 0;
          goto LABEL_24;
        }
        uint64_t v33 = v13;
      }
      NEOnDemandRuleInterfaceType v14 = [(NEOnDemandRule *)self interfaceTypeMatch];
      if (v14 == [v5 interfaceTypeMatch])
      {
        uint64_t v15 = [(NEOnDemandRule *)self SSIDMatch];
        uint64_t v16 = [v5 SSIDMatch];
        uint64_t v17 = v15;
        BOOL v18 = v15 == v16;
        v13 = v33;
        v31 = (void *)v16;
        v32 = (void *)v17;
        if (v18
          || ([(NEOnDemandRule *)self SSIDMatch],
              long long v19 = objc_claimAutoreleasedReturnValue(),
              [v5 SSIDMatch],
              uint64_t v29 = objc_claimAutoreleasedReturnValue(),
              int v30 = v19,
              objc_msgSend(v19, "isEqualToArray:")))
        {
          long long v20 = [(NEOnDemandRule *)self probeURL];
          uint64_t v21 = [v5 probeURL];
          if (v20 == (void *)v21)
          {

            char v10 = 1;
          }
          else
          {
            long long v22 = (void *)v21;
            long long v23 = [(NEOnDemandRule *)self probeURL];
            long long v24 = [v5 probeURL];
            char v10 = [v23 isEqual:v24];
          }
          long long v26 = v31;
          long long v25 = v32;
          id v3 = v28;
          v13 = v33;
          if (v32 == v31)
          {
LABEL_23:

            if (v11 == v12) {
              goto LABEL_25;
            }
            goto LABEL_24;
          }
        }
        else
        {
          char v10 = 0;
          long long v26 = v31;
          long long v25 = v32;
        }

        goto LABEL_23;
      }
      char v10 = 0;
      v13 = v33;
      if (v11 == v12)
      {
LABEL_25:

        if (v7 == v8)
        {
LABEL_27:

          goto LABEL_28;
        }
LABEL_26:

        goto LABEL_27;
      }
LABEL_24:

      goto LABEL_25;
    }
  }
  char v10 = 0;
LABEL_28:

  return v10;
}

- (NEOnDemandRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NEOnDemandRule;
  id v5 = [(NEOnDemandRule *)&v24 init];
  if (v5)
  {
    v5->_action = (int)[v4 decodeInt32ForKey:@"Action"];
    NEOnDemandRuleAction v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"DNSSearchDomainMatch"];
    DNSSearchDomainMatch = v5->_DNSSearchDomainMatch;
    v5->_DNSSearchDomainMatch = (NSArray *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"DNSServerAddressMatch"];
    DNSServerAddressMatch = v5->_DNSServerAddressMatch;
    v5->_DNSServerAddressMatch = (NSArray *)v14;

    v5->_interfaceTypeMatch = (int)[v4 decodeInt32ForKey:@"InterfaceTypeMatch"];
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    BOOL v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"SSIDMatch"];
    SSIDMatch = v5->_SSIDMatch;
    v5->_SSIDMatch = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProbeURL"];
    probeURL = v5->_probeURL;
    v5->_probeURL = (NSURL *)v21;
  }
  return v5;
}

- (NEOnDemandRule)initWithAction:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NEOnDemandRule;
  result = [(NEOnDemandRule *)&v5 init];
  if (result) {
    result->_action = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createOnDemandRulesFromLegacyDictionary:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F41FB8]];
  if (isa_nsarray(v3) && [v3 count])
  {
    id v4 = [[NEEvaluateConnectionRule alloc] initWithMatchDomains:v3 andAction:2];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v5 addObject:v4];
  }
  else
  {
    id v5 = 0;
  }
  NEOnDemandRuleAction v6 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F41FB0]];

  if (isa_nsarray(v6) && [v6 count])
  {
    uint64_t v7 = [[NEEvaluateConnectionRule alloc] initWithMatchDomains:v6 andAction:1];
    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    [v5 addObject:v7];
  }
  id v8 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F41FC0]];

  if (isa_nsarray(v8) && [v8 count])
  {
    uint64_t v9 = [[NEEvaluateConnectionRule alloc] initWithMatchDomains:v8 andAction:1];
    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    [v5 addObject:v9];
  }
  char v10 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F42020]];

  if (isa_nsarray(v10))
  {
    id v34 = v5;
    v31 = v10;
    id v32 = v2;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (!v12)
    {
      id v14 = 0;
      LOBYTE(v33) = 0;
      goto LABEL_58;
    }
    uint64_t v13 = v12;
    id v14 = 0;
    int v33 = 0;
    uint64_t v15 = *(void *)v40;
    uint64_t v16 = *MEMORY[0x1E4F41FC8];
    uint64_t v17 = *MEMORY[0x1E4F42170];
    uint64_t v18 = *MEMORY[0x1E4F42158];
    uint64_t v38 = *MEMORY[0x1E4F42160];
    uint64_t v36 = *MEMORY[0x1E4F42168];
    uint64_t v35 = *MEMORY[0x1E4F42150];
    uint64_t v37 = *MEMORY[0x1E4F42158];
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v11);
        }
        long long v20 = *(void **)(*((void *)&v39 + 1) + 8 * v19);
        if (isa_nsdictionary(v20))
        {
          uint64_t v21 = [v20 objectForKeyedSubscript:v16];
          if (isa_nsstring(v21))
          {
            if ([v21 isEqualToString:v17])
            {
              long long v22 = NEOnDemandRuleIgnore;
              goto LABEL_31;
            }
            if ([v21 isEqualToString:v18])
            {
              long long v22 = NEOnDemandRuleConnect;
              goto LABEL_31;
            }
            if ([v21 isEqualToString:v38])
            {
              long long v22 = NEOnDemandRuleDisconnect;
              goto LABEL_31;
            }
            if ([v21 isEqualToString:v36])
            {
              long long v22 = NEOnDemandRuleEvaluateConnection;
LABEL_31:
              id v23 = (id)[[v22 alloc] initFromLegacyDictionary:v20];
              if (v23)
              {
LABEL_32:
                objc_super v24 = objc_msgSend(v23, "DNSSearchDomainMatch", v31, v32);
                if (v24
                  || ([v23 DNSServerAddressMatch],
                      (objc_super v24 = objc_claimAutoreleasedReturnValue()) != 0))
                {

                  if (!v14) {
                    goto LABEL_35;
                  }
                }
                else
                {
                  long long v25 = [v23 SSIDMatch];
                  if (v25 || [v23 interfaceTypeMatch])
                  {
                  }
                  else
                  {
                    long long v26 = [v23 probeURL];

                    if (v26) {
                      int v27 = v33;
                    }
                    else {
                      int v27 = 1;
                    }
                    int v33 = v27;
                  }
                  uint64_t v18 = v37;
                  if (!v14) {
LABEL_35:
                  }
                    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                [v14 addObject:v23];
              }
            }
            else if ([v21 isEqualToString:v35])
            {
              if (v34)
              {
                id v23 = [[NEOnDemandRuleEvaluateConnection alloc] initFromLegacyDictionary:v20];
                [v23 setConnectionRules:v34];
                uint64_t v18 = v37;
                if (v23) {
                  goto LABEL_32;
                }
              }
              else
              {
                uint64_t v18 = v37;
              }
            }
          }
        }
        ++v19;
      }
      while (v13 != v19);
      uint64_t v28 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
      uint64_t v13 = v28;
      if (!v28)
      {
LABEL_58:

        char v10 = v31;
        id v2 = v32;
        id v5 = v34;
        if ((v33 & 1) == 0) {
          goto LABEL_59;
        }
        goto LABEL_63;
      }
    }
  }
  id v14 = 0;
LABEL_59:
  if (v5)
  {
    uint64_t v29 = objc_alloc_init(NEOnDemandRuleEvaluateConnection);
    [(NEOnDemandRuleEvaluateConnection *)v29 setConnectionRules:v5];
    if (!v14) {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    objc_msgSend(v14, "addObject:", v29, v31, v32);
  }
LABEL_63:

  return v14;
}

@end