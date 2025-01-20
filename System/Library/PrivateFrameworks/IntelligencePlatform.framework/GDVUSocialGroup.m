@interface GDVUSocialGroup
- (GDVUSocialGroup)init;
- (GDVUSocialGroup)initWithNumberOfMomentNodes:(id)a3 tags:(id)a4;
- (NSArray)tags;
- (NSNumber)numberOfMomentNodes;
@end

@implementation GDVUSocialGroup

- (GDVUSocialGroup)initWithNumberOfMomentNodes:(id)a3 tags:(id)a4
{
  sub_1B2E806B8();
  sub_1B2E82838();
  id v5 = a3;
  return (GDVUSocialGroup *)GDVUSocialGroup.init(numberOfMomentNodes:tags:)(a3);
}

- (NSNumber)numberOfMomentNodes
{
  v2 = self;
  id v3 = sub_1B2E2BA2C();

  return (NSNumber *)v3;
}

- (NSArray)tags
{
  return (NSArray *)sub_1B2E2BB50(self, (uint64_t)a2, (void (*)(void))sub_1B2E2BBBC);
}

- (GDVUSocialGroup)init
{
}

- (void).cxx_destruct
{
}

@end