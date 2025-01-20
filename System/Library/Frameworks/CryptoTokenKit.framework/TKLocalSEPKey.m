@interface TKLocalSEPKey
+ (BOOL)hasSEP;
+ (BOOL)isDaytona;
+ (BOOL)isGibraltar;
+ (id)_testing_callerEntitlements;
+ (id)_testing_keybagHandle;
+ (id)protectionForKeyClass:(int)a3;
+ (int)keyClassForProtection:(id)a3;
+ (int)keybagHandleForceSystemSession:(BOOL)a3;
+ (void)setContextErrorHandler:(id)a3;
+ (void)set_testing_callerEntitlements:(id)a3;
+ (void)set_testing_keybagHandle:(id)a3;
+ (void)setupKeybagForTesting:(BOOL)a3;
- (BOOL)callerHasEntitlement:(id)a3 error:(id *)a4;
- (BOOL)error:(id *)a3 withAKSReturn:(int)a4 ACMHandle:(id)a5 AKSOperation:(id)a6 params:(id)a7 message:(id)a8;
- (BOOL)evaluateRequirementIgnoringAccessGroups:(__ACMRequirement *)a3;
- (BOOL)systemKey;
- (NSString)callerName;
- (NSXPCConnection)caller;
- (__SecAccessControl)accessControl;
- (id)_initWithAuthContext:(id)a3 caller:(id)a4;
- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10;
- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7;
- (id)authContextWithError:(id *)a3;
- (id)encodedAccessGroups;
- (id)parametersWithACMHandle:(id)a3;
- (id)sac;
- (id)valueForEntitlement:(id)a3;
- (void)processAccessGroupsOfACLDictionary:(id)a3 intoGroups:(id)a4 callerGroups:(id)a5;
- (void)setSac:(id)a3;
@end

@implementation TKLocalSEPKey

- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  char v17 = 0;
  id v15 = [[TKLocalSEPSystemKey alloc] _initWithObjectID:v12 authContext:v13 caller:v14 isIDUnknown:&v17 error:a7];

  if (!v15)
  {
    if (v17) {
      id v15 = [[TKLocalSEPRefKey alloc] _initWithObjectID:v12 authContext:v13 caller:v14 forceSystemSession:v8 error:a7];
    }
    else {
      id v15 = 0;
    }
  }

  return v15;
}

- (id)_initWithAuthContext:(id)a3 caller:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TKLocalSEPKey;
  BOOL v8 = [(TKSEPKey *)&v11 _initWithAuthContext:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong(v8 + 3, a4);
  }

  return v9;
}

+ (id)protectionForKeyClass:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (protectionForKeyClass__once != -1) {
    dispatch_once(&protectionForKeyClass__once, &__block_literal_global_147);
  }
  v4 = (void *)protectionForKeyClass__protections;
  v5 = [NSNumber numberWithInt:v3];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (void *)*MEMORY[0x1E4F3B5B0];
  }
  id v8 = v7;

  return v8;
}

- (__SecAccessControl)accessControl
{
  return (__SecAccessControl *)self->_sac;
}

- (void)setSac:(id)a3
{
}

+ (int)keybagHandleForceSystemSession:(BOOL)a3
{
  if (_enableTesting) {
    return _testingKeybagHandle;
  }
  v4 = (void *)_testing_keybagHandle;
  if (_testing_keybagHandle)
  {
    return objc_msgSend(v4, "intValue", a3);
  }
  else if (a3)
  {
    v5 = TK_LOG_sepkey_0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[TKLocalSEPKey keybagHandleForceSystemSession:]();
    }

    return -6;
  }
  else
  {
    return 0;
  }
}

- (id)parametersWithACMHandle:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(TKAKSParameters);
  [(TKAKSParameters *)v5 setData:v4 forKey:3];

  v6 = [(TKLocalSEPKey *)self encodedAccessGroups];
  [(TKAKSParameters *)v5 setData:v6 forKey:1];

  return v5;
}

- (id)encodedAccessGroups
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(TKLocalSEPKey *)self sac];

  if (v4)
  {
    v5 = [(TKLocalSEPKey *)self valueForEntitlement:@"keychain-access-groups"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v7 = (void *)[v6 mutableCopy];
    id v8 = [(TKLocalSEPKey *)self valueForEntitlement:@"application-identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 addObject:v8];
    }
    if ([v7 count])
    {
      [(TKLocalSEPKey *)self accessControl];
      v9 = SecAccessControlGetConstraints();
      [(TKLocalSEPKey *)self processAccessGroupsOfACLDictionary:v9 intoGroups:v3 callerGroups:v7];
    }
  }
  v10 = [[TKBERTLVRecord alloc] initWithPropertyList:v3];
  objc_super v11 = [(TKTLVRecord *)v10 data];

  return v11;
}

- (id)authContextWithError:(id *)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(TKSEPKey *)self authContext];
  if (v4)
  {
    v5 = v4;
    v6 = 0;
LABEL_7:
    id v8 = [v5 externalizedContext];
    if (v8)
    {
      v9 = [[TKAuthContext alloc] initWithLAContext:v5 ACMHandle:v8 sharedResource:v6];
    }
    else
    {
      v10 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[TKLocalSEPKey authContextWithError:](v10, v11, v12, v13, v14, v15, v16, v17);
      }

      if (a3)
      {
        v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F28568];
        v22[0] = @"LAContext.externalizedContext failed";
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
        *a3 = [v18 errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:v19];
      }
      if (contextErrorHandler) {
        (*(void (**)(void))(contextErrorHandler + 16))();
      }
      v9 = 0;
    }

    goto LABEL_17;
  }
  if (authContextWithError__onceToken != -1) {
    dispatch_once(&authContextWithError__onceToken, &__block_literal_global_129);
  }
  v6 = [(id)authContextWithError__sharedResourceSlot resourceWithError:a3];
  uint64_t v7 = [v6 object];
  if (v7)
  {
    v5 = v7;
    goto LABEL_7;
  }
  v5 = TK_LOG_sepkey_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[TKLocalSEPKey authContextWithError:]((uint64_t *)a3, v5);
  }
  v9 = 0;
LABEL_17:

  return v9;
}

- (id)valueForEntitlement:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  if (_testingCallerEntitlements)
  {
    v5 = [(id)_testingCallerEntitlements objectForKeyedSubscript:v4];
  }
  else
  {
    v6 = [(TKLocalSEPKey *)self caller];

    if (v6)
    {
      uint64_t v7 = [(TKLocalSEPKey *)self caller];
      v5 = [v7 valueForEntitlement:v4];
    }
    else
    {
      if (valueForEntitlement__onceToken != -1) {
        dispatch_once(&valueForEntitlement__onceToken, &__block_literal_global_105);
      }
      CFErrorRef error = 0;
      v5 = (void *)SecTaskCopyValueForEntitlement((SecTaskRef)valueForEntitlement__selfTask, v4, &error);
    }
  }

  return v5;
}

- (void)processAccessGroupsOfACLDictionary:(id)a3 intoGroups:(id)a4 callerGroups:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__TKLocalSEPKey_processAccessGroupsOfACLDictionary_intoGroups_callerGroups___block_invoke;
  v12[3] = &unk_1E63C88A8;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = self;
  id v10 = v8;
  id v11 = v9;
  [a3 enumerateKeysAndObjectsUsingBlock:v12];
}

id __38__TKLocalSEPKey_authContextWithError___block_invoke_2()
{
  uint64_t add = atomic_fetch_add(TKAuthContextSerialNumber, 1u);
  v1 = TK_LOG_sepkey_0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __38__TKLocalSEPKey_authContextWithError___block_invoke_2_cold_1(add, v1, v2, v3, v4, v5, v6, v7);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F30B50]);

  return v8;
}

- (NSXPCConnection)caller
{
  return self->_caller;
}

- (id)sac
{
  return self->_sac;
}

+ (BOOL)hasSEP
{
  return MEMORY[0x1F417CE00](@"HasSEP", a2);
}

+ (BOOL)isDaytona
{
  return 0;
}

+ (BOOL)isGibraltar
{
  return 0;
}

SecTaskRef __37__TKLocalSEPKey_valueForEntitlement___block_invoke()
{
  SecTaskRef result = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  valueForEntitlement__selfTask = (uint64_t)result;
  return result;
}

void __76__TKLocalSEPKey_processAccessGroupsOfACLDictionary_intoGroups_callerGroups___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a2 isEqualToString:@"cag"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      if ([a1[4] containsObject:v6]) {
        [a1[5] addObject:v6];
      }
LABEL_17:

      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
            if (objc_msgSend(a1[4], "containsObject:", v11, (void)v12)) {
              [a1[5] addObject:v11];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
      goto LABEL_17;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a1[6] processAccessGroupsOfACLDictionary:v5 intoGroups:a1[5] callerGroups:a1[4]];
    }
  }
LABEL_18:
}

+ (void)setContextErrorHandler:(id)a3
{
  contextErrorHandler = MEMORY[0x1C189CA40](a3, a2);

  MEMORY[0x1F41817F8]();
}

- (BOOL)evaluateRequirementIgnoringAccessGroups:(__ACMRequirement *)a3
{
  int Type = ACMRequirementGetType(a3, a2);
  if (Type == 8)
  {
    if (ACMRequirementGetState(a3) == 2) {
      return 1;
    }
    return ACMRequirementGetState(a3) == 1;
  }
  else
  {
    if (Type == 7)
    {
      uint64_t v15 = 0;
      uint64_t v16 = &v15;
      uint64_t v17 = 0x2020000000;
      int v18 = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke;
      v14[3] = &unk_1E63C88D0;
      v14[4] = self;
      v14[5] = &v15;
      ACMRequirementGetSubrequirements((int *)a3, (uint64_t)v14);
      uint64_t v10 = 0;
      uint64_t v11 = &v10;
      uint64_t v12 = 0x2020000000;
      int v13 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke_2;
      v9[3] = &unk_1E63C88F8;
      v9[4] = &v10;
      ACMRequirementGetProperty((int *)a3, 700, (uint64_t)v9);
      BOOL v6 = *((_DWORD *)v16 + 6) >= *((_DWORD *)v11 + 6);
      _Block_object_dispose(&v10, 8);
      _Block_object_dispose(&v15, 8);
      return v6;
    }
    return ACMRequirementGetState(a3) == 2;
  }
}

uint64_t __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) evaluateRequirementIgnoringAccessGroups:a2];
  if (result) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

uint64_t __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke_2(uint64_t result, _DWORD *a2, uint64_t a3)
{
  if (a3 == 4) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *a2;
  }
  return result;
}

- (BOOL)error:(id *)a3 withAKSReturn:(int)a4 ACMHandle:(id)a5 AKSOperation:(id)a6 params:(id)a7 message:(id)a8
{
  uint64_t v11 = *(void *)&a4;
  v57[1] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  id v46 = a7;
  id v15 = a8;
  if (!a3)
  {
LABEL_34:
    v38 = TK_LOG_sepkey_0();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v42 = [(TKLocalSEPKey *)self callerName];
      v43 = [(TKLocalSEPKey *)self accessControl];
      *(_DWORD *)buf = 138544898;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v42;
      *(_WORD *)&buf[22] = 2114;
      id v50 = v15;
      __int16 v51 = 1024;
      *(_DWORD *)v52 = v11;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v11;
      *(_WORD *)v53 = 2114;
      *(void *)&v53[2] = v43;
      __int16 v54 = 2114;
      id v55 = v46;
      _os_log_error_impl(&dword_1BED55000, v38, OS_LOG_TYPE_ERROR, "%{public}@: (%{public}@) %{public}@: error %08x(%d) ACL=%{public}@ params=%{public}@", buf, 0x40u);
    }
    goto LABEL_36;
  }
  v56 = @"AKSError";
  uint64_t v16 = [NSNumber numberWithInt:v11];
  v57[0] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
  int v18 = (void *)[v17 mutableCopy];

  if (v15)
  {
    v19 = [NSString stringWithFormat:@"%@: %@", self, v15];
    [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  }
  if (v11 == -536870174)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-25308 userInfo:v18];

    goto LABEL_34;
  }
  if (v11 == -536363000 && v14)
  {
    v20 = TK_LOG_sepkey_0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:]();
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v50) = 0;
    id v21 = v13;
    v22 = ACMContextCreateWithExternalForm((_OWORD *)[v21 bytes], objc_msgSend(v21, "length"));
    if (v22)
    {
      v23 = [(TKLocalSEPKey *)self sac];
      v44 = SecAccessControlGetConstraint();

      v24 = [[TKBERTLVRecord alloc] initWithPropertyList:v44];
      v25 = [(TKTLVRecord *)v24 data];

      [(TKLocalSEPKey *)self encodedAccessGroups];
      v48[0] = 3;
      id v26 = objc_claimAutoreleasedReturnValue();
      v48[1] = [v26 bytes];
      v48[2] = [v26 length];
      id v27 = v25;
      v28 = (const void *)[v27 bytes];
      uint64_t v29 = [v27 length];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __75__TKLocalSEPKey_error_withAKSReturn_ACMHandle_AKSOperation_params_message___block_invoke;
      v47[3] = &unk_1E63C8920;
      v47[4] = self;
      v47[5] = buf;
      ACMContextVerifyAclConstraint(v22, v28, v29, 1u, v48, 1u, 0xFFFFFFFF, (uint64_t)v47);
      ACMContextDelete(v22, 0);
    }
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v30 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:]();
      }

      _Block_object_dispose(buf, 8);
      uint64_t v31 = -5;
      goto LABEL_29;
    }
    _Block_object_dispose(buf, 8);
    BOOL v32 = 0;
  }
  else
  {
    if (v11 == -536870170) {
      uint64_t v31 = -1;
    }
    else {
      uint64_t v31 = -3;
    }
    if (v11 != -536363000 && v11 != -536870194) {
      goto LABEL_29;
    }
    BOOL v32 = v11 == -536870194;
    if (!v14) {
      goto LABEL_25;
    }
  }
  [v18 setObject:v14 forKeyedSubscript:@"operation"];
LABEL_25:
  uint64_t v31 = -9;
  if (v13)
  {
    if (v32)
    {
      id v33 = v13;
      v34 = ACMContextCreateWithExternalForm((_OWORD *)[v33 bytes], objc_msgSend(v33, "length"));
      v35 = v34;
      if (v34)
      {
        ACMContextRemovePassphraseCredentialsByPurposeAndScope(v34, 0, 1);
        ACMContextDelete(v35, 0);
      }
    }
  }
LABEL_29:
  if (!*a3)
  {
    v36 = (void *)MEMORY[0x1E4F28C58];
    v37 = (void *)[v18 copy];
    *a3 = [v36 errorWithDomain:@"CryptoTokenKit" code:v31 userInfo:v37];
  }
  if (v31 != -9) {
    goto LABEL_34;
  }
  v38 = TK_LOG_sepkey_0();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    v39 = [(TKLocalSEPKey *)self callerName];
    v40 = [(TKLocalSEPKey *)self accessControl];
    *(_DWORD *)buf = 138544386;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v39;
    *(_WORD *)&buf[22] = 2114;
    id v50 = v14;
    __int16 v51 = 2114;
    *(void *)v52 = v40;
    *(_WORD *)&v52[8] = 2114;
    *(void *)v53 = v46;
    _os_log_debug_impl(&dword_1BED55000, v38, OS_LOG_TYPE_DEBUG, "%{public}@: (%{public}@) authentication needed for operation '%{public}@' ACL=%{public}@ params=%{public}@", buf, 0x34u);
  }
LABEL_36:

  return 0;
}

uint64_t __75__TKLocalSEPKey_error_withAKSReturn_ACMHandle_AKSOperation_params_message___block_invoke(uint64_t result, int a2, char a3, uint64_t a4)
{
  if (!a2 && (a3 & 1) == 0)
  {
    uint64_t v4 = result;
    uint64_t result = [*(id *)(result + 32) evaluateRequirementIgnoringAccessGroups:a4];
    if (result) {
      *(unsigned char *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t __38__TKLocalSEPKey_authContextWithError___block_invoke()
{
  v0 = [[TKSharedResourceSlot alloc] initWithName:@"LAContext/ACMHandle temporary default slot"];
  v1 = (void *)authContextWithError__sharedResourceSlot;
  authContextWithError__sharedResourceSlot = (uint64_t)v0;

  [(id)authContextWithError__sharedResourceSlot setIdleTimeout:3.0];
  [(id)authContextWithError__sharedResourceSlot setCreateObjectBlock:&__block_literal_global_136];
  uint64_t v2 = (void *)authContextWithError__sharedResourceSlot;

  return [v2 setObjectDestroyedBlock:&__block_literal_global_141];
}

void __38__TKLocalSEPKey_authContextWithError___block_invoke_138()
{
  v0 = TK_LOG_sepkey_0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __38__TKLocalSEPKey_authContextWithError___block_invoke_138_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

+ (id)_testing_keybagHandle
{
  return (id)_testing_keybagHandle;
}

+ (void)set_testing_keybagHandle:(id)a3
{
}

+ (void)setupKeybagForTesting:(BOOL)a3
{
  if (a3)
  {
    if (!_testingKeybagHandle)
    {
      if (aks_create_bag())
      {
        uint64_t v4 = TK_LOG_sepkey_0();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
          +[TKLocalSEPKey setupKeybagForTesting:]();
        }
      }
      if (aks_ref_key_enable_test_keys())
      {
        uint64_t v5 = TK_LOG_sepkey_0();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          +[TKLocalSEPKey setupKeybagForTesting:]();
        }
      }
      aks_get_device_state();
      uint64_t v6 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        +[TKLocalSEPKey setupKeybagForTesting:]();
      }
    }
  }
  else if (_testingKeybagHandle)
  {
    if (aks_save_bag())
    {
      uint64_t v7 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        +[TKLocalSEPKey setupKeybagForTesting:].cold.6();
      }
    }
    if (aks_unload_bag())
    {
      uint64_t v8 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[TKLocalSEPKey setupKeybagForTesting:].cold.5();
      }
    }
    if (aks_invalidate_bag())
    {
      uint64_t v9 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        +[TKLocalSEPKey setupKeybagForTesting:].cold.4();
      }
    }
  }
  _enableTesting = a3;
}

+ (id)_testing_callerEntitlements
{
  return (id)_testingCallerEntitlements;
}

+ (void)set_testing_callerEntitlements:(id)a3
{
}

void __39__TKLocalSEPKey_protectionForKeyClass___block_invoke()
{
  v10[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F3B5B0];
  v9[0] = &unk_1F19F80C0;
  v9[1] = &unk_1F19F80D8;
  uint64_t v1 = *MEMORY[0x1E4F3B570];
  v10[0] = v0;
  v10[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F3B588];
  v9[2] = &unk_1F19F80F0;
  v9[3] = &unk_1F19F8108;
  uint64_t v3 = *MEMORY[0x1E4F3B5B8];
  v10[2] = v2;
  v10[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F3B578];
  v9[4] = &unk_1F19F8120;
  void v9[5] = &unk_1F19F8138;
  uint64_t v5 = *MEMORY[0x1E4F3B598];
  v10[4] = v4;
  v10[5] = v5;
  v9[6] = &unk_1F19F8150;
  v9[7] = &unk_1F19F8168;
  uint64_t v6 = *MEMORY[0x1E4F3B5A0];
  v10[6] = *MEMORY[0x1E4F3B5A8];
  v10[7] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:8];
  uint64_t v8 = (void *)protectionForKeyClass__protections;
  protectionForKeyClass__protections = v7;
}

+ (int)keyClassForProtection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (keyClassForProtection__once == -1)
  {
    if (!v3)
    {
LABEL_6:
      int v7 = 6;
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&keyClassForProtection__once, &__block_literal_global_164);
    if (!v4) {
      goto LABEL_6;
    }
  }
  uint64_t v5 = [(id)keyClassForProtection__protections objectForKeyedSubscript:v4];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = v5;
  int v7 = [v5 integerValue];

LABEL_7:
  return v7;
}

void __39__TKLocalSEPKey_keyClassForProtection___block_invoke()
{
  v7[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F3B570];
  v6[0] = *MEMORY[0x1E4F3B5B0];
  v6[1] = v0;
  v7[0] = &unk_1F19F80C0;
  v7[1] = &unk_1F19F80D8;
  uint64_t v1 = *MEMORY[0x1E4F3B5B8];
  v6[2] = *MEMORY[0x1E4F3B588];
  v6[3] = v1;
  v7[2] = &unk_1F19F80F0;
  v7[3] = &unk_1F19F8108;
  uint64_t v2 = *MEMORY[0x1E4F3B598];
  v6[4] = *MEMORY[0x1E4F3B578];
  v6[5] = v2;
  v7[4] = &unk_1F19F8120;
  v7[5] = &unk_1F19F8138;
  uint64_t v3 = *MEMORY[0x1E4F3B5A0];
  v6[6] = *MEMORY[0x1E4F3B5A8];
  v6[7] = v3;
  v7[6] = &unk_1F19F8150;
  v7[7] = &unk_1F19F8168;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:8];
  uint64_t v5 = (void *)keyClassForProtection__protections;
  keyClassForProtection__protections = v4;
}

- (BOOL)systemKey
{
  return 0;
}

- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10
{
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  LOBYTE(v22) = a9;
  id v20 = [[TKLocalSEPRefKey alloc] _initWithKeyType:v19 keySize:a4 accessControl:a5 options:v18 authContext:v17 caller:v16 forceSystemSession:v22 error:a10];

  return v20;
}

- (BOOL)callerHasEntitlement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [(TKLocalSEPKey *)self valueForEntitlement:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 BOOLValue])
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = TK_LOG_sepkey_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[TKLocalSEPKey callerHasEntitlement:error:](self, (uint64_t)v6, v9);
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:0];
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)callerName
{
  if (!self->_callerName)
  {
    uint64_t v3 = [(TKLocalSEPKey *)self caller];

    if (v3)
    {
      memset(&audittoken, 0, sizeof(audittoken));
      uint64_t v4 = [(TKLocalSEPKey *)self caller];
      uint64_t v5 = v4;
      if (v4) {
        [v4 auditToken];
      }
      else {
        memset(&audittoken, 0, sizeof(audittoken));
      }

      id v9 = [MEMORY[0x1E4F1CA58] dataWithLength:4096];
      int v10 = proc_pidpath_audittoken(&audittoken, (void *)[v9 mutableBytes], objc_msgSend(v9, "length"));
      id v11 = [NSString alloc];
      id v6 = v9;
      uint64_t v12 = objc_msgSend(v11, "initWithBytes:length:encoding:", objc_msgSend(v6, "bytes"), v10, 4);
      id v13 = NSString;
      id v14 = [v12 lastPathComponent];
      id v15 = [(TKLocalSEPKey *)self caller];
      id v16 = [v13 stringWithFormat:@"%@<%d>", v14, objc_msgSend(v15, "processIdentifier")];
      callerName = self->_callerName;
      self->_callerName = v16;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28F80] processInfo];
      int v7 = [v6 processName];
      BOOL v8 = self->_callerName;
      self->_callerName = v7;
    }
  }
  id v18 = self->_callerName;

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sac, 0);
  objc_storeStrong((id *)&self->_caller, 0);

  objc_storeStrong((id *)&self->_callerName, 0);
}

- (void)error:withAKSReturn:ACMHandle:AKSOperation:params:message:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Authentication failure due to access groups detected, forcing hard failure", v2, v3, v4, v5, v6);
}

- (void)error:withAKSReturn:ACMHandle:AKSOperation:params:message:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Checking whether kAKSReturnPolicyError is because of unsatisfied access groups", v2, v3, v4, v5, v6);
}

- (void)authContextWithError:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a1) {
    uint64_t v2 = *a1;
  }
  else {
    uint64_t v2 = 0;
  }
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1BED55000, a2, OS_LOG_TYPE_FAULT, "failed to create shared resource: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)authContextWithError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1BED55000, a1, a3, "LAContext.externalizedContext(sn=%d) failed", a5, a6, a7, a8, 0);
}

void __38__TKLocalSEPKey_authContextWithError___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_1(&dword_1BED55000, a2, a3, "creating temporary context(sn=%d)", a5, a6, a7, a8, 0);
}

void __38__TKLocalSEPKey_authContextWithError___block_invoke_138_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_1(&dword_1BED55000, a1, a3, "deleting temporary context(sn=%d)", a5, a6, a7, a8, 0);
}

+ (void)keybagHandleForceSystemSession:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "using system_keychain_handle, forced by client", v2, v3, v4, v5, v6);
}

+ (void)setupKeybagForTesting:.cold.1()
{
  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1BED55000, v0, OS_LOG_TYPE_FAULT, "Test keys not enabled for testing keybag!", v1, 2u);
}

+ (void)setupKeybagForTesting:.cold.2()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1BED55000, v0, v1, "Failed to enable test keys, err=%08x", v2, v3, v4, v5, v6);
}

+ (void)setupKeybagForTesting:.cold.3()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1BED55000, v0, v1, "Failed to create testing keybag, err=%08x", v2, v3, v4, v5, v6);
}

+ (void)setupKeybagForTesting:.cold.4()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1BED55000, v0, v1, "Failed to invalidate testing keybag, err=%08x", v2, v3, v4, v5, v6);
}

+ (void)setupKeybagForTesting:.cold.5()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1BED55000, v0, v1, "Failed to unload testing keybag, err=%08x", v2, v3, v4, v5, v6);
}

+ (void)setupKeybagForTesting:.cold.6()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1BED55000, v0, v1, "Failed to save testing keybag, err=%08x", v2, v3, v4, v5, v6);
}

- (void)callerHasEntitlement:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 callerName];
  int v6 = 138543618;
  int v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_1BED55000, a3, OS_LOG_TYPE_FAULT, "Requested SEP key operation not allowed (%{public}@ is missing '%{public}@' entitlement)", (uint8_t *)&v6, 0x16u);
}

@end