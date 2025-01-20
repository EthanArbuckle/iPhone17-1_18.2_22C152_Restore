@interface BRSharingCopyShareTokenOperation
- (BRSharingCopyShareTokenOperation)initWithItemID:(id)a3;
- (BRSharingCopyShareTokenOperation)initWithURL:(id)a3;
- (id)shareAndBaseTokenCompletionBlock;
- (id)shareTokenCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setShareAndBaseTokenCompletionBlock:(id)a3;
- (void)setShareTokenCompletionBlock:(id)a3;
@end

@implementation BRSharingCopyShareTokenOperation

- (BRSharingCopyShareTokenOperation)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRSharingCopyShareTokenOperation;
  v6 = [(BRShareOperation *)&v9 initWithURL:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fileURL, a3);
  }

  return v7;
}

- (BRSharingCopyShareTokenOperation)initWithItemID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BRSharingCopyShareTokenOperation;
  v3 = [(BRShareOperation *)&v7 initWithItemIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    fileURL = v3->_fileURL;
    v3->_fileURL = 0;
  }
  return v4;
}

- (void)main
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__BRSharingCopyShareTokenOperation_main__block_invoke;
  v7[3] = &unk_1E59AD8E8;
  v7[4] = self;
  v3 = (void *)MEMORY[0x19F3C48D0](v7, a2);
  if (BRIsFPFSEnabled(v3, v4))
  {
    if ([(BRShareOperation *)self shouldUseDirectConnection])
    {
      id v5 = [(BRShareOperation *)self directConnectionFPFSObject];
      v6 = [(BRShareOperation *)self itemID];
      [v5 startOperation:self toCopyParticipantTokenWithItemID:v6 reply:v3];
    }
    else
    {
      id v5 = [(BRShareOperation *)self remoteFPFSObject];
      [v5 startOperation:self toCopyParticipantTokenWithReply:v3];
    }
  }
  else
  {
    id v5 = [(BRShareOperation *)self remoteLegacyObject];
    [v5 startOperation:self toCopyParticipantTokenAtURL:self->_fileURL reply:v3];
  }
}

void __40__BRSharingCopyShareTokenOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = objc_opt_new();
  if (v10) {
    [v9 setObject:v10 forKeyedSubscript:@"shareToken"];
  }
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:@"baseToken"];
  }
  [*(id *)(a1 + 32) completedWithResult:v9 error:v8];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"shareToken"];
  objc_super v9 = [v6 objectForKeyedSubscript:@"baseToken"];
  uint64_t v10 = [(BRSharingCopyShareTokenOperation *)self shareTokenCompletionBlock];
  v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v8, v7);
    [(BRSharingCopyShareTokenOperation *)self setShareTokenCompletionBlock:0];
  }

  uint64_t v12 = [(BRSharingCopyShareTokenOperation *)self shareAndBaseTokenCompletionBlock];
  v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, void *, void *, id))(v12 + 16))(v12, v8, v9, v7);
    [(BRSharingCopyShareTokenOperation *)self setShareAndBaseTokenCompletionBlock:0];
  }

  v14.receiver = self;
  v14.super_class = (Class)BRSharingCopyShareTokenOperation;
  [(BROperation *)&v14 finishWithResult:v6 error:v7];
}

- (id)shareTokenCompletionBlock
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setShareTokenCompletionBlock:(id)a3
{
}

- (id)shareAndBaseTokenCompletionBlock
{
  return objc_getProperty(self, a2, 360, 1);
}

- (void)setShareAndBaseTokenCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareAndBaseTokenCompletionBlock, 0);
  objc_storeStrong(&self->_shareTokenCompletionBlock, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end