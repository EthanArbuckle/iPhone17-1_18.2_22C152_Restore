@interface AVMutableAssetDownloadStorageManagementPolicy
- (AVAssetDownloadedAssetEvictionPriority)priority;
- (NSDate)expirationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setExpirationDate:(NSDate *)expirationDate;
- (void)setPriority:(AVAssetDownloadedAssetEvictionPriority)priority;
@end

@implementation AVMutableAssetDownloadStorageManagementPolicy

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[AVAssetDownloadStorageManagementPolicy allocWithZone:a3] init];
  if (v4) {
    [(AVAssetDownloadStorageManagementPolicy *)v4 _setPolicyDictionary:[(AVAssetDownloadStorageManagementPolicy *)self _policyDictionary]];
  }
  return v4;
}

- (void)setExpirationDate:(NSDate *)expirationDate
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAssetDownloadStorageManagementPolicy;
  [(AVAssetDownloadStorageManagementPolicy *)&v3 setExpirationDate:expirationDate];
}

- (void)setPriority:(AVAssetDownloadedAssetEvictionPriority)priority
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAssetDownloadStorageManagementPolicy;
  [(AVAssetDownloadStorageManagementPolicy *)&v3 setPriority:priority];
}

- (NSDate)expirationDate
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAssetDownloadStorageManagementPolicy;
  return [(AVAssetDownloadStorageManagementPolicy *)&v3 expirationDate];
}

- (AVAssetDownloadedAssetEvictionPriority)priority
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAssetDownloadStorageManagementPolicy;
  return [(AVAssetDownloadStorageManagementPolicy *)&v3 priority];
}

@end