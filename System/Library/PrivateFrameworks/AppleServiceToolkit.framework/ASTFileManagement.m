@interface ASTFileManagement
+ (id)unprotectedFileHandleForFileURL:(id)a3 error:(id *)a4;
@end

@implementation ASTFileManagement

+ (id)unprotectedFileHandleForFileURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x263F08850] defaultManager];
  v7 = [v5 URLByDeletingLastPathComponent];
  int v8 = [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:a4];

  if (v8)
  {
    v9 = [MEMORY[0x263F08840] fileHandleForCreatingURL:v5 protection:*MEMORY[0x263F080B0] error:a4];
  }
  else
  {
    v10 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[ASTFileManagement unprotectedFileHandleForFileURL:error:](v5, (uint64_t *)a4, v10);
    }

    v9 = 0;
  }

  return v9;
}

+ (void)unprotectedFileHandleForFileURL:(NSObject *)a3 error:.cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 URLByDeletingLastPathComponent];
  v6 = (void *)v5;
  if (a2) {
    uint64_t v7 = *a2;
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = 138412546;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_23CA80000, a3, OS_LOG_TYPE_ERROR, "Could not create directory at URL: [%@]: %@", (uint8_t *)&v8, 0x16u);
}

@end