@interface BRShareCopyiWorkShareURLOperation
+ (id)iWorkShareableExtensions;
- (BRShareCopyiWorkShareURLOperation)initWithShare:(id)a3;
- (CKShare)share;
- (id)shareCopyURLCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setShare:(id)a3;
- (void)setShareCopyURLCompletionBlock:(id)a3;
@end

@implementation BRShareCopyiWorkShareURLOperation

+ (id)iWorkShareableExtensions
{
  return &unk_1EF133190;
}

- (BRShareCopyiWorkShareURLOperation)initWithShare:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)BRShareCopyiWorkShareURLOperation;
    v5 = [(BROperation *)&v11 init];
    v6 = v5;
    if (v5) {
      [(BRShareCopyiWorkShareURLOperation *)v5 setShare:v4];
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v8 = brc_bread_crumbs((uint64_t)"-[BRShareCopyiWorkShareURLOperation initWithShare:]", 842);
    v9 = brc_default_log(0);
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      -[BRShareCopyiWorkShareURLOperation initWithShare:]();
    }

    v7 = 0;
  }

  return v7;
}

- (void)main
{
  v3 = [(BROperation *)self remoteObject];
  id v4 = (void *)[(CKShare *)self->_share copy];
  br_setShareAssociatedURL(v4, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__BRShareCopyiWorkShareURLOperation_main__block_invoke;
  v5[3] = &unk_1E59AD820;
  v5[4] = self;
  [v3 startOperation:self toCopyShareURLForShare:v4 reply:v5];
}

uint64_t __41__BRShareCopyiWorkShareURLOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:");
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRShareCopyiWorkShareURLOperation *)self shareCopyURLCompletionBlock];
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(BRShareCopyiWorkShareURLOperation *)self setShareCopyURLCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareCopyiWorkShareURLOperation;
  [(BROperation *)&v10 finishWithResult:v6 error:v7];
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
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setShareCopyURLCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareCopyURLCompletionBlock, 0);

  objc_storeStrong((id *)&self->_share, 0);
}

- (void)initWithShare:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_0(&dword_19ED3F000, v0, v1, "[ERROR] require a CKShare to craft share URL%@", v2, v3, v4, v5, v6);
}

@end