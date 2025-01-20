@interface SOUtils
+ (BOOL)auditTokenFromData:(id)a3 auditToken:(id *)a4;
+ (BOOL)checkEntitlementFromXPC:(id)a3 entitlement:(id)a4;
+ (BOOL)checkSignatureOfFile:(id)a3 teamIdentifier:(id *)a4 trusted:(BOOL *)a5 signedBySet:(int64_t *)a6 certificates:(id *)a7 error:(id *)a8;
+ (BOOL)currentProcessIsSandboxed;
+ (BOOL)isAppSSOServiceAvailable;
+ (BOOL)isInternalBuild;
+ (BOOL)sandboxAllowsXPC:(const char *)a3;
+ (id)bundleIdentifierFromAuditToken:(id *)a3;
+ (id)currentProcessContainerPath;
+ (id)currentProcessName;
+ (id)mapArray:(id)a3 usingBlock:(id)a4;
+ (id)processNameForPID:(int)a3;
+ (id)signatureSetToString:(int64_t)a3;
+ (id)teamIdentifierFromAuditToken:(id *)a3;
+ (int)mmapFile:(id)a3 mode:(int64_t)a4 mmapData:(id *)a5;
+ (int)pidFromAuditToken:(id *)a3;
+ (void)currentProcessIsSandboxed;
+ (void)unmapFile:(int)a3 data:(id)a4;
@end

@implementation SOUtils

void __35__SOUtils_isAppSSOServiceAvailable__block_invoke()
{
  kern_return_t v0;
  BOOL v1;
  kern_return_t v2;
  NSObject *v3;
  mach_port_t sp;

  sp = 0;
  v0 = bootstrap_look_up(*MEMORY[0x1E4F14638], (const char *)[@"com.apple.AppSSO.service-xpc" UTF8String], &sp);
  if (v0) {
    v1 = 1;
  }
  else {
    v1 = sp == 0;
  }
  if (v1)
  {
    if ((isAppSSOServiceAvailable_appSSOServiceAvailable & 1) == 0)
    {
      v2 = v0;
      v3 = SO_LOG_SOUtils();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        __35__SOUtils_isAppSSOServiceAvailable__block_invoke_cold_1(v2, v3);
      }
    }
  }
  else
  {
    mach_port_deallocate(*MEMORY[0x1E4F14960], sp);
    isAppSSOServiceAvailable_appSSOServiceAvailable = 1;
  }
}

+ (BOOL)isAppSSOServiceAvailable
{
  if (isAppSSOServiceAvailable_onceToken != -1) {
    dispatch_once(&isAppSSOServiceAvailable_onceToken, &__block_literal_global_9);
  }
  return isAppSSOServiceAvailable_appSSOServiceAvailable;
}

+ (BOOL)sandboxAllowsXPC:(const char *)a3
{
  if (a3)
  {
    getpid();
    BOOL v4 = sandbox_check() == 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  v5 = SO_LOG_SOUtils();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[SOUtils sandboxAllowsXPC:v5];
  }

  return v4;
}

+ (id)processNameForPID:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v4 = buffer;
  bzero(buffer, 0x400uLL);
  unsigned int v5 = proc_name(a3, buffer, 0x400u);
  if ((v5 & 0x80000000) == 0)
  {
    buffer[v5] = 0;
    if (v5 >= 0xF)
    {
      BOOL v4 = buffer;
      int v6 = proc_pidpath(a3, buffer, 0x400u);
      if ((v6 & 0x80000000) == 0)
      {
        buffer[v6] = 0;
        v7 = strrchr(buffer, 47);
        if (v7) {
          BOOL v4 = v7 + 1;
        }
      }
    }
  }
  v8 = [NSString stringWithUTF8String:v4];
  return v8;
}

+ (id)currentProcessName
{
  uint64_t v3 = getpid();
  return (id)[a1 processNameForPID:v3];
}

+ (BOOL)currentProcessIsSandboxed
{
  getpid();
  int v2 = sandbox_check();
  uint64_t v3 = SO_LOG_SOUtils();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[SOUtils currentProcessIsSandboxed];
  }

  return v2 != 0;
}

void __38__SOUtils_currentProcessContainerPath__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  getpid();
  if (sandbox_container_path_for_pid())
  {
    if (*__error() == 45) {
      goto LABEL_7;
    }
    v0 = SO_LOG_SOUtils();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __38__SOUtils_currentProcessContainerPath__block_invoke_cold_2();
    }
  }
  else
  {
    uint64_t v1 = [NSString stringWithUTF8String:v10];
    v0 = currentProcessContainerPath_containerPath;
    currentProcessContainerPath_containerPath = v1;
  }

LABEL_7:
  int v2 = SO_LOG_SOUtils();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __38__SOUtils_currentProcessContainerPath__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (id)currentProcessContainerPath
{
  if (currentProcessContainerPath_onceToken != -1) {
    dispatch_once(&currentProcessContainerPath_onceToken, &__block_literal_global_5);
  }
  int v2 = (void *)currentProcessContainerPath_containerPath;
  return v2;
}

+ (int)mmapFile:(id)a3 mode:(int64_t)a4 mmapData:(id *)a5
{
  id v7 = a3;
  *__error() = 0;
  if (a4 == 1) {
    int v8 = 514;
  }
  else {
    int v8 = 0;
  }
  id v9 = v7;
  int v10 = shm_open((const char *)[v9 UTF8String], v8, 511);
  if (v10 == -1)
  {
    v14 = SO_LOG_SOUtils();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[SOUtils mmapFile:mode:mmapData:]();
    }
    goto LABEL_15;
  }
  int v11 = v10;
  if (a4 == 1) {
    int v12 = 3;
  }
  else {
    int v12 = 1;
  }
  ftruncate(v10, 4);
  v13 = mmap(0, 4uLL, v12, 1, v11, 0);
  if (v13 == (void *)-1)
  {
    close(v11);
    v14 = SO_LOG_SOUtils();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[SOUtils mmapFile:mode:mmapData:]();
    }
LABEL_15:

    int v11 = -1;
    goto LABEL_16;
  }
  if (a5)
  {
    *a5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v13 length:4 freeWhenDone:0];
  }
LABEL_16:

  return v11;
}

+ (void)unmapFile:(int)a3 data:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)[v5 bytes];
  size_t v7 = [v5 length];

  if (munmap(v6, v7) == -1)
  {
    int v8 = SO_LOG_SOUtils();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SOUtils unmapFile:data:]();
    }
  }
  if (close(a3) == -1)
  {
    id v9 = SO_LOG_SOUtils();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[SOUtils unmapFile:data:]();
    }
  }
}

+ (BOOL)checkEntitlementFromXPC:(id)a3 entitlement:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    size_t v7 = [v5 valueForEntitlement:v6];
    int v8 = [v7 BOOLValue];
  }
  else
  {
    int v8 = 0;
  }
  id v9 = SO_LOG_SOUtils();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138543874;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    __int16 v15 = 1024;
    int v16 = v8;
    _os_log_debug_impl(&dword_1D7206000, v9, OS_LOG_TYPE_DEBUG, "checkEntitlementFromXPC: %{public}@, %{public}@ = %d", (uint8_t *)&v11, 0x1Cu);
  }

  return v8;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_6);
  }
  return isInternalBuild_internalBuild;
}

void __26__SOUtils_isInternalBuild__block_invoke()
{
  isInternalBuild_internalBuild = os_variant_has_internal_content();
  v0 = SO_LOG_SOUtils();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __26__SOUtils_isInternalBuild__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

+ (id)mapArray:(id)a3 usingBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = v6[2](v6, *(void *)(*((void *)&v15 + 1) + 8 * i));
        objc_msgSend(v7, "addObject:", v13, (void)v15);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (BOOL)auditTokenFromData:(id)a3 auditToken:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  if ([v5 length] != 32)
  {
    uint64_t v10 = SO_LOG_SOUtils();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SOUtils auditTokenFromData:auditToken:](v6, v10);
    }

    goto LABEL_9;
  }
  if (a4)
  {
    uint64_t v7 = (_OWORD *)[v6 bytes];
    long long v8 = v7[1];
    *(_OWORD *)a4->var0 = *v7;
    *(_OWORD *)&a4->var0[4] = v8;
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

+ (int)pidFromAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v5.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v5.val[4] = v3;
  return audit_token_to_pid(&v5);
}

+ (id)bundleIdentifierFromAuditToken:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf.val[4] = v4;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    audit_token_t v5 = v20;
    uint64_t v6 = SO_LOG_SOUtils();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[SOUtils bundleIdentifierFromAuditToken:]((uint64_t)v20, v6, v7, v8, v9, v10, v11, v12);
    }
LABEL_4:

    goto LABEL_18;
  }
  __int16 v13 = SO_LOG_SOUtils();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.val[0]) = 0;
    _os_log_impl(&dword_1D7206000, v13, OS_LOG_TYPE_DEFAULT, "bundleIdentifier: CPCopyBundleIdentifierAndTeamFromAuditToken() failed, trying SecTaskCopySigningIdentifier()", (uint8_t *)&buf, 2u);
  }

  long long v14 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf.val[4] = v14;
  long long v15 = SecTaskCreateWithAuditToken(0, &buf);
  if (v15)
  {
    long long v16 = v15;
    CFTypeRef cf = 0;
    audit_token_t v5 = SecTaskCopySigningIdentifier(v15, (CFErrorRef *)&cf);
    CFRelease(v16);
    if (cf)
    {
      long long v17 = SO_LOG_SOUtils();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        buf.val[0] = 138543362;
        *(void *)&buf.val[1] = cf;
        _os_log_impl(&dword_1D7206000, v17, OS_LOG_TYPE_INFO, "bundleIdentifier: SecTaskCopySigningIdentifier() failed %{public}@", (uint8_t *)&buf, 0xCu);
      }

      CFRelease(cf);
    }
    else if (v5)
    {
      uint64_t v6 = SO_LOG_SOUtils();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        buf.val[0] = 138543362;
        *(void *)&buf.val[1] = v5;
        _os_log_impl(&dword_1D7206000, v6, OS_LOG_TYPE_INFO, "bundleIdentifier: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_4;
    }
  }
  else
  {
    audit_token_t v5 = SO_LOG_SOUtils();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.val[0]) = 0;
      _os_log_impl(&dword_1D7206000, v5, OS_LOG_TYPE_INFO, "bundleIdentifier: SecTaskCreateWithAuditToken() failed", (uint8_t *)&buf, 2u);
    }
  }

  audit_token_t v5 = 0;
LABEL_18:
  return v5;
}

+ (id)signatureSetToString:(int64_t)a3
{
  char v3 = a3;
  long long v4 = [MEMORY[0x1E4F28E78] string];
  audit_token_t v5 = v4;
  if (v3)
  {
    [v4 appendString:@"by apple, "];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 appendString:@"by mac app store, "];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v5 appendString:@"by identified developer, "];
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v5 appendString:@"by distribution certificate, "];
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  [v5 appendString:@"by iphone distribution certificate, "];
  if ((v3 & 0x20) != 0) {
LABEL_7:
  }
    [v5 appendString:@"by word wide developer certificate, "];
LABEL_8:
  return v5;
}

+ (BOOL)checkSignatureOfFile:(id)a3 teamIdentifier:(id *)a4 trusted:(BOOL *)a5 signedBySet:(int64_t *)a6 certificates:(id *)a7 error:(id *)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  long long v15 = SO_LOG_SOUtils();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)audit_token_t buf = 136315650;
    *(void *)&buf[4] = "+[SOUtils checkSignatureOfFile:teamIdentifier:trusted:signedBySet:certificates:error:]";
    __int16 v31 = 2114;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = a1;
    _os_log_impl(&dword_1D7206000, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", buf, 0x20u);
  }

  CFDictionaryRef information = 0;
  *(void *)audit_token_t buf = 0;
  CFTypeRef cf = 0;
  if (!v14)
  {
    if (a8)
    {
      +[SOErrorHelper parameterErrorWithMessage:@"no file"];
      CFDictionaryRef v18 = 0;
      CFURLRef v16 = 0;
      BOOL v19 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFDictionaryRef v18 = 0;
      CFURLRef v16 = 0;
      BOOL v19 = 0;
    }
    goto LABEL_25;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  CFURLRef v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
  uint64_t v17 = SecStaticCodeCreateWithPath(v16, 0, (SecStaticCodeRef *)buf);
  if (v17)
  {
    if (a8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"SecStaticCodeCreateWithPathAndAttributes() failed with %d", v17);
      v21 = LABEL_18:;
      *a8 = +[SOErrorHelper internalErrorWithMessage:v21];
    }
  }
  else
  {
    uint64_t v20 = SecCodeCopySigningInformation(*(SecStaticCodeRef *)buf, 2u, &information);
    if (!v20)
    {
      CFDictionaryRef v18 = information;
      CFDictionaryRef information = 0;
      if (a4)
      {
        *a4 = [(__CFDictionary *)v18 objectForKeyedSubscript:*MEMORY[0x1E4F3B9C0]];
      }
      if (a7)
      {
        *a7 = [(__CFDictionary *)v18 objectForKeyedSubscript:*MEMORY[0x1E4F3B9A8]];
      }
      if (a6)
      {
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 1, (uint64_t)a8)) {
          *a6 |= 1uLL;
        }
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 2, (uint64_t)a8)) {
          *a6 |= 2uLL;
        }
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 4, (uint64_t)a8)) {
          *a6 |= 4uLL;
        }
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 8, (uint64_t)a8)) {
          *a6 |= 8uLL;
        }
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 16, (uint64_t)a8)) {
          *a6 |= 4uLL;
        }
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 32, (uint64_t)a8)) {
          *a6 |= 0x20uLL;
        }
      }
      v24 = [(__CFDictionary *)v18 objectForKeyedSubscript:*MEMORY[0x1E4F3B9C8]];

      if (v24)
      {
        BOOL v25 = SecTrustEvaluateWithError((SecTrustRef)v24, (CFErrorRef *)&cf);
        CFTypeRef v22 = cf;
        if (a8 && cf)
        {
          v26 = [NSString stringWithFormat:@"SecTrustEvaluateWithError(), trust: %@ failed with %@", v24, cf];
          *a8 = +[SOErrorHelper internalErrorWithMessage:v26];

          CFTypeRef v22 = cf;
        }
        BOOL v19 = v22 == 0;
      }
      else if (a8)
      {
        id v27 = +[SOErrorHelper internalErrorWithMessage:@"no kSecCodeInfoTrust in signing information"];
        CFTypeRef v22 = 0;
        BOOL v25 = 0;
        BOOL v19 = 0;
        *a8 = v27;
      }
      else
      {
        CFTypeRef v22 = 0;
        BOOL v25 = 0;
        BOOL v19 = 0;
      }
      if (a5) {
        *a5 = v25;
      }
      goto LABEL_20;
    }
    if (a8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"SecCodeCopySigningInformation() failed with %d", v20);
      goto LABEL_18;
    }
  }
  CFTypeRef v22 = 0;
  CFDictionaryRef v18 = 0;
  BOOL v19 = 0;
LABEL_20:
  if (*(void *)buf)
  {
    CFRelease(*(CFTypeRef *)buf);
    CFTypeRef v22 = cf;
  }
  if (v22) {
    CFRelease(v22);
  }
LABEL_25:

  return v19;
}

+ (id)teamIdentifierFromAuditToken:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf.val[4] = v4;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    audit_token_t v5 = 0;
    uint64_t v6 = SO_LOG_SOUtils();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      buf.val[0] = 138543618;
      *(void *)&buf.val[1] = 0;
      LOWORD(buf.val[3]) = 2114;
      *(void *)((char *)&buf.val[3] + 2) = 0;
      _os_log_impl(&dword_1D7206000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ teamIdentifier: %{public}@", (uint8_t *)&buf, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = SO_LOG_SOUtils();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[SOUtils teamIdentifierFromAuditToken:](v8);
    }

    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    long long v10 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf.val[4] = v10;
    SecTaskRef v11 = SecTaskCreateWithAuditToken(v9, &buf);
    if (v11)
    {
      SecTaskRef v12 = v11;
      audit_token_t v5 = (void *)SecTaskCopyTeamIdentifier();
      __int16 v13 = SO_LOG_SOUtils();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        buf.val[0] = 138543618;
        *(void *)&buf.val[1] = v5;
        LOWORD(buf.val[3]) = 2114;
        *(void *)((char *)&buf.val[3] + 2) = 0;
        _os_log_impl(&dword_1D7206000, v13, OS_LOG_TYPE_DEFAULT, "teamIdentifier: %{public}@, error: %{public}@", (uint8_t *)&buf, 0x16u);
      }

      CFRelease(v12);
    }
    else
    {
      id v14 = SO_LOG_SOUtils();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[SOUtils teamIdentifierFromAuditToken:](v14);
      }

      audit_token_t v5 = 0;
    }
  }
  return v5;
}

+ (void)mmapFile:mode:mmapData:.cold.1()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_1D7206000, v1, v2, "shm_open(%@) failed[%d]: %{public}s", v3, v4, v5, v6, v7);
}

+ (void)mmapFile:mode:mmapData:.cold.2()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_1D7206000, v1, v2, "mmap(%@) failed[%d] %{public}s", v3, v4, v5, v6, v7);
}

+ (void)unmapFile:data:.cold.1()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1D7206000, v1, v2, "close() failed[%d]: %{public}s", v3, v4, v5, v6, v7);
}

+ (void)unmapFile:data:.cold.2()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1D7206000, v1, v2, "munmap() failed[%d]: %{public}s", v3, v4, v5, v6, v7);
}

+ (void)currentProcessIsSandboxed
{
}

+ (void)sandboxAllowsXPC:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = "YES";
  if ((a2 & 1) == 0) {
    uint64_t v3 = "NO";
  }
  int v4 = 136446466;
  uint64_t v5 = a1;
  __int16 v6 = 2082;
  uint8_t v7 = v3;
  _os_log_debug_impl(&dword_1D7206000, log, OS_LOG_TYPE_DEBUG, "sandboxAllowsXPC(): '%{public}s' allowed = %{public}s", (uint8_t *)&v4, 0x16u);
}

void __38__SOUtils_currentProcessContainerPath__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __38__SOUtils_currentProcessContainerPath__block_invoke_cold_2()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1D7206000, v1, v2, "currentProcessContainerPath(): failed to get container path: #%d: %{public}s\n", v3, v4, v5, v6, v7);
}

void __26__SOUtils_isInternalBuild__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1D7206000, a1, a3, "isInternalBuild=%{public}s", a5, a6, a7, a8, 2u);
}

void __35__SOUtils_isAppSSOServiceAvailable__block_invoke_cold_1(kern_return_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = @"com.apple.AppSSO.service-xpc";
  __int16 v5 = 2082;
  uint64_t v6 = bootstrap_strerror(a1);
  _os_log_debug_impl(&dword_1D7206000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ is not available (%{public}s)", (uint8_t *)&v3, 0x16u);
}

+ (void)auditTokenFromData:(void *)a1 auditToken:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109120;
  v3[1] = [a1 length];
  _os_log_error_impl(&dword_1D7206000, a2, OS_LOG_TYPE_ERROR, "unexpected size of auditToken: %u", (uint8_t *)v3, 8u);
}

+ (void)bundleIdentifierFromAuditToken:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)teamIdentifierFromAuditToken:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D7206000, log, OS_LOG_TYPE_ERROR, "teamIdentifier: SecTaskCreateWithAuditToken() failed", v1, 2u);
}

+ (void)teamIdentifierFromAuditToken:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D7206000, log, OS_LOG_TYPE_DEBUG, "teamIdentifier: CPCopyBundleIdentifierAndTeamFromAuditToken() failed, trying SecTaskCopyTeamIdentifier()", v1, 2u);
}

@end