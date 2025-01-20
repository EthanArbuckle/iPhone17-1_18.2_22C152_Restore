@interface CNAuditTokenUtilities
+ (id)_bundleIdentifierFromInfoPlistForAuditToken:(id *)a3;
+ (id)_bundleIdentifierFromSecTaskForAuditToken:(id *)a3;
+ (id)bundleIdentifierForAuditToken:(id)a3;
+ (id)os_log;
+ (id)processNameForAuditToken:(id)a3;
+ (int)processIdentifierForAuditToken:(id)a3;
@end

@implementation CNAuditTokenUtilities

+ (id)bundleIdentifierForAuditToken:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v9 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v4, "audit_token");
  v6 = [a1 _bundleIdentifierFromSecTaskForAuditToken:v16];
  if (off_1EE0254C0((uint64_t)&__block_literal_global_121_0, v6))
  {
    v7 = objc_msgSend(a1, "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[CNAuditTokenUtilities bundleIdentifierForAuditToken:]((uint64_t)v6, v7);
    }

    id v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "audit_token");
    v10 = [a1 _bundleIdentifierFromInfoPlistForAuditToken:&v15];

    BOOL v11 = off_1EE0254C0((uint64_t)&__block_literal_global_121_0, v10);
    v12 = objc_msgSend(a1, "os_log");
    v13 = v12;
    if (!v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[CNAuditTokenUtilities bundleIdentifierForAuditToken:]();
      }

      v9 = 0;
      goto LABEL_15;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[CNAuditTokenUtilities bundleIdentifierForAuditToken:]((uint64_t)v10, v13);
    }

    id v8 = v10;
  }
  v10 = v8;
  v9 = v8;
LABEL_15:

LABEL_16:

  return v9;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_13 != -1) {
    dispatch_once(&os_log_cn_once_token_1_13, &__block_literal_global_72);
  }
  v2 = (void *)os_log_cn_once_object_1_13;

  return v2;
}

+ (id)_bundleIdentifierFromSecTaskForAuditToken:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v21.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v21.val[4] = v4;
  SecTaskRef v5 = SecTaskCreateWithAuditToken(0, &v21);
  if (!v5)
  {
    v9 = objc_msgSend(a1, "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CNAuditTokenUtilities _bundleIdentifierFromSecTaskForAuditToken:]();
    }

    goto LABEL_7;
  }
  v6 = v5;
  *__error() = 0;
  *(void *)v21.val = 0;
  CFStringRef v7 = SecTaskCopySigningIdentifier(v6, (CFErrorRef *)&v21);
  if (v7)
  {
    id v8 = (__CFString *)v7;
    CFRelease(v6);
    goto LABEL_29;
  }
  v10 = objc_msgSend(a1, "os_log");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[CNAuditTokenUtilities _bundleIdentifierFromSecTaskForAuditToken:]((uint64_t *)&v21, v10);
  }

  BOOL v11 = (void *)SecTaskCopyValueForEntitlement(v6, @"application-identifier", (CFErrorRef *)&v21);
  if (!v11)
  {
    v20 = objc_msgSend(a1, "os_log");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[CNAuditTokenUtilities _bundleIdentifierFromSecTaskForAuditToken:]();
    }

    CFRelease(v6);
LABEL_7:
    id v8 = 0;
    goto LABEL_29;
  }
  v12 = v11;
  if ((unint64_t)[v11 length] < 0xB
    || [v12 characterAtIndex:10] != 46)
  {
    goto LABEL_27;
  }
  unint64_t v13 = 0;
  do
  {
    int v14 = [v12 characterAtIndex:v13];
    BOOL v16 = (v14 - 65) < 0x1A || (v14 - 48) < 0xA;
  }
  while (v16 && v13++ < 9);
  if (!v16
    || (objc_msgSend(v12, "substringWithRange:", 11, objc_msgSend(v12, "length") - 11),
        (v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_27:
    v18 = (void *)[v12 copy];
  }
  CFRelease(v6);
  id v8 = v18;

LABEL_29:

  return v8;
}

uint64_t __31__CNAuditTokenUtilities_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.foundation", "CNAuditTokenUtilities");
  uint64_t v1 = os_log_cn_once_object_1_13;
  os_log_cn_once_object_1_13 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)processNameForAuditToken:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_msgSend(a3, "audit_token");
    pid_t v4 = audit_token_to_pid(&atoken);
    buffer[0] = 0;
    if (proc_pidpath(v4, buffer, 0x800u) > 0)
    {
      SecTaskRef v5 = strrchr(buffer, 47);
      if (v5) {
        v6 = v5 + 1;
      }
      else {
        v6 = buffer;
      }
      CFStringRef v7 = [NSString stringWithUTF8String:v6];
      goto LABEL_11;
    }
    id v8 = objc_msgSend(a1, "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CNAuditTokenUtilities processNameForAuditToken:]();
    }
  }
  CFStringRef v7 = 0;
LABEL_11:

  return v7;
}

+ (int)processIdentifierForAuditToken:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_msgSend(a3, "audit_token");
  return audit_token_to_pid(&v4);
}

+ (id)_bundleIdentifierFromInfoPlistForAuditToken:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  pid_t v4 = audit_token_to_pid(v16);
  int v5 = proc_pidpath(v4, v16, 0x1000u);
  if (v5 <= 0)
  {
    v6 = objc_msgSend(a1, "os_log");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[CNAuditTokenUtilities _bundleIdentifierFromInfoPlistForAuditToken:](v4, v6);
    }
    goto LABEL_8;
  }
  v6 = (id) [[NSString alloc] initWithBytes:v16 length:v5 encoding:4];
  if (access((const char *)[v6 UTF8String], 4))
  {
    CFStringRef v7 = objc_msgSend(a1, "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CNAuditTokenUtilities _bundleIdentifierFromInfoPlistForAuditToken:]((uint64_t)v6, v7);
    }

    goto LABEL_8;
  }
  CFURLRef v10 = CFURLCreateWithFileSystemPath(0, (CFStringRef)v6, kCFURLPOSIXPathStyle, 0);
  if (!v10)
  {
LABEL_8:
    id v8 = 0;
    goto LABEL_9;
  }
  CFURLRef v11 = v10;
  CFURLRef v12 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
  if (v12)
  {
    CFURLRef v13 = v12;
    int v14 = CFBundleCreate(0, v12);
    if (v14)
    {
      uint64_t v15 = v14;
      id v8 = CFBundleGetIdentifier(v14);
      CFRelease(v15);
    }
    else
    {
      id v8 = 0;
    }
    CFRelease(v13);
  }
  else
  {
    id v8 = 0;
  }
  CFRelease(v11);
LABEL_9:

  return v8;
}

+ (void)bundleIdentifierForAuditToken:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19091D000, a2, OS_LOG_TYPE_DEBUG, "Looked up bundle ID %@ from audit token using SecTask.", (uint8_t *)&v2, 0xCu);
}

+ (void)bundleIdentifierForAuditToken:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19091D000, a2, OS_LOG_TYPE_DEBUG, "Looked up bundle ID %@ from audit token using Info.plist.", (uint8_t *)&v2, 0xCu);
}

+ (void)bundleIdentifierForAuditToken:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19091D000, v0, v1, "Could not look up bundle identifier using audit token.", v2, v3, v4, v5, v6);
}

+ (void)processNameForAuditToken:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19091D000, v0, v1, "Could not look up process name using audit token.", v2, v3, v4, v5, v6);
}

+ (void)_bundleIdentifierFromSecTaskForAuditToken:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19091D000, v0, v1, "Could not look up SecTaskRef using audit token.", v2, v3, v4, v5, v6);
}

+ (void)_bundleIdentifierFromSecTaskForAuditToken:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19091D000, v0, v1, "Could not look up Entitlement Application Identifier using SecTaskRef.", v2, v3, v4, v5, v6);
}

+ (void)_bundleIdentifierFromSecTaskForAuditToken:(uint64_t *)a1 .cold.3(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19091D000, a2, OS_LOG_TYPE_ERROR, "Could not look up Signing Identifier using SecTaskRef, %@", (uint8_t *)&v3, 0xCu);
}

+ (void)_bundleIdentifierFromInfoPlistForAuditToken:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19091D000, a2, OS_LOG_TYPE_ERROR, "No access to path %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_bundleIdentifierFromInfoPlistForAuditToken:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_19091D000, a2, OS_LOG_TYPE_ERROR, "Could not look up proc_pidpath using pid %d.", (uint8_t *)v2, 8u);
}

@end