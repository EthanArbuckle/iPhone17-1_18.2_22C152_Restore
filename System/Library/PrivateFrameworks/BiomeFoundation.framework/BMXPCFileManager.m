@interface BMXPCFileManager
@end

@implementation BMXPCFileManager

void __69___BMXPCFileManager__fileHandleForFileAtPath_flags_protection_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __61___BMXPCFileManager_temporaryFileHandleWithProtection_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __71___BMXPCFileManager_replaceFileAtPath_withFileHandle_protection_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __67___BMXPCFileManager__synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 domain];
  if (![v3 isEqual:*MEMORY[0x1E4F281F8]])
  {

    goto LABEL_7;
  }
  if ([v5 code] == 4099)
  {
  }
  else
  {
    uint64_t v4 = [v5 code];

    if (v4 != 4097) {
      goto LABEL_7;
    }
  }
  [*(id *)(a1 + 32) invalidate];
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69___BMXPCFileManager__fileHandleForFileAtPath_flags_protection_error___block_invoke(uint64_t a1, void *a2)
{
}

void __45___BMXPCFileManager__removeFileAtPath_error___block_invoke(uint64_t a1, void *a2)
{
}

void __45___BMXPCFileManager__removeFileAtPath_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __50___BMXPCFileManager__removeDirectoryAtPath_error___block_invoke(uint64_t a1, void *a2)
{
}

void __50___BMXPCFileManager__removeDirectoryAtPath_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __61___BMXPCFileManager_temporaryFileHandleWithProtection_error___block_invoke(uint64_t a1, void *a2)
{
}

void __71___BMXPCFileManager_replaceFileAtPath_withFileHandle_protection_error___block_invoke(uint64_t a1, void *a2)
{
}

@end