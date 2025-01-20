@interface ENTestResultVerificationRequest
+ (id)_metadataFromVerificationResponseDictionary:(id)a3 error:(id *)a4;
+ (id)verificationRequestWithCode:(id)a3 acceptedReportTypes:(id)a4 APIKey:(id)a5 nonce:(id)a6 requestURL:(id)a7 URLSession:(id)a8 queue:(id)a9 error:(id *)a10;
- (NSDictionary)metadata;
- (NSSet)acceptedTestTypes;
- (NSString)nonce;
- (NSString)token;
- (NSString)verificationCode;
- (id)_testVerificationErrorForErrorCodeString:(id)a3;
- (id)bodyJSON;
- (id)errorForUnsuccessfulResponse:(id)a3 body:(id)a4;
- (id)handleResponse:(id)a3 body:(id)a4;
@end

@implementation ENTestResultVerificationRequest

+ (id)verificationRequestWithCode:(id)a3 acceptedReportTypes:(id)a4 APIKey:(id)a5 nonce:(id)a6 requestURL:(id)a7 URLSession:(id)a8 queue:(id)a9 error:(id *)a10
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v43 = a7;
  id v45 = a8;
  id v44 = a9;
  if ([v17 count])
  {
    v40 = v19;
    id v41 = v18;
    v20 = (objc_class *)a1;
    v21 = v16;
    v22 = DiagnosisReportTypeToServerStringMap();
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA88]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v42 = v17;
    id v24 = v17;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v47 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v30 = [v22 objectForKeyedSubscript:v29];
          if (!v30)
          {
            id v16 = v21;
            id v17 = v42;
            v32 = v43;
            id v19 = v40;
            if (a10)
            {
              [v29 unsignedIntValue];
              ENErrorF();
              *a10 = (id)objc_claimAutoreleasedReturnValue();
            }

            uint64_t v33 = 0;
            id v18 = v41;
            goto LABEL_19;
          }
          v31 = (void *)v30;
          [v23 addObject:v30];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    v32 = v43;
    uint64_t v33 = [[v20 alloc] initWithRequestURL:v43 URLSession:v45 queue:v44];
    id v18 = v41;
    [(id)v33 setAPIKey:v41];
    id v16 = v21;
    uint64_t v34 = [v21 copy];
    v35 = *(void **)(v33 + 80);
    *(void *)(v33 + 80) = v34;

    uint64_t v36 = [v23 copy];
    v37 = *(void **)(v33 + 88);
    *(void *)(v33 + 88) = v36;

    id v19 = v40;
    if (v40) {
      v38 = (void *)[v40 copy];
    }
    else {
      v38 = 0;
    }
    objc_storeStrong((id *)(v33 + 96), v38);
    if (v40) {

    }
    [(id)v33 setPaddedRequestSize:3072];
    id v17 = v42;
LABEL_19:
  }
  else
  {
    if (a10)
    {
      ENErrorF();
      uint64_t v33 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v33 = 0;
    }
    v32 = v43;
  }

  return (id)v33;
}

- (id)bodyJSON
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
  v4 = [(NSSet *)self->_acceptedTestTypes allObjects];
  [v3 setObject:v4 forKeyedSubscript:@"accept"];

  [v3 setObject:self->_verificationCode forKeyedSubscript:@"code"];
  [v3 setObject:self->_nonce forKeyedSubscript:@"nonce"];
  v5 = (void *)[v3 copy];

  return v5;
}

- (id)errorForUnsuccessfulResponse:(id)a3 body:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringGetTypeID();
  v8 = CFDictionaryGetTypedValue();
  if (v8)
  {
    v9 = [(ENTestResultVerificationRequest *)self _testVerificationErrorForErrorCodeString:v8];

    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v11.receiver = self;
  v11.super_class = (Class)ENTestResultVerificationRequest;
  v9 = [(ENTestResultNetworkRequest *)&v11 errorForUnsuccessfulResponse:v6 body:v7];
LABEL_6:

  return v9;
}

- (id)_testVerificationErrorForErrorCodeString:(id)a3
{
  id v3 = a3;
  v4 = [&unk_1F2B36040 objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4 && ((uint64_t v6 = [v4 integerValue], v6 == 12) || v6 == 3 || v6 == 2))
  {
    id v7 = ENTestResultErrorF(v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  id v5 = a4;
  id v16 = 0;
  uint64_t v6 = [(id)objc_opt_class() _metadataFromVerificationResponseDictionary:v5 error:&v16];
  id v7 = v16;
  v8 = v7;
  if (v6)
  {
    CFStringGetTypeID();
    v9 = CFDictionaryGetTypedValue();
    if (v9)
    {
      v10 = (NSDictionary *)[v6 copy];
      metadata = self->_metadata;
      self->_metadata = v10;

      v12 = (NSString *)[v9 copy];
      token = self->_token;
      self->_token = v12;

      id v14 = 0;
    }
    else
    {
      ENTestResultErrorF(4);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v14 = v7;
  }

  return v14;
}

+ (id)_metadataFromVerificationResponseDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__ENTestResultVerificationRequest__metadataFromVerificationResponseDictionary_error___block_invoke;
  v27[3] = &unk_1E69ACC08;
  id v7 = v5;
  id v28 = v7;
  v8 = (void (**)(void, void))MEMORY[0x1D9439FF0](v27);
  int v26 = 0;
  CFStringGetTypeID();
  v9 = CFDictionaryGetTypedValue();
  if ([v9 length])
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__1;
    id v24 = __Block_byref_object_dispose__1;
    id v25 = &unk_1F2B35D70;
    v10 = [v9 lowercaseString];
    objc_super v11 = DiagnosisReportTypeToServerStringMap();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__ENTestResultVerificationRequest__metadataFromVerificationResponseDictionary_error___block_invoke_49;
    v19[3] = &unk_1E69ACC30;
    v19[4] = v10;
    v19[5] = &v20;
    [v11 enumerateKeysAndObjectsUsingBlock:v19];

    [v6 setObject:v21[5] forKeyedSubscript:*MEMORY[0x1E4F256D8]];
    _Block_object_dispose(&v20, 8);
  }
  CFStringGetTypeID();
  v12 = CFDictionaryGetTypedValue();
  v13 = v12;
  if (v26 != -6727 && v26)
  {
    if (a4)
    {
      ((void (**)(void, __CFString *))v8)[2](v8, @"symptomDate");
      id v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {
    if (![v12 length])
    {
LABEL_8:
      id v17 = (void *)[v6 copy];
      goto LABEL_15;
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F28D50]);
    [v14 setFormatOptions:275];
    uint64_t v15 = [v14 dateFromString:v13];
    if (v15)
    {
      id v16 = (void *)v15;
      [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F256F0]];
      [v6 setObject:MEMORY[0x1E4F1CC40] forKeyedSubscript:*MEMORY[0x1E4F256E0]];

      goto LABEL_8;
    }
    if (a4)
    {
      ((void (**)(void, __CFString *))v8)[2](v8, @"symptomDate");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v17 = 0;
LABEL_15:

  return v17;
}

id __85__ENTestResultVerificationRequest__metadataFromVerificationResponseDictionary_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 objectForKeyedSubscript:v3];
  v4 = ENTestResultErrorF(4);

  return v4;
}

void __85__ENTestResultVerificationRequest__metadataFromVerificationResponseDictionary_error___block_invoke_49(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = [a3 lowercaseString];
  LODWORD(v8) = [v8 isEqualToString:v9];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (NSSet)acceptedTestTypes
{
  return self->_acceptedTestTypes;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSString)token
{
  return self->_token;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_acceptedTestTypes, 0);

  objc_storeStrong((id *)&self->_verificationCode, 0);
}

@end