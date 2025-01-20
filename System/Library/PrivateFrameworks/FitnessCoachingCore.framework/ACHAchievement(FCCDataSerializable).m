@interface ACHAchievement(FCCDataSerializable)
- (id)transportData;
- (uint64_t)initWithTransportData:()FCCDataSerializable;
@end

@implementation ACHAchievement(FCCDataSerializable)

- (uint64_t)initWithTransportData:()FCCDataSerializable
{
  v4 = (objc_class *)MEMORY[0x1E4F49530];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithData:v5];

  uint64_t v7 = [a1 initWithCodable:v6];
  return v7;
}

- (id)transportData
{
  v0 = ACHCodableFromAchievement();
  v1 = [v0 data];

  return v1;
}

@end