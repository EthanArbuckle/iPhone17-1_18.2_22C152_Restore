@interface NSUnitSpeed
@end

@implementation NSUnitSpeed

void __37__NSUnitSpeed_CAFUnit__metersPerHour__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:0.000277777778];
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08D18]) initWithSymbol:@"m/h" converter:v2];
  v1 = (void *)metersPerHour_metersPerHour;
  metersPerHour_metersPerHour = v0;
}

@end