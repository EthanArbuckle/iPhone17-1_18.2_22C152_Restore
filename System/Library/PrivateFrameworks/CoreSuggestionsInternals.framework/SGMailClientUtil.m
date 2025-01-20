@interface SGMailClientUtil
+ (SGMailClientUtil)sharedInstance;
+ (id)convertLineEndingsToNetwork:(id)a3;
- (BOOL)isMessageAvailable:(id)a3;
- (ECDKIMVerifier)dkimVerifier;
- (EMDaemonInterface)emailDaemon;
- (id)_init;
- (id)allVIPEmailAddresses;
- (id)dataForMessageWithIdentifier:(id)a3 error:(id *)a4;
- (id)messageWithIdentifier:(id)a3 error:(id *)a4;
- (id)signaturesToRemoveForDKIMVerificationContext:(id)a3 withFromHeaderDomain:(id)a4;
- (int64_t)verifyDKIMSignatureForMailWithData:(id)a3 error:(id *)a4;
- (int64_t)verifyDKIMSignatureForMailWithData:(id)a3 options:(int64_t)a4 error:(id *)a5;
- (int64_t)verifyDKIMSignatureForMailWithIdentifier:(id)a3 error:(id *)a4;
- (int64_t)verifyDKIMSignatureForPipelineEntity:(id)a3 error:(id *)a4;
- (int64_t)verifyDKIMSignatureForStorageEvent:(id)a3 error:(id *)a4;
@end

@implementation SGMailClientUtil

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dkimVerifier, 0);
  objc_storeStrong((id *)&self->_emailDaemon, 0);
}

- (ECDKIMVerifier)dkimVerifier
{
  return self->_dkimVerifier;
}

- (EMDaemonInterface)emailDaemon
{
  return self->_emailDaemon;
}

- (int64_t)verifyDKIMSignatureForMailWithData:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  dkimVerifier = self->_dkimVerifier;
  if (!dkimVerifier)
  {
    v10 = (ECDKIMVerifier *)objc_opt_new();
    v11 = self->_dkimVerifier;
    self->_dkimVerifier = v10;

    dkimVerifier = self->_dkimVerifier;
  }
  id v39 = 0;
  v12 = [(ECDKIMVerifier *)dkimVerifier verificationContextForMessageData:v8 error:&v39];
  id v13 = v39;
  if (v12)
  {
    v14 = [v12 headers];
    v15 = [v14 firstHeaderForKey:*MEMORY[0x1E4F606A8]];

    if (v15 && ([v15 body], v16 = objc_claimAutoreleasedReturnValue(), v16, v16))
    {
      v17 = [v15 body];
      v18 = [v17 mutableCopy];

      v19 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      [v18 ef_trimLeadingCharactersInSet:v19];

      v20 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      [v18 ef_trimTrailingCharactersInSet:v20];

      [v18 ef_rfc5322Unfold];
      [v18 sg_decodeEncodedWords];
      id v38 = 0;
      int v21 = [MEMORY[0x1E4F60810] parseEmailAddressString:v18 displayName:0 localPart:0 domain:&v38 groupList:0];
      id v22 = v38;
      v23 = v22;
      if (v21 && v22)
      {
        id v35 = v22;
        uint64_t v24 = [(SGMailClientUtil *)self signaturesToRemoveForDKIMVerificationContext:v12 withFromHeaderDomain:v22];
        if (v24) {
          [v12 removeDKIMSignatureHeaders:v24];
        }
        v36 = v24;
        v25 = [v12 dkimSignatureHeaders];
        uint64_t v26 = [v25 count];

        if (v26)
        {
          [v12 setRequireFullBodySignature:1];
          v27 = self->_dkimVerifier;
          id v37 = 0;
          int v28 = [(ECDKIMVerifier *)v27 verifyMessageWithContext:v12 options:a4 error:&v37];
          id v29 = v37;

          if (v28)
          {
            v30 = sgDeveloperLogHandle();
            v31 = v36;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEFAULT, "Successfully verified DKIM signature.", buf, 2u);
            }
            int64_t v32 = 0;
            id v13 = v29;
            v23 = v35;
          }
          else
          {
            v23 = v35;
            v31 = v36;
            if (!v29) {
              goto LABEL_32;
            }
            if (a5) {
              *a5 = v29;
            }
            if (![v29 code])
            {
              v30 = sgDeveloperLogHandle();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – A temporary error occured while verifying the DKIM signature(s).", buf, 2u);
              }
              int64_t v32 = 1;
            }
            else
            {
LABEL_32:
              v30 = sgDeveloperLogHandle();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                int64_t v32 = 2;
                _os_log_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – A permanent error occured while verifying the DKIM signature(s).", buf, 2u);
              }
              else
              {
                int64_t v32 = 2;
              }
            }
            id v13 = v29;
          }
        }
        else
        {
          v30 = sgDeveloperLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            int64_t v32 = 2;
            _os_log_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – No valid DKIM signature found.", buf, 2u);
          }
          else
          {
            int64_t v32 = 2;
          }
          v23 = v35;
          v31 = v36;
        }
      }
      else
      {
        v31 = sgDeveloperLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          int64_t v32 = 2;
          _os_log_impl(&dword_1CA650000, v31, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – Could not parse domain in From: header.", buf, 2u);
        }
        else
        {
          int64_t v32 = 2;
        }
      }
    }
    else
    {
      v18 = sgDeveloperLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int64_t v32 = 2;
        _os_log_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – No From: header found.", buf, 2u);
      }
      else
      {
        int64_t v32 = 2;
      }
    }
  }
  else
  {
    v33 = sgEventsLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v13;
      _os_log_impl(&dword_1CA650000, v33, OS_LOG_TYPE_DEFAULT, "Could not create DKIM verification context %@", buf, 0xCu);
    }

    if (a5)
    {
      id v13 = v13;
      *a5 = v13;
    }
    int64_t v32 = 2;
  }

  return v32;
}

- (id)signaturesToRemoveForDKIMVerificationContext:(id)a3 withFromHeaderDomain:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v30 = v5;
  v7 = [v5 dkimSignatureHeaders];
  id v8 = (void *)MEMORY[0x1CB79B230]();
  id v29 = v6;
  v9 = [v6 lowercaseString];
  id v32 = (id)objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1CB79B230]();
        [v14 signatureExpiration];
        if (v16 <= 0.0
          || (double v17 = v16,
              [MEMORY[0x1E4F1C9C8] date],
              v18 = objc_claimAutoreleasedReturnValue(),
              [v18 timeIntervalSince1970],
              double v20 = v19,
              v18,
              v17 >= v20))
        {
          id v22 = [v14 signingDomainIdentifier];
          v23 = [v22 lowercaseString];

          char v24 = [v23 isEqualToString:v9];
          v25 = (void *)[[NSString alloc] initWithFormat:@".%@", v9];
          char v26 = [v23 hasSuffix:v25];

          if ((v24 & 1) == 0 && (v26 & 1) == 0)
          {
            v27 = sgDeveloperLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA650000, v27, OS_LOG_TYPE_DEFAULT, "Ignoring DKIM signature because the signing domain identifier is not the same as or a subdomain of the domain used in the From: header.", buf, 2u);
            }

            [v32 addObject:v14];
          }
        }
        else
        {
          int v21 = sgDeveloperLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEFAULT, "Ignoring DKIM signature because it has expired.", buf, 2u);
          }

          [v32 addObject:v14];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v11);
  }

  return v32;
}

- (int64_t)verifyDKIMSignatureForMailWithData:(id)a3 error:(id *)a4
{
  return [(SGMailClientUtil *)self verifyDKIMSignatureForMailWithData:a3 options:3 error:a4];
}

- (int64_t)verifyDKIMSignatureForMailWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = -[SGMailClientUtil dataForMessageWithIdentifier:error:](self, "dataForMessageWithIdentifier:error:", a3);
  if (v6) {
    int64_t v7 = [(SGMailClientUtil *)self verifyDKIMSignatureForMailWithData:v6 error:a4];
  }
  else {
    int64_t v7 = 1;
  }

  return v7;
}

- (int64_t)verifyDKIMSignatureForStorageEvent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [v6 duplicateKey];
  id v8 = [v7 parentKey];
  uint64_t v9 = [v8 entityType];

  if (v9 == 5)
  {
    uint64_t v10 = [v6 duplicateKey];
    uint64_t v11 = [v10 parentKey];
    uint64_t v12 = [v11 entityKey];
    id v13 = [v12 messageId];

    int64_t v14 = [(SGMailClientUtil *)self verifyDKIMSignatureForMailWithIdentifier:v13 error:a4];
  }
  else
  {
    int64_t v14 = 2;
  }

  return v14;
}

- (int64_t)verifyDKIMSignatureForPipelineEntity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [v6 duplicateKey];
  uint64_t v8 = [v7 entityType];

  if (v8 == 5)
  {
    uint64_t v9 = [v6 duplicateKey];
    uint64_t v10 = [v9 entityKey];
    uint64_t v11 = [v10 messageId];

    int64_t v12 = [(SGMailClientUtil *)self verifyDKIMSignatureForMailWithIdentifier:v11 error:a4];
  }
  else
  {
    int64_t v12 = 2;
  }

  return v12;
}

- (id)dataForMessageWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__37569;
  v30 = __Block_byref_object_dispose__37570;
  id v31 = 0;
  id obj = 0;
  int64_t v7 = [(SGMailClientUtil *)self messageWithIdentifier:v6 error:&obj];
  objc_storeStrong(&v31, obj);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F60250] optionsWithRequestedRepresentationType:*MEMORY[0x1E4F5FCB0] networkUsage:2];
    uint64_t v19 = 0;
    double v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__37569;
    v23 = __Block_byref_object_dispose__37570;
    id v24 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__SGMailClientUtil_dataForMessageWithIdentifier_error___block_invoke;
    v15[3] = &unk_1E65BFAA0;
    double v17 = &v26;
    uint64_t v10 = v9;
    double v16 = v10;
    v18 = &v19;
    id v11 = (id)[v7 requestRepresentationWithOptions:v8 completionHandler:v15];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
    {
      int64_t v12 = (void *)v27[5];
      if (v12) {
        *a4 = v12;
      }
    }
    id v13 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v13 = 0;
    if (a4) {
      *a4 = (id) v27[5];
    }
  }

  _Block_object_dispose(&v26, 8);
  return v13;
}

void __55__SGMailClientUtil_dataForMessageWithIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v8 = [v5 contentURL];
    id v18 = 0;
    dispatch_semaphore_t v9 = (void *)[v7 initWithContentsOfURL:v8 options:1 error:&v18];
    id v10 = v18;

    if (v9)
    {
      uint64_t v11 = +[SGMailClientUtil convertLineEndingsToNetwork:v9];
      uint64_t v12 = *(void *)(a1 + 48);
    }
    else
    {
      int64_t v14 = sgEventsLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v5 contentURL];
        *(_DWORD *)buf = 138412546;
        id v20 = v10;
        __int16 v21 = 2112;
        id v22 = v15;
        _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "Read error %@ loading message content from URL: %@", buf, 0x16u);
      }
      uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SGMailClientUtilErrorDomain" code:100 userInfo:0];
      uint64_t v12 = *(void *)(a1 + 40);
    }
    uint64_t v16 = *(void *)(v12 + 8);
    double v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v11;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    id v13 = sgEventsLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "Could not get message content: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (BOOL)isMessageAvailable:(id)a3
{
  id v4 = a3;
  id v5 = [(SGMailClientUtil *)self emailDaemon];
  id v6 = [v5 messageRepository];

  id v7 = [v6 messageObjectIDForURL:v4];

  uint64_t v10 = 0;
  uint64_t v8 = [v7 resultWithTimeout:&v10 error:0.3];
  LOBYTE(v4) = v8 != 0;

  return (char)v4;
}

- (id)messageWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGMailClientUtil *)self emailDaemon];
  uint64_t v8 = [v7 messageRepository];

  dispatch_semaphore_t v9 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v10 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  uint64_t v11 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v10];

  id v12 = objc_alloc(MEMORY[0x1E4F1CB10]);
  id v13 = (void *)[[NSString alloc] initWithFormat:@"message:%@", v11];
  int64_t v14 = (void *)[v12 initWithString:v13];

  if (v14)
  {
    id v23 = v6;
    v15 = [v8 messageObjectIDForURL:v14];
    id v25 = 0;
    uint64_t v16 = [v15 resultWithTimeout:&v25 error:0.3];
    id v17 = v25;
    id v18 = v17;
    if (v16)
    {
      uint64_t v19 = [v8 messageForObjectID:v16];
      id v24 = v18;
      id v20 = [v19 resultWithTimeout:&v24 error:0.1];
      id v21 = v24;

      if (a4 && !v20) {
        *a4 = v21;
      }
    }
    else if (a4)
    {
      id v21 = v17;
      id v20 = 0;
      *a4 = v21;
    }
    else
    {
      id v20 = 0;
      id v21 = v17;
    }

    id v6 = v23;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"SGMailClientUtilErrorDomain" code:101 userInfo:0];
    id v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)allVIPEmailAddresses
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(EMDaemonInterface *)self->_emailDaemon vipManager];
  if ([v2 conformsToProtocol:&unk_1F2594C60])
  {
    id v3 = (id)[v2 allVIPWaitForResult];
  }
  else
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v9 = 138412290;
      id v10 = (id)objc_opt_class();
      id v8 = v10;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "[vipManager conformsToProtocol:@protocol(EMVIPReader_Private)] was false (class: %@) -- the VIP set might be empty even if the user has VIP’s", (uint8_t *)&v9, 0xCu);
    }
    id v3 = (id)_PASEvaluateLogFaultAndProbCrashCriteria();
    if (v3) {
      abort();
    }
  }
  id v5 = (void *)MEMORY[0x1CB79B230](v3);
  id v6 = [v2 allVIPEmailAddresses];

  return v6;
}

- (id)_init
{
  v4.receiver = self;
  v4.super_class = (Class)SGMailClientUtil;
  v2 = [(SGMailClientUtil *)&v4 init];
  if (v2)
  {
    if (_init__pasOnceToken10 != -1) {
      dispatch_once(&_init__pasOnceToken10, &__block_literal_global_7_37590);
    }
    objc_storeStrong((id *)&v2->_emailDaemon, (id)_init__pasExprOnceResult);
  }
  return v2;
}

void __25__SGMailClientUtil__init__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)_init__pasExprOnceResult;
  _init__pasExprOnceResult = v1;
}

+ (id)convertLineEndingsToNetwork:(id)a3
{
  id v3 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__SGMailClientUtil_convertLineEndingsToNetwork___block_invoke;
  v13[3] = &unk_1E65BFAC8;
  v13[4] = &v14;
  v13[5] = &v18;
  [v3 enumerateByteRangesUsingBlock:v13];
  if (v19[3])
  {
    uint64_t v4 = [v3 length];
    size_t v5 = v19[3] + v4;
    id v6 = malloc_type_malloc(v5, 0xC29342E1uLL);
    id v7 = v6;
    if (!v6)
    {
      id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v10);
    }
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = v6;
    *((unsigned char *)v15 + 24) = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__SGMailClientUtil_convertLineEndingsToNetwork___block_invoke_2;
    v11[3] = &unk_1E65BFAF0;
    v11[4] = &v14;
    v11[5] = &v18;
    v11[6] = v12;
    [v3 enumerateByteRangesUsingBlock:v11];
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v7 length:v5 freeWhenDone:1];
    _Block_object_dispose(v12, 8);
  }
  else
  {
    id v8 = v3;
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

uint64_t __48__SGMailClientUtil_convertLineEndingsToNetwork___block_invoke(uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  for (; a4; --a4)
  {
    int v5 = *a2++;
    int v4 = v5;
    uint64_t v6 = *(void *)(*(void *)(result + 32) + 8);
    if (v5 == 10 && !*(unsigned char *)(v6 + 24)) {
      ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
    }
    else {
      *(unsigned char *)(v6 + 24) = v4 == 13;
    }
  }
  return result;
}

void *__48__SGMailClientUtil_convertLineEndingsToNetwork___block_invoke_2(void *result, char *a2, uint64_t a3, uint64_t a4)
{
  for (; a4; --a4)
  {
    int v4 = *a2;
    uint64_t v5 = *(void *)(result[4] + 8);
    if (v4 == 10 && !*(unsigned char *)(v5 + 24))
    {
      uint64_t v9 = *(void *)(result[5] + 8);
      uint64_t v10 = *(void *)(v9 + 24);
      if (!v10) {
        __assert_rtn("+[SGMailClientUtil convertLineEndingsToNetwork:]_block_invoke_2", "SGMailClientUtil.m", 360, "insertionsNeeded");
      }
      *(void *)(v9 + 24) = v10 - 1;
      uint64_t v11 = *(void *)(result[6] + 8);
      id v12 = *(unsigned char **)(v11 + 24);
      *(void *)(v11 + 24) = v12 + 1;
      unsigned char *v12 = 13;
    }
    else
    {
      *(unsigned char *)(v5 + 24) = v4 == 13;
    }
    char v6 = *a2++;
    uint64_t v7 = *(void *)(result[6] + 8);
    id v8 = *(unsigned char **)(v7 + 24);
    *(void *)(v7 + 24) = v8 + 1;
    *id v8 = v6;
  }
  return result;
}

+ (SGMailClientUtil)sharedInstance
{
  if (sharedInstance__pasOnceToken9_37606 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken9_37606, &__block_literal_global_37607);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_37608;
  return (SGMailClientUtil *)[v2 result];
}

void __34__SGMailClientUtil_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_4_37611];
  v2 = (void *)sharedInstance__pasExprOnceResult_37608;
  sharedInstance__pasExprOnceResult_37608 = v1;
}

id __34__SGMailClientUtil_sharedInstance__block_invoke_2()
{
  id v0 = [[SGMailClientUtil alloc] _init];
  return v0;
}

@end