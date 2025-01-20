@interface BRCAcceptShareOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCAcceptShareOperation)initWithShareMetadata:(id)a3 syncContext:(id)a4 sessionContext:(id)a5;
- (id)acceptShareCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setAcceptShareCompletionBlock:(id)a3;
@end

@implementation BRCAcceptShareOperation

- (BRCAcceptShareOperation)initWithShareMetadata:(id)a3 syncContext:(id)a4 sessionContext:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCAcceptShareOperation;
  v10 = [(_BRCOperation *)&v13 initWithName:@"share/accept" syncContext:a4 sessionContext:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_shareMetadata, a3);
  }

  return v11;
}

- (void)main
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F19E10]);
  v10[0] = self->_shareMetadata;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v5 = (void *)[v3 initWithShareMetadatas:v4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__8;
  v8[4] = __Block_byref_object_dispose__8;
  id v9 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__BRCAcceptShareOperation_main__block_invoke;
  v7[3] = &unk_1E6995330;
  v7[4] = v8;
  [v5 setPerShareCompletionBlock:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__BRCAcceptShareOperation_main__block_invoke_2;
  v6[3] = &unk_1E6995358;
  v6[4] = self;
  v6[5] = v8;
  [v5 setAcceptSharesCompletionBlock:v6];
  [(_BRCOperation *)self addSubOperation:v5];
  _Block_object_dispose(v8, 8);
}

void __31__BRCAcceptShareOperation_main__block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __31__BRCAcceptShareOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:a2];
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BRCAcceptShareOperation *)self acceptShareCompletionBlock];

  if (v8)
  {
    id v9 = [(BRCAcceptShareOperation *)self acceptShareCompletionBlock];
    ((void (**)(void, id, id))v9)[2](v9, v6, v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)BRCAcceptShareOperation;
  [(_BRCOperation *)&v10 finishWithResult:v6 error:v7];
}

- (id)acceptShareCompletionBlock
{
  return self->_acceptShareCompletionBlock;
}

- (void)setAcceptShareCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_acceptShareCompletionBlock, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
}

@end