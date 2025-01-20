@interface BiomeFlexibleStorageDirectory
+ (id)directoryForPrivateTable;
+ (id)privateDBPathWithIdentifier:(id)a3 directory:(id)a4 create:(BOOL)a5;
@end

@implementation BiomeFlexibleStorageDirectory

+ (id)directoryForPrivateTable
{
  v2 = [MEMORY[0x1E4F4FB78] biomeDirectoryForDomain:0];
  v3 = [v2 stringByAppendingPathComponent:@"tables"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__BiomeFlexibleStorageDirectory_directoryForPrivateTable__block_invoke;
  block[3] = &unk_1E617A278;
  id v9 = v3;
  uint64_t v4 = directoryForPrivateTable_onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&directoryForPrivateTable_onceToken, block);
  }
  id v6 = (id)directoryForPrivateTable_dir;

  return v6;
}

void __57__BiomeFlexibleStorageDirectory_directoryForPrivateTable__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:@"privateTable"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)directoryForPrivateTable_dir;
  directoryForPrivateTable_dir = v1;
}

+ (id)privateDBPathWithIdentifier:(id)a3 directory:(id)a4 create:(BOOL)a5
{
  BOOL v5 = a5;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = NSString;
  v20[0] = v8;
  v20[1] = v7;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v12 = [v10 pathWithComponents:v11];

  if ([v9 fileExistsAtPath:v8]) {
    goto LABEL_7;
  }
  if (!v5) {
    goto LABEL_7;
  }
  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  id v19 = 0;
  [v13 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&v19];
  id v15 = v19;

  if (v15)
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      +[BiomeFlexibleStorageDirectory privateDBPathWithIdentifier:directory:create:](v16);
    }

    id v17 = 0;
  }
  else
  {
LABEL_7:
    id v17 = v12;
  }

  return v17;
}

+ (void)privateDBPathWithIdentifier:(os_log_t)log directory:create:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1B87BE000, log, OS_LOG_TYPE_FAULT, "Unable to create table storage directory.", v1, 2u);
}

@end