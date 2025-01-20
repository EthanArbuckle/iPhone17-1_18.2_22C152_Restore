@interface MADComputeService
@end

@implementation MADComputeService

void __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1();
  }
  [*(id *)(a1 + 40) deregisterProgressHandlerForRequestID:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) deregisterResultsHandlerForRequestID:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6 = (void *)[v3 copy];
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);
}

void __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke_211(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v9 = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_255950000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@[Finish] %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 48) deregisterProgressHandlerForRequestID:*(void *)(a1 + 56)];
  [*(id *)(a1 + 48) deregisterResultsHandlerForRequestID:*(void *)(a1 + 56)];
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  v8 = (void *)[v3 copy];
  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);
}

void __80__MADComputeService_Photos__scheduleRequests_assets_photoLibrary_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1();
  }
  if (*(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = (id)[v3 copy];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __80__MADComputeService_Photos__scheduleRequests_assets_photoLibrary_options_error___block_invoke_221(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v10 = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_255950000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@[Finish] %@", (uint8_t *)&v10, 0x16u);
  }
  if ((a2 & 1) == 0)
  {
    if (*(void *)(a1 + 56)) {
      **(void **)(a1 + 56) = (id)[v5 copy];
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    int v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_255950000, &_os_log_internal, v0, "%@ Error connecting to compute service - %@", v1, v2, v3, v4, v5);
}

@end