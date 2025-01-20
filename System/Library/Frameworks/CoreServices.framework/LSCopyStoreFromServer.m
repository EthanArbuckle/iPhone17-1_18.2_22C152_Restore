@interface LSCopyStoreFromServer
@end

@implementation LSCopyStoreFromServer

void ___LSCopyStoreFromServer_block_invoke(void *a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = *(void *)(a1[4] + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v11;
  id v27 = v11;

  uint64_t v17 = *(void *)(a1[5] + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v12;
  id v19 = v12;

  uint64_t v20 = *(void *)(a1[6] + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v13;
  id v22 = v13;

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a5;
  uint64_t v23 = *(void *)(a1[8] + 8);
  v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v14;
  id v25 = v14;

  uint64_t v26 = *(void *)(*(void *)(a1[4] + 8) + 40);
  if (v26) {
    LOBYTE(v26) = *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
  }
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = v26;
}

uint64_t ___LSCopyStoreFromServer_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___LSCopyStoreFromServer_block_invoke_64(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ___LSCopyStoreFromServer_block_invoke_64_cold_1((uint64_t)v2, v3);
  }
}

uint64_t ___LSCopyStoreFromServer_block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___LSCopyStoreFromServer_block_invoke_2_67()
{
  std::__function::__func<BOOL (*)(objc_object *),std::allocator<BOOL (*)(objc_object *)>,BOOL ()(objc_object *)>::~__func(__LAUNCH_SERVICES_IS_WAITING_ON_THE_MAIN_QUEUE_DUE_TO_A_MANUAL_REBUILD__);
  std::__function::__func<BOOL (*)(objc_object *),std::allocator<BOOL (*)(objc_object *)>,BOOL ()(objc_object *)>::~__func(__LAUNCH_SERVICES_WAS_ASKED_TO_PERFORM_BLOCKING_IO_ON_THE_MAIN_QUEUE__);
  std::__function::__func<BOOL (*)(objc_object *),std::allocator<BOOL (*)(objc_object *)>,BOOL ()(objc_object *)>::~__func(__LAUNCH_SERVICES_IS_RESEEDING_ITS_DATABASE_DUE_TO_A_MANUAL_REBUILD_AND_MAY_BLOCK__);

  return std::__function::__func<BOOL (*)(objc_object *),std::allocator<BOOL (*)(objc_object *)>,BOOL ()(objc_object *)>::~__func(__LAUNCH_SERVICES_IS_RESEEDING_ITS_DATABASE_AND_MAY_BLOCK__);
}

void ___LSCopyStoreFromServer_block_invoke_64_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "error on blocking retry to fetch database: %@", (uint8_t *)&v2, 0xCu);
}

@end