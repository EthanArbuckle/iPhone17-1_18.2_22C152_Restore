@interface INCExtensionManagerFetchMatchingSiriExtensionForIntent
@end

@implementation INCExtensionManagerFetchMatchingSiriExtensionForIntent

void ___INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke_2;
  block[3] = &unk_1E62BBC18;
  id v11 = v6;
  id v12 = v5;
  v7 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void ___INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
LABEL_2:
    v3 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "_INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke_2";
      __int16 v9 = 2114;
      uint64_t v10 = v2;
      _os_log_error_impl(&dword_1BC57D000, v3, OS_LOG_TYPE_ERROR, "%s Failed to find extension %{public}@", (uint8_t *)&v7, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  if (![*(id *)(a1 + 40) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    goto LABEL_2;
  }
  v4 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 136315394;
    id v8 = "_INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1BC57D000, v4, OS_LOG_TYPE_INFO, "%s Found Siri extensions %@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [*(id *)(a1 + 40) firstObject];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end