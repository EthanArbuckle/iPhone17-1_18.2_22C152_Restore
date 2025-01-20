@interface ECDKIMVerifier
- (BOOL)_verifyMessageBodyData:(id)a3 withOptions:(int64_t)a4 usingSignature:(id)a5;
- (BOOL)_verifyMessageHeaders:(id)a3 usingSignature:(id)a4 publicKeySource:(id)a5 error:(id *)a6;
- (BOOL)verifyMessageData:(id)a3;
- (BOOL)verifyMessageData:(id)a3 options:(int64_t)a4;
- (BOOL)verifyMessageData:(id)a3 publicKeySource:(id)a4 options:(int64_t)a5;
- (BOOL)verifyMessageWithContext:(id)a3 options:(int64_t)a4 error:(id *)a5;
- (BOOL)verifyMessageWithContext:(id)a3 publicKeySource:(id)a4 options:(int64_t)a5 error:(id *)a6;
- (ECDKIMPublicKeySource)publicKeySource;
- (ECDKIMVerifier)init;
- (ECDKIMVerifier)initWithPublicKeySource:(id)a3;
- (id)_base64HashBodyData:(id)a3 usingSignature:(id)a4;
- (id)_canonicalizeHeaders:(id)a3 usingRelaxedAlgorithmWithSignatureHeader:(id)a4;
- (id)_canonicalizeHeaders:(id)a3 usingSimpleAlgorithmWithSignatureHeader:(id)a4;
- (id)_relaxedCanonicalizationForHeaderName:(id)a3 headerBody:(id)a4;
- (id)_verifyMessage:(id)a3 withDKIMSignatureHeaders:(id)a4 publicKeySource:(id)a5 options:(int64_t)a6 error:(id *)a7;
- (id)verifiableMessageForMessageData:(id)a3 dkimSignatureHeaders:(id *)a4 error:(id *)a5;
- (id)verificationContextForMessageData:(id)a3 error:(id *)a4;
- (id)verifyMessage:(id)a3 withDKIMSignatureHeaders:(id)a4 options:(int64_t)a5 error:(id *)a6;
- (void)_canonicalizeBodyDataUsingRelaxedAlgorithm:(id)a3;
- (void)_canonicalizeBodyDataUsingSimpleAlgorithm:(id)a3;
@end

@implementation ECDKIMVerifier

uint64_t ___ef_log_ECDKIMVerifier_block_invoke()
{
  _ef_log_ECDKIMVerifier_log = (uint64_t)os_log_create("com.apple.email", "ECDKIMVerifier");
  return MEMORY[0x1F41817F8]();
}

- (ECDKIMVerifier)initWithPublicKeySource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECDKIMVerifier;
  v6 = [(ECDKIMVerifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_publicKeySource, a3);
  }

  return v7;
}

- (ECDKIMVerifier)init
{
  v3 = objc_alloc_init(ECDNSClient);
  v4 = [(ECDKIMVerifier *)self initWithPublicKeySource:v3];

  return v4;
}

- (id)verifiableMessageForMessageData:(id)a3 dkimSignatureHeaders:(id *)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  int v52 = 168626701;
  v40 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v52 length:4];
  uint64_t v7 = objc_msgSend(v41, "ef_rangeOfData:");
  uint64_t v9 = v8;
  v39 = a5;
  if (v8)
  {
    uint64_t v10 = v7;
    v37 = objc_msgSend(v41, "ef_subdataToIndex:", objc_msgSend(@"\r\n", "length") + v7);
    v38 = (void *)[[NSString alloc] initWithData:v37 encoding:4];
    v35 = objc_msgSend(v41, "ef_subdataFromIndex:", v10 + v9);
    v36 = [[ECRawMessageHeaders alloc] initWithHeaderString:v38];
    v34 = [(ECRawMessageHeaders *)v36 headersForKey:@"dkim-signature"];
    v33 = a4;
    id v42 = (id)objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v11 = v34;
    v12 = 0;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v55 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v49 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v17 = [ECDKIMMessageHeader alloc];
          v18 = [v16 transmittedName];
          v19 = [v16 body];
          id v47 = 0;
          v20 = [(ECDKIMMessageHeader *)v17 initWithHeaderFieldName:v18 headerBody:v19 error:&v47];
          id v21 = v47;

          if (v21)
          {
            _ef_log_ECDKIMVerifier();
            v22 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = objc_msgSend(v21, "ef_publicDescription");
              -[ECDKIMVerifier verifiableMessageForMessageData:dkimSignatureHeaders:error:].cold.4(v23, buf, &v54, v22);
            }

            v12 = v21;
          }
          else
          {
            v24 = [(ECDKIMMessageHeader *)v20 agentOrUserIdentifier];
            v25 = [(ECDKIMMessageHeader *)v20 signingDomainIdentifier];
            char v26 = objc_msgSend(v24, "ef_hasCaseInsensitiveSuffix:", v25);

            if (v26)
            {
              v27 = [(ECDKIMMessageHeader *)v20 signedHeaderFields];
              char v28 = [v27 containsObject:@"from"];

              if (v28)
              {
                [v42 addObject:v20];
                v12 = 0;
                goto LABEL_23;
              }
              v29 = _ef_log_ECDKIMVerifier();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                -[ECDKIMVerifier verifiableMessageForMessageData:dkimSignatureHeaders:error:](&v43, v44);
              }
            }
            else
            {
              v29 = _ef_log_ECDKIMVerifier();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                -[ECDKIMVerifier verifiableMessageForMessageData:dkimSignatureHeaders:error:](&v45, v46);
              }
            }

            v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECDKIMVerifier" code:1 userInfo:0];
          }
LABEL_23:
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v55 count:16];
      }
      while (v13);
    }

    if ([v42 count] || !v12)
    {
      if (v33) {
        id *v33 = v42;
      }
      v30 = [[ECDKIMVerifiableMessage alloc] initWithHeaders:v36 bodyData:v35];
    }
    else
    {
      v30 = 0;
      if (v39) {
        id *v39 = v12;
      }
    }
  }
  else
  {
    v31 = _ef_log_ECDKIMVerifier();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[ECDKIMVerifier verifiableMessageForMessageData:dkimSignatureHeaders:error:](v31);
    }

    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"ECDKIMVerifier" code:1 userInfo:0];
      v30 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
  }

  return v30;
}

- (BOOL)verifyMessageData:(id)a3
{
  return [(ECDKIMVerifier *)self verifyMessageData:a3 options:3];
}

- (BOOL)verifyMessageData:(id)a3 options:(int64_t)a4
{
  id v10 = 0;
  v6 = [(ECDKIMVerifier *)self verifiableMessageForMessageData:a3 dkimSignatureHeaders:&v10 error:0];
  id v7 = v10;
  uint64_t v8 = [(ECDKIMVerifier *)self verifyMessage:v6 withDKIMSignatureHeaders:v7 options:a4 error:0];

  return v8 != 0;
}

- (id)verifyMessage:(id)a3 withDKIMSignatureHeaders:(id)a4 options:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [(ECDKIMVerifier *)self publicKeySource];
  uint64_t v13 = [(ECDKIMVerifier *)self _verifyMessage:v10 withDKIMSignatureHeaders:v11 publicKeySource:v12 options:a5 error:a6];

  return v13;
}

- (id)_verifyMessage:(id)a3 withDKIMSignatureHeaders:(id)a4 publicKeySource:(id)a5 options:(int64_t)a6 error:(id *)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v11 = a4;
  id v26 = a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v31;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
      if ((a6 & 2) != 0)
      {
        v17 = [v28 bodyData];
        BOOL v16 = [(ECDKIMVerifier *)self _verifyMessageBodyData:v17 withOptions:a6 usingSignature:v15];
      }
      else
      {
        BOOL v16 = 1;
      }
      if (a6)
      {
        v19 = [v28 headers];
        id v29 = 0;
        BOOL v18 = [(ECDKIMVerifier *)self _verifyMessageHeaders:v19 usingSignature:v15 publicKeySource:v26 error:&v29];
        id v20 = v29;

        if (v20)
        {
          if (a7)
          {
            v22 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v34 = *MEMORY[0x1E4F28A50];
            id v35 = v20;
            v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            *a7 = [v22 errorWithDomain:@"ECDKIMVerifier" code:0 userInfo:v23];
          }
          id v21 = 0;
          goto LABEL_23;
        }
      }
      else
      {
        BOOL v18 = 1;
      }
      if (v16 && v18)
      {
        if (a7) {
          *a7 = 0;
        }
        id v21 = v15;
LABEL_23:

        goto LABEL_24;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (a7)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"ECDKIMVerifier" code:1 userInfo:0];
    id v21 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v21 = 0;
  }
LABEL_24:

  return v21;
}

- (BOOL)_verifyMessageBodyData:(id)a3 withOptions:(int64_t)a4 usingSignature:(id)a5
{
  char v5 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)[a3 mutableCopy];
  uint64_t v10 = [v8 bodyCanonicalizationAlgorithm];
  if (v10)
  {
    if (v10 == 1) {
      [(ECDKIMVerifier *)self _canonicalizeBodyDataUsingRelaxedAlgorithm:v9];
    }
  }
  else
  {
    [(ECDKIMVerifier *)self _canonicalizeBodyDataUsingSimpleAlgorithm:v9];
  }
  id v11 = [v8 bodyLength];
  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v12 = [v8 bodyLength];
  uint64_t v13 = [v12 unsignedIntegerValue];
  uint64_t v14 = [v9 length];

  if (v13 == v14) {
    goto LABEL_7;
  }
  BOOL v18 = [v8 bodyLength];
  unint64_t v19 = [v18 unsignedIntegerValue];
  unint64_t v20 = [v9 length];

  if (v19 > v20)
  {
    id v21 = _ef_log_ECDKIMVerifier();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ECDKIMVerifier _verifyMessageBodyData:withOptions:usingSignature:](v21);
    }
LABEL_14:

    char v17 = 0;
    goto LABEL_15;
  }
  if ((v5 & 4) != 0)
  {
    id v21 = _ef_log_ECDKIMVerifier();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1BF11D000, v21, OS_LOG_TYPE_DEFAULT, "Ignoring DKIM signature that did not sign the entire body (required by options).", v23, 2u);
    }
    goto LABEL_14;
  }
LABEL_7:
  v15 = [(ECDKIMVerifier *)self _base64HashBodyData:v9 usingSignature:v8];
  BOOL v16 = [v8 canonicalizedBodyHash];
  char v17 = [v15 isEqualToString:v16];

LABEL_15:
  return v17;
}

- (id)_base64HashBodyData:(id)a3 usingSignature:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 hashingAlgorithm];
  if (v7) {
    uint64_t v8 = 32 * (v7 == 1);
  }
  else {
    uint64_t v8 = 20;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA58] dataWithLength:v8];
  uint64_t v10 = [v6 bodyLength];
  if (v10)
  {
    id v11 = [v6 bodyLength];
    uint64_t v12 = [v11 unsignedIntegerValue];
  }
  else
  {
    uint64_t v12 = [v5 length];
  }

  objc_msgSend(v5, "subdataWithRange:", 0, v12);
  id v13 = objc_claimAutoreleasedReturnValue();
  uint64_t v14 = (const void *)[v13 bytes];

  uint64_t v15 = [v6 hashingAlgorithm];
  if (v15)
  {
    if (v15 == 1) {
      CC_SHA256(v14, v12, (unsigned __int8 *)[v9 mutableBytes]);
    }
  }
  else
  {
    CC_SHA1(v14, v12, (unsigned __int8 *)[v9 mutableBytes]);
  }
  BOOL v16 = [v9 base64EncodedStringWithOptions:0];

  return v16;
}

- (BOOL)_verifyMessageHeaders:(id)a3 usingSignature:(id)a4 publicKeySource:(id)a5 error:(id *)a6
{
  long long v31 = self;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v34 = a4;
  id v33 = a5;
  uint64_t v8 = [a3 allHeaders];
  uint64_t v9 = [v8 reverseObjectEnumerator];
  uint64_t v37 = [v9 allObjects];

  uint64_t v10 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v11 = [v34 signedHeaderFields];
  id obj = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v12)
  {
    uint64_t v36 = *(void *)v59;
    do
    {
      uint64_t v38 = v12;
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v59 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v15 = v37;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v62 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v55 != v17) {
                objc_enumerationMutation(v15);
              }
              unint64_t v19 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              unint64_t v20 = objc_msgSend(v19, "name", v31);
              if ([v20 isEqualToString:v14])
              {
                char v21 = [v10 containsObject:v19];

                if ((v21 & 1) == 0)
                {
                  [v10 addObject:v19];
                  goto LABEL_17;
                }
              }
              else
              {
              }
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v62 count:16];
          }
          while (v16);
        }
LABEL_17:
      }
      id v11 = obj;
      uint64_t v12 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v12);
  }

  uint64_t v22 = [v34 headerCanonicalizationAlgorithm];
  if (!v22)
  {
    uint64_t v23 = [(ECDKIMVerifier *)v31 _canonicalizeHeaders:v10 usingSimpleAlgorithmWithSignatureHeader:v34];
    goto LABEL_23;
  }
  if (v22 == 1)
  {
    uint64_t v23 = [(ECDKIMVerifier *)v31 _canonicalizeHeaders:v10 usingRelaxedAlgorithmWithSignatureHeader:v34];
LABEL_23:
    v24 = (void *)v23;
    goto LABEL_25;
  }
  v24 = 0;
LABEL_25:
  uint64_t v50 = 0;
  long long v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  uint64_t v44 = 0;
  char v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy_;
  long long v48 = __Block_byref_object_dispose_;
  id v49 = 0;
  v25 = objc_msgSend(v34, "signingDomainIdentifier", v31);
  id v26 = [v34 selector];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke;
  v39[3] = &unk_1E63EE330;
  id v42 = &v50;
  char v43 = &v44;
  id v27 = v24;
  id v40 = v27;
  id v28 = v34;
  id v41 = v28;
  [v33 getPublicKeyRecordsFromDomain:v25 withSelector:v26 completionHandler:v39];

  if (a6) {
    *a6 = (id) v45[5];
  }
  BOOL v29 = *((unsigned char *)v51 + 24) != 0;

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v29;
}

void __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v18 = a3;
  if (v18)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  else
  {
    unint64_t v20 = [*(id *)(a1 + 32) dataUsingEncoding:1];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v19;
    uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v29;
      while (2)
      {
        uint64_t v22 = v5;
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = [[ECDKIMPublicKey alloc] initWithRecord:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          uint64_t v9 = [(ECDKIMPublicKey *)v8 publicKeyData];
          BOOL v10 = v9 == 0;

          if (v10)
          {
            uint64_t v16 = _ef_log_ECDKIMVerifier();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke_cold_1(&v26, v27);
            }
          }
          else
          {
            uint64_t v11 = [(ECDKIMPublicKey *)v8 signingAlgorithm];
            if (v11 == [*(id *)(a1 + 40) signingAlgorithm])
            {
              uint64_t v12 = [*(id *)(a1 + 40) signatureData];
              id v13 = [(ECDKIMPublicKey *)v8 publicKeyData];
              uint64_t v14 = [*(id *)(a1 + 40) hashingAlgorithm];
              id v23 = 0;
              BOOL v15 = +[ECDKIMCryptoUtil verifySignedData:v20 withSignatureData:v12 publicKeyData:v13 hashingAlgorithm:v14 error:&v23];
              uint64_t v16 = v23;
              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v15;

              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
              {

                goto LABEL_22;
              }
              uint64_t v17 = _ef_log_ECDKIMVerifier();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v33 = v16;
                _os_log_error_impl(&dword_1BF11D000, v17, OS_LOG_TYPE_ERROR, "Failed to verify DKIM signed data: %{public}@", buf, 0xCu);
              }
            }
            else
            {
              uint64_t v16 = _ef_log_ECDKIMVerifier();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke_cold_2(&v24, v25);
              }
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (void)_canonicalizeBodyDataUsingSimpleAlgorithm:(id)a3
{
  id v13 = a3;
  v3 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ef_crlfData");
  int v4 = objc_msgSend(v13, "ef_hasSuffix:", v3);

  if (v4)
  {
    while ((unint64_t)[v13 length] >= 4)
    {
      uint64_t v5 = [v13 length];
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ef_crlfData");
      uint64_t v7 = objc_msgSend(v13, "subdataWithRange:", v5 - 4, objc_msgSend(v6, "length"));
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ef_crlfData");
      int v9 = [v7 isEqualToData:v8];

      if (!v9) {
        break;
      }
      uint64_t v10 = [v13 length];
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ef_crlfData");
      objc_msgSend(v13, "ef_deleteBytesInRange:", v10 - 4, objc_msgSend(v11, "length"));
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ef_crlfData");
    [v13 appendData:v12];
  }
}

- (void)_canonicalizeBodyDataUsingRelaxedAlgorithm:(id)a3
{
  id v3 = a3;
  __int16 v14 = 2336;
  int v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v14 length:2];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ef_crlfData");
  objc_msgSend(v3, "ef_deleteBytesInData:beforeOccurrencesOfData:", v4, v5);

  char v13 = 32;
  uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v13 length:1];
  objc_msgSend(v3, "ef_replaceContiguousSequencesOfBytesInData:withData:", v4, v6);
  while (1)
  {

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ef_crlfData");
    int v8 = objc_msgSend(v3, "ef_hasSuffix:", v7);

    if (!v8) {
      break;
    }
    uint64_t v9 = [v3 length];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ef_crlfData");
    objc_msgSend(v3, "ef_deleteBytesInRange:", v9 - 2, objc_msgSend(v6, "length"));
  }
  if ([v3 length])
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ef_crlfData");
    char v11 = objc_msgSend(v3, "ef_hasSuffix:", v10);

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ef_crlfData");
      [v3 appendData:v12];
    }
  }
}

- (id)_canonicalizeHeaders:(id)a3 usingSimpleAlgorithmWithSignatureHeader:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v13 = [v12 transmittedName];
        __int16 v14 = [v12 body];
        [v7 appendFormat:@"%@:%@", v13, v14, (void)v18];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  BOOL v15 = [v6 headerNameForCanonicalization];
  uint64_t v16 = [v6 bodyForCanonicalization];
  [v7 appendFormat:@"%@:%@", v15, v16];

  while ([v7 hasSuffix:@"\r\n"])
    [v7 deleteCharactersInRange:objc_msgSend(v7, "length") - objc_msgSend(@"\r\n", "length"), objc_msgSend(@"\r\n", "length")];

  return v7;
}

- (id)_canonicalizeHeaders:(id)a3 usingRelaxedAlgorithmWithSignatureHeader:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        char v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        __int16 v14 = [v13 name];
        BOOL v15 = [v13 body];
        uint64_t v16 = [(ECDKIMVerifier *)self _relaxedCanonicalizationForHeaderName:v14 headerBody:v15];

        [v8 appendString:v16];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v17 = [v7 headerNameForCanonicalization];
  long long v18 = [v7 bodyForCanonicalization];
  long long v19 = [(ECDKIMVerifier *)self _relaxedCanonicalizationForHeaderName:v17 headerBody:v18];

  [v8 appendString:v19];
  while ([v8 hasSuffix:@"\r\n"])
    [v8 deleteCharactersInRange:objc_msgSend(v8, "length") - objc_msgSend(@"\r\n", "length"), objc_msgSend(@"\r\n", "length")];

  return v8;
}

- (id)_relaxedCanonicalizationForHeaderName:(id)a3 headerBody:(id)a4
{
  id v5 = a4;
  id v6 = [a3 lowercaseString];
  id v7 = (void *)[v6 mutableCopy];

  id v8 = (void *)[v5 mutableCopy];
  objc_msgSend(v8, "ef_rfc5322Unfold");
  id v9 = objc_msgSend(MEMORY[0x1E4F28B88], "ef_rfc6376WhitespaceCharacterSet");
  objc_msgSend(v8, "ef_replaceContiguousSequencesOfCharactersInSet:withString:", v9, @" ");

  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28B88], "ef_rfc6376WhitespaceCharacterSet");
  objc_msgSend(v8, "ef_trimTrailingCharactersInSetIgnoringNewline:", v10);

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28B88], "ef_rfc6376WhitespaceCharacterSet");
  objc_msgSend(v7, "ef_trimTrailingCharactersInSet:", v11);

  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28B88], "ef_rfc6376WhitespaceCharacterSet");
  objc_msgSend(v8, "ef_trimLeadingCharactersInSet:", v12);

  char v13 = [NSString stringWithFormat:@"%@:%@", v7, v8];

  return v13;
}

- (id)verificationContextForMessageData:(id)a3 error:(id *)a4
{
  id v12 = 0;
  id v5 = [(ECDKIMVerifier *)self verifiableMessageForMessageData:a3 dkimSignatureHeaders:&v12 error:a4];
  id v6 = v12;
  id v7 = v6;
  if (!v5) {
    goto LABEL_8;
  }
  if ([v6 count])
  {
    id v8 = [[ECDKIMVerificationContext alloc] initWithVerifiableMessage:v5 dkimSignatureHeaders:v7];
    goto LABEL_9;
  }
  id v9 = _ef_log_ECDKIMVerifier();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1BF11D000, v9, OS_LOG_TYPE_DEFAULT, "No DKIM signature headers found.", v11, 2u);
  }

  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"ECDKIMVerifier" code:1 userInfo:0];
    id v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_8:
    id v8 = 0;
  }
LABEL_9:

  return v8;
}

- (BOOL)verifyMessageData:(id)a3 publicKeySource:(id)a4 options:(int64_t)a5
{
  id v8 = a4;
  id v13 = 0;
  id v9 = [(ECDKIMVerifier *)self verifiableMessageForMessageData:a3 dkimSignatureHeaders:&v13 error:0];
  id v10 = v13;
  uint64_t v11 = [(ECDKIMVerifier *)self _verifyMessage:v9 withDKIMSignatureHeaders:v10 publicKeySource:v8 options:a5 error:0];

  return v11 != 0;
}

- (BOOL)verifyMessageWithContext:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(ECDKIMVerifier *)self publicKeySource];
  LOBYTE(a5) = [(ECDKIMVerifier *)self verifyMessageWithContext:v8 publicKeySource:v9 options:a4 error:a5];

  return (char)a5;
}

- (BOOL)verifyMessageWithContext:(id)a3 publicKeySource:(id)a4 options:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([v10 requireFullBodySignature]) {
    int64_t v12 = a5 | 4;
  }
  else {
    int64_t v12 = a5;
  }
  id v13 = [v10 verifiableMessage];
  __int16 v14 = [v10 dkimSignatureHeaders];
  BOOL v15 = [(ECDKIMVerifier *)self _verifyMessage:v13 withDKIMSignatureHeaders:v14 publicKeySource:v11 options:v12 error:a6];
  BOOL v16 = v15 != 0;

  return v16;
}

- (ECDKIMPublicKeySource)publicKeySource
{
  return self->_publicKeySource;
}

- (void).cxx_destruct
{
}

- (void)verifiableMessageForMessageData:(os_log_t)log dkimSignatureHeaders:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "Could not verify message because header/body boundary could not be found.", v1, 2u);
}

- (void)verifiableMessageForMessageData:(unsigned char *)a1 dkimSignatureHeaders:(unsigned char *)a2 error:.cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1(&dword_1BF11D000, v2, v3, "Ignoring DKIM-Signature because 'From:' header is not signed.", v4);
}

- (void)verifiableMessageForMessageData:(unsigned char *)a1 dkimSignatureHeaders:(unsigned char *)a2 error:.cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1(&dword_1BF11D000, v2, v3, "Ignoring DKIM-Signature because domain in 'i=' tag is not a subdomain of the domain in the 'd=' tag.", v4);
}

- (void)verifiableMessageForMessageData:(void *)a3 dkimSignatureHeaders:(os_log_t)log error:.cold.4(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "Error parsing DKIM signature: %{public}@", buf, 0xCu);
}

- (void)_verifyMessageBodyData:(os_log_t)log withOptions:usingSignature:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "Ignoring DKIM signature that specified a body length larger than the length of the body.", v1, 2u);
}

void __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1(&dword_1BF11D000, v2, v3, "Ignoring public key record because there's no p= value.", v4);
}

void __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1(&dword_1BF11D000, v2, v3, "Ignoring public key record because it was not signed with the same signing algorithm as the DKIM signature.", v4);
}

@end