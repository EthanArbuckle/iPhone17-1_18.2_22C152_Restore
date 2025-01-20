@interface EDSentToFilter
@end

@implementation EDSentToFilter

id __31___EDSentToFilter_loadFromDisk__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  v7 = [MEMORY[0x1E4F60410] mailDataDirectory];
  v8 = [v7 URLByAppendingPathComponent:v6];

  id v15 = 0;
  v9 = [MEMORY[0x1E4F60D30] bloomFilterWithContentsOfFile:v8 error:&v15];
  id v10 = v15;
  v11 = v10;
  if (!v9)
  {
    if (isNoSuchFileError(v10))
    {
      v12 = EDSenderLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v5;
        _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Sent to addresses filter %@ does not exist", buf, 0xCu);
      }
    }
    else
    {
      v12 = EDSenderLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_msgSend(v11, "ef_publicDescription");
        __31___EDSentToFilter_loadFromDisk__block_invoke_cold_1((uint64_t)v5, v13, (uint64_t)buf, v12);
      }
    }
  }

  return v9;
}

void __31___EDSentToFilter_loadFromDisk__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to load sent to addresses filter %@: %{public}@", (uint8_t *)a3, a4);
}

@end