@interface BCCollectionDetailDataMapper
- (id)cloudDataFromRecord:(id)a3;
- (id)recordFromCloudData:(id)a3;
@end

@implementation BCCollectionDetailDataMapper

- (id)cloudDataFromRecord:(id)a3
{
  id v3 = a3;
  v4 = [[BCMutableCollectionDetail alloc] initWithRecord:v3];

  return v4;
}

- (id)recordFromCloudData:(id)a3
{
  return [a3 configuredRecordFromAttributes];
}

@end