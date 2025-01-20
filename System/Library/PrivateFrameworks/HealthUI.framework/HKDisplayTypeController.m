@interface HKDisplayTypeController
+ (HKDisplayTypeController)sharedInstance;
+ (NSMutableDictionary)controllers;
+ (id)displayTypeForObjectType:(id)a3 wheelchairUse:(int64_t)a4;
+ (id)sharedInstanceForHealthStore:(id)a3;
+ (os_unfair_lock_s)controllersLock;
+ (void)_computeSharedDisplayTypes;
+ (void)_unitTest_resetSharedDisplayTypes;
+ (void)initializeSharedDisplayTypes;
- (HKDisplayTypeController)init;
- (HKDisplayTypeController)initWithHealthStore:(id)a3;
- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache;
- (id)_displayTypeWithUpdatedWheelchairUserIfNecessary:(id)a3;
- (id)allDisplayTypes;
- (id)displayTypeForObjectType:(id)a3;
- (id)displayTypeForObjectTypeUnifyingBloodPressureTypes:(id)a3;
- (id)displayTypeWithIdentifier:(id)a3;
- (id)displayTypesForCategoryIdentifier:(int64_t)a3;
- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4;
@end

@implementation HKDisplayTypeController

+ (void)_computeSharedDisplayTypes
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = +[HKDisplayType builtinDisplayTypes];
  uint64_t v3 = objc_msgSend(v2, "hk_filter:", &__block_literal_global_19);
  v4 = (void *)_sharedDisplayTypes;
  _sharedDisplayTypes = v3;

  v29 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v28 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = (id)_sharedDisplayTypes;
  uint64_t v30 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v30)
  {
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "displayTypeIdentifier"));
        [v29 setObject:v7 forKeyedSubscript:v8];

        v9 = [MEMORY[0x1E4F1CA48] array];
        v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "categoryIdentifier"));
        [v9 addObject:v10];

        v11 = [v7 secondaryCategoryIdentifiers];
        [v9 addObjectsFromArray:v11];

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v12 = v9;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * j);
              v18 = [v5 objectForKeyedSubscript:v17];
              if (!v18)
              {
                v18 = [MEMORY[0x1E4F1CA48] array];
                [v5 setObject:v18 forKeyedSubscript:v17];
              }
              [v18 addObject:v7];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v14);
        }

        v19 = [v7 objectType];
        [v28 setObject:v7 forKeyedSubscript:v19];
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v30);
  }

  uint64_t v20 = [v29 copy];
  v21 = (void *)_sharedDisplayTypesByIdentifier;
  _sharedDisplayTypesByIdentifier = v20;

  uint64_t v22 = [v5 copy];
  v23 = (void *)_sharedDisplayTypesByCategoryIdentifier;
  _sharedDisplayTypesByCategoryIdentifier = v22;

  uint64_t v24 = [v28 copy];
  v25 = (void *)_sharedDisplayTypesByObjectType;
  _sharedDisplayTypesByObjectType = v24;
}

- (HKDisplayTypeController)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDisplayTypeController;
  v5 = [(HKDisplayTypeController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F2B980]) initWithHealthStore:v4];
    wheelchairUseCharacteristicCache = v5->_wheelchairUseCharacteristicCache;
    v5->_wheelchairUseCharacteristicCache = (_HKWheelchairUseCharacteristicCache *)v6;

    [(_HKWheelchairUseCharacteristicCache *)v5->_wheelchairUseCharacteristicCache registerObserver:v5];
    [(_HKWheelchairUseCharacteristicCache *)v5->_wheelchairUseCharacteristicCache isWheelchairUser];
    +[HKDisplayTypeController initializeSharedDisplayTypes];
    objc_storeStrong((id *)&v5->_displayTypes, (id)_sharedDisplayTypes);
    objc_storeStrong((id *)&v5->_displayTypesByIdentifier, (id)_sharedDisplayTypesByIdentifier);
    objc_storeStrong((id *)&v5->_displayTypesByCategoryIdentifier, (id)_sharedDisplayTypesByCategoryIdentifier);
    objc_storeStrong((id *)&v5->_displayTypesByObjectType, (id)_sharedDisplayTypesByObjectType);
  }

  return v5;
}

- (id)displayTypeForObjectType:(id)a3
{
  id v4 = [(NSDictionary *)self->_displayTypesByObjectType objectForKeyedSubscript:a3];
  v5 = [(HKDisplayTypeController *)self _displayTypeWithUpdatedWheelchairUserIfNecessary:v4];

  return v5;
}

- (id)_displayTypeWithUpdatedWheelchairUserIfNecessary:(id)a3
{
  id v4 = a3;
  if (-[_HKWheelchairUseCharacteristicCache isWheelchairUser](self->_wheelchairUseCharacteristicCache, "isWheelchairUser")&& ([v4 _isWheelchairUser] & 1) == 0)
  {
    uint64_t v5 = [v4 copyWithIsWheelchairUser:1];
  }
  else
  {
    uint64_t v5 = [v4 copy];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

uint64_t __53__HKDisplayTypeController__computeSharedDisplayTypes__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 behavior];
  uint64_t v3 = [v2 hidden] ^ 1;

  return v3;
}

+ (void)initializeSharedDisplayTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HKDisplayTypeController_initializeSharedDisplayTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initializeSharedDisplayTypes_onceToken != -1) {
    dispatch_once(&initializeSharedDisplayTypes_onceToken, block);
  }
}

+ (id)sharedInstanceForHealthStore:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_controllersLock);
  uint64_t v5 = [a1 controllers];
  uint64_t v6 = [v4 identifier];
  v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    v7 = [[HKDisplayTypeController alloc] initWithHealthStore:v4];
    v8 = [a1 controllers];
    objc_super v9 = [v4 identifier];
    [v8 setObject:v7 forKey:v9];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_controllersLock);

  return v7;
}

+ (HKDisplayTypeController)sharedInstance
{
  os_unfair_lock_lock((os_unfair_lock_t)&_controllersLock);
  uint64_t v3 = [a1 controllers];
  id v4 = [MEMORY[0x1E4F2B0C8] primaryStoreIdentifier];
  uint64_t v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F2B0B8]);
    uint64_t v5 = [[HKDisplayTypeController alloc] initWithHealthStore:v6];
    v7 = [a1 controllers];
    v8 = [MEMORY[0x1E4F2B0C8] primaryStoreIdentifier];
    [v7 setObject:v5 forKey:v8];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_controllersLock);
  return v5;
}

+ (NSMutableDictionary)controllers
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&_controllersLock);
  v2 = (void *)_controllers;
  if (!_controllers)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)_controllers;
    _controllers = (uint64_t)v3;

    v2 = (void *)_controllers;
  }
  return (NSMutableDictionary *)v2;
}

uint64_t __55__HKDisplayTypeController_initializeSharedDisplayTypes__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _computeSharedDisplayTypes];
}

- (id)allDisplayTypes
{
  return self->_displayTypes;
}

+ (os_unfair_lock_s)controllersLock
{
  return (os_unfair_lock_s)_controllersLock;
}

+ (void)_unitTest_resetSharedDisplayTypes
{
  os_unfair_lock_lock((os_unfair_lock_t)&_controllersLock);
  id v3 = (void *)_controllers;
  _controllers = 0;

  [a1 _computeSharedDisplayTypes];
  os_unfair_lock_unlock((os_unfair_lock_t)&_controllersLock);
}

+ (id)displayTypeForObjectType:(id)a3 wheelchairUse:(int64_t)a4
{
  id v5 = a3;
  +[HKDisplayTypeController initializeSharedDisplayTypes];
  id v6 = [(id)_sharedDisplayTypesByObjectType objectForKeyedSubscript:v5];

  if (a4 && ([v6 _isWheelchairUser] & 1) == 0) {
    id v7 = (id)[v6 copyWithIsWheelchairUser:1];
  }
  else {
    id v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (HKDisplayTypeController)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"HKDisplayTypeControllerDisplayTypeStringValuesChangedNotification" object:0];
}

- (id)displayTypeForObjectTypeUnifyingBloodPressureTypes:(id)a3
{
  id v4 = a3;
  if ([v4 code] == 17 || objc_msgSend(v4, "code") == 16)
  {
    uint64_t v5 = [MEMORY[0x1E4F2AE60] correlationTypeForIdentifier:*MEMORY[0x1E4F29938]];

    id v4 = (id)v5;
  }
  id v6 = [(HKDisplayTypeController *)self displayTypeForObjectType:v4];

  return v6;
}

- (id)displayTypeWithIdentifier:(id)a3
{
  id v4 = [(NSDictionary *)self->_displayTypesByIdentifier objectForKeyedSubscript:a3];
  uint64_t v5 = [(HKDisplayTypeController *)self _displayTypeWithUpdatedWheelchairUserIfNecessary:v4];

  return v5;
}

- (id)displayTypesForCategoryIdentifier:(int64_t)a3
{
  displayTypesByCategoryIdentifier = self->_displayTypesByCategoryIdentifier;
  id v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSDictionary *)displayTypesByCategoryIdentifier objectForKeyedSubscript:v4];

  return v5;
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache
{
  return self->_wheelchairUseCharacteristicCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_displayTypesByObjectType, 0);
  objc_storeStrong((id *)&self->_displayTypesByCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_displayTypesByIdentifier, 0);
  objc_storeStrong((id *)&self->_displayTypes, 0);
}

@end