@interface CESRUaapData
+ (BOOL)removeUaapOovsForLanguage:(id)a3 bundleId:(id)a4;
+ (BOOL)writeUaapOovsForLanguage:(id)a3 bundleId:(id)a4 customProns:(id)a5 newOovs:(id)a6 error:(id *)a7;
+ (id)readUaapOovsForLanguage:(id)a3;
@end

@implementation CESRUaapData

+ (BOOL)removeUaapOovsForLanguage:(id)a3 bundleId:(id)a4
{
  id v5 = a4;
  v6 = AppOovDirectory(a3);
  v7 = [v6 stringByAppendingPathComponent:v5];

  v8 = [v7 stringByAppendingPathComponent:@"Prons"];
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 removeItemAtPath:v8 error:0];

  return v10;
}

+ (BOOL)writeUaapOovsForLanguage:(id)a3 bundleId:(id)a4 customProns:(id)a5 newOovs:(id)a6 error:(id *)a7
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v11 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = objc_alloc_init(v11);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __76__CESRUaapData_writeUaapOovsForLanguage_bundleId_customProns_newOovs_error___block_invoke;
  v39[3] = &unk_1E61C3668;
  id v16 = v15;
  id v40 = v16;
  [v12 enumerateObjectsUsingBlock:v39];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __76__CESRUaapData_writeUaapOovsForLanguage_bundleId_customProns_newOovs_error___block_invoke_2;
  v37[3] = &unk_1E61C3690;
  id v17 = v16;
  id v38 = v17;
  [v13 enumerateKeysAndObjectsUsingBlock:v37];

  v18 = AppOovDirectory(v14);

  v19 = [v18 stringByAppendingPathComponent:v10];

  v20 = [v19 stringByAppendingPathComponent:@"Prons"];
  v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v19];
  uint64_t v47 = *MEMORY[0x1E4F28370];
  v48[0] = *MEMORY[0x1E4F28378];
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
  id v36 = 0;
  char v24 = [v21 createDirectoryAtURL:v22 withIntermediateDirectories:1 attributes:v23 error:&v36];
  id v25 = v36;

  if (v24)
  {
    v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20];
    id v35 = v25;
    char v27 = [v17 writeToURL:v26 error:&v35];
    id v28 = v35;

    if (v27)
    {
      BOOL v29 = 1;
LABEL_14:
      id v25 = v28;
      goto LABEL_15;
    }
    v32 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "+[CESRUaapData writeUaapOovsForLanguage:bundleId:customProns:newOovs:error:]";
      __int16 v43 = 2112;
      id v44 = v10;
      __int16 v45 = 2112;
      id v46 = v28;
      _os_log_error_impl(&dword_1B8CCB000, v32, OS_LOG_TYPE_ERROR, "%s Failed to write app-specific OOVs for %@: %@", buf, 0x20u);
    }
    v31 = a7;
    if (!a7)
    {
      BOOL v29 = 0;
      goto LABEL_14;
    }
    id v25 = v28;
    goto LABEL_12;
  }
  v30 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v42 = "+[CESRUaapData writeUaapOovsForLanguage:bundleId:customProns:newOovs:error:]";
    __int16 v43 = 2112;
    id v44 = v10;
    __int16 v45 = 2112;
    id v46 = v25;
    _os_log_error_impl(&dword_1B8CCB000, v30, OS_LOG_TYPE_ERROR, "%s Failed to create UaaP app directory for %@: %@", buf, 0x20u);
  }
  v31 = a7;
  if (a7)
  {
LABEL_12:
    id v25 = v25;
    BOOL v29 = 0;
    id *v31 = v25;
    goto LABEL_15;
  }
  BOOL v29 = 0;
LABEL_15:

  return v29;
}

void __76__CESRUaapData_writeUaapOovsForLanguage_bundleId_customProns_newOovs_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 array];
  [v2 setObject:v5 forKey:v4];
}

void __76__CESRUaapData_writeUaapOovsForLanguage_bundleId_customProns_newOovs_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 allObjects];
  [v4 setObject:v6 forKey:v5];
}

+ (id)readUaapOovsForLanguage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = AppOovDirectory(a3);
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  id v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v15];
  id v6 = v15;
  if (v6)
  {
    v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v17 = "+[CESRUaapData readUaapOovsForLanguage:]";
      __int16 v18 = 2112;
      v19 = v3;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_ERROR, "%s Failed to enumerate UaaP pron directory at %@: %@", buf, 0x20u);
    }
    v8 = 0;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __40__CESRUaapData_readUaapOovsForLanguage___block_invoke;
    v12[3] = &unk_1E61C3640;
    id v13 = v3;
    id v14 = v9;
    id v10 = v9;
    [v5 enumerateObjectsUsingBlock:v12];
    v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v10];
  }

  return v8;
}

void __40__CESRUaapData_readUaapOovsForLanguage___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  id v4 = [v3 stringByAppendingPathComponent:@"Prons"];

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    id v20 = 0;
    id v9 = [v7 dictionaryWithContentsOfURL:v8 error:&v20];
    id v10 = v20;

    if (v10)
    {
      v11 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v22 = "+[CESRUaapData readUaapOovsForLanguage:]_block_invoke";
        __int16 v23 = 2112;
        char v24 = v4;
        __int16 v25 = 2112;
        id v26 = v10;
        _os_log_error_impl(&dword_1B8CCB000, v11, OS_LOG_TYPE_ERROR, "%s Failed to load app-specific OOVs from %@: %@", buf, 0x20u);
      }
    }
    else
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __40__CESRUaapData_readUaapOovsForLanguage___block_invoke_5;
      __int16 v18 = &unk_1E61C3618;
      id v19 = v12;
      id v13 = v12;
      [v9 enumerateKeysAndObjectsUsingBlock:&v15];
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", v13, v15, v16, v17, v18);
      [*(id *)(a1 + 40) addObject:v14];
    }
  }
}

void __40__CESRUaapData_readUaapOovsForLanguage___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a2;
  id v7 = [v5 setWithArray:a3];
  [*(id *)(a1 + 32) setObject:v7 forKey:v6];
}

@end