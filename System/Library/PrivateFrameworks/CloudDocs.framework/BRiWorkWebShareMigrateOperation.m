@interface BRiWorkWebShareMigrateOperation
- (BRiWorkWebShareMigrateOperation)initWithURL:(id)a3;
- (NSOperationQueue)operationQueue;
- (NSURL)url;
- (id)shareMigrationCompletionBlock;
- (void)_copyShare;
- (void)_migrateShare;
- (void)_startSharingReadWrite:(BOOL)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setOperationQueue:(id)a3;
- (void)setShareMigrationCompletionBlock:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation BRiWorkWebShareMigrateOperation

- (BRiWorkWebShareMigrateOperation)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRiWorkWebShareMigrateOperation;
  v5 = [(BROperation *)&v8 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(BRiWorkWebShareMigrateOperation *)v5 setOperationQueue:v6];

    [(BRiWorkWebShareMigrateOperation *)v5 setUrl:v4];
  }

  return v5;
}

- (void)_migrateShare
{
  __int16 v10 = 0;
  url = self->_url;
  id v9 = 0;
  BOOL BadgingSharingState = BRiWorkSharingGetBadgingSharingState(url, (unsigned char *)&v10 + 1, (BOOL *)&v10, &v9);
  id v5 = v9;
  id v6 = v5;
  if (HIBYTE(v10)) {
    BOOL v7 = !BadgingSharingState;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && v5 == 0) {
    [(BRiWorkWebShareMigrateOperation *)self _startSharingReadWrite:(_BYTE)v10 == 0];
  }
  [(BROperation *)self completedWithResult:0 error:v6];
}

- (void)_startSharingReadWrite:(BOOL)a3
{
  BOOL v3 = a3;
  url = self->_url;
  v17 = 0;
  id v6 = BRSharingCreateShareForItemAtURL(url, &v17);
  BOOL v7 = v17;
  objc_super v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9) {
    [(BROperation *)self completedWithResult:0 error:v7];
  }
  if (v3) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 2;
  }
  [v6 setPublicPermission:v10];
  v11 = [BRShareSaveOperation alloc];
  v12 = [(BRiWorkWebShareMigrateOperation *)self url];
  v13 = [(BRShareSaveOperation *)v11 initWithShare:v6 fileURL:v12];

  v14 = [(BROperation *)v13 callbackQueue];
  v15 = [(BROperation *)self callbackQueue];
  dispatch_set_target_queue(v14, v15);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__BRiWorkWebShareMigrateOperation__startSharingReadWrite___block_invoke;
  v16[3] = &unk_1E59AD7F8;
  v16[4] = self;
  [(BRShareSaveOperation *)v13 setShareSaveCompletionBlock:v16];
  [(BROperation *)v13 setNonDiscretionary:[(BROperation *)self nonDiscretionary]];
  [(NSOperationQueue *)self->_operationQueue addOperation:v13];
}

uint64_t __58__BRiWorkWebShareMigrateOperation__startSharingReadWrite___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResult:a2 error:a3];
}

- (void)_copyShare
{
  BOOL v3 = [[BRShareCopyOperation alloc] initWithURL:self->_url];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__BRiWorkWebShareMigrateOperation__copyShare__block_invoke;
  v4[3] = &unk_1E59AD820;
  v4[4] = self;
  [(BRShareCopyOperation *)v3 setRootShareCopyCompletionBlock:v4];
  [(BROperation *)v3 setNonDiscretionary:[(BROperation *)self nonDiscretionary]];
  [(NSOperationQueue *)self->_operationQueue addOperation:v3];
}

uint64_t __45__BRiWorkWebShareMigrateOperation__copyShare__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", a2);
}

- (void)main
{
  OUTLINED_FUNCTION_4_0();
  v1 = [v0 url];
  v2 = [v1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19ED3F000, v3, v4, "[DEBUG] migrating share for '%@'%@", v5, v6, v7, v8, v9);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRiWorkWebShareMigrateOperation *)self shareMigrationCompletionBlock];
  uint8_t v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(BRiWorkWebShareMigrateOperation *)self setShareMigrationCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRiWorkWebShareMigrateOperation;
  [(BROperation *)&v10 finishWithResult:v6 error:v7];
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (id)shareMigrationCompletionBlock
{
  return objc_getProperty(self, a2, 312, 1);
}

- (void)setShareMigrationCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareMigrationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end