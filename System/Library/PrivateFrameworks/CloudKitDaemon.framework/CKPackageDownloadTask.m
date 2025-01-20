@interface CKPackageDownloadTask
- (CKAsset)manifestAsset;
- (CKDCancelTokenGroup)cancelTokens;
- (CKDMMCSRequestOptions)MMCSRequestOptions;
- (CKDProgressTracker)progressTracker;
- (CKPackage)package;
- (CKPackageDownloadTask)initWithPackage:(id)a3 trackProgress:(BOOL)a4;
- (NSArray)sectionAssets;
- (NSError)error;
- (NSIndexSet)sectionIndices;
- (OS_dispatch_group)group;
- (void)cancel;
- (void)setCancelTokens:(id)a3;
- (void)setError:(id)a3;
- (void)setGroup:(id)a3;
- (void)setMMCSRequestOptions:(id)a3;
- (void)setManifestAsset:(id)a3;
- (void)setProgressTracker:(id)a3;
- (void)setSectionAssets:(id)a3;
- (void)setSectionIndices:(id)a3;
@end

@implementation CKPackageDownloadTask

- (CKPackageDownloadTask)initWithPackage:(id)a3 trackProgress:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKPackageDownloadTask;
  v8 = [(CKPackageDownloadTask *)&v34 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_package, a3);
    if (v4)
    {
      id v10 = [NSString alloc];
      v13 = objc_msgSend_recordKey(v7, v11, v12);
      v16 = objc_msgSend_record(v7, v14, v15);
      v19 = objc_msgSend_recordID(v16, v17, v18);
      v22 = objc_msgSend_recordName(v19, v20, v21);
      v24 = objc_msgSend_initWithFormat_(v10, v23, @"down|%@|%@", v13, v22);

      v25 = [CKDProgressTracker alloc];
      uint64_t v27 = objc_msgSend_initWithTrackingID_(v25, v26, (uint64_t)v24);
      progressTracker = v9->_progressTracker;
      v9->_progressTracker = (CKDProgressTracker *)v27;
    }
    dispatch_group_t v29 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v29;

    v31 = objc_alloc_init(CKDCancelTokenGroup);
    cancelTokens = v9->_cancelTokens;
    v9->_cancelTokens = v31;
  }
  return v9;
}

- (void)setManifestAsset:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (CKAsset *)a3;
  v6 = v4;
  manifestAsset = self->_manifestAsset;
  if (manifestAsset) {
    BOOL v8 = manifestAsset == v4;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    progressTracker = self->_progressTracker;
    v17[0] = self->_manifestAsset;
    id v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v17, 1);
    objc_msgSend_stopTrackingItems_(progressTracker, v11, (uint64_t)v10);
  }
  if (v6)
  {
    uint64_t v12 = self->_progressTracker;
    v16 = v6;
    v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)&v16, 1);
    objc_msgSend_startTrackingItems_(v12, v14, (uint64_t)v13);
  }
  uint64_t v15 = self->_manifestAsset;
  self->_manifestAsset = v6;
}

- (void)setSectionAssets:(id)a3
{
  BOOL v4 = (NSArray *)a3;
  v6 = v4;
  sectionAssets = self->_sectionAssets;
  if (sectionAssets) {
    BOOL v8 = sectionAssets == v4;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    objc_msgSend_stopTrackingItems_(self->_progressTracker, v5, (uint64_t)sectionAssets);
  }
  if (v6) {
    objc_msgSend_startTrackingItems_(self->_progressTracker, v5, (uint64_t)v6);
  }
  v9 = self->_sectionAssets;
  self->_sectionAssets = v6;
}

- (void)cancel
{
  objc_msgSend_cancelTokens(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v5, v3, v4);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void)setError:(id)a3
{
}

- (CKPackage)package
{
  return self->_package;
}

- (CKAsset)manifestAsset
{
  return self->_manifestAsset;
}

- (NSArray)sectionAssets
{
  return self->_sectionAssets;
}

- (NSIndexSet)sectionIndices
{
  return self->_sectionIndices;
}

- (void)setSectionIndices:(id)a3
{
}

- (CKDProgressTracker)progressTracker
{
  return self->_progressTracker;
}

- (void)setProgressTracker:(id)a3
{
}

- (CKDMMCSRequestOptions)MMCSRequestOptions
{
  return self->_MMCSRequestOptions;
}

- (void)setMMCSRequestOptions:(id)a3
{
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (CKDCancelTokenGroup)cancelTokens
{
  return self->_cancelTokens;
}

- (void)setCancelTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTokens, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_MMCSRequestOptions, 0);
  objc_storeStrong((id *)&self->_progressTracker, 0);
  objc_storeStrong((id *)&self->_sectionIndices, 0);
  objc_storeStrong((id *)&self->_sectionAssets, 0);
  objc_storeStrong((id *)&self->_manifestAsset, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end