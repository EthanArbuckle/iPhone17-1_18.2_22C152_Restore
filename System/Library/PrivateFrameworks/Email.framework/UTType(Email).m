@interface UTType(Email)
+ (id)em_contentTypeForFilename:()Email fileURL:;
+ (id)log;
@end

@implementation UTType(Email)

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__UTType_Email__log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_42 != -1) {
    dispatch_once(&log_onceToken_42, block);
  }
  v1 = (void *)log_log_42;
  return v1;
}

+ (id)em_contentTypeForFilename:()Email fileURL:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 pathExtension];
  v8 = (id *)MEMORY[0x1E4F44378];
  if (v7
    && ([MEMORY[0x1E4F442D8] typeWithFilenameExtension:v7 conformingToType:*MEMORY[0x1E4F44378]],
        (id v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = [MEMORY[0x1E4F442D8] log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138543874;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_debug_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEBUG, "Content type is %{public}@ for attachment file name '%@', file URL '%@'", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    uint64_t v11 = [v6 pathExtension];

    if (v11
      && ([MEMORY[0x1E4F442D8] typeWithFilenameExtension:v11 conformingToType:*v8],
          (id v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = [MEMORY[0x1E4F442D8] log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412802;
        id v16 = v5;
        __int16 v17 = 2112;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_error_impl(&dword_1BEFDB000, v12, OS_LOG_TYPE_ERROR, "Unable to determine content type for item from its filename '%@'. Falling back to attachment file URL '%@': %@", (uint8_t *)&v15, 0x20u);
      }
    }
    else
    {
      v13 = [MEMORY[0x1E4F442D8] log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[UTType(Email) em_contentTypeForFilename:fileURL:]((uint64_t)v5, (uint64_t)v6, v13);
      }

      id v9 = *v8;
    }
    v7 = (void *)v11;
  }

  return v9;
}

+ (void)em_contentTypeForFilename:()Email fileURL:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Unable to determine content type for item. Attachment file name '%@', file URL: '%@'", (uint8_t *)&v3, 0x16u);
}

@end