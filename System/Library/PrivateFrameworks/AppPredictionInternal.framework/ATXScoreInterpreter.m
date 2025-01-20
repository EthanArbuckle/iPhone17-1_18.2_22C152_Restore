@interface ATXScoreInterpreter
@end

@implementation ATXScoreInterpreter

void __43___ATXScoreInterpreter__compileToBytecode___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;

  *a4 = 1;
}

id __43___ATXScoreInterpreter__compileToBytecode___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) mutableCopy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  return v2;
}

void __41___ATXScoreInterpreter__compileBytecode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  v6 = (void *)MEMORY[0x1D25F6CC0]();
  id v7 = -[_ATXScoreInterpreter _compileToBytecode:](*(id **)(a1 + 32), v5);
  id v8 = (void *)[v7 copy];
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v9];
}

@end