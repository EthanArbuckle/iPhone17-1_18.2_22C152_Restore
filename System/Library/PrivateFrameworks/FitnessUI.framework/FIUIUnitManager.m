@interface FIUIUnitManager
+ (id)quantityTypeForDistanceType:(unint64_t)a3;
+ (id)sharedManager;
- (FIUIUnitManager)init;
- (FIUIUnitManager)initWithHealthStore:(id)a3;
- (FIUIUnitManager)initWithUnitManager:(id)a3;
- (FIUnitManager)unitManager;
- (double)distanceInDistanceUnit:(unint64_t)a3 forDistanceInMeters:(double)a4;
- (double)distanceInMetersForDistanceInUserUnit:(double)a3 distanceType:(unint64_t)a4;
- (double)distanceInUserDistanceUnitForDistanceInMeters:(double)a3 distanceType:(unint64_t)a4;
- (double)paceWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6;
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
- (void)setPreferredUnitsForTesting:(id)a3;
- (void)setUserActiveEnergyBurnedUnit:(id)a3;
- (void)setUserBasalEnergyBurnedUnit:(id)a3;
- (void)setUserDepthHKUnit:(id)a3;
- (void)setUserDistanceCyclingUnit:(unint64_t)a3;
- (void)setUserDistanceUnit:(unint64_t)a3 forDistanceType:(unint64_t)a4;
- (void)setUserDistanceWalkingRunningUnit:(unint64_t)a3;
- (void)setUserWaterTemperatureHKUnit:(id)a3;
@end

@implementation FIUIUnitManager

- (FIUIUnitManager)initWithHealthStore:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F3D178];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithHealthStore:v5];

  v7 = [(FIUIUnitManager *)self initWithUnitManager:v6];
  return v7;
}

- (void)_notifyUnitPreferencesChanged
{
}

void __48__FIUIUnitManager__notifyUnitPreferencesChanged__block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"FitnessUnitPreferencesDidChangeNotification" object:0];
}

- (unint64_t)userDistanceUnitForDistanceType:(unint64_t)a3
{
  return [(FIUnitManager *)self->_unitManager userDistanceUnitForDistanceType:a3];
}

- (id)userDistanceHKUnitForDistanceType:(unint64_t)a3
{
  return (id)[(FIUnitManager *)self->_unitManager userDistanceHKUnitForDistanceType:a3];
}

- (id)userDistanceWalkingRunningHKUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userDistanceWalkingRunningHKUnit];
}

- (id)userActiveEnergyBurnedUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userActiveEnergyBurnedUnit];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedManager___unitPreferencesManager;
  return v2;
}

uint64_t __32__FIUIUnitManager_sharedManager__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F0A410]);
  v1 = (void *)sharedManager___healthStore;
  sharedManager___healthStore = (uint64_t)v0;

  v2 = [FIUIUnitManager alloc];
  sharedManager___unitPreferencesManager = [(FIUIUnitManager *)v2 initWithHealthStore:sharedManager___healthStore];
  return MEMORY[0x270F9A758]();
}

- (FIUIUnitManager)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F3D178]);
  v4 = [(FIUIUnitManager *)self initWithUnitManager:v3];

  return v4;
}

- (FIUIUnitManager)initWithUnitManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FIUIUnitManager;
  v6 = [(FIUIUnitManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_unitManager, a3);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel__notifyUnitPreferencesChanged name:*MEMORY[0x263F3D188] object:0];
  }
  return v7;
}

- (unint64_t)paceDistanceUnitForDistanceType:(unint64_t)a3
{
  return [(FIUnitManager *)self->_unitManager paceDistanceUnitForDistanceType:a3];
}

+ (id)quantityTypeForDistanceType:(unint64_t)a3
{
  return (id)[MEMORY[0x263F3D178] quantityTypeForDistanceType:a3];
}

- (id)userDistanceHKUnitForActivityType:(id)a3
{
  unitManager = self->_unitManager;
  v4 = [a3 workoutActivityType];
  id v5 = [(FIUnitManager *)unitManager userDistanceHKUnitForActivityType:v4];

  return v5;
}

- (void)setUserDistanceUnit:(unint64_t)a3 forDistanceType:(unint64_t)a4
{
}

- (unint64_t)userDistanceWalkingRunningUnit
{
  return [(FIUnitManager *)self->_unitManager userDistanceWalkingRunningUnit];
}

- (unint64_t)userDistanceElevationUnit
{
  return [(FIUnitManager *)self->_unitManager userDistanceElevationUnit];
}

- (id)userDistanceElevationHKUnit
{
  if ([(FIUIUnitManager *)self userDistanceElevationUnit] == 1) {
    [MEMORY[0x263F0A830] meterUnit];
  }
  else {
  v2 = [MEMORY[0x263F0A830] footUnit];
  }
  return v2;
}

- (id)userDistanceCrossCountrySkiingHKUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userDistanceCrossCountrySkiingHKUnit];
}

- (id)userDistanceDownhillSnowSportsHKUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userDistanceDownhillSnowSportsHKUnit];
}

- (id)userDistancePaddleSportsHKUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userDistancePaddleSportsHKUnit];
}

- (id)userDistanceRowingHKUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userDistanceRowingHKUnit];
}

- (id)userDistanceSkatingSportsHKUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userDistanceSkatingSportsHKUnit];
}

- (id)userLapLengthHKUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userLapLengthHKUnit];
}

- (id)userDepthHKUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userDepthHKUnit];
}

- (void)setUserDepthHKUnit:(id)a3
{
}

- (id)userWaterTemperatureHKUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userWaterTemperatureHKUnit];
}

- (void)setUserWaterTemperatureHKUnit:(id)a3
{
}

- (void)setUserDistanceWalkingRunningUnit:(unint64_t)a3
{
}

- (unint64_t)userDistanceCyclingUnit
{
  return [(FIUnitManager *)self->_unitManager userDistanceCyclingUnit];
}

- (id)userDistanceCyclingHKUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userDistanceCyclingHKUnit];
}

- (void)setUserDistanceCyclingUnit:(unint64_t)a3
{
}

- (double)paceWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6
{
  [(FIUnitManager *)self->_unitManager paceWithDistance:a3 overDuration:a5 paceFormat:a6 distanceType:a4];
  return result;
}

- (double)distanceInMetersForDistanceInUserUnit:(double)a3 distanceType:(unint64_t)a4
{
  [(FIUnitManager *)self->_unitManager distanceInMetersForDistanceInUserUnit:a4 distanceType:a3];
  return result;
}

- (double)distanceInUserDistanceUnitForDistanceInMeters:(double)a3 distanceType:(unint64_t)a4
{
  [(FIUnitManager *)self->_unitManager distanceInUserDistanceUnitForDistanceInMeters:a4 distanceType:a3];
  return result;
}

- (double)distanceInDistanceUnit:(unint64_t)a3 forDistanceInMeters:(double)a4
{
  [(FIUnitManager *)self->_unitManager distanceInDistanceUnit:a3 forDistanceInMeters:a4];
  return result;
}

- (void)setUserActiveEnergyBurnedUnit:(id)a3
{
}

- (id)userBasalEnergyBurnedUnit
{
  return (id)[(FIUnitManager *)self->_unitManager userBasalEnergyBurnedUnit];
}

- (void)setUserBasalEnergyBurnedUnit:(id)a3
{
}

- (void)setPreferredUnitsForTesting:(id)a3
{
}

- (FIUnitManager)unitManager
{
  return self->_unitManager;
}

- (void).cxx_destruct
{
}

@end