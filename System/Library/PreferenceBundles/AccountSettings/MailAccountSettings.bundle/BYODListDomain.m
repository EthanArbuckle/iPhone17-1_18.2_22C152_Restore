@interface BYODListDomain
- (BOOL)enablePurchaseDomain;
- (BOOL)iCloudPlusSubscriptionExpired;
- (BOOL)showWelcomeScreen;
- (BYODListDomain)initWithDictionary:(id)a3;
- (NSArray)domains;
- (NSString)domainPurchaseProviderName;
- (NSString)iCloudPlusSubscriptionEndTimestamp;
- (id)domainFromDomainName:(id)a3;
- (int64_t)maxDomainsAllowed;
- (void)setDomainPurchaseProviderName:(id)a3;
- (void)setDomains:(id)a3;
- (void)setEnablePurchaseDomain:(BOOL)a3;
- (void)setICloudPlusSubscriptionEndTimestamp:(id)a3;
- (void)setICloudPlusSubscriptionExpired:(BOOL)a3;
- (void)setMaxDomainsAllowed:(int64_t)a3;
- (void)setShowWelcomeScreen:(BOOL)a3;
@end

@implementation BYODListDomain

- (BYODListDomain)initWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BYODListDomain;
  v5 = [(BYODListDomain *)&v29 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"maxDomainsAllowed"];
    v5->_maxDomainsAllowed = (int64_t)[v6 integerValue];

    v7 = [v4 objectForKeyedSubscript:@"showWelcomeScreen"];
    v5->_showWelcomeScreen = [v7 BOOLValue];

    v8 = [v4 objectForKeyedSubscript:@"enablePurchaseDomain"];
    v5->_enablePurchaseDomain = [v8 BOOLValue];

    v9 = [v4 objectForKeyedSubscript:@"iCloudPlusSubscriptionExpired"];
    v5->_iCloudPlusSubscriptionExpired = [v9 BOOLValue];

    uint64_t v10 = [v4 objectForKeyedSubscript:@"iCloudPlusSubscriptionEndDate"];
    iCloudPlusSubscriptionEndTimestamp = v5->_iCloudPlusSubscriptionEndTimestamp;
    v5->_iCloudPlusSubscriptionEndTimestamp = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"domainPurchaseProviderName"];
    domainPurchaseProviderName = v5->_domainPurchaseProviderName;
    v5->_domainPurchaseProviderName = (NSString *)v12;

    v14 = [v4 objectForKeyedSubscript:@"domains"];
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
          v21 = [BYODDomain alloc];
          v22 = -[BYODDomain initWithDictionary:](v21, "initWithDictionary:", v20, (void)v25);
          [(NSArray *)v15 addObject:v22];

          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }

    domains = v5->_domains;
    v5->_domains = v15;
  }
  return v5;
}

- (id)domainFromDomainName:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_domains;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "name", (void)v13);
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)maxDomainsAllowed
{
  return self->_maxDomainsAllowed;
}

- (void)setMaxDomainsAllowed:(int64_t)a3
{
  self->_maxDomainsAllowed = a3;
}

- (BOOL)showWelcomeScreen
{
  return self->_showWelcomeScreen;
}

- (void)setShowWelcomeScreen:(BOOL)a3
{
  self->_showWelcomeScreen = a3;
}

- (BOOL)enablePurchaseDomain
{
  return self->_enablePurchaseDomain;
}

- (void)setEnablePurchaseDomain:(BOOL)a3
{
  self->_enablePurchaseDomain = a3;
}

- (NSArray)domains
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDomains:(id)a3
{
}

- (BOOL)iCloudPlusSubscriptionExpired
{
  return self->_iCloudPlusSubscriptionExpired;
}

- (void)setICloudPlusSubscriptionExpired:(BOOL)a3
{
  self->_iCloudPlusSubscriptionExpired = a3;
}

- (NSString)iCloudPlusSubscriptionEndTimestamp
{
  return self->_iCloudPlusSubscriptionEndTimestamp;
}

- (void)setICloudPlusSubscriptionEndTimestamp:(id)a3
{
}

- (NSString)domainPurchaseProviderName
{
  return self->_domainPurchaseProviderName;
}

- (void)setDomainPurchaseProviderName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainPurchaseProviderName, 0);
  objc_storeStrong((id *)&self->_iCloudPlusSubscriptionEndTimestamp, 0);

  objc_storeStrong((id *)&self->_domains, 0);
}

@end