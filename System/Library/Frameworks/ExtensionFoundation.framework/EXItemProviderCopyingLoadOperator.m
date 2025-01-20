@interface EXItemProviderCopyingLoadOperator
@end

@implementation EXItemProviderCopyingLoadOperator

void __91___EXItemProviderCopyingLoadOperator__loadItemsForTypeIdentifiers_auditToken_itemProvider___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v17 = *MEMORY[0x1E4F284B8];
  v18[0] = *MEMORY[0x1E4F284B0];
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91___EXItemProviderCopyingLoadOperator__loadItemsForTypeIdentifiers_auditToken_itemProvider___block_invoke_2;
  v11[3] = &unk_1E573D978;
  long long v6 = *(_OWORD *)(a1 + 72);
  long long v15 = *(_OWORD *)(a1 + 56);
  long long v16 = v6;
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  v11[4] = *(void *)(a1 + 40);
  id v12 = v3;
  dispatch_semaphore_t v13 = v4;
  uint64_t v14 = v8;
  v9 = v4;
  id v10 = v3;
  [v7 loadItemForTypeIdentifier:v10 options:v5 completionHandler:v11];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

void __91___EXItemProviderCopyingLoadOperator__loadItemsForTypeIdentifiers_auditToken_itemProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v15 = 0;
    long long v9 = *(_OWORD *)(a1 + 80);
    v14[0] = *(_OWORD *)(a1 + 64);
    v14[1] = v9;
    id v10 = [v8 _sandboxedResourceForItemIfNeeded:v5 auditToken:v14 error:&v15];
    id v11 = v15;
    v7 = v11;
    if (v10 && !v11)
    {
      id v12 = v10;

      id v5 = v12;
    }
  }
  if (v7)
  {
    v18 = @"error";
    v19[0] = v7;
    dispatch_semaphore_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    if (v13) {
      goto LABEL_13;
    }
  }
  else
  {
    dispatch_semaphore_t v13 = 0;
  }
  if (v5)
  {
    long long v16 = @"item";
    id v17 = v5;
    dispatch_semaphore_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  }
LABEL_13:
  if (v13) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v13 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end