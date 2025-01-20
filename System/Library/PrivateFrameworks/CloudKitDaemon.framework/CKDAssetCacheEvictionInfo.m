@interface CKDAssetCacheEvictionInfo
- (BOOL)clearRegisteredItems;
- (BOOL)forced;
- (CKDAssetCacheEvictionInfo)initWithForced:(BOOL)a3;
- (NSMutableOrderedSet)assetHandleItemIDsToDelete;
- (NSMutableOrderedSet)itemIDsToUnregister;
- (void)setClearRegisteredItems:(BOOL)a3;
@end

@implementation CKDAssetCacheEvictionInfo

- (CKDAssetCacheEvictionInfo)initWithForced:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKDAssetCacheEvictionInfo;
  v4 = [(CKDAssetCacheEvictionInfo *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_forced = a3;
    uint64_t v6 = objc_opt_new();
    itemIDsToUnregister = v5->_itemIDsToUnregister;
    v5->_itemIDsToUnregister = (NSMutableOrderedSet *)v6;

    uint64_t v8 = objc_opt_new();
    assetHandleItemIDsToDelete = v5->_assetHandleItemIDsToDelete;
    v5->_assetHandleItemIDsToDelete = (NSMutableOrderedSet *)v8;
  }
  return v5;
}

- (BOOL)forced
{
  return self->_forced;
}

- (BOOL)clearRegisteredItems
{
  return self->_clearRegisteredItems;
}

- (void)setClearRegisteredItems:(BOOL)a3
{
  self->_clearRegisteredItems = a3;
}

- (NSMutableOrderedSet)itemIDsToUnregister
{
  return self->_itemIDsToUnregister;
}

- (NSMutableOrderedSet)assetHandleItemIDsToDelete
{
  return self->_assetHandleItemIDsToDelete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetHandleItemIDsToDelete, 0);
  objc_storeStrong((id *)&self->_itemIDsToUnregister, 0);
}

@end