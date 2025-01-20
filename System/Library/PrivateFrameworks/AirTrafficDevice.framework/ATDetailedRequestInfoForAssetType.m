@interface ATDetailedRequestInfoForAssetType
+ (id)serializedRequestInfoFromATDetailedRequestInfoForAssetType:(id)a3;
- (ATDetailedRequestInfoForAssetType)init;
- (NSDictionary)getContributors;
- (id)description;
- (unint64_t)getTotalAssetsToSync;
- (unint64_t)getTotalBytesSynced;
- (unint64_t)getTotalBytesToSync;
- (void)incrementAssetCountToSync;
- (void)updateBytesSynced:(unint64_t)a3;
- (void)updateBytesToSync:(unint64_t)a3 forItemIdentifier:(id)a4;
@end

@implementation ATDetailedRequestInfoForAssetType

- (void).cxx_destruct
{
}

- (unint64_t)getTotalAssetsToSync
{
  return self->_totalAssetsToSync;
}

- (unint64_t)getTotalBytesToSync
{
  return self->_totalBytesToSync;
}

- (unint64_t)getTotalBytesSynced
{
  return self->_totalBytesSynced;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"totalBytesToSync:%llu totalAssetsToSync:%llu totalBytesSynced:%llu", self->_totalBytesToSync, self->_totalAssetsToSync, self->_totalBytesSynced);
}

- (NSDictionary)getContributors
{
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_mutableContributors];
}

- (void)incrementAssetCountToSync
{
}

- (void)updateBytesToSync:(unint64_t)a3 forItemIdentifier:(id)a4
{
  self->_totalBytesToSync += a3;
  if (a4)
  {
    mutableContributors = self->_mutableContributors;
    v6 = NSNumber;
    id v7 = a4;
    id v8 = [v6 numberWithUnsignedLongLong:a3];
    [(NSMutableDictionary *)mutableContributors setObject:v8 forKey:v7];
  }
}

- (void)updateBytesSynced:(unint64_t)a3
{
  self->_totalBytesSynced += a3;
}

- (ATDetailedRequestInfoForAssetType)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATDetailedRequestInfoForAssetType;
  v2 = [(ATDetailedRequestInfoForAssetType *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_totalBytesSynced = 0;
    v2->_totalBytesToSync = 0;
    v2->_totalAssetsToSync = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    mutableContributors = v3->_mutableContributors;
    v3->_mutableContributors = (NSMutableDictionary *)v4;
  }
  return v3;
}

+ (id)serializedRequestInfoFromATDetailedRequestInfoForAssetType:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "getTotalAssetsToSync"));
  objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "getTotalBytesToSync"));
  id v8 = NSNumber;
  uint64_t v9 = [v5 getTotalBytesSynced];

  v10 = [v8 numberWithUnsignedLongLong:v9];
  v11 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v6, @"TotalAssetsToSync", v7, @"TotalBytesToSync", v10, @"TotalBytesSynced", 0);

  return v11;
}

@end