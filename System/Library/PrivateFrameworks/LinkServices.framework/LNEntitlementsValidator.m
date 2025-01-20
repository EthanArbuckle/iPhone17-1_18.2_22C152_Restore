@interface LNEntitlementsValidator
+ (BOOL)currentProcessHasMachLookup:(id)a3;
+ (BOOL)validateEntitlement:(id)a3 auditToken:(id *)a4 validator:(id)a5;
+ (BOOL)validateEntitlement:(id)a3 forCurrentTaskWithValidator:(id)a4;
+ (BOOL)validateEntitlement:(id)a3 secTaskRef:(__SecTask *)a4 validator:(id)a5;
+ (NSString)bundleIdentifierForCurrentProcess;
+ (id)bundleIdentifierForAuditToken:(id *)a3;
+ (id)valueForEntitlement:(id)a3 auditToken:(id *)a4;
+ (id)valueForEntitlement:(id)a3 secTaskRef:(__SecTask *)a4;
@end

@implementation LNEntitlementsValidator

+ (BOOL)validateEntitlement:(id)a3 forCurrentTaskWithValidator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  SecTaskRef v8 = SecTaskCreateFromSelf(0);
  if (v8)
  {
    SecTaskRef v9 = v8;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__LNEntitlementsValidator_validateEntitlement_forCurrentTaskWithValidator___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v8;
    uint64_t v10 = (uint64_t)_Block_copy(aBlock);
    char v11 = [a1 validateEntitlement:v6 secTaskRef:v9 validator:v7];
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }
  else
  {
    uint64_t v10 = getLNLogCategorySecurity();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, (os_log_t)v10, OS_LOG_TYPE_FAULT, "SecTaskCreateFromSelf() failed, assuming this task is NOT entitled.", buf, 2u);
    }
    char v11 = 0;
  }

  return v11;
}

void __75__LNEntitlementsValidator_validateEntitlement_forCurrentTaskWithValidator___block_invoke(uint64_t a1)
{
}

+ (BOOL)validateEntitlement:(id)a3 secTaskRef:(__SecTask *)a4 validator:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = (uint64_t (**)(id, void *))a5;
  CFErrorRef error = 0;
  SecTaskRef v8 = (void *)SecTaskCopyValueForEntitlement(a4, (CFStringRef)a3, &error);
  if (error)
  {
    SecTaskRef v9 = getLNLogCategorySecurity();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFErrorRef v14 = error;
      _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_FAULT, "SecTaskCopyValueForEntitlement() failed with error %{public}@", buf, 0xCu);
    }

    CFRelease(error);
    char v10 = 0;
  }
  else
  {
    char v10 = v7[2](v7, v8);
  }

  return v10;
}

+ (BOOL)currentProcessHasMachLookup:(id)a3
{
  id v3 = a3;
  getpid();
  id v4 = v3;
  [v4 UTF8String];

  return sandbox_check() == 0;
}

+ (NSString)bundleIdentifierForCurrentProcess
{
  SecTaskRef v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    id v3 = v2;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__LNEntitlementsValidator_bundleIdentifierForCurrentProcess__block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v2;
    uint64_t v4 = (uint64_t)_Block_copy(aBlock);
    id v7 = 0;
    if (LNCopyBundleIdentifierAndTeamFromSecTaskRef(v3, (uint64_t *)&v7)) {
      v5 = v7;
    }
    else {
      v5 = 0;
    }
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    uint64_t v4 = getLNLogCategorySecurity();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1A4419000, (os_log_t)v4, OS_LOG_TYPE_FAULT, "SecTaskCreateFromSelf() failed, assuming this task is NOT entitled.", (uint8_t *)&v7, 2u);
    }
    v5 = 0;
  }

  return (NSString *)v5;
}

void __60__LNEntitlementsValidator_bundleIdentifierForCurrentProcess__block_invoke(uint64_t a1)
{
}

+ (id)bundleIdentifierForAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v3;
  SecTaskRef v4 = SecTaskCreateWithAuditToken(0, &token);
  if (v4)
  {
    v5 = v4;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__LNEntitlementsValidator_bundleIdentifierForAuditToken___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v4;
    uint64_t v6 = (uint64_t)_Block_copy(aBlock);
    *(void *)token.val = 0;
    if (LNCopyBundleIdentifierAndTeamFromSecTaskRef(v5, (uint64_t *)&token)) {
      id v7 = *(void **)token.val;
    }
    else {
      id v7 = 0;
    }
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
  else
  {
    uint64_t v6 = getLNLogCategorySecurity();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl(&dword_1A4419000, (os_log_t)v6, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed, assuming the task is NOT entitled.", (uint8_t *)&token, 2u);
    }
    id v7 = 0;
  }

  return v7;
}

void __57__LNEntitlementsValidator_bundleIdentifierForAuditToken___block_invoke(uint64_t a1)
{
}

+ (BOOL)validateEntitlement:(id)a3 auditToken:(id *)a4 validator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&token.val[4] = v10;
  SecTaskRef v11 = SecTaskCreateWithAuditToken(0, &token);
  if (v11)
  {
    SecTaskRef v12 = v11;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__LNEntitlementsValidator_validateEntitlement_auditToken_validator___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v11;
    uint64_t v13 = (uint64_t)_Block_copy(aBlock);
    char v14 = [a1 validateEntitlement:v8 secTaskRef:v12 validator:v9];
    (*(void (**)(uint64_t))(v13 + 16))(v13);
  }
  else
  {
    uint64_t v13 = getLNLogCategorySecurity();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl(&dword_1A4419000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed, assuming the task is NOT entitled.", (uint8_t *)&token, 2u);
    }
    char v14 = 0;
  }

  return v14;
}

void __68__LNEntitlementsValidator_validateEntitlement_auditToken_validator___block_invoke(uint64_t a1)
{
}

+ (id)valueForEntitlement:(id)a3 auditToken:(id *)a4
{
  id v6 = a3;
  long long v7 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&token.val[4] = v7;
  SecTaskRef v8 = SecTaskCreateWithAuditToken(0, &token);
  if (v8)
  {
    SecTaskRef v9 = v8;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__LNEntitlementsValidator_valueForEntitlement_auditToken___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v8;
    uint64_t v10 = (uint64_t)_Block_copy(aBlock);
    SecTaskRef v11 = [a1 valueForEntitlement:v6 secTaskRef:v9];
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }
  else
  {
    uint64_t v10 = getLNLogCategorySecurity();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl(&dword_1A4419000, (os_log_t)v10, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed, assuming the task is NOT entitled.", (uint8_t *)&token, 2u);
    }
    SecTaskRef v11 = 0;
  }

  return v11;
}

void __58__LNEntitlementsValidator_valueForEntitlement_auditToken___block_invoke(uint64_t a1)
{
}

+ (id)valueForEntitlement:(id)a3 secTaskRef:(__SecTask *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFErrorRef error = 0;
  SecTaskRef v4 = (void *)SecTaskCopyValueForEntitlement(a4, (CFStringRef)a3, &error);
  v5 = v4;
  if (error)
  {
    id v6 = getLNLogCategorySecurity();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFErrorRef v11 = error;
      _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_FAULT, "SecTaskCopyValueForEntitlement() failed with error %{public}@", buf, 0xCu);
    }

    CFRelease(error);
    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

@end