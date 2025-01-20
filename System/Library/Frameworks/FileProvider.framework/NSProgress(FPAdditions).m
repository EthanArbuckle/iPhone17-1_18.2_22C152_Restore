@interface NSProgress(FPAdditions)
- (BOOL)fp_isGlobalProgressForDomainAt:()FPAdditions;
- (id)fp_fileOperationKindStrict:()FPAdditions;
- (uint64_t)fp_fileOperationKind;
- (uint64_t)fp_isAccountedAsCopyProgress;
- (uint64_t)fp_isOfFileOperationKind:()FPAdditions;
- (uint64_t)fp_isOfFileOperationKind:()FPAdditions strict:;
- (void)fp_addChildProgress:()FPAdditions withUnitCount:;
- (void)fp_setFileOperationKind:()FPAdditions;
@end

@implementation NSProgress(FPAdditions)

- (id)fp_fileOperationKindStrict:()FPAdditions
{
  if (a3
    && ([a1 kind],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:*MEMORY[0x1E4F28898]],
        v4,
        !v5))
  {
    id v8 = 0;
  }
  else
  {
    v6 = [a1 userInfo];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28868]];

    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[NSProgress(FPAdditions) fp_fileOperationKindStrict:]((uint64_t)v7, v9);
      }

      id v8 = 0;
    }
    else
    {
      id v8 = v7;
    }
  }

  return v8;
}

- (uint64_t)fp_fileOperationKind
{
  return objc_msgSend(a1, "fp_fileOperationKindStrict:", 1);
}

- (void)fp_setFileOperationKind:()FPAdditions
{
  uint64_t v4 = *MEMORY[0x1E4F28898];
  id v5 = a3;
  [a1 setKind:v4];
  [a1 setUserInfoObject:v5 forKey:*MEMORY[0x1E4F28868]];
}

- (uint64_t)fp_isOfFileOperationKind:()FPAdditions
{
  return objc_msgSend(a1, "fp_isOfFileOperationKind:strict:", a3, 1);
}

- (uint64_t)fp_isOfFileOperationKind:()FPAdditions strict:
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "fp_fileOperationKindStrict:", a4);
  uint64_t v8 = [v7 isEqualToString:v6];

  return v8;
}

- (void)fp_addChildProgress:()FPAdditions withUnitCount:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a4 longLongValue];
  if (!v7) {
    uint64_t v7 = [v6 totalUnitCount];
  }
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  if ([a1 totalUnitCount] == -1)
  {
    [a1 setTotalUnitCount:v8];
    v14 = [v6 fileTotalCount];
    [a1 setFileTotalCount:v14];

    [a1 setFileCompletedCount:&unk_1EF6C3938];
    [a1 setCompletedUnitCount:0];
  }
  else
  {
    objc_msgSend(a1, "setTotalUnitCount:", objc_msgSend(a1, "totalUnitCount") + v8);
    v9 = [a1 fileTotalCount];
    uint64_t v10 = [v9 unsignedIntegerValue];
    v11 = [v6 fileTotalCount];
    uint64_t v12 = [v11 unsignedIntegerValue] + v10;

    v13 = [NSNumber numberWithUnsignedInteger:v12];
    [a1 setFileTotalCount:v13];
  }
  v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412802;
    id v17 = v6;
    __int16 v18 = 2112;
    v19 = a1;
    __int16 v20 = 2048;
    uint64_t v21 = v8;
    _os_log_debug_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Adding child progress %@ to parent %@ with %lld unit counts", (uint8_t *)&v16, 0x20u);
  }

  [a1 addChild:v6 withPendingUnitCount:v8];
}

- (BOOL)fp_isGlobalProgressForDomainAt:()FPAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "fp_fileOperationKindStrict:", 1);
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [a1 fileTotalCount];
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [a1 fileCompletedCount];

  if (!v8
    || ([v5 isEqualToString:*MEMORY[0x1E4F28880]] & 1) == 0
    && ![v5 isEqualToString:*MEMORY[0x1E4F28858]])
  {
    goto LABEL_8;
  }
  v9 = [a1 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"FPProgressIsCreatedByFileProviderKey"];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    uint64_t v12 = [a1 fileURL];
    BOOL v13 = objc_msgSend(v12, "fp_relationshipToItemAtURL:", v4) == 1;
  }
  else
  {
LABEL_8:
    BOOL v13 = 0;
  }

  return v13;
}

- (uint64_t)fp_isAccountedAsCopyProgress
{
  if ((objc_msgSend(a1, "fp_isOfFileOperationKind:", *MEMORY[0x1E4F28850]) & 1) != 0
    || (objc_msgSend(a1, "fp_isOfFileOperationKind:", *MEMORY[0x1E4F28860]) & 1) != 0
    || (objc_msgSend(a1, "fp_isOfFileOperationKind:", *MEMORY[0x1E4F28848]) & 1) != 0)
  {
    return 1;
  }
  uint64_t v3 = *MEMORY[0x1E4F28878];

  return objc_msgSend(a1, "fp_isOfFileOperationKind:", v3);
}

- (void)fp_fileOperationKindStrict:()FPAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] userinfo[NSProgressFileOperationKindKey] is of unexpected class %@", (uint8_t *)&v4, 0xCu);
}

@end