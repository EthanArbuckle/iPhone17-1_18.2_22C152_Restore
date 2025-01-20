@interface LAACLBuilder
+ (id)customACL:(id)a3;
+ (id)denyAllACL;
@end

@implementation LAACLBuilder

+ (id)customACL:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CFErrorRef error = 0;
  if ([v3 authType] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __26__LAACLBuilder_customACL___block_invoke;
    v56[3] = &unk_1E63C4778;
    v7 = v3;
    v57 = v7;
    SecAccessControlCreateFlags v8 = __26__LAACLBuilder_customACL___block_invoke((uint64_t)v56);
    int v9 = v8;
    SecAccessControlRef v10 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E4F3B5B8], v8, &error);
    if (!v10)
    {
      v12 = LA_LOG_1();
      os_log_type_t v40 = LALogTypeForInternalError();
      if (os_log_type_enabled(v12, v40))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v9;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = error;
        _os_log_impl(&dword_1BED06000, v12, v40, "Could not initialize ACL (flags=%d) (%{public}@)", buf, 0x12u);
      }
      v6 = 0;
      goto LABEL_45;
    }
    SecAccessControlRef v11 = v10;
    id v46 = v3;
    v12 = objc_opt_new();
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v13 = [v7 credentials];
    v14 = [v13 allKeys];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v64 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v53 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v20 = [v7 credentials];
          v21 = [v20 objectForKeyedSubscript:v19];

          -[NSObject setCredential:type:](v12, "setCredential:type:", v21, [v19 integerValue]);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v52 objects:v64 count:16];
      }
      while (v16);
    }

    v62 = &unk_1F19EC718;
    uint64_t v63 = MEMORY[0x1E4F1CC38];
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    id obj = error;
    id v23 = (id)[v12 evaluateAccessControl:v11 operation:2 options:v22 error:&obj];
    objc_storeStrong((id *)&error, obj);

    v24 = +[LASecAccessControl constraintsFromACL:v11];
    int RequirePassword = SecAccessControlGetRequirePassword();
    CFRelease(v11);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v25 = [v24 allKeys];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v61 count:16];
    if (!v26)
    {
LABEL_21:

LABEL_32:
      v33 = LA_LOG_1();
      os_log_type_t v39 = LALogTypeForInternalError();
      if (os_log_type_enabled(v33, v39))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v24;
        _os_log_impl(&dword_1BED06000, v33, v39, "Could not derive auth constraints (%{public}@)", buf, 0xCu);
      }
      goto LABEL_43;
    }
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v48;
LABEL_15:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v48 != v28) {
        objc_enumerationMutation(v25);
      }
      uint64_t v30 = *(void *)(*((void *)&v47 + 1) + 8 * v29);
      v31 = [v24 objectForKeyedSubscript:v30];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      if (v27 == ++v29)
      {
        uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v61 count:16];
        if (v27) {
          goto LABEL_15;
        }
        goto LABEL_21;
      }
    }
    v33 = [v24 objectForKeyedSubscript:v30];

    if (!v33) {
      goto LABEL_32;
    }
    v34 = LA_LOG_1();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      +[LAACLBuilder customACL:](v34);
    }

    uint64_t v35 = SecAccessControlCreate();
    if (v35)
    {
      uint64_t v36 = v35;
      if (SecAccessControlSetProtection())
      {
        v59[0] = @"osgn";
        v59[1] = @"od";
        v60[0] = v33;
        v60[1] = v33;
        v59[2] = @"ock";
        v59[3] = @"odel";
        v60[2] = v33;
        v60[3] = MEMORY[0x1E4F1CC38];
        v59[4] = @"oa";
        v60[4] = MEMORY[0x1E4F1CC38];
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:5];
        SecAccessControlSetConstraints();
        if (RequirePassword) {
          SecAccessControlSetRequirePassword();
        }
        v37 = [LAACL alloc];
        if (v37)
        {
          *(void *)buf = v37;
          *(void *)&buf[8] = LAACL;
          id v38 = objc_msgSendSuper2((objc_super *)buf, sel_init);
          v6 = v38;
          if (v38) {
            *((void *)v38 + 1) = v36;
          }
          goto LABEL_44;
        }
LABEL_43:
        v6 = 0;
LABEL_44:
        id v3 = v46;

LABEL_45:
        v4 = v57;
        goto LABEL_46;
      }
      v41 = LA_LOG_1();
      os_log_type_t v42 = LALogTypeForInternalError();
      if (os_log_type_enabled(v41, v42))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = error;
        v43 = "Could not set ACL protection (%{public}@)";
        goto LABEL_41;
      }
    }
    else
    {
      v41 = LA_LOG_1();
      os_log_type_t v42 = LALogTypeForInternalError();
      if (os_log_type_enabled(v41, v42))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = error;
        v43 = "Could not initialize trivial ACL (%{public}@)";
LABEL_41:
        _os_log_impl(&dword_1BED06000, v41, v42, v43, buf, 0xCu);
      }
    }

    goto LABEL_43;
  }
  v4 = LA_LOG_1();
  os_log_type_t v5 = LALogTypeForInternalError();
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BED06000, v4, v5, "Invalid authType", buf, 2u);
  }
  v6 = 0;
LABEL_46:

  return v6;
}

uint64_t __26__LAACLBuilder_customACL___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fallbackAuthType];
  uint64_t result = [*(id *)(a1 + 32) authType];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (result == 2 && [*(id *)(a1 + 32) fallbackAuthType] == 16)
    {
      return 1;
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 32) authType];
      return v4 | [*(id *)(a1 + 32) fallbackAuthType] | 0x4000;
    }
  }
  return result;
}

+ (id)denyAllACL
{
  uint64_t v2 = [LAACL alloc];
  id v3 = +[LASecAccessControl denyAllACL];
  if (v2)
  {
    uint64_t v4 = v3;
    v7.receiver = v2;
    v7.super_class = (Class)LAACL;
    os_log_type_t v5 = objc_msgSendSuper2(&v7, sel_init);
    if (v5) {
      v5[1] = v4;
    }
  }
  else
  {
    os_log_type_t v5 = 0;
  }

  return v5;
}

+ (void)customACL:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BED06000, log, OS_LOG_TYPE_DEBUG, "Skipping AP constraints", v1, 2u);
}

@end