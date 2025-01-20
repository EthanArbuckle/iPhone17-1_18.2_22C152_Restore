@interface HFHomePropertyCacheManager
+ (id)sharedManager;
- (BOOL)_testing_disableCaching;
- (HFHomePropertyCacheManager)init;
- (HMFUnfairLock)roomOrderKeysLock;
- (NSCache)objectCaches;
- (NSMutableDictionary)changedKeys;
- (NSMutableSet)keysForRoomOrder;
- (id)cachedValuesForObject:(id)a3;
- (id)valueForObject:(id)a3 home:(id)a4 key:(id)a5 invalidationReasons:(unint64_t)a6 recalculationBlock:(id)a7;
- (id)valueForObject:(id)a3 key:(id)a4 invalidationReasons:(unint64_t)a5 recalculationBlock:(id)a6;
- (void)_clearCachedValues;
- (void)_clearRoomOrderValues;
- (void)accessoryDidUpdateServices:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddRoom:(id)a4;
- (void)home:(id)a3 didAddService:(id)a4 toServiceGroup:(id)a5;
- (void)home:(id)a3 didAddServiceGroup:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveRoom:(id)a4;
- (void)home:(id)a3 didRemoveService:(id)a4 fromServiceGroup:(id)a5;
- (void)home:(id)a3 didRemoveServiceGroup:(id)a4;
- (void)homeDidUpdateApplicationData:(id)a3;
- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5;
- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4;
- (void)keyChangedWithObject:(void *)a3 key:;
- (void)resetTrackingChangedKeys;
- (void)setKeysForRoomOrder:(id)a3;
- (void)setObjectCaches:(id)a3;
- (void)setRoomOrderKeysLock:(id)a3;
- (void)set_testing_disableCaching:(BOOL)a3;
- (void)stopTrackingChangedKeys;
@end

@implementation HFHomePropertyCacheManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HFHomePropertyCacheManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26AB2F598 != -1) {
    dispatch_once(&qword_26AB2F598, block);
  }
  v2 = (void *)_MergedGlobals_279;
  return v2;
}

- (id)valueForObject:(id)a3 key:(id)a4 invalidationReasons:(unint64_t)a5 recalculationBlock:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [v12 home];
  v14 = [(HFHomePropertyCacheManager *)self valueForObject:v12 home:v13 key:v11 invalidationReasons:a5 recalculationBlock:v10];

  return v14;
}

- (id)cachedValuesForObject:(id)a3
{
  id v4 = a3;
  v5 = [(HFHomePropertyCacheManager *)self objectCaches];
  v6 = [v4 uniqueIdentifier];
  id v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    v8 = NSString;
    v9 = [(HFHomePropertyCacheManager *)self objectCaches];
    id v10 = [v9 name];
    id v11 = [v4 uniqueIdentifier];
    id v12 = [v8 stringWithFormat:@"%@(%@)", v10, v11];
    [v7 setName:v12];

    v13 = [(HFHomePropertyCacheManager *)self objectCaches];
    v14 = [v4 uniqueIdentifier];
    [v13 setObject:v7 forKey:v14 cost:1];
  }
  return v7;
}

- (NSCache)objectCaches
{
  return self->_objectCaches;
}

- (id)valueForObject:(id)a3 home:(id)a4 key:(id)a5 invalidationReasons:(unint64_t)a6 recalculationBlock:(id)a7
{
  char v8 = a6;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(void))a7;
  if (!v15)
  {
    v40 = [MEMORY[0x263F08690] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"HFHomePropertyCacheManager.m", 101, @"Invalid parameter not satisfying: %@", @"recalculationBlock" object file lineNumber description];
  }
  v16 = v13;
  v17 = [v13 uniqueIdentifier];
  v18 = +[HFHomeKitDispatcher sharedDispatcher];
  v19 = [v18 home];
  v20 = [v19 uniqueIdentifier];
  if ([v17 isEqual:v20])
  {
    char v41 = v8;
    BOOL v21 = [(HFHomePropertyCacheManager *)self _testing_disableCaching];

    if (!v21)
    {
      v22 = v42;
      v23 = [(HFHomePropertyCacheManager *)self cachedValuesForObject:v42];
      v24 = [v23 objectForKey:v14];
      if (!v24)
      {
        v25 = HFLogForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v46 = v14;
          __int16 v47 = 2112;
          id v48 = v42;
          _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_INFO, "HFHomePropertyCacheManager: Recalculating %@ for object %@", buf, 0x16u);
        }

        v24 = v15[2](v15);
        -[HFHomePropertyCacheManager keyChangedWithObject:key:](self, v42, v14);
        if (!v24)
        {
          v24 = [MEMORY[0x263EFF9D0] null];
        }
        [v23 setObject:v24 forKey:v14 cost:1];
        if ((v41 & 4) != 0)
        {
          v26 = [_HFHomePropertyCacheManagerKey alloc];
          v27 = [v42 uniqueIdentifier];
          v28 = [(_HFHomePropertyCacheManagerKey *)v26 initWithObjectID:v27 key:v14];

          v29 = [(HFHomePropertyCacheManager *)self roomOrderKeysLock];
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __93__HFHomePropertyCacheManager_valueForObject_home_key_invalidationReasons_recalculationBlock___block_invoke;
          v43[3] = &unk_26408D450;
          v43[4] = self;
          v44 = v28;
          v30 = v28;
          [v29 performBlock:v43];
        }
      }
      v31 = [MEMORY[0x263EFF9D0] null];
      if (v24 == v31) {
        v32 = 0;
      }
      else {
        v32 = v24;
      }
      id v33 = v32;

      goto LABEL_22;
    }
  }
  else
  {
  }
  if (![(HFHomePropertyCacheManager *)self _testing_disableCaching])
  {
    v34 = HFLogForCategory(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v36 = [v13 uniqueIdentifier];
      v37 = +[HFHomeKitDispatcher sharedDispatcher];
      v38 = [v37 home];
      v39 = [v38 uniqueIdentifier];
      *(_DWORD *)buf = 138413058;
      id v46 = v42;
      __int16 v47 = 2112;
      id v48 = v36;
      __int16 v49 = 2112;
      v50 = v39;
      __int16 v51 = 2112;
      id v52 = v14;
      _os_log_debug_impl(&dword_20B986000, v34, OS_LOG_TYPE_DEBUG, "HFHomePropertyCacheManager: Object %@ home (%@) is not current home (%@): recalculating %@", buf, 0x2Au);
    }
  }
  v22 = v42;
  -[HFHomePropertyCacheManager keyChangedWithObject:key:](self, v42, v14);
  v15[2](v15);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v33;
}

- (BOOL)_testing_disableCaching
{
  return self->__testing_disableCaching;
}

- (HMFUnfairLock)roomOrderKeysLock
{
  return self->_roomOrderKeysLock;
}

- (void)keyChangedWithObject:(void *)a3 key:
{
  id v18 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [a1 changedKeys];
    if (v6)
    {
      id v7 = (void *)v6;
      BOOL v8 = +[HFUtilities isInternalTest];

      if (v8)
      {
        v9 = [a1 changedKeys];
        id v10 = [v18 uniqueIdentifier];
        id v11 = [v9 objectForKeyedSubscript:v10];
        id v12 = (void *)[v11 mutableCopy];
        id v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [MEMORY[0x263EFF9C0] set];
        }
        v15 = v14;

        [v15 addObject:v5];
        v16 = [a1 changedKeys];
        v17 = [v18 uniqueIdentifier];
        [v16 setObject:v15 forKey:v17];
      }
    }
  }
}

- (NSMutableDictionary)changedKeys
{
  return self->_changedKeys;
}

uint64_t __43__HFHomePropertyCacheManager_sharedManager__block_invoke(uint64_t a1)
{
  _MergedGlobals_279 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (HFHomePropertyCacheManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)HFHomePropertyCacheManager;
  v2 = [(HFHomePropertyCacheManager *)&v15 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    objectCaches = v2->_objectCaches;
    v2->_objectCaches = v3;

    id v5 = NSString;
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    BOOL v8 = [v5 stringWithFormat:@"%@:cache", v7];
    [(NSCache *)v2->_objectCaches setName:v8];

    [(NSCache *)v2->_objectCaches setEvictsObjectsWhenApplicationEntersBackground:0];
    v2->__testing_disableCaching = 0;
    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    keysForRoomOrder = v2->_keysForRoomOrder;
    v2->_keysForRoomOrder = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x263F42668] lock];
    roomOrderKeysLock = v2->_roomOrderKeysLock;
    v2->_roomOrderKeysLock = (HMFUnfairLock *)v11;

    id v13 = +[HFHomeKitDispatcher sharedDispatcher];
    [v13 addHomeManagerObserver:v2];
    [v13 addHomeObserver:v2];
    [v13 addAccessoryObserver:v2];
  }
  return v2;
}

void __93__HFHomePropertyCacheManager_valueForObject_home_key_invalidationReasons_recalculationBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) keysForRoomOrder];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSMutableSet)keysForRoomOrder
{
  return self->_keysForRoomOrder;
}

- (void)_clearCachedValues
{
  v3 = HFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_debug_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEBUG, "HFHomePropertyCacheManager: Clearing cache", v5, 2u);
  }

  id v4 = [(HFHomePropertyCacheManager *)self objectCaches];
  [v4 removeAllObjects];

  [(HFHomePropertyCacheManager *)self _clearRoomOrderValues];
}

- (void)_clearRoomOrderValues
{
  v3 = [(HFHomePropertyCacheManager *)self roomOrderKeysLock];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__HFHomePropertyCacheManager__clearRoomOrderValues__block_invoke;
  v4[3] = &unk_26408DDE0;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __51__HFHomePropertyCacheManager__clearRoomOrderValues__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEBUG, "HFHomePropertyCacheManager: Clearing room order cache", buf, 2u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(*(id *)(a1 + 32), "keysForRoomOrder", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 32) objectCaches];
        id v10 = [v8 objectID];
        uint64_t v11 = [v9 objectForKey:v10];
        id v12 = [v8 key];
        [v11 removeObjectForKey:v12];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v5);
  }

  id v13 = [*(id *)(a1 + 32) keysForRoomOrder];
  [v13 removeAllObjects];
}

- (void)accessoryDidUpdateServices:(id)a3
{
  uint64_t v4 = [a3 home];
  uint64_t v5 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v6 = [v5 home];

  if (v4 == v6)
  {
    [(HFHomePropertyCacheManager *)self _clearCachedValues];
  }
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "home", a3);
  uint64_t v6 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v7 = [v6 home];

  if (v5 == v7)
  {
    [(HFHomePropertyCacheManager *)self _clearCachedValues];
  }
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "home", a3);
  uint64_t v6 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v7 = [v6 home];

  if (v5 == v7)
  {
    [(HFHomePropertyCacheManager *)self _clearCachedValues];
    +[HFAccessoryLikeObject _invalidateObjectMap];
  }
}

- (void)home:(id)a3 didAddServiceGroup:(id)a4
{
  id v5 = a3;
  uint64_t v6 = +[HFHomeKitDispatcher sharedDispatcher];
  id v7 = [v6 home];

  if (v7 == v5)
  {
    [(HFHomePropertyCacheManager *)self _clearCachedValues];
  }
}

- (void)home:(id)a3 didRemoveServiceGroup:(id)a4
{
  id v5 = a3;
  uint64_t v6 = +[HFHomeKitDispatcher sharedDispatcher];
  id v7 = [v6 home];

  if (v7 == v5)
  {
    [(HFHomePropertyCacheManager *)self _clearCachedValues];
    +[HFAccessoryLikeObject _invalidateObjectMap];
  }
}

- (void)home:(id)a3 didAddService:(id)a4 toServiceGroup:(id)a5
{
  id v6 = a3;
  id v7 = +[HFHomeKitDispatcher sharedDispatcher];
  id v8 = [v7 home];

  if (v8 == v6)
  {
    [(HFHomePropertyCacheManager *)self _clearCachedValues];
  }
}

- (void)home:(id)a3 didRemoveService:(id)a4 fromServiceGroup:(id)a5
{
  id v6 = a3;
  id v7 = +[HFHomeKitDispatcher sharedDispatcher];
  id v8 = [v7 home];

  if (v8 == v6)
  {
    [(HFHomePropertyCacheManager *)self _clearCachedValues];
    +[HFAccessoryLikeObject _invalidateObjectMap];
  }
}

- (void)home:(id)a3 didAddRoom:(id)a4
{
  id v5 = a3;
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  id v7 = [v6 home];

  if (v7 == v5)
  {
    [(HFHomePropertyCacheManager *)self _clearRoomOrderValues];
  }
}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  id v5 = a3;
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  id v7 = [v6 home];

  if (v7 == v5)
  {
    [(HFHomePropertyCacheManager *)self _clearRoomOrderValues];
  }
}

- (void)homeDidUpdateApplicationData:(id)a3
{
  id v4 = a3;
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  id v6 = [v5 home];

  if (v6 == v4)
  {
    [(HFHomePropertyCacheManager *)self _clearRoomOrderValues];
  }
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  [(HFHomePropertyCacheManager *)self _clearCachedValues];
  +[HFAccessoryLikeObject _invalidateObjectMap];
}

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  if (a4)
  {
    [(HFHomePropertyCacheManager *)self _clearCachedValues];
    +[HFAccessoryLikeObject _invalidateObjectMap];
  }
}

- (void)stopTrackingChangedKeys
{
  self->_changedKeys = 0;
  MEMORY[0x270F9A758]();
}

- (void)resetTrackingChangedKeys
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  changedKeys = self->_changedKeys;
  self->_changedKeys = v3;
  MEMORY[0x270F9A758](v3, changedKeys);
}

- (void)setObjectCaches:(id)a3
{
}

- (void)setKeysForRoomOrder:(id)a3
{
}

- (void)setRoomOrderKeysLock:(id)a3
{
}

- (void)set_testing_disableCaching:(BOOL)a3
{
  self->__testing_disableCaching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomOrderKeysLock, 0);
  objc_storeStrong((id *)&self->_keysForRoomOrder, 0);
  objc_storeStrong((id *)&self->_objectCaches, 0);
  objc_storeStrong((id *)&self->_changedKeys, 0);
}

@end