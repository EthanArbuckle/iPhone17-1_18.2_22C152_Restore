@interface TKLocalSEPRefKey
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)systemSessionKey;
- (aks_ref_key_s)AKSRefKey;
- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10;
- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7;
- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5;
- (id)computeSharedSecret:(id)a3 error:(id *)a4;
- (id)decapsulateKey:(id)a3 error:(id *)a4;
- (id)description;
- (id)keySize;
- (id)keyType;
- (id)objectID;
- (id)publicKeyWithError:(id *)a3;
- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5;
- (id)signDigest:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation TKLocalSEPRefKey

- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = [(TKLocalSEPKey *)self _initWithAuthContext:a4 caller:a5];
  if (v13)
  {
    id v14 = v12;
    [(id)objc_opt_class() keybagHandleForceSystemSession:v8];
    id v15 = v14;
    [v15 bytes];
    [v15 length];
    uint64_t v16 = aks_ref_key_create_with_blob();
    if (v16)
    {
      uint64_t v17 = v16;
      v18 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v34 = [v13 callerName];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v34;
        __int16 v38 = 1024;
        int v39 = v17;
        __int16 v40 = 2114;
        id v41 = v15;
        _os_log_error_impl(&dword_1BED55000, v18, OS_LOG_TYPE_ERROR, "objectID from %{public}@ contains invalid refkey (err: %d) data:%{public}@", buf, 0x1Cu);
      }
      [v13 error:a7 withAKSReturn:v17 ACMHandle:0 AKSOperation:0 params:0 message:@"objectID contains invalid refkey data"];
      goto LABEL_18;
    }
    *(void *)buf = 0;
    v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:aks_ref_key_get_external_data() length:0];
    v20 = +[TKTLVRecord recordFromData:v19];
    v21 = [v20 propertyList];

    v22 = [v21 objectForKeyedSubscript:@"acl"];
    v23 = (void *)SecAccessControlCreate();
    [v13 setSac:v23];

    v24 = objc_opt_class();
    v25 = [v24 protectionForKeyClass:aks_ref_key_get_key_class()];
    [v13 accessControl];
    if ((SecAccessControlSetProtection() & 1) == 0)
    {
      v29 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:]();
      }
      goto LABEL_16;
    }
    if (v22)
    {
      [v13 accessControl];
      SecAccessControlSetConstraints();
    }
    int type = aks_ref_key_get_type();
    if ((type - 3) >= 8)
    {
      int v31 = type;
      if (type != 1)
      {
        v32 = TK_LOG_sepkey_0();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:](v13, v31, v32);
        }

        if (!a7) {
          goto LABEL_17;
        }
        v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28228];
        v36 = @"objectID contains invalid key type";
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        *a7 = [v33 errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:v29];
LABEL_16:

LABEL_17:
LABEL_18:

        id v28 = 0;
        goto LABEL_19;
      }
    }
  }
  v27 = TK_LOG_sepkey_0();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:](v13);
  }

  id v28 = v13;
LABEL_19:

  return v28;
}

- (id)signDigest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(TKLocalSEPKey *)self authContextWithError:a4];
  BOOL v8 = v7;
  if (v7)
  {
    v9 = [v7 ACMHandle];
    v10 = [(TKLocalSEPKey *)self parametersWithACMHandle:v9];

    [v10 bytes];
    [v10 length];
    id v11 = v6;
    [v11 bytes];
    [v11 length];
    uint64_t v12 = aks_ref_key_sign();
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = [v8 ACMHandle];
      [(TKLocalSEPKey *)self error:a4 withAKSReturn:v13 ACMHandle:v14 AKSOperation:@"osgn" params:v10 message:@"unable to sign digest"];
      id v15 = 0;
    }
    else
    {
      uint64_t v16 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[TKLocalSEPRefKey signDigest:error:]();
      }

      uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:0 length:0];
      id v14 = +[TKTLVRecord recordFromData:v17];

      id v15 = [v14 value];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  if (self->_AKSRefKey) {
    aks_ref_key_free();
  }
  v3.receiver = self;
  v3.super_class = (Class)TKLocalSEPRefKey;
  [(TKLocalSEPRefKey *)&v3 dealloc];
}

- (id)objectID
{
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:aks_ref_key_get_blob() length:0];

  return v2;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_AKSRefKey)
  {
    unsigned int handle = aks_ref_key_get_handle();
    if (handle != 0 && handle < 0xFFFFFFFA) {
      v4 = "";
    }
    else {
      v4 = (&off_1E63C8980)[handle + 6];
    }
    unsigned int v7 = aks_ref_key_get_type() - 1;
    if (v7 > 9) {
      id v6 = "*";
    }
    else {
      id v6 = off_1E63C89B8[v7];
    }
    unint64_t debugID = self->_debugID;
    if (!debugID)
    {
      uint64_t v11 = 0;
      aks_ref_key_get_public_key();
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      LODWORD(v14) = 0;
      ccsha1_di();
      ccdigest();
      uint64_t v8 = 0;
      unint64_t debugID = 0;
      do
        unint64_t debugID = *((unsigned __int8 *)&v12 + v8++) | (debugID << 8);
      while (v8 != 8);
      self->_unint64_t debugID = debugID;
    }
  }
  else
  {
    unint64_t debugID = self->_debugID;
    id v6 = "*";
    v4 = "";
  }
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"<sepk:%s%s kid=%016llx>", v6, v4, debugID, v11, v12, v13, v14, v15);

  return v9;
}

- (id)keySize
{
  unsigned int v2 = aks_ref_key_get_type() - 1;
  if (v2 > 9) {
    return &unk_1F19F81B0;
  }
  else {
    return (id)qword_1E63C8A08[v2];
  }
}

- (id)keyType
{
  uint64_t type = aks_ref_key_get_type();
  switch((int)type)
  {
    case 1:
      v5 = (id *)MEMORY[0x1E4F3B780];
      goto LABEL_10;
    case 3:
      v5 = (id *)MEMORY[0x1E4F3B750];
      goto LABEL_10;
    case 4:
    case 7:
      v5 = (id *)MEMORY[0x1E4F3B740];
      goto LABEL_10;
    case 5:
    case 8:
      v5 = (id *)MEMORY[0x1E4F3B748];
      goto LABEL_10;
    case 6:
      char options = aks_ref_key_get_options();
      v5 = (id *)MEMORY[0x1E4F3B778];
      if ((options & 0x40) != 0) {
        v5 = (id *)MEMORY[0x1E4F3B770];
      }
      goto LABEL_10;
    case 9:
    case 10:
      v5 = (id *)MEMORY[0x1E4F3B758];
LABEL_10:
      unsigned int v7 = (__CFString *)*v5;
      break;
    default:
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TKLocalSEPKey.m", 865, @"Unexpected aks_key_type %d", type);

      unsigned int v7 = &stru_1F19EDBB0;
      break;
  }

  return v7;
}

- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a6;
  uint64_t v17 = [(TKLocalSEPKey *)self _initWithAuthContext:a7 caller:a8];
  v18 = v17;
  if (v17)
  {
    uint64_t v19 = [v17 authContextWithError:a10];
    if (!v19)
    {
LABEL_24:
      uint64_t v42 = 0;
      goto LABEL_29;
    }
    v20 = (void *)v19;
    if (([v15 isEqual:*MEMORY[0x1E4F3B778]] & 1) == 0
      && ([v15 isEqual:*MEMORY[0x1E4F3B770]] & 1) == 0
      && ![v15 isEqual:*MEMORY[0x1E4F3B748]]
      && ([v15 isEqual:*MEMORY[0x1E4F3B750]] & 1) == 0
      && ([v15 isEqual:*MEMORY[0x1E4F3B780]] & 1) == 0)
    {
      [v15 isEqual:*MEMORY[0x1E4F3B758]];
    }
    [v18 setSac:a5];
    v21 = objc_opt_class();
    [v18 accessControl];
    [v21 keyClassForProtection:SecAccessControlGetProtection()];
    v22 = [v20 ACMHandle];
    v23 = [v18 parametersWithACMHandle:v22];

    if ([v18 accessControl])
    {
      [v18 accessControl];
      v24 = SecAccessControlGetConstraints();
      if (v24)
      {
        v25 = [TKBERTLVRecord alloc];
        v45 = @"acl";
        v46[0] = v24;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
        v27 = [(TKBERTLVRecord *)v25 initWithPropertyList:v26];
        id v28 = [(TKTLVRecord *)v27 data];

        [v23 setData:v28 forKey:2];
      }
    }
    v29 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F3BB20]];
    int v30 = [v29 BOOLValue];

    if (v30) {
      uint64_t v31 = 4;
    }
    else {
      uint64_t v31 = 0;
    }
    v32 = [v16 objectForKeyedSubscript:@"ECCompactable"];
    int v33 = [v32 BOOLValue];

    if (v33) {
      v31 |= 0x10uLL;
    }
    v34 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F3BB58]];
    unsigned int v35 = [v34 BOOLValue];

    uint64_t v36 = v31 | v35;
    v37 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F3BB68]];
    int v38 = [v37 BOOLValue];

    if (v38) {
      uint64_t v39 = v36 | 0x100;
    }
    else {
      uint64_t v39 = v36;
    }
    if ([v15 isEqual:*MEMORY[0x1E4F3B770]]) {
      uint64_t v40 = v39 | 0x40;
    }
    else {
      uint64_t v40 = v39;
    }
    if (v40) {
      [v23 setNumber:v40 forKey:9];
    }
    [(id)objc_opt_class() keybagHandleForceSystemSession:a9];
    [v23 bytes];
    [v23 length];
    uint64_t v41 = aks_ref_key_create();
    if (v41)
    {
      v18[6] = 0;
      [v18 error:a10 withAKSReturn:v41 ACMHandle:0 AKSOperation:0 params:v23 message:@"unable to generate key"];

      goto LABEL_24;
    }
  }
  v43 = TK_LOG_sepkey_0();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    -[TKLocalSEPRefKey _initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:](v18);
  }

  uint64_t v42 = v18;
LABEL_29:

  return v42;
}

- (BOOL)systemSessionKey
{
  return aks_ref_key_get_handle() == -6;
}

- (BOOL)deleteWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:");
  id v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 ACMHandle];
    uint64_t v8 = [(TKLocalSEPKey *)self parametersWithACMHandle:v7];

    [v8 bytes];
    [v8 length];
    uint64_t v9 = aks_ref_key_delete();
    uint64_t v10 = v9;
    if (v9 != -536363001)
    {
      if (!v9)
      {
LABEL_8:
        uint64_t v12 = TK_LOG_sepkey_0();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[TKLocalSEPRefKey deleteWithError:]();
        }

        BOOL v13 = 1;
        goto LABEL_13;
      }
      if (v9 != -536362989)
      {
        uint64_t v14 = [v6 ACMHandle];
        [(TKLocalSEPKey *)self error:a3 withAKSReturn:v10 ACMHandle:v14 AKSOperation:@"odel" params:v8 message:@"unable to delete key"];

        BOOL v13 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    uint64_t v11 = TK_LOG_sepkey_0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 67109120;
      v16[1] = v10;
      _os_log_impl(&dword_1BED55000, v11, OS_LOG_TYPE_DEFAULT, "detected error %08x while deleting refkey, ignoring this error", (uint8_t *)v16, 8u);
    }

    goto LABEL_8;
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (id)publicKeyWithError:(id *)a3
{
  objc_super v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:aks_ref_key_get_public_key() length:0];

  return v3;
}

- (id)computeSharedSecret:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [(TKLocalSEPKey *)self authContextWithError:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 ACMHandle];
    uint64_t v10 = [(TKLocalSEPKey *)self parametersWithACMHandle:v9];

    [v10 bytes];
    [v10 length];
    id v11 = v6;
    [v11 bytes];
    [v11 length];
    uint64_t v12 = aks_ref_key_compute_key();
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = [v8 ACMHandle];
      [(TKLocalSEPKey *)self error:a4 withAKSReturn:v13 ACMHandle:v14 AKSOperation:@"ock" params:v10 message:@"unable to compute shared secret"];
      id v15 = 0;
    }
    else
    {
      id v16 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[TKLocalSEPRefKey computeSharedSecret:error:]();
      }

      uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:0 length:0];
      uint64_t v14 = +[TKTLVRecord recordFromData:v17];

      id v15 = [v14 value];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(TKLocalSEPKey *)self authContextWithError:a5];
  if (!v10)
  {
    uint64_t v36 = 0;
    goto LABEL_35;
  }
  id v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F3BB28]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v46 = v8;
    uint64_t v12 = [v10 ACMHandle];
    uint64_t v13 = [(TKLocalSEPKey *)self parametersWithACMHandle:v12];

    uint64_t v14 = *MEMORY[0x1E4F3BB50];
    id v15 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F3BB50]];
    if (v15) {
      [v13 setData:v15 forKey:10];
    }
    id v47 = v11;
    uint64_t v16 = *MEMORY[0x1E4F3BB38];
    uint64_t v17 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F3BB38]];
    if (v17) {
      [v13 setData:v17 forKey:11];
    }
    v18 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F3BB30]];
    uint64_t v19 = [v18 objectForKeyedSubscript:v14];

    if (v19) {
      [v13 setData:v19 forKey:12];
    }
    v45 = (void *)v19;
    uint64_t v20 = [v18 objectForKeyedSubscript:v16];

    if (v20) {
      [v13 setData:v20 forKey:13];
    }
    v43 = (void *)v20;
    uint64_t v21 = *MEMORY[0x1E4F3BB40];
    uint64_t v22 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F3BB40]];
    v23 = (void *)v22;
    if (v22) {
      v24 = (void *)v22;
    }
    else {
      v24 = &unk_1F19F81C8;
    }
    id v25 = v24;

    uint64_t v26 = [v18 objectForKeyedSubscript:v21];
    v27 = (void *)v26;
    if (v26) {
      id v28 = (void *)v26;
    }
    else {
      id v28 = &unk_1F19F81C8;
    }
    id v29 = v28;

    v44 = v25;
    if ([v25 integerValue] == 128 && objc_msgSend(v29, "integerValue") == 128)
    {
      id v30 = v29;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      [v13 bytes];
      [v13 length];
      id v31 = v47;
      [v31 bytes];
      [v31 length];
      id v8 = v46;
      id v32 = v46;
      [v32 bytes];
      [v32 length];
      uint64_t v33 = aks_ref_key_ecies_transcode();
      if (v33)
      {
        uint64_t v34 = v33;
        unsigned int v35 = objc_msgSend(v10, "ACMHandle", &v48);
        [(TKLocalSEPKey *)self error:a5 withAKSReturn:v34 ACMHandle:v35 AKSOperation:@"oect" params:v13 message:@"unable to recrypt"];

        uint64_t v36 = 0;
      }
      else
      {
        uint64_t v41 = TK_LOG_sepkey_0();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          -[TKLocalSEPRefKey recryptData:attributes:error:]();
        }

        uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:", v49, v48, &v48);
      }
      uint64_t v40 = v45;
      id v29 = v30;
    }
    else
    {
      id v8 = v46;
      if (a5)
      {
        int v38 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v50 = *MEMORY[0x1E4F28228];
        v51 = @"Bad kSecKeyEncryptionParameterSymmetricKeySizeInBits - if present, must be set to 128 for both input and output crypto operation";
        uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        *a5 = [v38 errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:v39];
      }
      uint64_t v36 = 0;
      uint64_t v40 = v45;
    }

    id v11 = v47;
    goto LABEL_33;
  }
  if (a5)
  {
    v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F28228];
    v53[0] = @"Bad or missing kSecKeyEncryptionParameterRecryptCertificate";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    [v37 errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:v13];
    uint64_t v36 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v36 = 0;
LABEL_34:

LABEL_35:

  return v36;
}

- (id)decapsulateKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [(TKLocalSEPKey *)self authContextWithError:a4];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 ACMHandle];
    uint64_t v10 = [(TKLocalSEPKey *)self parametersWithACMHandle:v9];

    [v10 bytes];
    [v10 length];
    id v11 = v6;
    [v11 bytes];
    [v11 length];
    uint64_t v12 = aks_ref_key_decapsulate();
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = [v8 ACMHandle];
      [(TKLocalSEPKey *)self error:a4 withAKSReturn:v13 ACMHandle:v14 AKSOperation:@"okd" params:v10 message:@"unable to decapsulate shared key"];

      id v15 = 0;
    }
    else
    {
      id v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:0 length:0];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![(TKLocalSEPKey *)self callerHasEntitlement:@"com.apple.security.attestation.access" error:a5])
  {
    v18 = 0;
    goto LABEL_20;
  }
  uint64_t v10 = [(TKLocalSEPKey *)self authContextWithError:a5];
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 ACMHandle];
    uint64_t v13 = [(TKLocalSEPKey *)self parametersWithACMHandle:v12];

    if (v9) {
      [v13 setData:v9 forKey:4];
    }
    id v14 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 bytes];
      [v13 length];
      uint64_t v15 = aks_ref_key_attest();
      uint64_t v16 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138544130;
        id v25 = self;
        __int16 v26 = 2112;
        v27 = v13;
        __int16 v28 = 2114;
        id v29 = v14;
        __int16 v30 = 1024;
        int v31 = v15;
        _os_log_debug_impl(&dword_1BED55000, v16, OS_LOG_TYPE_DEBUG, "aks_ref_key_attest(%{public}@, %@, attested: %{public}@) -> %08x", buf, 0x26u);
      }

      if (!v15)
      {
        v23 = TK_LOG_sepkey_0();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[TKLocalSEPRefKey attestKey:nonce:error:]();
        }

        v18 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:0 length:0];
        goto LABEL_18;
      }
      uint64_t v17 = [v11 ACMHandle];
      [(TKLocalSEPKey *)self error:a5 withAKSReturn:v15 ACMHandle:v17 AKSOperation:@"oa" params:v13 message:@"unable to attest refkey->refkey"];
    }
    else
    {
      if (a5)
      {
        uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = *MEMORY[0x1E4F28228];
        v33[0] = @"unsuitable key for attesting";
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
        *a5 = [v19 errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:v20];
      }
      uint64_t v21 = TK_LOG_sepkey_0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[TKLocalSEPRefKey attestKey:nonce:error:]();
      }
    }
    v18 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v18 = 0;
LABEL_19:

LABEL_20:

  return v18;
}

- (aks_ref_key_s)AKSRefKey
{
  return self->_AKSRefKey;
}

- (void)_initWithObjectID:(void *)a1 authContext:caller:forceSystemSession:error:.cold.1(void *a1)
{
  unsigned int v2 = [a1 callerName];
  [a1 accessControl];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_2(&dword_1BED55000, v3, v4, "%{public}@ parsed for %{public}@ from objectID: ACL=%{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithObjectID:(NSObject *)a3 authContext:caller:forceSystemSession:error:.cold.2(void *a1, int a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 callerName];
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_1BED55000, a3, OS_LOG_TYPE_ERROR, "Request from %{public}@ for key with objectID containing invalid key type (%d)", v6, 0x12u);
}

- (void)_initWithObjectID:authContext:caller:forceSystemSession:error:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1BED55000, v1, OS_LOG_TYPE_ERROR, "Failed to set protection %{public}@ for ACL (error: %{public}@)", v2, 0x16u);
}

- (void)_initWithKeyType:(void *)a1 keySize:accessControl:options:authContext:caller:forceSystemSession:error:.cold.1(void *a1)
{
  __int16 v7 = [a1 callerName];
  OUTLINED_FUNCTION_6_2(&dword_1BED55000, v1, v2, "%{public}@ generated for %{public}@: ACL=%{public}@", v3, v4, v5, v6, 2u);
}

- (void)deleteWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: deleted", v2, v3, v4, v5, v6);
}

- (void)signDigest:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: signed digest", v2, v3, v4, v5, v6);
}

- (void)computeSharedSecret:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: computed shared secret", v2, v3, v4, v5, v6);
}

- (void)recryptData:attributes:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: recrypted data", v2, v3, v4, v5, v6);
}

- (void)attestKey:nonce:error:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2_0(&dword_1BED55000, v0, v1, "%{public}@: attested key %{public}@");
}

- (void)attestKey:nonce:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_1BED55000, v0, v1, "Only refkeys can be attested by refkey", v2, v3, v4, v5, v6);
}

@end