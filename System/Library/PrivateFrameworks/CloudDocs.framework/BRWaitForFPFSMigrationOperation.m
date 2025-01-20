@interface BRWaitForFPFSMigrationOperation
- (BRWaitForFPFSMigrationOperation)init;
- (id)fpfsMigrationCompletion;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setFpfsMigrationCompletion:(id)a3;
@end

@implementation BRWaitForFPFSMigrationOperation

- (BRWaitForFPFSMigrationOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)BRWaitForFPFSMigrationOperation;
  return [(BROperation *)&v3 init];
}

- (void)main
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] We are in Legacy, no need to wait for migration%@", (uint8_t *)&v2, 0xCu);
}

uint64_t __39__BRWaitForFPFSMigrationOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id fpfsMigrationCompletion = self->_fpfsMigrationCompletion;
  id v8 = a3;
  uint64_t v9 = MEMORY[0x19F3C48D0](fpfsMigrationCompletion);
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    id v11 = self->_fpfsMigrationCompletion;
    self->_id fpfsMigrationCompletion = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)BRWaitForFPFSMigrationOperation;
  [(BROperation *)&v12 finishWithResult:v8 error:v6];
}

- (id)fpfsMigrationCompletion
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setFpfsMigrationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end