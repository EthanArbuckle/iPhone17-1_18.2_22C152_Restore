@interface NSUnitFuelEfficiency
@end

@implementation NSUnitFuelEfficiency

void __60__NSUnitFuelEfficiency_CAFUnit__millilitersPer100Kilometers__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:0.001];
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08CD0]) initWithSymbol:@"mL/100km" converter:v2];
  v1 = (void *)millilitersPer100Kilometers__millilitersPer100Kilometers;
  millilitersPer100Kilometers__millilitersPer100Kilometers = v0;
}

@end