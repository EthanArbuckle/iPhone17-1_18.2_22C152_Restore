@interface EDAMPricingModel
+ (id)structFields;
+ (id)structName;
- (NSNumber)gnomeActive;
- (NSNumber)gnomeWarmingPeriod;
- (NSNumber)pricingModelStart;
- (void)setGnomeActive:(id)a3;
- (void)setGnomeWarmingPeriod:(id)a3;
- (void)setPricingModelStart:(id)a3;
@end

@implementation EDAMPricingModel

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_757;
  if (!structFields_structFields_757)
  {
    v3 = +[FATField fieldWithIndex:1 type:2 optional:1 name:@"gnomeActive"];
    v4 = +[FATField fieldWithIndex:2, 2, 1, @"gnomeWarmingPeriod", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:10 optional:1 name:@"pricingModelStart"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_757;
    structFields_structFields_757 = v6;

    v2 = (void *)structFields_structFields_757;
  }
  return v2;
}

+ (id)structName
{
  return @"PricingModel";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pricingModelStart, 0);
  objc_storeStrong((id *)&self->_gnomeWarmingPeriod, 0);
  objc_storeStrong((id *)&self->_gnomeActive, 0);
}

- (void)setPricingModelStart:(id)a3
{
}

- (NSNumber)pricingModelStart
{
  return self->_pricingModelStart;
}

- (void)setGnomeWarmingPeriod:(id)a3
{
}

- (NSNumber)gnomeWarmingPeriod
{
  return self->_gnomeWarmingPeriod;
}

- (void)setGnomeActive:(id)a3
{
}

- (NSNumber)gnomeActive
{
  return self->_gnomeActive;
}

@end