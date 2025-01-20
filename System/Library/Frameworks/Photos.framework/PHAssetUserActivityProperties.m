@interface PHAssetUserActivityProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSDate)lastViewedDate;
- (PHAssetUserActivityProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (int64_t)pendingPlayCount;
- (int64_t)pendingShareCount;
- (int64_t)pendingViewCount;
- (int64_t)playCount;
- (int64_t)shareCount;
- (int64_t)syncedPlayCount;
- (int64_t)syncedShareCount;
- (int64_t)syncedViewCount;
- (int64_t)viewCount;
- (void)setPendingPlayCount:(int64_t)a3;
- (void)setPendingShareCount:(int64_t)a3;
- (void)setPendingViewCount:(int64_t)a3;
- (void)setSyncedPlayCount:(int64_t)a3;
- (void)setSyncedShareCount:(int64_t)a3;
- (void)setSyncedViewCount:(int64_t)a3;
@end

@implementation PHAssetUserActivityProperties

- (void).cxx_destruct
{
}

- (void)setPendingViewCount:(int64_t)a3
{
  self->_pendingViewCount = a3;
}

- (int64_t)pendingViewCount
{
  return self->_pendingViewCount;
}

- (void)setPendingShareCount:(int64_t)a3
{
  self->_pendingShareCount = a3;
}

- (int64_t)pendingShareCount
{
  return self->_pendingShareCount;
}

- (void)setPendingPlayCount:(int64_t)a3
{
  self->_pendingPlayCount = a3;
}

- (int64_t)pendingPlayCount
{
  return self->_pendingPlayCount;
}

- (void)setSyncedViewCount:(int64_t)a3
{
  self->_syncedViewCount = a3;
}

- (int64_t)syncedViewCount
{
  return self->_syncedViewCount;
}

- (void)setSyncedShareCount:(int64_t)a3
{
  self->_syncedShareCount = a3;
}

- (int64_t)syncedShareCount
{
  return self->_syncedShareCount;
}

- (void)setSyncedPlayCount:(int64_t)a3
{
  self->_syncedPlayCount = a3;
}

- (int64_t)syncedPlayCount
{
  return self->_syncedPlayCount;
}

- (NSDate)lastViewedDate
{
  return self->_lastViewedDate;
}

- (int64_t)viewCount
{
  return self->_pendingViewCount + self->_syncedViewCount;
}

- (int64_t)shareCount
{
  return self->_pendingShareCount + self->_syncedShareCount;
}

- (int64_t)playCount
{
  return self->_pendingPlayCount + self->_syncedPlayCount;
}

- (PHAssetUserActivityProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PHAssetUserActivityProperties;
  v10 = [(PHAssetUserActivityProperties *)&v28 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5) {
      v12 = @"additionalAttributes.playCount";
    }
    else {
      v12 = @"playCount";
    }
    if (v5) {
      v13 = @"additionalAttributes.shareCount";
    }
    else {
      v13 = @"shareCount";
    }
    if (v5) {
      v14 = @"additionalAttributes.viewCount";
    }
    else {
      v14 = @"viewCount";
    }
    if (v5) {
      v15 = @"additionalAttributes.pendingPlayCount";
    }
    else {
      v15 = @"pendingPlayCount";
    }
    if (v5) {
      v16 = @"additionalAttributes.pendingShareCount";
    }
    else {
      v16 = @"pendingShareCount";
    }
    if (v5) {
      v17 = @"additionalAttributes.pendingViewCount";
    }
    else {
      v17 = @"pendingViewCount";
    }
    if (v5) {
      v18 = @"additionalAttributes.lastViewedDate";
    }
    else {
      v18 = @"lastViewedDate";
    }
    v19 = [v8 objectForKeyedSubscript:v12];
    v11->_syncedPlayCount = [v19 longLongValue];

    v20 = [v8 objectForKeyedSubscript:v13];
    v11->_syncedShareCount = [v20 longLongValue];

    v21 = [v8 objectForKeyedSubscript:v14];
    v11->_syncedViewCount = [v21 longLongValue];

    v22 = [v8 objectForKeyedSubscript:v15];
    v11->_pendingPlayCount = [v22 longLongValue];

    v23 = [v8 objectForKeyedSubscript:v16];
    v11->_pendingShareCount = [v23 longLongValue];

    v24 = [v8 objectForKeyedSubscript:v17];
    v11->_pendingViewCount = [v24 longLongValue];

    uint64_t v25 = [v8 objectForKeyedSubscript:v18];
    lastViewedDate = v11->_lastViewedDate;
    v11->_lastViewedDate = (NSDate *)v25;
  }
  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_52;

  return v2;
}

void __50__PHAssetUserActivityProperties_propertiesToFetch__block_invoke()
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v3[0] = @"playCount";
  v3[1] = @"shareCount";
  v3[2] = @"viewCount";
  v3[3] = @"pendingPlayCount";
  v3[4] = @"pendingShareCount";
  v3[5] = @"pendingViewCount";
  v3[6] = @"lastViewedDate";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:7];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_52;
  propertiesToFetch_pl_once_object_52 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetUserActivity";
}

@end