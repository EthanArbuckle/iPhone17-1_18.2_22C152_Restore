@interface BRSharePrepFolderForSharing
- (BRSharePrepFolderForSharing)initWithURL:(id)a3;
- (id)prepFolderSharingCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setPrepFolderSharingCompletionBlock:(id)a3;
@end

@implementation BRSharePrepFolderForSharing

- (BRSharePrepFolderForSharing)initWithURL:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRSharePrepFolderForSharing;
  return [(BRShareOperation *)&v4 initWithURL:a3];
}

- (void)main
{
  OUTLINED_FUNCTION_4_0();
  v1 = [v0 url];
  v2 = [v1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19ED3F000, v3, v4, "[DEBUG] prepping folder for sharing at '%@'%@", v5, v6, v7, v8, v9);
}

void __35__BRSharePrepFolderForSharing_main__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = NSNumber;
  BOOL v4 = a2 == 0;
  id v5 = a2;
  id v6 = [v3 numberWithInt:v4];
  [v2 completedWithResult:v6 error:v5];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(BRSharePrepFolderForSharing *)self prepFolderSharingCompletionBlock];
  uint8_t v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    [(BRSharePrepFolderForSharing *)self setPrepFolderSharingCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRSharePrepFolderForSharing;
  [(BROperation *)&v10 finishWithResult:v7 error:v6];
}

- (id)prepFolderSharingCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setPrepFolderSharingCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end