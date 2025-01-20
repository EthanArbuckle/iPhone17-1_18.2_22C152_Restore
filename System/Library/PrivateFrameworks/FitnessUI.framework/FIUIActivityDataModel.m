@interface FIUIActivityDataModel
+ (id)formattingManager;
+ (id)idealizedModel;
+ (id)lockedModel;
- (BOOL)areFitnessAppsRestricted;
- (BOOL)databaseLoading;
- (BOOL)deviceLocked;
- (BOOL)paused;
- (BOOL)userHasDoneActivitySetup;
- (BOOL)wheelchairUser;
- (HKQuantity)activeEnergyGoal;
- (HKQuantity)activeEnergyTotal;
- (NSArray)activeEnergyChartData;
- (NSArray)appleExerciseTimeChartData;
- (NSArray)appleMoveTimeChartData;
- (NSArray)appleStandHourChartData;
- (NSDate)date;
- (double)activeEnergyCompletionPercentage;
- (double)appleExerciseTimeCompletionPercentage;
- (double)appleExerciseTimeGoal;
- (double)appleExerciseTimeTotal;
- (double)appleMoveTimeCompletionPercentage;
- (double)appleMoveTimeGoal;
- (double)appleMoveTimeTotal;
- (double)appleStandHourCompletionPercentage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)loggingString;
- (int64_t)activityMoveMode;
- (int64_t)appleStandHoursGoal;
- (int64_t)appleStandHoursTotal;
- (void)setActiveEnergyChartData:(id)a3;
- (void)setActiveEnergyGoal:(id)a3;
- (void)setActiveEnergyTotal:(id)a3;
- (void)setActivityMoveMode:(int64_t)a3;
- (void)setAppleExerciseTimeChartData:(id)a3;
- (void)setAppleExerciseTimeGoal:(double)a3;
- (void)setAppleExerciseTimeTotal:(double)a3;
- (void)setAppleMoveTimeChartData:(id)a3;
- (void)setAppleMoveTimeGoal:(double)a3;
- (void)setAppleMoveTimeTotal:(double)a3;
- (void)setAppleStandHourChartData:(id)a3;
- (void)setAppleStandHoursGoal:(int64_t)a3;
- (void)setAppleStandHoursTotal:(int64_t)a3;
- (void)setAreFitnessAppsRestricted:(BOOL)a3;
- (void)setDatabaseLoading:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setWheelchairUser:(BOOL)a3;
@end

@implementation FIUIActivityDataModel

+ (id)lockedModel
{
  v2 = (unsigned char *)objc_opt_new();
  v2[11] = 1;
  return v2;
}

+ (id)idealizedModel
{
  if (idealizedModel_onceToken != -1) {
    dispatch_once(&idealizedModel_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)idealizedModel_idealizedModel;
  return v2;
}

uint64_t __39__FIUIActivityDataModel_idealizedModel__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)idealizedModel_idealizedModel;
  idealizedModel_idealizedModel = v0;

  v2 = (void *)idealizedModel_idealizedModel;
  v3 = (void *)MEMORY[0x263F0A630];
  v4 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v5 = [v3 quantityWithUnit:v4 doubleValue:500.0];
  [v2 setActiveEnergyGoal:v5];

  v6 = (void *)idealizedModel_idealizedModel;
  v7 = [(id)idealizedModel_idealizedModel activeEnergyGoal];
  [v6 setActiveEnergyTotal:v7];

  [(id)idealizedModel_idealizedModel setAppleStandHoursGoal:12];
  objc_msgSend((id)idealizedModel_idealizedModel, "setAppleStandHoursTotal:", objc_msgSend((id)idealizedModel_idealizedModel, "appleStandHoursGoal"));
  [(id)idealizedModel_idealizedModel setAppleExerciseTimeGoal:30.0];
  v8 = (void *)idealizedModel_idealizedModel;
  [(id)idealizedModel_idealizedModel appleExerciseTimeGoal];
  return objc_msgSend(v8, "setAppleExerciseTimeTotal:");
}

- (id)debugDescription
{
  v3 = [(FIUIActivityDataModel *)self activeEnergyGoal];
  v4 = _kilocalorieUnit();
  [v3 doubleValueForUnit:v4];
  uint64_t v6 = v5;

  v7 = [(FIUIActivityDataModel *)self activeEnergyTotal];
  v8 = _kilocalorieUnit();
  [v7 doubleValueForUnit:v8];
  uint64_t v10 = v9;

  v11 = NSString;
  v12 = [(FIUIActivityDataModel *)self date];
  [(FIUIActivityDataModel *)self appleMoveTimeGoal];
  uint64_t v14 = v13;
  [(FIUIActivityDataModel *)self appleMoveTimeTotal];
  uint64_t v16 = v15;
  [(FIUIActivityDataModel *)self appleExerciseTimeGoal];
  uint64_t v18 = v17;
  [(FIUIActivityDataModel *)self appleExerciseTimeTotal];
  v20 = [v11 stringWithFormat:@"Date: %@, Active Energy Goal: %f, Active Energy Total: %f, Apple Move Time Goal: %f, Apple Move Time Total: %f, Apple Exercise Time Goal: %f, Apple Exercise Time Total: %f, Apple Stand Hours Goal: %ld, Apple Stand Hours Total: %ld, databaseLoading %i, userHasDoneActivitySetup %i, deviceLocked %i, privacy %i areFitnessAppsRestricted %i paused %i", v12, v6, v10, v14, v16, v18, v19, -[FIUIActivityDataModel appleStandHoursGoal](self, "appleStandHoursGoal"), -[FIUIActivityDataModel appleStandHoursTotal](self, "appleStandHoursTotal"), self->_databaseLoading, -[FIUIActivityDataModel userHasDoneActivitySetup](self, "userHasDoneActivitySetup"), self->_deviceLocked, 0, self->_areFitnessAppsRestricted, self->_paused];

  return v20;
}

- (BOOL)userHasDoneActivitySetup
{
  if ([(FIUIActivityDataModel *)self activityMoveMode] == 2)
  {
    [(FIUIActivityDataModel *)self appleMoveTimeGoal];
    double v4 = v3;
  }
  else
  {
    uint64_t v5 = [(FIUIActivityDataModel *)self activeEnergyGoal];
    uint64_t v6 = _kilocalorieUnit();
    [v5 doubleValueForUnit:v6];
    double v4 = v7;
  }
  return v4 > 0.0;
}

- (double)activeEnergyCompletionPercentage
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(FIUIActivityDataModel *)self deviceLocked]
    || [(FIUIActivityDataModel *)self areFitnessAppsRestricted]
    || [(FIUIActivityDataModel *)self activityMoveMode] == 2
    || ![(FIUIActivityDataModel *)self userHasDoneActivitySetup]
    || [(FIUIActivityDataModel *)self databaseLoading]
    || [(FIUIActivityDataModel *)self paused])
  {
    _HKInitializeLogging();
    double v3 = (void *)*MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      double v4 = v3;
      uint64_t v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      double v7 = [(FIUIActivityDataModel *)self loggingString];
      int v17 = 138412546;
      uint64_t v18 = v6;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_21E433000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v17, 0x16u);
    }
    return *MEMORY[0x263F23918];
  }
  else
  {
    uint64_t v9 = [(FIUIActivityDataModel *)self activeEnergyGoal];
    uint64_t v10 = _kilocalorieUnit();
    [v9 doubleValueForUnit:v10];
    double v12 = v11;

    uint64_t v13 = [(FIUIActivityDataModel *)self activeEnergyTotal];
    uint64_t v14 = _kilocalorieUnit();
    [v13 doubleValueForUnit:v14];
    double v16 = v15;

    double result = v16 / v12;
    if (v12 <= 0.0) {
      return 0.0;
    }
  }
  return result;
}

- (double)appleMoveTimeCompletionPercentage
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(FIUIActivityDataModel *)self deviceLocked]
    || [(FIUIActivityDataModel *)self areFitnessAppsRestricted]
    || ![(FIUIActivityDataModel *)self userHasDoneActivitySetup]
    || [(FIUIActivityDataModel *)self databaseLoading]
    || [(FIUIActivityDataModel *)self activityMoveMode] != 2
    || [(FIUIActivityDataModel *)self paused])
  {
    _HKInitializeLogging();
    double v3 = (void *)*MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      double v4 = v3;
      uint64_t v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      double v7 = [(FIUIActivityDataModel *)self loggingString];
      int v14 = 138412546;
      double v15 = v6;
      __int16 v16 = 2112;
      int v17 = v7;
      _os_log_impl(&dword_21E433000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v14, 0x16u);
    }
    return *MEMORY[0x263F23918];
  }
  else
  {
    [(FIUIActivityDataModel *)self appleMoveTimeGoal];
    double v10 = v9;
    double result = 0.0;
    if (v10 > 0.0)
    {
      [(FIUIActivityDataModel *)self appleMoveTimeTotal];
      double v12 = v11;
      [(FIUIActivityDataModel *)self appleMoveTimeGoal];
      return v12 / v13;
    }
  }
  return result;
}

- (double)appleExerciseTimeCompletionPercentage
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(FIUIActivityDataModel *)self deviceLocked]
    || [(FIUIActivityDataModel *)self areFitnessAppsRestricted]
    || ![(FIUIActivityDataModel *)self userHasDoneActivitySetup]
    || [(FIUIActivityDataModel *)self databaseLoading]
    || [(FIUIActivityDataModel *)self paused])
  {
    _HKInitializeLogging();
    double v3 = (void *)*MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      double v4 = v3;
      uint64_t v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      double v7 = [(FIUIActivityDataModel *)self loggingString];
      int v14 = 138412546;
      double v15 = v6;
      __int16 v16 = 2112;
      int v17 = v7;
      _os_log_impl(&dword_21E433000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v14, 0x16u);
    }
    return *MEMORY[0x263F23918];
  }
  else
  {
    [(FIUIActivityDataModel *)self appleExerciseTimeGoal];
    double v10 = v9;
    double result = 0.0;
    if (v10 > 0.0)
    {
      [(FIUIActivityDataModel *)self appleExerciseTimeTotal];
      double v12 = v11;
      [(FIUIActivityDataModel *)self appleExerciseTimeGoal];
      return v12 / v13;
    }
  }
  return result;
}

- (double)appleStandHourCompletionPercentage
{
  if ([(FIUIActivityDataModel *)self deviceLocked]
    || [(FIUIActivityDataModel *)self areFitnessAppsRestricted]
    || ![(FIUIActivityDataModel *)self userHasDoneActivitySetup]
    || [(FIUIActivityDataModel *)self databaseLoading]
    || [(FIUIActivityDataModel *)self paused])
  {
    return *MEMORY[0x263F23918];
  }
  if ([(FIUIActivityDataModel *)self appleStandHoursGoal] < 1) {
    return 0.0;
  }
  double v4 = (double)[(FIUIActivityDataModel *)self appleStandHoursTotal];
  return v4 / (double)[(FIUIActivityDataModel *)self appleStandHoursGoal];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = (unsigned char *)objc_opt_new();
  [v4 setActivityMoveMode:self->_activityMoveMode];
  [v4 setActiveEnergyTotal:self->_activeEnergyTotal];
  [v4 setActiveEnergyGoal:self->_activeEnergyGoal];
  [v4 setAppleMoveTimeTotal:self->_appleMoveTimeTotal];
  [v4 setAppleMoveTimeGoal:self->_appleMoveTimeGoal];
  [v4 setAppleExerciseTimeTotal:self->_appleExerciseTimeTotal];
  [v4 setAppleExerciseTimeGoal:self->_appleExerciseTimeGoal];
  [v4 setAppleStandHoursTotal:self->_appleStandHoursTotal];
  [v4 setAppleStandHoursGoal:self->_appleStandHoursGoal];
  [v4 setWheelchairUser:self->_wheelchairUser];
  [v4 setPaused:self->_paused];
  [v4 setActiveEnergyChartData:self->_activeEnergyChartData];
  [v4 setAppleExerciseTimeChartData:self->_appleExerciseTimeChartData];
  [v4 setAppleStandHourChartData:self->_appleStandHourChartData];
  v4[11] = self->_deviceLocked;
  v4[12] = self->_areFitnessAppsRestricted;
  return v4;
}

+ (id)formattingManager
{
  if (formattingManager_onceToken != -1) {
    dispatch_once(&formattingManager_onceToken, &__block_literal_global_285);
  }
  v2 = (void *)formattingManager___formattingManager;
  return v2;
}

void __42__FIUIActivityDataModel_formattingManager__block_invoke()
{
  objc_msgSend(MEMORY[0x263F0A410], "fiui_sharedHealthStoreForCarousel");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [[FIUIUnitManager alloc] initWithHealthStore:v3];
  v1 = [[FIUIFormattingManager alloc] initWithUnitManager:v0];
  v2 = (void *)formattingManager___formattingManager;
  formattingManager___formattingManager = (uint64_t)v1;
}

- (id)loggingString
{
  id v3 = [MEMORY[0x263F089D8] stringWithFormat:@"%s returning ARUIRingPercentageValueNoRing, with reason deviceLocked: %u, hasDoneActivitySetup: %i, databaseLoading: %u", "-[FIUIActivityDataModel loggingString]", -[FIUIActivityDataModel deviceLocked](self, "deviceLocked"), -[FIUIActivityDataModel userHasDoneActivitySetup](self, "userHasDoneActivitySetup"), -[FIUIActivityDataModel databaseLoading](self, "databaseLoading")];
  double v4 = [NSString stringWithFormat:@", activityMoveMode: %ld", -[FIUIActivityDataModel activityMoveMode](self, "activityMoveMode")];
  [v3 appendString:v4];
  uint64_t v5 = [NSString stringWithFormat:@", paused: %u", -[FIUIActivityDataModel paused](self, "paused")];
  [v3 appendString:v5];

  return v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (void)setActivityMoveMode:(int64_t)a3
{
  self->_activityMoveMode = a3;
}

- (HKQuantity)activeEnergyTotal
{
  return self->_activeEnergyTotal;
}

- (void)setActiveEnergyTotal:(id)a3
{
}

- (HKQuantity)activeEnergyGoal
{
  return self->_activeEnergyGoal;
}

- (void)setActiveEnergyGoal:(id)a3
{
}

- (double)appleMoveTimeTotal
{
  return self->_appleMoveTimeTotal;
}

- (void)setAppleMoveTimeTotal:(double)a3
{
  self->_appleMoveTimeTotal = a3;
}

- (double)appleMoveTimeGoal
{
  return self->_appleMoveTimeGoal;
}

- (void)setAppleMoveTimeGoal:(double)a3
{
  self->_appleMoveTimeGoal = a3;
}

- (double)appleExerciseTimeTotal
{
  return self->_appleExerciseTimeTotal;
}

- (void)setAppleExerciseTimeTotal:(double)a3
{
  self->_appleExerciseTimeTotal = a3;
}

- (double)appleExerciseTimeGoal
{
  return self->_appleExerciseTimeGoal;
}

- (void)setAppleExerciseTimeGoal:(double)a3
{
  self->_appleExerciseTimeGoal = a3;
}

- (BOOL)wheelchairUser
{
  return self->_wheelchairUser;
}

- (void)setWheelchairUser:(BOOL)a3
{
  self->_wheelchairUser = a3;
}

- (int64_t)appleStandHoursTotal
{
  return self->_appleStandHoursTotal;
}

- (void)setAppleStandHoursTotal:(int64_t)a3
{
  self->_appleStandHoursTotal = a3;
}

- (int64_t)appleStandHoursGoal
{
  return self->_appleStandHoursGoal;
}

- (void)setAppleStandHoursGoal:(int64_t)a3
{
  self->_appleStandHoursGoal = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (NSArray)activeEnergyChartData
{
  return self->_activeEnergyChartData;
}

- (void)setActiveEnergyChartData:(id)a3
{
}

- (NSArray)appleMoveTimeChartData
{
  return self->_appleMoveTimeChartData;
}

- (void)setAppleMoveTimeChartData:(id)a3
{
}

- (NSArray)appleExerciseTimeChartData
{
  return self->_appleExerciseTimeChartData;
}

- (void)setAppleExerciseTimeChartData:(id)a3
{
}

- (NSArray)appleStandHourChartData
{
  return self->_appleStandHourChartData;
}

- (void)setAppleStandHourChartData:(id)a3
{
}

- (BOOL)databaseLoading
{
  return self->_databaseLoading;
}

- (void)setDatabaseLoading:(BOOL)a3
{
  self->_databaseLoading = a3;
}

- (BOOL)deviceLocked
{
  return self->_deviceLocked;
}

- (BOOL)areFitnessAppsRestricted
{
  return self->_areFitnessAppsRestricted;
}

- (void)setAreFitnessAppsRestricted:(BOOL)a3
{
  self->_areFitnessAppsRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleStandHourChartData, 0);
  objc_storeStrong((id *)&self->_appleExerciseTimeChartData, 0);
  objc_storeStrong((id *)&self->_appleMoveTimeChartData, 0);
  objc_storeStrong((id *)&self->_activeEnergyChartData, 0);
  objc_storeStrong((id *)&self->_activeEnergyGoal, 0);
  objc_storeStrong((id *)&self->_activeEnergyTotal, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end