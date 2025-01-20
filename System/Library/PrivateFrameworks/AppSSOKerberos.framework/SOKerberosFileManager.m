@interface SOKerberosFileManager
+ (BOOL)archiveDictionary:(id)a3 toFile:(id)a4;
+ (id)documentsDirectoryURLForFileName:(id)a3;
+ (id)loadDictionaryFromFile:(id)a3;
@end

@implementation SOKerberosFileManager

+ (BOOL)archiveDictionary:(id)a3 toFile:(id)a4
{
  id v6 = a3;
  v7 = [a1 documentsDirectoryURLForFileName:a4];
  v8 = SO_LOG_SOKerberosFileManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[SOKerberosFileManager archiveDictionary:toFile:]((uint64_t)v7, v8);
  }

  id v17 = 0;
  v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v17];

  id v10 = v17;
  if (v10)
  {
    v11 = v10;
    v12 = SO_LOG_SOKerberosFileManager();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[SOKerberosFileManager archiveDictionary:toFile:]();
    }
    char v13 = 0;
LABEL_10:

    goto LABEL_11;
  }
  id v16 = 0;
  char v13 = [v9 writeToURL:v7 options:1073741825 error:&v16];
  id v14 = v16;
  if (v14)
  {
    v11 = v14;
    v12 = SO_LOG_SOKerberosFileManager();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[SOKerberosFileManager archiveDictionary:toFile:]();
    }
    goto LABEL_10;
  }
LABEL_11:

  return v13;
}

+ (id)loadDictionaryFromFile:(id)a3
{
  v17[7] = *MEMORY[0x263EF8340];
  v3 = [a1 documentsDirectoryURLForFileName:a3];
  v4 = SO_LOG_SOKerberosFileManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[SOKerberosFileManager loadDictionaryFromFile:]((uint64_t)v3, v4);
  }

  id v16 = 0;
  v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3 options:0 error:&v16];
  id v6 = v16;
  if (v6)
  {
    id v7 = v6;
    v8 = SO_LOG_SOKerberosFileManager();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SOKerberosFileManager loadDictionaryFromFile:]();
    }
    v9 = 0;
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F08928];
    v11 = (void *)MEMORY[0x263EFFA08];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    v17[5] = objc_opt_class();
    v17[6] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:7];
    char v13 = [v11 setWithArray:v12];
    id v15 = 0;
    v9 = [v10 unarchivedObjectOfClasses:v13 fromData:v5 error:&v15];
    id v7 = v15;

    if (!v7) {
      goto LABEL_11;
    }
    v8 = SO_LOG_SOKerberosFileManager();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SOKerberosFileManager loadDictionaryFromFile:]((uint64_t)v7, v8);
    }
  }

LABEL_11:
  return v9;
}

+ (id)documentsDirectoryURLForFileName:(id)a3
{
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  v5 = [v3 defaultManager];
  id v6 = [v5 URLsForDirectory:9 inDomains:1];
  id v7 = [v6 firstObject];

  v8 = [v7 URLByAppendingPathComponent:v4];

  return v8;
}

+ (void)archiveDictionary:toFile:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_221304000, v0, v1, "Error writing file: %{public}@, error: %{public}@");
}

+ (void)archiveDictionary:toFile:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_221304000, v0, v1, "Error archiving file: %{public}@, error: %{public}@");
}

+ (void)archiveDictionary:(uint64_t)a1 toFile:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_221304000, a2, OS_LOG_TYPE_DEBUG, "archiving to file: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)loadDictionaryFromFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221304000, a2, OS_LOG_TYPE_ERROR, "Error deserializing plist: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)loadDictionaryFromFile:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_221304000, v0, v1, "Error reading plist file: %{public}@, message: %{public}@");
}

+ (void)loadDictionaryFromFile:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_221304000, a2, OS_LOG_TYPE_DEBUG, "loading from file: %@", (uint8_t *)&v2, 0xCu);
}

@end