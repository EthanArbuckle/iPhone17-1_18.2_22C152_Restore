@interface TKSEPKey
+ (BOOL)canUseSEPLocally;
+ (BOOL)hasSEP;
+ (BOOL)isDaytona;
+ (BOOL)isGibraltar;
+ (NSDictionary)_testing_callerEntitlements;
+ (NSNumber)_testing_keybagHandle;
+ (TKClientToken)clientToken;
+ (void)setClientToken:(id)a3;
+ (void)setContextErrorHandler:(id)a3;
+ (void)set_testing_callerEntitlements:(id)a3;
+ (void)set_testing_keybagHandle:(id)a3;
+ (void)setupKeybagForTesting:(BOOL)a3;
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4;
- (BOOL)systemKey;
- (BOOL)systemSessionKey;
- (LAContext)authContext;
- (NSDictionary)attributes;
- (TKSEPKey)initWithAttributes:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6;
- (TKSEPKey)initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 error:(id *)a9;
- (TKSEPKey)initWithObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6;
- (__SecAccessControl)accessControl;
- (id)_initWithAuthContext:(id)a3;
- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5;
- (id)computeSharedSecret:(id)a3 error:(id *)a4;
- (id)decapsulateKey:(id)a3 error:(id *)a4;
- (id)initLocalWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10;
- (id)initLocalWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7;
- (id)keySize;
- (id)keyType;
- (id)objectID;
- (id)publicKeyWithError:(id *)a3;
- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5;
- (id)signDigest:(id)a3 error:(id *)a4;
- (void)attributes;
- (void)setAuthContext:(id)a3;
@end

@implementation TKSEPKey

- (id)initLocalWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[TKLocalSEPKey alloc] _initWithObjectID:v14 authContext:v13 caller:v12 forceSystemSession:v8 error:a7];

  return v15;
}

- (id)_initWithAuthContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKSEPKey;
  v6 = [(TKSEPKey *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authContext, a3);
  }

  return v7;
}

- (LAContext)authContext
{
  return self->_authContext;
}

+ (TKClientToken)clientToken
{
  return (TKClientToken *)(id)_clientToken;
}

+ (BOOL)hasSEP
{
  return +[TKLocalSEPKey hasSEP];
}

+ (BOOL)isDaytona
{
  return +[TKLocalSEPKey isDaytona];
}

+ (BOOL)isGibraltar
{
  return +[TKLocalSEPKey isGibraltar];
}

+ (void)setClientToken:(id)a3
{
}

+ (void)setupKeybagForTesting:(BOOL)a3
{
}

+ (NSDictionary)_testing_callerEntitlements
{
  return (NSDictionary *)+[TKLocalSEPKey _testing_callerEntitlements];
}

+ (void)set_testing_callerEntitlements:(id)a3
{
}

+ (NSNumber)_testing_keybagHandle
{
  return (NSNumber *)+[TKLocalSEPKey _testing_keybagHandle];
}

+ (void)set_testing_keybagHandle:(id)a3
{
}

+ (void)setContextErrorHandler:(id)a3
{
}

+ (BOOL)canUseSEPLocally
{
  v2 = [a1 clientToken];

  if (v2) {
    return 0;
  }
  if (canUseSEPLocally_onceToken != -1) {
    dispatch_once(&canUseSEPLocally_onceToken, &__block_literal_global_3);
  }
  return canUseSEPLocally_hasEntitlement;
}

void __28__TKSEPKey_canUseSEPLocally__block_invoke()
{
  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  v1 = (void *)SecTaskCopyValueForEntitlement(v0, @"com.apple.keystore.access-keychain-keys", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v1 integerValue])
  {
    v2 = TK_LOG_sepkey();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1BED55000, v2, OS_LOG_TYPE_INFO, "Detected com.apple.keystore.access-keychain-keys entitlement, using in-process SEP SecKey implementation", v5, 2u);
    }

    canUseSEPLocally_hasEntitlement = 1;
    v3 = (void *)SecTaskCopyValueForEntitlement(v0, @"com.apple.keystore.sik.access", 0);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v3 integerValue])
    {
      v4 = TK_LOG_sepkey();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __28__TKSEPKey_canUseSEPLocally__block_invoke_cold_1(v4);
      }
    }
  }
  else
  {
    v3 = v1;
  }
}

- (TKSEPKey)initWithObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [[TKBERTLVRecord alloc] initWithPropertyList:v10];
    uint64_t v13 = [(TKTLVRecord *)v12 data];

    id v10 = (id)v13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_16:
    if ([(id)objc_opt_class() canUseSEPLocally]) {
      id v14 = [[TKLocalSEPKey alloc] _initWithObjectID:v10 authContext:v11 caller:0 forceSystemSession:v7 error:a6];
    }
    else {
      id v14 = [[TKRemoteSEPKey alloc] _initWithObjectID:v10 authContext:v11 forceSystemSession:v7 error:a6];
    }
    a6 = v14;
  }
  else if (a6)
  {
    v16 = TK_LOG_sepkey();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[TKSEPKey initWithObjectID:authContext:forceSystemSession:error:]((uint64_t)v10, v16);
    }

    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28228];
    v20[0] = @"objectID of unexpected type";
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a6 = [v17 errorWithDomain:@"CryptoTokenKit" code:-3 userInfo:v18];

    a6 = 0;
  }

  return (TKSEPKey *)a6;
}

- (TKSEPKey)initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  if ([(id)objc_opt_class() canUseSEPLocally])
  {
    LOBYTE(v21) = v9;
    v18 = [[TKLocalSEPKey alloc] _initWithKeyType:v17 keySize:a4 accessControl:a5 options:v16 authContext:v15 caller:0 forceSystemSession:v21 error:a9];
  }
  else
  {
    v18 = [[TKRemoteSEPKey alloc] _initWithKeyType:v17 keySize:a4 accessControl:a5 options:v16 authContext:v15 forceSystemSession:v9 error:a9];
  }
  uint64_t v19 = v18;

  return v19;
}

- (id)initLocalWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10
{
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  LOBYTE(v22) = a9;
  id v20 = [[TKLocalSEPKey alloc] _initWithKeyType:v19 keySize:a4 accessControl:a5 options:v18 authContext:v17 caller:v16 forceSystemSession:v22 error:a10];

  return v20;
}

- (id)objectID
{
  return 0;
}

- (__SecAccessControl)accessControl
{
  return (__SecAccessControl *)*MEMORY[0x1E4F1D260];
}

- (id)keyType
{
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"%s must be overriden", "-[TKSEPKey keyType]");
  v2 = (void *)*MEMORY[0x1E4F3B718];

  return v2;
}

- (id)keySize
{
  return 0;
}

- (BOOL)systemKey
{
  return 0;
}

- (BOOL)systemSessionKey
{
  return 0;
}

- (BOOL)deleteWithError:(id *)a3
{
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
  }
  return 0;
}

- (id)publicKeyWithError:(id *)a3
{
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
  }
  return 0;
}

- (id)signDigest:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
  }
  return 0;
}

- (id)computeSharedSecret:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
  }
  return 0;
}

- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
  }
  return 0;
}

- (id)decapsulateKey:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
  }
  return 0;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
  }
  return 0;
}

- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
  }
  return 0;
}

- (NSDictionary)attributes
{
  v30[17] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F3B978];
  v30[0] = *MEMORY[0x1E4F3B9A0];
  uint64_t v4 = *MEMORY[0x1E4F3B718];
  v29[0] = v3;
  v29[1] = v4;
  id v5 = [(TKSEPKey *)self keyType];
  v30[1] = v5;
  v29[2] = *MEMORY[0x1E4F3B708];
  v6 = [(TKSEPKey *)self keySize];
  v30[2] = v6;
  v29[3] = *MEMORY[0x1E4F3B680];
  BOOL v7 = [(TKSEPKey *)self keySize];
  uint64_t v8 = *MEMORY[0x1E4F3B6D8];
  uint64_t v9 = *MEMORY[0x1E4F3B6E8];
  v30[3] = v7;
  v30[4] = v9;
  uint64_t v10 = *MEMORY[0x1E4F3B6C0];
  v29[4] = v8;
  v29[5] = v10;
  uint64_t v11 = *MEMORY[0x1E4F3B6A0];
  v30[5] = MEMORY[0x1E4F1CC38];
  v30[6] = MEMORY[0x1E4F1CC28];
  uint64_t v12 = *MEMORY[0x1E4F3B690];
  v29[6] = v11;
  v29[7] = v12;
  uint64_t v13 = *MEMORY[0x1E4F3B908];
  v30[7] = MEMORY[0x1E4F1CC28];
  v30[8] = MEMORY[0x1E4F1CC38];
  uint64_t v14 = *MEMORY[0x1E4F3B628];
  v29[8] = v13;
  v29[9] = v14;
  uint64_t v15 = *MEMORY[0x1E4F3B618];
  v30[9] = MEMORY[0x1E4F1CC28];
  v30[10] = MEMORY[0x1E4F1CC28];
  uint64_t v16 = *MEMORY[0x1E4F3B620];
  v29[10] = v15;
  v29[11] = v16;
  uint64_t v17 = *MEMORY[0x1E4F3B630];
  v30[11] = MEMORY[0x1E4F1CC38];
  v30[12] = MEMORY[0x1E4F1CC38];
  uint64_t v18 = *MEMORY[0x1E4F3B640];
  v29[12] = v17;
  v29[13] = v18;
  uint64_t v19 = *MEMORY[0x1E4F3B648];
  v30[13] = MEMORY[0x1E4F1CC28];
  v30[14] = MEMORY[0x1E4F1CC28];
  uint64_t v20 = *MEMORY[0x1E4F3B548];
  v29[14] = v19;
  v29[15] = v20;
  [(TKSEPKey *)self accessControl];
  uint64_t v21 = (void *)SecAccessControlCopyData();
  v30[15] = v21;
  v29[16] = *MEMORY[0x1E4F3B8B0];
  uint64_t v22 = [(TKSEPKey *)self objectID];
  v30[16] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:17];
  v24 = (void *)[v23 mutableCopy];

  id v25 = (id)*MEMORY[0x1E4F3BD20];
  if ([(TKSEPKey *)self systemSessionKey] && v25)
  {
    v26 = TK_LOG_sepkey();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      [(TKSEPKey *)(uint64_t)self attributes];
    }

    [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v25];
  }
  v27 = (void *)[v24 copy];

  return (NSDictionary *)v27;
}

- (TKSEPKey)initWithAttributes:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6
{
  BOOL v64 = a5;
  v136[17] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v67 = a4;
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__1;
  v110 = __Block_byref_object_dispose__1;
  id v111 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v100 = 0;
  v101 = (id *)&v100;
  uint64_t v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__1;
  v104 = __Block_byref_object_dispose__1;
  id v105 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v99 = 0;
  uint64_t v8 = *MEMORY[0x1E4F3B9A0];
  v135[0] = *MEMORY[0x1E4F3B978];
  v135[1] = v8;
  id obja = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:2];
  v136[0] = obja;
  uint64_t v9 = *MEMORY[0x1E4F3B6E8];
  v134[0] = *MEMORY[0x1E4F3B6D8];
  v134[1] = v9;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:2];
  v136[1] = v83;
  uint64_t v65 = *MEMORY[0x1E4F3B718];
  v133[0] = *MEMORY[0x1E4F3B718];
  v81 = [MEMORY[0x1E4F1CA98] null];
  v133[1] = v81;
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke;
  v95[3] = &unk_1E63C85C8;
  v95[4] = &v100;
  v79 = (void *)MEMORY[0x1C189CA40](v95);
  v133[2] = v79;
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:3];
  v136[2] = v78;
  v132[0] = *MEMORY[0x1E4F3B708];
  v132[1] = &unk_1F19F80A8;
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_24;
  v94[3] = &unk_1E63C85F0;
  v94[4] = &v96;
  v94[5] = &v100;
  v77 = (void *)MEMORY[0x1C189CA40](v94);
  v132[2] = v77;
  v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:3];
  v136[3] = v76;
  v131[0] = *MEMORY[0x1E4F3B680];
  v131[1] = &unk_1F19F80A8;
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_2_25;
  v93[3] = &unk_1E63C85C8;
  v93[4] = &v96;
  v75 = (void *)MEMORY[0x1C189CA40](v93);
  v131[2] = v75;
  v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:3];
  v136[4] = v74;
  uint64_t v130 = *MEMORY[0x1E4F3BD38];
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];
  v136[5] = v73;
  uint64_t v10 = v107[5];
  uint64_t v63 = *MEMORY[0x1E4F3B548];
  v129[0] = *MEMORY[0x1E4F3B548];
  v129[1] = v10;
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_3;
  v92[3] = &unk_1E63C85C8;
  v92[4] = &v106;
  v72 = (void *)MEMORY[0x1C189CA40](v92);
  v129[2] = v72;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:3];
  v136[6] = v71;
  uint64_t v11 = MEMORY[0x1E4F1CC38];
  v128[0] = *MEMORY[0x1E4F3B6C0];
  v128[1] = MEMORY[0x1E4F1CC38];
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];
  v136[7] = v70;
  uint64_t v12 = MEMORY[0x1E4F1CC28];
  v127[0] = *MEMORY[0x1E4F3B6A0];
  v127[1] = MEMORY[0x1E4F1CC28];
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
  v136[8] = v69;
  v126[0] = *MEMORY[0x1E4F3B690];
  v126[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:2];
  v136[9] = v13;
  v125[0] = *MEMORY[0x1E4F3B908];
  v125[1] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:2];
  v136[10] = v14;
  v124[0] = *MEMORY[0x1E4F3B628];
  v124[1] = v12;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:2];
  v136[11] = v15;
  v123[0] = *MEMORY[0x1E4F3B618];
  v123[1] = v12;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:2];
  v136[12] = v16;
  v122[0] = *MEMORY[0x1E4F3B620];
  v122[1] = v11;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:2];
  v136[13] = v17;
  v121[0] = *MEMORY[0x1E4F3B630];
  v121[1] = v11;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:2];
  v136[14] = v18;
  v120[0] = *MEMORY[0x1E4F3B640];
  v120[1] = v12;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:2];
  v136[15] = v19;
  v119[0] = *MEMORY[0x1E4F3B648];
  v119[1] = v12;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
  v136[16] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:17];

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = v21;
  uint64_t v22 = [obj countByEnumeratingWithState:&v88 objects:v118 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v89;
    uint64_t v84 = *MEMORY[0x1E4F28228];
LABEL_3:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v89 != v23) {
        objc_enumerationMutation(obj);
      }
      id v25 = *(void **)(*((void *)&v88 + 1) + 8 * v24);
      v26 = [v25 objectAtIndexedSubscript:0];
      if ((unint64_t)[v25 count] < 2)
      {
        v27 = 0;
      }
      else
      {
        v27 = [v25 objectAtIndexedSubscript:1];
      }
      v28 = [v7 objectForKeyedSubscript:v26];
      if ((unint64_t)[v25 count] < 3)
      {
        v30 = 0;
        if (v28)
        {
LABEL_11:
          if (v30)
          {
            ((void (**)(void, void *))v30)[2](v30, v28);
            id v31 = (id)objc_claimAutoreleasedReturnValue();
            if (!v31) {
              goto LABEL_35;
            }
          }
          else
          {
            if ([v27 isEqual:v28]) {
              v35 = v27;
            }
            else {
              v35 = 0;
            }
            id v31 = v35;
            if (!v31)
            {
LABEL_35:
              if (a6)
              {
                v44 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v116 = v84;
                v45 = [NSString stringWithFormat:@"sepkey: %@ requires '%@' value when present", v26, v27];
                v117 = v45;
                v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
                *a6 = [v44 errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:v46];
              }
              v47 = 0;
              v42 = obj;
              goto LABEL_46;
            }
          }

          goto LABEL_25;
        }
      }
      else
      {
        v29 = [v25 objectAtIndex:2];
        v30 = (void (**)(void, void))MEMORY[0x1C189CA40]();

        if (v28) {
          goto LABEL_11;
        }
      }
      if (v27)
      {
        v32 = [MEMORY[0x1E4F1CA98] null];
        char v33 = [v27 isEqual:v32];

        if ((v33 & 1) == 0)
        {
          if (v30)
          {
            uint64_t v34 = ((void (**)(void, void *))v30)[2](v30, v27);

            v27 = (void *)v34;
          }
          [v7 setObject:v27 forKeyedSubscript:v26];
        }
      }
LABEL_25:

      if (v22 == ++v24)
      {
        uint64_t v22 = [obj countByEnumeratingWithState:&v88 objects:v118 count:16];
        if (v22) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v36 = v101[5];
  v37 = [MEMORY[0x1E4F1CA98] null];
  LODWORD(v36) = [v36 isEqual:v37];

  if (v36) {
    objc_storeStrong(v101 + 5, (id)*MEMORY[0x1E4F3B740]);
  }
  [v7 setObject:v101[5] forKeyedSubscript:v65];
  v38 = (void *)v107[5];
  v39 = [MEMORY[0x1E4F1CA98] null];
  LODWORD(v38) = [v38 isEqual:v39];

  if (v38)
  {
    id v40 = (id)*MEMORY[0x1E4F3B588];
    if (([v101[5] isEqual:*MEMORY[0x1E4F3B748]] & 1) != 0
      || ([v101[5] isEqual:*MEMORY[0x1E4F3B778]] & 1) != 0
      || [v101[5] isEqual:*MEMORY[0x1E4F3B770]])
    {
      id v41 = (id)*MEMORY[0x1E4F3B578];

      id v40 = v41;
    }
    v42 = SecAccessControlCreateWithFlags(0, v40, 0, 0);
    v43 = (void *)SecAccessControlCopyData();
    [v7 setObject:v43 forKeyedSubscript:v63];
  }
  else
  {
    v42 = (void *)SecAccessControlCreateFromData();
  }
  uint64_t v112 = *MEMORY[0x1E4F3BB20];
  v48 = NSNumber;
  uint64_t v85 = v112;
  v49 = objc_msgSend(v7, "objectForKeyedSubscript:");
  v50 = objc_msgSend(v48, "numberWithBool:", objc_msgSend(v49, "BOOLValue"));
  v115[0] = v50;
  uint64_t v113 = *MEMORY[0x1E4F3BB58];
  v51 = NSNumber;
  uint64_t v82 = v113;
  v52 = objc_msgSend(v7, "objectForKeyedSubscript:");
  v53 = objc_msgSend(v51, "numberWithBool:", objc_msgSend(v52, "BOOLValue"));
  v115[1] = v53;
  uint64_t v114 = *MEMORY[0x1E4F3BB68];
  v54 = NSNumber;
  uint64_t v80 = v114;
  v55 = objc_msgSend(v7, "objectForKeyedSubscript:");
  v56 = objc_msgSend(v54, "numberWithBool:", objc_msgSend(v55, "BOOLValue"));
  v115[2] = v56;
  v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:&v112 count:3];
  v26 = (void *)[v57 mutableCopy];

  v58 = [v7 objectForKey:@"ECCompactable"];

  if (v58)
  {
    v59 = [v7 objectForKeyedSubscript:@"ECCompactable"];
    [v26 setObject:v59 forKeyedSubscript:@"ECCompactable"];
  }
  v60 = [(TKSEPKey *)self initWithKeyType:v101[5] keySize:v97[3] accessControl:v42 options:v26 authContext:v67 forceSystemSession:v64 error:a6];
  if ([(TKSEPKey *)v60 accessControl])
  {
    [(TKSEPKey *)v60 accessControl];
    [v7 setObject:SecAccessControlGetProtection() forKeyedSubscript:*MEMORY[0x1E4F3B558]];
  }
  v61 = [(TKSEPKey *)v60 objectID];
  [v7 setObject:v61 forKeyedSubscript:*MEMORY[0x1E4F3B8B0]];

  if ([(TKSEPKey *)v60 systemSessionKey]) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD28]];
  }
  [v7 removeObjectForKey:v85];
  [v7 removeObjectForKey:@"ECCompactable"];
  [v7 removeObjectForKey:v82];
  [v7 removeObjectForKey:v80];
  v47 = v60;
  self = v47;
LABEL_46:

  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);

  _Block_object_dispose(&v106, 8);
  return v47;
}

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (_block_invoke_once != -1) {
    dispatch_once(&_block_invoke_once, &__block_literal_global_21);
  }
  if ([(id)_block_invoke_supportedTypes containsObject:v4])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_2()
{
  v5[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F3B748];
  v5[0] = *MEMORY[0x1E4F3B740];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F3B770];
  v5[2] = *MEMORY[0x1E4F3B778];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F3B780];
  v5[4] = *MEMORY[0x1E4F3B750];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E4F3B758];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  id v4 = (void *)_block_invoke_supportedTypes;
  _block_invoke_supportedTypes = v3;
}

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 integerValue];
  int v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqual:*MEMORY[0x1E4F3B758]];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!v4)
  {
    if ((v5 | 0x80) != 0x180) {
      goto LABEL_4;
    }
    goto LABEL_6;
  }
  v6 = v3;
  if (v5 != 1024)
  {
    if (v5 != 768)
    {
LABEL_4:
      v6 = 0;
      goto LABEL_7;
    }
LABEL_6:
    v6 = v3;
  }
LABEL_7:
  id v7 = v6;

  return v7;
}

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_2_25(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  if (v3 == *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    int v4 = [NSNumber numberWithInteger:v3];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);

  return v4;
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
}

void __28__TKSEPKey_canUseSEPLocally__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BED55000, log, OS_LOG_TYPE_ERROR, "Process has com.apple.keystore.access-keychain-keys entitlement but is missing com.apple.keystore.sik.access entitlement, any attestation attempt will fail", v1, 2u);
}

- (void)initWithObjectID:(uint64_t)a1 authContext:(NSObject *)a2 forceSystemSession:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BED55000, a2, OS_LOG_TYPE_ERROR, "invalid objectID used for SEPKey: %@", (uint8_t *)&v2, 0xCu);
}

- (void)attributes
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  __int16 v7 = 2114;
  uint64_t v8 = MEMORY[0x1E4F1CC38];
  _os_log_debug_impl(&dword_1BED55000, log, OS_LOG_TYPE_DEBUG, "%{public}@ system-session-key detected, returning %{public}@=%{public}@ in key's attributes", (uint8_t *)&v3, 0x20u);
}

@end