@interface ESDownloadContext
- (ESDownloadContext)initWithAttachmentUUID:(id)a3 accountID:(id)a4 queue:(id)a5 downloadProgressBlock:(id)a6 completionBlock:(id)a7;
- (NSString)accountID;
- (NSString)attachmentUUID;
- (OS_dispatch_queue)queue;
- (id)completionBlock;
- (id)progressBlock;
- (void)finishedWithError:(id)a3;
- (void)updateProgressDownloadedByteCount:(int64_t)a3 totalByteCount:(int64_t)a4;
@end

@implementation ESDownloadContext

- (ESDownloadContext)initWithAttachmentUUID:(id)a3 accountID:(id)a4 queue:(id)a5 downloadProgressBlock:(id)a6 completionBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13) {
    -[ESDownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:]();
  }
  if (!v14) {
    -[ESDownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:]();
  }
  v18 = v17;
  v26.receiver = self;
  v26.super_class = (Class)ESDownloadContext;
  v19 = [(ESDownloadContext *)&v26 init];
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
  uint64_t v23 = *MEMORY[0x263EF8340];
  v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v7, v8))
  {
    attachmentUUID = self->_attachmentUUID;
    accountID = self->_accountID;
    *(_DWORD *)buf = 138413058;
    id v16 = attachmentUUID;
    __int16 v17 = 2112;
    v18 = accountID;
    __int16 v19 = 2048;
    int64_t v20 = a3;
    __int16 v21 = 2048;
    int64_t v22 = a4;
    _os_log_impl(&dword_232AD4000, v7, v8, "Download of attachment UUID %@ for accountID %@ progress: %lld bytes of %lld", buf, 0x2Au);
  }

  if (self->_progressBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v12 = queue;
    }
    else
    {
      v12 = dispatch_get_global_queue(0, 0);
    }
    id v13 = v12;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__ESDownloadContext_updateProgressDownloadedByteCount_totalByteCount___block_invoke;
    block[3] = &unk_264BC9520;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(v12, block);
  }
}

uint64_t __70__ESDownloadContext_updateProgressDownloadedByteCount_totalByteCount___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1[4] + 32) + 16))(*(void *)(a1[4] + 32), *(void *)(a1[4] + 8), *(void *)(a1[4] + 16), a1[5], a1[6]);
}

- (void)finishedWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    attachmentUUID = self->_attachmentUUID;
    accountID = self->_accountID;
    *(_DWORD *)buf = 138412546;
    id v15 = attachmentUUID;
    __int16 v16 = 2112;
    __int16 v17 = accountID;
    _os_log_impl(&dword_232AD4000, v5, v6, "Download of attachment UUID %@ for account %@ completed.", buf, 0x16u);
  }

  if (self->_completionBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v10 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v10 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __39__ESDownloadContext_finishedWithError___block_invoke;
    v12[3] = &unk_264BC9548;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v11, v12);
  }
}

uint64_t __39__ESDownloadContext_finishedWithError___block_invoke(uint64_t a1)
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