@interface FPFileManagerFixPermDelegate
- (BOOL)fileManager:(id)a3 shouldRemoveItemAtURL:(id)a4;
@end

@implementation FPFileManagerFixPermDelegate

- (BOOL)fileManager:(id)a3 shouldRemoveItemAtURL:(id)a4
{
  id v4 = a4;
  int v5 = open((const char *)[v4 fileSystemRepresentation], 260);
  if ((v5 & 0x80000000) == 0)
  {
    int v6 = v5;
    memset(&v24, 0, sizeof(v24));
    if (fstat(v5, &v24) < 0)
    {
      v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:]();
      }
    }
    else
    {
      if ((v24.st_flags & 2) == 0 || (fchflags(v6, v24.st_flags & 0xFFFFFFFD) & 0x80000000) == 0)
      {
        id v23 = 0;
        uint64_t v7 = *MEMORY[0x1E4F1C5E8];
        id v22 = 0;
        char v8 = [v4 getResourceValue:&v23 forKey:v7 error:&v22];
        id v9 = v23;
        id v10 = v22;
        if ((v8 & 1) == 0)
        {
          v11 = fp_current_or_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:].cold.6();
          }
        }
        if (v9)
        {
          v12 = (__CFFileSecurity *)objc_alloc_init(MEMORY[0x1E4F1CA08]);
          if (!CFFileSecuritySetAccessControlList(v12, (acl_t)1))
          {
            v13 = fp_current_or_default_log();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.9();
            }
          }
          id v21 = v10;
          char v14 = [v4 setResourceValue:v12 forKey:v7 error:&v21];
          id v15 = v21;

          if ((v14 & 1) == 0)
          {
            v19 = fp_current_or_default_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:].cold.4();
            }

            close(v6);
            goto LABEL_31;
          }
        }
        else
        {
          id v15 = v10;
        }
        if ((v24.st_mode & 0x80) == 0 && fchmod(v6, v24.st_mode | 0x80) < 0)
        {
          v18 = fp_current_or_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:]();
          }
        }
        close(v6);
LABEL_31:

        goto LABEL_35;
      }
      v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:].cold.7();
      }
    }

    close(v6);
    goto LABEL_35;
  }
  v16 = fp_current_or_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:]();
  }

LABEL_35:
  return 1;
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.1()
{
  OUTLINED_FUNCTION_5_1();
  v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6_1(&dword_1A33AE000, v1, v2, "[ERROR] can't open file at \"%s\" : %s %{errno}d", v3, v4, v5, v6, v7);
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.2()
{
  OUTLINED_FUNCTION_5_1();
  v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6_1(&dword_1A33AE000, v1, v2, "[ERROR] can't stat file at \"%s\" : %s %{errno}d", v3, v4, v5, v6, v7);
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.3()
{
  OUTLINED_FUNCTION_5_1();
  v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6_1(&dword_1A33AE000, v1, v2, "[ERROR] can't fixup permissions of \"%s\" for write operation : %s %{errno}d", v3, v4, v5, v6, v7);
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.4()
{
  OUTLINED_FUNCTION_11_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(v0, v1), "fp_prettyDescription");
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] can't remove ACL from \"%s\" : %@", v5, v6, v7, v8, 2u);
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.6()
{
  OUTLINED_FUNCTION_11_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(v0, v1), "fp_prettyDescription");
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] can't fetch file security info from \"%s\" : %@", v5, v6, v7, v8, 2u);
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.7()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6_1(&dword_1A33AE000, v1, v2, "[ERROR] can't fixup UF_IMMUTABLE flag of \"%s\" for write operation : %s %{errno}d", v3, v4, v5, v6, v7);
}

@end