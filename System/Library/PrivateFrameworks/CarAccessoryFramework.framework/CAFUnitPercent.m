@interface CAFUnitPercent
+ (CAFUnitPercent)percent;
+ (id)baseUnit;
@end

@implementation CAFUnitPercent

+ (id)baseUnit
{
  return +[CAFUnitPercent percent];
}

+ (CAFUnitPercent)percent
{
  if (percent_onceToken_164 != -1) {
    dispatch_once(&percent_onceToken_164, &__block_literal_global_166);
  }
  v2 = (void *)percent__percent;
  return (CAFUnitPercent *)v2;
}

void __25__CAFUnitPercent_percent__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0];
  v0 = [(NSDimension *)[CAFUnitPercent alloc] initWithSymbol:@"%" converter:v2];
  v1 = (void *)percent__percent;
  percent__percent = (uint64_t)v0;
}

@end