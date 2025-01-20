@interface BRSharingModifyRecordAccessOperation
- (BRSharingModifyRecordAccessOperation)initWithURL:(id)a3 allowAccess:(BOOL)a4;
- (id)accessAllowedCompletionBlock;
- (id)allowAccessCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setAccessAllowedCompletionBlock:(id)a3;
- (void)setAllowAccessCompletionBlock:(id)a3;
@end

@implementation BRSharingModifyRecordAccessOperation

- (BRSharingModifyRecordAccessOperation)initWithURL:(id)a3 allowAccess:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRSharingModifyRecordAccessOperation;
  v8 = [(BRShareOperation *)&v11 initWithURL:v7];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileURL, a3);
    v9->_allowAccess = a4;
  }

  return v9;
}

- (void)main
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__BRSharingModifyRecordAccessOperation_main__block_invoke;
  v6[3] = &unk_1E59AD8C0;
  v6[4] = self;
  v3 = (void *)MEMORY[0x19F3C48D0](v6, a2);
  if (BRIsFPFSEnabled(v3, v4))
  {
    v5 = [(BRShareOperation *)self remoteFPFSObject];
    [v5 startOperation:self toModifyRecordWithAllowAccess:self->_allowAccess reply:v3];
  }
  else
  {
    v5 = [(BRShareOperation *)self remoteLegacyObject];
    [v5 startOperation:self toModifyRecordAccessAtURL:self->_fileURL allowAccess:self->_allowAccess reply:v3];
  }
}

void __44__BRSharingModifyRecordAccessOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = objc_opt_new();
  if (v10) {
    [v9 setObject:v10 forKeyedSubscript:@"accessToken"];
  }
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:@"referenceIdentifier"];
  }
  [*(id *)(a1 + 32) completedWithResult:v9 error:v8];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRSharingModifyRecordAccessOperation *)self allowAccessCompletionBlock];
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v7);
    [(BRSharingModifyRecordAccessOperation *)self setAllowAccessCompletionBlock:0];
  }

  id v10 = [(BRSharingModifyRecordAccessOperation *)self accessAllowedCompletionBlock];
  if (v10)
  {
    objc_super v11 = [v6 objectForKeyedSubscript:@"accessToken"];
    v12 = [v6 objectForKeyedSubscript:@"referenceIdentifier"];
    ((void (**)(void, void *, void *, id))v10)[2](v10, v11, v12, v7);

    [(BRSharingModifyRecordAccessOperation *)self setAccessAllowedCompletionBlock:0];
  }

  v13.receiver = self;
  v13.super_class = (Class)BRSharingModifyRecordAccessOperation;
  [(BROperation *)&v13 finishWithResult:v6 error:v7];
}

- (id)allowAccessCompletionBlock
{
  return objc_getProperty(self, a2, 360, 1);
}

- (void)setAllowAccessCompletionBlock:(id)a3
{
}

- (id)accessAllowedCompletionBlock
{
  return objc_getProperty(self, a2, 368, 1);
}

- (void)setAccessAllowedCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accessAllowedCompletionBlock, 0);
  objc_storeStrong(&self->_allowAccessCompletionBlock, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end