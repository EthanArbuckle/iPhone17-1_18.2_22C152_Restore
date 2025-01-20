@interface NSItemProvider
@end

@implementation NSItemProvider

void __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) imageFileLoader];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_2;
  v8[3] = &unk_1E5847230;
  id v9 = v3;
  v6 = (void (*)(void *, uint64_t, void, void *))v4[2];
  id v7 = v3;
  v6(v4, v5, 0, v8);
}

void __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_3(uint64_t a1, void *a2, objc_class *a3)
{
  id v5 = a2;
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_4;
    v11[3] = &unk_1E58461C8;
    id v13 = v5;
    id v12 = *(id *)(a1 + 32);
    [v6 _loadConstituentURLsWithNetworkAccessAllowed:v7 completionHandler:v11];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    id v9 = NSStringFromClass(a3);
    v10 = objc_msgSend(v8, "ph_genericErrorWithLocalizedDescription:", @"Unexpected value class (%@)", v9);

    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v10);
  }
}

uint64_t __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, void))(v6 + 16))(v6, *(void *)(a1 + 32), 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, a5);
  }
}

uint64_t __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end