@interface NSFileManager(FMAdditions)
+ (BOOL)fm_setDataProtectionClass:()FMAdditions forFileURL:error:;
@end

@implementation NSFileManager(FMAdditions)

+ (BOOL)fm_setDataProtectionClass:()FMAdditions forFileURL:error:
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v7 = (const char *)[a4 fileSystemRepresentation];
  int v8 = open(v7, 289);
  if (v8 < 0)
  {
    v18 = LogCategory_Unspecified();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[NSFileManager(FMAdditions) fm_setDataProtectionClass:forFileURL:error:]((uint64_t)v7, v18);
    }

    return 0;
  }
  else
  {
    int v9 = v8;
    uint64_t v10 = fcntl(v8, 64, a3);
    BOOL v11 = v10 == 0;
    if (v10)
    {
      uint64_t v12 = v10;
      v13 = LogCategory_Unspecified();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[NSFileManager(FMAdditions) fm_setDataProtectionClass:forFileURL:error:]((uint64_t)v7, v12, v13);
      }

      if (a5)
      {
        v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = (int)v12;
        v20[0] = *MEMORY[0x1E4F28588];
        v20[1] = @"ManipulateFileDescriptorStatus";
        v21[0] = @"Changing the data protection failed";
        v16 = [NSNumber numberWithInt:v12];
        v21[1] = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
        *a5 = [v14 errorWithDomain:@"com.apple.icloud.fmcore.nsfilemanager.additions.error" code:v15 userInfo:v17];
      }
    }
    close(v9);
  }
  return v11;
}

+ (void)fm_setDataProtectionClass:()FMAdditions forFileURL:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FB9000, a2, OS_LOG_TYPE_ERROR, "Could not find the file %s", (uint8_t *)&v2, 0xCu);
}

+ (void)fm_setDataProtectionClass:()FMAdditions forFileURL:error:.cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1B2FB9000, log, OS_LOG_TYPE_ERROR, "Changing the data protection on %s resulted in %i", (uint8_t *)&v3, 0x12u);
}

@end