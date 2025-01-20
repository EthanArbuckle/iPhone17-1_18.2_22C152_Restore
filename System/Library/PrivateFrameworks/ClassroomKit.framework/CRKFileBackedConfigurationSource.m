@interface CRKFileBackedConfigurationSource
- (BOOL)deleteConfigurationAtURL:(id)a3 inDirectory:(id)a4 error:(id *)a5;
- (BOOL)isReadErrorBenign:(id)a3;
- (CRKFileBackedConfigurationSource)init;
- (CRKFileBackedConfigurationSource)initWithFileURL:(id)a3;
- (CRKFileBackedConfigurationSource)initWithFileURL:(id)a3 callbackQueue:(id)a4;
- (CRKFileBackedConfigurationSourceDelegate)delegate;
- (id)directoryURL;
- (void)delegateDidDeleteConfigurationAtURL:(id)a3 inDirectory:(id)a4;
- (void)executeIntents:(id)a3 accessBlock:(id)a4;
- (void)fetchConfiguration:(id)a3;
- (void)invokeCompletionBlock:(id)a3 withConfiguration:(id)a4 error:(id)a5;
- (void)invokeCompletionBlock:(id)a3 withError:(id)a4;
- (void)setConfiguration:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CRKFileBackedConfigurationSource

- (CRKFileBackedConfigurationSource)init
{
  v3 = objc_msgSend(NSURL, "crk_uniqueTemporaryFileURL");
  v4 = [(CRKFileBackedConfigurationSource *)self initWithFileURL:v3];

  return v4;
}

- (CRKFileBackedConfigurationSource)initWithFileURL:(id)a3
{
  return [(CRKFileBackedConfigurationSource *)self initWithFileURL:a3 callbackQueue:MEMORY[0x263EF83A0]];
}

- (CRKFileBackedConfigurationSource)initWithFileURL:(id)a3 callbackQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKFileBackedConfigurationSource;
  v9 = [(CRKFileBackedConfigurationSource *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mFileURL, a3);
    objc_storeStrong((id *)&v10->mCallbackQueue, a4);
    uint64_t v11 = objc_opt_new();
    mFileOperationQueue = v10->mFileOperationQueue;
    v10->mFileOperationQueue = (NSOperationQueue *)v11;
  }
  return v10;
}

- (id)directoryURL
{
  return [(NSURL *)self->mFileURL URLByDeletingLastPathComponent];
}

- (void)executeIntents:(id)a3 accessBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_opt_new();
  [v8 coordinateAccessWithIntents:v7 queue:self->mFileOperationQueue byAccessor:v6];
}

- (void)invokeCompletionBlock:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mCallbackQueue = self->mCallbackQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__CRKFileBackedConfigurationSource_invokeCompletionBlock_withError___block_invoke;
  v11[3] = &unk_2646F3488;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(mCallbackQueue, v11);
}

uint64_t __68__CRKFileBackedConfigurationSource_invokeCompletionBlock_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)invokeCompletionBlock:(id)a3 withConfiguration:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  mCallbackQueue = self->mCallbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__CRKFileBackedConfigurationSource_invokeCompletionBlock_withConfiguration_error___block_invoke;
  block[3] = &unk_2646F3B00;
  id v17 = v10;
  id v18 = v8;
  id v16 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(mCallbackQueue, block);
}

uint64_t __82__CRKFileBackedConfigurationSource_invokeCompletionBlock_withConfiguration_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)delegateDidDeleteConfigurationAtURL:(id)a3 inDirectory:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CRKFileBackedConfigurationSource *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 fileBackedConfigurationSource:self didDeleteConfigurationAtURL:v8 inDirectory:v6];
  }
}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = 1;
  }
  id v9 = [MEMORY[0x263F08820] writingIntentWithURL:self->mFileURL options:v8];
  id v10 = (void *)MEMORY[0x263F08820];
  uint64_t v11 = [(CRKFileBackedConfigurationSource *)self directoryURL];
  id v12 = [v10 writingIntentWithURL:v11 options:v8];

  v23[0] = v9;
  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__CRKFileBackedConfigurationSource_setConfiguration_completion___block_invoke;
  v18[3] = &unk_2646F56A0;
  id v21 = v12;
  id v22 = v7;
  v18[4] = self;
  id v19 = v6;
  id v20 = v9;
  id v14 = v12;
  id v15 = v9;
  id v16 = v6;
  id v17 = v7;
  [(CRKFileBackedConfigurationSource *)self executeIntents:v13 accessBlock:v18];
}

void __64__CRKFileBackedConfigurationSource_setConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    goto LABEL_3;
  }
  if (!*(void *)(a1 + 40))
  {
    id v13 = *(void **)(a1 + 32);
    id v14 = [*(id *)(a1 + 48) URL];
    id v15 = [*(id *)(a1 + 56) URL];
    id v18 = 0;
    [v13 deleteConfigurationAtURL:v14 inDirectory:v15 error:&v18];
    id v4 = v18;

    goto LABEL_3;
  }
  v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [*(id *)(a1 + 56) URL];
  id v17 = 0;
  char v7 = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v17];
  id v4 = v17;

  if ((v7 & 1) == 0)
  {
LABEL_3:
    [*(id *)(a1 + 32) invokeCompletionBlock:*(void *)(a1 + 64) withError:v4];
    goto LABEL_4;
  }
  uint64_t v8 = *(void **)(a1 + 40);
  id v9 = [*(id *)(a1 + 48) URL];
  id v16 = v4;
  int v10 = [v8 writeToURL:v9 error:&v16];
  id v11 = v16;

  if (v10) {
    id v12 = 0;
  }
  else {
    id v12 = v11;
  }
  [*(id *)(a1 + 32) invokeCompletionBlock:*(void *)(a1 + 64) withError:v12];
  id v4 = v11;
LABEL_4:
}

- (BOOL)deleteConfigurationAtURL:(id)a3 inDirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [MEMORY[0x263F08850] defaultManager];
  id v17 = 0;
  int v11 = [v10 removeItemAtURL:v8 error:&v17];
  id v12 = v17;

  id v13 = [v12 domain];
  if ([v13 isEqualToString:*MEMORY[0x263F07F70]]) {
    BOOL v14 = [v12 code] == 4;
  }
  else {
    BOOL v14 = 0;
  }

  int v15 = v11 | v14;
  if (v15 == 1)
  {
    [(CRKFileBackedConfigurationSource *)self delegateDidDeleteConfigurationAtURL:v8 inDirectory:v9];
  }
  else if (a5)
  {
    *a5 = v12;
  }

  return v15;
}

- (void)fetchConfiguration:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08820] readingIntentWithURL:self->mFileURL options:3];
  id v6 = (void *)MEMORY[0x263F08820];
  char v7 = [(CRKFileBackedConfigurationSource *)self directoryURL];
  id v8 = [v6 readingIntentWithURL:v7 options:3];

  v15[0] = v5;
  v15[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__CRKFileBackedConfigurationSource_fetchConfiguration___block_invoke;
  v12[3] = &unk_2646F56C8;
  id v13 = v5;
  id v14 = v4;
  v12[4] = self;
  id v10 = v5;
  id v11 = v4;
  [(CRKFileBackedConfigurationSource *)self executeIntents:v9 accessBlock:v12];
}

void __55__CRKFileBackedConfigurationSource_fetchConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) invokeCompletionBlock:*(void *)(a1 + 48) withConfiguration:0 error:v3];
  }
  else
  {
    v5 = NSDictionary;
    id v6 = [*(id *)(a1 + 40) URL];
    id v12 = 0;
    char v7 = [v5 dictionaryWithContentsOfURL:v6 error:&v12];
    id v4 = v12;

    id v8 = *(void **)(a1 + 32);
    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = v7;
      id v11 = 0;
    }
    else
    {
      if ([v8 isReadErrorBenign:v4])
      {

        id v4 = 0;
      }
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = 0;
      id v11 = v4;
    }
    [v8 invokeCompletionBlock:v9 withConfiguration:v10 error:v11];
  }
}

- (BOOL)isReadErrorBenign:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F07F70]]) {
    BOOL v5 = [v3 code] == 260;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (CRKFileBackedConfigurationSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKFileBackedConfigurationSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mFileOperationQueue, 0);
  objc_storeStrong((id *)&self->mCallbackQueue, 0);

  objc_storeStrong((id *)&self->mFileURL, 0);
}

@end