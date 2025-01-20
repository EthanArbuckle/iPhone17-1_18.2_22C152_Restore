@interface CKDAssetCacheTableGroup
+ (BOOL)rebootShouldClearData;
+ (double)expirationTime;
- (CKDAssetHandleTable)assetHandleTable;
- (CKDAssetVolumeTable)assetVolumeTable;
- (id)createTables:(id *)a3;
@end

@implementation CKDAssetCacheTableGroup

+ (BOOL)rebootShouldClearData
{
  return 1;
}

+ (double)expirationTime
{
  return 28800.0;
}

- (id)createTables:(id *)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v4 = [CKDAssetHandleTable alloc];
  v6 = (CKDAssetHandleTable *)objc_msgSend_initWithLogicalTableName_(v4, v5, @"AssetHandle");
  assetHandleTable = self->_assetHandleTable;
  self->_assetHandleTable = v6;

  v8 = [CKDAssetVolumeTable alloc];
  v10 = (CKDAssetVolumeTable *)objc_msgSend_initWithLogicalTableName_(v8, v9, @"AssetVolume");
  assetVolumeTable = self->_assetVolumeTable;
  self->_assetVolumeTable = v10;

  v12 = self->_assetHandleTable;
  v16[0] = self->_assetVolumeTable;
  v16[1] = v12;
  v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v16, 2);
  return v14;
}

- (CKDAssetHandleTable)assetHandleTable
{
  return self->_assetHandleTable;
}

- (CKDAssetVolumeTable)assetVolumeTable
{
  return self->_assetVolumeTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVolumeTable, 0);
  objc_storeStrong((id *)&self->_assetHandleTable, 0);
}

@end