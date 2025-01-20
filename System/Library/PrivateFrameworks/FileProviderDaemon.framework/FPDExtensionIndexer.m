@interface FPDExtensionIndexer
- (void)dropIndexForReason:(unint64_t)a3 completion:(id)a4;
- (void)indexOneBatchWithCompletionHandler:(id)a3;
@end

@implementation FPDExtensionIndexer

- (void)indexOneBatchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v9 = [(FPDDomainIndexer *)self domain];
  v5 = [v9 session];
  v6 = (void *)[v5 newFileProviderProxyWithTimeout:0 pid:180.0];
  v7 = [(FPDDomainIndexer *)self domain];
  v8 = [v7 identifier];
  [v6 indexOneBatchInDomain:v8 completionHandler:v4];
}

- (void)dropIndexForReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(FPDDomainIndexer *)self domain];
  v8 = [v7 session];
  id v9 = (void *)[v8 newFileProviderProxyWithTimeout:0 pid:180.0];

  v10 = [(FPDDomainIndexer *)self domain];
  v11 = [v10 identifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__FPDExtensionIndexer_dropIndexForReason_completion___block_invoke;
  v13[3] = &unk_1E6A76A58;
  id v14 = v6;
  unint64_t v15 = a3;
  v13[4] = self;
  id v12 = v6;
  [v9 dropIndexForDomain:v11 dropReason:a3 completionHandler:v13];
}

void __53__FPDExtensionIndexer_dropIndexForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__FPDExtensionIndexer_dropIndexForReason_completion___block_invoke_cold_1(v3, v4);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v9.receiver = *(id *)(a1 + 32);
    v9.super_class = (Class)FPDExtensionIndexer;
    objc_msgSendSuper2(&v9, sel_dropIndexForReason_completion_, v5, v6);
  }
  else
  {
    v7 = [*(id *)(a1 + 32) state];
    [v7 recordIndexDropReason:*(void *)(a1 + 48)];

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
}

void __53__FPDExtensionIndexer_dropIndexForReason_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a1, "fp_prettyDescription");
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed to drop index in extension, will try in fileproviderd, error %@", (uint8_t *)&v4, 0xCu);
}

@end