@interface CPLMomentShareScopeChange
- (BOOL)hasEPPAssets;
- (NSData)previewImageData;
- (NSData)thumbnailImageData;
- (NSDate)creationDate;
- (NSDate)endDate;
- (NSDate)expiryDate;
- (NSDate)startDate;
- (NSString)originatingScopeIdentifier;
- (id)momentShare;
- (int64_t)promisedAssetCount;
- (int64_t)promisedPhotosCount;
- (int64_t)promisedVideosCount;
- (void)setCreationDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setExpiryDate:(id)a3;
- (void)setHasEPPAssets:(BOOL)a3;
- (void)setLibraryInfo:(id)a3;
- (void)setMomentShare:(id)a3;
- (void)setOriginatingScopeIdentifier:(id)a3;
- (void)setPreviewImageData:(id)a3;
- (void)setPromisedAssetCount:(int64_t)a3;
- (void)setPromisedPhotosCount:(int64_t)a3;
- (void)setPromisedVideosCount:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setThumbnailImageData:(id)a3;
- (void)updateScopeFromScopeChange:(id)a3 direction:(unint64_t)a4 didHaveChanges:(BOOL *)a5;
@end

@implementation CPLMomentShareScopeChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (void)setOriginatingScopeIdentifier:(id)a3
{
}

- (NSString)originatingScopeIdentifier
{
  return self->_originatingScopeIdentifier;
}

- (void)setPreviewImageData:(id)a3
{
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (void)setThumbnailImageData:(id)a3
{
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (void)setPromisedVideosCount:(int64_t)a3
{
  self->_promisedVideosCount = a3;
}

- (int64_t)promisedVideosCount
{
  return self->_promisedVideosCount;
}

- (void)setPromisedPhotosCount:(int64_t)a3
{
  self->_promisedPhotosCount = a3;
}

- (int64_t)promisedPhotosCount
{
  return self->_promisedPhotosCount;
}

- (void)setPromisedAssetCount:(int64_t)a3
{
  self->_promisedAssetCount = a3;
}

- (int64_t)promisedAssetCount
{
  return self->_promisedAssetCount;
}

- (void)setHasEPPAssets:(BOOL)a3
{
  self->_hasEPPAssets = a3;
}

- (BOOL)hasEPPAssets
{
  return self->_hasEPPAssets;
}

- (void)setExpiryDate:(id)a3
{
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)updateScopeFromScopeChange:(id)a3 direction:(unint64_t)a4 didHaveChanges:(BOOL *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CPLMomentShareScopeChange;
  [(CPLScopeChange *)&v30 updateScopeFromScopeChange:v8 direction:a4 didHaveChanges:a5];
  if (a4 != 1) {
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_35;
  }
  uint64_t v9 = [v8 scopeType];
  uint64_t v10 = [v8 title];
  v11 = [(CPLScopeChange *)self title];
  unint64_t v12 = (unint64_t)v11;
  if (v10 && v11)
  {
    char v13 = [(id)v10 isEqual:v11];

    if (v13) {
      goto LABEL_14;
    }
LABEL_8:
    if (v9 == 2)
    {
      v14 = [v8 title];
      [(CPLScopeChange *)self setTitle:v14];

      *a5 = 1;
    }
    else if (!_CPLSilentLogging)
    {
      v15 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = [(CPLScopeChange *)self title];
        v17 = [v8 title];
        *(_DWORD *)buf = 138412802;
        v32 = self;
        __int16 v33 = 2112;
        int64_t v34 = (int64_t)v16;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v17;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "Client is trying to update title on %@ from %@ to %@", buf, 0x20u);
      }
    }
    goto LABEL_14;
  }

  if (v10 | v12) {
    goto LABEL_8;
  }
LABEL_14:
  uint64_t v18 = [v8 promisedAssetCount];
  if (v18 != [(CPLMomentShareScopeChange *)self promisedAssetCount])
  {
    if (v9 == 2)
    {
      -[CPLMomentShareScopeChange setPromisedAssetCount:](self, "setPromisedAssetCount:", [v8 promisedAssetCount]);
    }
    else if (!_CPLSilentLogging)
    {
      v19 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int64_t v20 = [(CPLMomentShareScopeChange *)self promisedAssetCount];
        uint64_t v21 = [v8 promisedAssetCount];
        *(_DWORD *)buf = 138412802;
        v32 = self;
        __int16 v33 = 2048;
        int64_t v34 = v20;
        __int16 v35 = 2048;
        uint64_t v36 = v21;
        _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, "Client is trying to update promisedAssetCount on %@ from %ld to %ld", buf, 0x20u);
      }
    }
  }
  uint64_t v22 = [v8 promisedPhotosCount];
  if (v22 != [(CPLMomentShareScopeChange *)self promisedPhotosCount])
  {
    if (v9 == 2)
    {
      -[CPLMomentShareScopeChange setPromisedPhotosCount:](self, "setPromisedPhotosCount:", [v8 promisedPhotosCount]);
    }
    else if (!_CPLSilentLogging)
    {
      v23 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int64_t v24 = [(CPLMomentShareScopeChange *)self promisedPhotosCount];
        uint64_t v25 = [v8 promisedPhotosCount];
        *(_DWORD *)buf = 138412802;
        v32 = self;
        __int16 v33 = 2048;
        int64_t v34 = v24;
        __int16 v35 = 2048;
        uint64_t v36 = v25;
        _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_ERROR, "Client is trying to update promisedPhotosCount on %@ from %ld to %ld", buf, 0x20u);
      }
    }
  }
  uint64_t v26 = [v8 promisedVideosCount];
  if (v26 != [(CPLMomentShareScopeChange *)self promisedVideosCount])
  {
    if (v9 == 2)
    {
      -[CPLMomentShareScopeChange setPromisedVideosCount:](self, "setPromisedVideosCount:", [v8 promisedVideosCount]);
    }
    else if (!_CPLSilentLogging)
    {
      v27 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        int64_t v28 = [(CPLMomentShareScopeChange *)self promisedVideosCount];
        uint64_t v29 = [v8 promisedVideosCount];
        *(_DWORD *)buf = 138412802;
        v32 = self;
        __int16 v33 = 2048;
        int64_t v34 = v28;
        __int16 v35 = 2048;
        uint64_t v36 = v29;
        _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_ERROR, "Client is trying to update promisedVideosCount on %@ from %ld to %ld", buf, 0x20u);
      }
    }
  }
LABEL_35:
}

- (void)setLibraryInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 momentShare];
  v6 = v5;
  if (v5)
  {
    [v5 updateScopeChange:self];
    v7 = (void *)[v4 copy];

    [v7 setMomentShare:0];
    id v4 = v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)CPLMomentShareScopeChange;
  [(CPLScopeChange *)&v8 setLibraryInfo:v4];
}

- (void)setMomentShare:(id)a3
{
}

- (id)momentShare
{
  v2 = [[CPLMomentShare alloc] initWithScopeChange:self];
  return v2;
}

@end