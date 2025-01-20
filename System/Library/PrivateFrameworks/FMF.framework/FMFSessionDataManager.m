@interface FMFSessionDataManager
+ (id)sharedInstance;
- (NSMutableDictionary)locationsCache;
- (NSSet)fences;
- (NSSet)followers;
- (NSSet)following;
- (NSSet)locations;
- (id)favoritesOrdered;
- (id)followerForHandle:(id)a3;
- (id)followingForHandle:(id)a3;
- (id)locationForHandle:(id)a3;
- (id)offerExpirationForHandle:(id)a3 groupId:(id)a4;
- (void)abDidChange;
- (void)abPreferencesDidChange;
- (void)setFences:(id)a3;
- (void)setFollowers:(id)a3;
- (void)setFollowing:(id)a3;
- (void)setLocations:(id)a3;
- (void)setLocationsCache:(id)a3;
@end

@implementation FMFSessionDataManager

- (void)setFollowers:(id)a3
{
  v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  followers = obj->_followers;
  obj->_followers = v4;

  objc_sync_exit(obj);
}

- (void)setFences:(id)a3
{
  v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  fences = obj->_fences;
  obj->_fences = v4;

  objc_sync_exit(obj);
}

- (void)setLocations:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [MEMORY[0x263EFF9C0] set];
  v21 = v4;
  v7 = (void *)[v4 mutableCopy];
  v8 = [MEMORY[0x263EFF9A0] dictionary];
  [(FMFSessionDataManager *)v5 setLocationsCache:v8];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v14 = [(NSSet *)v5->_locations member:v13];
        v15 = [v13 handle];
        v16 = [v15 serverId];

        if (!v16)
        {
          v18 = LogCategory_Daemon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = [v14 handle];
            [(FMFSessionDataManager *)v19 setLocations:v18];
          }

          goto LABEL_16;
        }
        if (v14)
        {
          [v14 updateLocationForCache:v13];
          [(NSSet *)v6 addObject:v14];
          v17 = [(FMFSessionDataManager *)v5 locationsCache];
          [v17 setObject:v14 forKey:v16];
        }
        else
        {
          [(NSSet *)v6 addObject:v13];
          v17 = [(FMFSessionDataManager *)v5 locationsCache];
          [v17 setObject:v13 forKey:v16];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  locations = v5->_locations;
  v5->_locations = v6;

  objc_sync_exit(v5);
}

- (void)setLocationsCache:(id)a3
{
}

+ (id)sharedInstance
{
  if (sharedInstance_dispatch_predicate_0 != -1) {
    dispatch_once(&sharedInstance_dispatch_predicate_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance__instance_0;

  return v2;
}

- (void)setFollowing:(id)a3
{
  id v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  following = obj->_following;
  obj->_following = v4;

  objc_sync_exit(obj);
}

void __39__FMFSessionDataManager_sharedInstance__block_invoke()
{
  v0 = LogCategory_Daemon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_20AD87000, v0, OS_LOG_TYPE_INFO, "Creating shared instance of FMFSessionDataManager", v3, 2u);
  }

  v1 = objc_alloc_init(FMFSessionDataManager);
  v2 = (void *)sharedInstance__instance_0;
  sharedInstance__instance_0 = (uint64_t)v1;
}

- (id)followerForHandle:(id)a3
{
  id v4 = a3;
  v5 = [(FMFSessionDataManager *)self followers];
  v6 = [v5 member:v4];

  return v6;
}

- (id)followingForHandle:(id)a3
{
  id v4 = a3;
  v5 = [(FMFSessionDataManager *)self following];
  v6 = [v5 member:v4];

  return v6;
}

- (id)locationForHandle:(id)a3
{
  id v4 = a3;
  v5 = [v4 serverId];
  if (v5)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(FMFSessionDataManager *)self followingForHandle:v4];
  }
  v7 = v6;

  v8 = [v7 serverId];
  if (v8)
  {
    id v9 = self;
    objc_sync_enter(v9);
    uint64_t v10 = [(FMFSessionDataManager *)v9 locationsCache];
    uint64_t v11 = [v10 objectForKeyedSubscript:v8];

    if (v11 && ([v11 isValid] & 1) == 0)
    {
      v12 = [(FMFSessionDataManager *)v9 locations];
      v13 = (void *)[v12 mutableCopy];

      [v13 removeObject:v11];
      objc_storeStrong((id *)&v9->_locations, v13);
      v14 = [(FMFSessionDataManager *)v9 locationsCache];
      [v14 removeObjectForKey:v8];

      uint64_t v11 = 0;
    }
    objc_sync_exit(v9);
  }
  else
  {
    v15 = LogCategory_Daemon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FMFSessionDataManager locationForHandle:]((uint64_t)v4, v15);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)offerExpirationForHandle:(id)a3 groupId:(id)a4
{
  id v6 = (__CFString *)a4;
  id v7 = a3;
  v8 = [(FMFSessionDataManager *)self followers];
  id v9 = [v8 member:v7];

  uint64_t v10 = v6;
  if (!v6) {
    uint64_t v10 = @"kFMFGroupIdOneToOne";
  }
  uint64_t v11 = v6;
  v12 = [v9 expiresByGroupId];
  v13 = [v12 objectForKeyedSubscript:v10];

  v14 = (void *)MEMORY[0x263EFF910];
  [v13 doubleValue];
  v16 = [v14 dateWithTimeIntervalSince1970:v15 / 1000.0];

  return v16;
}

- (void)abDidChange
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(FMFSessionDataManager *)obj followers];
  [v2 makeObjectsPerformSelector:sel_addressBookDidChange];

  v3 = [(FMFSessionDataManager *)obj following];
  [v3 makeObjectsPerformSelector:sel_addressBookDidChange];

  objc_sync_exit(obj);
}

- (void)abPreferencesDidChange
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(FMFSessionDataManager *)obj followers];
  [v2 makeObjectsPerformSelector:sel_abPreferencesDidChange];

  v3 = [(FMFSessionDataManager *)obj following];
  [v3 makeObjectsPerformSelector:sel_abPreferencesDidChange];

  objc_sync_exit(obj);
}

- (id)favoritesOrdered
{
  v2 = [(FMFSessionDataManager *)self following];
  v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"favoriteOrder != nil"];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  if (!favoritesOrdered_sortDesc)
  {
    uint64_t v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"favoriteOrder" ascending:1];
    id v6 = (void *)favoritesOrdered_sortDesc;
    favoritesOrdered_sortDesc = v5;
  }
  id v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:");
  v8 = [v4 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (NSSet)followers
{
  return self->_followers;
}

- (NSSet)following
{
  return self->_following;
}

- (NSSet)locations
{
  return self->_locations;
}

- (NSSet)fences
{
  return self->_fences;
}

- (NSMutableDictionary)locationsCache
{
  return self->_locationsCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationsCache, 0);
  objc_storeStrong((id *)&self->_fences, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_following, 0);

  objc_storeStrong((id *)&self->_followers, 0);
}

- (void)setLocations:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_20AD87000, log, OS_LOG_TYPE_ERROR, "Failed to cache location. Missing serverId. %@", buf, 0xCu);
}

- (void)locationForHandle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20AD87000, a2, OS_LOG_TYPE_ERROR, "Faild cached location lookup. Missing serverId. %@", (uint8_t *)&v2, 0xCu);
}

@end