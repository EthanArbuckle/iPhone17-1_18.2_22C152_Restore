@interface MSASServerSideModelGroupedCommandQueue
+ (id)calloutBlockForCommand:(id)a3;
- (BOOL)hasEnqueuedItems;
- (MSASEnqueuedCommand)lastEnqueuedCommand;
- (void)MSASModel:(id)a3 didDeleteComment:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7;
- (void)MSASModel:(id)a3 didFindDeletedAccessControl:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindDeletedAlbum:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFindDeletedAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindDeletedInvitation:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFindNewAccessControl:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindNewAlbum:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFindNewAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindNewComment:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7;
- (void)MSASModel:(id)a3 didFindNewInvitation:(id)a4 info:(id)a5;
- (void)flushQueue;
- (void)setLastEnqueuedCommand:(id)a3;
- (void)workQueueEnqueueCommand:(id)a3 variantParam:(id)a4 invariantParam:(id)a5;
- (void)workQueueFlushQueue;
@end

@implementation MSASServerSideModelGroupedCommandQueue

- (void).cxx_destruct
{
}

- (void)setLastEnqueuedCommand:(id)a3
{
}

- (MSASEnqueuedCommand)lastEnqueuedCommand
{
  return self->_lastEnqueuedCommand;
}

- (void)MSASModel:(id)a3 didDeleteComment:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [(MSASGroupedQueue *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__MSASServerSideModelGroupedCommandQueue_MSASModel_didDeleteComment_forAssetCollection_inAlbum_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  v25 = self;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(v15, block);
}

void __101__MSASServerSideModelGroupedCommandQueue_MSASModel_didDeleteComment_forAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v9 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"comment"];
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"assetCollection"];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [v5 setObject:v7 forKey:@"album"];
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    [v5 setObject:v8 forKey:@"info"];
  }
  [*(id *)(a1 + 64) workQueueEnqueueCommand:@"deleteComment" variantParam:v9 invariantParam:v5];
}

- (void)MSASModel:(id)a3 didFindNewComment:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [(MSASGroupedQueue *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewComment_forAssetCollection_inAlbum_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  v25 = self;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(v15, block);
}

void __102__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewComment_forAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v9 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"comment"];
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"assetCollection"];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [v5 setObject:v7 forKey:@"album"];
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    [v5 setObject:v8 forKey:@"info"];
  }
  [*(id *)(a1 + 64) workQueueEnqueueCommand:@"newComment" variantParam:v9 invariantParam:v5];
}

- (void)MSASModel:(id)a3 didFindDeletedInvitation:(id)a4 info:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(MSASGroupedQueue *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedInvitation_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v13 = v7;
  id v14 = v8;
  v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __82__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedInvitation_info___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"sharingRelationship"];
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"info"];
  }
  [*(id *)(a1 + 48) workQueueEnqueueCommand:@"deleteInvitation" variantParam:v7 invariantParam:v5];
}

- (void)MSASModel:(id)a3 didFindNewInvitation:(id)a4 info:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(MSASGroupedQueue *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewInvitation_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v13 = v7;
  id v14 = v8;
  v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __78__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewInvitation_info___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"sharingRelationship"];
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"info"];
  }
  [*(id *)(a1 + 48) workQueueEnqueueCommand:@"newInvitation" variantParam:v7 invariantParam:v5];
}

- (void)MSASModel:(id)a3 didFindDeletedAccessControl:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASGroupedQueue *)self workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAccessControl_inAlbum_info___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __93__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAccessControl_inAlbum_info___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"sharingRelationship"];
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"album"];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [v5 setObject:v7 forKey:@"info"];
  }
  [*(id *)(a1 + 56) workQueueEnqueueCommand:@"deleteACL" variantParam:v8 invariantParam:v5];
}

- (void)MSASModel:(id)a3 didFindNewAccessControl:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASGroupedQueue *)self workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAccessControl_inAlbum_info___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __89__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAccessControl_inAlbum_info___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"sharingRelationship"];
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"album"];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [v5 setObject:v7 forKey:@"info"];
  }
  [*(id *)(a1 + 56) workQueueEnqueueCommand:@"newACL" variantParam:v8 invariantParam:v5];
}

- (void)MSASModel:(id)a3 didFindDeletedAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASGroupedQueue *)self workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAssetCollection_inAlbum_info___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __95__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"assetCollection"];
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"album"];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [v5 setObject:v7 forKey:@"info"];
  }
  [*(id *)(a1 + 56) workQueueEnqueueCommand:@"deleteAssetCollection" variantParam:v8 invariantParam:v5];
}

- (void)MSASModel:(id)a3 didFindNewAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASGroupedQueue *)self workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAssetCollection_inAlbum_info___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __91__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"assetCollection"];
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"album"];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [v5 setObject:v7 forKey:@"info"];
  }
  [*(id *)(a1 + 56) workQueueEnqueueCommand:@"newAssetCollection" variantParam:v8 invariantParam:v5];
}

- (void)MSASModel:(id)a3 didFindDeletedAlbum:(id)a4 info:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(MSASGroupedQueue *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAlbum_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v13 = v7;
  id v14 = v8;
  id v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __77__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindDeletedAlbum_info___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"album"];
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"info"];
  }
  [*(id *)(a1 + 48) workQueueEnqueueCommand:@"deleteAlbum" variantParam:v7 invariantParam:v5];
}

- (void)MSASModel:(id)a3 didFindNewAlbum:(id)a4 info:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(MSASGroupedQueue *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAlbum_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v13 = v7;
  id v14 = v8;
  id v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __73__MSASServerSideModelGroupedCommandQueue_MSASModel_didFindNewAlbum_info___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"album"];
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"info"];
  }
  [*(id *)(a1 + 48) workQueueEnqueueCommand:@"newAlbum" variantParam:v7 invariantParam:v5];
}

- (void)workQueueEnqueueCommand:(id)a3 variantParam:(id)a4 invariantParam:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MSASGroupedQueue *)self isShuttingDown])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v18 = 138543618;
      id v19 = self;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Not enqueueing command %{public}@ because we're shutting down.", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_16;
  }
  id v11 = [(MSASGroupedQueue *)self model];
  if (!v11) {
    __assert_rtn("-[MSASServerSideModelGroupedCommandQueue workQueueEnqueueCommand:variantParam:invariantParam:]", "MSASServerSideModelGroupedCommandQueue.m", 128, "self.model");
  }

  id v12 = [(MSASGroupedQueue *)self model];
  int v13 = [v12 commandCount];

  id v14 = +[MSASEnqueuedCommand commandwithCommand:v8 variantParam:v9 invariantParam:v10];
  lastEnqueuedCommand = self->_lastEnqueuedCommand;
  if (lastEnqueuedCommand
    && ![(MSASEnqueuedCommand *)lastEnqueuedCommand canBeGroupedWithCommand:v14])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      id v17 = [(MSASEnqueuedCommand *)self->_lastEnqueuedCommand command];
      int v18 = 138543874;
      id v19 = self;
      __int16 v20 = 2114;
      id v21 = v8;
      __int16 v22 = 2114;
      id v23 = v17;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: New command %{public}@ cannot be grouped with command %{public}@. Flushing.", (uint8_t *)&v18, 0x20u);
    }
    goto LABEL_12;
  }
  if (v13 >= [(MSASGroupedQueue *)self maxGroupedCallbackEventBatchCount])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v18 = 138543618;
      id v19 = self;
      __int16 v20 = 1024;
      LODWORD(v21) = v13;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: There are already %d commands in the queue. Flushing.", (uint8_t *)&v18, 0x12u);
    }
LABEL_12:
    [(MSASServerSideModelGroupedCommandQueue *)self workQueueFlushQueue];
    int v13 = 0;
  }
  id v16 = [(MSASGroupedQueue *)self model];
  [v16 enqueueCommand:v14];

  if (!v13) {
    [(MSASGroupedQueue *)self workQueueDidEnqueueFirstItem];
  }
  [(MSASGroupedQueue *)self workQueueDidEnqueueSubsequentItem];

LABEL_16:
}

- (void)workQueueFlushQueue
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (![(MSASGroupedQueue *)self isShuttingDown])
  {
    [(MSASServerSideModelGroupedCommandQueue *)self setLastEnqueuedCommand:0];
    uint64_t v3 = 0;
    id v4 = 0;
    uint64_t v18 = 0;
    v5 = MEMORY[0x1E4F14500];
    *(void *)&long long v6 = 138544130;
    long long v16 = v6;
    while (1)
    {
      id v7 = v4;
      id v8 = v3;
      id v9 = [(MSASGroupedQueue *)self model];
      uint64_t v10 = [(MSASGroupedQueue *)self maxGroupedCallbackEventBatchCount];
      id v17 = v4;
      uint64_t v3 = [v9 nextCommandGroupMaxCount:v10 outCommand:&v17 outLastCommandIndex:&v18];
      id v4 = v17;

      if (!v3) {
        break;
      }
      id v11 = +[MSASServerSideModelGroupedCommandQueue calloutBlockForCommand:v4];
      int v12 = ((uint64_t (**)(void, MSASServerSideModelGroupedCommandQueue *, void *))v11)[2](v11, self, v3);

      if (v12)
      {
        int v13 = [v3 objectAtIndex:0];
        id v14 = [v13 invariantParam];

        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v16;
          __int16 v20 = self;
          __int16 v21 = 1024;
          int v22 = v12;
          __int16 v23 = 2114;
          id v24 = v4;
          __int16 v25 = 2114;
          v26 = v14;
          _os_log_debug_impl(&dword_1DC434000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Flushing %d events with command %{public}@. Invariant:%{public}@", buf, 0x26u);
        }
      }
      id v15 = [(MSASGroupedQueue *)self model];
      [v15 removeCommandsUpToCommandIndex:v18];
    }
  }
}

- (void)flushQueue
{
  uint64_t v3 = [(MSASGroupedQueue *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MSASServerSideModelGroupedCommandQueue_flushQueue__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __52__MSASServerSideModelGroupedCommandQueue_flushQueue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueFlushQueue];
}

- (BOOL)hasEnqueuedItems
{
  v2 = [(MSASGroupedQueue *)self model];
  BOOL v3 = (int)[v2 commandCount] > 0;

  return v3;
}

+ (id)calloutBlockForCommand:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (calloutBlockForCommand__onceToken != -1) {
    dispatch_once(&calloutBlockForCommand__onceToken, &__block_literal_global_8156);
  }
  v5 = [(id)calloutBlockForCommand__commandToCalloutBlockMap objectForKey:v4];
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543618;
      id v9 = a1;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Cannot find callout block for command: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    v5 = &__block_literal_global_128;
  }
  long long v6 = (void *)MEMORY[0x1E019E5F0](v5);

  return v6;
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_126(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 count];
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)calloutBlockForCommand__commandToCalloutBlockMap;
  calloutBlockForCommand__commandToCalloutBlockMap = v0;

  [(id)calloutBlockForCommand__commandToCalloutBlockMap setObject:&__block_literal_global_85 forKey:@"newAlbum"];
  [(id)calloutBlockForCommand__commandToCalloutBlockMap setObject:&__block_literal_global_91 forKey:@"deleteAlbum"];
  [(id)calloutBlockForCommand__commandToCalloutBlockMap setObject:&__block_literal_global_95 forKey:@"newAssetCollection"];
  [(id)calloutBlockForCommand__commandToCalloutBlockMap setObject:&__block_literal_global_99 forKey:@"deleteAssetCollection"];
  [(id)calloutBlockForCommand__commandToCalloutBlockMap setObject:&__block_literal_global_103 forKey:@"newACL"];
  [(id)calloutBlockForCommand__commandToCalloutBlockMap setObject:&__block_literal_global_107_8160 forKey:@"deleteACL"];
  [(id)calloutBlockForCommand__commandToCalloutBlockMap setObject:&__block_literal_global_111 forKey:@"newInvitation"];
  [(id)calloutBlockForCommand__commandToCalloutBlockMap setObject:&__block_literal_global_115 forKey:@"deleteInvitation"];
  [(id)calloutBlockForCommand__commandToCalloutBlockMap setObject:&__block_literal_global_119 forKey:@"newComment"];
  v2 = (void *)calloutBlockForCommand__commandToCalloutBlockMap;
  return [v2 setObject:&__block_literal_global_123 forKey:@"deleteComment"];
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  __int16 v25 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v7)
  {
    uint64_t v11 = 0;
    id v26 = 0;
    id v10 = 0;
    id v9 = 0;
    int v22 = v6;
LABEL_20:

    goto LABEL_22;
  }
  uint64_t v8 = v7;
  id v24 = v4;
  id v9 = 0;
  id v10 = 0;
  id v26 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v34;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v34 != v12) {
        objc_enumerationMutation(v6);
      }
      id v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
      id v15 = objc_msgSend(v14, "variantParam", v24);
      long long v16 = [v15 objectForKey:@"comment"];

      if (v16)
      {
        if (v26)
        {
          if (v9) {
            goto LABEL_9;
          }
LABEL_14:
          uint64_t v18 = [v14 invariantParam];
          id v9 = [v18 objectForKey:@"album"];

          if (!v10) {
            goto LABEL_15;
          }
        }
        else
        {
          id v17 = [v14 invariantParam];
          id v26 = [v17 objectForKey:@"assetCollection"];

          if (!v9) {
            goto LABEL_14;
          }
LABEL_9:
          if (!v10)
          {
LABEL_15:
            id v19 = [v14 invariantParam];
            id v10 = [v19 objectForKey:@"info"];
          }
        }
        [v25 addObject:v16];
        uint64_t v11 = (v11 + 1);
      }

      ++v13;
    }
    while (v8 != v13);
    uint64_t v20 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    uint64_t v8 = v20;
  }
  while (v20);

  if (v11)
  {
    id v4 = v24;
    __int16 v21 = [v24 model];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_21;
    v27[3] = &unk_1E6C3D970;
    id v28 = v24;
    id v29 = v25;
    id v26 = v26;
    id v30 = v26;
    id v9 = v9;
    id v31 = v9;
    id v10 = v10;
    id v32 = v10;
    [v21 performBlockOnObservers:v27];

    int v22 = v28;
    goto LABEL_20;
  }
  id v4 = v24;
LABEL_22:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_21(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) model];
    [v4 MSASModel:v3 didFindDeletedComments:*(void *)(a1 + 40) forAssetCollection:*(void *)(a1 + 48) inAlbum:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  __int16 v25 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v7)
  {
    uint64_t v11 = 0;
    id v26 = 0;
    id v10 = 0;
    id v9 = 0;
    int v22 = v6;
LABEL_20:

    goto LABEL_22;
  }
  uint64_t v8 = v7;
  id v24 = v4;
  id v9 = 0;
  id v10 = 0;
  id v26 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v34;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v34 != v12) {
        objc_enumerationMutation(v6);
      }
      id v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
      id v15 = objc_msgSend(v14, "variantParam", v24);
      long long v16 = [v15 objectForKey:@"comment"];

      if (v16)
      {
        if (v26)
        {
          if (v9) {
            goto LABEL_9;
          }
LABEL_14:
          uint64_t v18 = [v14 invariantParam];
          id v9 = [v18 objectForKey:@"album"];

          if (!v10) {
            goto LABEL_15;
          }
        }
        else
        {
          id v17 = [v14 invariantParam];
          id v26 = [v17 objectForKey:@"assetCollection"];

          if (!v9) {
            goto LABEL_14;
          }
LABEL_9:
          if (!v10)
          {
LABEL_15:
            id v19 = [v14 invariantParam];
            id v10 = [v19 objectForKey:@"info"];
          }
        }
        [v25 addObject:v16];
        uint64_t v11 = (v11 + 1);
      }

      ++v13;
    }
    while (v8 != v13);
    uint64_t v20 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    uint64_t v8 = v20;
  }
  while (v20);

  if (v11)
  {
    id v4 = v24;
    __int16 v21 = [v24 model];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_19;
    v27[3] = &unk_1E6C3D970;
    id v28 = v24;
    id v29 = v25;
    id v26 = v26;
    id v30 = v26;
    id v9 = v9;
    id v31 = v9;
    id v10 = v10;
    id v32 = v10;
    [v21 performBlockOnObservers:v27];

    int v22 = v28;
    goto LABEL_20;
  }
  id v4 = v24;
LABEL_22:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_19(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) model];
    [v4 MSASModel:v3 didFindNewComments:*(void *)(a1 + 40) forAssetCollection:*(void *)(a1 + 48) inAlbum:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v7)
  {
    uint64_t v10 = 0;
    id v9 = 0;
    uint64_t v18 = v6;
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      id v14 = [v13 variantParam];
      id v15 = [v14 objectForKey:@"sharingRelationship"];

      if (v15)
      {
        if (!v9)
        {
          long long v16 = [v13 invariantParam];
          id v9 = [v16 objectForKey:@"info"];
        }
        [v20 addObject:v15];
        uint64_t v10 = (v10 + 1);
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v8);

  if (v10)
  {
    id v17 = [v4 model];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_17;
    v21[3] = &unk_1E6C3D908;
    id v22 = v4;
    id v23 = v20;
    id v9 = v9;
    id v24 = v9;
    [v17 performBlockOnObservers:v21];

    uint64_t v18 = v22;
LABEL_15:
  }
  return v10;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_17(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) model];
    [v4 MSASModel:v3 didFindDeletedInvitations:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v7)
  {
    uint64_t v10 = 0;
    id v9 = 0;
    uint64_t v18 = v6;
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      id v14 = [v13 variantParam];
      id v15 = [v14 objectForKey:@"sharingRelationship"];

      if (v15)
      {
        if (!v9)
        {
          long long v16 = [v13 invariantParam];
          id v9 = [v16 objectForKey:@"info"];
        }
        [v20 addObject:v15];
        uint64_t v10 = (v10 + 1);
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v8);

  if (v10)
  {
    id v17 = [v4 model];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_15;
    v21[3] = &unk_1E6C3D908;
    id v22 = v4;
    id v23 = v20;
    id v9 = v9;
    id v24 = v9;
    [v17 performBlockOnObservers:v21];

    uint64_t v18 = v22;
LABEL_15:
  }
  return v10;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_15(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) model];
    [v4 MSASModel:v3 didFindNewInvitations:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v24 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v7)
  {
    uint64_t v11 = 0;
    id v10 = 0;
    id v9 = 0;
    __int16 v21 = v6;
LABEL_18:

    goto LABEL_20;
  }
  uint64_t v8 = v7;
  id v23 = v4;
  id v9 = 0;
  id v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v31;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v6);
      }
      id v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
      id v15 = objc_msgSend(v14, "variantParam", v23);
      long long v16 = [v15 objectForKey:@"sharingRelationship"];

      if (v16)
      {
        if (v10)
        {
          if (v9)
          {
LABEL_9:
            [v24 addObject:v16];
            uint64_t v11 = (v11 + 1);
            goto LABEL_10;
          }
        }
        else
        {
          id v17 = [v14 invariantParam];
          id v10 = [v17 objectForKey:@"album"];

          if (v9) {
            goto LABEL_9;
          }
        }
        uint64_t v18 = [v14 invariantParam];
        id v9 = [v18 objectForKey:@"info"];

        goto LABEL_9;
      }
LABEL_10:

      ++v13;
    }
    while (v8 != v13);
    uint64_t v19 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    uint64_t v8 = v19;
  }
  while (v19);

  if (v11)
  {
    id v4 = v23;
    uint64_t v20 = [v23 model];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_13;
    v25[3] = &unk_1E6C3D938;
    id v26 = v23;
    id v27 = v24;
    id v10 = v10;
    id v28 = v10;
    id v9 = v9;
    id v29 = v9;
    [v20 performBlockOnObservers:v25];

    __int16 v21 = v26;
    goto LABEL_18;
  }
  id v4 = v23;
LABEL_20:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_13(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) model];
    [v4 MSASModel:v3 didFindDeletedAccessControls:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v24 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v7)
  {
    uint64_t v11 = 0;
    id v10 = 0;
    id v9 = 0;
    __int16 v21 = v6;
LABEL_18:

    goto LABEL_20;
  }
  uint64_t v8 = v7;
  id v23 = v4;
  id v9 = 0;
  id v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v31;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v6);
      }
      id v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
      id v15 = objc_msgSend(v14, "variantParam", v23);
      long long v16 = [v15 objectForKey:@"sharingRelationship"];

      if (v16)
      {
        if (v10)
        {
          if (v9)
          {
LABEL_9:
            [v24 addObject:v16];
            uint64_t v11 = (v11 + 1);
            goto LABEL_10;
          }
        }
        else
        {
          id v17 = [v14 invariantParam];
          id v10 = [v17 objectForKey:@"album"];

          if (v9) {
            goto LABEL_9;
          }
        }
        uint64_t v18 = [v14 invariantParam];
        id v9 = [v18 objectForKey:@"info"];

        goto LABEL_9;
      }
LABEL_10:

      ++v13;
    }
    while (v8 != v13);
    uint64_t v19 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    uint64_t v8 = v19;
  }
  while (v19);

  if (v11)
  {
    id v4 = v23;
    uint64_t v20 = [v23 model];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_11;
    v25[3] = &unk_1E6C3D938;
    id v26 = v23;
    id v27 = v24;
    id v10 = v10;
    id v28 = v10;
    id v9 = v9;
    id v29 = v9;
    [v20 performBlockOnObservers:v25];

    __int16 v21 = v26;
    goto LABEL_18;
  }
  id v4 = v23;
LABEL_20:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_11(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) model];
    [v4 MSASModel:v3 didFindNewAccessControls:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v24 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v7)
  {
    uint64_t v11 = 0;
    id v10 = 0;
    id v9 = 0;
    __int16 v21 = v6;
LABEL_18:

    goto LABEL_20;
  }
  uint64_t v8 = v7;
  id v23 = v4;
  id v9 = 0;
  id v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v31;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v6);
      }
      id v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
      id v15 = objc_msgSend(v14, "variantParam", v23);
      long long v16 = [v15 objectForKey:@"assetCollection"];

      if (v16)
      {
        if (v10)
        {
          if (v9)
          {
LABEL_9:
            [v24 addObject:v16];
            uint64_t v11 = (v11 + 1);
            goto LABEL_10;
          }
        }
        else
        {
          id v17 = [v14 invariantParam];
          id v10 = [v17 objectForKey:@"album"];

          if (v9) {
            goto LABEL_9;
          }
        }
        uint64_t v18 = [v14 invariantParam];
        id v9 = [v18 objectForKey:@"info"];

        goto LABEL_9;
      }
LABEL_10:

      ++v13;
    }
    while (v8 != v13);
    uint64_t v19 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    uint64_t v8 = v19;
  }
  while (v19);

  if (v11)
  {
    id v4 = v23;
    uint64_t v20 = [v23 model];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_9;
    v25[3] = &unk_1E6C3D938;
    id v26 = v23;
    id v27 = v24;
    id v10 = v10;
    id v28 = v10;
    id v9 = v9;
    id v29 = v9;
    [v20 performBlockOnObservers:v25];

    __int16 v21 = v26;
    goto LABEL_18;
  }
  id v4 = v23;
LABEL_20:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_9(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) model];
    [v4 MSASModel:v3 didFindDeletedAssetCollections:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v24 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v7)
  {
    uint64_t v11 = 0;
    id v10 = 0;
    id v9 = 0;
    __int16 v21 = v6;
LABEL_18:

    goto LABEL_20;
  }
  uint64_t v8 = v7;
  id v23 = v4;
  id v9 = 0;
  id v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v31;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v6);
      }
      id v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
      id v15 = objc_msgSend(v14, "variantParam", v23);
      long long v16 = [v15 objectForKey:@"assetCollection"];

      if (v16)
      {
        if (v10)
        {
          if (v9)
          {
LABEL_9:
            [v24 addObject:v16];
            uint64_t v11 = (v11 + 1);
            goto LABEL_10;
          }
        }
        else
        {
          id v17 = [v14 invariantParam];
          id v10 = [v17 objectForKey:@"album"];

          if (v9) {
            goto LABEL_9;
          }
        }
        uint64_t v18 = [v14 invariantParam];
        id v9 = [v18 objectForKey:@"info"];

        goto LABEL_9;
      }
LABEL_10:

      ++v13;
    }
    while (v8 != v13);
    uint64_t v19 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    uint64_t v8 = v19;
  }
  while (v19);

  if (v11)
  {
    id v4 = v23;
    uint64_t v20 = [v23 model];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_7;
    v25[3] = &unk_1E6C3D938;
    id v26 = v23;
    id v27 = v24;
    id v10 = v10;
    id v28 = v10;
    id v9 = v9;
    id v29 = v9;
    [v20 performBlockOnObservers:v25];

    __int16 v21 = v26;
    goto LABEL_18;
  }
  id v4 = v23;
LABEL_20:

  return v11;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_7(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) model];
    [v4 MSASModel:v3 didFindNewAssetCollections:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v7)
  {
    uint64_t v10 = 0;
    id v9 = 0;
    uint64_t v18 = v6;
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      id v14 = [v13 variantParam];
      id v15 = [v14 objectForKey:@"album"];

      if (v15)
      {
        if (!v9)
        {
          long long v16 = [v13 invariantParam];
          id v9 = [v16 objectForKey:@"info"];
        }
        [v20 addObject:v15];
        uint64_t v10 = (v10 + 1);
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v8);

  if (v10)
  {
    id v17 = [v4 model];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_5;
    v21[3] = &unk_1E6C3D908;
    id v22 = v4;
    id v23 = v20;
    id v9 = v9;
    id v24 = v9;
    [v17 performBlockOnObservers:v21];

    uint64_t v18 = v22;
LABEL_15:
  }
  return v10;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) model];
    [v4 MSASModel:v3 didFindDeletedAlbums:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
  }
}

uint64_t __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v7)
  {
    uint64_t v10 = 0;
    id v9 = 0;
    uint64_t v18 = v6;
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      id v14 = [v13 variantParam];
      id v15 = [v14 objectForKey:@"album"];

      if (v15)
      {
        if (!v9)
        {
          long long v16 = [v13 invariantParam];
          id v9 = [v16 objectForKey:@"info"];
        }
        [v20 addObject:v15];
        uint64_t v10 = (v10 + 1);
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v8);

  if (v10)
  {
    id v17 = [v4 model];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_3;
    v21[3] = &unk_1E6C3D908;
    id v22 = v4;
    id v23 = v20;
    id v9 = v9;
    id v24 = v9;
    [v17 performBlockOnObservers:v21];

    uint64_t v18 = v22;
LABEL_15:
  }
  return v10;
}

void __65__MSASServerSideModelGroupedCommandQueue_calloutBlockForCommand___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) model];
    [v4 MSASModel:v3 didFindNewAlbums:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
  }
}

@end