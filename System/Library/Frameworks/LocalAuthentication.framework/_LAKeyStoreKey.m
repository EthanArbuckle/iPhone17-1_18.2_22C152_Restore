@interface _LAKeyStoreKey
+ (id)buildWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)canDecryptUsingSecKeyAlgorithm:(__CFString *)a3;
- (BOOL)canEncryptUsingSecKeyAlgorithm:(__CFString *)a3;
- (BOOL)canExchangeKeysUsingSecKeyAlgorithm:(__CFString *)a3;
- (BOOL)canSignUsingSecKeyAlgorithm:(__CFString *)a3;
- (BOOL)canVerifyUsingSecKeyAlgorithm:(__CFString *)a3;
- (NSData)acl;
- (NSData)publicKeyHash;
- (NSString)identifier;
- (id)initWithIdentifier:(void *)a3 acl:(void *)a4 publicKeyHash:(void *)a5 keyRef:(void *)a6 pubKeyRef:;
- (void)_performOperationWithContext:(void *)a3 operation:(void *)a4 completion:;
- (void)decryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6;
- (void)encryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 completion:(id)a5;
- (void)exchangeKeysWithPublicKey:(id)a3 secKeyAlgorithm:(__CFString *)a4 secKeyParameters:(id)a5 context:(id)a6 completion:(id)a7;
- (void)exportBytesWithCompletion:(id)a3;
- (void)signData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6;
- (void)verifyData:(id)a3 signature:(id)a4 secKeyAlgorithm:(__CFString *)a5 completion:(id)a6;
@end

@implementation _LAKeyStoreKey

+ (id)buildWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F3B788];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3B788]];
  if (v7
    && (v8 = (void *)v7,
        [v5 objectForKeyedSubscript:v6],
        v9 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v10 = objc_opt_isKindOfClass(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v11 = [v5 objectForKeyedSubscript:v6];
    uint64_t v12 = *MEMORY[0x1E4F3B548];
    v13 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3B548]];

    if (v13)
    {
      v14 = [v5 objectForKeyedSubscript:v12];
      v15 = +[LASecAccessControl serializeACL:v14];

      uint64_t v16 = *MEMORY[0x1E4F3B5D0];
      uint64_t v17 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3B5D0]];
      if (v17
        && (v18 = (void *)v17,
            [v5 objectForKeyedSubscript:v16],
            v19 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v19,
            v18,
            (isKindOfClass & 1) != 0))
      {
        v21 = [v5 objectForKeyedSubscript:v16];
        uint64_t v22 = *MEMORY[0x1E4F3BD48];
        v23 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3BD48]];

        if (v23)
        {
          v24 = [v5 objectForKeyedSubscript:v22];
          SecKeyRef v25 = SecKeyCopyPublicKey(v24);
          if (v25)
          {
            v26 = -[_LAKeyStoreKey initWithIdentifier:acl:publicKeyHash:keyRef:pubKeyRef:]((id *)[_LAKeyStoreKey alloc], v11, v15, v21, v24, v25);
          }
          else
          {
            v31 = +[LAAuthorizationError genericErrorWithMessage:@"Failed to build key due to missing public key"];

            v26 = 0;
            if (a4 && v31)
            {
              +[LAAuthorizationError genericErrorWithMessage:@"Failed to build key due to missing public key"];
              v26 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
        }
        else
        {
          v30 = +[LAAuthorizationError genericErrorWithMessage:@"Failed to build key due to missing 'kref'"];

          v26 = 0;
          if (a4 && v30)
          {
            +[LAAuthorizationError genericErrorWithMessage:@"Failed to build key due to missing 'kref'"];
            v26 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      else
      {
        v28 = +[LAAuthorizationError genericErrorWithMessage:@"Failed to build key due to missing 'klbl'"];

        v26 = 0;
        if (a4 && v28)
        {
          +[LAAuthorizationError genericErrorWithMessage:@"Failed to build key due to missing 'klbl'"];
          v26 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      v29 = +[LAAuthorizationError genericErrorWithMessage:@"Failed to build key due to missing 'accc'"];

      v26 = 0;
      if (a4 && v29)
      {
        +[LAAuthorizationError genericErrorWithMessage:@"Failed to build key due to missing 'accc'"];
        v26 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v27 = +[LAAuthorizationError genericErrorWithMessage:@"Failed to build key due to missing 'labl'"];

    v26 = 0;
    if (a4 && v27)
    {
      +[LAAuthorizationError genericErrorWithMessage:@"Failed to build key due to missing 'labl'"];
      v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v26;
}

- (id)initWithIdentifier:(void *)a3 acl:(void *)a4 publicKeyHash:(void *)a5 keyRef:(void *)a6 pubKeyRef:
{
  id v18 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)_LAKeyStoreKey;
    uint64_t v16 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)acl
{
  return self->_acl;
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)exportBytesWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  id v12 = 0;
  id v5 = objc_alloc_init(LAContext);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44___LAKeyStoreKey_exportBytesWithCompletion___block_invoke;
  v10[3] = &unk_1E63C4680;
  v10[4] = v11;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44___LAKeyStoreKey_exportBytesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E63C46A8;
  id v6 = v4;
  id v8 = v6;
  v9 = v11;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v5, v10, v7);

  _Block_object_dispose(v11, 8);
}

- (void)_performOperationWithContext:(void *)a3 operation:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v21 = 0;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    if (v7)
    {
      id v20 = 0;
      char v12 = [v7 checkContextValidWithError:&v20];
      id v21 = v20;
      if (v12)
      {
        id v13 = [LAContext alloc];
        id v14 = [v7 externalizedContext];
        id v15 = [(LAContext *)v13 initWithExternalizedContext:v14];

        [(LAContext *)v15 setInteractionNotAllowed:1];
        if (SecKeySetParameter())
        {
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __68___LAKeyStoreKey__performOperationWithContext_operation_completion___block_invoke;
          v17[3] = &unk_1E63C4568;
          id v18 = v10;
          id v19 = v9;
          v8[2](v8, v18, v11, v17);
        }
        else
        {
          (*((void (**)(id, id))v9 + 2))(v9, v21);
        }
        goto LABEL_9;
      }
      uint64_t v16 = @"Cannot perform operation with invalid context";
    }
    else
    {
      uint64_t v16 = @"Cannot perform operation with nil context";
    }
    id v15 = +[LAAuthorizationError genericErrorWithMessage:v16];
    (*((void (**)(id, LAContext *))v9 + 2))(v9, v15);
LABEL_9:
  }
}

- (void)signData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__1;
  v22[4] = __Block_byref_object_dispose__1;
  id v23 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62___LAKeyStoreKey_signData_secKeyAlgorithm_context_completion___block_invoke;
  v18[3] = &unk_1E63C46D0;
  id v20 = v22;
  id v21 = a4;
  id v13 = v10;
  id v19 = v13;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62___LAKeyStoreKey_signData_secKeyAlgorithm_context_completion___block_invoke_2;
  v15[3] = &unk_1E63C46A8;
  id v14 = v12;
  id v16 = v14;
  uint64_t v17 = v22;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v11, v18, v15);

  _Block_object_dispose(v22, 8);
}

- (BOOL)canSignUsingSecKeyAlgorithm:(__CFString *)a3
{
  return SecKeyIsAlgorithmSupported((SecKeyRef)self->_keyRef, kSecKeyOperationTypeSign, a3) != 0;
}

- (void)decryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__1;
  v22[4] = __Block_byref_object_dispose__1;
  id v23 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65___LAKeyStoreKey_decryptData_secKeyAlgorithm_context_completion___block_invoke;
  v18[3] = &unk_1E63C46D0;
  id v20 = v22;
  id v21 = a4;
  id v13 = v10;
  id v19 = v13;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65___LAKeyStoreKey_decryptData_secKeyAlgorithm_context_completion___block_invoke_2;
  v15[3] = &unk_1E63C46A8;
  id v14 = v12;
  id v16 = v14;
  uint64_t v17 = v22;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v11, v18, v15);

  _Block_object_dispose(v22, 8);
}

- (BOOL)canDecryptUsingSecKeyAlgorithm:(__CFString *)a3
{
  return SecKeyIsAlgorithmSupported((SecKeyRef)self->_keyRef, kSecKeyOperationTypeDecrypt, a3) != 0;
}

- (void)exchangeKeysWithPublicKey:(id)a3 secKeyAlgorithm:(__CFString *)a4 secKeyParameters:(id)a5 context:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__1;
  v27[4] = __Block_byref_object_dispose__1;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96___LAKeyStoreKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_context_completion___block_invoke;
  v22[3] = &unk_1E63C46F8;
  id v16 = v12;
  id v23 = v16;
  SecKeyRef v25 = v27;
  v26 = a4;
  id v17 = v13;
  id v24 = v17;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __96___LAKeyStoreKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_context_completion___block_invoke_2;
  v19[3] = &unk_1E63C46A8;
  id v18 = v15;
  id v20 = v18;
  id v21 = v27;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v14, v22, v19);

  _Block_object_dispose(v27, 8);
}

- (BOOL)canExchangeKeysUsingSecKeyAlgorithm:(__CFString *)a3
{
  return SecKeyIsAlgorithmSupported((SecKeyRef)self->_keyRef, kSecKeyOperationTypeKeyExchange, a3) != 0;
}

- (void)encryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  id v21 = 0;
  id v10 = objc_alloc_init(LAContext);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57___LAKeyStoreKey_encryptData_secKeyAlgorithm_completion___block_invoke;
  v16[3] = &unk_1E63C46D0;
  id v18 = v20;
  id v19 = a4;
  id v11 = v8;
  id v17 = v11;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57___LAKeyStoreKey_encryptData_secKeyAlgorithm_completion___block_invoke_2;
  v13[3] = &unk_1E63C46A8;
  id v12 = v9;
  id v14 = v12;
  id v15 = v20;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v10, v16, v13);

  _Block_object_dispose(v20, 8);
}

- (BOOL)canEncryptUsingSecKeyAlgorithm:(__CFString *)a3
{
  return SecKeyIsAlgorithmSupported((SecKeyRef)self->_pubKeyRef, kSecKeyOperationTypeEncrypt, a3) != 0;
}

- (void)verifyData:(id)a3 signature:(id)a4 secKeyAlgorithm:(__CFString *)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc_init(LAContext);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66___LAKeyStoreKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke;
  v16[3] = &unk_1E63C4720;
  id v18 = v11;
  id v19 = a5;
  id v17 = v10;
  id v14 = v11;
  id v15 = v10;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v13, v16, v12);
}

- (BOOL)canVerifyUsingSecKeyAlgorithm:(__CFString *)a3
{
  return SecKeyIsAlgorithmSupported((SecKeyRef)self->_pubKeyRef, kSecKeyOperationTypeVerify, a3) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pubKeyRef, 0);
  objc_storeStrong(&self->_keyRef, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_acl, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end