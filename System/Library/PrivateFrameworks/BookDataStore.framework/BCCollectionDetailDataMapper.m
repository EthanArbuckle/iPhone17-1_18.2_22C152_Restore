@interface BCCollectionDetailDataMapper
- (id)cloudDataFromRecord:(id)a3;
- (id)recordFromCloudData:(id)a3;
@end

@implementation BCCollectionDetailDataMapper

- (id)cloudDataFromRecord:(id)a3
{
  id v3 = a3;
  v4 = [BCMutableCollectionDetail alloc];
  v11 = objc_msgSend_initWithRecord_(v4, v5, (uint64_t)v3, v6, v7, v8, v9, v10);

  return v11;
}

- (id)recordFromCloudData:(id)a3
{
  return (id)objc_msgSend_configuredRecordFromAttributes(a3, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

@end