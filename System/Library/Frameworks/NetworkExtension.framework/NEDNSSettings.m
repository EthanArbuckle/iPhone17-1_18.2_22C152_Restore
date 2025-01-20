@interface NEDNSSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)matchDomainsNoSearch;
- (BOOL)useForAllDomains;
- (NEDNSProtocol)dnsProtocol;
- (NEDNSSettings)initWithCoder:(id)a3;
- (NEDNSSettings)initWithServers:(NSArray *)servers;
- (NSArray)matchDomains;
- (NSArray)searchDomains;
- (NSArray)servers;
- (NSString)domainName;
- (NSUUID)proxyAgentUUID;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDomainName:(NSString *)domainName;
- (void)setMatchDomains:(NSArray *)matchDomains;
- (void)setMatchDomainsNoSearch:(BOOL)matchDomainsNoSearch;
- (void)setProxyAgentUUID:(id)a3;
- (void)setSearchDomains:(NSArray *)searchDomains;
@end

@implementation NEDNSSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyAgentUUID, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_searchDomains, 0);

  objc_storeStrong((id *)&self->_servers, 0);
}

- (void)setProxyAgentUUID:(id)a3
{
}

- (NSUUID)proxyAgentUUID
{
  return self->_proxyAgentUUID;
}

- (void)setMatchDomainsNoSearch:(BOOL)matchDomainsNoSearch
{
  self->_matchDomainsNoSearch = matchDomainsNoSearch;
}

- (BOOL)matchDomainsNoSearch
{
  return self->_matchDomainsNoSearch;
}

- (void)setMatchDomains:(NSArray *)matchDomains
{
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDomainName:(NSString *)domainName
{
}

- (NSString)domainName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchDomains:(NSArray *)searchDomains
{
}

- (NSArray)searchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)servers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)useForAllDomains
{
  v3 = [(NEDNSSettings *)self matchDomains];
  if (v3)
  {
    v4 = [(NEDNSSettings *)self matchDomains];
    if ([v4 count])
    {
      v5 = [(NEDNSSettings *)self matchDomains];
      if ([v5 count] == 1)
      {
        v6 = [(NEDNSSettings *)self matchDomains];
        v7 = [v6 objectAtIndexedSubscript:0];
        BOOL v8 = [v7 length] == 0;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)NEDNSSettings;
  v5 = [(NEDNSSettings *)&v34 init];
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F41BC0];
    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41BC0]];
    int v8 = isa_nsarray(v7);

    if (v8)
    {
      v9 = [v4 objectForKeyedSubscript:v6];
      uint64_t v10 = [v9 copy];
      servers = v5->_servers;
      v5->_servers = (NSArray *)v10;
    }
    uint64_t v12 = *MEMORY[0x1E4F41BB8];
    v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41BB8]];
    int v14 = isa_nsarray(v13);

    if (v14)
    {
      v15 = [v4 objectForKeyedSubscript:v12];
      uint64_t v16 = [v15 copy];
      searchDomains = v5->_searchDomains;
      v5->_searchDomains = (NSArray *)v16;
    }
    uint64_t v18 = *MEMORY[0x1E4F41BB0];
    v19 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41BB0]];
    int v20 = isa_nsstring(v19);

    if (v20)
    {
      uint64_t v21 = [v4 objectForKeyedSubscript:v18];
      domainName = v5->_domainName;
      v5->_domainName = (NSString *)v21;
    }
    uint64_t v23 = *MEMORY[0x1E4F41BD8];
    v24 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41BD8]];
    int v25 = isa_nsarray(v24);

    if (v25)
    {
      v26 = [v4 objectForKeyedSubscript:v23];
      uint64_t v27 = [v26 copy];
      matchDomains = v5->_matchDomains;
      v5->_matchDomains = (NSArray *)v27;
    }
    uint64_t v29 = *MEMORY[0x1E4F41BE0];
    v30 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41BE0]];
    int v31 = isa_nsnumber(v30);

    if (v31)
    {
      v32 = [v4 objectForKeyedSubscript:v29];
      v5->_matchDomainsNoSearch = [v32 BOOLValue];
    }
  }

  return v5;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NEDNSSettings *)self servers];

  if (v4)
  {
    v5 = [(NEDNSSettings *)self servers];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F41BC0]];
  }
  uint64_t v6 = [(NEDNSSettings *)self searchDomains];

  if (v6)
  {
    v7 = [(NEDNSSettings *)self searchDomains];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F41BB8]];
  }
  int v8 = [(NEDNSSettings *)self domainName];

  if (v8)
  {
    v9 = [(NEDNSSettings *)self domainName];
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F41BB0]];
  }
  uint64_t v10 = [(NEDNSSettings *)self matchDomains];

  if (v10)
  {
    v11 = [(NEDNSSettings *)self matchDomains];
    [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F41BD8]];
  }
  if ([(NEDNSSettings *)self matchDomainsNoSearch]) {
    [v3 setObject:&unk_1EF08CFE8 forKeyedSubscript:*MEMORY[0x1E4F41BE0]];
  }
  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  unint64_t v8 = [(NEDNSSettings *)self dnsProtocol] - 1;
  if (v8 <= 2) {
    [v7 appendPrettyObject:off_1E598F828[v8] withName:@"protocol" andIndent:v5 options:a4];
  }
  v9 = [(NEDNSSettings *)self servers];
  [v7 appendPrettyObject:v9 withName:@"server" andIndent:v5 options:a4 | 1];

  uint64_t v10 = [(NEDNSSettings *)self domainName];
  [v7 appendPrettyObject:v10 withName:@"domainName" andIndent:v5 options:a4 | 1];

  v11 = [(NEDNSSettings *)self searchDomains];
  [v7 appendPrettyObject:v11 withName:@"searchDomains" andIndent:v5 options:a4 | 1];

  uint64_t v12 = [(NEDNSSettings *)self matchDomains];
  [v7 appendPrettyObject:v12 withName:@"matchDomains" andIndent:v5 options:a4 | 1];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEDNSSettings matchDomainsNoSearch](self, "matchDomainsNoSearch"), @"matchDomainsNoSearch", v5, a4);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NEDNSSettings *)self isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = [(NEDNSSettings *)self servers];
    if (v5)
    {
    }
    else
    {
      uint64_t v6 = [(NEDNSSettings *)self searchDomains];

      if (!v6)
      {
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing both DNS servers and DNS search domains", v4);
        char v7 = 0;
        goto LABEL_6;
      }
    }
  }
  char v7 = 1;
LABEL_6:
  unint64_t v8 = [(NEDNSSettings *)self servers];

  if (!v8) {
    goto LABEL_21;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v24 = self;
  v9 = [(NEDNSSettings *)self servers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v9);
      }
      int v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      if ((isa_nsstring(v14) & 1) == 0)
      {
        uint64_t v16 = @"Non-string for DNS server";
        goto LABEL_17;
      }
      int v30 = 0;
      v29[0] = 0;
      v29[1] = 0;
      id v15 = v14;
      if (!inet_pton(2, (const char *)[v15 UTF8String], &v30)
        && !inet_pton(30, (const char *)[v15 UTF8String], v29))
      {
        uint64_t v16 = @"Invalid DNS server";
LABEL_17:
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v16, v4);
        char v7 = 0;
        continue;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  }
  while (v11);
LABEL_20:

  self = v24;
LABEL_21:
  v17 = [(NEDNSSettings *)self searchDomains];

  if (v17)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v18 = [(NEDNSSettings *)self searchDomains];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v25 + 1) + 8 * j)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Non-string for DNS search domain", v4);
            char v7 = 0;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v20);
    }
  }
  return v7 & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(NEDNSSettings *)self servers];
  uint64_t v6 = (void *)[v4 initWithServers:v5];

  [v6 setSearchDomains:self->_searchDomains];
  [v6 setDomainName:self->_domainName];
  [v6 setMatchDomains:self->_matchDomains];
  [v6 setMatchDomainsNoSearch:self->_matchDomainsNoSearch];
  [v6 setProxyAgentUUID:self->_proxyAgentUUID];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEDNSSettings *)self servers];
  [v4 encodeObject:v5 forKey:@"Servers"];

  uint64_t v6 = [(NEDNSSettings *)self searchDomains];
  [v4 encodeObject:v6 forKey:@"SearchDomains"];

  char v7 = [(NEDNSSettings *)self domainName];
  [v4 encodeObject:v7 forKey:@"domainName"];

  unint64_t v8 = [(NEDNSSettings *)self matchDomains];
  [v4 encodeObject:v8 forKey:@"matchDomains"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEDNSSettings matchDomainsNoSearch](self, "matchDomainsNoSearch"), @"matchDomainsNoSearch");
  id v9 = [(NEDNSSettings *)self proxyAgentUUID];
  [v4 encodeObject:v9 forKey:@"ProxyAgentUUID"];
}

- (NEDNSSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NEDNSSettings;
  uint64_t v5 = [(NEDNSSettings *)&v26 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    unint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Servers"];
    servers = v5->_servers;
    v5->_servers = (NSArray *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"SearchDomains"];
    searchDomains = v5->_searchDomains;
    v5->_searchDomains = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainName"];
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v16;

    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"matchDomains"];
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v21;

    v5->_matchDomainsNoSearch = [v4 decodeBoolForKey:@"matchDomainsNoSearch"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyAgentUUID"];
    proxyAgentUUID = v5->_proxyAgentUUID;
    v5->_proxyAgentUUID = (NSUUID *)v23;
  }
  return v5;
}

- (NEDNSSettings)initWithServers:(NSArray *)servers
{
  id v4 = servers;
  v9.receiver = self;
  v9.super_class = (Class)NEDNSSettings;
  uint64_t v5 = [(NEDNSSettings *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(NSArray *)v4 copy];
    uint64_t v7 = v5->_servers;
    v5->_servers = (NSArray *)v6;
  }
  return v5;
}

- (NEDNSProtocol)dnsProtocol
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end