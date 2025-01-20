@interface AKTokenCache
- (AKTokenCache)init;
- (NSMutableDictionary)tokenCache;
- (id)fetchWithContext:(id)a3;
- (void)clearAllTokensForAltDSID:(id)a3;
- (void)deleteWithContext:(id)a3;
- (void)setTokenCache:(id)a3;
- (void)updateWithContext:(id)a3;
@end

@implementation AKTokenCache

- (AKTokenCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKTokenCache;
  v2 = [(AKTokenCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    tokenCache = v2->_tokenCache;
    v2->_tokenCache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)fetchWithContext:(id)a3
{
  id v4 = a3;
  tokenCache = self->_tokenCache;
  objc_super v6 = [v4 altDSID];
  v7 = [(NSMutableDictionary *)tokenCache objectForKeyedSubscript:v6];

  if ([v7 count])
  {
    v8 = [v4 tokenIdentifier];
    v9 = [v7 objectForKeyedSubscript:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateWithContext:(id)a3
{
  id v4 = a3;
  tokenCache = self->_tokenCache;
  id v16 = v4;
  objc_super v6 = [v4 altDSID];
  v7 = [(NSMutableDictionary *)tokenCache objectForKeyedSubscript:v6];

  if (!v7)
  {
    v8 = +[NSMutableDictionary dictionary];
    v9 = self->_tokenCache;
    v10 = [v16 altDSID];
    [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v10];
  }
  v11 = [v16 token];
  v12 = self->_tokenCache;
  v13 = [v16 altDSID];
  v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];
  v15 = [v16 tokenIdentifier];
  [v14 setObject:v11 forKeyedSubscript:v15];
}

- (void)deleteWithContext:(id)a3
{
  id v4 = a3;
  tokenCache = self->_tokenCache;
  id v12 = v4;
  objc_super v6 = [v4 altDSID];
  v7 = [(NSMutableDictionary *)tokenCache objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = self->_tokenCache;
    v9 = [v12 altDSID];
    v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
    v11 = [v12 tokenIdentifier];
    [v10 setObject:0 forKeyedSubscript:v11];
  }
}

- (void)clearAllTokensForAltDSID:(id)a3
{
}

- (NSMutableDictionary)tokenCache
{
  return self->_tokenCache;
}

- (void)setTokenCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end