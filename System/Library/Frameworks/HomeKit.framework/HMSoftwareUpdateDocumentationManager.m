@interface HMSoftwareUpdateDocumentationManager
+ (id)logCategory;
- (HMSoftwareUpdateDocumentationManager)initWithContext:(id)a3;
- (NSMutableDictionary)assetCompletionPairByDigestUUID;
- (OS_dispatch_queue)queue;
- (_HMContext)context;
- (id)assetForDocumentationMetadata:(id)a3;
- (id)assetForMetadataFromDisk:(id)a3;
- (void)addAssetAndCompletion:(id)a3 completion:(id)a4;
- (void)didUpdateDocumentationAssetState:(id)a3;
- (void)documentationForMetadata:(id)a3 completion:(id)a4;
- (void)removeAssetAndCompletion:(id)a3;
- (void)removeDocumentationMetadata:(id)a3;
- (void)setAssetCompletionPairByDigestUUID:(id)a3;
@end

@implementation HMSoftwareUpdateDocumentationManager

- (HMSoftwareUpdateDocumentationManager)initWithContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMSoftwareUpdateDocumentationManager;
  v6 = [(HMSoftwareUpdateDocumentationManager *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    assetCompletionPairByDigestUUID = v7->_assetCompletionPairByDigestUUID;
    v7->_assetCompletionPairByDigestUUID = (NSMutableDictionary *)v8;

    HMDispatchQueueNameString(v7, 0);
    id v10 = objc_claimAutoreleasedReturnValue();
    v11 = (const char *)[v10 UTF8String];
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCompletionPairByDigestUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setAssetCompletionPairByDigestUUID:(id)a3
{
}

- (NSMutableDictionary)assetCompletionPairByDigestUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)didUpdateDocumentationAssetState:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@In didUpdateDocumentationAssetState", buf, 0xCu);
  }
  if ([v4 stateNeedsNotification])
  {
    os_unfair_lock_lock_with_options();
    v9 = [(HMSoftwareUpdateDocumentationManager *)v6 assetCompletionPairByDigestUUID];
    id v10 = [v4 metadata];
    v11 = [v10 metadataDigestUUID];
    v12 = [v9 objectForKeyedSubscript:v11];
    dispatch_queue_t v13 = [v12 completions];

    if ([v13 count])
    {
      v14 = [MEMORY[0x1E4F1CA48] array];
      v15 = [(HMSoftwareUpdateDocumentationManager *)v6 assetCompletionPairByDigestUUID];
      objc_super v16 = [v4 metadata];
      v17 = [v16 metadataDigestUUID];
      v18 = [v15 objectForKeyedSubscript:v17];
      [v18 setCompletions:v14];
    }
    os_unfair_lock_unlock(&v6->_lock);
    if ([v13 count])
    {
      v19 = [(HMSoftwareUpdateDocumentationManager *)v6 context];
      v20 = [v19 delegateCaller];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __73__HMSoftwareUpdateDocumentationManager_didUpdateDocumentationAssetState___block_invoke;
      v21[3] = &unk_1E5945628;
      id v22 = v13;
      id v23 = v4;
      [v20 invokeBlock:v21];
    }
  }
}

void __73__HMSoftwareUpdateDocumentationManager_didUpdateDocumentationAssetState___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "documentation", (void)v11);
        if (v8)
        {
          (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
        }
        else
        {
          v9 = [*(id *)(a1 + 40) error];
          if (v9)
          {
            (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v9);
          }
          else
          {
            id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
            (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v10);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (id)assetForDocumentationMetadata:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(HMSoftwareUpdateDocumentationManager *)self assetCompletionPairByDigestUUID];
  uint64_t v7 = [v6 allValues];
  uint64_t v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_49097);

  os_unfair_lock_unlock(p_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "metadata", (void)v17);
        char v15 = [v14 isEqual:v4];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

uint64_t __70__HMSoftwareUpdateDocumentationManager_assetForDocumentationMetadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asset];
}

- (void)removeAssetAndCompletion:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(HMSoftwareUpdateDocumentationManager *)self assetCompletionPairByDigestUUID];
  v6 = [v8 metadata];
  uint64_t v7 = [v6 metadataDigestUUID];
  [v5 removeObjectForKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)addAssetAndCompletion:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 documentationIsCached];
  os_unfair_lock_lock_with_options();
  id v9 = [(HMSoftwareUpdateDocumentationManager *)self assetCompletionPairByDigestUUID];
  id v10 = [v6 metadata];
  uint64_t v11 = [v10 metadataDigestUUID];
  long long v12 = [v9 objectForKeyedSubscript:v11];
  id v13 = [v12 completions];

  if (!v13)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if ((v8 & 1) == 0)
  {
LABEL_5:
    long long v14 = _Block_copy(v7);
    [v13 addObject:v14];
  }
LABEL_6:
  char v15 = objc_alloc_init(HMSoftwareUpdateAssetCompletionsPair);
  [(HMSoftwareUpdateAssetCompletionsPair *)v15 setAsset:v6];
  [(HMSoftwareUpdateAssetCompletionsPair *)v15 setCompletions:v13];
  uint64_t v16 = [(HMSoftwareUpdateDocumentationManager *)self assetCompletionPairByDigestUUID];
  long long v17 = [v6 metadata];
  long long v18 = [v17 metadataDigestUUID];
  [v16 setObject:v15 forKeyedSubscript:v18];

  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    long long v19 = [v6 documentation];
    long long v20 = (void *)MEMORY[0x19F3A64A0]();
    v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      __int16 v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Calling completion with cached documentation: %@", buf, 0x16u);
    }
    v24 = [(HMSoftwareUpdateDocumentationManager *)v21 context];
    v25 = [v24 delegateCaller];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __73__HMSoftwareUpdateDocumentationManager_addAssetAndCompletion_completion___block_invoke;
    v27[3] = &unk_1E59454E8;
    id v28 = v19;
    id v29 = v7;
    id v26 = v19;
    [v25 invokeBlock:v27];
  }
  else
  {
    [v6 startCaching];
  }
}

uint64_t __73__HMSoftwareUpdateDocumentationManager_addAssetAndCompletion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)removeDocumentationMetadata:(id)a3
{
  id v4 = [(HMSoftwareUpdateDocumentationManager *)self assetForDocumentationMetadata:a3];
  [(HMSoftwareUpdateDocumentationManager *)self removeAssetAndCompletion:v4];
}

- (void)documentationForMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HMSoftwareUpdateDocumentationManager_documentationForMetadata_completion___block_invoke;
  block[3] = &unk_1E5945138;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __76__HMSoftwareUpdateDocumentationManager_documentationForMetadata_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) assetForDocumentationMetadata:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v2 = [*(id *)(a1 + 32) assetForMetadataFromDisk:*(void *)(a1 + 40)];
    if (!v2)
    {
      id v2 = [[HMSoftwareUpdateDocumentationAsset alloc] initWithDocumentationMetadata:*(void *)(a1 + 40)];
      uint64_t v3 = (void *)MEMORY[0x19F3A64A0]();
      id v4 = *(id *)(a1 + 32);
      uint64_t v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = HMFGetLogIdentifier();
        int v7 = 138543618;
        char v8 = v6;
        __int16 v9 = 2112;
        id v10 = v2;
        _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Created new documentation asset: %@", (uint8_t *)&v7, 0x16u);
      }
    }
    [(HMSoftwareUpdateDocumentationAsset *)v2 setDelegate:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) addAssetAndCompletion:v2 completion:*(void *)(a1 + 48)];
}

- (id)assetForMetadataFromDisk:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  v45 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v54 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing cached assets", buf, 0xCu);
  }
  int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v8 = off_1E593D000;
  __int16 v9 = +[HMSoftwareUpdateDocumentationAsset assetDirectoryURL];
  id v52 = 0;
  id v10 = [v7 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:0 options:0 error:&v52];
  id v11 = v52;

  v41 = v11;
  if (v10)
  {
    id v12 = [v46 metadataDigestUUID];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v40 = v10;
      uint64_t v15 = *(void *)v49;
      v42 = v12;
      do
      {
        uint64_t v16 = 0;
        uint64_t v44 = v14;
        do
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(obj);
          }
          long long v17 = *(void **)(*((void *)&v48 + 1) + 8 * v16);
          long long v18 = objc_msgSend(v17, "lastPathComponent", v40, v41);
          long long v19 = [v12 UUIDString];
          int v20 = [v18 isEqual:v19];

          if (v20)
          {
            v21 = [(__objc2_class *)v8[378] assetWithURL:v17];
            uint64_t v22 = v21;
            if (v21)
            {
              id v23 = [v21 metadata];
              v24 = [v23 URL];
              v25 = [v46 URL];
              char v26 = [v24 isEqual:v25];

              if (v26) {
                goto LABEL_19;
              }
              v27 = (void *)MEMORY[0x19F3A64A0]();
              id v28 = v45;
              id v29 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = HMFGetLogIdentifier();
                v31 = [v46 URL];
                __int16 v32 = [v22 metadata];
                [v32 URL];
                v43 = v27;
                uint64_t v34 = v33 = v8;
                *(_DWORD *)buf = 138543874;
                v54 = v30;
                __int16 v55 = 2112;
                id v56 = v31;
                __int16 v57 = 2112;
                v58 = v34;
                _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Remote URL in the metadata %@ and in the asset %@ did not match", buf, 0x20u);

                char v8 = v33;
                v27 = v43;

                id v12 = v42;
              }

              uint64_t v14 = v44;
            }
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
      }
      while (v14);
      uint64_t v22 = 0;
LABEL_19:
      id v10 = v40;
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    v35 = (void *)MEMORY[0x19F3A64A0]();
    v36 = v45;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v54 = v38;
      __int16 v55 = 2112;
      id v56 = v11;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to get cached assets with error: %@", buf, 0x16u);

      id v10 = 0;
    }

    uint64_t v22 = 0;
  }

  return v22;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_49115 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_49115, &__block_literal_global_23);
  }
  id v2 = (void *)logCategory__hmf_once_v9_49116;

  return v2;
}

uint64_t __51__HMSoftwareUpdateDocumentationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v9_49116;
  logCategory__hmf_once_v9_49116 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end