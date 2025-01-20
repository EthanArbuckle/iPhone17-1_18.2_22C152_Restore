@interface FIUnitManager
+ (id)quantityTypeForDistanceType:(unint64_t)a3;
- (FIUnitManager)initWithHealthStore:(id)a3;
- (double)distanceInDistanceUnit:(unint64_t)a3 forDistanceInMeters:(double)a4;
- (double)distanceInMetersForDistanceInUserUnit:(double)a3 distanceType:(unint64_t)a4;
- (double)distanceInUserDistanceUnitForDistanceInMeters:(double)a3 distanceType:(unint64_t)a4;
- (double)paceWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6;
- (id)_loadPreferredUnitsFromDefaults;
- (id)_preferredHKUnitForQuantityType:(id)a3;
- (id)userActiveEnergyBurnedUnit;
- (id)userBasalEnergyBurnedUnit;
- (id)userDepthHKUnit;
- (id)userDistanceCrossCountrySkiingHKUnit;
- (id)userDistanceCyclingHKUnit;
- (id)userDistanceDownhillSnowSportsHKUnit;
- (id)userDistanceElevationHKUnit;
- (id)userDistanceHKUnitForActivityType:(id)a3;
- (id)userDistanceHKUnitForDistanceType:(unint64_t)a3;
- (id)userDistancePaddleSportsHKUnit;
- (id)userDistanceRowingHKUnit;
- (id)userDistanceSkatingSportsHKUnit;
- (id)userDistanceWalkingRunningHKUnit;
- (id)userLapLengthHKUnit;
- (id)userWaterTemperatureHKUnit;
- (unint64_t)paceDistanceUnitForDistanceType:(unint64_t)a3;
- (unint64_t)userDistanceCyclingUnit;
- (unint64_t)userDistanceElevationUnit;
- (unint64_t)userDistanceUnitForDistanceType:(unint64_t)a3;
- (unint64_t)userDistanceWalkingRunningUnit;
- (void)_notifyUnitPreferencesChanged;
- (void)_setPreferredHKUnit:(id)a3 forQuantityType:(id)a4;
- (void)_storePreferredUnitsInDefaults:(id)a3;
- (void)_updatePreferredUnits;
- (void)setPreferredUnitsForTesting:(id)a3;
- (void)setUserActiveEnergyBurnedUnit:(id)a3;
- (void)setUserBasalEnergyBurnedUnit:(id)a3;
- (void)setUserDepthHKUnit:(id)a3;
- (void)setUserDistanceCyclingUnit:(unint64_t)a3;
- (void)setUserDistanceUnit:(unint64_t)a3 forDistanceType:(unint64_t)a4;
- (void)setUserDistanceWalkingRunningUnit:(unint64_t)a3;
- (void)setUserWaterTemperatureHKUnit:(id)a3;
@end

@implementation FIUnitManager

uint64_t __37__FIUnitManager_initWithHealthStore___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreferredUnits];
}

- (id)userWaterTemperatureHKUnit
{
  v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09F58]];
  v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (id)userDepthHKUnit
{
  v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09F18]];
  v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (unint64_t)userDistanceWalkingRunningUnit
{
  v2 = [(FIUnitManager *)self userDistanceWalkingRunningHKUnit];
  unint64_t v3 = FIDistanceUnitForHKUnit(v2);

  return v3;
}

- (unint64_t)userDistanceUnitForDistanceType:(unint64_t)a3
{
  unint64_t v3 = [(FIUnitManager *)self userDistanceHKUnitForDistanceType:a3];
  unint64_t v4 = FIDistanceUnitForHKUnit(v3);

  return v4;
}

- (id)userDistanceHKUnitForDistanceType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      uint64_t v4 = [(FIUnitManager *)self userDistanceWalkingRunningHKUnit];
      goto LABEL_13;
    case 2uLL:
      uint64_t v4 = [(FIUnitManager *)self userDistanceCyclingHKUnit];
      goto LABEL_13;
    case 3uLL:
      uint64_t v4 = [(FIUnitManager *)self userLapLengthHKUnit];
      goto LABEL_13;
    case 4uLL:
      v5 = [(FIUnitManager *)self userLapLengthHKUnit];
      v6 = [MEMORY[0x263F0A830] yardUnit];
      int v7 = [v5 isEqual:v6];

      if (v7)
      {
        id v8 = [MEMORY[0x263F0A830] mileUnit];
      }
      else
      {
        v10 = [MEMORY[0x263F0A830] meterUnit];
        int v11 = [v5 isEqual:v10];

        if (v11)
        {
          id v8 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
        }
        else
        {
          id v8 = v5;
        }
      }
      unint64_t v3 = v8;

      break;
    case 5uLL:
      uint64_t v4 = [(FIUnitManager *)self userDistanceElevationHKUnit];
      goto LABEL_13;
    case 6uLL:
      uint64_t v4 = [(FIUnitManager *)self userDistanceCrossCountrySkiingHKUnit];
      goto LABEL_13;
    case 7uLL:
      uint64_t v4 = [(FIUnitManager *)self userDistanceDownhillSnowSportsHKUnit];
      goto LABEL_13;
    case 8uLL:
      uint64_t v4 = [(FIUnitManager *)self userDistancePaddleSportsHKUnit];
      goto LABEL_13;
    case 9uLL:
      uint64_t v4 = [(FIUnitManager *)self userDistanceRowingHKUnit];
      goto LABEL_13;
    case 0xAuLL:
      uint64_t v4 = [(FIUnitManager *)self userDistanceSkatingSportsHKUnit];
LABEL_13:
      unint64_t v3 = (void *)v4;
      break;
    default:
      break;
  }
  return v3;
}

void __48__FIUnitManager__storePreferredUnitsInDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = [a2 identifier];
  v6 = [v5 unitString];

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void __48__FIUnitManager__loadPreferredUnitsFromDefaults__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:a2];
  if (v5)
  {
    v6 = [MEMORY[0x263F0A830] unitFromString:v7];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

- (id)userDistanceWalkingRunningHKUnit
{
  unint64_t v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DE0]];
  uint64_t v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (id)userActiveEnergyBurnedUnit
{
  unint64_t v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09BC0]];
  uint64_t v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (id)_preferredHKUnitForQuantityType:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_preferredUnits objectForKeyedSubscript:v4];
  v6 = v5;
  if (!v5 || (_IsValidUserUnitForQuantityType(v5, v4) & 1) == 0)
  {
    uint64_t v7 = _HKGenerateDefaultUnitForQuantityType();

    v6 = (void *)v7;
  }

  return v6;
}

- (void)_notifyUnitPreferencesChanged
{
}

uint64_t __38__FIUnitManager__updatePreferredUnits__block_invoke_336(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  [*(id *)(a1 + 32) _storePreferredUnitsInDefaults:*(void *)(*(void *)(a1 + 32) + 16)];
  id v5 = *(void **)(a1 + 32);
  return [v5 _notifyUnitPreferencesChanged];
}

- (void)_storePreferredUnitsInDefaults:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__FIUnitManager__storePreferredUnitsInDefaults___block_invoke;
  v8[3] = &unk_26441CDB8;
  id v9 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  uint64_t v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v7 setObject:v6 forKey:@"FICachedPreferredUnitsKey"];
}

- (id)_loadPreferredUnitsFromDefaults
{
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"FICachedPreferredUnitsKey"];

  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__FIUnitManager__loadPreferredUnitsFromDefaults__block_invoke;
  v7[3] = &unk_26441CDE0;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __46__FIUnitManager__notifyUnitPreferencesChanged__block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"FIFitnessUnitPreferencesDidChangeNotification" object:0];
}

- (FIUnitManager)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FIUnitManager;
  id v6 = [(FIUnitManager *)&v19 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = (void *)MEMORY[0x263EFF9A0];
    id v9 = [(FIUnitManager *)v7 _loadPreferredUnitsFromDefaults];
    uint64_t v10 = [v8 dictionaryWithDictionary:v9];
    preferredUnits = v7->_preferredUnits;
    v7->_preferredUnits = (NSMutableDictionary *)v10;

    v12 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__FIUnitManager_initWithHealthStore___block_invoke;
    block[3] = &unk_26441CBA0;
    v13 = v7;
    v18 = v13;
    dispatch_async(v12, block);

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v13 selector:sel__userPreferencesDidChange_ name:*MEMORY[0x263F0A018] object:0];

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v13 selector:sel__localeDidChange_ name:*MEMORY[0x263EFF458] object:0];
  }
  return v7;
}

- (void)_updatePreferredUnits
{
  healthStore = self->_healthStore;
  if (_RelevantQuantityTypes_onceToken != -1) {
    dispatch_once(&_RelevantQuantityTypes_onceToken, &__block_literal_global_404);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__FIUnitManager__updatePreferredUnits__block_invoke;
  v4[3] = &unk_26441CE30;
  v4[4] = self;
  [(HKHealthStore *)healthStore preferredUnitsForQuantityTypes:_RelevantQuantityTypes___relevantQuantityTypes completion:v4];
}

void __38__FIUnitManager__updatePreferredUnits__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      __38__FIUnitManager__updatePreferredUnits__block_invoke_cold_1();
    }
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__FIUnitManager__updatePreferredUnits__block_invoke_336;
    v7[3] = &unk_26441CE08;
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

- (double)distanceInDistanceUnit:(unint64_t)a3 forDistanceInMeters:(double)a4
{
  id v6 = (void *)MEMORY[0x263F0A630];
  uint64_t v7 = [MEMORY[0x263F0A830] meterUnit];
  id v8 = [v6 quantityWithUnit:v7 doubleValue:a4];

  id v9 = FIHKUnitForDistanceUnit(a3);
  [v8 doubleValueForUnit:v9];
  double v11 = v10;

  return v11;
}

- (void)_setPreferredHKUnit:(id)a3 forQuantityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v7];
    char v9 = [v8 isEqual:v6];

    if ((v9 & 1) == 0)
    {
      preferredUnits = self->_preferredUnits;
      if (preferredUnits)
      {
        [(NSMutableDictionary *)preferredUnits setObject:v6 forKeyedSubscript:v7];
        [(FIUnitManager *)self _storePreferredUnitsInDefaults:self->_preferredUnits];
      }
      if (_IsValidUserUnitForQuantityType(v6, v7))
      {
        [(HKHealthStore *)self->_healthStore _setPreferredUnit:v6 forType:v7 completion:&__block_literal_global_342];
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
          -[FIUnitManager _setPreferredHKUnit:forQuantityType:]();
        }
      }
    }
  }
}

void __53__FIUnitManager__setPreferredHKUnit_forQuantityType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      __53__FIUnitManager__setPreferredHKUnit_forQuantityType___block_invoke_cold_1();
    }
  }
}

- (unint64_t)paceDistanceUnitForDistanceType:(unint64_t)a3
{
  if (a3 == 9) {
    return 1;
  }
  if (a3 == 4)
  {
    id v4 = [(FIUnitManager *)self userLapLengthHKUnit];
    unint64_t v5 = FIDistanceUnitForHKUnit(v4);

    return v5;
  }
  else
  {
    return -[FIUnitManager userDistanceUnitForDistanceType:](self, "userDistanceUnitForDistanceType:");
  }
}

- (id)userDistanceHKUnitForActivityType:(id)a3
{
  uint64_t v4 = FIDistanceTypeForActivityType(a3);
  return [(FIUnitManager *)self userDistanceHKUnitForDistanceType:v4];
}

+ (id)quantityTypeForDistanceType:(unint64_t)a3
{
  unint64_t v5 = a3 - 1;
  if (a3 - 1 <= 9 && ((0x3EFu >> v5) & 1) != 0)
  {
    id v6 = objc_msgSend(MEMORY[0x263F0A658], "quantityTypeForIdentifier:", **((void **)&unk_26441CE70 + v5), v3);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)setUserDistanceUnit:(unint64_t)a3 forDistanceType:(unint64_t)a4
{
  id v11 = +[FIUnitManager quantityTypeForDistanceType:a4];
  uint64_t v7 = 4;
  if (a3 == 2) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = a3;
  }
  if (a3 != 3) {
    uint64_t v7 = v8;
  }
  if (a4 == 4) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = a3;
  }
  double v10 = FIHKUnitForDistanceUnit(v9);
  [(FIUnitManager *)self _setPreferredHKUnit:v10 forQuantityType:v11];
}

- (unint64_t)userDistanceElevationUnit
{
  if ([(FIUnitManager *)self userDistanceWalkingRunningUnit] - 1 < 2) {
    return 1;
  }
  else {
    return 5;
  }
}

- (id)userDistanceElevationHKUnit
{
  if ([(FIUnitManager *)self userDistanceElevationUnit] == 1) {
    [MEMORY[0x263F0A830] meterUnit];
  }
  else {
  uint64_t v2 = [MEMORY[0x263F0A830] footUnit];
  }
  return v2;
}

- (id)userDistanceCrossCountrySkiingHKUnit
{
  uint64_t v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DA8]];
  uint64_t v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (id)userDistanceDownhillSnowSportsHKUnit
{
  uint64_t v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DB8]];
  uint64_t v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (id)userDistancePaddleSportsHKUnit
{
  uint64_t v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DC0]];
  uint64_t v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (id)userDistanceRowingHKUnit
{
  uint64_t v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DC8]];
  uint64_t v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (id)userDistanceSkatingSportsHKUnit
{
  uint64_t v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DD0]];
  uint64_t v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (id)userLapLengthHKUnit
{
  uint64_t v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DD8]];
  uint64_t v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (void)setUserDepthHKUnit:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F0A658];
  uint64_t v5 = *MEMORY[0x263F09F18];
  id v6 = a3;
  id v7 = [v4 quantityTypeForIdentifier:v5];
  [(FIUnitManager *)self _setPreferredHKUnit:v6 forQuantityType:v7];
}

- (void)setUserWaterTemperatureHKUnit:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F0A658];
  uint64_t v5 = *MEMORY[0x263F09F58];
  id v6 = a3;
  id v7 = [v4 quantityTypeForIdentifier:v5];
  [(FIUnitManager *)self _setPreferredHKUnit:v6 forQuantityType:v7];
}

- (void)setUserDistanceWalkingRunningUnit:(unint64_t)a3
{
  FIHKUnitForDistanceUnit(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DE0]];
  [(FIUnitManager *)self _setPreferredHKUnit:v5 forQuantityType:v4];
}

- (unint64_t)userDistanceCyclingUnit
{
  uint64_t v2 = [(FIUnitManager *)self userDistanceCyclingHKUnit];
  unint64_t v3 = FIDistanceUnitForHKUnit(v2);

  return v3;
}

- (id)userDistanceCyclingHKUnit
{
  unint64_t v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DB0]];
  uint64_t v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (void)setUserDistanceCyclingUnit:(unint64_t)a3
{
  FIHKUnitForDistanceUnit(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DB0]];
  [(FIUnitManager *)self _setPreferredHKUnit:v5 forQuantityType:v4];
}

- (double)paceWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = FIHKUnitForDistanceUnit([(FIUnitManager *)self paceDistanceUnitForDistanceType:a6]);
  double v12 = FIPace(v10, v11, a5, a4);

  return v12;
}

- (double)distanceInMetersForDistanceInUserUnit:(double)a3 distanceType:(unint64_t)a4
{
  id v5 = [(FIUnitManager *)self userDistanceHKUnitForDistanceType:a4];
  id v6 = [MEMORY[0x263F0A630] quantityWithUnit:v5 doubleValue:a3];
  id v7 = [MEMORY[0x263F0A830] meterUnit];
  [v6 doubleValueForUnit:v7];
  double v9 = v8;

  return v9;
}

- (double)distanceInUserDistanceUnitForDistanceInMeters:(double)a3 distanceType:(unint64_t)a4
{
  unint64_t v6 = [(FIUnitManager *)self userDistanceUnitForDistanceType:a4];
  [(FIUnitManager *)self distanceInDistanceUnit:v6 forDistanceInMeters:a3];
  return result;
}

- (void)setUserActiveEnergyBurnedUnit:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F0A658];
  uint64_t v5 = *MEMORY[0x263F09BC0];
  id v6 = a3;
  id v7 = [v4 quantityTypeForIdentifier:v5];
  [(FIUnitManager *)self _setPreferredHKUnit:v6 forQuantityType:v7];
}

- (id)userBasalEnergyBurnedUnit
{
  unint64_t v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09C08]];
  uint64_t v4 = [(FIUnitManager *)self _preferredHKUnitForQuantityType:v3];

  return v4;
}

- (void)setUserBasalEnergyBurnedUnit:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F0A658];
  uint64_t v5 = *MEMORY[0x263F09C08];
  id v6 = a3;
  id v7 = [v4 quantityTypeForIdentifier:v5];
  [(FIUnitManager *)self _setPreferredHKUnit:v6 forQuantityType:v7];
}

- (void)setPreferredUnitsForTesting:(id)a3
{
  self->_preferredUnits = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredUnits, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __38__FIUnitManager__updatePreferredUnits__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21C74B000, v0, v1, "[Fitness] Error fetching preferred units: %@", v2, v3, v4, v5, v6);
}

- (void)_setPreferredHKUnit:forQuantityType:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21C74B000, v0, v1, "[FitnessUI] Attempting to set an invalid user unit: %@", v2, v3, v4, v5, v6);
}

void __53__FIUnitManager__setPreferredHKUnit_forQuantityType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21C74B000, v0, v1, "[FitnessUI] Error setting preferred units: %@", v2, v3, v4, v5, v6);
}

@end