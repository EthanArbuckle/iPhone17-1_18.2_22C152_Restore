@interface BRShareCopyShareURLOperation
- (BRShareCopyShareURLOperation)initWithFileURL:(id)a3 documentType:(id)a4;
- (BRShareCopyShareURLOperation)initWithItemID:(id)a3;
- (BRShareCopyShareURLOperation)initWithShare:(id)a3 documentType:(id)a4;
- (BRShareCopyShareURLOperation)initWithShare:(id)a3 fileURL:(id)a4 documentType:(id)a5;
- (BRShareCopyShareURLOperation)initWithShare:(id)a3 itemID:(id)a4;
- (CKShare)share;
- (id)copyShareURLCompletionBlock;
- (id)shareCopyURLCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setCopyShareURLCompletionBlock:(id)a3;
- (void)setShare:(id)a3;
- (void)setShareCopyURLCompletionBlock:(id)a3;
@end

@implementation BRShareCopyShareURLOperation

- (BRShareCopyShareURLOperation)initWithShare:(id)a3 fileURL:(id)a4 documentType:(id)a5
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRShareCopyShareURLOperation;
  v8 = [(BRShareOperation *)&v11 initWithURL:a4];
  v9 = v8;
  if (v8) {
    [(BRShareCopyShareURLOperation *)v8 setShare:v7];
  }

  return v9;
}

- (BRShareCopyShareURLOperation)initWithShare:(id)a3 documentType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    br_shareAssociatedURL(v6);
    v8 = (BRShareCopyShareURLOperation *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = [(BRShareCopyShareURLOperation *)self initWithShare:v6 fileURL:v8 documentType:v7];
    }
    else
    {
      v12 = brc_bread_crumbs((uint64_t)"-[BRShareCopyShareURLOperation initWithShare:documentType:]", 897);
      v13 = brc_default_log(0);
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
        -[BRShareCopyShareURLOperation initWithShare:documentType:]();
      }

      v9 = 0;
    }
    self = v8;
  }
  else
  {
    v10 = brc_bread_crumbs((uint64_t)"-[BRShareCopyShareURLOperation initWithShare:documentType:]", 891);
    objc_super v11 = brc_default_log(0);
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
      -[BRShareCopyiWorkShareURLOperation initWithShare:]();
    }

    v9 = 0;
  }

  return v9;
}

- (BRShareCopyShareURLOperation)initWithFileURL:(id)a3 documentType:(id)a4
{
  v15 = 0;
  id v6 = a4;
  id v7 = a3;
  BRSharingCreateShareForItemAtURL(v7, &v15);
  v8 = (CKShare *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  share = self->_share;
  self->_share = v8;

  error = self->_error;
  self->_error = (NSError *)v9;
  v12 = v9;

  v13 = [(BRShareCopyShareURLOperation *)self initWithShare:self->_share fileURL:v7 documentType:v6];
  return v13;
}

- (BRShareCopyShareURLOperation)initWithShare:(id)a3 itemID:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRShareCopyShareURLOperation;
  id v7 = [(BRShareOperation *)&v10 initWithItemIdentifier:a4];
  v8 = v7;
  if (v7) {
    [(BRShareCopyShareURLOperation *)v7 setShare:v6];
  }

  return v8;
}

- (BRShareCopyShareURLOperation)initWithItemID:(id)a3
{
  v12 = 0;
  id v4 = a3;
  BRSharingCreateShareForItemWithIdentifier(v4, &v12);
  v5 = (CKShare *)objc_claimAutoreleasedReturnValue();
  id v6 = v12;
  share = self->_share;
  self->_share = v5;

  error = self->_error;
  self->_error = (NSError *)v6;
  v9 = v6;

  objc_super v10 = [(BRShareCopyShareURLOperation *)self initWithShare:self->_share itemID:v4];
  return v10;
}

- (void)main
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: No share and no error%@", v2, v3, v4, v5, v6);
}

void __36__BRShareCopyShareURLOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v13)
  {
    [v9 setObject:v13 forKeyedSubscript:@"share"];
    objc_super v10 = [*(id *)(a1 + 32) url];
    br_setShareAssociatedURL(v13, v10);

    objc_super v11 = [v13 baseToken];
    [*(id *)(*(void *)(a1 + 32) + 344) setBaseToken:v11];

    v12 = [v13 publicSharingIdentity];
    [*(id *)(*(void *)(a1 + 32) + 344) setPublicSharingIdentity:v12];
  }
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:@"url"];
  }
  [*(id *)(a1 + 32) completedWithResult:v9 error:v8];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRShareCopyShareURLOperation *)self shareCopyURLCompletionBlock];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"share"];
    objc_super v10 = [v6 objectForKeyedSubscript:@"url"];
    ((void (**)(void, void *, void *, id))v8)[2](v8, v9, v10, v7);

    [(BRShareCopyShareURLOperation *)self setShareCopyURLCompletionBlock:0];
  }

  objc_super v11 = [(BRShareCopyShareURLOperation *)self copyShareURLCompletionBlock];
  if (v11)
  {
    v12 = [v6 objectForKeyedSubscript:@"url"];
    ((void (**)(void, void *, id))v11)[2](v11, v12, v7);

    [(BRShareCopyShareURLOperation *)self setCopyShareURLCompletionBlock:0];
  }

  v13.receiver = self;
  v13.super_class = (Class)BRShareCopyShareURLOperation;
  [(BROperation *)&v13 finishWithResult:v6 error:v7];
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (id)shareCopyURLCompletionBlock
{
  return objc_getProperty(self, a2, 368, 1);
}

- (void)setShareCopyURLCompletionBlock:(id)a3
{
}

- (id)copyShareURLCompletionBlock
{
  return objc_getProperty(self, a2, 376, 1);
}

- (void)setCopyShareURLCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_copyShareURLCompletionBlock, 0);
  objc_storeStrong(&self->_shareCopyURLCompletionBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_share, 0);
}

- (void)initWithShare:documentType:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_0(&dword_19ED3F000, v0, v1, "[ERROR] CKShare wasn't returned by BRShareCopyShareOperation%@", v2, v3, v4, v5, v6);
}

@end