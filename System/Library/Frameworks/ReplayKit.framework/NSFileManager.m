@interface NSFileManager
@end

@implementation NSFileManager

void __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke_cold_1(v2);
    }
    NSLog(&cfstr_Error_0.isa, v2);
  }
}

void __56__NSFileManager_RPExtensions___srRemoveFile_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) path];
  if ([*(id *)(a1 + 40) fileExistsAtPath:v2])
  {
    v3 = *(void **)(a1 + 40);
    id v7 = 0;
    char v4 = [v3 removeItemAtPath:v2 error:&v7];
    id v5 = v7;
    if ((v4 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __56__NSFileManager_RPExtensions___srRemoveFile_completion___block_invoke_cold_1(v5);
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

void __67__NSFileManager_RPExtensions___srMoveFileFromURL_toURL_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) path];
  LODWORD(v2) = [v2 fileExistsAtPath:v3];

  if (v2) {
    [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 32);
  id v16 = 0;
  [v6 moveItemAtURL:v4 toURL:v5 error:&v16];
  id v7 = v16;
  if (v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __67__NSFileManager_RPExtensions___srMoveFileFromURL_toURL_completion___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v7);
  }
}

void __56__NSFileManager_RPExtensions___srDeleteFilesWithPrefix___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [*(id *)(a1 + 32) _srTempPath];
  id v25 = 0;
  uint64_t v4 = [v2 contentsOfDirectoryAtPath:v3 error:&v25];
  id v5 = v25;

  uint64_t v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"self BEGINSWITH[cd] %@", *(void *)(a1 + 40)];
  v18 = v4;
  id v7 = [v4 filteredArrayUsingPredicate:v6];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v12 = v5;
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __56__NSFileManager_RPExtensions___srDeleteFilesWithPrefix___block_invoke_cold_1(buf, (int)v5, v27);
        }
        uint64_t v14 = *(void **)(a1 + 32);
        uint64_t v15 = NSString;
        id v16 = [v14 _srTempPath];
        v17 = [v15 stringWithFormat:@"%@/%@", v16, v13];
        id v20 = v12;
        [v14 removeItemAtPath:v17 error:&v20];
        id v5 = v20;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v9);
  }
}

void __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "error in _rkRemoveFile_srDeleteFilesOlderThanTimeToLiveInSeconds, error code: %i", v2, v3, v4, v5, 0);
}

void __56__NSFileManager_RPExtensions___srRemoveFile_completion___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "_rkRemoveFile error: %i", v2, v3, v4, v5, 0);
}

void __67__NSFileManager_RPExtensions___srMoveFileFromURL_toURL_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__NSFileManager_RPExtensions___srDeleteFilesWithPrefix___block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "_rkDeleteFilesWithPrefix error: %i", buf, 8u);
}

@end