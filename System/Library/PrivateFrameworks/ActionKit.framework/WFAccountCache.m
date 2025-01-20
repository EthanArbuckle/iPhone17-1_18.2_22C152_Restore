@interface WFAccountCache
- (NSCache)cache;
- (WFAccountCache)init;
- (id)accountsForService:(id)a3;
- (id)numberOfAccountsForService:(id)a3;
- (void)clearCacheForService:(id)a3;
- (void)setAccounts:(id)a3 forService:(id)a4;
- (void)setNumberOfAccounts:(id)a3 forService:(id)a4;
@end

@implementation WFAccountCache

- (void).cxx_destruct
{
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)clearCacheForService:(id)a3
{
  cache = self->_cache;
  id v5 = a3;
  v6 = [v5 stringByAppendingString:@"-accounts"];
  [(NSCache *)cache removeObjectForKey:v6];

  v7 = self->_cache;
  id v8 = [v5 stringByAppendingString:@"-count"];

  [(NSCache *)v7 removeObjectForKey:v8];
}

- (void)setAccounts:(id)a3 forService:(id)a4
{
  cache = self->_cache;
  id v6 = a3;
  id v7 = [a4 stringByAppendingString:@"-accounts"];
  [(NSCache *)cache setObject:v6 forKey:v7];
}

- (void)setNumberOfAccounts:(id)a3 forService:(id)a4
{
  cache = self->_cache;
  id v6 = a3;
  id v7 = [a4 stringByAppendingString:@"-count"];
  [(NSCache *)cache setObject:v6 forKey:v7];
}

- (id)accountsForService:(id)a3
{
  cache = self->_cache;
  v4 = [a3 stringByAppendingString:@"-accounts"];
  id v5 = [(NSCache *)cache objectForKey:v4];

  return v5;
}

- (id)numberOfAccountsForService:(id)a3
{
  id v4 = a3;
  cache = self->_cache;
  id v6 = [v4 stringByAppendingString:@"-count"];
  id v7 = [(NSCache *)cache objectForKey:v6];

  if (!v7)
  {
    id v8 = [(WFAccountCache *)self accountsForService:v4];
    v9 = v8;
    if (v8)
    {
      id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (WFAccountCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFAccountCache;
  v2 = [(WFAccountCache *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSCache *)v3;

    id v5 = v2;
  }

  return v2;
}

@end