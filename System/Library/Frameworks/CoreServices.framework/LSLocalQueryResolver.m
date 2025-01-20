@interface LSLocalQueryResolver
@end

@implementation LSLocalQueryResolver

BOOL __82___LSLocalQueryResolver__enumerateResolvedResultsOfQuery_XPCConnection_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x18530F680]();
  uint64_t v8 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(*(void *)(v8 + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v8 = *(void *)(a1 + 40);
  }
  if (!v5 && v6)
  {
    *(unsigned char *)(*(void *)(v8 + 8) + 24) = 1;
    uint64_t v8 = *(void *)(a1 + 40);
  }
  int v9 = *(unsigned __int8 *)(*(void *)(v8 + 8) + 24);

  return v9 == 0;
}

void __61___LSLocalQueryResolver__resolveQueries_XPCConnection_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  if (v8)
  {
    [v7 addObject:v8];
  }
  else
  {
    *(void *)(v6 + 40) = 0;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

@end