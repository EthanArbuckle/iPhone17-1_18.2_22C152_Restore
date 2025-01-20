@interface ENCredentialStore
+ (id)loadCredentialsFromAppDefaults;
- (ENCredentialStore)init;
- (ENCredentialStore)initWithCoder:(id)a3;
- (NSMutableDictionary)store;
- (id)credentialsForHost:(id)a3;
- (void)addCredentials:(id)a3;
- (void)clearAllCredentials;
- (void)encodeWithCoder:(id)a3;
- (void)removeCredentials:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation ENCredentialStore

- (void).cxx_destruct
{
}

- (void)setStore:(id)a3
{
}

- (NSMutableDictionary)store
{
  return self->_store;
}

- (ENCredentialStore)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENCredentialStore;
  v5 = [(ENCredentialStore *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"store"];
    [(ENCredentialStore *)v5 setStore:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ENCredentialStore *)self store];
  [v4 encodeObject:v5 forKey:@"store"];
}

- (void)clearAllCredentials
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(ENCredentialStore *)self store];
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) deleteFromKeychain];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9 = [(ENCredentialStore *)self store];
  [v9 removeAllObjects];
}

- (void)removeCredentials:(id)a3
{
  id v4 = a3;
  [v4 deleteFromKeychain];
  id v6 = [(ENCredentialStore *)self store];
  uint64_t v5 = [v4 host];

  [v6 removeObjectForKey:v5];
}

- (id)credentialsForHost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ENCredentialStore *)self store];
  id v6 = [v5 objectForKey:v4];

  if (!v6
    || [v6 areValid]
    && ([v6 authenticationToken], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    id v8 = v6;
  }
  else
  {
    [(ENCredentialStore *)self removeCredentials:v6];
    id v8 = 0;
  }

  return v8;
}

- (void)addCredentials:(id)a3
{
  id v6 = a3;
  if ([v6 saveToKeychain])
  {
    id v4 = [(ENCredentialStore *)self store];
    uint64_t v5 = [v6 host];
    [v4 setObject:v6 forKey:v5];
  }
}

- (ENCredentialStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)ENCredentialStore;
  v2 = [(ENCredentialStore *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(ENCredentialStore *)v2 setStore:v3];
  }
  return v2;
}

+ (id)loadCredentialsFromAppDefaults
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 objectForKey:@"EvernoteCredentials"];
  if (v3)
  {
    id v4 = [MEMORY[0x263F08928] unarchiveObjectWithData:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end