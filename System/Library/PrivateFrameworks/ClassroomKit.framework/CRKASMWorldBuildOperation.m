@interface CRKASMWorldBuildOperation
+ (id)makeErrorWithErrorsByObjectID:(id)a3;
- (BOOL)isAsynchronous;
- (CRKASMRosterProviderEnvironment)environment;
- (CRKASMWorldBuildOperation)initWithEnvironment:(id)a3;
- (CRKClassKitCurrentUser)classKitCurrentUser;
- (NSArray)classKitClasses;
- (NSDictionary)classKitLocationsByLocationID;
- (NSDictionary)classKitPersonsByClassID;
- (NSDictionary)trustedClassKitPersonsByClassID;
- (NSSet)manageableLocationIDs;
- (id)compileResult;
- (id)makeHousekeeperWithRoster:(id)a3;
- (id)rosterRequirements;
- (void)buildAllClassKitPersonsByClassID;
- (void)buildClassKitClasses;
- (void)buildClassKitLocationsByLocationID;
- (void)buildCurrentClassKitUser;
- (void)buildManageableLocationIDs;
- (void)checkAccountEligibility;
- (void)finish;
- (void)finishWithEmptyResultObject;
- (void)housekeepKeychain;
- (void)housekeepKeychainWithRoster:(id)a3;
- (void)main;
- (void)setClassKitClasses:(id)a3;
- (void)setClassKitCurrentUser:(id)a3;
- (void)setClassKitLocationsByLocationID:(id)a3;
- (void)setClassKitPersonsByClassID:(id)a3;
- (void)setManageableLocationIDs:(id)a3;
- (void)setTrustedClassKitPersonsByClassID:(id)a3;
@end

@implementation CRKASMWorldBuildOperation

- (CRKASMWorldBuildOperation)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMWorldBuildOperation;
  v6 = [(CRKASMWorldBuildOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_environment, a3);
  }

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CRKASMWorldBuildOperation_main__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __33__CRKASMWorldBuildOperation_main__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCanceled];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    CATErrorWithCodeAndUserInfo();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 endOperationWithError:v4];
  }
  else
  {
    [v3 checkAccountEligibility];
  }
}

- (void)checkAccountEligibility
{
  v3 = [(CRKASMWorldBuildOperation *)self rosterRequirements];
  uint64_t v4 = [v3 accountState];

  if (v4 != 2)
  {
    if (v4 == 1)
    {
      v6 = _CRKLogASM_12();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        v7 = "ASM World Build: Account is transitioning. Nothing to build right now.";
        v8 = (uint8_t *)&v10;
LABEL_14:
        _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
    }
    else
    {
      if (!v4)
      {
        id v5 = _CRKLogASM_12();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "ASM World Build: No eligible ASM account signed in", buf, 2u);
        }

        [(CRKASMWorldBuildOperation *)self housekeepKeychain];
        goto LABEL_16;
      }
      v6 = _CRKLogASM_12();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        v7 = "ASM World Build: Unknown account state. Doing nothing out of fear.";
        v8 = (uint8_t *)&v9;
        goto LABEL_14;
      }
    }

LABEL_16:
    [(CRKASMWorldBuildOperation *)self finishWithEmptyResultObject];
    return;
  }

  [(CRKASMWorldBuildOperation *)self buildCurrentClassKitUser];
}

- (void)buildCurrentClassKitUser
{
  v3 = [(CRKASMWorldBuildOperation *)self rosterRequirements];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__CRKASMWorldBuildOperation_buildCurrentClassKitUser__block_invoke;
  v4[3] = &unk_2646F45F8;
  v4[4] = self;
  [v3 currentUserWithCompletion:v4];
}

void __53__CRKASMWorldBuildOperation_buildCurrentClassKitUser__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CRKASMWorldBuildOperation_buildCurrentClassKitUser__block_invoke_2;
  block[3] = &unk_2646F42C0;
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__CRKASMWorldBuildOperation_buildCurrentClassKitUser__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    if (*(void *)(a1 + 40))
    {
      int v2 = *(void **)(a1 + 32);
      objc_msgSend(v2, "endOperationWithError:");
    }
    else
    {
      v3 = [*(id *)(a1 + 48) person];
      uint64_t v4 = v3;
      if (v3 && ([v3 objectID], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
      {
        [*(id *)(a1 + 32) setClassKitCurrentUser:*(void *)(a1 + 48)];
        [*(id *)(a1 + 32) buildClassKitClasses];
      }
      else
      {
        id v6 = _CRKLogASM_12();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v7 = 0;
          _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "ASM World Build: Could not find current user", v7, 2u);
        }

        [*(id *)(a1 + 32) finishWithEmptyResultObject];
      }
    }
  }
}

- (void)buildClassKitClasses
{
  v3 = [(CRKASMWorldBuildOperation *)self rosterRequirements];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke;
  v4[3] = &unk_2646F42E8;
  v4[4] = self;
  [v3 classesWithCompletion:v4];
}

void __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke_2;
  block[3] = &unk_2646F42C0;
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isExecuting];
  if (result)
  {
    if (*(void *)(a1 + 40))
    {
      v3 = *(void **)(a1 + 32);
      return objc_msgSend(v3, "endOperationWithError:");
    }
    else
    {
      uint64_t v4 = objc_msgSend(*(id *)(a1 + 48), "crk_filterUsingBlock:", &__block_literal_global_55);
      [*(id *)(a1 + 32) setClassKitClasses:v4];

      id v5 = *(void **)(a1 + 32);
      return [v5 buildClassKitLocationsByLocationID];
    }
  }
  return result;
}

BOOL __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectID];

  if (!v3)
  {
    uint64_t v4 = _CRKLogASM_12();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke_3_cold_1(v2);
    }
  }
  return v3 != 0;
}

- (void)buildClassKitLocationsByLocationID
{
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(CRKASMWorldBuildOperation *)self classKitClasses];
  id v5 = objc_msgSend(v4, "crk_mapUsingBlock:", &__block_literal_global_6_2);
  id v6 = [v3 setWithArray:v5];

  id v7 = [(CRKASMWorldBuildOperation *)self rosterRequirements];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_2;
  v8[3] = &unk_2646F42E8;
  v8[4] = self;
  [v7 locationsWithObjectIDs:v6 completion:v8];
}

uint64_t __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationID];
}

void __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_3;
  block[3] = &unk_2646F42C0;
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isExecuting];
  if (result)
  {
    if (*(void *)(a1 + 40))
    {
      v3 = *(void **)(a1 + 32);
      return objc_msgSend(v3, "endOperationWithError:");
    }
    else
    {
      uint64_t v4 = objc_msgSend(*(id *)(a1 + 48), "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_9, &__block_literal_global_12_1);
      [*(id *)(a1 + 32) setClassKitLocationsByLocationID:v4];

      id v5 = *(void **)(a1 + 32);
      return [v5 buildManageableLocationIDs];
    }
  }
  return result;
}

uint64_t __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

id __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (void)buildManageableLocationIDs
{
  v3 = [(CRKASMWorldBuildOperation *)self rosterRequirements];
  uint64_t v4 = [(CRKASMWorldBuildOperation *)self classKitCurrentUser];
  id v5 = [v4 person];
  id v6 = [v5 objectID];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke;
  v7[3] = &unk_2646F42E8;
  v7[4] = self;
  [v3 locationsWithManagePermissionsForUserWithObjectID:v6 completion:v7];
}

void __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke_2;
  block[3] = &unk_2646F42C0;
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    if (*(void *)(a1 + 40))
    {
      id v2 = *(void **)(a1 + 32);
      objc_msgSend(v2, "endOperationWithError:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_14_0, &__block_literal_global_16);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v3 = [*(id *)(a1 + 32) classKitLocationsByLocationID];
      uint64_t v4 = objc_msgSend(v3, "crk_dictionaryByAddingEntriesFromDictionary:", v8);
      [*(id *)(a1 + 32) setClassKitLocationsByLocationID:v4];

      id v5 = (void *)MEMORY[0x263EFFA08];
      id v6 = objc_msgSend(*(id *)(a1 + 48), "crk_mapUsingBlock:", &__block_literal_global_18_0);
      id v7 = [v5 setWithArray:v6];
      [*(id *)(a1 + 32) setManageableLocationIDs:v7];

      [*(id *)(a1 + 32) buildAllClassKitPersonsByClassID];
    }
  }
}

uint64_t __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

id __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (void)buildAllClassKitPersonsByClassID
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v21 = objc_opt_new();
  v20 = objc_opt_new();
  v19 = objc_opt_new();
  v3 = dispatch_group_create();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(CRKASMWorldBuildOperation *)self classKitClasses];
  uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v18 = *(void *)v37;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v36 + 1) + 8 * v6);
        dispatch_group_enter(v3);
        id v8 = [(CRKASMWorldBuildOperation *)self rosterRequirements];
        uint64_t v9 = [v7 objectID];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke;
        v31[3] = &unk_2646F46C8;
        id v10 = v21;
        id v32 = v10;
        v33 = v7;
        id v34 = v19;
        id v11 = v3;
        v35 = v11;
        [v8 trustedPersonsInClassWithObjectID:v9 completion:v31];

        dispatch_group_enter(v11);
        v12 = [(CRKASMWorldBuildOperation *)self rosterRequirements];
        v13 = [v7 objectID];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_3;
        v26[3] = &unk_2646F46C8;
        id v27 = v10;
        v28 = v7;
        id v29 = v20;
        v30 = v11;
        [v12 personsInClassWithObjectID:v13 completion:v26];

        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v5);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_5;
  block[3] = &unk_2646F37A0;
  block[4] = self;
  id v23 = v21;
  id v24 = v19;
  id v25 = v20;
  id v14 = v20;
  id v15 = v19;
  id v16 = v21;
  dispatch_group_notify(v3, MEMORY[0x263EF83A0], block);
}

void __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_2;
  v12[3] = &unk_2646F46A0;
  id v13 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = v9;
  id v17 = v5;
  id v18 = *(id *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
  }
  else
  {
    v3 = *(void **)(a1 + 56);
    if (*(void *)(a1 + 64)) {
      uint64_t v2 = *(void *)(a1 + 64);
    }
    else {
      uint64_t v2 = MEMORY[0x263EFFA68];
    }
  }
  uint64_t v4 = [*(id *)(a1 + 48) objectID];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = *(NSObject **)(a1 + 72);

  dispatch_group_leave(v5);
}

void __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_4;
  v12[3] = &unk_2646F46A0;
  id v13 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = v9;
  id v17 = v5;
  id v18 = *(id *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
  }
  else
  {
    v3 = *(void **)(a1 + 56);
    if (*(void *)(a1 + 64)) {
      uint64_t v2 = *(void *)(a1 + 64);
    }
    else {
      uint64_t v2 = MEMORY[0x263EFFA68];
    }
  }
  uint64_t v4 = [*(id *)(a1 + 48) objectID];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = *(NSObject **)(a1 + 72);

  dispatch_group_leave(v5);
}

void __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_5(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    uint64_t v2 = [(id)objc_opt_class() makeErrorWithErrorsByObjectID:*(void *)(a1 + 40)];
    id v5 = (id)v2;
    if (v2)
    {
      [*(id *)(a1 + 32) endOperationWithError:v2];
    }
    else
    {
      v3 = (void *)[*(id *)(a1 + 48) copy];
      [*(id *)(a1 + 32) setTrustedClassKitPersonsByClassID:v3];

      uint64_t v4 = (void *)[*(id *)(a1 + 56) copy];
      [*(id *)(a1 + 32) setClassKitPersonsByClassID:v4];

      [*(id *)(a1 + 32) finish];
    }
  }
}

- (void)finish
{
  id v3 = [(CRKASMWorldBuildOperation *)self compileResult];
  [(CRKASMWorldBuildOperation *)self endOperationWithResultObject:v3];
}

- (void)finishWithEmptyResultObject
{
  id v3 = (id)objc_opt_new();
  [(CRKASMWorldBuildOperation *)self endOperationWithResultObject:v3];
}

- (void)housekeepKeychain
{
}

- (void)housekeepKeychainWithRoster:(id)a3
{
  id v3 = [(CRKASMWorldBuildOperation *)self makeHousekeeperWithRoster:a3];
  [v3 housekeep];
}

- (id)makeHousekeeperWithRoster:(id)a3
{
  id v4 = a3;
  id v5 = [CRKASMCredentialHousekeeper alloc];
  id v6 = [(CRKASMWorldBuildOperation *)self environment];
  id v7 = [v6 configuration];
  uint64_t v8 = [v7 credentialStore];
  uint64_t v9 = [(CRKASMCredentialHousekeeper *)v5 initWithRoster:v4 credentialStore:v8];

  return v9;
}

- (id)compileResult
{
  id v3 = [(CRKASMWorldBuildOperation *)self environment];
  v30 = [v3 certificateVendor];

  id v4 = [(CRKASMWorldBuildOperation *)self environment];
  id v5 = [(CRKASMWorldBuildOperation *)self classKitCurrentUser];
  id v6 = [v5 person];
  id v7 = [v6 objectID];
  uint64_t v8 = [v4 identityVendorForUserIdentifier:v7];

  uint64_t v9 = [(CRKASMWorldBuildOperation *)self classKitClasses];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __42__CRKASMWorldBuildOperation_compileResult__block_invoke;
  v33[3] = &unk_2646F46F0;
  v33[4] = self;
  id v34 = v8;
  id v31 = v8;
  id v10 = objc_msgSend(v9, "crk_mapUsingBlock:", v33);

  id v11 = +[CRKASMCollidingCourseFilter coursesByFilteringCollidingCoursesFromArray:v10];
  v12 = [(CRKASMWorldBuildOperation *)self environment];
  id v13 = [v12 userFactory];
  id v14 = [(CRKASMWorldBuildOperation *)self classKitCurrentUser];
  uint64_t v15 = [v14 person];
  id v16 = [v13 userForPerson:v15];

  id v17 = [CRKASMConcreteOrganization alloc];
  id v18 = [(CRKASMWorldBuildOperation *)self classKitCurrentUser];
  v19 = [v18 person];
  v20 = [v19 orgID];
  v21 = [(CRKASMWorldBuildOperation *)self classKitCurrentUser];
  v22 = [v21 organizationName];
  id v23 = [(CRKASMConcreteOrganization *)v17 initWithIdentifier:v20 name:v22];

  id v24 = [[CRKASMConcreteRoster alloc] initWithOrganization:v23 user:v16 courses:v11 certificateVendor:v30];
  id v25 = [(CRKASMWorldBuildOperation *)self manageableLocationIDs];
  v26 = [v25 allObjects];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __42__CRKASMWorldBuildOperation_compileResult__block_invoke_27;
  v32[3] = &unk_2646F4718;
  v32[4] = self;
  id v27 = objc_msgSend(v26, "crk_mapUsingBlock:", v32);

  [(CRKASMWorldBuildOperation *)self housekeepKeychainWithRoster:v24];
  v28 = [[CRKASMWorldBuildResultObject alloc] initWithRoster:v24 manageableLocations:v27];

  return v28;
}

CRKASMConcreteCourse *__42__CRKASMWorldBuildOperation_compileResult__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) classKitLocationsByLocationID];
  id v5 = [v3 locationID];
  id v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = [*(id *)(a1 + 32) classKitPersonsByClassID];
  uint64_t v8 = [v3 objectID];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  id v10 = [*(id *)(a1 + 32) trustedClassKitPersonsByClassID];
  id v11 = [v3 objectID];
  v12 = [v10 objectForKeyedSubscript:v11];

  if (v6)
  {
    id v13 = [CRKASMConcreteCourse alloc];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = [*(id *)(a1 + 32) manageableLocationIDs];
    id v16 = [*(id *)(a1 + 32) environment];
    id v17 = [(CRKASMConcreteCourse *)v13 initWithBackingClass:v3 location:v6 persons:v9 trustedPersons:v12 identityVendor:v14 manageableLocationIDs:v15 environment:v16];
  }
  else
  {
    id v18 = _CRKLogASM_12();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __42__CRKASMWorldBuildOperation_compileResult__block_invoke_cold_1(v3);
    }

    id v17 = 0;
  }

  return v17;
}

CRKASMConcreteLocation *__42__CRKASMWorldBuildOperation_compileResult__block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 classKitLocationsByLocationID];
  id v5 = [v4 objectForKeyedSubscript:v3];

  if (v5) {
    id v6 = [[CRKASMConcreteLocation alloc] initWithBackingLocation:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)makeErrorWithErrorsByObjectID:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      id v4 = [v3 allValues];
      uint64_t v5 = [v4 firstObject];
    }
    else
    {
      uint64_t v8 = @"CRKPartialErrorsByItemIdentifier";
      v9[0] = v3;
      id v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
      uint64_t v5 = CRKErrorWithCodeAndUserInfo(29, v4);
    }
    id v6 = (void *)v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)rosterRequirements
{
  uint64_t v2 = [(CRKASMWorldBuildOperation *)self environment];
  id v3 = [v2 configuration];
  id v4 = [v3 rosterRequirements];

  return v4;
}

- (CRKASMRosterProviderEnvironment)environment
{
  return self->_environment;
}

- (CRKClassKitCurrentUser)classKitCurrentUser
{
  return self->_classKitCurrentUser;
}

- (void)setClassKitCurrentUser:(id)a3
{
}

- (NSArray)classKitClasses
{
  return self->_classKitClasses;
}

- (void)setClassKitClasses:(id)a3
{
}

- (NSDictionary)classKitLocationsByLocationID
{
  return self->_classKitLocationsByLocationID;
}

- (void)setClassKitLocationsByLocationID:(id)a3
{
}

- (NSSet)manageableLocationIDs
{
  return self->_manageableLocationIDs;
}

- (void)setManageableLocationIDs:(id)a3
{
}

- (NSDictionary)classKitPersonsByClassID
{
  return self->_classKitPersonsByClassID;
}

- (void)setClassKitPersonsByClassID:(id)a3
{
}

- (NSDictionary)trustedClassKitPersonsByClassID
{
  return self->_trustedClassKitPersonsByClassID;
}

- (void)setTrustedClassKitPersonsByClassID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedClassKitPersonsByClassID, 0);
  objc_storeStrong((id *)&self->_classKitPersonsByClassID, 0);
  objc_storeStrong((id *)&self->_manageableLocationIDs, 0);
  objc_storeStrong((id *)&self->_classKitLocationsByLocationID, 0);
  objc_storeStrong((id *)&self->_classKitClasses, 0);
  objc_storeStrong((id *)&self->_classKitCurrentUser, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

void __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke_3_cold_1(void *a1)
{
  v1 = [a1 className];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Not vending class with name %@ because it has a nil object ID", v4, v5, v6, v7, 2u);
}

void __42__CRKASMWorldBuildOperation_compileResult__block_invoke_cold_1(void *a1)
{
  v1 = [a1 className];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Not vending class with name %@ because it is missing a location", v4, v5, v6, v7, 2u);
}

@end