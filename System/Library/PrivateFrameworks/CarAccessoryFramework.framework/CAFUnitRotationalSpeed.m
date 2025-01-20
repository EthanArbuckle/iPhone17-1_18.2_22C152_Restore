@interface CAFUnitRotationalSpeed
+ (CAFUnitRotationalSpeed)degreesPerSecond;
+ (CAFUnitRotationalSpeed)revolutionsPerMinute;
+ (id)baseUnit;
@end

@implementation CAFUnitRotationalSpeed

+ (id)baseUnit
{
  return +[CAFUnitRotationalSpeed revolutionsPerMinute];
}

+ (CAFUnitRotationalSpeed)revolutionsPerMinute
{
  if (revolutionsPerMinute_onceToken != -1) {
    dispatch_once(&revolutionsPerMinute_onceToken, &__block_literal_global_145);
  }
  v2 = (void *)revolutionsPerMinute__revolutionsPerMinute;
  return (CAFUnitRotationalSpeed *)v2;
}

void __46__CAFUnitRotationalSpeed_revolutionsPerMinute__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0];
  v0 = [(NSDimension *)[CAFUnitRotationalSpeed alloc] initWithSymbol:@"rpm" converter:v2];
  v1 = (void *)revolutionsPerMinute__revolutionsPerMinute;
  revolutionsPerMinute__revolutionsPerMinute = (uint64_t)v0;
}

+ (CAFUnitRotationalSpeed)degreesPerSecond
{
  if (degreesPerSecond_onceToken != -1) {
    dispatch_once(&degreesPerSecond_onceToken, &__block_literal_global_150);
  }
  id v2 = (void *)degreesPerSecond__degreesPerSecond;
  return (CAFUnitRotationalSpeed *)v2;
}

void __42__CAFUnitRotationalSpeed_degreesPerSecond__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:0.166666667];
  v0 = [(NSDimension *)[CAFUnitRotationalSpeed alloc] initWithSymbol:@"deg/s" converter:v2];
  v1 = (void *)degreesPerSecond__degreesPerSecond;
  degreesPerSecond__degreesPerSecond = (uint64_t)v0;
}

@end