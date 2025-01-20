@interface LNConnectionPolicy
+ (BOOL)_typeExistsWithMangledTypeName:(id)a3;
+ (BOOL)bundleLinkedOnOrAfter2024:(id)a3;
+ (BOOL)shouldExecuteActionOnApplicationWithActionMetadata:(id)a3 signals:(id)a4 reason:(id *)a5;
+ (BOOL)shouldExecuteActionOnApplicationWithBundleIdentifier:(id)a3;
+ (BOOL)shouldHandleInProcessWithMangledTypeName:(id)a3 bundleIdentifier:(id)a4;
+ (id)policyWithActionMetadata:(id)a3;
+ (id)policyWithActionMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5 processInstanceIdentifier:(id)a6;
+ (id)policyWithActionMetadata:(id)a3 signals:(id)a4;
+ (id)policyWithBundleIdentifier:(id)a3;
+ (id)policyWithEntityMetadata:(id)a3;
+ (id)policyWithEntityMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5 processInstanceIdentifier:(id)a6;
+ (id)policyWithEntityMetadata:(id)a3 signals:(id)a4;
+ (id)policyWithEntityQueryMetadata:(id)a3;
+ (id)policyWithEntityQueryMetadata:(id)a3 signals:(id)a4;
+ (id)policyWithEnumMetadata:(id)a3;
+ (id)policyWithEnumMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5 processInstanceIdentifier:(id)a6;
+ (id)policyWithEnumMetadata:(id)a3 signals:(id)a4;
+ (id)policyWithQueryMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5 processInstanceIdentifier:(id)a6;
@end

@implementation LNConnectionPolicy

+ (id)policyWithActionMetadata:(id)a3 signals:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v65 = 0;
  id v66 = 0;
  id v63 = 0;
  id v64 = 0;
  LNConnectionPolicyEffectiveBundleIdentifiers(&v66, &v65, &v64, &v63, v6, v7);
  id v8 = v66;
  id v9 = v65;
  id v10 = v64;
  id v11 = v63;
  if (v11)
  {
    v12 = getLNLogCategoryPolicy();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [v6 identifier];
      v14 = [v11 bundleIdentifier];
      *(_DWORD *)buf = 138543618;
      id v68 = v13;
      __int16 v69 = 2114;
      uint64_t v70 = (uint64_t)v14;
    }
    id v15 = [v7 preferredBundleIdentifier];
    v16 = [v7 processInstanceIdentifier];
    id v17 = a1;
    id v18 = v6;
    id v19 = v11;
    id v20 = v15;
    v21 = v16;
    goto LABEL_5;
  }
  if (!v8 || v9 || v10)
  {
    if (v9 && !v8 && !v10)
    {
      v29 = getLNLogCategoryPolicy();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = [v6 identifier];
        v31 = [v9 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        id v68 = v30;
        __int16 v69 = 2114;
        uint64_t v70 = (uint64_t)v31;
      }
      id v15 = [0 bundleIdentifier];
      id v26 = a1;
      id v27 = v6;
      id v28 = v9;
      goto LABEL_24;
    }
    if (v10 && !v8 && !v9)
    {
      v32 = getLNLogCategoryPolicy();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = [v6 identifier];
        v34 = [v10 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        id v68 = v33;
        __int16 v69 = 2114;
        uint64_t v70 = (uint64_t)v34;
      }
      id v15 = [0 bundleIdentifier];
      id v26 = a1;
      id v27 = v6;
      id v28 = v10;
      goto LABEL_24;
    }
    id v62 = 0;
    int v36 = [a1 shouldExecuteActionOnApplicationWithActionMetadata:v6 signals:v7 reason:&v62];
    id v15 = v62;
    if (v36)
    {
      v37 = getLNLogCategoryPolicy();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = [v8 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        id v68 = v38;
        __int16 v69 = 2114;
        uint64_t v70 = (uint64_t)v15;
      }
LABEL_49:

      v16 = [v8 bundleIdentifier];
      id v17 = a1;
      id v18 = v6;
      id v19 = v8;
LABEL_57:
      id v20 = v16;
      v21 = 0;
LABEL_5:
      v22 = [v17 policyWithActionMetadata:v18 effectiveBundleIdentifier:v19 appBundleIdentifier:v20 processInstanceIdentifier:v21];

      goto LABEL_25;
    }
    uint64_t v39 = [v7 preferredBundleIdentifier];
    if (!v39) {
      goto LABEL_46;
    }
    v60 = v39;
    v40 = [v9 bundleIdentifier];
    v58 = [v7 preferredBundleIdentifier];
    id v41 = v40;
    id v42 = v58;
    if (v41 == v42)
    {
    }
    else
    {
      v43 = v42;
      if (!v41 || !v42)
      {

        v47 = v60;
LABEL_45:

        goto LABEL_46;
      }
      char v59 = [v41 isEqualToString:v42];

      if ((v59 & 1) == 0)
      {
LABEL_46:
        v50 = [v8 bundleIdentifier];
        int v51 = [a1 shouldExecuteActionOnApplicationWithBundleIdentifier:v50];

        if (v51)
        {
          v37 = getLNLogCategoryPolicy();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v61 = [v8 bundleIdentifier];
            uint64_t v52 = [v6 identifier];
            *(_DWORD *)buf = 138543618;
            id v68 = v61;
            __int16 v69 = 2114;
            uint64_t v70 = v52;
            v53 = (void *)v52;
          }
          goto LABEL_49;
        }
LABEL_50:
        v54 = getLNLogCategoryPolicy();
        BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_INFO);
        if (v10)
        {
          if (v55)
          {
            v56 = [v6 identifier];
            *(_DWORD *)buf = 138543618;
            id v68 = v10;
            __int16 v69 = 2114;
            uint64_t v70 = (uint64_t)v56;
          }
          v16 = [v8 bundleIdentifier];
          id v17 = a1;
          id v18 = v6;
          id v19 = v10;
        }
        else
        {
          if (v55)
          {
            v57 = [v6 identifier];
            *(_DWORD *)buf = 138543618;
            id v68 = v9;
            __int16 v69 = 2114;
            uint64_t v70 = (uint64_t)v57;
          }
          v16 = [v8 bundleIdentifier];
          id v17 = a1;
          id v18 = v6;
          id v19 = v9;
        }
        goto LABEL_57;
      }
    }
    v44 = [v8 bundleIdentifier];
    int v45 = [a1 bundleLinkedOnOrAfter2024:v44];

    v46 = getLNLogCategoryPolicy();
    v47 = v46;
    if (v45)
    {
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        [v7 preferredBundleIdentifier];
        v49 = v48 = v47;
        *(_DWORD *)buf = 138543362;
        id v68 = v49;

        v47 = v48;
      }

      goto LABEL_50;
    }
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v47, OS_LOG_TYPE_DEFAULT, "Client requested running using the preferred bundle identifier, but it is linked prior to 2024 so ignoring", buf, 2u);
    }
    goto LABEL_45;
  }
  v23 = getLNLogCategoryPolicy();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = [v6 identifier];
    v25 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    id v68 = v24;
    __int16 v69 = 2114;
    uint64_t v70 = (uint64_t)v25;
  }
  id v15 = [v8 bundleIdentifier];
  id v26 = a1;
  id v27 = v6;
  id v28 = v8;
LABEL_24:
  v22 = [v26 policyWithActionMetadata:v27 effectiveBundleIdentifier:v28 appBundleIdentifier:v15 processInstanceIdentifier:0];
LABEL_25:

  return v22;
}

+ (id)policyWithActionMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5 processInstanceIdentifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[LNAppIntentConnectionPolicy alloc] initWithAppIntentMetadata:v12 effectiveBundleIdentifier:v11 appBundleIdentifier:v10 processInstanceIdentifier:v9];

  return v13;
}

+ (BOOL)shouldExecuteActionOnApplicationWithActionMetadata:(id)a3 signals:(id)a4 reason:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8 && ([v8 shouldExecuteActionOnApplicationBasedOnMetadata] & 1) == 0)
  {
    v16 = getLNLogCategoryPolicy();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v16, OS_LOG_TYPE_DEFAULT, "Policy signals dictate that this app intent should not run in the app based on the provided metadata", buf, 2u);
    }
  }
  else
  {
    if ([v7 openAppWhenRun])
    {
      id v10 = NSString;
      id v11 = [v7 identifier];
LABEL_17:
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v17 = 1;
      goto LABEL_18;
    }
    id v12 = [v7 systemProtocols];
    v13 = [MEMORY[0x1E4F72710] audioStartingProtocol];
    int v14 = [v12 containsObject:v13];

    if (v14)
    {
      id v15 = NSString;
      id v11 = [v7 identifier];
      goto LABEL_17;
    }
    id v18 = [v7 systemProtocols];
    id v19 = [MEMORY[0x1E4F72710] sessionStartingProtocol];
    int v20 = [v18 containsObject:v19];

    if (v20)
    {
      v21 = NSString;
      id v11 = [v7 identifier];
      goto LABEL_17;
    }
    v22 = [v7 systemProtocols];
    v23 = [MEMORY[0x1E4F72710] foregroundContinuableProtocol];
    int v24 = [v22 containsObject:v23];

    if (v24)
    {
      v25 = NSString;
      id v11 = [v7 identifier];
      goto LABEL_17;
    }
    id v26 = [v7 systemProtocols];
    id v27 = [MEMORY[0x1E4F72710] pushToTalkTransmissionProtocol];
    int v28 = [v26 containsObject:v27];

    if (v28)
    {
      v29 = NSString;
      id v11 = [v7 identifier];
      goto LABEL_17;
    }
  }
  BOOL v17 = 0;
LABEL_18:

  return v17;
}

+ (BOOL)shouldHandleInProcessWithMangledTypeName:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"LNConnectionPolicy.m", 571, @"Invalid parameter not satisfying: %@", @"mangledTypeName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"LNConnectionPolicy.m", 572, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

LABEL_3:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__LNConnectionPolicy_shouldHandleInProcessWithMangledTypeName_bundleIdentifier___block_invoke;
  v16[3] = &unk_1E5B39648;
  id v17 = v9;
  id v10 = v9;
  BOOL v11 = +[LNEntitlementsValidator validateEntitlement:@"com.apple.private.appintents-handle-in-process" forCurrentTaskWithValidator:v16];

  if (v11) {
    char v12 = [a1 _typeExistsWithMangledTypeName:v7];
  }
  else {
    char v12 = 0;
  }

  return v12;
}

uint64_t __80__LNConnectionPolicy_shouldHandleInProcessWithMangledTypeName_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v5 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v5 isEqualToString:*(void *)(a1 + 32)];
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];
LABEL_6:
  uint64_t v6 = v4;
LABEL_8:

  return v6;
}

+ (BOOL)shouldExecuteActionOnApplicationWithBundleIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:v3];
  id v5 = [MEMORY[0x1E4F96448] descriptor];
  id v17 = 0;
  uint64_t v6 = [MEMORY[0x1E4F96438] statesForPredicate:v4 withDescriptor:v5 error:&v17];
  id v7 = v17;
  if (!v7)
  {
    if (![v6 count])
    {
      id v8 = getLNLogCategoryPolicy();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      id v19 = v3;
      id v9 = "Failed to find process state for application bundle; will use extension if available. bundle=%@";
      goto LABEL_10;
    }
    if ((unint64_t)[v6 count] >= 2)
    {
      id v8 = getLNLogCategoryPolicy();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      id v19 = v3;
      id v9 = "Found multiple process states for application bundle; will use extension if available. bundle=%@";
LABEL_10:
      id v10 = v8;
      uint32_t v11 = 12;
      goto LABEL_11;
    }
    id v8 = [v6 firstObject];
    int v14 = [v8 taskState];
    if (v14 == 4)
    {
      id v15 = getLNLogCategoryPolicy();
      BOOL v12 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v3;
        v16 = "Found process state running scheduled for application bundle; will use application if available. bundle=%@";
        goto LABEL_20;
      }
    }
    else
    {
      if (v14 != 3)
      {
        id v15 = getLNLogCategoryPolicy();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v3;
          _os_log_impl(&dword_1A4419000, v15, OS_LOG_TYPE_INFO, "Found process state other than running scheduled or suspended for application bundle; will use extension if "
            "available. bundle=%@",
            buf,
            0xCu);
        }
        BOOL v12 = 0;
        goto LABEL_24;
      }
      id v15 = getLNLogCategoryPolicy();
      BOOL v12 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v3;
        v16 = "Found process state running suspended for application bundle; will use application if available. bundle=%@";
LABEL_20:
        _os_log_impl(&dword_1A4419000, v15, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
      }
    }
LABEL_24:

    goto LABEL_13;
  }
  id v8 = getLNLogCategoryPolicy();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v3;
    __int16 v20 = 2112;
    id v21 = v7;
    id v9 = "Failed to determine process state for application bundle; will use extension if available. bundle=%@; %@";
    id v10 = v8;
    uint32_t v11 = 22;
LABEL_11:
    _os_log_impl(&dword_1A4419000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
  }
LABEL_12:
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

+ (BOOL)_typeExistsWithMangledTypeName:(id)a3
{
  sub_1A44F94E0();
  BOOL v3 = static LNConnectionPolicy._typeExists(mangledTypeName:)();
  swift_bridgeObjectRelease();
  return v3;
}

+ (BOOL)bundleLinkedOnOrAfter2024:(id)a3
{
  v27[10] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v19 = 0;
  uint64_t v4 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v3 allowPlaceholder:0 error:&v19];
  id v5 = v19;
  if (!v4)
  {
    id v7 = getLNLogCategoryPolicy();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 138543618;
      *(void *)&v25[4] = v3;
      *(_WORD *)&v25[12] = 2114;
      *(void *)&v25[14] = v5;
      int v14 = "Unable to create a bundle record for %{public}@: %{public}@";
      id v15 = v7;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 22;
LABEL_11:
      _os_log_impl(&dword_1A4419000, v15, v16, v14, v25, v17);
    }
LABEL_12:
    BOOL v13 = 1;
    goto LABEL_15;
  }
  uint64_t v6 = [v4 SDKVersion];

  if (!v6)
  {
    id v7 = getLNLogCategoryPolicy();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 138543362;
      *(void *)&v25[4] = v3;
      int v14 = "No SDKVersion for %{public}@";
      id v15 = v7;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v26[0] = &unk_1EF7F4040;
  v26[1] = &unk_1EF7F4058;
  v27[0] = @"15.0";
  v27[1] = @"18.0";
  v26[2] = &unk_1EF7F4070;
  v26[3] = &unk_1EF7F4088;
  v27[2] = @"18.0";
  v27[3] = @"18.0";
  v26[4] = &unk_1EF7F40A0;
  v26[5] = &unk_1EF7F40B8;
  v27[4] = @"18.0";
  v27[5] = @"18.0";
  v26[6] = &unk_1EF7F40D0;
  v26[7] = &unk_1EF7F40E8;
  v27[6] = @"18.0";
  v27[7] = @"18.0";
  v26[8] = &unk_1EF7F4100;
  v26[9] = &unk_1EF7F4118;
  v27[8] = @"2.0";
  v27[9] = @"2.0";
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:10];
  id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v4, "platform"));
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    memset(v25, 0, 32);
    id v10 = [v4 SDKVersion];
    MEMORY[0x1A625C790](v25);

    long long v23 = 0u;
    long long v24 = 0u;
    MEMORY[0x1A625C790](&v23, v9);
    uint32_t v11 = getLNLogCategoryPolicy();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      BOOL v12 = [v4 SDKVersion];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1A4419000, v11, OS_LOG_TYPE_INFO, "Comparing %{public}@ to %{public}@", buf, 0x16u);
    }
    *(_OWORD *)buf = *(_OWORD *)v25;
    *(_OWORD *)&uint8_t buf[16] = *(_OWORD *)&v25[16];
    long long v20 = v23;
    long long v21 = v24;
    BOOL v13 = _LSVersionNumberCompare() != -1;
  }
  else
  {
    BOOL v13 = 1;
  }

LABEL_15:
  return v13;
}

+ (id)policyWithEnumMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5 processInstanceIdentifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  BOOL v13 = [LNAppEnumConnectionPolicy alloc];
  int v14 = [v12 identifier];
  id v15 = [v11 bundleIdentifier];
  os_log_type_t v16 = [v12 mangledTypeNameForBundleIdentifier:v15];

  uint32_t v17 = [(LNAppEnumConnectionPolicy *)v13 initWithAppEnumIdentifier:v14 appEnumMangledTypeName:v16 effectiveBundleIdentifier:v11 appBundleIdentifier:v10 processInstanceIdentifier:v9];
  return v17;
}

+ (id)policyWithQueryMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5 processInstanceIdentifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  BOOL v13 = [LNEntityQueryConnectionPolicy alloc];
  int v14 = [v12 identifier];
  id v15 = [v11 bundleIdentifier];
  os_log_type_t v16 = [v12 mangledTypeNameForBundleIdentifier:v15];

  uint32_t v17 = [(LNEntityQueryConnectionPolicy *)v13 initWithEntityQueryIdentifier:v14 entityQueryMangledTypeName:v16 effectiveBundleIdentifier:v11 appBundleIdentifier:v10 processInstanceIdentifier:v9];
  return v17;
}

+ (id)policyWithEntityMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5 processInstanceIdentifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  BOOL v13 = [LNAppEntityConnectionPolicy alloc];
  int v14 = [v12 identifier];
  id v15 = [v11 bundleIdentifier];
  os_log_type_t v16 = [v12 mangledTypeNameForBundleIdentifier:v15];

  uint32_t v17 = [(LNAppEntityConnectionPolicy *)v13 initWithAppEntityIdentifier:v14 appEntityMangledTypeName:v16 effectiveBundleIdentifier:v11 appBundleIdentifier:v10 processInstanceIdentifier:v9];
  return v17;
}

+ (id)policyWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[LNBundleConnectionPolicy alloc] initWithBundleIdentifier:v3 appBundleIdentifier:0 processInstanceIdentifier:0];

  return v4;
}

+ (id)policyWithEnumMetadata:(id)a3 signals:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v54 = 0;
  id v55 = 0;
  id v52 = 0;
  id v53 = 0;
  LNConnectionPolicyEffectiveBundleIdentifiers(&v55, &v54, &v53, &v52, v6, v7);
  id v8 = v55;
  id v9 = v54;
  id v10 = v53;
  id v11 = v52;
  if (!v11)
  {
    if (v8 && !v9 && !v10)
    {
      id v18 = getLNLogCategoryPolicy();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        id v15 = [v8 bundleIdentifier];
        id v22 = a1;
        id v23 = v6;
        id v24 = v8;
LABEL_48:
        uint32_t v17 = [v22 policyWithEnumMetadata:v23 effectiveBundleIdentifier:v24 appBundleIdentifier:v15 processInstanceIdentifier:0];
        goto LABEL_49;
      }
      id v19 = [v6 identifier];
      long long v20 = [v8 bundleIdentifier];
      *(_DWORD *)buf = 138543618;
      id v57 = v19;
      __int16 v58 = 2114;
      char v59 = v20;
LABEL_10:
      _os_log_impl(&dword_1A4419000, v18, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

      goto LABEL_11;
    }
    if (v9 && !v8 && !v10)
    {
      v25 = getLNLogCategoryPolicy();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = [v6 identifier];
        id v27 = [v9 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        id v57 = v26;
        __int16 v58 = 2114;
        char v59 = v27;
      }
      int v28 = 0;
LABEL_18:
      id v15 = [v28 bundleIdentifier];
      id v22 = a1;
      id v23 = v6;
      id v24 = v9;
      goto LABEL_48;
    }
    if (v10 && !v8 && !v9)
    {
      v29 = getLNLogCategoryPolicy();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = [v6 identifier];
        v31 = [v10 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        id v57 = v30;
        __int16 v58 = 2114;
        char v59 = v31;
      }
      v32 = 0;
      goto LABEL_47;
    }
    uint64_t v33 = [v7 preferredBundleIdentifier];
    if (!v33) {
      goto LABEL_40;
    }
    v34 = v33;
    v35 = [v9 bundleIdentifier];
    int v36 = [v7 preferredBundleIdentifier];
    id v37 = v35;
    id v38 = v36;
    if (v37 == v38)
    {
    }
    else
    {
      uint64_t v39 = v38;
      if (!v37 || !v38)
      {

LABEL_39:
        goto LABEL_40;
      }
      char v51 = [v37 isEqualToString:v38];

      if ((v51 & 1) == 0)
      {
LABEL_40:
        v44 = [v8 bundleIdentifier];
        int v45 = [a1 shouldExecuteActionOnApplicationWithBundleIdentifier:v44];

        if (v45)
        {
          id v18 = getLNLogCategoryPolicy();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
            goto LABEL_11;
          }
          id v19 = [v8 bundleIdentifier];
          long long v20 = [v6 identifier];
          *(_DWORD *)buf = 138543618;
          id v57 = v19;
          __int16 v58 = 2114;
          char v59 = v20;
          goto LABEL_10;
        }
        goto LABEL_43;
      }
    }
    v40 = [v8 bundleIdentifier];
    int v41 = [a1 bundleLinkedOnOrAfter2024:v40];

    id v42 = getLNLogCategoryPolicy();
    v34 = v42;
    if (v41)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = [v7 preferredBundleIdentifier];
        *(_DWORD *)buf = 138543362;
        id v57 = v43;
      }
LABEL_43:
      v46 = getLNLogCategoryPolicy();
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
      if (!v10)
      {
        if (v47)
        {
          v50 = [v6 identifier];
          *(_DWORD *)buf = 138543618;
          id v57 = v9;
          __int16 v58 = 2114;
          char v59 = v50;
        }
        int v28 = v8;
        goto LABEL_18;
      }
      if (v47)
      {
        v48 = [v6 identifier];
        *(_DWORD *)buf = 138543618;
        id v57 = v10;
        __int16 v58 = 2114;
        char v59 = v48;
      }
      v32 = v8;
LABEL_47:
      id v15 = [v32 bundleIdentifier];
      id v22 = a1;
      id v23 = v6;
      id v24 = v10;
      goto LABEL_48;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v34, OS_LOG_TYPE_DEFAULT, "Client requested running using the preferred bundle identifier, but it is linked prior to 2024 so ignoring", buf, 2u);
    }
    goto LABEL_39;
  }
  id v12 = getLNLogCategoryPolicy();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    BOOL v13 = [v6 identifier];
    int v14 = [v11 bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    id v57 = v13;
    __int16 v58 = 2114;
    char v59 = v14;
  }
  id v15 = [v7 preferredBundleIdentifier];
  os_log_type_t v16 = [v7 processInstanceIdentifier];
  uint32_t v17 = [a1 policyWithEnumMetadata:v6 effectiveBundleIdentifier:v11 appBundleIdentifier:v15 processInstanceIdentifier:v16];

LABEL_49:
  return v17;
}

+ (id)policyWithEnumMetadata:(id)a3
{
  return (id)[a1 policyWithEnumMetadata:a3 signals:0];
}

+ (id)policyWithEntityQueryMetadata:(id)a3 signals:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v55 = 0;
  id v56 = 0;
  id v53 = 0;
  id v54 = 0;
  LNConnectionPolicyEffectiveBundleIdentifiers(&v56, &v55, &v54, &v53, v6, v7);
  id v8 = v56;
  id v9 = v55;
  id v10 = v54;
  id v11 = v53;
  if (v11)
  {
    id v12 = getLNLogCategoryPolicy();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = [v6 identifier];
      int v14 = [v11 bundleIdentifier];
      *(_DWORD *)buf = 138543618;
      id v58 = v13;
      __int16 v59 = 2114;
      uint64_t v60 = v14;
    }
    id v15 = [v7 preferredBundleIdentifier];
    os_log_type_t v16 = [v7 processInstanceIdentifier];
    uint32_t v17 = [a1 policyWithQueryMetadata:v6 effectiveBundleIdentifier:v11 appBundleIdentifier:v15 processInstanceIdentifier:v16];

    goto LABEL_13;
  }
  if (v8 && !v9 && !v10)
  {
    id v18 = getLNLogCategoryPolicy();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
LABEL_11:

      id v15 = [v8 bundleIdentifier];
      id v22 = a1;
      id v23 = v6;
      id v24 = v8;
LABEL_12:
      uint32_t v17 = [v22 policyWithQueryMetadata:v23 effectiveBundleIdentifier:v24 appBundleIdentifier:v15 processInstanceIdentifier:0];
LABEL_13:

      goto LABEL_14;
    }
    id v19 = [v6 identifier];
    long long v20 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    id v58 = v19;
    __int16 v59 = 2114;
    uint64_t v60 = v20;
LABEL_10:
    _os_log_impl(&dword_1A4419000, v18, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

    goto LABEL_11;
  }
  if (!v9 || v8 || v10)
  {
    if (v10 && !v8 && !v9)
    {
      v32 = getLNLogCategoryPolicy();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = [v6 identifier];
        v34 = [v10 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        id v58 = v33;
        __int16 v59 = 2114;
        uint64_t v60 = v34;
      }
      id v29 = a1;
      id v30 = v6;
      id v31 = v10;
      goto LABEL_29;
    }
    uint64_t v35 = [v7 preferredBundleIdentifier];
    if (!v35) {
      goto LABEL_45;
    }
    int v36 = v35;
    id v37 = [v9 bundleIdentifier];
    id v38 = [v7 preferredBundleIdentifier];
    id v39 = v37;
    id v40 = v38;
    if (v39 == v40)
    {
    }
    else
    {
      int v41 = v40;
      if (!v39 || !v40)
      {

LABEL_44:
        goto LABEL_45;
      }
      char v52 = [v39 isEqualToString:v40];

      if ((v52 & 1) == 0)
      {
LABEL_45:
        v46 = [v8 bundleIdentifier];
        int v47 = [a1 shouldExecuteActionOnApplicationWithBundleIdentifier:v46];

        if (v47)
        {
          id v18 = getLNLogCategoryPolicy();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
            goto LABEL_11;
          }
          id v19 = [v8 bundleIdentifier];
          long long v20 = [v6 identifier];
          *(_DWORD *)buf = 138543618;
          id v58 = v19;
          __int16 v59 = 2114;
          uint64_t v60 = v20;
          goto LABEL_10;
        }
LABEL_48:
        v48 = getLNLogCategoryPolicy();
        BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
        if (v10)
        {
          if (v49)
          {
            v50 = [v6 identifier];
            *(_DWORD *)buf = 138543618;
            id v58 = v10;
            __int16 v59 = 2114;
            uint64_t v60 = v50;
          }
          id v15 = [v8 bundleIdentifier];
          id v22 = a1;
          id v23 = v6;
          id v24 = v10;
        }
        else
        {
          if (v49)
          {
            char v51 = [v6 identifier];
            *(_DWORD *)buf = 138543618;
            id v58 = v9;
            __int16 v59 = 2114;
            uint64_t v60 = v51;
          }
          id v15 = [v8 bundleIdentifier];
          id v22 = a1;
          id v23 = v6;
          id v24 = v9;
        }
        goto LABEL_12;
      }
    }
    id v42 = [v8 bundleIdentifier];
    int v43 = [a1 bundleLinkedOnOrAfter2024:v42];

    v44 = getLNLogCategoryPolicy();
    int v36 = v44;
    if (v43)
    {
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        int v45 = [v7 preferredBundleIdentifier];
        *(_DWORD *)buf = 138543362;
        id v58 = v45;
      }
      goto LABEL_48;
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v36, OS_LOG_TYPE_DEFAULT, "Client requested running using the preferred bundle identifier, but it is linked prior to 2024 so ignoring", buf, 2u);
    }
    goto LABEL_44;
  }
  id v26 = getLNLogCategoryPolicy();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = [v6 identifier];
    int v28 = [v9 bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    id v58 = v27;
    __int16 v59 = 2114;
    uint64_t v60 = v28;
  }
  id v29 = a1;
  id v30 = v6;
  id v31 = v9;
LABEL_29:
  uint32_t v17 = [v29 policyWithQueryMetadata:v30 effectiveBundleIdentifier:v31 appBundleIdentifier:0 processInstanceIdentifier:0];
LABEL_14:

  return v17;
}

+ (id)policyWithEntityQueryMetadata:(id)a3
{
  return (id)[a1 policyWithEntityQueryMetadata:a3 signals:0];
}

+ (id)policyWithEntityMetadata:(id)a3 signals:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v54 = 0;
  id v55 = 0;
  id v52 = 0;
  id v53 = 0;
  LNConnectionPolicyEffectiveBundleIdentifiers(&v55, &v54, &v53, &v52, v6, v7);
  id v8 = v55;
  id v9 = v54;
  id v10 = v53;
  id v11 = v52;
  if (!v11)
  {
    if (v8 && !v9 && !v10)
    {
      id v18 = getLNLogCategoryPolicy();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        id v15 = [v8 bundleIdentifier];
        id v22 = a1;
        id v23 = v6;
        id v24 = v8;
LABEL_48:
        uint32_t v17 = [v22 policyWithEntityMetadata:v23 effectiveBundleIdentifier:v24 appBundleIdentifier:v15 processInstanceIdentifier:0];
        goto LABEL_49;
      }
      id v19 = [v6 identifier];
      long long v20 = [v8 bundleIdentifier];
      *(_DWORD *)buf = 138543618;
      id v57 = v19;
      __int16 v58 = 2114;
      __int16 v59 = v20;
LABEL_10:
      _os_log_impl(&dword_1A4419000, v18, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

      goto LABEL_11;
    }
    if (v9 && !v8 && !v10)
    {
      v25 = getLNLogCategoryPolicy();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = [v6 identifier];
        id v27 = [v9 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        id v57 = v26;
        __int16 v58 = 2114;
        __int16 v59 = v27;
      }
      int v28 = 0;
LABEL_18:
      id v15 = [v28 bundleIdentifier];
      id v22 = a1;
      id v23 = v6;
      id v24 = v9;
      goto LABEL_48;
    }
    if (v10 && !v8 && !v9)
    {
      id v29 = getLNLogCategoryPolicy();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = [v6 identifier];
        id v31 = [v10 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        id v57 = v30;
        __int16 v58 = 2114;
        __int16 v59 = v31;
      }
      v32 = 0;
      goto LABEL_47;
    }
    uint64_t v33 = [v7 preferredBundleIdentifier];
    if (!v33) {
      goto LABEL_40;
    }
    v34 = v33;
    uint64_t v35 = [v9 bundleIdentifier];
    int v36 = [v7 preferredBundleIdentifier];
    id v37 = v35;
    id v38 = v36;
    if (v37 == v38)
    {
    }
    else
    {
      id v39 = v38;
      if (!v37 || !v38)
      {

LABEL_39:
        goto LABEL_40;
      }
      char v51 = [v37 isEqualToString:v38];

      if ((v51 & 1) == 0)
      {
LABEL_40:
        v44 = [v8 bundleIdentifier];
        int v45 = [a1 shouldExecuteActionOnApplicationWithBundleIdentifier:v44];

        if (v45)
        {
          id v18 = getLNLogCategoryPolicy();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
            goto LABEL_11;
          }
          id v19 = [v8 bundleIdentifier];
          long long v20 = [v6 identifier];
          *(_DWORD *)buf = 138543618;
          id v57 = v19;
          __int16 v58 = 2114;
          __int16 v59 = v20;
          goto LABEL_10;
        }
        goto LABEL_43;
      }
    }
    id v40 = [v8 bundleIdentifier];
    int v41 = [a1 bundleLinkedOnOrAfter2024:v40];

    id v42 = getLNLogCategoryPolicy();
    v34 = v42;
    if (v41)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        int v43 = [v7 preferredBundleIdentifier];
        *(_DWORD *)buf = 138543362;
        id v57 = v43;
      }
LABEL_43:
      v46 = getLNLogCategoryPolicy();
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
      if (!v10)
      {
        if (v47)
        {
          v50 = [v6 identifier];
          *(_DWORD *)buf = 138543618;
          id v57 = v9;
          __int16 v58 = 2114;
          __int16 v59 = v50;
        }
        int v28 = v8;
        goto LABEL_18;
      }
      if (v47)
      {
        v48 = [v6 identifier];
        *(_DWORD *)buf = 138543618;
        id v57 = v10;
        __int16 v58 = 2114;
        __int16 v59 = v48;
      }
      v32 = v8;
LABEL_47:
      id v15 = [v32 bundleIdentifier];
      id v22 = a1;
      id v23 = v6;
      id v24 = v10;
      goto LABEL_48;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v34, OS_LOG_TYPE_DEFAULT, "Client requested running using the preferred bundle identifier, but it is linked prior to 2024 so ignoring", buf, 2u);
    }
    goto LABEL_39;
  }
  id v12 = getLNLogCategoryPolicy();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    BOOL v13 = [v6 identifier];
    int v14 = [v11 bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    id v57 = v13;
    __int16 v58 = 2114;
    __int16 v59 = v14;
  }
  id v15 = [v7 preferredBundleIdentifier];
  os_log_type_t v16 = [v7 processInstanceIdentifier];
  uint32_t v17 = [a1 policyWithEntityMetadata:v6 effectiveBundleIdentifier:v11 appBundleIdentifier:v15 processInstanceIdentifier:v16];

LABEL_49:
  return v17;
}

+ (id)policyWithEntityMetadata:(id)a3
{
  return (id)[a1 policyWithEntityMetadata:a3 signals:0];
}

+ (id)policyWithActionMetadata:(id)a3
{
  return (id)[a1 policyWithActionMetadata:a3 signals:0];
}

@end