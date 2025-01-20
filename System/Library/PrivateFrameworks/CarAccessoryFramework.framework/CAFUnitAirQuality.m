@interface CAFUnitAirQuality
+ (CAFUnitAirQuality)aqi;
+ (id)baseUnit;
@end

@implementation CAFUnitAirQuality

+ (id)baseUnit
{
  return +[CAFUnitAirQuality aqi];
}

+ (CAFUnitAirQuality)aqi
{
  if (aqi_onceToken != -1) {
    dispatch_once(&aqi_onceToken, &__block_literal_global_56);
  }
  v2 = (void *)aqi__airQualityIndex;
  return (CAFUnitAirQuality *)v2;
}

void __24__CAFUnitAirQuality_aqi__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0 constant:273.15];
  v0 = [(NSDimension *)[CAFUnitAirQuality alloc] initWithSymbol:@"AQI" converter:v2];
  v1 = (void *)aqi__airQualityIndex;
  aqi__airQualityIndex = (uint64_t)v0;
}

@end