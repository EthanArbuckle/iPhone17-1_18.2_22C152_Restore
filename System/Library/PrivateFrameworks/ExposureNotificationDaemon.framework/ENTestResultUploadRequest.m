@interface ENTestResultUploadRequest
+ (id)uploadRequestWithCertificate:(id)a3 healthAuthorityID:(id)a4 revisionToken:(id)a5 symmetricKey:(id)a6 temporaryExposureKeys:(id)a7 userMetadata:(id)a8 requestURL:(id)a9 URLSession:(id)a10 queue:(id)a11 error:(id *)a12;
- (NSNumber)insertedExposures;
- (NSString)responseRevisionToken;
- (id)bodyJSON;
- (id)handleResponse:(id)a3 body:(id)a4;
@end

@implementation ENTestResultUploadRequest

+ (id)uploadRequestWithCertificate:(id)a3 healthAuthorityID:(id)a4 revisionToken:(id)a5 symmetricKey:(id)a6 temporaryExposureKeys:(id)a7 userMetadata:(id)a8 requestURL:(id)a9 URLSession:(id)a10 queue:(id)a11 error:(id *)a12
{
  id v17 = a8;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v46 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  CFDateGetTypeID();
  v47 = v17;
  v25 = CFDictionaryGetTypedValue();
  uint64_t v26 = [objc_alloc((Class)a1) initWithRequestURL:v20 URLSession:v19 queue:v18];

  uint64_t v27 = [v24 copy];
  v28 = *(void **)(v26 + 80);
  *(void *)(v26 + 80) = v27;

  uint64_t v29 = [v23 copy];
  v30 = *(void **)(v26 + 88);
  *(void *)(v26 + 88) = v29;

  uint64_t v31 = [v22 copy];
  v32 = *(void **)(v26 + 96);
  *(void *)(v26 + 96) = v31;

  uint64_t v33 = [v21 copy];
  v34 = *(void **)(v26 + 104);
  *(void *)(v26 + 104) = v33;

  uint64_t v35 = [v46 copy];
  v36 = *(void **)(v26 + 112);
  *(void *)(v26 + 112) = v35;

  if (v25)
  {
    v37 = (void *)MEMORY[0x1E4F28EC8];
    [v25 timeIntervalSinceReferenceDate];
    uint64_t v39 = [v37 numberWithUnsignedInt:144 * (((v38 + *MEMORY[0x1E4F1CF70]) / 600.0) / 0x90)];
    v40 = *(void **)(v26 + 120);
    *(void *)(v26 + 120) = v39;
  }
  *(unsigned char *)(v26 + 128) = CFDictionaryGetInt64() != 0;
  v41 = [v47 objectForKeyedSubscript:*MEMORY[0x1E4F256E8]];

  if (v41)
  {
    uint64_t v42 = [MEMORY[0x1E4F28EC8] numberWithBool:CFDictionaryGetInt64() != 0];
    v43 = *(void **)(v26 + 136);
    *(void *)(v26 + 136) = v42;
  }

  return (id)v26;
}

- (id)bodyJSON
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self->_temporaryExposureKeys;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v27[0] = @"key";
        v8 = [v7 keyData];
        v9 = [v8 base64EncodedStringWithOptions:0];
        v28[0] = v9;
        v27[1] = @"rollingStartNumber";
        v10 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedInt:", objc_msgSend(v7, "rollingStartNumber"));
        v28[1] = v10;
        v27[2] = @"rollingPeriod";
        v11 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedInt:", objc_msgSend(v7, "rollingPeriod"));
        v28[2] = v11;
        v12 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v28 forKeys:v27 count:3];
        [v22 addObject:v12];
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v4);
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
  [v13 setObject:self->_healthAuthorityID forKeyedSubscript:@"healthAuthorityID"];
  v14 = [(NSData *)self->_symmetricKey base64EncodedStringWithOptions:0];
  [v13 setObject:v14 forKeyedSubscript:@"hmackey"];

  [v13 setObject:v22 forKeyedSubscript:@"temporaryExposureKeys"];
  v15 = [MEMORY[0x1E4F28EC8] numberWithBool:self->_userDidTravel];
  [v13 setObject:v15 forKeyedSubscript:@"traveler"];

  [v13 setObject:self->_certificate forKeyedSubscript:@"verificationPayload"];
  requestRevisionToken = self->_requestRevisionToken;
  if (requestRevisionToken) {
    [v13 setObject:requestRevisionToken forKeyedSubscript:@"revisionToken"];
  }
  symptomOnsetInterval = self->_symptomOnsetInterval;
  if (symptomOnsetInterval) {
    [v13 setObject:symptomOnsetInterval forKeyedSubscript:@"symptomOnsetInterval"];
  }
  isUserVaccinated = self->_isUserVaccinated;
  if (isUserVaccinated) {
    [v13 setObject:isUserVaccinated forKeyedSubscript:@"vaccinated"];
  }
  id v19 = (void *)[v13 copy];

  return v19;
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  id v5 = a4;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  responseRevisionToken = self->_responseRevisionToken;
  self->_responseRevisionToken = v6;

  NSDictionaryGetNSNumber();
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  insertedExposures = self->_insertedExposures;
  self->_insertedExposures = v8;

  return 0;
}

- (NSString)responseRevisionToken
{
  return self->_responseRevisionToken;
}

- (NSNumber)insertedExposures
{
  return self->_insertedExposures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedExposures, 0);
  objc_storeStrong((id *)&self->_responseRevisionToken, 0);
  objc_storeStrong((id *)&self->_isUserVaccinated, 0);
  objc_storeStrong((id *)&self->_symptomOnsetInterval, 0);
  objc_storeStrong((id *)&self->_temporaryExposureKeys, 0);
  objc_storeStrong((id *)&self->_symmetricKey, 0);
  objc_storeStrong((id *)&self->_requestRevisionToken, 0);
  objc_storeStrong((id *)&self->_healthAuthorityID, 0);

  objc_storeStrong((id *)&self->_certificate, 0);
}

@end