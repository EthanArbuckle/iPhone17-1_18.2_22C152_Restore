@interface SAEntitlement
+ (BOOL)currentProcessHasEntitlement:(id)a3;
@end

@implementation SAEntitlement

+ (BOOL)currentProcessHasEntitlement:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (v4)
  {
    v5 = v4;
    CFErrorRef error = 0;
    v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v9 = sa_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v13 = v6;
        __int16 v14 = 2112;
        v15 = v3;
        __int16 v16 = 2112;
        CFErrorRef v17 = error;
        _os_log_impl(&dword_245182000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Unexpected value %@ for %@ entitlement: %@", buf, 0x20u);
      }

      char v7 = 0;
    }
    else
    {
      char v7 = [v6 BOOLValue];
    }
    CFRelease(v5);
  }
  else
  {
    v8 = sa_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_245182000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Unexpected NULL value returned from SecTaskCreateFromSelf()", buf, 2u);
    }

    char v7 = 0;
  }

  return v7;
}

@end