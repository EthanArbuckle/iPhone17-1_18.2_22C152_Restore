@interface DMCPersonaHelper
+ (BOOL)isCurrentPersonaEnterprise;
+ (BOOL)personaWithUniqueIdentifierExists:(id)a3;
+ (BOOL)removePersona:(id)a3 error:(id *)a4;
+ (id)createEnterprisePersonaWithDevicePasscode:(id)a3 error:(id *)a4;
+ (id)createEnterprisePersonaWithPasscodeData:(id)a3 passcodeDataType:(unint64_t)a4 error:(id *)a5;
+ (id)currentPersonaID;
+ (id)currentPersonaTypeString;
+ (id)enterprisePersonaDisplayName;
+ (id)enterprisePersonaIdentifier;
+ (id)fetchDirtyPersonaIDs;
+ (id)performBlockUnderPersona:(id)a3 block:(id)a4;
+ (id)performBlockUnderPersonalPersona:(id)a3;
+ (void)removePersonaAndAccountsWithPersonaID:(id)a3;
+ (void)setPersonaIdentifierForApps:(id)a3 personaID:(id)a4 completionHandler:(id)a5;
+ (void)trackDirtyPersona:(id)a3;
+ (void)untrackAllDirtyPersonas;
+ (void)untrackDirtyPersona:(id)a3;
@end

@implementation DMCPersonaHelper

+ (id)createEnterprisePersonaWithDevicePasscode:(id)a3 error:(id *)a4
{
  v6 = [a3 dataUsingEncoding:4];
  v7 = [a1 createEnterprisePersonaWithPasscodeData:v6 passcodeDataType:0 error:a4];

  return v7;
}

+ (id)createEnterprisePersonaWithPasscodeData:(id)a3 passcodeDataType:(unint64_t)a4 error:(id *)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v36 = *MEMORY[0x1E4FB3730];
  v37[0] = &unk_1EFD88778;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
  v10 = [MEMORY[0x1E4FB36F8] sharedManager];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__DMCPersonaHelper_createEnterprisePersonaWithPasscodeData_passcodeDataType_error___block_invoke;
  v18[3] = &unk_1E5CFDFD8;
  id v11 = v9;
  id v19 = v11;
  v20 = &v28;
  v21 = &v22;
  [v10 createUserPersona:v8 passcodeData:v7 passcodeDataType:a4 completionHandler:v18];

  if (([v11 tryLockWhenCondition:1] & 1) == 0)
  {
    v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_INFO, "Waiting for persona to be created...", buf, 2u);
    }
    [v11 lockWhenCondition:1];
  }
  [v11 unlock];
  v13 = (void *)v29[5];
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
  }
  else
  {
    v14 = *DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = v23[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v15;
      _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_INFO, "Persona created with identifier %{public}@.", buf, 0xCu);
    }
  }
  id v16 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __83__DMCPersonaHelper_createEnterprisePersonaWithPasscodeData_passcodeDataType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) lock];
  if (v6)
  {
    id v7 = *DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_ERROR, "Failed to create persona: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB3738]];
    uint64_t v9 = [v8 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  [*(id *)(a1 + 32) unlockWithCondition:1];
}

+ (BOOL)removePersona:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v33 = *MEMORY[0x1E4FB3738];
  v34[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  id v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
  v8 = [MEMORY[0x1E4FB36F8] sharedManager];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __40__DMCPersonaHelper_removePersona_error___block_invoke;
  v19[3] = &unk_1E5CFE000;
  id v9 = v7;
  id v20 = v9;
  uint64_t v10 = (__CFString *)v5;
  v21 = v10;
  uint64_t v22 = &v23;
  [v8 deleteUserPersonaWithProfileInfo:v6 passcodeData:0 completionHandler:v19];

  if (([v9 tryLockWhenCondition:1] & 1) == 0)
  {
    id v11 = *DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_INFO, "Waiting for persona to be removed...", buf, 2u);
    }
    [v9 lockWhenCondition:1];
  }
  [v9 unlock];
  uint64_t v12 = v24[5];
  if (v12)
  {
    id v13 = objc_opt_new();
    uint64_t v14 = v24[5];
    uint64_t v15 = &stru_1EFD813E0;
    if (v10) {
      uint64_t v15 = v10;
    }
    v31 = @"persona ID";
    v32 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [v13 logErrorEventForTopic:@"Persona" reason:@"Persona Removal Failed" error:v14 details:v16];

    if (a4) {
      *a4 = (id) v24[5];
    }
  }
  else
  {
    v17 = *DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v10;
      _os_log_impl(&dword_1A7863000, v17, OS_LOG_TYPE_INFO, "Persona with identifier %{public}@ removed.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v23, 8);
  return v12 == 0;
}

void __40__DMCPersonaHelper_removePersona_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  [*(id *)(a1 + 32) lock];
  if (v4)
  {
    id v5 = *DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_ERROR, "Failed to remove persona with identifier %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  [*(id *)(a1 + 32) unlockWithCondition:1];
}

+ (void)removePersonaAndAccountsWithPersonaID:(id)a3
{
  id v3 = a3;
  +[DMCPersonaHelper removePersona:v3 error:0];
  id v4 = [MEMORY[0x1E4F179C8] defaultStore];
  objc_msgSend(v4, "dmc_removeMAIDRelatedAccountsWithPersonaID:asynchronous:", v3, 0);
}

+ (id)performBlockUnderPersonalPersona:(id)a3
{
  id v3 = (void (**)(void))a3;
  id v4 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v5 = [v4 currentPersona];

  if (([v5 isPersonalPersona] & 1) != 0
    || ([v5 isSystemPersona] & 1) != 0
    || [v5 isDefaultPersona])
  {
    v3[2](v3);
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v8 = *DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v8, OS_LOG_TYPE_DEFAULT, "DMCPersonaHelper: We are not under personal/system/default persona, will to switch to personal persona", buf, 2u);
    }
    __int16 v9 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
    v17 = v9;
    if (v9
      && ([v9 userPersonaUniqueString],
          v18 = objc_claimAutoreleasedReturnValue(),
          uint64_t v19 = [v18 length],
          v18,
          v19))
    {
      id v20 = [v17 userPersonaUniqueString];
      uint64_t v21 = +[DMCPersonaHelper performBlockUnderPersona:v20 block:v3];
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      id v20 = DMCErrorArray(@"PERSONA_ATTRIBUTE_FETCH_ERROR", v10, v11, v12, v13, v14, v15, v16, 0);
      uint64_t v21 = [v22 DMCErrorWithDomain:@"DMCPersonaErrorDomain" code:55001 descriptionArray:v20 errorType:@"DMCFatalError"];
    }
    uint64_t v6 = (void *)v21;
  }
  return v6;
}

+ (id)performBlockUnderPersona:(id)a3 block:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if (!v6)
  {
LABEL_8:
    id v10 = 0;
    goto LABEL_9;
  }
  if (![v5 length])
  {
    uint64_t v11 = DMCLogObjects()[1];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_INFO, "performBlockUnderPersona: No persona provided, will just run the block", buf, 2u);
    }
    v6[2](v6);
    goto LABEL_8;
  }
  int v7 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v8 = [v7 currentPersona];

  id v17 = 0;
  __int16 v9 = (void *)[v8 copyCurrentPersonaContextWithError:&v17];
  id v10 = v17;
  if (!v10)
  {
    uint64_t v13 = [v8 createPersonaContextForBackgroundProcessingWithPersonaUniqueString:v5];
    if (v13)
    {
      id v10 = (id)v13;
      uint64_t v14 = DMCLogObjects()[1];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v19 = v5;
        __int16 v20 = 2114;
        id v21 = v10;
        _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_ERROR, "Failed to adopt persona:%{public}@ with error: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v6[2](v6);
      [v8 restorePersonaWithSavedPersonaContext:v9];
      if (objc_claimAutoreleasedReturnValue())
      {
        uint64_t v15 = DMCLogObjects()[1];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7863000, v15, OS_LOG_TYPE_ERROR, "Cannot restore persona context", buf, 2u);
        }
        id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PersonaRestorationFailedException" reason:@"The persona restoration failed" userInfo:0];
        objc_exception_throw(v16);
      }
      id v10 = 0;
    }
  }

LABEL_9:
  return v10;
}

+ (id)currentPersonaID
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v3 = [v2 currentPersona];

  id v4 = [v3 userPersonaUniqueString];

  return v4;
}

+ (BOOL)isCurrentPersonaEnterprise
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v3 = [v2 currentPersona];
  char v4 = [v3 isEnterprisePersona];

  return v4;
}

+ (id)currentPersonaTypeString
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v3 = [v2 currentPersona];
  char v4 = [v3 userPersonaNickName];

  return v4;
}

+ (id)enterprisePersonaIdentifier
{
  v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:2];
  id v3 = [v2 userPersonaUniqueString];

  return v3;
}

+ (id)enterprisePersonaDisplayName
{
  v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:2];
  id v3 = [v2 userPersonaDisplayName];

  return v3;
}

+ (void)setPersonaIdentifierForApps:(id)a3 personaID:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4FB36F8] sharedManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__DMCPersonaHelper_setPersonaIdentifierForApps_personaID_completionHandler___block_invoke;
  v15[3] = &unk_1E5CFE050;
  id v16 = v7;
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  id v14 = v7;
  [v13 fetchBundleIdentifierForPersonaWithIDString:v12 completionHandler:v15];
}

void __76__DMCPersonaHelper_setPersonaIdentifierForApps_personaID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = MEMORY[0x1E4F1CBF0];
  }
  char v4 = [MEMORY[0x1E4F1CA80] setWithArray:v3];
  [v4 addObjectsFromArray:*(void *)(a1 + 32)];
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = [v4 allObjects];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__DMCPersonaHelper_setPersonaIdentifierForApps_personaID_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5CFE028;
  uint64_t v7 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v5 setBundlesIdentifiers:v6 forUniquePersonaWithIDString:v7 completionHandler:v8];
}

void __76__DMCPersonaHelper_setPersonaIdentifierForApps_personaID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    char v4 = *DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_ERROR, "Failed to set bundle identifiers for persona with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)personaWithUniqueIdentifierExists:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = *DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_INFO, "fetchPersonaWithPersonaUniqueString: will fetch persona with persona ID: %@", (uint8_t *)&v8, 0xCu);
  }
  int v5 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaUniqueString:v3];
  BOOL v6 = v5 != 0;

  return v6;
}

+ (void)trackDirtyPersona:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    char v4 = MDMDirtyPersonaFilePath();
    int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = [v5 fileExistsAtPath:v4];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithContentsOfFile:v4];
      [v7 addObject:v3];
    }
    else
    {
      v8[0] = v3;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    }
    [v7 writeToFile:v4 atomically:1];
    DMCSetSkipBackupAttributeToItemAtPath(v4, 1);
  }
}

+ (void)untrackDirtyPersona:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = MDMDirtyPersonaFilePath();
  if ([v3 length])
  {
    int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v6 = [v5 fileExistsAtPath:v4];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithContentsOfFile:v4];
      [v7 removeObject:v3];
      if ([v7 count])
      {
        [v7 writeToFile:v4 atomically:1];
        DMCSetSkipBackupAttributeToItemAtPath(v4, 1);
      }
      else
      {
        int v8 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v11 = 0;
        [v8 removeItemAtPath:v4 error:&v11];
        id v9 = v11;

        if (v9)
        {
          uint64_t v10 = *DMCLogObjects();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v13 = v9;
            _os_log_impl(&dword_1A7863000, v10, OS_LOG_TYPE_ERROR, "Failed to remove dirty persona file, error: %{public}@", buf, 0xCu);
          }
        }
      }
    }
  }
}

+ (void)untrackAllDirtyPersonas
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = MDMDirtyPersonaFilePath();
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v2];

  if (v5)
  {
    id v9 = 0;
    [v3 removeItemAtPath:v2 error:&v9];
    id v6 = v9;
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = *DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v11 = v7;
        _os_log_impl(&dword_1A7863000, v8, OS_LOG_TYPE_ERROR, "Failed to remove dirty persona file, error: %{public}@", buf, 0xCu);
      }
    }
  }
}

+ (id)fetchDirtyPersonaIDs
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = MDMDirtyPersonaFilePath();
  char v4 = [v2 arrayWithContentsOfFile:v3];

  return v4;
}

@end