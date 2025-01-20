@interface NSUnitEnergy
@end

@implementation NSUnitEnergy

void __47__NSUnitEnergy_CPChargePrecondition__wattHours__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:3600.0];
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08CC0]) initWithSymbol:@"Wh" converter:v2];
  v1 = (void *)wattHours__wattHours;
  wattHours__wattHours = v0;
}

@end