@interface NSString(GSExtensions)
+ (id)gs_stringWithFileSystemRepresentation:()GSExtensions;
- (id)gs_issueExtension:()GSExtensions error:;
- (id)gs_issueReadExtensionIfNeededForAuditToken:()GSExtensions;
- (id)gs_stringByUpdatingPathExtensionWithPathOrURL:()GSExtensions;
- (uint64_t)validateGSName:()GSExtensions;
- (uint64_t)validateGSNameAllowingDot:()GSExtensions error:;
@end

@implementation NSString(GSExtensions)

+ (id)gs_stringWithFileSystemRepresentation:()GSExtensions
{
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v4 stringWithFileSystemRepresentation:a3 length:strlen(a3)];

  return v5;
}

- (uint64_t)validateGSName:()GSExtensions
{
  return [a1 validateGSNameAllowingDot:0 error:a3];
}

- (uint64_t)validateGSNameAllowingDot:()GSExtensions error:
{
  if ((unint64_t)[a1 length] <= 0xFE && objc_msgSend(a1, "length"))
  {
    if ((a3 & 1) != 0 || [a1 characterAtIndex:0] != 46)
    {
      id v10 = a1;
      if (!strchr((char *)[v10 fileSystemRepresentation], 47)) {
      v7 = return 1;
      }
      v8 = gs_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
    }
    else {
      v7 = {;
    }
      v8 = gs_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    v7 = [NSString stringWithFormat:@"Invalid Name [%@]", a1];
    v8 = gs_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
LABEL_8:
    }
      GSAdditionCreationInfoValidate_cold_2();
  }

  if (a4)
  {
    _GSErrorForStatus(105, v7, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (id)gs_issueExtension:()GSExtensions error:
{
  id v6 = a1;
  [v6 fileSystemRepresentation];
  uint64_t v7 = sandbox_extension_issue_file();
  if (v7)
  {
    v8 = (const char *)v7;
    v9 = gs_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[NSString(GSExtensions) gs_issueExtension:error:](a3, (uint64_t)v6, v9);
    }

    id v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:strlen(v8) + 1];
  }
  else
  {
    if (*__error() != 2)
    {
      v11 = [NSString stringWithFormat:@"Failed to issue [%s] extension for <%@>", a3, v6];
      int v12 = *__error();
      v13 = gs_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[NSString(GSExtensions) gs_issueExtension:error:]((uint64_t)v11, v12, v13);
      }

      if (a4)
      {
        _GSErrorForErrno(v12, v11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    id v10 = 0;
  }
  return v10;
}

- (id)gs_issueReadExtensionIfNeededForAuditToken:()GSExtensions
{
  id v1 = a1;
  uint64_t v4 = [v1 fileSystemRepresentation];
  if (sandbox_check_by_audit_token())
  {
    v2 = objc_msgSend(v1, "gs_issueExtension:error:", "com.apple.revisiond.revision", 0, v4);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)gs_stringByUpdatingPathExtensionWithPathOrURL:()GSExtensions
{
  id v4 = a3;
  uint64_t v5 = [a1 pathExtension];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = &stru_1F37C0AE8;
  }
  v8 = v7;

  v9 = [v4 pathExtension];

  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = &stru_1F37C0AE8;
  }
  v11 = v10;

  if ([(__CFString *)v11 caseInsensitiveCompare:v8])
  {
    id v12 = [a1 stringByDeletingPathExtension];
    if ([(__CFString *)v11 length])
    {
      uint64_t v13 = [v12 stringByAppendingPathExtension:v11];

      id v12 = (id)v13;
    }
  }
  else
  {
    id v12 = a1;
  }

  return v12;
}

- (void)gs_issueExtension:()GSExtensions error:.cold.1(uint64_t a1, int __errnum, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = __errnum;
  __int16 v8 = 2080;
  v9 = strerror(__errnum);
  _os_log_debug_impl(&dword_1DC715000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@; error %d (%s)", (uint8_t *)&v4, 0x1Cu);
}

- (void)gs_issueExtension:()GSExtensions error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1DC715000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Issued [%s] extension to <%@>", (uint8_t *)&v3, 0x16u);
}

@end