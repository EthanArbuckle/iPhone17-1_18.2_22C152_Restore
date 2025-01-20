@interface MPMediaDownload
+ (id)MPMediaDownloadsFromATAssets:(id)a3;
+ (id)MPMediaDownloadsFromMPStoreDownloads:(id)a3;
+ (int64_t)_downloadReasonFromStoreDownload:(id)a3;
+ (unint64_t)MPMediaDownloadPauseReasonForATAsset:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPMediaDownload)initWithATAsset:(id)a3;
- (MPMediaDownload)initWithMPStoreDownload:(id)a3;
- (double)downloadProgress;
- (id)description;
- (int64_t)deviceLibraryID;
- (int64_t)downloadReason;
- (int64_t)libraryID;
- (int64_t)storeItemID;
- (int64_t)storeSagaID;
- (unint64_t)downloadPausedReason;
- (unint64_t)hash;
- (void)setDownloadPausedReason:(unint64_t)a3;
- (void)setDownloadProgress:(double)a3;
- (void)setDownloadReason:(int64_t)a3;
- (void)setLibraryID:(int64_t)a3;
- (void)setStoreSagaID:(int64_t)a3;
@end

@implementation MPMediaDownload

- (void)setStoreSagaID:(int64_t)a3
{
  self->_storeSagaID = a3;
}

- (int64_t)storeSagaID
{
  return self->_storeSagaID;
}

- (void)setLibraryID:(int64_t)a3
{
  self->_libraryID = a3;
}

- (int64_t)libraryID
{
  return self->_libraryID;
}

- (void)setDownloadPausedReason:(unint64_t)a3
{
  self->_downloadPausedReason = a3;
}

- (unint64_t)downloadPausedReason
{
  return self->_downloadPausedReason;
}

- (void)setDownloadProgress:(double)a3
{
  self->_downloadProgress = a3;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadReason:(int64_t)a3
{
  self->_downloadReason = a3;
}

- (int64_t)downloadReason
{
  return self->_downloadReason;
}

- (int64_t)storeItemID
{
  return self->_storeItemID;
}

- (int64_t)deviceLibraryID
{
  return self->_deviceLibraryID;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPMediaDownload *)a3;
  BOOL v7 = 1;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ((int64_t v5 = [(MPMediaDownload *)self deviceLibraryID]) == 0
       || v5 != [(MPMediaDownload *)v4 deviceLibraryID])
      && ((int64_t v6 = [(MPMediaDownload *)self storeItemID]) == 0
       || v6 != [(MPMediaDownload *)v4 storeItemID]))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t result = self->_deviceLibraryID;
  if (!result) {
    return self->_storeItemID;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  int64_t v5 = NSStringFromClass(v4);
  int64_t v6 = [v3 stringWithFormat:@"<%@ %lld %lld %f %d>", v5, self->_deviceLibraryID, self->_storeItemID, *(void *)&self->_downloadProgress, self->_downloadReason];

  return v6;
}

- (MPMediaDownload)initWithATAsset:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPMediaDownload;
  int64_t v5 = [(MPMediaDownload *)&v13 init];
  if (v5)
  {
    int64_t v6 = [v4 identifier];
    v5->_deviceLibraryID = [v6 longLongValue];

    BOOL v7 = [v4 storeInfo];
    v8 = [v7 adamID];
    v5->_storeItemID = [v8 longLongValue];

    [v4 downloadProgress];
    v5->_downloadProgress = v9;
    int v10 = [v4 downloadOnly];
    uint64_t v11 = 2;
    if (!v10) {
      uint64_t v11 = 0;
    }
    v5->_downloadReason = v11;
    v5->_downloadPausedReason = +[MPMediaDownload MPMediaDownloadPauseReasonForATAsset:v4];
  }

  return v5;
}

- (MPMediaDownload)initWithMPStoreDownload:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPMediaDownload;
  int64_t v5 = [(MPMediaDownload *)&v8 init];
  if (v5)
  {
    v5->_deviceLibraryID = [v4 libraryItemIdentifier];
    v5->_storeItemID = [v4 storeItemIdentifier];
    [v4 percentComplete];
    v5->_downloadProgress = v6;
    v5->_downloadReason = +[MPMediaDownload _downloadReasonFromStoreDownload:v4];
    v5->_downloadPausedReason = 0;
  }

  return v5;
}

+ (int64_t)_downloadReasonFromStoreDownload:(id)a3
{
  uint64_t v3 = [a3 reason];
  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

+ (unint64_t)MPMediaDownloadPauseReasonForATAsset:(id)a3
{
  return [a3 downloadPauseReason];
}

+ (id)MPMediaDownloadsFromATAssets:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [MPMediaDownload alloc];
        v12 = -[MPMediaDownload initWithATAsset:](v11, "initWithATAsset:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)MPMediaDownloadsFromMPStoreDownloads:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [MPMediaDownload alloc];
        v12 = -[MPMediaDownload initWithMPStoreDownload:](v11, "initWithMPStoreDownload:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end