@interface PBCodable(BMStoreData)
+ (id)eventWithData:()BMStoreData dataVersion:;
- (uint64_t)dataVersion;
@end

@implementation PBCodable(BMStoreData)

- (uint64_t)dataVersion
{
  return 0;
}

+ (id)eventWithData:()BMStoreData dataVersion:
{
  if (a4)
  {
    v4 = 0;
  }
  else
  {
    id v6 = a3;
    v4 = (void *)[[a1 alloc] initWithData:v6];
  }
  return v4;
}

@end