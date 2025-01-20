@interface MIOModelUtils
+ (id)URLForNewlyCreatedWorkingDirectoryAppropriateForURL:(id)a3 error:(id *)a4;
@end

@implementation MIOModelUtils

+ (id)URLForNewlyCreatedWorkingDirectoryAppropriateForURL:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [v6 URLForDirectory:99 inDomain:1 appropriateForURL:v5 create:1 error:a4];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[MIOModelUtils URLForNewlyCreatedWorkingDirectoryAppropriateForURL:error:]();
    }
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v10 = [NSString stringWithFormat:@"Failed to create a working directory URL."];
      v14[0] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *a4 = [v9 errorWithDomain:@"com.apple.mlassetio" code:2 userInfo:v11];
    }
  }

  return v7;
}

+ (void)URLForNewlyCreatedWorkingDirectoryAppropriateForURL:error:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create a working directory URL.", v0, 2u);
}

@end