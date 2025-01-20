@interface CatacombStateCache
- (CatacombStateCache)init;
- (id)cachedComponents;
- (id)cachedGroupComponentsForUser:(unsigned int)a3;
- (id)cachedUserComponents;
- (int)addGroupStatesFromBuffer:(id)a3;
- (int)addUserStatesFromBuffer:(id)a3;
- (unsigned)stateOfComponent:(id)a3;
- (unsigned)stateOfMasterComponent;
- (unsigned)stateOfUserComponent:(unsigned int)a3;
- (void)removeUser:(unsigned int)a3;
- (void)reset;
@end

@implementation CatacombStateCache

- (CatacombStateCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CatacombStateCache;
  v2 = [(CatacombStateCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    cachedStates = v2->_cachedStates;
    v2->_cachedStates = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)reset
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)obj->_cachedStates removeAllObjects];
  objc_sync_exit(obj);
}

- (int)addUserStatesFromBuffer:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 length] & 7) != 0)
  {
    if (__osLog) {
      v15 = __osLog;
    }
    else {
      v15 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      v17 = "(buffer.length % sizeof(catacomb_state_v1_t)) == 0";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      v21 = &unk_22004A573;
      __int16 v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 520;
      _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    int v13 = 261;
  }
  else
  {
    unint64_t v5 = [v4 length];
    objc_super v6 = self;
    objc_sync_enter(v6);
    if (v5 >= 8)
    {
      uint64_t v7 = 0;
      unint64_t v8 = v5 >> 3;
      do
      {
        uint64_t v9 = [v4 bytes];
        cachedStates = v6->_cachedStates;
        v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v9 + v7 + 4)];
        v12 = +[CatacombComponent componentForUserID:*(unsigned int *)(v9 + v7)];
        [(NSMutableDictionary *)cachedStates setObject:v11 forKey:v12];

        v7 += 8;
        --v8;
      }
      while (v8);
    }
    objc_sync_exit(v6);

    int v13 = 0;
  }

  return v13;
}

- (id)cachedComponents
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSMutableDictionary *)v2->_cachedStates allKeys];
  objc_sync_exit(v2);

  return v3;
}

- (id)cachedUserComponents
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = self;
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = v4->_cachedStates;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isUserComponent", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (void)removeUser:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = [(NSMutableDictionary *)v4->_cachedStates allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 userID] == a3) {
          [(NSMutableDictionary *)v4->_cachedStates removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (unsigned)stateOfComponent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_cachedStates objectForKeyedSubscript:v4];
  unsigned int v7 = [v6 unsignedIntValue];

  objc_sync_exit(v5);
  return v7;
}

- (unsigned)stateOfMasterComponent
{
  v2 = self;
  objc_sync_enter(v2);
  cachedStates = v2->_cachedStates;
  id v4 = +[CatacombComponent masterComponent];
  unint64_t v5 = [(NSMutableDictionary *)cachedStates objectForKeyedSubscript:v4];
  LODWORD(cachedStates) = [v5 unsignedIntValue];

  objc_sync_exit(v2);
  return cachedStates;
}

- (unsigned)stateOfUserComponent:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = self;
  objc_sync_enter(v4);
  cachedStates = v4->_cachedStates;
  uint64_t v6 = +[CatacombComponent componentForUserID:v3];
  unsigned int v7 = [(NSMutableDictionary *)cachedStates objectForKeyedSubscript:v6];
  LODWORD(cachedStates) = [v7 unsignedIntValue];

  objc_sync_exit(v4);
  return cachedStates;
}

- (int)addGroupStatesFromBuffer:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__ROR8__(0x6DB6DB6DB6DB6DB7 * [v4 length], 2) >= 0x924924924924925uLL)
  {
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      __int16 v18 = "buffer.length % sizeof(catacomb_group_state_t) == 0";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      __int16 v22 = &unk_22004A573;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v25 = 1024;
      int v26 = 610;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    int v14 = 261;
  }
  else
  {
    unint64_t v5 = [v4 length];
    uint64_t v6 = self;
    objc_sync_enter(v6);
    if (v5 >= 0x1C)
    {
      uint64_t v7 = 0;
      unint64_t v8 = v5 / 0x1C;
      do
      {
        uint64_t v9 = [v4 bytes];
        cachedStates = v6->_cachedStates;
        uint64_t v11 = v9 + v7;
        long long v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v9 + v7 + 24)];
        long long v13 = +[CatacombComponent component:v11];
        [(NSMutableDictionary *)cachedStates setObject:v12 forKey:v13];

        v7 += 28;
        --v8;
      }
      while (v8);
    }
    objc_sync_exit(v6);

    int v14 = 0;
  }

  return v14;
}

- (id)cachedGroupComponentsForUser:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = [MEMORY[0x263EFF980] array];
  if (a3 != -1)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = v6->_cachedStates;
    uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "isGroupComponent", (void)v13)
            && [v11 userID] == a3)
          {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end