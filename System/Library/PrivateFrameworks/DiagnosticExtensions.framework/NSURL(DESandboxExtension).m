@interface NSURL(DESandboxExtension)
- (id)generateSandboxExtensionForProcess:()DESandboxExtension;
- (void)accessWithSandboxExtension:()DESandboxExtension inBlock:;
@end

@implementation NSURL(DESandboxExtension)

- (id)generateSandboxExtensionForProcess:()DESandboxExtension
{
  v5 = Log_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(NSURL(DESandboxExtension) *)a1 generateSandboxExtensionForProcess:v5];
  }

  id v6 = a1;
  uint64_t v7 = [v6 fileSystemRepresentation];
  if (!v7)
  {
    v10 = Log_3();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NSURL(DESandboxExtension) generateSandboxExtensionForProcess:](v6);
    }
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  id v17 = 0;
  char v9 = [v6 checkResourceIsReachableAndReturnError:&v17];
  v10 = v17;
  if ((v9 & 1) == 0)
  {
    v15 = Log_3();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[NSURL(DESandboxExtension) generateSandboxExtensionForProcess:].cold.4(v8, v10);
    }

    goto LABEL_17;
  }
  v11 = (void *)sandbox_extension_issue_file_to_process_by_pid();
  v12 = Log_3();
  v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(NSURL(DESandboxExtension) *)v6 generateSandboxExtensionForProcess:v13];
    }

LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    [(NSURL(DESandboxExtension) *)v6 generateSandboxExtensionForProcess:v13];
  }

  v14 = [NSString stringWithUTF8String:v11];
  free(v11);
LABEL_18:

  return v14;
}

- (void)accessWithSandboxExtension:()DESandboxExtension inBlock:
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  if (v6 && [v6 length])
  {
    [v6 UTF8String];
    if (sandbox_extension_consume() == -1)
    {
      v14 = NSString;
      v15 = [a1 path];
      v16 = __error();
      id v17 = strerror(*v16);
      v18 = "Unknown";
      if (v17) {
        v18 = v17;
      }
      v11 = [v14 stringWithFormat:@"Failed to consume extension token for [%@] due to error: %s", v15, v18];

      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23 = v11;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v21 = [v19 errorWithDomain:@"DEExtensionErrorDomain" code:0 userInfo:v20];

      v7[2](v7, v21);
    }
    else
    {
      uint64_t v8 = Log_3();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[NSURL(DESandboxExtension) accessWithSandboxExtension:inBlock:](a1);
      }

      v7[2](v7, 0);
      int v9 = sandbox_extension_release();
      v10 = Log_3();
      v11 = v10;
      if (v9 == -1)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[NSURL(DESandboxExtension) accessWithSandboxExtension:inBlock:](a1);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        -[NSURL(DESandboxExtension) accessWithSandboxExtension:inBlock:](a1);
      }
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"nil sandbox extension token. Do not try attempt to consume a token more than once.";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v11 = [v12 errorWithDomain:@"DEExtensionErrorDomain" code:0 userInfo:v13];

    v7[2](v7, v11);
  }
}

- (void)generateSandboxExtensionForProcess:()DESandboxExtension .cold.1(void *a1)
{
  v1 = [a1 path];
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "Failed to get file system representation for file with URL: %{public}@. This DiagnosticExtension may not have appropriate access to the specified item.", v4, v5, v6, v7, 2u);
}

- (void)generateSandboxExtensionForProcess:()DESandboxExtension .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 path];
  uint64_t v5 = __error();
  strerror(*v5);
  int v7 = 138543874;
  uint64_t v8 = v4;
  OUTLINED_FUNCTION_9();
  __int16 v9 = 2080;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1A7E51000, a3, OS_LOG_TYPE_ERROR, "Failed to grant RW sandbox extension for attachment item [%{public}@] for PID: %d with error: %s. This DiagnosticExtension may not have appropriate access to the specified item.", (uint8_t *)&v7, 0x1Cu);
}

- (void)generateSandboxExtensionForProcess:()DESandboxExtension .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1A7E51000, a3, OS_LOG_TYPE_DEBUG, "Granted RW sandbox extension for [%{public}@] to process with PID: %d.", v5, 0x12u);
}

- (void)generateSandboxExtensionForProcess:()DESandboxExtension .cold.4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1A7E51000, v3, v4, "Cannot grant sandbox extension for unreachable item with path '%s' due to error %@. This DiagnosticExtension may not have appropriate access to the specified item.", v5, v6, v7, v8, v9);
}

- (void)generateSandboxExtensionForProcess:()DESandboxExtension .cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 path];
  int v6 = 136446722;
  uint64_t v7 = "-[NSURL(DESandboxExtension) generateSandboxExtensionForProcess:]";
  OUTLINED_FUNCTION_9();
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1A7E51000, a3, OS_LOG_TYPE_DEBUG, "%{public}s with pid: [%d] url [%{public}@]", (uint8_t *)&v6, 0x1Cu);
}

- (void)accessWithSandboxExtension:()DESandboxExtension inBlock:.cold.1(void *a1)
{
  v1 = [a1 path];
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1A7E51000, v3, v4, "Failed to release sandbox extension for file [%@] due to error: %s", v5, v6, v7, v8, v9);
}

- (void)accessWithSandboxExtension:()DESandboxExtension inBlock:.cold.2(void *a1)
{
  v1 = [a1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7E51000, v2, v3, "Released sandbox extension handle for file at path [%@]", v4, v5, v6, v7, v8);
}

- (void)accessWithSandboxExtension:()DESandboxExtension inBlock:.cold.3(void *a1)
{
  v1 = [a1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7E51000, v2, v3, "Extending sandbox for file at path [%@]", v4, v5, v6, v7, v8);
}

@end