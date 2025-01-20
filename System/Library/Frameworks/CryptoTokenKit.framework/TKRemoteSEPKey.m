@interface TKRemoteSEPKey
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4;
- (BOOL)processServerAtributes:(id)a3 error:(id *)a4;
- (BOOL)systemKey;
- (BOOL)systemSessionKey;
- (NSData)remoteKeyID;
- (__SecAccessControl)accessControl;
- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 error:(id *)a9;
- (id)_initWithObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6;
- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5;
- (id)computeSharedSecret:(id)a3 error:(id *)a4;
- (id)decapsulateKey:(id)a3 error:(id *)a4;
- (id)keyID;
- (id)keySize;
- (id)keyType;
- (id)publicKeyWithError:(id *)a3;
- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5;
- (id)signDigest:(id)a3 error:(id *)a4;
- (id)withError:(id *)a3 invoke:(id)a4;
@end

@implementation TKRemoteSEPKey

- (id)signDigest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__TKRemoteSEPKey_signDigest_error___block_invoke;
  v10[3] = &unk_1E63C8CA8;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  v8 = [(TKRemoteSEPKey *)self withError:a4 invoke:v10];

  return v8;
}

- (id)withError:(id *)a3 invoke:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void *, id *))a4;
  if (withError_invoke__onceToken != -1) {
    dispatch_once(&withError_invoke__onceToken, &__block_literal_global_11);
  }
  int v6 = 0;
  uint64_t v23 = 0;
  v24[0] = &v23;
  v24[1] = 0x3032000000;
  v24[2] = __Block_byref_object_copy__4;
  v24[3] = __Block_byref_object_dispose__4;
  id v25 = 0;
  while (1)
  {
    id v7 = [(id)withError_invoke__connectionSlot resourceWithError:a3];
    v8 = v7;
    if (!v7) {
      goto LABEL_16;
    }
    v9 = [v7 object];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35__TKRemoteSEPKey_withError_invoke___block_invoke_97;
    v20[3] = &unk_1E63C8B90;
    v22 = &v23;
    id v10 = v8;
    id v21 = v10;
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v20];

    v12 = *(void **)(v24[0] + 40);
    *(void *)(v24[0] + 40) = 0;

    v13 = v5[2](v5, v11, a3);
    if (!*(void *)(v24[0] + 40))
    {

LABEL_15:
      goto LABEL_17;
    }
    v14 = TK_LOG_rsepkey();
    v15 = v14;
    if (v6 == 4) {
      break;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(void *)(v24[0] + 40);
      *(_DWORD *)buf = 67109378;
      int v29 = v6;
      __int16 v30 = 2114;
      uint64_t v31 = v16;
      _os_log_debug_impl(&dword_1BED55000, v15, OS_LOG_TYPE_DEBUG, "failed to call remotesepkey, try %d, error %{public}@", buf, 0x12u);
    }

    [MEMORY[0x1E4F29060] sleepForTimeInterval:(double)v6 * 0.1];
    ++v6;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[TKRemoteSEPKey withError:invoke:]((uint64_t)v24, v15);
  }

  if (a3)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *(void *)(v24[0] + 40);
    uint64_t v26 = *MEMORY[0x1E4F28A50];
    uint64_t v27 = v18;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v17 errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:v10];
    v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_16:
  v13 = 0;
LABEL_17:
  _Block_object_dispose(&v23, 8);

  return v13;
}

id __35__TKRemoteSEPKey_signDigest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  int v6 = [*(id *)(a1 + 32) remoteKeyID];
  uint64_t v7 = *(void *)(a1 + 40);
  v8 = [*(id *)(a1 + 32) authContext];
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__TKRemoteSEPKey_signDigest_error___block_invoke_2;
  v13[3] = &unk_1E63C8A60;
  v13[4] = &v20;
  v13[5] = &v14;
  [v5 signWithKey:v6 digest:v7 authContext:v8 forceSystemSession:v9 reply:v13];

  id v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = (id) v15[5];
    id v10 = (void *)v21[5];
  }
  id v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);

  return v11;
}

- (id)keyID
{
  return self->_keyID;
}

- (BOOL)processServerAtributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v25 = a4;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"keyType"];
  id keyType = self->_keyType;
  self->_id keyType = v7;

  uint64_t v9 = [v6 objectForKeyedSubscript:@"keySize"];
  id keySize = self->_keySize;
  self->_id keySize = v9;

  id v11 = [v6 objectForKeyedSubscript:@"systemKey"];
  self->_systemKey = [v11 BOOLValue];

  v12 = [v6 objectForKeyedSubscript:@"publicKey"];
  publicKey = self->_publicKey;
  self->_publicKey = v12;

  uint64_t v14 = [v6 objectForKeyedSubscript:@"systemSessionKey"];
  self->_forceSystemSession = [v14 BOOLValue];

  if (!self->_keyType
    || !self->_keySize
    || ([v6 objectForKeyedSubscript:@"systemKey"],
        (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0)
    || (uint64_t v16 = (void *)v15,
        [v6 objectForKeyedSubscript:@"systemSessionKey"],
        v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    uint64_t v22 = TK_LOG_rsepkey();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[TKRemoteSEPKey processServerAtributes:error:]();
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:0];
      BOOL v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_14:
    BOOL v21 = 0;
    goto LABEL_15;
  }
  uint64_t v18 = [v6 objectForKeyedSubscript:@"accessControl"];
  id v19 = (void *)SecAccessControlCreateFromData();
  id accessControl = self->_accessControl;
  self->_id accessControl = v19;

  if (!self->_accessControl)
  {
    uint64_t v23 = TK_LOG_rsepkey();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[TKRemoteSEPKey processServerAtributes:error:](&v25, v23);
    }

    goto LABEL_14;
  }
  BOOL v21 = 1;
LABEL_15:

  return v21;
}

uint64_t __35__TKRemoteSEPKey_withError_invoke___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A01D48];
  v1 = (void *)withError_invoke__SEPKeyInterface;
  withError_invoke__SEPKeyInterface = v0;

  v2 = [[TKSharedResourceSlot alloc] initWithName:@"TKRemoteSEPKey-serverConnection"];
  v3 = (void *)withError_invoke__connectionSlot;
  withError_invoke__connectionSlot = (uint64_t)v2;

  [(id)withError_invoke__connectionSlot setIdleTimeout:60.0];
  [(id)withError_invoke__connectionSlot setCreateObjectBlock:&__block_literal_global_86];
  v4 = (void *)withError_invoke__connectionSlot;

  return [v4 setObjectDestroyedBlock:&__block_literal_global_96];
}

id __35__TKRemoteSEPKey_withError_invoke___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = +[TKSEPKey clientToken];
  if (v3)
  {
    v4 = +[TKSEPKey clientToken];
  }
  else
  {
    v4 = [[TKClientToken alloc] initWithTokenID:&stru_1F19EDBB0];
  }
  id v5 = v4;
  id v6 = [(TKClientToken *)v4 SEPKeyEndpoint];

  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v6];
    [v7 setRemoteObjectInterface:withError_invoke__SEPKeyInterface];
    [v7 resume];
    v8 = TK_LOG_rsepkey();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_2();
    }
  }
  else
  {
    if (a2)
    {
      *a2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:0];
    }
    v8 = TK_LOG_rsepkey();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_1();
    }
    uint64_t v7 = 0;
  }

  return v7;
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_93(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = TK_LOG_rsepkey();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __35__TKRemoteSEPKey_withError_invoke___block_invoke_93_cold_1();
  }

  [v2 invalidate];
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_97(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if ([v6 code] == 4099)
  {
    v4 = [v6 domain];
    int v5 = [v4 isEqualToString:*MEMORY[0x1E4F281F8]];

    if (v5) {
      [*(id *)(a1 + 32) invalidate];
    }
  }
}

- (id)_initWithObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TKRemoteSEPKey;
  v13 = [(TKSEPKey *)&v28 _initWithAuthContext:v12];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong(v13 + 8, a3);
    uint64_t v15 = [TKBERTLVRecord alloc];
    uint64_t v16 = [v14 keyID];
    v17 = [(TKBERTLVRecord *)v15 initWithPropertyList:v16];
    uint64_t v18 = [(TKTLVRecord *)v17 data];
    id v19 = v14[9];
    v14[9] = (id)v18;

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke;
    v24[3] = &unk_1E63C8BE0;
    uint64_t v20 = v14;
    id v25 = v20;
    id v26 = v12;
    BOOL v27 = a5;
    BOOL v21 = [v20 withError:a6 invoke:v24];
    if (!v21 || ![v20 processServerAtributes:v21 error:a6])
    {

      uint64_t v22 = 0;
      goto LABEL_7;
    }
  }
  uint64_t v22 = v14;
LABEL_7:

  return v22;
}

id __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__4;
  uint64_t v23 = __Block_byref_object_dispose__4;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 72);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke_2;
  v12[3] = &unk_1E63C8BB8;
  v12[4] = &v19;
  v12[5] = &v13;
  [v5 getAttributesOfKey:v7 authContext:v6 forceSystemSession:v8 reply:v12];
  uint64_t v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = (id) v14[5];
    uint64_t v9 = (void *)v20[5];
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

void __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)TKRemoteSEPKey;
  id v17 = [(TKSEPKey *)&v44 _initWithAuthContext:v16];
  if (!v17) {
    goto LABEL_6;
  }
  id v18 = (void *)SecAccessControlCopyData();
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__4;
  v42 = __Block_byref_object_dispose__4;
  id v43 = 0;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  objc_super v28 = __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke;
  int v29 = &unk_1E63C8C30;
  id v30 = v14;
  int64_t v36 = a4;
  id v19 = v18;
  id v31 = v19;
  id v32 = v15;
  id v33 = v16;
  BOOL v37 = a8;
  uint64_t v20 = v17;
  id v34 = v20;
  v35 = &v38;
  uint64_t v21 = [v20 withError:a9 invoke:&v26];
  uint64_t v22 = (void *)v20[8];
  v20[8] = v21;

  int v23 = v20[8]
      ? objc_msgSend(v20, "processServerAtributes:error:", v39[5], a9, v26, v27, v28, v29, v30, v31, v32, v33)
      : 0;

  _Block_object_dispose(&v38, 8);
  if (!v23) {
    id v24 = 0;
  }
  else {
LABEL_6:
  }
    id v24 = v17;

  return v24;
}

id __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v28 = 0;
  int v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__4;
  id v32 = __Block_byref_object_dispose__4;
  id v33 = 0;
  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__4;
  uint64_t v26 = __Block_byref_object_dispose__4;
  id v27 = 0;
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(unsigned __int8 *)(a1 + 88);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke_2;
  v17[3] = &unk_1E63C8C08;
  id v19 = &v28;
  uint64_t v20 = &v22;
  id v12 = *(id *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  id v18 = v12;
  uint64_t v21 = v13;
  [v5 generateKeyType:v7 keySize:v6 accessControl:v8 options:v9 authContext:v10 forceSystemSession:v11 reply:v17];
  id v14 = (void *)v29[5];
  if (a3 && !v14)
  {
    *a3 = (id) v23[5];
    id v14 = (void *)v29[5];
  }
  id v15 = v14;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

void __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  if (v14)
  {
    uint64_t v10 = +[TKTLVRecord recordFromData:v14];
    uint64_t v11 = [v10 propertyList];
    uint64_t v12 = *(void *)(a1[5] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    objc_storeStrong((id *)(a1[4] + 72), a2);
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  }
}

- (id)keyType
{
  return self->_keyType;
}

- (id)keySize
{
  return self->_keySize;
}

- (BOOL)systemKey
{
  return self->_systemKey;
}

- (BOOL)systemSessionKey
{
  return self->_forceSystemSession;
}

- (id)publicKeyWithError:(id *)a3
{
  return self->_publicKey;
}

- (__SecAccessControl)accessControl
{
  return (__SecAccessControl *)self->_accessControl;
}

- (BOOL)deleteWithError:(id *)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__TKRemoteSEPKey_deleteWithError___block_invoke;
  v6[3] = &unk_1E63C8C80;
  v6[4] = self;
  v3 = [(TKRemoteSEPKey *)self withError:a3 invoke:v6];
  char v4 = [v3 BOOLValue];

  return v4;
}

id __34__TKRemoteSEPKey_deleteWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__4;
  int v23 = __Block_byref_object_dispose__4;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__4;
  id v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  uint64_t v6 = [*(id *)(a1 + 32) remoteKeyID];
  uint64_t v7 = [*(id *)(a1 + 32) authContext];
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__TKRemoteSEPKey_deleteWithError___block_invoke_2;
  v12[3] = &unk_1E63C8C58;
  v12[4] = &v19;
  v12[5] = &v13;
  [v5 deleteKey:v6 authContext:v7 forceSystemSession:v8 reply:v12];

  id v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = (id) v14[5];
    id v9 = (void *)v20[5];
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

void __34__TKRemoteSEPKey_deleteWithError___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v6 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

void __35__TKRemoteSEPKey_signDigest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)computeSharedSecret:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke;
  v10[3] = &unk_1E63C8CA8;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(TKRemoteSEPKey *)self withError:a4 invoke:v10];

  return v8;
}

id __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = __Block_byref_object_copy__4;
  id v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__4;
  id v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  id v6 = [*(id *)(a1 + 32) remoteKeyID];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 32) authContext];
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke_2;
  v13[3] = &unk_1E63C8A60;
  v13[4] = &v20;
  v13[5] = &v14;
  [v5 computeSharedSecretWithKey:v6 publicKey:v7 authContext:v8 forceSystemSession:v9 reply:v13];

  id v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = (id) v15[5];
    id v10 = (void *)v21[5];
  }
  id v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);

  return v11;
}

void __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke;
  v14[3] = &unk_1E63C8CD0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  uint64_t v12 = [(TKRemoteSEPKey *)self withError:a5 invoke:v14];

  return v12;
}

id __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__4;
  id v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__4;
  id v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  id v6 = [*(id *)(a1 + 32) remoteKeyID];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v9 = [*(id *)(a1 + 32) authContext];
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke_2;
  v14[3] = &unk_1E63C8A60;
  v14[4] = &v21;
  void v14[5] = &v15;
  [v5 recryptWithKey:v6 data:v8 attributes:v7 authContext:v9 forceSystemSession:v10 reply:v14];

  id v11 = (void *)v22[5];
  if (a3 && !v11)
  {
    *a3 = (id) v16[5];
    id v11 = (void *)v22[5];
  }
  id v12 = v11;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);

  return v12;
}

void __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)decapsulateKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke;
  v10[3] = &unk_1E63C8CA8;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(TKRemoteSEPKey *)self withError:a4 invoke:v10];

  return v8;
}

id __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__4;
  id v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__4;
  id v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  id v6 = [*(id *)(a1 + 32) remoteKeyID];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 32) authContext];
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke_2;
  v13[3] = &unk_1E63C8A60;
  v13[4] = &v20;
  v13[5] = &v14;
  [v5 decapsulateWithKey:v6 encapsulatedKey:v7 authContext:v8 forceSystemSession:v9 reply:v13];

  uint64_t v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = (id) v15[5];
    uint64_t v10 = (void *)v21[5];
  }
  id v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);

  return v11;
}

void __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"TKRemoteSEPKey.m" lineNumber:274 description:@"attempt to perform attestation with mixed local/remote keys"];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke;
  v17[3] = &unk_1E63C8CD0;
  void v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v12 = v10;
  id v13 = v11;
  uint64_t v14 = [(TKRemoteSEPKey *)self withError:a5 invoke:v17];

  return v14;
}

id __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__4;
  id v26 = __Block_byref_object_dispose__4;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__4;
  uint64_t v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  id v6 = [*(id *)(a1 + 32) remoteKeyID];
  uint64_t v7 = [*(id *)(a1 + 40) remoteKeyID];
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(a1 + 32) authContext];
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 56);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke_2;
  v15[3] = &unk_1E63C8A60;
  v15[4] = &v22;
  v15[5] = &v16;
  [v5 attestWithKey:v6 keyToAttest:v7 nonce:v8 authContext:v9 forceSystemSessionAttestingKey:v10 forceSystemSessionKeyToAttest:v11 reply:v15];

  id v12 = (void *)v23[5];
  if (a3 && !v12)
  {
    *a3 = (id) v17[5];
    id v12 = (void *)v23[5];
  }
  id v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v13;
}

void __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke;
  v7[3] = &unk_1E63C8CF8;
  v7[4] = self;
  v7[5] = a3;
  char v4 = [(TKRemoteSEPKey *)self withError:a4 invoke:v7];
  char v5 = [v4 BOOLValue];

  return v5;
}

id __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__4;
  uint64_t v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  id v6 = [*(id *)(a1 + 32) remoteKeyID];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 32) authContext];
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke_2;
  v13[3] = &unk_1E63C8C58;
  v13[4] = &v20;
  v13[5] = &v14;
  [v5 lifetimeControlKey:v6 type:v7 authContext:v8 forceSystemSession:v9 reply:v13];

  uint64_t v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = (id) v15[5];
    uint64_t v10 = (void *)v21[5];
  }
  id v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);

  return v11;
}

void __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    id v6 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    id v6 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (NSData)remoteKeyID
{
  return self->_remoteKeyID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteKeyID, 0);
  objc_storeStrong(&self->_keyID, 0);
  objc_storeStrong(&self->_accessControl, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong(&self->_keySize, 0);

  objc_storeStrong(&self->_keyType, 0);
}

- (void)processServerAtributes:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1BED55000, v0, OS_LOG_TYPE_FAULT, "got invalid serverAttributes for key", v1, 2u);
}

- (void)processServerAtributes:(void *)a1 error:(NSObject *)a2 .cold.2(void **a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = *a1;
  if (*a1) {
    id v2 = (void *)*v2;
  }
  int v3 = 138543362;
  char v4 = v2;
  _os_log_fault_impl(&dword_1BED55000, a2, OS_LOG_TYPE_FAULT, "unable to deserialize accessControl, error %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)withError:(uint64_t)a1 invoke:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BED55000, a2, OS_LOG_TYPE_ERROR, "failed to call remotesepkey repeatedly, giving up, error: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1BED55000, v0, OS_LOG_TYPE_ERROR, "unable to get endpoint", v1, 2u);
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1BED55000, v0, OS_LOG_TYPE_DEBUG, "creating rsepkey xpc connection", v1, 2u);
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_93_cold_1()
{
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1BED55000, v0, OS_LOG_TYPE_DEBUG, "invalidating rsepkey xpc connection", v1, 2u);
}

@end