@interface TKLocalSEPSystemKey
+ (BOOL)hasSystemKey:(unsigned int)a3 ACMHandle:(id)a4;
+ (void)initSystemKeyIDs;
- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4;
- (BOOL)systemKey;
- (BOOL)systemSessionKey;
- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 isIDUnknown:(BOOL *)a6 error:(id *)a7;
- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5;
- (id)description;
- (id)keySize;
- (id)keyType;
- (id)objectID;
- (id)publicKeyWithError:(id *)a3;
- (id)signDigest:(id)a3 error:(id *)a4;
@end

@implementation TKLocalSEPSystemKey

- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 isIDUnknown:(BOOL *)a6 error:(id *)a7
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v13 = [(TKLocalSEPKey *)self _initWithAuthContext:a4 caller:a5];
  if (!v13) {
    goto LABEL_19;
  }
  [(id)objc_opt_class() initSystemKeyIDs];
  v14 = v13 + 10;
  v13[10] = 15;
  if ([v12 isEqualToData:sikData])
  {
    int v15 = 1;
LABEL_4:
    int *v14 = v15;
    v13[11] = v15;
    goto LABEL_12;
  }
  if ([v12 isEqualToData:gidData])
  {
    int v16 = 3;
LABEL_7:
    int *v14 = v16;
    int v17 = 1;
LABEL_11:
    v13[11] = v17;
    goto LABEL_12;
  }
  if ([v12 isEqualToData:proposedUikData])
  {
    int v18 = 2;
LABEL_10:
    int *v14 = v18;
    int v17 = 3;
    goto LABEL_11;
  }
  if ([v12 isEqualToData:committedUikData])
  {
    int v15 = 2;
    goto LABEL_4;
  }
  if ([v12 isEqualToData:proposedOikData])
  {
    int v18 = 6;
    goto LABEL_10;
  }
  if ([v12 isEqualToData:committedOikData])
  {
    int v31 = 6;
    goto LABEL_36;
  }
  if ([v12 isEqualToData:proposedDakData])
  {
    int v18 = 9;
    goto LABEL_10;
  }
  if ([v12 isEqualToData:committedDakData])
  {
    int v31 = 9;
    goto LABEL_36;
  }
  if ([v12 isEqualToData:proposedHavenData])
  {
    int *v14 = 7;
    int v32 = 3;
  }
  else
  {
    if (![v12 isEqualToData:committedHavenData])
    {
      if ([v12 isEqualToData:proposedSDakData])
      {
        int v18 = 10;
        goto LABEL_10;
      }
      if (![v12 isEqualToData:committedSDakData])
      {
        if (![v12 isEqualToData:dcikData])
        {
          v26 = 0;
          *a6 = 1;
          goto LABEL_29;
        }
        int v16 = 14;
        goto LABEL_7;
      }
      int v31 = 10;
LABEL_36:
      int *v14 = v31;
      int v17 = 2;
      goto LABEL_11;
    }
    int *v14 = 7;
    int v32 = 2;
  }
  v13[11] = v32;
LABEL_12:
  if (*v14 == 7) {
    v19 = @"com.apple.private.playgrounds-local-signing-allowed";
  }
  else {
    v19 = @"com.apple.security.attestation.access";
  }
  if (![v13 callerHasEntitlement:v19 error:a7]) {
    goto LABEL_28;
  }
  v20 = [v13 authContextWithError:a7];
  if (!v20)
  {
LABEL_27:

LABEL_28:
    v26 = 0;
    goto LABEL_29;
  }
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = *v14;
  v23 = [v20 ACMHandle];
  LOBYTE(v21) = [(id)v21 hasSystemKey:v22 ACMHandle:v23];

  if ((v21 & 1) == 0)
  {
    if (a7)
    {
      v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28228];
      v34[0] = @"Requested system key not supported by the platform";
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      *a7 = [v27 errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:v28];
    }
    v29 = TK_LOG_sepkey_0();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[TKLocalSEPSystemKey _initWithObjectID:authContext:caller:isIDUnknown:error:](v13, (uint64_t)(v13 + 10), v29);
    }

    goto LABEL_27;
  }
  v24 = (void *)SecAccessControlCreate();
  [v13 setSac:v24];

  [v13 accessControl];
  SecAccessControlSetProtection();
  [v13 accessControl];
  SecAccessControlAddConstraintForOperation();

LABEL_19:
  v25 = TK_LOG_sepkey_0();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:](v13);
  }

  v26 = v13;
LABEL_29:

  return v26;
}

+ (void)initSystemKeyIDs
{
  if (initSystemKeyIDs_onceToken != -1) {
    dispatch_once(&initSystemKeyIDs_onceToken, &__block_literal_global_342);
  }
}

uint64_t __39__TKLocalSEPSystemKey_initSystemKeyIDs__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.sik" length:21];
  v1 = (void *)sikData;
  sikData = v0;

  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.gid" length:21];
  v3 = (void *)gidData;
  gidData = v2;

  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.uikp" length:22];
  v5 = (void *)proposedUikData;
  proposedUikData = v4;

  uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.uikc" length:22];
  v7 = (void *)committedUikData;
  committedUikData = v6;

  uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.oikp" length:22];
  v9 = (void *)proposedOikData;
  proposedOikData = v8;

  uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.oikc" length:22];
  v11 = (void *)committedOikData;
  committedOikData = v10;

  uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.dakp" length:22];
  v13 = (void *)proposedDakData;
  proposedDakData = v12;

  uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.dakc" length:22];
  int v15 = (void *)committedDakData;
  committedDakData = v14;

  uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.havenp" length:24];
  int v17 = (void *)proposedHavenData;
  proposedHavenData = v16;

  uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.havenc" length:24];
  v19 = (void *)committedHavenData;
  committedHavenData = v18;

  uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.sdakp" length:23];
  uint64_t v21 = (void *)proposedSDakData;
  proposedSDakData = v20;

  uint64_t v22 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.sdakc" length:23];
  v23 = (void *)committedSDakData;
  committedSDakData = v22;

  dcikData = [MEMORY[0x1E4F1C9B8] dataWithBytes:"com.apple.setoken.dcik" length:22];

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)hasSystemKey:(unsigned int)a3 ACMHandle:(id)a4
{
  id v5 = a4;
  BOOL v6 = 0;
  if (a3 <= 0xE)
  {
    if (((1 << a3) & 0x4684) != 0)
    {
      int v7 = hasSystemKey_ACMHandle__supported[a3];
      if (!v7)
      {
        int v8 = aks_system_key_collection();
        int v9 = v8;
        if (a3 != 14 && v8) {
          int v9 = aks_system_key_collection();
        }
        if (v9)
        {
          uint64_t v10 = TK_LOG_sepkey_0();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            +[TKLocalSEPSystemKey hasSystemKey:ACMHandle:]();
          }

          int v7 = -1;
        }
        else
        {
          free(0);
          int v7 = 1;
        }
        hasSystemKey_ACMHandle__supported[a3] = v7;
      }
LABEL_21:
      BOOL v6 = v7 > 0;
      goto LABEL_22;
    }
    if (((1 << a3) & 0xA) != 0)
    {
      BOOL v6 = 1;
    }
    else if (a3 == 6)
    {
      int v7 = hasSystemKey_ACMHandle__supported_343;
      if (!hasSystemKey_ACMHandle__supported_343)
      {
        v11 = objc_alloc_init(TKAKSParameters);
        [(TKAKSParameters *)v11 setData:v5 forKey:3];
        [(TKAKSParameters *)v11 bytes];
        [(TKAKSParameters *)v11 length];
        if (aks_system_key_collection())
        {
          uint64_t v12 = TK_LOG_sepkey_0();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            +[TKLocalSEPSystemKey hasSystemKey:ACMHandle:]();
          }

          int v13 = -1;
        }
        else
        {
          free(0);
          int v13 = 1;
        }
        hasSystemKey_ACMHandle__supported_343 = v13;

        int v7 = hasSystemKey_ACMHandle__supported_343;
      }
      goto LABEL_21;
    }
  }
LABEL_22:

  return v6;
}

- (id)objectID
{
  v3 = [MEMORY[0x1E4F1C9B8] data];
  switch(self->_AKSSystemKeyType)
  {
    case 1u:
      uint64_t v4 = (void *)sikData;
      goto LABEL_13;
    case 2u:
      unsigned int AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      BOOL v6 = &proposedUikData;
      int v7 = &committedUikData;
      goto LABEL_9;
    case 3u:
      uint64_t v4 = (void *)gidData;
      goto LABEL_13;
    case 6u:
      unsigned int AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      BOOL v6 = &proposedOikData;
      int v7 = &committedOikData;
      goto LABEL_9;
    case 7u:
      unsigned int AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      BOOL v6 = &proposedHavenData;
      int v7 = &committedHavenData;
      goto LABEL_9;
    case 9u:
      unsigned int AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      BOOL v6 = &proposedDakData;
      int v7 = &committedDakData;
      goto LABEL_9;
    case 0xAu:
      unsigned int AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      BOOL v6 = &proposedSDakData;
      int v7 = &committedSDakData;
LABEL_9:
      if (AKSSystemKeyGeneration == 3) {
        int v8 = (void **)v6;
      }
      else {
        int v8 = (void **)v7;
      }
      uint64_t v4 = *v8;
      goto LABEL_13;
    case 0xEu:
      uint64_t v4 = (void *)dcikData;
LABEL_13:
      id v9 = v4;

      v3 = v9;
      break;
    default:
      break;
  }

  return v3;
}

- (id)keyType
{
  return (id)*MEMORY[0x1E4F3B778];
}

- (id)keySize
{
  if (self->_AKSSystemKeyType == 7) {
    return &unk_1F19F8198;
  }
  else {
    return &unk_1F19F8180;
  }
}

- (BOOL)systemKey
{
  return 1;
}

- (BOOL)systemSessionKey
{
  return 1;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_debugID && !aks_system_key_get_public())
  {
    v14[0] = 0;
    v14[1] = 0;
    int v15 = 0;
    ccsha1_di();
    ccdigest();
    free(0);
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
      unint64_t v4 = *((unsigned __int8 *)v14 + v3++) | (v4 << 8);
    while (v3 != 8);
    self->_debugID = v4;
  }
  uint64_t AKSSystemKeyType = self->_AKSSystemKeyType;
  BOOL v6 = @"sik";
  switch((int)AKSSystemKeyType)
  {
    case 1:
      goto LABEL_19;
    case 2:
      unsigned int AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      int v8 = @"uik-c";
      id v9 = @"uik-p";
      goto LABEL_14;
    case 3:
      BOOL v6 = @"gid";
      goto LABEL_19;
    case 6:
      unsigned int AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      int v8 = @"oik-c";
      id v9 = @"oik-p";
      goto LABEL_14;
    case 7:
      unsigned int AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      int v8 = @"haven-c";
      id v9 = @"haven-p";
      goto LABEL_14;
    case 9:
      unsigned int AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      int v8 = @"dak-c";
      id v9 = @"dak-p";
      goto LABEL_14;
    case 10:
      unsigned int AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      int v8 = @"sdak-c";
      id v9 = @"sdak-p";
LABEL_14:
      if (AKSSystemKeyGeneration == 3) {
        v11 = v9;
      }
      else {
        v11 = v8;
      }
      uint64_t v10 = v11;
      goto LABEL_18;
    case 14:
      BOOL v6 = @"dcik";
      goto LABEL_19;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN!%d(%d)", AKSSystemKeyType, self->_AKSSystemKeyGeneration);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      BOOL v6 = v10;
LABEL_19:
      uint64_t v12 = [NSString stringWithFormat:@"<sepk:%@ kid=%016llx>", v6, self->_debugID];

      return v12;
  }
}

- (id)publicKeyWithError:(id *)a3
{
  uint64_t v5 = aks_system_key_get_public();
  if (v5)
  {
    [(TKLocalSEPKey *)self error:a3 withAKSReturn:v5 ACMHandle:0 AKSOperation:0 params:0 message:@"unable to get public key"];
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:0 length:0];
    int v7 = TK_LOG_sepkey_0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[TKLocalSEPSystemKey publicKeyWithError:]();
    }
  }

  return v6;
}

- (id)signDigest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_AKSSystemKeyType == 7
    && ![(TKLocalSEPKey *)self callerHasEntitlement:@"com.apple.private.playgrounds-local-signing-allowed" error:a4])
  {
    int v15 = 0;
  }
  else
  {
    int v7 = [(TKLocalSEPKey *)self authContextWithError:a4];
    int v8 = v7;
    if (v7)
    {
      id v9 = [v7 ACMHandle];
      uint64_t v10 = [(TKLocalSEPKey *)self parametersWithACMHandle:v9];

      [v10 bytes];
      [v10 length];
      id v18 = v6;
      id v11 = v6;
      [v11 bytes];
      [v11 length];
      uint64_t v12 = aks_system_key_sign();
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = [v8 ACMHandle];
        [(TKLocalSEPKey *)self error:a4 withAKSReturn:v13 ACMHandle:v14 AKSOperation:@"osgn" params:v10 message:@"unable to sign digest"];

        int v15 = 0;
      }
      else
      {
        uint64_t v16 = TK_LOG_sepkey_0();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[TKLocalSEPRefKey signDigest:error:]();
        }

        int v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:0 length:0];
      }
      id v6 = v18;
    }
    else
    {
      int v15 = 0;
    }
  }

  return v15;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (![(TKLocalSEPKey *)self callerHasEntitlement:@"com.apple.security.attestation.access" error:a5])
  {
    uint64_t v20 = 0;
    goto LABEL_51;
  }
  id v11 = [(TKLocalSEPKey *)self authContextWithError:a5];
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 ACMHandle];
    uint64_t v14 = [(TKLocalSEPKey *)self parametersWithACMHandle:v13];

    if (v10) {
      [v14 setData:v10 forKey:4];
    }
    id v15 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:a2 object:self file:@"TKLocalSEPKey.m" lineNumber:1487 description:@"Only TKLocalSEPKey instances can be attested"];
    }
    unsigned int AKSSystemKeyType = self->_AKSSystemKeyType;
    if (AKSSystemKeyType == 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v42 = v15;
        [v15 AKSRefKey];
        [v14 bytes];
        [v14 length];
        uint64_t v17 = aks_gid_attest();
        id v18 = TK_LOG_sepkey_0();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 138543874;
        *(void *)v44 = self;
        *(_WORD *)&v44[8] = 2112;
        *(void *)v45 = v14;
        *(_WORD *)&v45[8] = 1024;
        *(_DWORD *)v46 = v17;
        v19 = "aks_gid_attest(%{public}@, %@) -> %08x";
        goto LABEL_17;
      }
      if (a5)
      {
        *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
      }
      int v31 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[TKLocalSEPSystemKey attestKey:nonce:error:].cold.4();
      }
LABEL_48:

      uint64_t v20 = 0;
LABEL_49:

      goto LABEL_50;
    }
    if (AKSSystemKeyType == 1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v42 = v15;
        [v15 AKSRefKey];
        [v14 bytes];
        [v14 length];
        uint64_t v17 = aks_sik_attest();
        id v18 = TK_LOG_sepkey_0();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 138543874;
        *(void *)v44 = self;
        *(_WORD *)&v44[8] = 2112;
        *(void *)v45 = v14;
        *(_WORD *)&v45[8] = 1024;
        *(_DWORD *)v46 = v17;
        v19 = "aks_sik_attest(%{public}@, %@) -> %08x";
LABEL_17:
        _os_log_debug_impl(&dword_1BED55000, v18, OS_LOG_TYPE_DEBUG, v19, buf, 0x1Cu);
        goto LABEL_35;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v42 = v15;
        v27 = v15;
        int isa = (int)v27[5].isa;
        if (isa != 2 && isa != 14) {
          [v14 setNumber:1 forKey:18];
        }
        v41 = v27;
        [v14 bytes];
        v29 = v14;
        [v14 length];
        uint64_t v17 = aks_system_key_collection();
        v30 = TK_LOG_sepkey_0();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          int v35 = (int)v41[5].isa;
          int isa_high = HIDWORD(v41[5].isa);
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v44 = v35;
          *(_WORD *)&v44[4] = 1024;
          *(_DWORD *)&v44[6] = isa_high;
          *(_WORD *)v45 = 2112;
          *(void *)&v45[2] = v29;
          *(_WORD *)v46 = 1024;
          *(_DWORD *)&v46[2] = v17;
          _os_log_debug_impl(&dword_1BED55000, v30, OS_LOG_TYPE_DEBUG, "aks_system_key_collection(%d, %d, %@) -> %08x", buf, 0x1Eu);
        }

        uint64_t v14 = v29;
        id v18 = v41;
        goto LABEL_35;
      }
      if (a5)
      {
        *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
      }
      int v31 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[TKLocalSEPSystemKey attestKey:nonce:error:]();
      }
      goto LABEL_48;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v42 = v15;
      id v18 = v15;
      [v18 AKSRefKey];
      [v14 bytes];
      v40 = v14;
      [v14 length];
      uint64_t v17 = aks_system_key_attest();
      uint64_t v21 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v22 = self->_AKSSystemKeyType;
        unsigned int AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v44 = v22;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = AKSSystemKeyGeneration;
        *(_WORD *)v45 = 2114;
        *(void *)&v45[2] = v18;
        *(_WORD *)v46 = 2112;
        *(void *)&v46[2] = v40;
        __int16 v47 = 1024;
        int v48 = v17;
        v24 = "aks_system_key_attest(%d, generation=%d, attesting=%{public}@, %@) -> %08x";
        v25 = v21;
        uint32_t v26 = 40;
LABEL_55:
        _os_log_debug_impl(&dword_1BED55000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a5)
        {
          *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
        }
        int v31 = TK_LOG_sepkey_0();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[TKLocalSEPSystemKey attestKey:nonce:error:]();
        }
        goto LABEL_48;
      }
      id v42 = v15;
      id v18 = v15;
      [v14 bytes];
      v40 = v14;
      [v14 length];
      uint64_t v17 = aks_system_key_collection();
      uint64_t v21 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        int v37 = (int)v18[5].isa;
        int v38 = HIDWORD(v18[5].isa);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v44 = v37;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v38;
        *(_WORD *)v45 = 2112;
        *(void *)&v45[2] = v40;
        *(_WORD *)v46 = 1024;
        *(_DWORD *)&v46[2] = v17;
        v24 = "aks_system_key_collection(%d, %d, %@) -> %08x";
        v25 = v21;
        uint32_t v26 = 30;
        goto LABEL_55;
      }
    }

    uint64_t v14 = v40;
LABEL_35:

    if (v17)
    {
      int v32 = [v12 ACMHandle];
      [(TKLocalSEPKey *)self error:a5 withAKSReturn:v17 ACMHandle:v32 AKSOperation:@"oa" params:v14 message:@"unable to attest key"];

      uint64_t v20 = 0;
      id v15 = v42;
    }
    else
    {
      uint64_t v33 = TK_LOG_sepkey_0();
      id v15 = v42;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        -[TKLocalSEPRefKey attestKey:nonce:error:]();
      }

      uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:0 length:0];
    }
    goto LABEL_49;
  }
  uint64_t v20 = 0;
LABEL_50:

LABEL_51:

  return v20;
}

- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4
{
  int v7 = [(TKLocalSEPKey *)self authContextWithError:a4];
  int v8 = v7;
  if (v7)
  {
    if (a3)
    {
      if (a3 == 1 && self->_AKSSystemKeyGeneration == 3) {
        goto LABEL_8;
      }
    }
    else if (self->_AKSSystemKeyGeneration == 2)
    {
LABEL_8:
      id v10 = [v7 ACMHandle];
      id v11 = [(TKLocalSEPKey *)self parametersWithACMHandle:v10];

      [v11 bytes];
      [v11 length];
      uint64_t v12 = aks_system_key_operate();
      if (!v12)
      {
        uint64_t v16 = TK_LOG_sepkey_0();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[TKLocalSEPSystemKey lifetimeControlWithType:error:]();
        }

        BOOL v9 = 1;
        goto LABEL_15;
      }
      uint64_t v13 = v12;
      uint64_t v14 = [v8 ACMHandle];
      [(TKLocalSEPKey *)self error:a4 withAKSReturn:v13 ACMHandle:v14 AKSOperation:@"oko" params:v11 message:@"unable to bump/commit key"];

LABEL_14:
      BOOL v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
    }
    id v11 = TK_LOG_sepkey_0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TKLocalSEPSystemKey lifetimeControlWithType:error:](self, a3, v11);
    }
    goto LABEL_14;
  }
  BOOL v9 = 0;
LABEL_16:

  return v9;
}

+ (void)hasSystemKey:ACMHandle:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_2();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_1BED55000, v1, OS_LOG_TYPE_DEBUG, "syskey %d not supported, attempt to collect it failed, error %08x", v2, 0xEu);
}

+ (void)hasSystemKey:ACMHandle:.cold.2()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_1(&dword_1BED55000, v0, v1, "OIK not supported, attempt to collect proposed generation failed, error %08x", v2, v3, v4, v5, v6);
}

- (void)_initWithObjectID:(NSObject *)a3 authContext:caller:isIDUnknown:error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 callerName];
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 1024;
  int v8 = v5;
  _os_log_debug_impl(&dword_1BED55000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ requested systemkey aks_system_key_type_t(%d) not supported by the platform", v6, 0x12u);
}

- (void)publicKeyWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1BED55000, v0, v1, "%{public}@: got publicKey %@");
}

- (void)attestKey:nonce:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_1BED55000, v0, v1, "attestKey of unknown key type", v2, v3, v4, v5, v6);
}

- (void)attestKey:nonce:error:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_1BED55000, v0, v1, "SIK-attestKey of unknown key type", v2, v3, v4, v5, v6);
}

- (void)attestKey:nonce:error:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_1BED55000, v0, v1, "GID-attestKey of unknown key type", v2, v3, v4, v5, v6);
}

- (void)lifetimeControlWithType:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 callerName];
  __int16 v7 = (void *)v6;
  int v8 = "bump";
  int v9 = 138543874;
  id v10 = a1;
  if (a2 == 1) {
    int v8 = "commit";
  }
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  __int16 v13 = 2082;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_1BED55000, a3, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@: an attempt to %{public}s incompatible key", (uint8_t *)&v9, 0x20u);
}

- (void)lifetimeControlWithType:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: bump/commit finished", v2, v3, v4, v5, v6);
}

@end