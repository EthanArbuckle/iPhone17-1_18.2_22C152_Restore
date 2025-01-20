@interface CKDataVault
+ (BOOL)createDataVaultDirectoryAtPath:(id)a3 withStorageClass:(id)a4 error:(id *)a5;
+ (id)errorWithDescription:(uint64_t)a1;
@end

@implementation CKDataVault

+ (BOOL)createDataVaultDirectoryAtPath:(id)a3 withStorageClass:(id)a4 error:(id *)a5
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v9 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:a5];

  if (a5)
  {
    id v10 = *a5;
    if (*a5)
    {
      v11 = (void *)CKLogContextFramework;
      if (os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_ERROR))
      {
        v25 = v11;
        v26 = [v10 localizedDescription];
        int v39 = 136315650;
        v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
        __int16 v41 = 2112;
        id v42 = v7;
        __int16 v43 = 2112;
        v44[0] = v26;
        _os_log_error_impl(&dword_1A77B3000, v25, OS_LOG_TYPE_ERROR, "%s could not create directory at path %@: %@", (uint8_t *)&v39, 0x20u);
      }
      goto LABEL_5;
    }
  }
  id v13 = v7;
  v14 = (const char *)[v13 UTF8String];
  [v8 UTF8String];
  int v15 = rootless_check_datavault_flag();
  if (v15 == 1)
  {
    if (!chmod(v14, 0x1C0u))
    {
      int v21 = rootless_convert_to_datavault();
      v22 = CKLogContextFramework;
      if (!v21)
      {
        if (!os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_9;
        }
        int v39 = 136315138;
        v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
        v23 = "%s successfully converted directory to data vault";
        v24 = v22;
        goto LABEL_26;
      }
      if (os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_ERROR))
      {
        v35 = v22;
        int v36 = *__error();
        v37 = __error();
        v38 = strerror(*v37);
        int v39 = 136315906;
        v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
        __int16 v41 = 2112;
        id v42 = v13;
        __int16 v43 = 1024;
        LODWORD(v44[0]) = v36;
        WORD2(v44[0]) = 2080;
        *(void *)((char *)v44 + 6) = v38;
        _os_log_error_impl(&dword_1A77B3000, v35, OS_LOG_TYPE_ERROR, "%s Failed to convert to data vault: %@: [%i] %s", (uint8_t *)&v39, 0x26u);

        if (!a5) {
          goto LABEL_5;
        }
      }
      else if (!a5)
      {
        goto LABEL_5;
      }
      v18 = @"Failed to convert to data vault";
      goto LABEL_17;
    }
    v17 = (void *)CKLogContextFramework;
    if (os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_ERROR))
    {
      v31 = v17;
      int v32 = *__error();
      v33 = __error();
      v34 = strerror(*v33);
      int v39 = 136315906;
      v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
      __int16 v41 = 2112;
      id v42 = v13;
      __int16 v43 = 1024;
      LODWORD(v44[0]) = v32;
      WORD2(v44[0]) = 2080;
      *(void *)((char *)v44 + 6) = v34;
      _os_log_error_impl(&dword_1A77B3000, v31, OS_LOG_TYPE_ERROR, "%s Failed to set mode on directory %@: [%i] %s", (uint8_t *)&v39, 0x26u);

      if (!a5) {
        goto LABEL_5;
      }
    }
    else if (!a5)
    {
      goto LABEL_5;
    }
    v18 = @"failed to set mode on directory";
LABEL_17:
    +[CKDataVault errorWithDescription:]((uint64_t)CKDataVault, v18);
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!v15)
  {
    uint64_t v16 = CKLogContextFramework;
    if (!os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:
      BOOL v12 = 1;
      goto LABEL_18;
    }
    int v39 = 136315138;
    v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
    v23 = "%s data vault already exists";
    v24 = v16;
LABEL_26:
    _os_log_debug_impl(&dword_1A77B3000, v24, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&v39, 0xCu);
    goto LABEL_9;
  }
  v19 = (void *)CKLogContextFramework;
  if (os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_ERROR))
  {
    v27 = v19;
    int v28 = *__error();
    v29 = __error();
    v30 = strerror(*v29);
    int v39 = 136315906;
    v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
    __int16 v41 = 2112;
    id v42 = v13;
    __int16 v43 = 1024;
    LODWORD(v44[0]) = v28;
    WORD2(v44[0]) = 2080;
    *(void *)((char *)v44 + 6) = v30;
    _os_log_error_impl(&dword_1A77B3000, v27, OS_LOG_TYPE_ERROR, "%s data vault status check failed at path %@: [%i] %s", (uint8_t *)&v39, 0x26u);

    if (a5) {
      goto LABEL_16;
    }
  }
  else if (a5)
  {
LABEL_16:
    v18 = @"data vault status check failed";
    goto LABEL_17;
  }
LABEL_5:
  BOOL v12 = 0;
LABEL_18:

  return v12;
}

+ (id)errorWithDescription:(uint64_t)a1
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v3 = (void *)MEMORY[0x1E4F28C58];
  v12[0] = v2;
  v11[0] = @"description";
  v11[1] = @"errno";
  v4 = [MEMORY[0x1E4F28ED0] numberWithInt:*__error()];
  v12[1] = v4;
  v11[2] = @"strerror";
  v5 = NSString;
  v6 = __error();
  id v7 = [v5 stringWithCString:strerror(*v6) encoding:4];
  v12[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v9 = [v3 errorWithDomain:@"com.apple.internal.ck" code:102 userInfo:v8];

  return v9;
}

@end