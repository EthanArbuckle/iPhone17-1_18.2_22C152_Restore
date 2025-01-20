@interface DADownloadContext
- (DADownloadContext)initWithAttachmentUUID:(id)a3 accountID:(id)a4 queue:(id)a5 downloadProgressBlock:(id)a6 completionBlock:(id)a7;
- (NSString)accountID;
- (NSString)attachmentUUID;
- (OS_dispatch_queue)queue;
- (id)completionBlock;
- (id)progressBlock;
- (void)finishedWithError:(id)a3;
- (void)updateProgressDownloadedByteCount:(int64_t)a3 totalByteCount:(int64_t)a4;
@end

@implementation DADownloadContext

- (DADownloadContext)initWithAttachmentUUID:(id)a3 accountID:(id)a4 queue:(id)a5 downloadProgressBlock:(id)a6 completionBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13) {
    -[DADownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:]();
  }
  if (!v14) {
    -[DADownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:]();
  }
  v18 = v17;
  v26.receiver = self;
  v26.super_class = (Class)DADownloadContext;
  v19 = [(DADownloadContext *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_attachmentUUID, a3);
    objc_storeStrong((id *)&v20->_accountID, a4);
    objc_storeStrong((id *)&v20->_queue, a5);
    uint64_t v21 = [v16 copy];
    id progressBlock = v20->_progressBlock;
    v20->_id progressBlock = (id)v21;

    uint64_t v23 = [v18 copy];
    id completionBlock = v20->_completionBlock;
    v20->_id completionBlock = (id)v23;
  }
  return v20;
}

- (void)updateProgressDownloadedByteCount:(int64_t)a3 totalByteCount:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v7 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    attachmentUUID = self->_attachmentUUID;
    accountID = self->_accountID;
    *(_DWORD *)buf = 138413058;
    id v15 = attachmentUUID;
    __int16 v16 = 2114;
    id v17 = accountID;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    __int16 v20 = 2048;
    int64_t v21 = a4;
    _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_DEBUG, "Download of attachment UUID %@ for accountID %{public}@ progress: %lld bytes of %lld", buf, 0x2Au);
  }

  if (self->_progressBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v11 = queue;
    }
    else
    {
      v11 = dispatch_get_global_queue(0, 0);
    }
    v12 = v11;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__DADownloadContext_updateProgressDownloadedByteCount_totalByteCount___block_invoke;
    block[3] = &unk_1E62153F0;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(v11, block);
  }
}

uint64_t __70__DADownloadContext_updateProgressDownloadedByteCount_totalByteCount___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1[4] + 32) + 16))(*(void *)(a1[4] + 32), *(void *)(a1[4] + 8), *(void *)(a1[4] + 16), a1[5], a1[6]);
}

- (void)finishedWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    attachmentUUID = self->_attachmentUUID;
    accountID = self->_accountID;
    *(_DWORD *)buf = 138412546;
    id v14 = attachmentUUID;
    __int16 v15 = 2114;
    __int16 v16 = accountID;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Download of attachment UUID %@ for account %{public}@ completed.", buf, 0x16u);
  }

  if (self->_completionBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v9 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v9 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__DADownloadContext_finishedWithError___block_invoke;
    v11[3] = &unk_1E6215418;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v10, v11);
  }
}

uint64_t __39__DADownloadContext_finishedWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

- (NSString)attachmentUUID
{
  return self->_attachmentUUID;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_attachmentUUID, 0);
}

- (void)initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:.cold.1()
{
}

- (void)initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:.cold.2()
{
}

@end