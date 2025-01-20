@interface SKEntitlementChecker
+ (BOOL)checkForEntitlement:(id)a3;
+ (BOOL)isProcessEntitled:(id *)a3 entitlementName:(__CFString *)a4;
@end

@implementation SKEntitlementChecker

+ (BOOL)checkForEntitlement:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf(0);
  if (v4)
  {
    v5 = v4;
    CFErrorRef error = 0;
    CFBooleanRef v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (v6)
    {
      CFBooleanRef v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
      CFRelease(v7);
    }
    else
    {
      BOOL v9 = 0;
    }
    if (error) {
      CFRelease(error);
    }
    CFRelease(v5);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)isProcessEntitled:(id *)a3 entitlementName:(__CFString *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  CFBooleanRef v6 = SecTaskCreateWithAuditToken(0, &token);
  if (!v6) {
    return 0;
  }
  CFBooleanRef v7 = v6;
  CFErrorRef error = 0;
  CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, a4, &error);
  if (error)
  {
    BOOL v9 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    v12 = [v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      token.val[0] = 138412290;
      *(void *)&token.val[1] = error;
      LODWORD(v18) = 12;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        CFRelease(error);
        goto LABEL_14;
      }
      v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &token, v18);
      free(v14);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (v8)
  {
    CFTypeID v15 = CFGetTypeID(v8);
    BOOL v16 = v15 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v8) != 0;
    CFRelease(v8);
  }
  else
  {
    BOOL v16 = 0;
  }
  CFRelease(v7);
  return v16;
}

@end