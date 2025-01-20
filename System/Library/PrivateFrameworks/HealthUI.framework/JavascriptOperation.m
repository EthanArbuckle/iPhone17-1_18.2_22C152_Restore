@interface JavascriptOperation
@end

@implementation JavascriptOperation

void __53___JavascriptOperation_submitJavascript_finishBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53___JavascriptOperation_submitJavascript_finishBlock___block_invoke_2;
  v10[3] = &unk_1E6D518B0;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __53___JavascriptOperation_submitJavascript_finishBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completion];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F4181870]();
}

@end