@interface PHAssetResourceRequest
+ (id)_globalFileIOQueue;
- (BOOL)isCancelled;
- (BOOL)isSynchronous;
- (BOOL)loadURLOnly;
- (NSDictionary)info;
- (NSString)taskIdentifier;
- (PHAssetResource)assetResource;
- (PHAssetResourceRequest)initWithAssetResource:(id)a3 options:(id)a4 requestID:(int)a5 managerID:(unint64_t)a6 delegate:(id)a7 urlReceivedHandler:(id)a8 dataReceivedHandler:(id)a9 completionHandler:(id)a10;
- (PHAssetResourceRequestDelegate)delegate;
- (PHAssetResourceRequestOptions)options;
- (id)_initialValidationError;
- (id)_loadMediaMetadataFromDatabaseWithPhotoLibrary:(id)a3 type:(id *)a4 error:(id *)a5;
- (id)completionHandler;
- (id)dataHandler;
- (id)urlReceivedHandler;
- (int)requestID;
- (int64_t)_streamDataAtURL:(id)a3 error:(id *)a4 dataHandler:(id)a5;
- (unint64_t)fetchIncrementRetryAttemptCount;
- (unint64_t)managerID;
- (void)_assetsdMakeAvailableRequestRepliedWithSuccess:(BOOL)a3 url:(id)a4 data:(id)a5 info:(id)a6 error:(id)a7;
- (void)_finishAsyncWithFileURL:(id)a3 didBecomeAvailable:(BOOL)a4 error:(id)a5;
- (void)_finishWithFileURL:(id)a3 didBecomeAvailable:(BOOL)a4 error:(id)a5;
- (void)_setAvailabilityProgress:(id)a3;
- (void)_setupFilestreamProgressIfNeeded;
- (void)_setupTotalProgressIfNeeded;
- (void)_updateAssetResourceWithLocallyAvailable:(BOOL)a3 fileURL:(id)a4;
- (void)cancel;
- (void)configureWithError:(id)a3;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)setDataHandler:(id)a3;
- (void)setLoadURLOnly:(BOOL)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setTaskIdentifier:(id)a3;
- (void)setUrlReceivedHandler:(id)a3;
- (void)startRequest;
@end

@implementation PHAssetResourceRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataHandler, 0);
  objc_storeStrong(&self->_urlReceivedHandler, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetResource, 0);
  objc_storeStrong((id *)&self->_configuredError, 0);
  objc_storeStrong((id *)&self->_progressFollower, 0);
  objc_storeStrong((id *)&self->_totalProgress, 0);
  objc_storeStrong((id *)&self->_fileStreamProgress, 0);

  objc_storeStrong((id *)&self->_availabilityRequestProgressContainer, 0);
}

- (void)setDataHandler:(id)a3
{
}

- (id)dataHandler
{
  return self->_dataHandler;
}

- (void)setUrlReceivedHandler:(id)a3
{
}

- (id)urlReceivedHandler
{
  return self->_urlReceivedHandler;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setLoadURLOnly:(BOOL)a3
{
  self->_loadURLOnly = a3;
}

- (BOOL)loadURLOnly
{
  return self->_loadURLOnly;
}

- (void)setTaskIdentifier:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (PHAssetResourceRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHAssetResourceRequestDelegate *)WeakRetained;
}

- (unint64_t)managerID
{
  return self->_managerID;
}

- (int)requestID
{
  return self->_requestID;
}

- (PHAssetResourceRequestOptions)options
{
  return self->_options;
}

- (PHAssetResource)assetResource
{
  return self->_assetResource;
}

- (unint64_t)fetchIncrementRetryAttemptCount
{
  return atomic_fetch_add((atomic_uint *volatile)&self->_retryAttemptCount, 1u);
}

- (id)_loadMediaMetadataFromDatabaseWithPhotoLibrary:(id)a3 type:(id *)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__42548;
  v33 = __Block_byref_object_dispose__42549;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__42548;
  v27 = __Block_byref_object_dispose__42549;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__42548;
  v21 = __Block_byref_object_dispose__42549;
  id v22 = 0;
  v9 = PLImageManagerGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [(PHAssetResourceRequest *)self taskIdentifier];
    *(_DWORD *)buf = 138412290;
    v36 = v10;
    _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "[RM] %@ Attempting to load media metadata from database", buf, 0xCu);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__PHAssetResourceRequest__loadMediaMetadataFromDatabaseWithPhotoLibrary_type_error___block_invoke;
  v16[3] = &unk_1E5847C80;
  v16[4] = self;
  v16[5] = &v29;
  v16[6] = &v23;
  v16[7] = &v17;
  [v8 performBlockAndWait:v16];
  if (a4) {
    *a4 = (id) v18[5];
  }
  uint64_t v11 = v24[5];
  id v12 = (id)v30[5];
  v13 = v12;
  if (!v11 && a5) {
    *a5 = v12;
  }

  id v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __84__PHAssetResourceRequest__loadMediaMetadataFromDatabaseWithPhotoLibrary_type_error___block_invoke(void *a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = [MEMORY[0x1E4F8A950] entityName];
  v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = (void *)MEMORY[0x1E4F28F60];
  v6 = [*(id *)(a1[4] + 88) assetObjectID];
  v7 = [v5 predicateWithFormat:@"self = %@", v6];
  [v4 setPredicate:v7];

  id v8 = [*(id *)(a1[4] + 88) photoLibrary];
  v9 = [v8 photoLibrary];
  v10 = [v9 managedObjectContext];
  uint64_t v11 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v11 + 40);
  id v12 = [v10 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);

  if (v12)
  {
    v13 = [v12 firstObject];
    if (v13)
    {
      id v14 = [*(id *)(a1[4] + 88) backingResourceIdentity];
      uint64_t v15 = [v14 version];
      uint64_t v16 = *(void *)(a1[7] + 8);
      id v26 = *(id *)(v16 + 40);
      uint64_t v17 = [v13 mediaMetadataForResourceVersion:v15 mediaMetadataType:&v26];
      objc_storeStrong((id *)(v16 + 40), v26);
      uint64_t v18 = *(void *)(a1[6] + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v21 = NSString;
      id v14 = [*(id *)(a1[4] + 88) assetObjectID];
      uint64_t v19 = [v21 stringWithFormat:@"Cannot find asset with object ID %@", v14];
      v29[0] = v19;
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      uint64_t v23 = [v20 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v22];
      uint64_t v24 = *(void *)(a1[5] + 8);
      uint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
  }
}

- (void)_updateAssetResourceWithLocallyAvailable:(BOOL)a3 fileURL:(id)a4
{
  BOOL v4 = a3;
  assetResource = self->_assetResource;
  id v7 = a4;
  [(PHAssetResource *)assetResource setLocallyAvailable:v4];
  [(PHAssetResource *)self->_assetResource setPrivateFileURL:v7];
}

- (int64_t)_streamDataAtURL:(id)a3 error:(id *)a4 dataHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PHAssetResourceRequest.m", 414, @"Invalid parameter not satisfying: %@", @"fileURL" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"PHAssetResourceRequest.m", 415, @"Invalid parameter not satisfying: %@", @"dataHandler" object file lineNumber description];

LABEL_3:
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:v9];
  v13 = v12;
  if (!v12)
  {
    uint64_t v23 = @"Unable to initialize stream for resource %@";
LABEL_18:
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", v23, self->_assetResource);
    goto LABEL_19;
  }
  [v12 open];
  id v14 = [v13 streamError];
  if (v14)
  {
LABEL_19:
    char v31 = 0;
    int64_t v17 = -1;
    goto LABEL_20;
  }
  uint64_t v15 = malloc_type_malloc(0x100000uLL, 0x3B669A13uLL);
  if (!v15)
  {
    uint64_t v23 = @"Unable to reserve temporary space for resource %@";
    goto LABEL_18;
  }
  uint64_t v16 = v15;
  v30 = self;
  id v14 = 0;
  int64_t v17 = 0;
  char v31 = 0;
  while ([v13 hasBytesAvailable])
  {
    uint64_t v18 = [v13 read:v16 maxLength:0x100000];
    uint64_t v19 = v18;
    if (v18 <= 0)
    {
      if (v18 < 0)
      {
        uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
        id v26 = [v13 streamError];
        uint64_t v27 = objc_msgSend(v25, "ph_genericErrorWithUnderlyingError:localizedDescription:", v26, @"Unable to continue reading data for resource %@", v30->_assetResource);

        int64_t v17 = -1;
        id v14 = (void *)v27;
        break;
      }
      if (v17 < 0) {
        goto LABEL_16;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x19F389B10]();
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v16 length:v19 freeWhenDone:0];
      ((void (**)(void, void *, char *))v11)[2](v11, v21, &v31);
      if (v31)
      {
        uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3072, 0);

        int64_t v17 = -1;
        id v14 = (void *)v22;
      }
      else
      {
        v17 += v19;
      }

      if (v17 < 0)
      {
LABEL_16:
        int64_t v17 = -1;
        break;
      }
    }
  }
  free(v16);
LABEL_20:
  [v13 close];
  if (a4) {
    *a4 = v14;
  }

  return v17;
}

- (void)_finishAsyncWithFileURL:(id)a3 didBecomeAvailable:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(id)objc_opt_class() _globalFileIOQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PHAssetResourceRequest__finishAsyncWithFileURL_didBecomeAvailable_error___block_invoke;
  v13[3] = &unk_1E5847C58;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __75__PHAssetResourceRequest__finishAsyncWithFileURL_didBecomeAvailable_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithFileURL:*(void *)(a1 + 40) didBecomeAvailable:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)_finishWithFileURL:(id)a3 didBecomeAvailable:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (!v8 || v9) {
    goto LABEL_25;
  }
  urlReceivedHandler = (void (**)(id, id))self->_urlReceivedHandler;
  if (urlReceivedHandler) {
    urlReceivedHandler[2](urlReceivedHandler, v8);
  }
  if (self->_loadURLOnly)
  {
    id v10 = 0;
    if (!v6) {
      goto LABEL_25;
    }
    goto LABEL_17;
  }
  [(PHAssetResourceRequest *)self _setupFilestreamProgressIfNeeded];
  if (self->_fileStreamProgress)
  {
    id v41 = 0;
    uint64_t v12 = *MEMORY[0x1E4F1C5F8];
    id v40 = 0;
    int v13 = [v8 getResourceValue:&v41 forKey:v12 error:&v40];
    id v14 = v41;
    id v15 = v40;
    if (v13)
    {
      -[NSProgress setTotalUnitCount:](self->_fileStreamProgress, "setTotalUnitCount:", [v14 unsignedIntegerValue]);
    }
    else
    {
      [(NSProgress *)self->_fileStreamProgress setTotalUnitCount:0];
      BOOL v16 = PLImageManagerGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v15;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Unable to read file size, error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v15 = 0;
  }
  v38[4] = self;
  id v39 = v15;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __70__PHAssetResourceRequest__finishWithFileURL_didBecomeAvailable_error___block_invoke;
  v38[3] = &unk_1E5847C30;
  [(PHAssetResourceRequest *)self _streamDataAtURL:v8 error:&v39 dataHandler:v38];
  id v10 = v39;

  if (v6)
  {
LABEL_17:
    if ([(PHAssetResourceRequestOptions *)self->_options pruneAfterAvailableOnLowDisk])
    {
      int64_t v17 = [(PHAssetResourceRequestOptions *)self->_options pruneAfterAvailableLowDiskThresholdBytes];
      if (v17)
      {
        uint64_t v18 = [(PHAssetResourceRequestOptions *)self->_options pruneAfterAvailableLowDiskThresholdBytes];
        uint64_t v19 = [v18 longLongValue];
      }
      else
      {
        uint64_t v19 = 0x80000000;
      }

      v20 = (void *)MEMORY[0x1E4F8B8D8];
      v21 = [v8 path];
      uint64_t v22 = [v20 diskSpaceAvailableForPath:v21];

      if (v22 < v19)
      {
        uint64_t v23 = PLImageManagerGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [(PHAssetResourceRequest *)self taskIdentifier];
          *(_DWORD *)buf = 138543874;
          id v43 = v24;
          __int16 v44 = 2048;
          uint64_t v45 = v22;
          __int16 v46 = 2048;
          uint64_t v47 = v19;
          _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ sending resource unavailable request, availableStorage: %lld purgeThreshold: %lld", buf, 0x20u);
        }
        id v25 = objc_alloc(MEMORY[0x1E4F8AB58]);
        id v26 = [(PHAssetResourceRequest *)self taskIdentifier];
        uint64_t v27 = [(PHAssetResource *)self->_assetResource assetObjectID];
        uint64_t v28 = [(PHAssetResource *)self->_assetResource backingResourceIdentity];
        uint64_t v29 = (void *)[v25 initWithTaskIdentifier:v26 assetObjectID:v27 resource:v28];

        v30 = [(PHAssetResourceRequest *)self assetResource];
        char v31 = [v30 photoLibrary];
        v32 = [v31 assetsdClient];
        v33 = [v32 resourceAvailabilityClient];
        [v33 sendMakeResourceUnavailableRequest:v29];
      }
    }
  }
LABEL_25:
  os_unfair_lock_lock(&self->_lock);
  id v34 = (void (**)(void *, void *))_Block_copy(self->_completionHandler);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v34)
  {
    v36 = PHPublicErrorFromError(v10);
    v34[2](v34, v36);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assetResourceRequest:self didFinishWithError:v10];
}

void __70__PHAssetResourceRequest__finishWithFileURL_didBecomeAvailable_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(unsigned __int8 *)(v5 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
  if (v6)
  {
    *a3 = 1;
  }
  else
  {
    if ([*(id *)(*(void *)(a1 + 32) + 32) totalUnitCount] >= 1) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setCompletedUnitCount:", objc_msgSend(v8, "length") + objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "completedUnitCount"));
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 152);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
    }
  }
}

- (void)_setupFilestreamProgressIfNeeded
{
  if (self->_fileStreamPendingCount >= 1 && !self->_fileStreamProgress)
  {
    v3 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
    fileStreamProgress = self->_fileStreamProgress;
    self->_fileStreamProgress = v3;

    int64_t fileStreamPendingCount = self->_fileStreamPendingCount;
    totalProgress = self->_totalProgress;
    uint64_t v7 = self->_fileStreamProgress;
    [(NSProgress *)totalProgress addChild:v7 withPendingUnitCount:fileStreamPendingCount];
  }
}

- (void)_setAvailabilityProgress:(id)a3
{
  id v4 = a3;
  if (v4 && self->_availabilityPendingCount >= 1)
  {
    availabilityRequestProgressContainer = self->_availabilityRequestProgressContainer;
    id v10 = v4;
    if (!availabilityRequestProgressContainer)
    {
      int v6 = objc_alloc_init(PHProgressContainerForRetryableRequest);
      uint64_t v7 = self->_availabilityRequestProgressContainer;
      self->_availabilityRequestProgressContainer = v6;

      totalProgress = self->_totalProgress;
      id v9 = [(PHProgressContainerForRetryableRequest *)self->_availabilityRequestProgressContainer totalProgress];
      [(NSProgress *)totalProgress addChild:v9 withPendingUnitCount:self->_availabilityPendingCount];

      availabilityRequestProgressContainer = self->_availabilityRequestProgressContainer;
    }
    [(PHProgressContainerForRetryableRequest *)availabilityRequestProgressContainer setRequestProgress:v10];
    id v4 = v10;
  }
}

- (void)_setupTotalProgressIfNeeded
{
  v3 = [(PHAssetResourceRequestOptions *)self->_options progressHandler];

  if (!v3 || self->_totalProgress) {
    return;
  }
  id v4 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
  totalProgress = self->_totalProgress;
  self->_totalProgress = v4;

  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F8AAE8]);
  uint64_t v7 = self->_totalProgress;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  BOOL v16 = __53__PHAssetResourceRequest__setupTotalProgressIfNeeded__block_invoke;
  int64_t v17 = &unk_1E5847C08;
  objc_copyWeak(&v18, &location);
  id v8 = (PLProgressFollower *)[v6 initWithSourceProgress:v7 progressHandler:&v14];
  progressFollower = self->_progressFollower;
  self->_progressFollower = v8;

  BOOL v10 = [(PHAssetResource *)self->_assetResource isLocallyAvailable];
  if ([(PHAssetResourceRequestOptions *)self->_options downloadIsTransient])
  {
    BOOL v11 = 0;
    if (v10) {
      goto LABEL_10;
    }
LABEL_7:
    int64_t v12 = 100;
    if (v11) {
      int64_t v12 = 50;
    }
    self->_availabilityPendingCount = v12;
    goto LABEL_10;
  }
  BOOL v11 = !self->_loadURLOnly;
  if (!v10) {
    goto LABEL_7;
  }
LABEL_10:
  if (v11)
  {
    int64_t v13 = 50;
    if (v10) {
      int64_t v13 = 100;
    }
    self->_int64_t fileStreamPendingCount = v13;
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __53__PHAssetResourceRequest__setupTotalProgressIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained options];
  uint64_t v5 = [v4 progressHandler];
  [v3 fractionCompleted];
  double v7 = v6;

  v5[2](v5, v7);
}

- (id)_initialValidationError
{
  configuredError = self->_configuredError;
  if (configuredError)
  {
    id v3 = configuredError;
  }
  else if ([(PHAssetResourceRequestOptions *)self->_options downloadIsTransient])
  {
    if ([(PHAssetResourceRequestOptions *)self->_options isNetworkAccessAllowed])
    {
      id v3 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3164, @"Transient data requests can only run with network access allowed");
      id v3 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v5 = [(PHAssetResource *)self->_assetResource privateFileLoader];

    if (v5)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"File loader backed asset resources do not support transient data requests");

      id v3 = (NSError *)v6;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (NSString)taskIdentifier
{
  taskIdentifier = self->_taskIdentifier;
  if (taskIdentifier)
  {
    id v3 = taskIdentifier;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"AR-%lu-%lu", self->_managerID, self->_requestID);
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)_assetsdMakeAvailableRequestRepliedWithSuccess:(BOOL)a3 url:(id)a4 data:(id)a5 info:(id)a6 error:(id)a7
{
  BOOL v10 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  objc_storeStrong((id *)&self->_info, a6);
  if (v10)
  {
    if (!v13)
    {
      if (v12)
      {
        uint64_t v22 = (void *)MEMORY[0x1E4F8AB30];
        id v34 = [(PHAssetResourceRequest *)self assetResource];
        uint64_t v23 = [v34 libraryID];
        uint64_t v24 = [(PHAssetResourceRequest *)self assetResource];
        id v25 = [v24 assetLocalIdentifier];
        id v26 = +[PHObject uuidFromLocalIdentifier:v25];
        id v36 = 0;
        LOBYTE(v22) = [v22 refreshSandboxExtensionForURL:v12 libraryID:v23 assetUUID:v26 error:&v36];
        id v35 = v36;

        if (v22)
        {
          [(PHAssetResourceRequest *)self _updateAssetResourceWithLocallyAvailable:1 fileURL:v12];
          uint64_t v27 = v35;
        }
        else
        {
          v30 = PLImageManagerGetLog();
          uint64_t v27 = v35;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            char v31 = [(PHAssetResourceRequest *)self taskIdentifier];
            v32 = [v12 path];
            *(_DWORD *)buf = 138543874;
            v38 = v31;
            __int16 v39 = 2112;
            id v40 = v32;
            __int16 v41 = 2112;
            id v42 = v35;
            _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_ERROR, "[RM] %{public}@ asset resource request failed to refresh sandbox extension for path: %@, error; %@",
              buf,
              0x20u);
          }
          id v33 = v35;

          id v15 = v33;
        }

        uint64_t v28 = 1;
      }
      else
      {
        uint64_t v29 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Download reported success but no file URL specified");

        uint64_t v28 = 0;
        id v15 = (id)v29;
      }
      goto LABEL_16;
    }
    dataHandler = (void (**)(id, id))self->_dataHandler;
    if (dataHandler) {
      dataHandler[2](dataHandler, v13);
    }
    goto LABEL_15;
  }
  if (![(PHAssetResourceRequestOptions *)self->_options isNetworkAccessAllowed])
  {
    int64_t v17 = [v14 objectForKeyedSubscript:@"PHImageResultIsInCloudKey"];
    int v18 = [v17 BOOLValue];

    if (v18)
    {
      uint64_t v19 = PHNetworkAccessAllowedRequiredError();

      id v15 = (id)v19;
    }
  }
  v20 = [(PHAssetResourceRequest *)self delegate];
  char v21 = [v20 retryAssetResourceRequest:self afterFailureWithError:v15];

  if (v15)
  {
    if (v21) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Download failed");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if ((v21 & 1) == 0)
  {
LABEL_15:
    uint64_t v28 = 0;
LABEL_16:
    [(PHAssetResourceRequest *)self _finishWithFileURL:v12 didBecomeAvailable:v28 error:v15];
  }
LABEL_17:
}

- (void)configureWithError:(id)a3
{
}

- (void)startRequest
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PHAssetResourceRequest *)self _initialValidationError];
  if (v3)
  {
    [(PHAssetResourceRequest *)self _finishWithFileURL:0 didBecomeAvailable:0 error:v3];
    goto LABEL_35;
  }
  [(PHAssetResourceRequest *)self _setupTotalProgressIfNeeded];
  id v4 = [(PHAssetResource *)self->_assetResource backingResourceIdentity];
  if ([v4 resourceType] == 9)
  {
    unint64_t v5 = [(PHAssetResource *)self->_assetResource cplResourceType];

    if (!v5)
    {
      uint64_t v6 = [(PHAssetResource *)self->_assetResource photoLibrary];
      double v7 = [v6 photoLibrary];
      id v52 = 0;
      id v53 = 0;
      id v8 = [(PHAssetResourceRequest *)self _loadMediaMetadataFromDatabaseWithPhotoLibrary:v7 type:&v53 error:&v52];
      id v9 = v53;
      id v10 = v52;

      if (v9)
      {
        v58 = @"PHMediaMetadataTypeKey";
        v59[0] = v9;
        BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v58 count:1];
        info = self->_info;
        self->_info = v11;
      }
      dataHandler = (void (**)(id, void *))self->_dataHandler;
      if (dataHandler) {
        dataHandler[2](dataHandler, v8);
      }
      [(PHAssetResourceRequest *)self _finishWithFileURL:0 didBecomeAvailable:0 error:v10];

      goto LABEL_30;
    }
  }
  else
  {
  }
  if (![(PHAssetResource *)self->_assetResource isLocallyAvailable]
    || [(PHAssetResourceRequestOptions *)self->_options downloadIsTransient])
  {
    goto LABEL_24;
  }
  id v14 = [(PHAssetResource *)self->_assetResource privateFileURL];

  if (!v14)
  {
    int v18 = PLImageManagerGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v19 = "Asset resource marked locally available but has no file URL";
LABEL_22:
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    }
LABEL_23:

    goto LABEL_24;
  }
  id v15 = [(PHAssetResource *)self->_assetResource privateFileURL];
  char v16 = [v15 checkResourceIsReachableAndReturnError:0];

  if ((v16 & 1) == 0)
  {
    int v18 = PLImageManagerGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v19 = "Asset resource file URL not reachable, may have been pruned, will attempt availability change request";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (![(PHAssetResourceRequestOptions *)self->_options downloadIsTransient])
  {
    BOOL synchronous = self->_synchronous;
    id v9 = [(PHAssetResource *)self->_assetResource privateFileURL];
    if (synchronous) {
      [(PHAssetResourceRequest *)self _finishWithFileURL:v9 didBecomeAvailable:0 error:0];
    }
    else {
      [(PHAssetResourceRequest *)self _finishAsyncWithFileURL:v9 didBecomeAvailable:0 error:0];
    }
    goto LABEL_30;
  }
LABEL_24:
  v20 = [(PHAssetResource *)self->_assetResource privateFileLoader];

  if (v20)
  {
    char v21 = PLImageManagerGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = [(PHAssetResourceRequest *)self taskIdentifier];
      *(_DWORD *)buf = 138412290;
      v57 = v22;
      _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_DEBUG, "[RM] %@ Using private file loader to load asset resource data", buf, 0xCu);
    }
    uint64_t v23 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    [(PHAssetResourceRequest *)self _setAvailabilityProgress:v23];
    uint64_t v24 = [(PHAssetResource *)self->_assetResource privateFileLoader];
    BOOL v25 = [(PHAssetResourceRequestOptions *)self->_options isNetworkAccessAllowed];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __38__PHAssetResourceRequest_startRequest__block_invoke;
    v50[3] = &unk_1E5847B68;
    v50[4] = self;
    id v51 = v23;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __38__PHAssetResourceRequest_startRequest__block_invoke_2;
    v47[3] = &unk_1E5847B90;
    id v48 = v51;
    v49 = self;
    id v26 = (void (*)(void *, BOOL, void *, void *))v24[2];
    id v27 = v51;
    v26(v24, v25, v50, v47);
  }
  else
  {
    uint64_t v28 = [(PHAssetResource *)self->_assetResource backingResourceIdentity];

    if (v28)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F8AB58]);
      v30 = [(PHAssetResourceRequest *)self taskIdentifier];
      char v31 = [(PHAssetResource *)self->_assetResource assetObjectID];
      v32 = [(PHAssetResource *)self->_assetResource backingResourceIdentity];
      id v9 = (id)[v29 initWithTaskIdentifier:v30 assetObjectID:v31 resource:v32];

      objc_msgSend(v9, "setNetworkAccessAllowed:", -[PHAssetResourceRequestOptions isNetworkAccessAllowed](self->_options, "isNetworkAccessAllowed"));
      id v33 = [(PHAssetResourceRequestOptions *)self->_options progressHandler];
      [v9 setWantsProgress:v33 != 0];

      objc_msgSend(v9, "setTransient:", -[PHAssetResourceRequestOptions downloadIsTransient](self->_options, "downloadIsTransient"));
      objc_msgSend(v9, "setDownloadIntent:", -[PHAssetResourceRequestOptions downloadIntent](self->_options, "downloadIntent"));
      objc_msgSend(v9, "setDownloadPriority:", -[PHAssetResourceRequestOptions downloadPriority](self->_options, "downloadPriority"));
      id v34 = [(PHAssetResourceRequest *)self assetResource];
      id v35 = [v34 photoLibrary];
      id v36 = [v35 assetsdClient];
      uint64_t v37 = [v36 resourceAvailabilityClient];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __38__PHAssetResourceRequest_startRequest__block_invoke_3;
      v46[3] = &unk_1E5847BE0;
      v46[4] = self;
      v38 = [v37 sendMakeResourceAvailableRequest:v9 reply:v46];

      [(PHAssetResourceRequest *)self _setAvailabilityProgress:v38];
LABEL_30:

      goto LABEL_35;
    }
    __int16 v39 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F28228];
    id v40 = NSString;
    __int16 v41 = [(PHAssetResource *)self->_assetResource assetLocalIdentifier];
    id v42 = [(PHAssetResource *)self->_assetResource originalFilename];
    uint64_t v43 = [v40 stringWithFormat:@"Asset resource (asset identifier: %@, filename: %@) missing fileLoader or backing resource, unable to load data", v41, v42];
    v55 = v43;
    __int16 v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    uint64_t v45 = objc_msgSend(v39, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v44);

    if (self->_synchronous) {
      [(PHAssetResourceRequest *)self _finishWithFileURL:0 didBecomeAvailable:0 error:v45];
    }
    else {
      [(PHAssetResourceRequest *)self _finishAsyncWithFileURL:0 didBecomeAvailable:0 error:v45];
    }
  }
LABEL_35:
}

void __38__PHAssetResourceRequest_startRequest__block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(unsigned __int8 *)(v6 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 8));
  if (v7)
  {
    *a2 = 1;
  }
  else
  {
    uint64_t v8 = (uint64_t)((double)[*(id *)(a1 + 40) totalUnitCount] * a3);
    id v9 = *(void **)(a1 + 40);
    [v9 setCompletedUnitCount:v8];
  }
}

void __38__PHAssetResourceRequest_startRequest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  if (v6) {
    [*(id *)(a1 + 40) _updateAssetResourceWithLocallyAvailable:1 fileURL:v6];
  }
  [*(id *)(a1 + 40) _finishAsyncWithFileURL:v6 didBecomeAvailable:0 error:v5];
}

void __38__PHAssetResourceRequest_startRequest__block_invoke_3(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(id)objc_opt_class() _globalFileIOQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __38__PHAssetResourceRequest_startRequest__block_invoke_4;
  v21[3] = &unk_1E5847BB8;
  uint64_t v16 = *(void *)(a1 + 32);
  char v26 = a2;
  v21[4] = v16;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(v15, v21);
}

uint64_t __38__PHAssetResourceRequest_startRequest__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _assetsdMakeAvailableRequestRepliedWithSuccess:*(unsigned __int8 *)(a1 + 72) url:*(void *)(a1 + 40) data:*(void *)(a1 + 48) info:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_cancelled = 1;
  os_unfair_lock_unlock(p_lock);
  id v4 = [(PHProgressContainerForRetryableRequest *)self->_availabilityRequestProgressContainer totalProgress];
  [v4 cancel];
}

- (BOOL)isCancelled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_cancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)dealloc
{
  [(PLProgressFollower *)self->_progressFollower invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PHAssetResourceRequest;
  [(PHAssetResourceRequest *)&v3 dealloc];
}

- (PHAssetResourceRequest)initWithAssetResource:(id)a3 options:(id)a4 requestID:(int)a5 managerID:(unint64_t)a6 delegate:(id)a7 urlReceivedHandler:(id)a8 dataReceivedHandler:(id)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if (!v16)
  {
    char v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PHAssetResourceRequest.m", 73, @"Invalid parameter not satisfying: %@", @"assetResource" object file lineNumber description];
  }
  v34.receiver = self;
  v34.super_class = (Class)PHAssetResourceRequest;
  id v22 = [(PHAssetResourceRequest *)&v34 init];
  id v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_assetResource, a3);
    if (v19)
    {
      uint64_t v24 = [v19 copy];
      id urlReceivedHandler = v23->_urlReceivedHandler;
      v23->_id urlReceivedHandler = (id)v24;
    }
    if (v20)
    {
      uint64_t v26 = [v20 copy];
      id dataHandler = v23->_dataHandler;
      v23->_id dataHandler = (id)v26;
    }
    if (v21)
    {
      uint64_t v28 = [v21 copy];
      id completionHandler = v23->_completionHandler;
      v23->_id completionHandler = (id)v28;
    }
    v23->_managerID = a6;
    v23->_requestID = a5;
    objc_storeStrong((id *)&v23->_options, a4);
    objc_storeWeak((id *)&v23->_delegate, v18);
    v23->_lock._os_unfair_lock_opaque = 0;
    atomic_store(0, &v23->_retryAttemptCount);
  }

  return v23;
}

+ (id)_globalFileIOQueue
{
  if (_globalFileIOQueue_onceToken != -1) {
    dispatch_once(&_globalFileIOQueue_onceToken, &__block_literal_global_42631);
  }
  v2 = (void *)_globalFileIOQueue_ioQueue;

  return v2;
}

void __44__PHAssetResourceRequest__globalFileIOQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photos.assetResources.fileIO", v2);
  v1 = (void *)_globalFileIOQueue_ioQueue;
  _globalFileIOQueue_ioQueue = (uint64_t)v0;
}

@end