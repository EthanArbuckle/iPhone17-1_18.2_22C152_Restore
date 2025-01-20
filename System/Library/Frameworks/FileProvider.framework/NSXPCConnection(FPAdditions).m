@interface NSXPCConnection(FPAdditions)
- (BOOL)fp_hasSandboxAccessToFile:()FPAdditions accessType:logLevel:;
- (NSObject)fp_applicationGroups;
- (id)fp_bundleIdentifier;
- (id)fp_userInfo;
- (uint64_t)fp_hasOneOfEntitlements:()FPAdditions;
- (uint64_t)fp_hasOneOfEntitlements:()FPAdditions logLevel:;
- (uint64_t)fp_hasOneOfEntitlements:()FPAdditions nonSandboxedAccess:logLevel:;
- (uint64_t)fp_hasSandboxAccessToFile:()FPAdditions;
- (uint64_t)fp_hasSandboxAccessToFile:()FPAdditions logLevel:;
- (uint64_t)fp_isNonSandboxedConnection;
- (void)fp_annotateInvocation:()FPAdditions withLogSection:;
- (void)fp_applicationGroups;
- (void)fp_userInfo;
@end

@implementation NSXPCConnection(FPAdditions)

- (uint64_t)fp_hasOneOfEntitlements:()FPAdditions
{
  return objc_msgSend(a1, "fp_hasOneOfEntitlements:logLevel:", a3, 0);
}

- (uint64_t)fp_hasOneOfEntitlements:()FPAdditions logLevel:
{
  return objc_msgSend(a1, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", a3, 1, a4);
}

- (id)fp_userInfo
{
  v2 = [a1 userInfo];
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = [NSString stringWithFormat:@"NSXPCConnection userInfo is wrong type: %@", v2];
      v8 = fp_current_or_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        [(NSXPCConnection(FPAdditions) *)(uint64_t)v7 fp_userInfo];
      }

      __assert_rtn("-[NSXPCConnection(FPAdditions) fp_userInfo]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/NSXPCConnection+FPAdditions.m", 291, (const char *)[v7 UTF8String]);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = [v2 mutableCopy];
    }
    else {
      uint64_t v3 = objc_opt_new();
    }
    v4 = (void *)v3;

    [a1 setUserInfo:v4];
    v2 = v4;
  }
  id v5 = v2;

  return v5;
}

- (void)fp_annotateInvocation:()FPAdditions withLogSection:
{
  id v5 = a3;
  v6 = [v5 methodSignature];
  uint64_t v7 = objc_msgSend(v6, "fp_indexOfLastArgumentWithType:", "@?");
  v8 = (const char *)[v5 selector];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[NSXPCConnection(FPAdditions) fp_annotateInvocation:withLogSection:](v8, a4, v9);
    }
  }
  else
  {
    uint64_t v24 = 0;
    [v5 getArgument:&v24 atIndex:v7];
    v10 = (void *)MEMORY[0x1A6248B00](v24);
    _Block_signature(v10);
    v11 = fp_current_or_default_log();
    uint64_t v18 = 0;
    v19 = (id *)&v18;
    uint64_t v20 = 0x3042000000;
    v21 = __Block_byref_object_copy__23;
    v22 = __Block_byref_object_dispose__23;
    id v23 = 0;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    id v15 = v11;
    id v16 = v10;
    id obj = (id)__NSMakeSpecialForwardingCaptureBlock();
    objc_msgSend(v5, "_addAttachedObject:", obj, v14, 3221225472, __69__NSXPCConnection_FPAdditions__fp_annotateInvocation_withLogSection___block_invoke, &unk_1E5AF5048);
    [v5 setArgument:&obj atIndex:v7];
    objc_storeWeak(v19 + 5, obj);
    id WeakRetained = objc_loadWeakRetained(v19 + 5);
    v13 = [NSNumber numberWithUnsignedLongLong:a4];
    objc_setAssociatedObject(WeakRetained, &kFileProviderLogSectionKey, v13, (void *)0x301);

    _Block_object_dispose(&v18, 8);
    objc_destroyWeak(&v23);
  }
}

- (uint64_t)fp_hasOneOfEntitlements:()FPAdditions nonSandboxedAccess:logLevel:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = a3;
  uint64_t v8 = [(__CFString *)v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(a1, "fp_valueForEntitlement:", *(void *)(*((void *)&v19 + 1) + 8 * v11), (void)v19);
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && ([v12 BOOLValue])
          {
            uint64_t v14 = 1;
            v13 = v7;
            goto LABEL_26;
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(__CFString *)v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  objc_msgSend(a1, "fp_valueForEntitlement:", @"com.apple.internal.fileprovider.debug");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(__CFString *)v13 BOOLValue])
      {
        if (!a5)
        {
          uint64_t v14 = 1;
          goto LABEL_27;
        }
        if (a5 == 2)
        {
          [a1 processIdentifier];
          v12 = FPExecutableNameForProcessIdentifier();
        }
        else
        {
          v12 = @"<restricted>";
        }
        id v16 = fp_current_or_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = [a1 processIdentifier];
          *(_DWORD *)buf = 67109634;
          int v24 = v17;
          __int16 v25 = 2112;
          v26 = v12;
          __int16 v27 = 2112;
          v28 = @"com.apple.internal.fileprovider.debug";
          _os_log_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] Allowing request from PID %d (%@) because it has the %@ entitlement.", buf, 0x1Cu);
        }

        uint64_t v14 = 1;
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
    }
  }

  if (a5)
  {
    if (a5 == 2)
    {
      [a1 processIdentifier];
      FPExecutableNameForProcessIdentifier();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = @"<restricted>";
    }
    v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v18 = [a1 processIdentifier];
      *(_DWORD *)buf = 67109634;
      int v24 = v18;
      __int16 v25 = 2112;
      v26 = v13;
      __int16 v27 = 2112;
      v28 = v7;
      _os_log_error_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_ERROR, "[ERROR] Rejecting request from PID %d (%@) because it does not have any of these entitlements: %@", buf, 0x1Cu);
    }
    uint64_t v14 = 0;
    goto LABEL_26;
  }
  uint64_t v14 = 0;
LABEL_28:

  return v14;
}

- (NSObject)fp_applicationGroups
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v1 = [a1 valueForEntitlement:@"com.apple.security.application-groups"];
  if (!v1)
  {
LABEL_18:
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[NSXPCConnection(FPAdditions) fp_applicationGroups]();
    }
LABEL_17:

    goto LABEL_18;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v8 = fp_current_or_default_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            -[NSXPCConnection(FPAdditions) fp_applicationGroups]();
          }

          goto LABEL_17;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  uint64_t v7 = v2;
LABEL_19:

  return v7;
}

- (id)fp_bundleIdentifier
{
  v2 = [a1 valueForEntitlement:@"application-identifier"];
  uint64_t v3 = v2;
  if (!v2 || (FPAppIdentifierFromTeamAppTuple(v2), (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F223F8];
    [a1 auditToken];
    v6 = [v5 bundleRecordForAuditToken:&v8 error:0];
    uint64_t v4 = [v6 bundleIdentifier];
  }

  return v4;
}

- (BOOL)fp_hasSandboxAccessToFile:()FPAdditions accessType:logLevel:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v50 = 0u;
  long long v51 = 0u;
  [a1 auditToken];
  int v9 = *MEMORY[0x1E4F14100] | 1;
  id v10 = v8;
  long long v11 = (const char *)[v10 fileSystemRepresentation];
  memset(buf, 0, 32);
  if (fpfs_lp_sandbox_check_by_audit_token(buf, a4, v9, v11))
  {
    id v49 = 0;
    int v12 = [v10 checkResourceIsReachableAndReturnError:&v49];
    long long v13 = (__CFString *)v49;
    if (v12)
    {
      id v48 = 0;
      int v14 = [v10 getResourceValue:&v48 forKey:*MEMORY[0x1E4F1C680] error:0];
      uint64_t v15 = v48;
      id v16 = v15;
      if (!v14) {
        goto LABEL_6;
      }
      if (![v15 BOOLValue]) {
        goto LABEL_6;
      }
      int v17 = [v10 path];
      id v18 = [v17 stringByDeletingLastPathComponent];
      long long v19 = (const char *)[v18 fileSystemRepresentation];
      *(_OWORD *)buf = v50;
      *(_OWORD *)&buf[16] = v51;
      int v20 = fpfs_lp_sandbox_check_by_audit_token(buf, a4, v9, v19);

      if (v20)
      {
LABEL_6:
        if (a5)
        {
          if (a5 == 2)
          {
            [a1 processIdentifier];
            FPExecutableNameForProcessIdentifier();
            long long v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            long long v21 = @"<restricted>";
          }
          v29 = fp_current_or_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            int v39 = [a1 processIdentifier];
            v40 = objc_msgSend(v10, "fp_shortDescription");
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&uint8_t buf[4] = v39;
            *(_WORD *)&buf[8] = 2112;
            *(void *)&buf[10] = v21;
            *(_WORD *)&buf[18] = 2112;
            *(void *)&buf[20] = v40;
            _os_log_debug_impl(&dword_1A33AE000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) doesn't have sandbox access to \"%@\"", buf, 0x1Cu);
          }
          BOOL v26 = 0;
          goto LABEL_66;
        }
        BOOL v26 = 0;
LABEL_67:

        goto LABEL_68;
      }
      if (a5)
      {
        if (a5 == 2)
        {
          [a1 processIdentifier];
          FPExecutableNameForProcessIdentifier();
          long long v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          long long v21 = @"<restricted>";
        }
        v29 = fp_current_or_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          int v43 = [a1 processIdentifier];
          v44 = objc_msgSend(v10, "fp_shortDescription");
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&uint8_t buf[4] = v43;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v21;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v44;
          _os_log_debug_impl(&dword_1A33AE000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) has sandbox access to the parent path of \"%@\"", buf, 0x1Cu);
        }
        BOOL v26 = 1;
        goto LABEL_66;
      }
LABEL_23:
      BOOL v26 = 1;
      goto LABEL_67;
    }
    if (!_CFURLIsItemPromiseAtURL())
    {
      long long v22 = (void *)_CFURLCopyPromiseURLOfLogicalURL();
      id v23 = v22;
      if (v22)
      {
        id v16 = v22;
        int v24 = (const char *)[v16 fileSystemRepresentation];
        *(_OWORD *)buf = v50;
        *(_OWORD *)&buf[16] = v51;
        int v25 = fpfs_lp_sandbox_check_by_audit_token(buf, a4, v9, v24);
        BOOL v26 = v25 == 0;
        if (!v25)
        {
          if (!a5) {
            goto LABEL_67;
          }
          if (a5 == 2)
          {
            [a1 processIdentifier];
            FPExecutableNameForProcessIdentifier();
            long long v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            long long v21 = @"<restricted>";
          }
          v29 = fp_current_or_default_log();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_66;
          }
          int v41 = [a1 processIdentifier];
          v34 = objc_msgSend(v10, "fp_shortDescription");
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&uint8_t buf[4] = v41;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v21;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v34;
          v35 = "[DEBUG] PID %d (%@) has sandbox access to the promise of \"%@\"";
LABEL_60:
          _os_log_debug_impl(&dword_1A33AE000, v29, OS_LOG_TYPE_DEBUG, v35, buf, 0x1Cu);

LABEL_66:
          goto LABEL_67;
        }
        v47 = v13;
        int v27 = [v16 checkResourceIsReachableAndReturnError:&v47];
        v28 = v47;

        if (v27)
        {
          if (a5)
          {
            if (a5 == 2)
            {
              [a1 processIdentifier];
              FPExecutableNameForProcessIdentifier();
              long long v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              long long v21 = @"<restricted>";
            }
            v29 = fp_current_or_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              int v45 = [a1 processIdentifier];
              v46 = objc_msgSend(v10, "fp_shortDescription");
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&uint8_t buf[4] = v45;
              *(_WORD *)&buf[8] = 2112;
              *(void *)&buf[10] = v21;
              *(_WORD *)&buf[18] = 2112;
              *(void *)&buf[20] = v46;
              _os_log_debug_impl(&dword_1A33AE000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) doesn't have sandbox access to \"%@\" or its fault", buf, 0x1Cu);
            }
            long long v13 = v28;
            goto LABEL_66;
          }
          long long v13 = v28;
          goto LABEL_67;
        }
        long long v13 = v28;
      }
      else
      {
        uint64_t v30 = fp_current_or_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[NSXPCConnection(FPAdditions) fp_hasSandboxAccessToFile:accessType:logLevel:]((uint64_t)v10, v30);
        }
      }
    }
    id v16 = [v10 URLByDeletingLastPathComponent];
    v31 = (const char *)[v16 fileSystemRepresentation];
    *(_OWORD *)buf = v50;
    *(_OWORD *)&buf[16] = v51;
    int v32 = fpfs_lp_sandbox_check_by_audit_token(buf, (uint64_t)"file-write-data", v9, v31);
    BOOL v26 = v32 == 0;
    if (v32)
    {
      if (!a5) {
        goto LABEL_67;
      }
      if (a5 == 2)
      {
        [a1 processIdentifier];
        FPExecutableNameForProcessIdentifier();
        long long v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v21 = @"<restricted>";
      }
      v29 = fp_current_or_default_log();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_66;
      }
      int v33 = [a1 processIdentifier];
      v34 = objc_msgSend(v10, "fp_shortDescription");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v21;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v34;
      v35 = "[DEBUG] PID %d (%@) doesn't have sandbox access to \"%@\" or its fault";
    }
    else
    {
      if (!a5) {
        goto LABEL_67;
      }
      if (a5 == 2)
      {
        [a1 processIdentifier];
        FPExecutableNameForProcessIdentifier();
        long long v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v21 = @"<restricted>";
      }
      v29 = fp_current_or_default_log();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_66;
      }
      int v36 = [a1 processIdentifier];
      v34 = objc_msgSend(v10, "fp_shortDescription");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v21;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v34;
      v35 = "[DEBUG] PID %d (%@) has sandbox access to non-existent \"%@\"";
    }
    goto LABEL_60;
  }
  if (a5)
  {
    if (a5 == 2)
    {
      [a1 processIdentifier];
      FPExecutableNameForProcessIdentifier();
      long long v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v13 = @"<restricted>";
    }
    id v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v37 = [a1 processIdentifier];
      v38 = objc_msgSend(v10, "fp_shortDescription");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v37;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v13;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v38;
      _os_log_debug_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) has sandbox access to \"%@\"", buf, 0x1Cu);
    }
    goto LABEL_23;
  }
  BOOL v26 = 1;
LABEL_68:

  return v26;
}

- (uint64_t)fp_hasSandboxAccessToFile:()FPAdditions
{
  return objc_msgSend(a1, "fp_hasSandboxAccessToFile:logLevel:", a3, 0);
}

- (uint64_t)fp_hasSandboxAccessToFile:()FPAdditions logLevel:
{
  return objc_msgSend(a1, "fp_hasSandboxAccessToFile:accessType:logLevel:", a3, "file-write-data", a4);
}

- (uint64_t)fp_isNonSandboxedConnection
{
  return 0;
}

- (void)fp_hasSandboxAccessToFile:()FPAdditions accessType:logLevel:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] can't create physical URL from \"%@\"", (uint8_t *)&v2, 0xCu);
}

- (void)fp_applicationGroups
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412546;
  int v2 = @"com.apple.security.application-groups";
  OUTLINED_FUNCTION_16();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] malformed %@ entitlement on %@", (uint8_t *)&v1, 0x16u);
}

- (void)fp_userInfo
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)fp_annotateInvocation:()FPAdditions withLogSection:.cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  int v6 = 134218242;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_16();
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc to %@ without reply", (uint8_t *)&v6, 0x16u);
}

@end