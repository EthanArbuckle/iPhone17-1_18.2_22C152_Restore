@interface BYODDomainOptionsList
- (BOOL)isAvailable;
- (BOOL)isKeywordSearch;
- (BYODDomainOption)searchedDomain;
- (BYODDomainOptionsList)initWithDictionary:(id)a3;
- (NSArray)suggestedDomains;
- (NSString)dnsProviderName;
- (void)setDnsProviderName:(id)a3;
- (void)setIsAvailable:(BOOL)a3;
- (void)setIsKeywordSearch:(BOOL)a3;
- (void)setSearchedDomain:(id)a3;
- (void)setSuggestedDomains:(id)a3;
@end

@implementation BYODDomainOptionsList

- (BYODDomainOptionsList)initWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BYODDomainOptionsList;
  v5 = [(BYODDomainOptionsList *)&v29 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isAvailable"];
    v5->_isAvailable = [v6 BOOLValue];

    v7 = [v4 objectForKeyedSubscript:@"isKeywordSearch"];
    v5->_isKeywordSearch = [v7 BOOLValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"dnsProviderName"];
    dnsProviderName = v5->_dnsProviderName;
    v5->_dnsProviderName = (NSString *)v8;

    v10 = [BYODDomainOption alloc];
    v11 = [v4 objectForKeyedSubscript:@"searchedDomain"];
    v12 = [(BYODDomainOption *)v10 initWithDictionary:v11];
    searchedDomain = v5->_searchedDomain;
    v5->_searchedDomain = v12;

    v14 = [v4 objectForKeyedSubscript:@"suggestedDomains"];
    v15 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v14;
    id v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v19);
          v21 = [BYODDomainOption alloc];
          v22 = -[BYODDomainOption initWithDictionary:](v21, "initWithDictionary:", v20, (void)v25);
          [(NSArray *)v15 addObject:v22];

          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }

    suggestedDomains = v5->_suggestedDomains;
    v5->_suggestedDomains = v15;
  }
  return v5;
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)isKeywordSearch
{
  return self->_isKeywordSearch;
}

- (void)setIsKeywordSearch:(BOOL)a3
{
  self->_isKeywordSearch = a3;
}

- (NSString)dnsProviderName
{
  return self->_dnsProviderName;
}

- (void)setDnsProviderName:(id)a3
{
}

- (BYODDomainOption)searchedDomain
{
  return self->_searchedDomain;
}

- (void)setSearchedDomain:(id)a3
{
}

- (NSArray)suggestedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSuggestedDomains:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedDomains, 0);
  objc_storeStrong((id *)&self->_searchedDomain, 0);

  objc_storeStrong((id *)&self->_dnsProviderName, 0);
}

@end