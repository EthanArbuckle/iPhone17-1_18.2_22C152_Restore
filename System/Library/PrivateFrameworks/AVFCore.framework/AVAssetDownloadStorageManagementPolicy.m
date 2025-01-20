@interface AVAssetDownloadStorageManagementPolicy
- (AVAssetDownloadStorageManagementPolicy)init;
- (AVAssetDownloadedAssetEvictionPriority)priority;
- (BOOL)isEqual:(id)a3;
- (NSDate)expirationDate;
- (id)_policyDictionary;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setPolicyDictionary:(id)a3;
- (void)dealloc;
- (void)setExpirationDate:(id)a3;
- (void)setPriority:(id)a3;
@end

@implementation AVAssetDownloadStorageManagementPolicy

- (AVAssetDownloadStorageManagementPolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVAssetDownloadStorageManagementPolicy;
  v2 = [(AVAssetDownloadStorageManagementPolicy *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVAssetDownloadStorageManagementPolicyInternal);
    v2->_storageManagementPolicy = v3;
    if (v3)
    {
      v2->_storageManagementPolicy->policyDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  storageManagementPolicy = self->_storageManagementPolicy;
  if (storageManagementPolicy)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetDownloadStorageManagementPolicy;
  [(AVAssetDownloadStorageManagementPolicy *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, ExpirationDate: %@ Priority: %@>", NSStringFromClass(v4), self, -[AVAssetDownloadStorageManagementPolicy expirationDate](self, "expirationDate"), -[AVAssetDownloadStorageManagementPolicy priority](self, "priority")];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = [(AVAssetDownloadStorageManagementPolicy *)+[AVMutableAssetDownloadStorageManagementPolicy allocWithZone:a3] init];
  objc_super v5 = v4;
  if (v4) {
    [(AVAssetDownloadStorageManagementPolicy *)v4 _setPolicyDictionary:self->_storageManagementPolicy->policyDictionary];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![(AVAssetDownloadStorageManagementPolicy *)self _policyDictionary]
      || (int v5 = objc_msgSend(-[AVAssetDownloadStorageManagementPolicy _policyDictionary](self, "_policyDictionary"), "isEqualToDictionary:", objc_msgSend(a3, "_policyDictionary"))) != 0)
    {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_storageManagementPolicy->policyDictionary hash];
}

- (void)_setPolicyDictionary:(id)a3
{
  policyDictionary = self->_storageManagementPolicy->policyDictionary;
  if (policyDictionary != a3)
  {

    self->_storageManagementPolicy->policyDictionary = (NSMutableDictionary *)[a3 copy];
  }
}

- (id)_policyDictionary
{
  return self->_storageManagementPolicy->policyDictionary;
}

- (void)setExpirationDate:(id)a3
{
}

- (void)setPriority:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)[(NSMutableDictionary *)self->_storageManagementPolicy->policyDictionary objectForKey:@"ExpirationDate"];
}

- (AVAssetDownloadedAssetEvictionPriority)priority
{
  return (AVAssetDownloadedAssetEvictionPriority)[(NSMutableDictionary *)self->_storageManagementPolicy->policyDictionary objectForKey:@"Priority"];
}

@end