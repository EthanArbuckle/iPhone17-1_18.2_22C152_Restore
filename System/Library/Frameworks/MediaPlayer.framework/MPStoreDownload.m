@interface MPStoreDownload
+ (id)_SSPurchaseForType:(int64_t)a3 attributes:(id)a4;
+ (id)storeDownloadForMediaItem:(id)a3 type:(int64_t)a4 attributes:(id)a5;
+ (id)storeDownloadWithDownloadIdentifier:(int64_t)a3;
- (BOOL)_isCanceled;
- (BOOL)isCanceled;
- (BOOL)isFinished;
- (BOOL)isPaused;
- (BOOL)isPurchasing;
- (BOOL)isRestore;
- (MPStoreDownload)initWithType:(int64_t)a3 attributes:(id)a4;
- (NSDictionary)attributes;
- (NSDictionary)rentalInformation;
- (NSError)failureError;
- (NSError)purchaseError;
- (NSString)phaseIdentifier;
- (double)percentComplete;
- (id)_SSDownload;
- (id)_SSPurchase;
- (id)_SSPurchaseResponse;
- (id)_currentOverridePhaseIdentifier;
- (id)_getDownloadFilePath;
- (id)_valueForDownloadProperty:(id)a3;
- (id)assetsForType:(id)a3;
- (id)description;
- (int64_t)bytesDownloaded;
- (int64_t)bytesTotal;
- (int64_t)downloadIdentifier;
- (int64_t)downloadSizeLimit;
- (int64_t)reason;
- (int64_t)storeItemIdentifier;
- (int64_t)type;
- (unint64_t)libraryItemIdentifier;
- (void)_addOverridePhaseIdentifier:(id)a3;
- (void)_removeOverridePhaseIdentifier:(id)a3;
- (void)_setCanceled:(BOOL)a3;
- (void)_setDownloadFilePath:(id)a3;
- (void)_setSSDownload:(id)a3;
- (void)_setSSPurchase:(id)a3 SSPurchaseResponse:(id)a4;
- (void)resetCachedRentalInformation;
@end

@implementation MPStoreDownload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadFilePath, 0);
  objc_storeStrong((id *)&self->_SSPurchaseResponse, 0);
  objc_storeStrong((id *)&self->_SSPurchase, 0);
  objc_storeStrong((id *)&self->_SSDownload, 0);
  objc_storeStrong((id *)&self->_overridePhaseIdentifiers, 0);
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (id)_valueForDownloadProperty:(id)a3
{
  id v4 = a3;
  v5 = [(MPStoreDownload *)self _SSDownload];
  v6 = [v5 valueForProperty:v4];

  if (!v6)
  {
    v7 = [(MPStoreDownload *)self _SSPurchase];
    v6 = [v7 valueForDownloadProperty:v4];
  }

  return v6;
}

- (id)_currentOverridePhaseIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__55910;
  v10 = __Block_byref_object_dispose__55911;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__MPStoreDownload__currentOverridePhaseIdentifier__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__MPStoreDownload__currentOverridePhaseIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) lastObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_removeOverridePhaseIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__MPStoreDownload__removeOverridePhaseIdentifier___block_invoke;
    v7[3] = &unk_1E57F9F98;
    v7[4] = self;
    id v8 = v4;
    dispatch_barrier_async(accessQueue, v7);
  }
}

void __50__MPStoreDownload__removeOverridePhaseIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = __50__MPStoreDownload__removeOverridePhaseIdentifier___block_invoke_2;
  id v8 = &unk_1E57F9E30;
  id v9 = *(id *)(a1 + 40);
  v10 = &v11;
  [v2 enumerateObjectsWithOptions:2 usingBlock:&v5];
  if (v12[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObjectAtIndex:", v5, v6, v7, v8);
    if (![*(id *)(*(void *)(a1 + 32) + 32) count])
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 32);
      *(void *)(v3 + 32) = 0;
    }
  }

  _Block_object_dispose(&v11, 8);
}

uint64_t __50__MPStoreDownload__removeOverridePhaseIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqualToString:*(void *)(a1 + 32)];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)_addOverridePhaseIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__MPStoreDownload__addOverridePhaseIdentifier___block_invoke;
    v7[3] = &unk_1E57F9F98;
    v7[4] = self;
    id v8 = v4;
    dispatch_barrier_async(accessQueue, v7);
  }
}

uint64_t __47__MPStoreDownload__addOverridePhaseIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (void)_setDownloadFilePath:(id)a3
{
}

- (id)_getDownloadFilePath
{
  return self->_downloadFilePath;
}

- (id)_SSPurchaseResponse
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__55910;
  v10 = __Block_byref_object_dispose__55911;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MPStoreDownload__SSPurchaseResponse__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__MPStoreDownload__SSPurchaseResponse__block_invoke(uint64_t a1)
{
}

- (id)_SSPurchase
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__55910;
  v10 = __Block_byref_object_dispose__55911;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__MPStoreDownload__SSPurchase__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__MPStoreDownload__SSPurchase__block_invoke(uint64_t a1)
{
}

- (id)_SSDownload
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__55910;
  v10 = __Block_byref_object_dispose__55911;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__MPStoreDownload__SSDownload__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__MPStoreDownload__SSDownload__block_invoke(uint64_t a1)
{
}

- (void)_setSSPurchase:(id)a3 SSPurchaseResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MPStoreDownload__setSSPurchase_SSPurchaseResponse___block_invoke;
  block[3] = &unk_1E57FA038;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(accessQueue, block);
}

void __53__MPStoreDownload__setSSPurchase_SSPurchaseResponse___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = (void *)a1[5];
  if (*(void **)(v2 + 48) != v3)
  {
    objc_storeStrong((id *)(v2 + 48), v3);
    uint64_t v2 = a1[4];
  }
  uint64_t v5 = *(void **)(v2 + 56);
  uint64_t v4 = (id *)(v2 + 56);
  id v6 = (void *)a1[6];
  if (v5 != v6)
  {
    objc_storeStrong(v4, v6);
  }
}

- (void)_setSSDownload:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__MPStoreDownload__setSSDownload___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __34__MPStoreDownload__setSSDownload___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(v2 + 40);
  id v4 = (id *)(v2 + 40);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

- (void)_setCanceled:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__MPStoreDownload__setCanceled___block_invoke;
  v4[3] = &unk_1E57F9E08;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_barrier_async(accessQueue, v4);
}

uint64_t __32__MPStoreDownload__setCanceled___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 24) != v2) {
    *(unsigned char *)(v1 + 24) = v2;
  }
  return result;
}

- (BOOL)_isCanceled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__MPStoreDownload__isCanceled__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__MPStoreDownload__isCanceled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)resetCachedRentalInformation
{
  v4[1] = *(id *)MEMORY[0x1E4F143B8];
  getSSDownloadExternalPropertyRentalInformation();
  v4[0] = (id)objc_claimAutoreleasedReturnValue();
  char v3 = [(MPStoreDownload *)self _SSDownload];
  [v3 resetCachedExternalProperties:v4 count:1];
}

- (id)assetsForType:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MPStoreDownload *)self _SSDownload];
  uint64_t v6 = [v5 assetsForType:v4];

  return v6;
}

- (int64_t)storeItemIdentifier
{
  char v3 = getSSDownloadPropertyStoreItemIdentifier();
  id v4 = [(MPStoreDownload *)self _valueForDownloadProperty:v3];
  int64_t v5 = [v4 longLongValue];

  return v5;
}

- (NSDictionary)rentalInformation
{
  int v2 = [(MPStoreDownload *)self _SSDownload];
  char v3 = getSSDownloadExternalPropertyRentalInformation();
  id v4 = [v2 valueForExternalProperty:v3];

  return (NSDictionary *)v4;
}

- (int64_t)reason
{
  char v3 = getSSDownloadPropertyReason();
  id v4 = [(MPStoreDownload *)self _valueForDownloadProperty:v3];
  uint64_t v5 = [v4 integerValue];

  if (v5 == 1) {
    return 1;
  }
  else {
    return 2 * (v5 == 2);
  }
}

- (NSError)purchaseError
{
  if ([(MPStoreDownload *)self _isCanceled])
  {
    char v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-999 userInfo:0];
  }
  else
  {
    id v4 = [(MPStoreDownload *)self _SSPurchaseResponse];
    char v3 = [v4 error];
  }

  return (NSError *)v3;
}

- (NSString)phaseIdentifier
{
  char v3 = [(MPStoreDownload *)self _currentOverridePhaseIdentifier];
  id v4 = v3;
  if (!v3)
  {
    uint64_t v6 = [(MPStoreDownload *)self _SSPurchaseResponse];
    uint64_t v7 = [(MPStoreDownload *)self _SSPurchase];
    uint64_t v8 = [(MPStoreDownload *)self _SSDownload];
    char v9 = v8;
    uint64_t v5 = @"MPStoreDownloadPhaseWaiting";
    if (v7 | v6 && !v8) {
      goto LABEL_53;
    }
    if (!v8)
    {
      id v13 = [(id)v6 error];

      if (v7) {
        BOOL v14 = v6 == 0;
      }
      else {
        BOOL v14 = 0;
      }
      v15 = @"MPStoreDownloadPhasePurchasing";
      if (!v14) {
        v15 = @"MPStoreDownloadPhaseFailed";
      }
      if (v13) {
        uint64_t v5 = @"MPStoreDownloadPhaseFailed";
      }
      else {
        uint64_t v5 = v15;
      }
      goto LABEL_53;
    }
    id v10 = [v8 downloadPhaseIdentifier];
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    id v11 = (void *)getSSDownloadPhaseCanceledSymbolLoc_ptr;
    uint64_t v44 = getSSDownloadPhaseCanceledSymbolLoc_ptr;
    if (!getSSDownloadPhaseCanceledSymbolLoc_ptr)
    {
      uint64_t v37 = MEMORY[0x1E4F143A8];
      uint64_t v38 = 3221225472;
      v39 = __getSSDownloadPhaseCanceledSymbolLoc_block_invoke;
      v40 = &unk_1E57FA300;
      id v12 = StoreServicesLibrary();
      v42[3] = (uint64_t)dlsym(v12, "SSDownloadPhaseCanceled");
      getSSDownloadPhaseCanceledSymbolLoc_ptr = v42[3];
      id v11 = (void *)v42[3];
    }
    _Block_object_dispose(&v41, 8);
    if (v11)
    {
      if ([v10 isEqualToString:*v11])
      {
        uint64_t v5 = @"MPStoreDownloadPhaseCanceled";
LABEL_52:

        uint64_t v5 = v5;
LABEL_53:

        goto LABEL_54;
      }
      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x2020000000;
      v16 = (void *)getSSDownloadPhaseDataRestoreSymbolLoc_ptr;
      uint64_t v44 = getSSDownloadPhaseDataRestoreSymbolLoc_ptr;
      if (!getSSDownloadPhaseDataRestoreSymbolLoc_ptr)
      {
        uint64_t v37 = MEMORY[0x1E4F143A8];
        uint64_t v38 = 3221225472;
        v39 = __getSSDownloadPhaseDataRestoreSymbolLoc_block_invoke;
        v40 = &unk_1E57FA300;
        v17 = StoreServicesLibrary();
        v42[3] = (uint64_t)dlsym(v17, "SSDownloadPhaseDataRestore");
        getSSDownloadPhaseDataRestoreSymbolLoc_ptr = v42[3];
        v16 = (void *)v42[3];
      }
      _Block_object_dispose(&v41, 8);
      if (v16)
      {
        if ([v10 isEqualToString:*v16])
        {
          uint64_t v5 = @"MPStoreDownloadPhaseDataRestore";
          goto LABEL_52;
        }
        uint64_t v41 = 0;
        v42 = &v41;
        uint64_t v43 = 0x2020000000;
        v18 = (void *)getSSDownloadPhaseDownloadingSymbolLoc_ptr;
        uint64_t v44 = getSSDownloadPhaseDownloadingSymbolLoc_ptr;
        if (!getSSDownloadPhaseDownloadingSymbolLoc_ptr)
        {
          uint64_t v37 = MEMORY[0x1E4F143A8];
          uint64_t v38 = 3221225472;
          v39 = __getSSDownloadPhaseDownloadingSymbolLoc_block_invoke;
          v40 = &unk_1E57FA300;
          v19 = StoreServicesLibrary();
          v42[3] = (uint64_t)dlsym(v19, "SSDownloadPhaseDownloading");
          getSSDownloadPhaseDownloadingSymbolLoc_ptr = v42[3];
          v18 = (void *)v42[3];
        }
        _Block_object_dispose(&v41, 8);
        if (v18)
        {
          if ([v10 isEqualToString:*v18])
          {
            uint64_t v5 = @"MPStoreDownloadPhaseDownloading";
            goto LABEL_52;
          }
          uint64_t v41 = 0;
          v42 = &v41;
          uint64_t v43 = 0x2020000000;
          v20 = (void *)getSSDownloadPhaseFailedSymbolLoc_ptr;
          uint64_t v44 = getSSDownloadPhaseFailedSymbolLoc_ptr;
          if (!getSSDownloadPhaseFailedSymbolLoc_ptr)
          {
            uint64_t v37 = MEMORY[0x1E4F143A8];
            uint64_t v38 = 3221225472;
            v39 = __getSSDownloadPhaseFailedSymbolLoc_block_invoke;
            v40 = &unk_1E57FA300;
            v21 = StoreServicesLibrary();
            v42[3] = (uint64_t)dlsym(v21, "SSDownloadPhaseFailed");
            getSSDownloadPhaseFailedSymbolLoc_ptr = v42[3];
            v20 = (void *)v42[3];
          }
          _Block_object_dispose(&v41, 8);
          if (v20)
          {
            if ([v10 isEqualToString:*v20])
            {
              uint64_t v5 = @"MPStoreDownloadPhaseFailed";
              goto LABEL_52;
            }
            uint64_t v41 = 0;
            v42 = &v41;
            uint64_t v43 = 0x2020000000;
            v22 = (void *)getSSDownloadPhaseFinishedSymbolLoc_ptr;
            uint64_t v44 = getSSDownloadPhaseFinishedSymbolLoc_ptr;
            if (!getSSDownloadPhaseFinishedSymbolLoc_ptr)
            {
              uint64_t v37 = MEMORY[0x1E4F143A8];
              uint64_t v38 = 3221225472;
              v39 = __getSSDownloadPhaseFinishedSymbolLoc_block_invoke;
              v40 = &unk_1E57FA300;
              v23 = StoreServicesLibrary();
              v42[3] = (uint64_t)dlsym(v23, "SSDownloadPhaseFinished");
              getSSDownloadPhaseFinishedSymbolLoc_ptr = v42[3];
              v22 = (void *)v42[3];
            }
            _Block_object_dispose(&v41, 8);
            if (v22)
            {
              if ([v10 isEqualToString:*v22])
              {
                uint64_t v5 = @"MPStoreDownloadPhaseFinished";
                goto LABEL_52;
              }
              uint64_t v41 = 0;
              v42 = &v41;
              uint64_t v43 = 0x2020000000;
              v24 = (void *)getSSDownloadPhaseInstallingSymbolLoc_ptr;
              uint64_t v44 = getSSDownloadPhaseInstallingSymbolLoc_ptr;
              if (!getSSDownloadPhaseInstallingSymbolLoc_ptr)
              {
                uint64_t v37 = MEMORY[0x1E4F143A8];
                uint64_t v38 = 3221225472;
                v39 = __getSSDownloadPhaseInstallingSymbolLoc_block_invoke;
                v40 = &unk_1E57FA300;
                v25 = StoreServicesLibrary();
                v42[3] = (uint64_t)dlsym(v25, "SSDownloadPhaseInstalling");
                getSSDownloadPhaseInstallingSymbolLoc_ptr = v42[3];
                v24 = (void *)v42[3];
              }
              _Block_object_dispose(&v41, 8);
              if (v24)
              {
                if ([v10 isEqualToString:*v24])
                {
                  uint64_t v5 = @"MPStoreDownloadPhaseInstalling";
                }
                else
                {
                  v26 = getSSDownloadPhasePaused();
                  char v27 = [v10 isEqualToString:v26];

                  if (v27)
                  {
                    uint64_t v5 = @"MPStoreDownloadPhasePaused";
                  }
                  else
                  {
                    v28 = getSSDownloadPhasePreflight();
                    char v29 = [v10 isEqualToString:v28];

                    if (v29)
                    {
                      uint64_t v5 = @"MPStoreDownloadPhasePreflight";
                    }
                    else
                    {
                      v30 = getSSDownloadPhaseProcessing();
                      char v31 = [v10 isEqualToString:v30];

                      if (v31)
                      {
                        uint64_t v5 = @"MPStoreDownloadPhaseProcessing";
                      }
                      else
                      {
                        v32 = getSSDownloadPhaseWaiting();
                        int v33 = [v10 isEqualToString:v32];

                        if (!v33) {
                          uint64_t v5 = 0;
                        }
                      }
                    }
                  }
                }
                goto LABEL_52;
              }
              v35 = [MEMORY[0x1E4F28B00] currentHandler];
              v36 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhaseInstalling(void)"];
              objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"MPStoreDownload.m", 36, @"%s", dlerror(), v37, v38, v39, v40);
            }
            else
            {
              v35 = [MEMORY[0x1E4F28B00] currentHandler];
              v36 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhaseFinished(void)"];
              objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"MPStoreDownload.m", 35, @"%s", dlerror(), v37, v38, v39, v40);
            }
          }
          else
          {
            v35 = [MEMORY[0x1E4F28B00] currentHandler];
            v36 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhaseFailed(void)"];
            objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"MPStoreDownload.m", 34, @"%s", dlerror(), v37, v38, v39, v40);
          }
        }
        else
        {
          v35 = [MEMORY[0x1E4F28B00] currentHandler];
          v36 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhaseDownloading(void)"];
          objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"MPStoreDownload.m", 33, @"%s", dlerror(), v37, v38, v39, v40);
        }
      }
      else
      {
        v35 = [MEMORY[0x1E4F28B00] currentHandler];
        v36 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhaseDataRestore(void)"];
        objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"MPStoreDownload.m", 32, @"%s", dlerror(), v37, v38, v39, v40);
      }
    }
    else
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      v36 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhaseCanceled(void)"];
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"MPStoreDownload.m", 31, @"%s", dlerror(), v37, v38, v39, v40);
    }

    __break(1u);
    return result;
  }
  uint64_t v5 = v3;
LABEL_54:

  return (NSString *)v5;
}

- (double)percentComplete
{
  int v2 = [(MPStoreDownload *)self _SSDownload];
  [v2 percentComplete];
  double v4 = v3;

  return v4;
}

- (unint64_t)libraryItemIdentifier
{
  double v3 = getSSDownloadPropertyLibraryItemIdentifier();
  double v4 = [(MPStoreDownload *)self _valueForDownloadProperty:v3];
  unint64_t v5 = [v4 longLongValue];

  return v5;
}

- (BOOL)isPaused
{
  int v2 = [(MPStoreDownload *)self phaseIdentifier];
  char v3 = [v2 isEqualToString:@"MPStoreDownloadPhasePaused"];

  return v3;
}

- (BOOL)isRestore
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v3 = (void *)getSSDownloadPropertyIsRestoreSymbolLoc_ptr;
  uint64_t v13 = getSSDownloadPropertyIsRestoreSymbolLoc_ptr;
  if (!getSSDownloadPropertyIsRestoreSymbolLoc_ptr)
  {
    double v4 = StoreServicesLibrary();
    v11[3] = (uint64_t)dlsym(v4, "SSDownloadPropertyIsRestore");
    getSSDownloadPropertyIsRestoreSymbolLoc_ptr = v11[3];
    char v3 = (void *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v3)
  {
    unint64_t v5 = [(MPStoreDownload *)self _valueForDownloadProperty:*v3];
    char v6 = [v5 BOOLValue];

    return v6;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    char v9 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyIsRestore(void)"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"MPStoreDownload.m", 49, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)isPurchasing
{
  int v2 = [(MPStoreDownload *)self _SSPurchase];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isFinished
{
  if ([(MPStoreDownload *)self _isCanceled]) {
    return 1;
  }
  double v4 = [(MPStoreDownload *)self phaseIdentifier];
  if (([v4 isEqualToString:@"MPStoreDownloadPhaseFinished"] & 1) != 0
    || ([v4 isEqualToString:@"MPStoreDownloadPhaseCanceled"] & 1) != 0
    || ([v4 isEqualToString:@"MPStoreDownloadPhaseFailed"] & 1) != 0)
  {
    BOOL v3 = 1;
  }
  else
  {
    char v6 = [(MPStoreDownload *)self _SSPurchaseResponse];
    uint64_t v7 = [v6 error];

    BOOL v3 = v7 != 0;
  }

  return v3;
}

- (BOOL)isCanceled
{
  if ([(MPStoreDownload *)self _isCanceled]) {
    return 1;
  }
  double v4 = [(MPStoreDownload *)self phaseIdentifier];
  char v5 = [v4 isEqualToString:@"MPStoreDownloadPhaseCanceled"];

  return v5;
}

- (NSError)failureError
{
  if ([(MPStoreDownload *)self _isCanceled]) {
    goto LABEL_2;
  }
  double v4 = [(MPStoreDownload *)self _SSPurchaseResponse];
  uint64_t v5 = [v4 error];
  if (v5)
  {
    BOOL v3 = (void *)v5;
  }
  else
  {
    char v6 = [(MPStoreDownload *)self _SSDownload];
    BOOL v3 = [v6 failureError];

    if (!v3)
    {
      if ([(MPStoreDownload *)self isCanceled])
      {
LABEL_2:
        BOOL v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-999 userInfo:0];
        goto LABEL_8;
      }
      BOOL v3 = 0;
    }
  }
LABEL_8:

  return (NSError *)v3;
}

- (int64_t)downloadSizeLimit
{
  int v2 = [(MPStoreDownload *)self _SSDownload];
  int64_t v3 = [v2 downloadSizeLimit];

  return v3;
}

- (int64_t)downloadIdentifier
{
  int64_t v3 = [(MPStoreDownload *)self _SSDownload];
  int64_t v4 = [v3 persistentIdentifier];
  if (!v4)
  {
    uint64_t v5 = [(MPStoreDownload *)self _SSPurchase];
    int64_t v4 = [v5 placeholderDownloadIdentifier];
  }
  return v4;
}

- (int64_t)bytesTotal
{
  int v2 = [(MPStoreDownload *)self _SSDownload];
  int64_t v3 = [v2 bytesTotal];

  return v3;
}

- (int64_t)bytesDownloaded
{
  int v2 = [(MPStoreDownload *)self _SSDownload];
  int64_t v3 = [v2 bytesDownloaded];

  return v3;
}

- (id)description
{
  int64_t v3 = NSString;
  int64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  char v6 = [(MPStoreDownload *)self phaseIdentifier];
  uint64_t v7 = [(MPStoreDownload *)self failureError];
  BOOL v8 = [(MPStoreDownload *)self isCanceled];
  char v9 = @"NO";
  if (v8) {
    char v9 = @"YES";
  }
  uint64_t v10 = [v3 stringWithFormat:@"<%@ %p %@ error:%@ canceled:%@>", v5, self, v6, v7, v9];

  return v10;
}

- (MPStoreDownload)initWithType:(int64_t)a3 attributes:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPStoreDownload;
  uint64_t v7 = [(MPStoreDownload *)&v14 init];
  if (v7)
  {
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreDownload.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v8;

    v7->_type = a3;
    uint64_t v10 = [v6 copy];
    attributes = v7->_attributes;
    v7->_attributes = (NSDictionary *)v10;

    uint64_t v12 = [(id)objc_opt_class() _SSPurchaseForType:a3 attributes:v6];
    [(MPStoreDownload *)v7 _setSSPurchase:v12 SSPurchaseResponse:0];
  }
  return v7;
}

+ (id)_SSPurchaseForType:(int64_t)a3 attributes:(id)a4
{
  v141[1] = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v124 = [v4 objectForKey:@"MPStoreDownloadAttributeBuyParameters"];
  v117 = [v4 objectForKey:@"MPStoreDownloadAttributeOriginator"];
  if (v117)
  {
    [NSString stringWithFormat:@"&reporting=%@", v117];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([v5 length])
  {
    id v6 = v5;
    uint64_t v7 = [v124 stringByAppendingString:v5];

    v124 = (void *)v7;
    id v5 = v6;
  }
  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x2050000000;
  dispatch_queue_t v8 = (void *)getSSPurchaseClass_softClass;
  uint64_t v138 = getSSPurchaseClass_softClass;
  if (!getSSPurchaseClass_softClass)
  {
    uint64_t v130 = MEMORY[0x1E4F143A8];
    uint64_t v131 = 3221225472;
    v132 = __getSSPurchaseClass_block_invoke;
    v133 = &unk_1E57FA300;
    v134 = &v135;
    __getSSPurchaseClass_block_invoke((uint64_t)&v130);
    dispatch_queue_t v8 = (void *)v136[3];
  }
  v114 = v5;
  char v9 = v8;
  _Block_object_dispose(&v135, 8);
  id v10 = objc_alloc_init(v9);
  [v10 setBuyParameters:v124];
  [v10 setIgnoresForcedPasswordRestriction:a3 == 1];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  v123 = [v4 objectForKey:@"MPStoreDownloadAttributeTitle"];
  if (v123)
  {
    uint64_t v135 = 0;
    v136 = &v135;
    uint64_t v137 = 0x2020000000;
    uint64_t v12 = (id *)getSSDownloadPropertyTitleSymbolLoc_ptr;
    uint64_t v138 = getSSDownloadPropertyTitleSymbolLoc_ptr;
    if (!getSSDownloadPropertyTitleSymbolLoc_ptr)
    {
      uint64_t v130 = MEMORY[0x1E4F143A8];
      uint64_t v131 = 3221225472;
      v132 = __getSSDownloadPropertyTitleSymbolLoc_block_invoke;
      v133 = &unk_1E57FA300;
      v134 = &v135;
      uint64_t v13 = StoreServicesLibrary();
      objc_super v14 = dlsym(v13, "SSDownloadPropertyTitle");
      *(void *)(v134[1] + 24) = v14;
      getSSDownloadPropertyTitleSymbolLoc_ptr = *(void *)(v134[1] + 24);
      uint64_t v12 = (id *)v136[3];
    }
    _Block_object_dispose(&v135, 8);
    if (!v12)
    {
      v91 = [MEMORY[0x1E4F28B00] currentHandler];
      v92 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyTitle(void)"];
      objc_msgSend(v91, "handleFailureInFunction:file:lineNumber:description:", v92, @"MPStoreDownload.m", 50, @"%s", dlerror());

      goto LABEL_109;
    }
    id v15 = *v12;
    [v11 setObject:v123 forKey:v15];
  }
  v125 = [v4 objectForKey:@"MPStoreDownloadAttributeKind"];
  if (v125)
  {
    uint64_t v135 = 0;
    v136 = &v135;
    uint64_t v137 = 0x2020000000;
    v16 = (id *)getSSDownloadPropertyKindSymbolLoc_ptr;
    uint64_t v138 = getSSDownloadPropertyKindSymbolLoc_ptr;
    if (!getSSDownloadPropertyKindSymbolLoc_ptr)
    {
      uint64_t v130 = MEMORY[0x1E4F143A8];
      uint64_t v131 = 3221225472;
      v132 = __getSSDownloadPropertyKindSymbolLoc_block_invoke;
      v133 = &unk_1E57FA300;
      v134 = &v135;
      v17 = StoreServicesLibrary();
      v18 = dlsym(v17, "SSDownloadPropertyKind");
      *(void *)(v134[1] + 24) = v18;
      getSSDownloadPropertyKindSymbolLoc_ptr = *(void *)(v134[1] + 24);
      v16 = (id *)v136[3];
    }
    _Block_object_dispose(&v135, 8);
    if (!v16)
    {
      v93 = [MEMORY[0x1E4F28B00] currentHandler];
      v94 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyKind(void)"];
      objc_msgSend(v93, "handleFailureInFunction:file:lineNumber:description:", v94, @"MPStoreDownload.m", 29, @"%s", dlerror());

      goto LABEL_109;
    }
    id v19 = *v16;
    [v11 setObject:v125 forKey:v19];
  }
  v122 = [v4 objectForKey:@"MPStoreDownloadAttributeDownloadHandlerIdentifier"];
  if (v122)
  {
    uint64_t v135 = 0;
    v136 = &v135;
    uint64_t v137 = 0x2020000000;
    v20 = (id *)getSSDownloadPropertyHandlerIDSymbolLoc_ptr;
    uint64_t v138 = getSSDownloadPropertyHandlerIDSymbolLoc_ptr;
    if (!getSSDownloadPropertyHandlerIDSymbolLoc_ptr)
    {
      uint64_t v130 = MEMORY[0x1E4F143A8];
      uint64_t v131 = 3221225472;
      v132 = __getSSDownloadPropertyHandlerIDSymbolLoc_block_invoke;
      v133 = &unk_1E57FA300;
      v134 = &v135;
      v21 = StoreServicesLibrary();
      v22 = dlsym(v21, "SSDownloadPropertyHandlerID");
      *(void *)(v134[1] + 24) = v22;
      getSSDownloadPropertyHandlerIDSymbolLoc_ptr = *(void *)(v134[1] + 24);
      v20 = (id *)v136[3];
    }
    _Block_object_dispose(&v135, 8);
    if (!v20)
    {
      v95 = [MEMORY[0x1E4F28B00] currentHandler];
      v96 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyHandlerID(void)"];
      objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, @"MPStoreDownload.m", 51, @"%s", dlerror());

      goto LABEL_109;
    }
    id v23 = *v20;
    [v11 setObject:v122 forKey:v23];
  }
  v121 = [v4 objectForKey:@"MPStoreDownloadAttributeStoreItemIdentifier"];
  if (v121)
  {
    v24 = getSSDownloadPropertyStoreItemIdentifier();
    [v11 setObject:v121 forKey:v24];
  }
  v120 = [v4 objectForKey:@"MPStoreDownloadAttributeLibraryItemIdentifier"];
  if (v120)
  {
    v25 = getSSDownloadPropertyLibraryItemIdentifier();
    [v11 setObject:v120 forKey:v25];
  }
  v119 = [v4 objectForKey:@"MPStoreDownloadAttributeStoreSagaItemIdentifier"];
  if (v119)
  {
    uint64_t v135 = 0;
    v136 = &v135;
    uint64_t v137 = 0x2020000000;
    v26 = (id *)getSSDownloadPropertyStoreSagaIdentifierSymbolLoc_ptr;
    uint64_t v138 = getSSDownloadPropertyStoreSagaIdentifierSymbolLoc_ptr;
    if (!getSSDownloadPropertyStoreSagaIdentifierSymbolLoc_ptr)
    {
      uint64_t v130 = MEMORY[0x1E4F143A8];
      uint64_t v131 = 3221225472;
      v132 = __getSSDownloadPropertyStoreSagaIdentifierSymbolLoc_block_invoke;
      v133 = &unk_1E57FA300;
      v134 = &v135;
      char v27 = StoreServicesLibrary();
      v28 = dlsym(v27, "SSDownloadPropertyStoreSagaIdentifier");
      *(void *)(v134[1] + 24) = v28;
      getSSDownloadPropertyStoreSagaIdentifierSymbolLoc_ptr = *(void *)(v134[1] + 24);
      v26 = (id *)v136[3];
    }
    _Block_object_dispose(&v135, 8);
    if (!v26)
    {
      v97 = [MEMORY[0x1E4F28B00] currentHandler];
      v98 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyStoreSagaIdentifier(void)"];
      objc_msgSend(v97, "handleFailureInFunction:file:lineNumber:description:", v98, @"MPStoreDownload.m", 41, @"%s", dlerror());

      goto LABEL_109;
    }
    id v29 = *v26;
    [v11 setObject:v119 forKey:v29];
  }
  v118 = [v4 objectForKey:@"MPStoreDownloadAttributeClientBundleIdentifier"];
  if (v118)
  {
    uint64_t v135 = 0;
    v136 = &v135;
    uint64_t v137 = 0x2020000000;
    v30 = (id *)getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr;
    uint64_t v138 = getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr;
    if (!getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr)
    {
      uint64_t v130 = MEMORY[0x1E4F143A8];
      uint64_t v131 = 3221225472;
      v132 = __getSSDownloadPropertyClientBundleIdentifierSymbolLoc_block_invoke;
      v133 = &unk_1E57FA300;
      v134 = &v135;
      char v31 = StoreServicesLibrary();
      v32 = dlsym(v31, "SSDownloadPropertyClientBundleIdentifier");
      *(void *)(v134[1] + 24) = v32;
      getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr = *(void *)(v134[1] + 24);
      v30 = (id *)v136[3];
    }
    _Block_object_dispose(&v135, 8);
    if (!v30)
    {
      v99 = [MEMORY[0x1E4F28B00] currentHandler];
      v100 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyClientBundleIdentifier(void)"];
      objc_msgSend(v99, "handleFailureInFunction:file:lineNumber:description:", v100, @"MPStoreDownload.m", 43, @"%s", dlerror());

      goto LABEL_109;
    }
    id v33 = *v30;
    [v11 setObject:v118 forKey:v33];
  }
  if (v125)
  {
    id v116 = v125;
  }
  else
  {
    uint64_t v135 = 0;
    v136 = &v135;
    uint64_t v137 = 0x2020000000;
    v34 = (id *)getSSDownloadKindMusicSymbolLoc_ptr;
    uint64_t v138 = getSSDownloadKindMusicSymbolLoc_ptr;
    if (!getSSDownloadKindMusicSymbolLoc_ptr)
    {
      uint64_t v130 = MEMORY[0x1E4F143A8];
      uint64_t v131 = 3221225472;
      v132 = __getSSDownloadKindMusicSymbolLoc_block_invoke;
      v133 = &unk_1E57FA300;
      v134 = &v135;
      v35 = StoreServicesLibrary();
      v36 = dlsym(v35, "SSDownloadKindMusic");
      *(void *)(v134[1] + 24) = v36;
      getSSDownloadKindMusicSymbolLoc_ptr = *(void *)(v134[1] + 24);
      v34 = (id *)v136[3];
    }
    _Block_object_dispose(&v135, 8);
    if (!v34)
    {
      v105 = [MEMORY[0x1E4F28B00] currentHandler];
      v106 = [NSString stringWithUTF8String:"NSString *getSSDownloadKindMusic(void)"];
      objc_msgSend(v105, "handleFailureInFunction:file:lineNumber:description:", v106, @"MPStoreDownload.m", 42, @"%s", dlerror());

      goto LABEL_109;
    }
    id v116 = *v34;
  }
  uint64_t v37 = [v4 objectForKey:@"MPStoreDownloadAttributeShouldDisableCellularRestrictionEnforcement"];
  char v38 = [v37 BOOLValue];

  if (v38) {
    goto LABEL_68;
  }
  v113 = [v4 objectForKey:@"MPStoreDownloadAttributeShouldRespectStoreCellularDataRestriction"];
  if (!v113 || [v113 BOOLValue])
  {
    v39 = [v10 downloadPolicy];
    if (!v39) {
      v39 = (void *)[objc_alloc((Class)getSSDownloadPolicyClass()) initWithDownloadKind:v116 URLBagType:0];
    }
    id v40 = objc_alloc_init((Class)getSSDownloadPolicyRuleClass());
    [v40 setCellularDataStates:2];
    uint64_t v41 = [v39 policyRules];
    v42 = (void *)[v41 mutableCopy];

    if (v42)
    {
      uint64_t v43 = [v42 arrayByAddingObject:v40];
    }
    else
    {
      v141[0] = v40;
      uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v141 count:1];
    }
    [v39 setPolicyRules:v43];
    [v10 setDownloadPolicy:v39];
  }
  uint64_t v44 = [v4 objectForKey:@"MPStoreDownloadAttributeShouldRespectMusicCellularDataRestriction"];
  int v45 = [v44 BOOLValue];

  if (v45)
  {
    v112 = [v10 downloadPolicy];
    if (!v112) {
      v112 = (void *)[objc_alloc((Class)getSSDownloadPolicyClass()) initWithDownloadKind:v116 URLBagType:0];
    }
    id v111 = objc_alloc_init((Class)getSSDownloadPolicyRuleClass());
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [v46 addObject:&unk_1EE6ED4A8];
    [v46 addObject:&unk_1EE6ED4C0];
    [v46 addObject:&unk_1EE6ED4D8];
    [v46 addObject:&unk_1EE6ED4F0];
    [v46 addObject:&unk_1EE6ED508];
    [v46 addObject:&unk_1EE6ED520];
    [v46 addObject:&unk_1EE6ED538];
    [v46 addObject:&unk_1EE6ED550];
    [v111 setNetworkTypes:v46];
    uint64_t v135 = 0;
    v136 = &v135;
    uint64_t v137 = 0x2020000000;
    v47 = (void *)getSSDownloadSizeLimitNoLimitSymbolLoc_ptr;
    uint64_t v138 = getSSDownloadSizeLimitNoLimitSymbolLoc_ptr;
    if (!getSSDownloadSizeLimitNoLimitSymbolLoc_ptr)
    {
      uint64_t v130 = MEMORY[0x1E4F143A8];
      uint64_t v131 = 3221225472;
      v132 = __getSSDownloadSizeLimitNoLimitSymbolLoc_block_invoke;
      v133 = &unk_1E57FA300;
      v134 = &v135;
      v48 = StoreServicesLibrary();
      v49 = dlsym(v48, "SSDownloadSizeLimitNoLimit");
      *(void *)(v134[1] + 24) = v49;
      getSSDownloadSizeLimitNoLimitSymbolLoc_ptr = *(void *)(v134[1] + 24);
      v47 = (void *)v136[3];
    }
    _Block_object_dispose(&v135, 8);
    if (v47)
    {
      [v111 setDownloadSizeLimit:*v47];
      uint64_t v135 = 0;
      v136 = &v135;
      uint64_t v137 = 0x2050000000;
      v50 = (void *)getSSDownloadPolicyUserDefaultStateClass_softClass;
      uint64_t v138 = getSSDownloadPolicyUserDefaultStateClass_softClass;
      if (!getSSDownloadPolicyUserDefaultStateClass_softClass)
      {
        uint64_t v130 = MEMORY[0x1E4F143A8];
        uint64_t v131 = 3221225472;
        v132 = __getSSDownloadPolicyUserDefaultStateClass_block_invoke;
        v133 = &unk_1E57FA300;
        v134 = &v135;
        __getSSDownloadPolicyUserDefaultStateClass_block_invoke((uint64_t)&v130);
        v50 = (void *)v136[3];
      }
      v51 = v50;
      _Block_object_dispose(&v135, 8);
      id v52 = objc_alloc_init(v51);
      [v52 setDomain:@"com.apple.Music"];
      [v52 setKey:@"AllowsCellularDataDownloads"];
      [v52 setFallbackNumberValue:MEMORY[0x1E4F1CC28]];
      [v111 addUserDefaultState:v52];
      id v53 = objc_alloc_init((Class)getSSDownloadPolicyRuleClass());
      [v53 setNetworkTypes:v46];
      uint64_t v135 = 0;
      v136 = &v135;
      uint64_t v137 = 0x2020000000;
      v54 = (void *)getSSDownloadSizeLimitDisabledSymbolLoc_ptr;
      uint64_t v138 = getSSDownloadSizeLimitDisabledSymbolLoc_ptr;
      if (!getSSDownloadSizeLimitDisabledSymbolLoc_ptr)
      {
        uint64_t v130 = MEMORY[0x1E4F143A8];
        uint64_t v131 = 3221225472;
        v132 = __getSSDownloadSizeLimitDisabledSymbolLoc_block_invoke;
        v133 = &unk_1E57FA300;
        v134 = &v135;
        v55 = StoreServicesLibrary();
        v56 = dlsym(v55, "SSDownloadSizeLimitDisabled");
        *(void *)(v134[1] + 24) = v56;
        getSSDownloadSizeLimitDisabledSymbolLoc_ptr = *(void *)(v134[1] + 24);
        v54 = (void *)v136[3];
      }
      _Block_object_dispose(&v135, 8);
      if (v54)
      {
        [v53 setDownloadSizeLimit:*v54];
        v57 = (void *)[v52 copy];
        [v57 setShouldInvertBoolValue:1];
        [v53 addUserDefaultState:v57];
        v140[0] = v111;
        v140[1] = v53;
        v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:2];
        v59 = [v112 policyRules];
        v60 = v59;
        if (v59)
        {
          id v61 = [v59 arrayByAddingObjectsFromArray:v58];
        }
        else
        {
          id v61 = v58;
        }
        [v112 setPolicyRules:v61];
        [v10 setDownloadPolicy:v112];

        goto LABEL_67;
      }
      v109 = [MEMORY[0x1E4F28B00] currentHandler];
      v110 = [NSString stringWithUTF8String:"off_t getSSDownloadSizeLimitDisabled(void)"];
      objc_msgSend(v109, "handleFailureInFunction:file:lineNumber:description:", v110, @"MPStoreDownload.m", 53, @"%s", dlerror());
    }
    else
    {
      v107 = [MEMORY[0x1E4F28B00] currentHandler];
      v108 = [NSString stringWithUTF8String:"off_t getSSDownloadSizeLimitNoLimit(void)"];
      objc_msgSend(v107, "handleFailureInFunction:file:lineNumber:description:", v108, @"MPStoreDownload.m", 52, @"%s", dlerror());
    }
LABEL_109:
    __break(1u);
  }
LABEL_67:

LABEL_68:
  v62 = [v4 objectForKey:@"MPStoreDownloadAttributeBackgroundRequest"];
  int v63 = [v62 BOOLValue];

  if (!v63) {
    goto LABEL_76;
  }
  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x2020000000;
  v64 = (id *)getSSDownloadPropertyShouldCancelOnFailureSymbolLoc_ptr;
  uint64_t v138 = getSSDownloadPropertyShouldCancelOnFailureSymbolLoc_ptr;
  if (!getSSDownloadPropertyShouldCancelOnFailureSymbolLoc_ptr)
  {
    uint64_t v130 = MEMORY[0x1E4F143A8];
    uint64_t v131 = 3221225472;
    v132 = __getSSDownloadPropertyShouldCancelOnFailureSymbolLoc_block_invoke;
    v133 = &unk_1E57FA300;
    v134 = &v135;
    v65 = StoreServicesLibrary();
    v66 = dlsym(v65, "SSDownloadPropertyShouldCancelOnFailure");
    *(void *)(v134[1] + 24) = v66;
    getSSDownloadPropertyShouldCancelOnFailureSymbolLoc_ptr = *(void *)(v134[1] + 24);
    v64 = (id *)v136[3];
  }
  _Block_object_dispose(&v135, 8);
  if (!v64)
  {
    v101 = [MEMORY[0x1E4F28B00] currentHandler];
    v102 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyShouldCancelOnFailure(void)"];
    objc_msgSend(v101, "handleFailureInFunction:file:lineNumber:description:", v102, @"MPStoreDownload.m", 44, @"%s", dlerror());

    goto LABEL_109;
  }
  id v67 = *v64;
  [v11 setObject:MEMORY[0x1E4F1CC38] forKey:v67];

  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x2020000000;
  v68 = (id *)getSSDownloadPropertyShouldSuppressErrorDialogsSymbolLoc_ptr;
  uint64_t v138 = getSSDownloadPropertyShouldSuppressErrorDialogsSymbolLoc_ptr;
  if (!getSSDownloadPropertyShouldSuppressErrorDialogsSymbolLoc_ptr)
  {
    uint64_t v130 = MEMORY[0x1E4F143A8];
    uint64_t v131 = 3221225472;
    v132 = __getSSDownloadPropertyShouldSuppressErrorDialogsSymbolLoc_block_invoke;
    v133 = &unk_1E57FA300;
    v134 = &v135;
    v69 = StoreServicesLibrary();
    v70 = dlsym(v69, "SSDownloadPropertyShouldSuppressErrorDialogs");
    *(void *)(v134[1] + 24) = v70;
    getSSDownloadPropertyShouldSuppressErrorDialogsSymbolLoc_ptr = *(void *)(v134[1] + 24);
    v68 = (id *)v136[3];
  }
  _Block_object_dispose(&v135, 8);
  if (!v68)
  {
    v103 = [MEMORY[0x1E4F28B00] currentHandler];
    v104 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyShouldSuppressErrorDialogs(void)"];
    objc_msgSend(v103, "handleFailureInFunction:file:lineNumber:description:", v104, @"MPStoreDownload.m", 45, @"%s", dlerror());

    goto LABEL_109;
  }
  id v71 = *v68;
  [v11 setObject:MEMORY[0x1E4F1CC38] forKey:v71];

  [v10 setBackgroundPurchase:1];
LABEL_76:
  v72 = [v4 objectForKey:@"MPStoreDownloadAttributeDisplaysOnLockscreen"];
  int v73 = [v72 BOOLValue];

  if (v73) {
    [v10 setDisplaysOnLockScreen:1];
  }
  v74 = [v4 objectForKey:@"MPStoreDownloadAttributeReason"];
  if (v74)
  {
    v75 = getSSDownloadPropertyReason();
    [v11 setObject:v74 forKey:v75];
  }
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v76 = v11;
  uint64_t v77 = [v76 countByEnumeratingWithState:&v126 objects:v139 count:16];
  if (v77)
  {
    uint64_t v78 = *(void *)v127;
    do
    {
      for (uint64_t i = 0; i != v77; ++i)
      {
        if (*(void *)v127 != v78) {
          objc_enumerationMutation(v76);
        }
        uint64_t v80 = *(void *)(*((void *)&v126 + 1) + 8 * i);
        v81 = [v76 objectForKey:v80];
        [v10 setValue:v81 forDownloadProperty:v80];
      }
      uint64_t v77 = [v76 countByEnumeratingWithState:&v126 objects:v139 count:16];
    }
    while (v77);
  }

  v82 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (!v125
    || ([NSString stringWithFormat:@"%@-%@", @"MPStoreDownloadURLBagKeyOverride", v125], v83 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v82, "objectForKey:", v83), v84 = (__CFString *)objc_claimAutoreleasedReturnValue(), v83, !v84))
  {
    v84 = [v82 objectForKey:@"MPStoreDownloadURLBagKeyOverride"];
    if (!v84)
    {
      v84 = [v4 objectForKey:@"MPStoreDownloadAttributeURLBagKey"];
      if (!v84)
      {
        v85 = @"buyProduct";
        if (a3 != 2) {
          v85 = 0;
        }
        if (a3 == 1) {
          v84 = @"redownloadProduct";
        }
        else {
          v84 = v85;
        }
      }
    }
  }
  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x2050000000;
  v86 = (void *)getSSMutableURLRequestPropertiesClass_softClass;
  uint64_t v138 = getSSMutableURLRequestPropertiesClass_softClass;
  if (!getSSMutableURLRequestPropertiesClass_softClass)
  {
    uint64_t v130 = MEMORY[0x1E4F143A8];
    uint64_t v131 = 3221225472;
    v132 = __getSSMutableURLRequestPropertiesClass_block_invoke;
    v133 = &unk_1E57FA300;
    v134 = &v135;
    __getSSMutableURLRequestPropertiesClass_block_invoke((uint64_t)&v130);
    v86 = (void *)v136[3];
  }
  v87 = v86;
  _Block_object_dispose(&v135, 8);
  v88 = (void *)[[v87 alloc] initWithURLRequest:0];
  [v88 setURLBagKey:v84];
  [v10 setRequestProperties:v88];
  id v89 = v10;

  return v89;
}

+ (id)storeDownloadWithDownloadIdentifier:(int64_t)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:0 attributes:0];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v5 = (void *)getSSDownloadClass_softClass;
  uint64_t v13 = getSSDownloadClass_softClass;
  if (!getSSDownloadClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getSSDownloadClass_block_invoke;
    v9[3] = &unk_1E57FA300;
    v9[4] = &v10;
    __getSSDownloadClass_block_invoke((uint64_t)v9);
    id v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  uint64_t v7 = (void *)[[v6 alloc] initWithPersistentIdentifier:a3];
  [v4 _setSSDownload:v7];

  return v4;
}

+ (id)storeDownloadForMediaItem:(id)a3 type:(int64_t)a4 attributes:(id)a5
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  if (a3)
  {
    dispatch_queue_t v8 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v9 = a3;
    uint64_t v10 = objc_msgSend([v8 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
    int64_t v47 = a4;
    if (storeDownloadForMediaItem_type_attributes__sOnceToken != -1) {
      dispatch_once(&storeDownloadForMediaItem_type_attributes__sOnceToken, &__block_literal_global_55996);
    }
    id v11 = [v9 valuesForProperties:storeDownloadForMediaItem_type_attributes__sPropertiesToFetch];

    uint64_t v12 = [v11 objectForKey:@"storeSagaID"];
    uint64_t v13 = [v12 unsignedLongLongValue];

    objc_super v14 = [v11 objectForKey:@"storeItemAdamID"];
    uint64_t v15 = [v14 longLongValue];

    v16 = [v11 objectForKey:@"subscriptionStoreItemAdamID"];
    uint64_t v17 = [v16 longLongValue];

    v18 = [v11 objectForKey:@"storePlaybackEndpointType"];
    uint64_t v19 = [v18 integerValue];

    uint64_t v20 = 1;
    if (v13) {
      uint64_t v20 = 2;
    }
    if (v19) {
      uint64_t v20 = v19;
    }
    uint64_t v44 = v17;
    if (v20 == 3)
    {
      v22 = @"redownloadProduct";
      char v21 = 1;
    }
    else
    {
      char v21 = 0;
      if (v20 == 2) {
        v22 = @"paidRedownloadProduct";
      }
      else {
        v22 = @"redownloadProduct";
      }
    }
    id v23 = [v11 objectForKey:@"persistentID"];
    uint64_t v24 = [v23 longLongValue];

    if (v24)
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"%lli", v24);
      [v10 setObject:v25 forKey:@"MPStoreDownloadAttributeLibraryItemIdentifier"];
    }
    v26 = [v11 objectForKey:@"title"];
    if (v26) {
      [v10 setObject:v26 forKey:@"MPStoreDownloadAttributeTitle"];
    }
    char v27 = [v11 objectForKey:@"mediaType"];
    __int16 v28 = [v27 unsignedIntegerValue];

    id v29 = MPStoreDownloadSSDownloadKindFromMPMediaType(v28);
    [v10 setObject:v29 forKey:@"MPStoreDownloadAttributeKind"];
    if (v21)
    {
      if (!v15) {
        uint64_t v15 = v44;
      }
      if (v15)
      {
        int v45 = v29;
        v30 = [NSNumber numberWithLongLong:v15];
        [v10 setObject:v30 forKey:@"MPStoreDownloadAttributeStoreItemIdentifier"];

        id v31 = objc_alloc_init(MEMORY[0x1E4F29088]);
        v32 = (void *)MEMORY[0x1E4F290C8];
        id v33 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v15);
        v34 = [v32 queryItemWithName:@"salableAdamId" value:v33];
        v48[0] = v34;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
        [v31 setQueryItems:v35];

        v36 = [v31 query];
        if (v36) {
          [v10 setObject:v36 forKey:@"MPStoreDownloadAttributeBuyParameters"];
        }

        BOOL v37 = 1;
        v22 = @"subDownload";
        id v29 = v45;
      }
      else
      {
        BOOL v37 = 0;
        v22 = @"subDownload";
      }
    }
    else
    {
      id v46 = v7;
      char v38 = [v11 objectForKey:@"storeRedownloadParameters"];
      BOOL v37 = v38 != 0;
      if (v38) {
        [v10 setObject:v38 forKey:@"MPStoreDownloadAttributeBuyParameters"];
      }
      if (v13)
      {
        [NSNumber numberWithUnsignedLongLong:v13];
        id v40 = v39 = v29;
        [v10 setObject:v40 forKey:@"MPStoreDownloadAttributeStoreSagaItemIdentifier"];

        id v29 = v39;
      }
      if (v15)
      {
        [NSNumber numberWithLongLong:v15];
        v42 = uint64_t v41 = v29;
        [v10 setObject:v42 forKey:@"MPStoreDownloadAttributeStoreItemIdentifier"];

        id v29 = v41;
      }

      id v7 = v46;
    }
    [v10 setObject:v22 forKey:@"MPStoreDownloadAttributeURLBagKey"];
    if ([v7 count]) {
      [v10 addEntriesFromDictionary:v7];
    }
    if (v37) {
      a3 = (id)[objc_alloc((Class)objc_opt_class()) initWithType:v47 attributes:v10];
    }
    else {
      a3 = 0;
    }
  }

  return a3;
}

void __61__MPStoreDownload_storeDownloadForMediaItem_type_attributes___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeRedownloadParameters", @"persistentID", @"storeSagaID", @"title", @"storeItemAdamID", @"subscriptionStoreItemAdamID", @"mediaType", @"storePlaybackEndpointType", 0);
  uint64_t v1 = (void *)storeDownloadForMediaItem_type_attributes__sPropertiesToFetch;
  storeDownloadForMediaItem_type_attributes__sPropertiesToFetch = v0;
}

@end