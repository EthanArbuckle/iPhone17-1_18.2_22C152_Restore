@interface ATDetailedProgressInfoForAssetType
+ (id)serializedProgressInfoFromATDetailedProgressInfoForAssetType:(id)a3;
- (ATDetailedProgressInfoForAssetType)initWithAssetType:(id)a3 assetCountToSync:(unint64_t)a4 byteCountToSync:(unint64_t)a5;
- (ATDetailedProgressInfoForAssetType)initWithAssetType:(id)a3 assetCountToSync:(unint64_t)a4 byteCountToSync:(unint64_t)a5 assetCountSynced:(unint64_t)a6 byteCountSyned:(unint64_t)a7;
- (NSString)getAssetType;
- (double)getSyncProgress;
- (id)description;
- (unint64_t)getFailedAssetsCount;
- (unint64_t)getTotalAssetsSynced;
- (unint64_t)getTotalAssetsToSync;
- (unint64_t)getTotalBytesSynced;
- (unint64_t)getTotalBytesToSync;
- (void)_computeProgress;
- (void)setAtAssetType:(id)a3;
- (void)setFailedAssetCount:(unint64_t)a3;
- (void)setProgress:(double)a3;
- (void)setTotalAssetsSynced:(unint64_t)a3;
- (void)setTotalAssetsToSync:(unint64_t)a3;
- (void)setTotalBytesSynced:(unint64_t)a3;
- (void)setTotalBytesToSync:(unint64_t)a3;
- (void)updateAsset:(id)a3 syncedWithSuccess:(BOOL)a4 bytesDownloaded:(unint64_t)a5;
- (void)updateAssetsToDownload:(unint64_t)a3;
- (void)updateBytesDownloaded:(unint64_t)a3;
- (void)updateBytesToDownload:(unint64_t)a3;
@end

@implementation ATDetailedProgressInfoForAssetType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atAssetType, 0);

  objc_storeStrong((id *)&self->failedAssetIds, 0);
}

- (void)setAtAssetType:(id)a3
{
}

- (NSString)getAssetType
{
  return self->_atAssetType;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)getSyncProgress
{
  return self->_progress;
}

- (void)setFailedAssetCount:(unint64_t)a3
{
  self->_failedAssetCount = a3;
}

- (unint64_t)getFailedAssetsCount
{
  return self->_failedAssetCount;
}

- (void)setTotalAssetsSynced:(unint64_t)a3
{
  self->_totalAssetsSynced = a3;
}

- (unint64_t)getTotalAssetsSynced
{
  return self->_totalAssetsSynced;
}

- (void)setTotalAssetsToSync:(unint64_t)a3
{
  self->_totalAssetsToSync = a3;
}

- (unint64_t)getTotalAssetsToSync
{
  return self->_totalAssetsToSync;
}

- (void)setTotalBytesSynced:(unint64_t)a3
{
  self->_totalBytesSynced = a3;
}

- (unint64_t)getTotalBytesSynced
{
  return self->_totalBytesSynced;
}

- (void)setTotalBytesToSync:(unint64_t)a3
{
  self->_totalBytesToSync = a3;
}

- (unint64_t)getTotalBytesToSync
{
  return self->_totalBytesToSync;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"totalBytesToSync:%llu, totalAssetsToSync:%llu, totalBytesSynced:%llu, totalAssetsSynced:%llu, failedAssetCount:%llu, sync progress:%f", self->_totalBytesToSync, self->_totalAssetsToSync, self->_totalBytesSynced, self->_totalAssetsSynced, self->_failedAssetCount, *(void *)&self->_progress];
}

- (void)_computeProgress
{
  unint64_t totalBytesToSync = self->_totalBytesToSync;
  if (totalBytesToSync) {
    self->_progress = (double)self->_totalBytesSynced / (double)totalBytesToSync;
  }
}

- (void)updateAssetsToDownload:(unint64_t)a3
{
  self->_totalAssetsToSync += a3;
}

- (void)updateBytesDownloaded:(unint64_t)a3
{
  unint64_t totalBytesToSync = self->_totalBytesSynced + a3;
  if (totalBytesToSync >= self->_totalBytesToSync) {
    unint64_t totalBytesToSync = self->_totalBytesToSync;
  }
  self->_totalBytesSynced = totalBytesToSync;
  [(ATDetailedProgressInfoForAssetType *)self _computeProgress];
}

- (void)updateBytesToDownload:(unint64_t)a3
{
  self->_totalBytesToSync += a3;
  [(ATDetailedProgressInfoForAssetType *)self _computeProgress];
}

- (void)updateAsset:(id)a3 syncedWithSuccess:(BOOL)a4 bytesDownloaded:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6)
  {
    ++self->_totalAssetsSynced;
    [(ATDetailedProgressInfoForAssetType *)self updateBytesDownloaded:a5];
  }
  else
  {
    ++self->_failedAssetCount;
    if (v8) {
      [(NSMutableSet *)self->failedAssetIds addObject:v8];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (ATDetailedProgressInfoForAssetType)initWithAssetType:(id)a3 assetCountToSync:(unint64_t)a4 byteCountToSync:(unint64_t)a5 assetCountSynced:(unint64_t)a6 byteCountSyned:(unint64_t)a7
{
  id v13 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ATDetailedProgressInfoForAssetType;
  v14 = [(ATDetailedProgressInfoForAssetType *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_atAssetType, a3);
    v15->_unint64_t totalBytesToSync = a5;
    v15->_totalBytesSynced = a7;
    v15->_totalAssetsToSync = a4;
    v15->_totalAssetsSynced = a6;
    v15->_failedAssetCount = 0;
    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    failedAssetIds = v15->failedAssetIds;
    v15->failedAssetIds = (NSMutableSet *)v16;

    [(ATDetailedProgressInfoForAssetType *)v15 updateBytesDownloaded:0];
  }

  return v15;
}

- (ATDetailedProgressInfoForAssetType)initWithAssetType:(id)a3 assetCountToSync:(unint64_t)a4 byteCountToSync:(unint64_t)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATDetailedProgressInfoForAssetType;
  v10 = [(ATDetailedProgressInfoForAssetType *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_atAssetType, a3);
    v11->_unint64_t totalBytesToSync = a5;
    v11->_totalBytesSynced = 0;
    v11->_totalAssetsToSync = a4;
    v11->_totalAssetsSynced = 0;
    v11->_failedAssetCount = 0;
    v11->_progress = 0.0;
    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    failedAssetIds = v11->failedAssetIds;
    v11->failedAssetIds = (NSMutableSet *)v12;
  }
  return v11;
}

+ (id)serializedProgressInfoFromATDetailedProgressInfoForAssetType:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v4 getAssetType];
  BOOL v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "getTotalBytesToSync"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "getTotalAssetsToSync"));
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "getTotalBytesSynced"));
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "getTotalAssetsSynced"));
  v10 = NSNumber;
  [v4 getSyncProgress];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  uint64_t v12 = NSNumber;
  uint64_t v13 = [v4 getFailedAssetsCount];

  v14 = [v12 numberWithUnsignedLongLong:v13];
  objc_super v15 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, @"AssetType", v6, @"TotalBytesToSync", v7, @"TotalAssetsToSync", v8, @"TotalBytesSynced", v9, @"TotalAssetsSynced", v11, @"SyncProgressForType", v14, @"FailedAssetCount", 0);

  return v15;
}

@end