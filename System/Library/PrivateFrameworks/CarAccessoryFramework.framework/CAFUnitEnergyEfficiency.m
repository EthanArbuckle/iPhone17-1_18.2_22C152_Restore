@interface CAFUnitEnergyEfficiency
+ (CAFUnitEnergyEfficiency)milliwattHoursPerKilometer;
+ (CAFUnitEnergyEfficiency)wattHoursPerKilometer;
+ (NSUnitFuelEfficiency)kilowattHoursPer100Kilometers;
+ (NSUnitFuelEfficiency)kilowattHoursPer100Miles;
+ (NSUnitFuelEfficiency)milesPerKilowattHour;
+ (NSUnitFuelEfficiency)wattHoursPerMile;
+ (id)baseUnit;
@end

@implementation CAFUnitEnergyEfficiency

+ (id)baseUnit
{
  return +[CAFUnitEnergyEfficiency wattHoursPerKilometer];
}

+ (CAFUnitEnergyEfficiency)wattHoursPerKilometer
{
  if (wattHoursPerKilometer_onceToken != -1) {
    dispatch_once(&wattHoursPerKilometer_onceToken, &__block_literal_global_86);
  }
  v2 = (void *)wattHoursPerKilometer__wattHoursPerKilometer;
  return (CAFUnitEnergyEfficiency *)v2;
}

void __48__CAFUnitEnergyEfficiency_wattHoursPerKilometer__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0];
  v0 = [(NSDimension *)[CAFUnitEnergyEfficiency alloc] initWithSymbol:@"Wh/km" converter:v2];
  v1 = (void *)wattHoursPerKilometer__wattHoursPerKilometer;
  wattHoursPerKilometer__wattHoursPerKilometer = (uint64_t)v0;
}

+ (CAFUnitEnergyEfficiency)milliwattHoursPerKilometer
{
  if (milliwattHoursPerKilometer_onceToken != -1) {
    dispatch_once(&milliwattHoursPerKilometer_onceToken, &__block_literal_global_91);
  }
  id v2 = (void *)milliwattHoursPerKilometer__milliwattHoursPerKilometer;
  return (CAFUnitEnergyEfficiency *)v2;
}

void __53__CAFUnitEnergyEfficiency_milliwattHoursPerKilometer__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:0.001];
  v0 = [(NSDimension *)[CAFUnitEnergyEfficiency alloc] initWithSymbol:@"mWh/km" converter:v2];
  v1 = (void *)milliwattHoursPerKilometer__milliwattHoursPerKilometer;
  milliwattHoursPerKilometer__milliwattHoursPerKilometer = (uint64_t)v0;
}

+ (NSUnitFuelEfficiency)kilowattHoursPer100Kilometers
{
  if (kilowattHoursPer100Kilometers_onceToken != -1) {
    dispatch_once(&kilowattHoursPer100Kilometers_onceToken, &__block_literal_global_96);
  }
  id v2 = (void *)kilowattHoursPer100Kilometers__kilowattHoursPer100Kilometers;
  return (NSUnitFuelEfficiency *)v2;
}

void __56__CAFUnitEnergyEfficiency_kilowattHoursPer100Kilometers__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:10.0];
  v0 = [(NSDimension *)[CAFUnitEnergyEfficiency alloc] initWithSymbol:@"kWh/100km" converter:v2];
  v1 = (void *)kilowattHoursPer100Kilometers__kilowattHoursPer100Kilometers;
  kilowattHoursPer100Kilometers__kilowattHoursPer100Kilometers = (uint64_t)v0;
}

+ (NSUnitFuelEfficiency)kilowattHoursPer100Miles
{
  if (kilowattHoursPer100Miles_onceToken != -1) {
    dispatch_once(&kilowattHoursPer100Miles_onceToken, &__block_literal_global_101);
  }
  id v2 = (void *)kilowattHoursPer100Miles__kilowattHoursPer100Miles;
  return (NSUnitFuelEfficiency *)v2;
}

void __51__CAFUnitEnergyEfficiency_kilowattHoursPer100Miles__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:6.21371192];
  v0 = [(NSDimension *)[CAFUnitEnergyEfficiency alloc] initWithSymbol:@"kWh/100mi" converter:v2];
  v1 = (void *)kilowattHoursPer100Miles__kilowattHoursPer100Miles;
  kilowattHoursPer100Miles__kilowattHoursPer100Miles = (uint64_t)v0;
}

+ (NSUnitFuelEfficiency)wattHoursPerMile
{
  if (wattHoursPerMile_onceToken != -1) {
    dispatch_once(&wattHoursPerMile_onceToken, &__block_literal_global_106);
  }
  id v2 = (void *)wattHoursPerMile__wattHoursPerMile;
  return (NSUnitFuelEfficiency *)v2;
}

void __43__CAFUnitEnergyEfficiency_wattHoursPerMile__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:0.621371192];
  v0 = [(NSDimension *)[CAFUnitEnergyEfficiency alloc] initWithSymbol:@"Wh/mi" converter:v2];
  v1 = (void *)wattHoursPerMile__wattHoursPerMile;
  wattHoursPerMile__wattHoursPerMile = (uint64_t)v0;
}

+ (NSUnitFuelEfficiency)milesPerKilowattHour
{
  if (milesPerKilowattHour_onceToken != -1) {
    dispatch_once(&milesPerKilowattHour_onceToken, &__block_literal_global_111);
  }
  id v2 = (void *)milesPerKilowattHour__milesPerKilowattHour;
  return (NSUnitFuelEfficiency *)v2;
}

void __47__CAFUnitEnergyEfficiency_milesPerKilowattHour__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:621.371192];
  v0 = [(NSDimension *)[CAFUnitEnergyEfficiency alloc] initWithSymbol:@"mi/kWh" converter:v2];
  v1 = (void *)milesPerKilowattHour__milesPerKilowattHour;
  milesPerKilowattHour__milesPerKilowattHour = (uint64_t)v0;
}

@end