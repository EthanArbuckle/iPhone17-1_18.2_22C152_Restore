@interface CKDRecordDownloadTask
- (BOOL)shouldCloneFileInAssetCache;
- (CKDProgressTracker)progressTracker;
- (CKDRecordDownloadTask)initWithRecord:(id)a3 trackProgress:(BOOL)a4 assetsToDownload:(id)a5 assetsToDownloadInMemory:(id)a6 assetURLInfosToFillOut:(id)a7;
- (CKRecord)record;
- (NSError)error;
- (NSMutableArray)assetURLInfosToFillOut;
- (NSMutableArray)assetsToDownload;
- (NSMutableArray)assetsToDownloadInMemory;
- (OS_dispatch_group)group;
- (void)didCompleteTaskWithError:(id)a3;
- (void)didDownloadAsset:(id)a3 error:(id)a4;
- (void)didFillOutURLInfo:(id)a3 error:(id)a4;
- (void)setAssetURLInfosToFillOut:(id)a3;
- (void)setAssetsToDownload:(id)a3;
- (void)setAssetsToDownloadInMemory:(id)a3;
- (void)setError:(id)a3;
- (void)setGroup:(id)a3;
- (void)setProgressTracker:(id)a3;
- (void)setRecord:(id)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
@end

@implementation CKDRecordDownloadTask

- (CKDRecordDownloadTask)initWithRecord:(id)a3 trackProgress:(BOOL)a4 assetsToDownload:(id)a5 assetsToDownloadInMemory:(id)a6 assetURLInfosToFillOut:(id)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v68.receiver = self;
  v68.super_class = (Class)CKDRecordDownloadTask;
  v17 = [(CKDRecordDownloadTask *)&v68 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_record, a3);
    objc_storeStrong((id *)&v18->_assetsToDownload, a5);
    objc_storeStrong((id *)&v18->_assetsToDownloadInMemory, a6);
    objc_storeStrong((id *)&v18->_assetURLInfosToFillOut, a7);
    dispatch_group_t v19 = dispatch_group_create();
    group = v18->_group;
    v18->_group = (OS_dispatch_group *)v19;

    id v21 = [NSString alloc];
    v24 = objc_msgSend_recordID(v13, v22, v23);
    v27 = objc_msgSend_recordName(v24, v25, v26);
    v29 = objc_msgSend_initWithFormat_(v21, v28, @"down|%@", v27);

    if (a4)
    {
      v30 = [CKDProgressTracker alloc];
      uint64_t v32 = objc_msgSend_initWithTrackingID_(v30, v31, (uint64_t)v29);
      p_progressTracker = (void **)&v18->_progressTracker;
      progressTracker = v18->_progressTracker;
      v18->_progressTracker = (CKDProgressTracker *)v32;
    }
    else
    {
      p_progressTracker = (void **)&v18->_progressTracker;
      progressTracker = v18->_progressTracker;
      v18->_progressTracker = 0;
    }

    objc_msgSend_setLastItemPercentage_(*p_progressTracker, v35, v36, 0.01);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v37 = v14;
    uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v64, v71, 16);
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v65;
      while (1)
      {
        if (*(void *)v65 != v41) {
          objc_enumerationMutation(v37);
        }
        dispatch_group_enter((dispatch_group_t)v18->_group);
        if (!--v40)
        {
          uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v42, (uint64_t)&v64, v71, 16);
          if (!v40) {
            break;
          }
        }
      }
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v43 = v15;
    uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v60, v70, 16);
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v61;
      while (1)
      {
        if (*(void *)v61 != v47) {
          objc_enumerationMutation(v43);
        }
        dispatch_group_enter((dispatch_group_t)v18->_group);
        if (!--v46)
        {
          uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v48, (uint64_t)&v60, v70, 16);
          if (!v46) {
            break;
          }
        }
      }
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v49 = v16;
    uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v56, v69, 16);
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v57;
      while (1)
      {
        if (*(void *)v57 != v53) {
          objc_enumerationMutation(v49);
        }
        dispatch_group_enter((dispatch_group_t)v18->_group);
        if (!--v52)
        {
          uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v54, (uint64_t)&v56, v69, 16);
          if (!v52) {
            break;
          }
        }
      }
    }
  }
  return v18;
}

- (void)didDownloadAsset:(id)a3 error:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v10 = objc_msgSend_assetsToDownload(v7, v8, v9);
  int v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v30);

  if (v12)
  {
    id v15 = objc_msgSend_group(v7, v13, v14);
    dispatch_group_leave(v15);

    v18 = objc_msgSend_assetsToDownload(v7, v16, v17);
    objc_msgSend_removeObject_(v18, v19, (uint64_t)v30);
  }
  v20 = objc_msgSend_assetsToDownloadInMemory(v7, v13, v14);
  int v22 = objc_msgSend_containsObject_(v20, v21, (uint64_t)v30);

  if (v22)
  {
    v25 = objc_msgSend_group(v7, v23, v24);
    dispatch_group_leave(v25);

    v28 = objc_msgSend_assetsToDownloadInMemory(v7, v26, v27);
    objc_msgSend_removeObject_(v28, v29, (uint64_t)v30);
  }
  objc_sync_exit(v7);
}

- (void)didFillOutURLInfo:(id)a3 error:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v10 = objc_msgSend_assetURLInfosToFillOut(v7, v8, v9);
  int v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v20);

  if (v12)
  {
    id v15 = objc_msgSend_group(v7, v13, v14);
    dispatch_group_leave(v15);

    v18 = objc_msgSend_assetURLInfosToFillOut(v7, v16, v17);
    objc_msgSend_removeObject_(v18, v19, (uint64_t)v20);
  }
  objc_sync_exit(v7);
}

- (void)didCompleteTaskWithError:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_setError_(self, v5, (uint64_t)v4);
  id v6 = self;
  objc_sync_enter(v6);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v9 = objc_msgSend_assetsToDownload(v6, v7, v8);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v58, v64, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v59;
    while (1)
    {
      if (*(void *)v59 != v14) {
        objc_enumerationMutation(v9);
      }
      id v15 = objc_msgSend_group(v6, v11, v12);
      dispatch_group_leave(v15);

      if (!--v13)
      {
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v58, v64, 16);
        if (!v13) {
          break;
        }
      }
    }
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v18 = objc_msgSend_assetsToDownloadInMemory(v6, v16, v17);
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v54, v63, 16);
  if (v22)
  {
    uint64_t v23 = *(void *)v55;
    while (1)
    {
      if (*(void *)v55 != v23) {
        objc_enumerationMutation(v18);
      }
      uint64_t v24 = objc_msgSend_group(v6, v20, v21);
      dispatch_group_leave(v24);

      if (!--v22)
      {
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v54, v63, 16);
        if (!v22) {
          break;
        }
      }
    }
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  uint64_t v27 = objc_msgSend_assetURLInfosToFillOut(v6, v25, v26, 0, 0);
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v50, v62, 16);
  if (v31)
  {
    uint64_t v32 = *(void *)v51;
    while (1)
    {
      if (*(void *)v51 != v32) {
        objc_enumerationMutation(v27);
      }
      v33 = objc_msgSend_group(v6, v29, v30);
      dispatch_group_leave(v33);

      if (!--v31)
      {
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v50, v62, 16);
        if (!v31) {
          break;
        }
      }
    }
  }

  uint64_t v36 = objc_msgSend_assetsToDownload(v6, v34, v35);
  objc_msgSend_removeAllObjects(v36, v37, v38);

  uint64_t v41 = objc_msgSend_assetsToDownloadInMemory(v6, v39, v40);
  objc_msgSend_removeAllObjects(v41, v42, v43);

  uint64_t v46 = objc_msgSend_assetURLInfosToFillOut(v6, v44, v45);
  objc_msgSend_removeAllObjects(v46, v47, v48);

  objc_msgSend_setProgressTracker_(v6, v49, 0);
  objc_sync_exit(v6);
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableArray)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void)setAssetsToDownload:(id)a3
{
}

- (NSMutableArray)assetsToDownloadInMemory
{
  return self->_assetsToDownloadInMemory;
}

- (void)setAssetsToDownloadInMemory:(id)a3
{
}

- (NSMutableArray)assetURLInfosToFillOut
{
  return self->_assetURLInfosToFillOut;
}

- (void)setAssetURLInfosToFillOut:(id)a3
{
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (CKDProgressTracker)progressTracker
{
  return self->_progressTracker;
}

- (void)setProgressTracker:(id)a3
{
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTracker, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_assetURLInfosToFillOut, 0);
  objc_storeStrong((id *)&self->_assetsToDownloadInMemory, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end