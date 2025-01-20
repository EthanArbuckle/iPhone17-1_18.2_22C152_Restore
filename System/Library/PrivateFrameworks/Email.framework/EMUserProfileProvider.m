@interface EMUserProfileProvider
+ (BOOL)doesAddressList:(id)a3 containAddressInSet:(id)a4;
- (BOOL)_isMyEmailAddressContainedInAddressStrings:(id)a3;
- (BOOL)hasAccountConfigured;
- (BOOL)hasAccountsConfigured;
- (BOOL)isMyEmailAddressContainedInAddressList:(id)a3;
- (CNContactStore)contactStore;
- (EMUserProfileProvider)init;
- (NSDictionary)cache;
- (NSMutableArray)knownToBeMyEmail;
- (NSMutableArray)knownToNotBeMyEmail;
- (NSSet)accountsEmailAddresses;
- (NSSet)allEmailAddresses;
- (NSSet)contactEmailAddresses;
- (id)_accountsEmailAddresses;
- (id)_contactEmailAddresses;
- (id)contact;
- (id)contactWithKeysToFetch:(id)a3;
- (void)refreshCachedValues;
- (void)setCache:(id)a3;
- (void)setContactStore:(id)a3;
- (void)waitForOutstandingCacheRefreshes;
@end

@implementation EMUserProfileProvider

id __47__EMUserProfileProvider__contactEmailAddresses__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  return v2;
}

void __44__EMUserProfileProvider_refreshCachedValues__block_invoke(uint64_t a1)
{
  id obj = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 32) hasAccountsConfigured])
  {
    v2 = [*(id *)(a1 + 32) _accountsEmailAddresses];
    [obj setObject:v2 forKeyedSubscript:@"_account"];

    v3 = [*(id *)(a1 + 32) _contactEmailAddresses];
    [obj setObject:v3 forKeyedSubscript:@"_contact"];

    id v4 = objc_alloc_init(MEMORY[0x1E4F605B8]);
    v5 = [obj objectForKeyedSubscript:@"_account"];
    [v4 unionSet:v5];

    v6 = [obj objectForKeyedSubscript:@"_contact"];
    [v4 unionSet:v6];

    [obj setObject:v4 forKeyedSubscript:@"_all"];
  }
  v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock(v7);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), obj);
  --*(_DWORD *)(*(void *)(a1 + 32) + 24);
  v8 = [*(id *)(a1 + 32) knownToBeMyEmail];
  [v8 removeAllObjects];

  v9 = [*(id *)(a1 + 32) knownToNotBeMyEmail];
  [v9 removeAllObjects];

  os_unfair_lock_unlock(v7);
}

- (NSMutableArray)knownToNotBeMyEmail
{
  return self->_knownToNotBeMyEmail;
}

- (NSMutableArray)knownToBeMyEmail
{
  return self->_knownToBeMyEmail;
}

- (id)_contactEmailAddresses
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F605B8]);
  id v4 = [(EMUserProfileProvider *)self contact];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 emailAddresses];
    v7 = objc_msgSend(v6, "ef_map:", &__block_literal_global_29);

    [v3 addObjectsFromArray:v7];
  }

  return v3;
}

- (id)contact
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4F1ADC8];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v4 = [(EMUserProfileProvider *)self contactWithKeysToFetch:v3];

  return v4;
}

- (id)contactWithKeysToFetch:(id)a3
{
  id v4 = a3;
  v5 = [(EMUserProfileProvider *)self contactStore];
  v6 = [v5 _crossPlatformUnifiedMeContactWithKeysToFetch:v4 error:0];

  return v6;
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    objc_msgSend(MEMORY[0x1E4F1B980], "em_authorizedContactStore");
    id v4 = (CNContactStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (EMUserProfileProvider)init
{
  v15.receiver = self;
  v15.super_class = (Class)EMUserProfileProvider;
  v2 = [(EMUserProfileProvider *)&v15 init];
  id v3 = v2;
  if (v2)
  {
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mail.user-profile", v5);
    cacheQueue = v3->_cacheQueue;
    v3->_cacheQueue = (OS_dispatch_queue *)v6;

    v3->_outstandingCacheRefreshes = 0;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    knownToBeMyEmail = v3->_knownToBeMyEmail;
    v3->_knownToBeMyEmail = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    knownToNotBeMyEmail = v3->_knownToNotBeMyEmail;
    v3->_knownToNotBeMyEmail = (NSMutableArray *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v3 selector:sel__accountsChanged_ name:*MEMORY[0x1E4F60630] object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v3 selector:sel__contactsChanged_ name:*MEMORY[0x1E4F1AF80] object:0];
  }
  return v3;
}

- (NSSet)allEmailAddresses
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  id v4 = [(NSDictionary *)self->_cache objectForKeyedSubscript:@"_all"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  v7 = v6;

  os_unfair_lock_unlock(p_cacheLock);
  return (NSSet *)v7;
}

- (void)refreshCachedValues
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  int outstandingCacheRefreshes = self->_outstandingCacheRefreshes;
  if (outstandingCacheRefreshes > 1)
  {
    os_unfair_lock_unlock(p_cacheLock);
  }
  else
  {
    self->_int outstandingCacheRefreshes = outstandingCacheRefreshes + 1;
    os_unfair_lock_unlock(p_cacheLock);
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__EMUserProfileProvider_refreshCachedValues__block_invoke;
    block[3] = &unk_1E63E26B0;
    block[4] = self;
    dispatch_async(cacheQueue, block);
  }
}

+ (BOOL)doesAddressList:(id)a3 containAddressInSet:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "emailAddressValue", (void)v18);
        v13 = [v12 simpleAddress];
        v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [v11 stringValue];
        }
        v16 = v15;

        if (v16 && ([v6 containsObject:v16] & 1) != 0)
        {

          LOBYTE(v8) = 1;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v8;
}

- (NSSet)accountsEmailAddresses
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  id v4 = [(NSDictionary *)self->_cache objectForKeyedSubscript:@"_account"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v7 = v6;

  os_unfair_lock_unlock(p_cacheLock);
  return (NSSet *)v7;
}

- (NSSet)contactEmailAddresses
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  id v4 = [(NSDictionary *)self->_cache objectForKeyedSubscript:@"_contact"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v7 = v6;

  os_unfair_lock_unlock(p_cacheLock);
  return (NSSet *)v7;
}

- (BOOL)isMyEmailAddressContainedInAddressList:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "ef_all:", &__block_literal_global_59))
  {
    BOOL v5 = [(EMUserProfileProvider *)self _isMyEmailAddressContainedInAddressStrings:v4];
  }
  else
  {
    id v6 = [(EMUserProfileProvider *)self allEmailAddresses];
    BOOL v5 = +[EMUserProfileProvider doesAddressList:v4 containAddressInSet:v6];
  }
  return v5;
}

uint64_t __64__EMUserProfileProvider_isMyEmailAddressContainedInAddressList___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isMyEmailAddressContainedInAddressStrings:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = v4;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_cacheLock);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __68__EMUserProfileProvider__isMyEmailAddressContainedInAddressStrings___block_invoke;
    v29[3] = &unk_1E63E6CB0;
    v29[4] = self;
    if (objc_msgSend(v4, "ef_any:", v29))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __68__EMUserProfileProvider__isMyEmailAddressContainedInAddressStrings___block_invoke_2;
      v28[3] = &unk_1E63E6CB0;
      v28[4] = self;
      id v6 = objc_msgSend(v4, "ef_filter:", v28);
      v22 = v6;
      if ([v6 count])
      {
        id v7 = [(NSDictionary *)self->_cache objectForKeyedSubscript:@"_all"];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v8 = v6;
        uint64_t v5 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v5)
        {
          uint64_t v9 = *(void *)v25;
          while (2)
          {
            for (uint64_t i = 0; i != v5; ++i)
            {
              if (*(void *)v25 != v9) {
                objc_enumerationMutation(v8);
              }
              id v11 = *(id *)(*((void *)&v24 + 1) + 8 * i);
              v12 = [v11 emailAddressValue];
              v13 = [v12 simpleAddress];
              v14 = v13;
              if (v13)
              {
                id v15 = v13;
              }
              else
              {
                id v15 = [v11 stringValue];
              }
              v16 = v15;

              if (v16 && [v7 containsObject:v16])
              {
                long long v18 = [(EMUserProfileProvider *)self knownToBeMyEmail];
                [v18 addObject:v11];

                LOBYTE(v5) = 1;
                goto LABEL_21;
              }
              v17 = [(EMUserProfileProvider *)self knownToNotBeMyEmail];
              [v17 addObject:v11];
            }
            uint64_t v5 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
            if (v5) {
              continue;
            }
            break;
          }
        }
LABEL_21:

        long long v19 = [(EMUserProfileProvider *)self knownToBeMyEmail];
        objc_msgSend(v19, "ef_trimToCount:fromStart:", 30, 1);

        long long v20 = [(EMUserProfileProvider *)self knownToNotBeMyEmail];
        objc_msgSend(v20, "ef_trimToCount:fromStart:", 30, 1);
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
    os_unfair_lock_unlock(&self->_cacheLock);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

uint64_t __68__EMUserProfileProvider__isMyEmailAddressContainedInAddressStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) knownToBeMyEmail];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

uint64_t __68__EMUserProfileProvider__isMyEmailAddressContainedInAddressStrings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) knownToNotBeMyEmail];
  uint64_t v5 = [v4 containsObject:v3] ^ 1;

  return v5;
}

- (void)waitForOutstandingCacheRefreshes
{
}

- (id)_accountsEmailAddresses
{
}

- (BOOL)hasAccountConfigured
{
}

- (NSDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (BOOL)hasAccountsConfigured
{
  return self->_hasAccountsConfigured;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_knownToNotBeMyEmail, 0);
  objc_storeStrong((id *)&self->_knownToBeMyEmail, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

@end