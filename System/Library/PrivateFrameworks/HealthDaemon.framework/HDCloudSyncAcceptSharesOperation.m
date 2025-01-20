@interface HDCloudSyncAcceptSharesOperation
- (CKShareParticipant)ownerParticipant;
- (HDCloudSyncAcceptSharesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncAcceptSharesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 shareURLs:(id)a5 invitationTokensByShareURL:(id)a6;
- (NSArray)acceptedShares;
- (NSArray)shareURLs;
- (NSDictionary)invitationTokensByShareURLs;
- (void)main;
@end

@implementation HDCloudSyncAcceptSharesOperation

- (HDCloudSyncAcceptSharesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncAcceptSharesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 shareURLs:(id)a5 invitationTokensByShareURL:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HDCloudSyncAcceptSharesOperation;
  v12 = [(HDCloudSyncOperation *)&v19 initWithConfiguration:a3 cloudState:a4];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    shareURLs = v12->_shareURLs;
    v12->_shareURLs = (NSArray *)v13;

    uint64_t v15 = [v11 copy];
    invitationTokensByShareURLs = v12->_invitationTokensByShareURLs;
    v12->_invitationTokensByShareURLs = (NSDictionary *)v15;

    acceptedShares = v12->_acceptedShares;
    v12->_acceptedShares = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v12;
}

- (void)main
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_shareURLs count])
  {
    v3 = [(NSDictionary *)self->_invitationTokensByShareURLs allKeys];
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      shareURLs = self->_shareURLs;
      invitationTokensByShareURLs = self->_invitationTokensByShareURLs;
      *(_DWORD *)buf = 138543874;
      v25 = self;
      __int16 v26 = 2114;
      v27 = shareURLs;
      __int16 v28 = 2114;
      v29 = invitationTokensByShareURLs;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Accepting shares (%{public}@) with invitation tokens: %{public}@", buf, 0x20u);
    }
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A0C0]) initWithShareURLs:v3 invitationTokensByShareURL:self->_invitationTokensByShareURLs];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __40__HDCloudSyncAcceptSharesOperation_main__block_invoke;
    v22[3] = &unk_1E62FE7A0;
    v22[4] = self;
    id v9 = v8;
    id v23 = v9;
    [v7 setPerShareMetadataBlock:v22];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __40__HDCloudSyncAcceptSharesOperation_main__block_invoke_283;
    objc_super v19 = &unk_1E62F91D0;
    v20 = self;
    id v21 = v9;
    id v10 = v9;
    [v7 setFetchShareMetadataCompletionBlock:&v16];
    id v11 = [(HDCloudSyncOperation *)self configuration];
    v12 = [v11 operationGroup];
    [v7 setGroup:v12];

    uint64_t v13 = [(HDCloudSyncOperation *)self configuration];
    v14 = [v13 repository];
    uint64_t v15 = [v14 primaryCKContainer];
    [v15 addOperation:v7];
  }
  else
  {
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

void __40__HDCloudSyncAcceptSharesOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  _HKInitializeLogging();
  id v10 = *MEMORY[0x1E4F29FA8];
  id v11 = *MEMORY[0x1E4F29FA8];
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v14 = 138543874;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      id v17 = v7;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Share metadata: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    [*(id *)(a1 + 40) addObject:v8];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138543874;
    uint64_t v15 = v13;
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: Error retrieving share metadata: %{public}@", (uint8_t *)&v14, 0x20u);
  }
}

void __40__HDCloudSyncAcceptSharesOperation_main__block_invoke_283(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(a2, "hd_errorSurfacingFatalCloudKitPartialFailure");
  if (v3)
  {
    [*(id *)(a1 + 32) finishWithSuccess:0 error:v3];
  }
  else if ([*(id *)(a1 + 40) count])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1A3B0]);
    v5 = [*(id *)(a1 + 40) firstObject];
    uint64_t v6 = [v5 ownerIdentity];
    uint64_t v7 = [v4 _initWithUserIdentity:v6];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 128);
    *(void *)(v8 + 128) = v7;

    _HKInitializeLogging();
    id v10 = (os_log_t *)MEMORY[0x1E4F29FA8];
    id v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(v12 + 128);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Found owner participant: %@", buf, 0x16u);
    }
    _HKInitializeLogging();
    int v14 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning share acceptance with metadata: %{public}@", buf, 0x16u);
    }
    id v17 = *(void **)(a1 + 32);
    if (v17)
    {
      __int16 v18 = *(void **)(a1 + 40);
      id v19 = (objc_class *)MEMORY[0x1E4F19E10];
      id v20 = v18;
      id v21 = (void *)[[v19 alloc] initWithShareMetadatas:v20];

      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __67__HDCloudSyncAcceptSharesOperation__acceptSharesWithShareMetadata___block_invoke;
      v39 = &unk_1E62F91D0;
      v40 = v17;
      id v23 = v22;
      id v41 = v23;
      [v21 setAcceptSharesCompletionBlock:buf];
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __67__HDCloudSyncAcceptSharesOperation__acceptSharesWithShareMetadata___block_invoke_291;
      v35 = &unk_1E62FE7C8;
      v36 = v17;
      id v37 = v23;
      id v24 = v23;
      [v21 setPerShareCompletionBlock:&v32];
      v25 = objc_msgSend(v17, "configuration", v32, v33, v34, v35, v36);
      __int16 v26 = [v25 operationGroup];
      [v21 setGroup:v26];

      v27 = [v17 configuration];
      __int16 v28 = [v27 repository];
      v29 = [v28 primaryCKContainer];
      [v29 addOperation:v21];
    }
  }
  else
  {
    uint64_t v30 = *(void **)(a1 + 32);
    v31 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 710, @"Failed to retrieve any share metadata.");
    [v30 finishWithSuccess:0 error:v31];
  }
}

void __67__HDCloudSyncAcceptSharesOperation__acceptSharesWithShareMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FA8];
  v5 = *MEMORY[0x1E4F29FA8];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138543618;
      uint64_t v15 = v13;
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to accept shares: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = 0;
    id v8 = v3;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully accepted all shares", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v10 = [*(id *)(a1 + 40) copy];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 120);
    *(void *)(v11 + 120) = v10;

    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = 1;
    id v8 = 0;
  }
  [v6 finishWithSuccess:v7 error:v8];
}

void __67__HDCloudSyncAcceptSharesOperation__acceptSharesWithShareMetadata___block_invoke_291(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  _HKInitializeLogging();
  uint64_t v10 = *MEMORY[0x1E4F29FA8];
  uint64_t v11 = *MEMORY[0x1E4F29FA8];
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Accepted share: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 40) addObject:v8];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138543874;
    uint64_t v15 = v13;
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to accept share metadata with %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);
  }
}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (NSDictionary)invitationTokensByShareURLs
{
  return self->_invitationTokensByShareURLs;
}

- (NSArray)acceptedShares
{
  return self->_acceptedShares;
}

- (CKShareParticipant)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_acceptedShares, 0);
  objc_storeStrong((id *)&self->_invitationTokensByShareURLs, 0);

  objc_storeStrong((id *)&self->_shareURLs, 0);
}

@end