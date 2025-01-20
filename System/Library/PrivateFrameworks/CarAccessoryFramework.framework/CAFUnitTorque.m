@interface CAFUnitTorque
+ (CAFUnitTorque)footPound;
+ (CAFUnitTorque)newtonMeter;
+ (id)baseUnit;
@end

@implementation CAFUnitTorque

+ (id)baseUnit
{
  return +[CAFUnitTorque newtonMeter];
}

+ (CAFUnitTorque)newtonMeter
{
  if (newtonMeter_onceToken != -1) {
    dispatch_once(&newtonMeter_onceToken, &__block_literal_global_183);
  }
  v2 = (void *)newtonMeter_newtonMeter;
  return (CAFUnitTorque *)v2;
}

void __28__CAFUnitTorque_newtonMeter__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0];
  v0 = [(NSDimension *)[CAFUnitTorque alloc] initWithSymbol:@"Nm" converter:v2];
  v1 = (void *)newtonMeter_newtonMeter;
  newtonMeter_newtonMeter = (uint64_t)v0;
}

+ (CAFUnitTorque)footPound
{
  if (footPound_onceToken != -1) {
    dispatch_once(&footPound_onceToken, &__block_literal_global_188);
  }
  id v2 = (void *)footPound_footPound;
  return (CAFUnitTorque *)v2;
}

void __26__CAFUnitTorque_footPound__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.35581795];
  v0 = [(NSDimension *)[CAFUnitTorque alloc] initWithSymbol:@"ft-lb" converter:v2];
  v1 = (void *)footPound_footPound;
  footPound_footPound = (uint64_t)v0;
}

@end