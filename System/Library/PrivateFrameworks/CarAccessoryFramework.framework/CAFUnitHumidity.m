@interface CAFUnitHumidity
+ (CAFUnitHumidity)absoluteHumidity;
+ (CAFUnitHumidity)dewPointCelcius;
+ (CAFUnitHumidity)dewPointFahrenheit;
+ (CAFUnitHumidity)percent;
+ (CAFUnitHumidity)specificHumidity;
+ (id)baseUnit;
@end

@implementation CAFUnitHumidity

+ (id)baseUnit
{
  return +[CAFUnitHumidity absoluteHumidity];
}

+ (CAFUnitHumidity)absoluteHumidity
{
  if (absoluteHumidity_onceToken != -1) {
    dispatch_once(&absoluteHumidity_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)absoluteHumidity__absoluteHumidity;
  return (CAFUnitHumidity *)v2;
}

void __35__CAFUnitHumidity_absoluteHumidity__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0 constant:273.15];
  v0 = [(NSDimension *)[CAFUnitHumidity alloc] initWithSymbol:@"mg/L" converter:v2];
  v1 = (void *)absoluteHumidity__absoluteHumidity;
  absoluteHumidity__absoluteHumidity = (uint64_t)v0;
}

+ (CAFUnitHumidity)percent
{
  if (percent_onceToken != -1) {
    dispatch_once(&percent_onceToken, &__block_literal_global_25);
  }
  id v2 = (void *)percent__relativeHumidity;
  return (CAFUnitHumidity *)v2;
}

void __26__CAFUnitHumidity_percent__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0 constant:273.15];
  v0 = [(NSDimension *)[CAFUnitHumidity alloc] initWithSymbol:@"%" converter:v2];
  v1 = (void *)percent__relativeHumidity;
  percent__relativeHumidity = (uint64_t)v0;
}

+ (CAFUnitHumidity)specificHumidity
{
  if (specificHumidity_onceToken != -1) {
    dispatch_once(&specificHumidity_onceToken, &__block_literal_global_30);
  }
  id v2 = (void *)specificHumidity__specificHumidity;
  return (CAFUnitHumidity *)v2;
}

void __35__CAFUnitHumidity_specificHumidity__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0 constant:273.15];
  v0 = [(NSDimension *)[CAFUnitHumidity alloc] initWithSymbol:@"g/kg" converter:v2];
  v1 = (void *)specificHumidity__specificHumidity;
  specificHumidity__specificHumidity = (uint64_t)v0;
}

+ (CAFUnitHumidity)dewPointCelcius
{
  if (dewPointCelcius_onceToken != -1) {
    dispatch_once(&dewPointCelcius_onceToken, &__block_literal_global_35);
  }
  id v2 = (void *)dewPointCelcius__dewPoint;
  return (CAFUnitHumidity *)v2;
}

void __34__CAFUnitHumidity_dewPointCelcius__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0 constant:273.15];
  v0 = [(NSDimension *)[CAFUnitHumidity alloc] initWithSymbol:@"°C" converter:v2];
  v1 = (void *)dewPointCelcius__dewPoint;
  dewPointCelcius__dewPoint = (uint64_t)v0;
}

+ (CAFUnitHumidity)dewPointFahrenheit
{
  if (dewPointFahrenheit_onceToken != -1) {
    dispatch_once(&dewPointFahrenheit_onceToken, &__block_literal_global_40);
  }
  id v2 = (void *)dewPointFahrenheit__dewPoint;
  return (CAFUnitHumidity *)v2;
}

void __37__CAFUnitHumidity_dewPointFahrenheit__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0 constant:273.15];
  v0 = [(NSDimension *)[CAFUnitHumidity alloc] initWithSymbol:@"°F" converter:v2];
  v1 = (void *)dewPointFahrenheit__dewPoint;
  dewPointFahrenheit__dewPoint = (uint64_t)v0;
}

@end