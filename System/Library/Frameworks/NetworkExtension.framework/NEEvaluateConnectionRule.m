@interface NEEvaluateConnectionRule
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NEEvaluateConnectionRule)initWithCoder:(id)a3;
- (NEEvaluateConnectionRule)initWithMatchDomains:(NSArray *)domains andAction:(NEEvaluateConnectionRuleAction)action;
- (NEEvaluateConnectionRuleAction)action;
- (NSArray)matchDomains;
- (NSArray)useDNSServers;
- (NSURL)probeURL;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setProbeURL:(NSURL *)probeURL;
- (void)setUseDNSServers:(NSArray *)useDNSServers;
@end

@implementation NEEvaluateConnectionRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeURL, 0);
  objc_storeStrong((id *)&self->_useDNSServers, 0);

  objc_storeStrong((id *)&self->_matchDomains, 0);
}

- (void)setProbeURL:(NSURL *)probeURL
{
}

- (NSURL)probeURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUseDNSServers:(NSArray *)useDNSServers
{
}

- (NSArray)useDNSServers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NEEvaluateConnectionRuleAction)action
{
  return self->_action;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NEEvaluateConnectionRule;
  v5 = [(NEEvaluateConnectionRule *)&v27 init];
  if (!v5) {
    goto LABEL_15;
  }
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41FD8]];
  if (isa_nsstring(v6))
  {
    if ([v6 isEqualToString:*MEMORY[0x1E4F42178]])
    {
      uint64_t v7 = 1;
LABEL_7:
      v5->_action = v7;
      goto LABEL_8;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F42180]])
    {
      uint64_t v7 = 2;
      goto LABEL_7;
    }
  }
LABEL_8:
  uint64_t v8 = *MEMORY[0x1E4F41FE0];
  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41FE0]];
  int v10 = isa_nsarray(v9);

  if (v10)
  {
    uint64_t v11 = [v4 objectForKeyedSubscript:v8];
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v11;
  }
  uint64_t v13 = *MEMORY[0x1E4F41FE8];
  v14 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41FE8]];
  int v15 = isa_nsarray(v14);

  if (v15)
  {
    uint64_t v16 = [v4 objectForKeyedSubscript:v13];
    useDNSServers = v5->_useDNSServers;
    v5->_useDNSServers = (NSArray *)v16;
  }
  uint64_t v18 = *MEMORY[0x1E4F41FF0];
  v19 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41FF0]];
  int v20 = isa_nsstring(v19);

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E4F1CB10];
    v22 = [v4 objectForKeyedSubscript:v18];
    uint64_t v23 = [v21 URLWithString:v22];
    probeURL = v5->_probeURL;
    v5->_probeURL = (NSURL *)v23;
  }
  v25 = v5;

LABEL_15:
  return v5;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  NEEvaluateConnectionRuleAction v4 = [(NEEvaluateConnectionRule *)self action];
  if (v4 == NEEvaluateConnectionRuleActionConnectIfNeeded)
  {
    v5 = (void *)MEMORY[0x1E4F42178];
  }
  else
  {
    if (v4 != NEEvaluateConnectionRuleActionNeverConnect) {
      goto LABEL_6;
    }
    v5 = (void *)MEMORY[0x1E4F42180];
  }
  [v3 setObject:*v5 forKeyedSubscript:*MEMORY[0x1E4F41FD8]];
LABEL_6:
  v6 = [(NEEvaluateConnectionRule *)self matchDomains];

  if (v6)
  {
    uint64_t v7 = [(NEEvaluateConnectionRule *)self matchDomains];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F41FE0]];
  }
  uint64_t v8 = [(NEEvaluateConnectionRule *)self useDNSServers];

  if (v8)
  {
    v9 = [(NEEvaluateConnectionRule *)self useDNSServers];
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F41FE8]];
  }
  int v10 = [(NEEvaluateConnectionRule *)self probeURL];

  if (v10)
  {
    uint64_t v11 = [(NEEvaluateConnectionRule *)self probeURL];
    v12 = [v11 absoluteString];
    [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F41FF0]];
  }
  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  NEEvaluateConnectionRuleAction v8 = [(NEEvaluateConnectionRule *)self action];
  if (v8 == NEEvaluateConnectionRuleActionConnectIfNeeded)
  {
    v9 = @"connect-if-needed";
  }
  else
  {
    if (v8 != NEEvaluateConnectionRuleActionNeverConnect) {
      goto LABEL_6;
    }
    v9 = @"never-connect";
  }
  [v7 appendPrettyObject:v9 withName:@"action" andIndent:v5 options:a4];
LABEL_6:
  int v10 = [(NEEvaluateConnectionRule *)self matchDomains];
  unint64_t v11 = a4 | 1;
  [v7 appendPrettyObject:v10 withName:@"matchDomains" andIndent:v5 options:v11];

  v12 = [(NEEvaluateConnectionRule *)self useDNSServers];
  [v7 appendPrettyObject:v12 withName:@"useDNSServers" andIndent:v5 options:v11];

  uint64_t v13 = [(NEEvaluateConnectionRule *)self probeURL];
  v14 = [v13 absoluteString];
  [v7 appendPrettyObject:v14 withName:@"probeURL" andIndent:v5 options:v11];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NEEvaluateConnectionRule *)self action] >= NEEvaluateConnectionRuleActionConnectIfNeeded
    && [(NEEvaluateConnectionRule *)self action] < (NEEvaluateConnectionRuleActionNeverConnect|NEEvaluateConnectionRuleActionConnectIfNeeded))
  {
    char v5 = 1;
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid connection rule action", v4);
    char v5 = 0;
  }
  uint64_t v6 = [(NEEvaluateConnectionRule *)self matchDomains];
  if (v6
    && (uint64_t v7 = (void *)v6,
        [(NEEvaluateConnectionRule *)self matchDomains],
        NEEvaluateConnectionRuleAction v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v7,
        v9))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    int v10 = [(NEEvaluateConnectionRule *)self matchDomains];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v26 + 1) + 8 * v14)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid connection rule domain", v4);
            char v5 = 0;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v12);
    }
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing connection rule match domains", v4);
    char v5 = 0;
  }
  int v15 = [(NEEvaluateConnectionRule *)self useDNSServers];

  if (v15)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v16 = [(NEEvaluateConnectionRule *)self useDNSServers];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v22 + 1) + 8 * v20)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid connection rule required DNS server", v4);
            char v5 = 0;
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v18);
    }
  }
  return v5 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEEvaluateConnectionRule action](self, "action"), @"Action");
  char v5 = [(NEEvaluateConnectionRule *)self matchDomains];
  [v4 encodeObject:v5 forKey:@"MatchDomains"];

  uint64_t v6 = [(NEEvaluateConnectionRule *)self useDNSServers];
  [v4 encodeObject:v6 forKey:@"UseDNSServers"];

  id v7 = [(NEEvaluateConnectionRule *)self probeURL];
  [v4 encodeObject:v7 forKey:@"ProbeURL"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEEvaluateConnectionRule allocWithZone:a3];
  char v5 = [(NEEvaluateConnectionRule *)self matchDomains];
  uint64_t v6 = [(NEEvaluateConnectionRule *)v4 initWithMatchDomains:v5 andAction:[(NEEvaluateConnectionRule *)self action]];

  id v7 = [(NEEvaluateConnectionRule *)self useDNSServers];
  [(NEEvaluateConnectionRule *)v6 setUseDNSServers:v7];

  NEEvaluateConnectionRuleAction v8 = [(NEEvaluateConnectionRule *)self probeURL];
  [(NEEvaluateConnectionRule *)v6 setProbeURL:v8];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (NEEvaluateConnectionRuleAction v5 = -[NEEvaluateConnectionRule action](self, "action"), v5 == [v4 action]))
  {
    uint64_t v6 = [(NEEvaluateConnectionRule *)self matchDomains];
    id v7 = [v4 matchDomains];
    if ([v6 isEqualToArray:v7])
    {
      NEEvaluateConnectionRuleAction v8 = [(NEEvaluateConnectionRule *)self useDNSServers];
      uint64_t v9 = [v4 useDNSServers];
      if ([v8 isEqualToArray:v9])
      {
        int v10 = [(NEEvaluateConnectionRule *)self probeURL];
        uint64_t v11 = [v4 probeURL];
        char v12 = [v10 isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (NEEvaluateConnectionRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NEEvaluateConnectionRule;
  NEEvaluateConnectionRuleAction v5 = [(NEEvaluateConnectionRule *)&v19 init];
  if (v5)
  {
    v5->_action = (int)[v4 decodeInt32ForKey:@"Action"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    NEEvaluateConnectionRuleAction v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MatchDomains"];
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"UseDNSServers"];
    useDNSServers = v5->_useDNSServers;
    v5->_useDNSServers = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProbeURL"];
    probeURL = v5->_probeURL;
    v5->_probeURL = (NSURL *)v16;
  }
  return v5;
}

- (NEEvaluateConnectionRule)initWithMatchDomains:(NSArray *)domains andAction:(NEEvaluateConnectionRuleAction)action
{
  uint64_t v6 = domains;
  v12.receiver = self;
  v12.super_class = (Class)NEEvaluateConnectionRule;
  uint64_t v7 = [(NEEvaluateConnectionRule *)&v12 init];
  NEEvaluateConnectionRuleAction v8 = v7;
  if (v7)
  {
    v7->_action = action;
    uint64_t v9 = [(NSArray *)v6 copy];
    matchDomains = v8->_matchDomains;
    v8->_matchDomains = (NSArray *)v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end