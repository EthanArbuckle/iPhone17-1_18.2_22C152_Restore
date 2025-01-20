@interface LSXPCQueryResolver
@end

@implementation LSXPCQueryResolver

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke(uint64_t a1)
{
  v7[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v7[1] = (void (*)(void, void))3221225472;
  v7[2] = (void (*)(void, void))__59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2;
  v7[3] = (void (*)(void, void))&unk_1E522BA78;
  v7[4] = *(void (**)(void, void))(a1 + 40);
  v2 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v7);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_136;
  v5[3] = &unk_1E52304D8;
  int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  [v2 resolveQueries:v3 legacySPI:v4 completionHandler:v5];
}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = a1 + 32;
  objc_storeStrong((id *)(*(void *)(v6 + 8) + 40), a2);
  v7 = _LSDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2_cold_1(v5, v7, v8, v9, v10, v11, v12, v13);
  }
}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    if (![*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      goto LABEL_8;
    }
    uint64_t v8 = [v6 mutableCopy];
    [v8 addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    uint64_t v9 = [v8 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    uint64_t v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_136_cold_1((uint64_t)v7, v8);
    }
  }

LABEL_8:
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
  id v14 = v6;

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v7;
}

void __80___LSXPCQueryResolver__enumerateResolvedResultsOfQuery_XPCConnection_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (void *)MEMORY[0x18530F680]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_136_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_182959000, a2, OS_LOG_TYPE_DEBUG, "Error resolving queries: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end