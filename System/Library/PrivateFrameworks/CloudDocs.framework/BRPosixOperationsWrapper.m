@interface BRPosixOperationsWrapper
+ (int)closeFD:(int)a3;
+ (int)open:(id)a3 flags:(int)a4;
+ (int64_t)consumeSandboxExtension:(id)a3 error:(id *)a4;
+ (unint64_t)getFileIDOfURL:(id)a3 withError:(id *)a4;
+ (void)exitProcess:(int)a3;
+ (void)releaseSandboxExtensionHandle:(int64_t)a3;
@end

@implementation BRPosixOperationsWrapper

+ (void)exitProcess:(int)a3
{
}

+ (int)open:(id)a3 flags:(int)a4
{
  v5 = (const char *)[a3 fileSystemRepresentation];

  return open(v5, a4);
}

+ (int)closeFD:(int)a3
{
  return close(a3);
}

+ (unint64_t)getFileIDOfURL:(id)a3 withError:(id *)a4
{
  int v5 = open((const char *)[a3 fileSystemRepresentation], 2129924);
  if (v5 < 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", *__error());
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    return *__error();
  }
  else
  {
    uint64_t v9 = 0;
    long long v8 = xmmword_19EDD6828;
    memset(v7, 0, 12);
    if (fgetattrlist(v5, &v8, v7, 0xCuLL, 0x20u) >= 0) {
      return *(void *)((char *)v7 + 4);
    }
    else {
      return 0;
    }
  }
}

+ (int64_t)consumeSandboxExtension:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [a3 bytes];
  int64_t v5 = sandbox_extension_consume();
  if (v5 < 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    if (v6)
    {
      v7 = brc_bread_crumbs((uint64_t)"+[BRPosixOperationsWrapper consumeSandboxExtension:error:]", 69);
      long long v8 = brc_default_log(0);
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        v10 = "(passed to caller)";
        int v11 = 136315906;
        v12 = "+[BRPosixOperationsWrapper consumeSandboxExtension:error:]";
        __int16 v13 = 2080;
        if (!a4) {
          v10 = "(ignored by caller)";
        }
        v14 = v10;
        __int16 v15 = 2112;
        v16 = v6;
        __int16 v17 = 2112;
        v18 = v7;
        _os_log_error_impl(&dword_19ED3F000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v11, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v6;
    }
  }
  return v5;
}

+ (void)releaseSandboxExtensionHandle:(int64_t)a3
{
}

@end