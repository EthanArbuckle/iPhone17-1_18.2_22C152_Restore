@interface BRFileProvidingOperation
- (BOOL)wantsCurrentVersion;
- (BRFileProvidingOperation)initWithURL:(id)a3 readingOptions:(unint64_t)a4;
- (id)fileProvidingCompletion;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setFileProvidingCompletion:(id)a3;
- (void)setWantsCurrentVersion:(BOOL)a3;
@end

@implementation BRFileProvidingOperation

- (BRFileProvidingOperation)initWithURL:(id)a3 readingOptions:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRFileProvidingOperation;
  v8 = [(BROperation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    v9->_readingOptions = a4;
    [(BROperation *)v9 setWaitForRemoteToBeCancelled:1];
  }

  return v9;
}

- (void)main
{
  url = self->_url;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__BRFileProvidingOperation_main__block_invoke;
  v3[3] = &unk_1E59ADA10;
  v3[4] = self;
  BRPerformWithPersonaAndErrorForURLIfAble(url, v3);
}

void __32__BRFileProvidingOperation_main__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteLegacyObject];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __32__BRFileProvidingOperation_main__block_invoke_2;
  id v7 = &unk_1E59AD448;
  uint64_t v8 = v3;
  objc_msgSend(v2, "startOperation:toDownloadItemAtURL:readingOptions:wantsCurrentVersion:reply:");
}

uint64_t __32__BRFileProvidingOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(BRFileProvidingOperation *)self fileProvidingCompletion];
  ((void (**)(void, id))v8)[2](v8, v6);

  [(BRFileProvidingOperation *)self setFileProvidingCompletion:0];
  v9.receiver = self;
  v9.super_class = (Class)BRFileProvidingOperation;
  [(BROperation *)&v9 finishWithResult:v7 error:v6];
}

- (id)fileProvidingCompletion
{
  return self->_fileProvidingCompletion;
}

- (void)setFileProvidingCompletion:(id)a3
{
}

- (BOOL)wantsCurrentVersion
{
  return self->_wantsCurrentVersion;
}

- (void)setWantsCurrentVersion:(BOOL)a3
{
  self->_wantsCurrentVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fileProvidingCompletion, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end