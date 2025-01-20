@interface FIIntervalWorkoutDefinitionsManager
- (FIIntervalWorkoutDefinitionsManager)init;
- (id)_defaultUserIntervalWorkouts;
- (id)_deserializeIntervalWorkoutDefinitions:(id)a3;
- (id)_mockHIIT3010;
- (id)_mockQuarterMileSprints;
- (id)_mockVariedSpeed;
- (id)_serializeRootIntervalWorkoutDefinitions:(id)a3;
- (id)intervalWorkoutDefinitionsForActivityTypeIdentifier:(id)a3;
- (void)_checkVersion;
- (void)_mockHIIT3010;
- (void)_mockQuarterMileSprints;
- (void)_saveDefaultIntervalWorkouts;
- (void)_saveRootIntervalWorkoutDefinitions:(id)a3;
- (void)_serializeAndSaveRootIntervalWorkoutDefinitions:(id)a3;
- (void)_trimRootIntervalWorkoutDefinitions:(id)a3;
- (void)_updateIntervalWorkoutDefinition:(id)a3 activityTypeIdentifier:(id)a4;
- (void)loadIntervalWorkoutDefinitions;
- (void)removeIntervalWorkoutDefinitionAtIndex:(int64_t)a3 activityTypeIdentifier:(id)a4;
- (void)saveIntervalWorkoutDefinition:(id)a3 activityTypeIdentifier:(id)a4;
@end

@implementation FIIntervalWorkoutDefinitionsManager

- (FIIntervalWorkoutDefinitionsManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)FIIntervalWorkoutDefinitionsManager;
  v2 = [(FIIntervalWorkoutDefinitionsManager *)&v9 init];
  if (v2)
  {
    v3 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    syncManager = v2->_syncManager;
    v2->_syncManager = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nanolifestyle.sessiontrackerapp.intervals"];
    domainAccessor = v2->_domainAccessor;
    v2->_domainAccessor = (NPSDomainAccessor *)v5;

    id v7 = (id)[(NPSDomainAccessor *)v2->_domainAccessor synchronize];
    [(FIIntervalWorkoutDefinitionsManager *)v2 _checkVersion];
    [(FIIntervalWorkoutDefinitionsManager *)v2 loadIntervalWorkoutDefinitions];
  }
  return v2;
}

- (void)_checkVersion
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  __int16 v2 = 2048;
  uint64_t v3 = 1;
  __int16 v4 = 2048;
  uint64_t v5 = 1;
  _os_log_error_impl(&dword_21C74B000, v0, OS_LOG_TYPE_ERROR, "Unsupported interval definitions version. Default interval workouts have been created with current version. User version:%lx Minimum supported version:%lx Current version:%lx", v1, 0x20u);
}

- (void)loadIntervalWorkoutDefinitions
{
  id v5 = [(NPSDomainAccessor *)self->_domainAccessor objectForKey:@"IntervalWorkoutDefinitions"];
  uint64_t v3 = [(FIIntervalWorkoutDefinitionsManager *)self _deserializeIntervalWorkoutDefinitions:v5];
  rootIntervalWorkoutDefinitions = self->_rootIntervalWorkoutDefinitions;
  self->_rootIntervalWorkoutDefinitions = v3;
}

- (id)_deserializeIntervalWorkoutDefinitions:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v18 = v3;
    id obj = v3;
    uint64_t v21 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v21)
    {
      uint64_t v19 = *(void *)v31;
      __int16 v4 = (os_log_t *)MEMORY[0x263F09970];
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = v5;
          uint64_t v6 = *(void *)(*((void *)&v30 + 1) + 8 * v5);
          id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v23 = v6;
          v8 = [obj objectForKeyedSubscript:v6];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v27 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
                id v25 = 0;
                v14 = +[FIIntervalWorkoutDefinition definitionFromDictionary:v13 error:&v25];
                id v15 = v25;
                if (v15)
                {
                  _HKInitializeLogging();
                  v16 = *v4;
                  if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v35 = v15;
                    _os_log_error_impl(&dword_21C74B000, v16, OS_LOG_TYPE_ERROR, "Error deserializing workout definition. Error: %@", buf, 0xCu);
                  }
                }
                else
                {
                  [v7 addObject:v14];
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
            }
            while (v10);
          }

          [v20 setObject:v7 forKey:v23];
          uint64_t v5 = v24 + 1;
        }
        while (v24 + 1 != v21);
        uint64_t v21 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
      }
      while (v21);
    }

    id v3 = v18;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)_serializeRootIntervalWorkoutDefinitions:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v4, "objectForKeyedSubscript:", v8, v20);
        id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = v9;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = [*(id *)(*((void *)&v22 + 1) + 8 * j) dictionaryRepresentation];
              [v10 addObject:v16];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v13);
        }

        v17 = (void *)[v10 copy];
        [v21 setObject:v17 forKey:v8];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  id v18 = (void *)[v21 copy];
  return v18;
}

- (void)_saveRootIntervalWorkoutDefinitions:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  [(NPSDomainAccessor *)self->_domainAccessor setObject:a3 forKey:@"IntervalWorkoutDefinitions"];
  [(NPSDomainAccessor *)self->_domainAccessor setInteger:1 forKey:@"IntervalWorkoutDefinitionsVersion"];
  id v4 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
  syncManager = self->_syncManager;
  uint64_t v6 = [(NPSDomainAccessor *)self->_domainAccessor domain];
  id v7 = (void *)MEMORY[0x263EFFA08];
  v10[0] = @"IntervalWorkoutDefinitions";
  v10[1] = @"IntervalWorkoutDefinitionsVersion";
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  [(NPSManager *)syncManager synchronizeNanoDomain:v6 keys:v9];
}

- (void)_serializeAndSaveRootIntervalWorkoutDefinitions:(id)a3
{
  id v4 = [(FIIntervalWorkoutDefinitionsManager *)self _serializeRootIntervalWorkoutDefinitions:self->_rootIntervalWorkoutDefinitions];
  [(FIIntervalWorkoutDefinitionsManager *)self _saveRootIntervalWorkoutDefinitions:v4];
}

- (void)_updateIntervalWorkoutDefinition:(id)a3 activityTypeIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_rootIntervalWorkoutDefinitions objectForKeyedSubscript:v7];
  if (v8)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v15 = objc_msgSend(v14, "identifier", (void)v18);
          v16 = [v6 identifier];
          int v17 = [v15 isEqual:v16];

          if (v17)
          {
            objc_msgSend(v9, "replaceObjectAtIndex:withObject:", objc_msgSend(v9, "indexOfObject:", v14), v6);

            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    [v9 addObject:v6];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v9 addObject:v6];
    [(NSMutableDictionary *)self->_rootIntervalWorkoutDefinitions setObject:v9 forKey:v7];
  }
LABEL_13:
}

- (void)saveIntervalWorkoutDefinition:(id)a3 activityTypeIdentifier:(id)a4
{
  [(FIIntervalWorkoutDefinitionsManager *)self _updateIntervalWorkoutDefinition:a3 activityTypeIdentifier:a4];
  rootIntervalWorkoutDefinitions = self->_rootIntervalWorkoutDefinitions;
  [(FIIntervalWorkoutDefinitionsManager *)self _serializeAndSaveRootIntervalWorkoutDefinitions:rootIntervalWorkoutDefinitions];
}

- (void)removeIntervalWorkoutDefinitionAtIndex:(int64_t)a3 activityTypeIdentifier:(id)a4
{
  rootIntervalWorkoutDefinitions = self->_rootIntervalWorkoutDefinitions;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)rootIntervalWorkoutDefinitions objectForKeyedSubscript:v7];
  [v8 removeObjectAtIndex:a3];
  [(NSMutableDictionary *)self->_rootIntervalWorkoutDefinitions setObject:v8 forKeyedSubscript:v7];

  [(FIIntervalWorkoutDefinitionsManager *)self _trimRootIntervalWorkoutDefinitions:self->_rootIntervalWorkoutDefinitions];
  [(FIIntervalWorkoutDefinitionsManager *)self _serializeAndSaveRootIntervalWorkoutDefinitions:self->_rootIntervalWorkoutDefinitions];
}

- (void)_trimRootIntervalWorkoutDefinitions:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKeyedSubscript:v10];
        if (![v11 count]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v5, "removeObjectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (id)intervalWorkoutDefinitionsForActivityTypeIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_rootIntervalWorkoutDefinitions objectForKeyedSubscript:a3];
}

- (void)_saveDefaultIntervalWorkouts
{
  id v3 = [(FIIntervalWorkoutDefinitionsManager *)self _defaultUserIntervalWorkouts];
  rootIntervalWorkoutDefinitions = self->_rootIntervalWorkoutDefinitions;
  self->_rootIntervalWorkoutDefinitions = v3;

  [(FIIntervalWorkoutDefinitionsManager *)self _serializeAndSaveRootIntervalWorkoutDefinitions:self->_rootIntervalWorkoutDefinitions];
  _HKInitializeLogging();
  id v5 = *MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21C74B000, v5, OS_LOG_TYPE_DEFAULT, "Default interval workout definitions have been saved.", v6, 2u);
  }
}

- (id)_defaultUserIntervalWorkouts
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = [(FIIntervalWorkoutDefinitionsManager *)self _mockQuarterMileSprints];
  [v4 addObject:v5];

  uint64_t v6 = [(FIIntervalWorkoutDefinitionsManager *)self _mockVariedSpeed];
  [v4 addObject:v6];

  [v3 setObject:v4 forKey:@"37"];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = [(FIIntervalWorkoutDefinitionsManager *)self _mockHIIT3010];
  [v7 addObject:v8];

  [v3 setObject:v7 forKey:@"63"];
  return v3;
}

- (id)_mockHIIT3010
{
  void v10[3] = *MEMORY[0x263EF8340];
  v10[0] = @"HIIT 30/10";
  v9[0] = @"name";
  v9[1] = @"identifier";
  __int16 v2 = [MEMORY[0x263F08C38] UUID];
  id v3 = [v2 UUIDString];
  v9[2] = @"sets";
  v10[1] = v3;
  v10[2] = &unk_26CD12AB0;
  id v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  id v8 = 0;
  id v5 = +[FIIntervalWorkoutDefinition definitionFromDictionary:v4 error:&v8];
  id v6 = v8;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      -[FIIntervalWorkoutDefinitionsManager _mockHIIT3010]();
    }
  }

  return v5;
}

- (id)_mockQuarterMileSprints
{
  void v10[3] = *MEMORY[0x263EF8340];
  v10[0] = @"Quarter Mile Sprints";
  v9[0] = @"name";
  v9[1] = @"identifier";
  __int16 v2 = [MEMORY[0x263F08C38] UUID];
  id v3 = [v2 UUIDString];
  v9[2] = @"sets";
  v10[1] = v3;
  v10[2] = &unk_26CD12AF8;
  id v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  id v8 = 0;
  id v5 = +[FIIntervalWorkoutDefinition definitionFromDictionary:v4 error:&v8];
  id v6 = v8;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      -[FIIntervalWorkoutDefinitionsManager _mockQuarterMileSprints]();
    }
  }

  return v5;
}

- (id)_mockVariedSpeed
{
  void v10[3] = *MEMORY[0x263EF8340];
  v10[0] = @"Varied Speed";
  v9[0] = @"name";
  v9[1] = @"identifier";
  __int16 v2 = [MEMORY[0x263F08C38] UUID];
  id v3 = [v2 UUIDString];
  v9[2] = @"sets";
  v10[1] = v3;
  v10[2] = &unk_26CD12BE8;
  id v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  id v8 = 0;
  id v5 = +[FIIntervalWorkoutDefinition definitionFromDictionary:v4 error:&v8];
  id v6 = v8;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      -[FIIntervalWorkoutDefinitionsManager _mockQuarterMileSprints]();
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIntervalWorkoutDefinitions, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

- (void)_mockHIIT3010
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21C74B000, v0, v1, "Error deserializing workout definition. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_mockQuarterMileSprints
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21C74B000, v0, v1, "Error deserializing workout definition. error: %@", v2, v3, v4, v5, v6);
}

@end