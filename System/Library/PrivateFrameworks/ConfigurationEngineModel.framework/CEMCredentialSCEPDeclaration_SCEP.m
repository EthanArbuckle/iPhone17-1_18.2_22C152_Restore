@interface CEMCredentialSCEPDeclaration_SCEP
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithURL:(id)a3;
+ (id)buildWithURL:(id)a3 withName:(id)a4 withSubject:(id)a5 withKeysize:(id)a6 withKeyType:(id)a7 withKeyUsage:(id)a8 withCAFingerprint:(id)a9 withRetries:(id)a10 withRetryDelay:(id)a11 withSubjectAltName:(id)a12 withKeyIsExtractable:(id)a13 withChallengeCredential:(id)a14 withAllowAllAppsAccess:(id)a15;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMCredentialSCEPDeclaration_SCEPSubjectAltName)payloadSubjectAltName;
- (NSArray)payloadSubject;
- (NSData)payloadCAFingerprint;
- (NSNumber)payloadAllowAllAppsAccess;
- (NSNumber)payloadKeyIsExtractable;
- (NSNumber)payloadKeyUsage;
- (NSNumber)payloadKeysize;
- (NSNumber)payloadRetries;
- (NSNumber)payloadRetryDelay;
- (NSString)payloadChallengeCredential;
- (NSString)payloadKeyType;
- (NSString)payloadName;
- (NSString)payloadURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAllowAllAppsAccess:(id)a3;
- (void)setPayloadCAFingerprint:(id)a3;
- (void)setPayloadChallengeCredential:(id)a3;
- (void)setPayloadKeyIsExtractable:(id)a3;
- (void)setPayloadKeyType:(id)a3;
- (void)setPayloadKeyUsage:(id)a3;
- (void)setPayloadKeysize:(id)a3;
- (void)setPayloadName:(id)a3;
- (void)setPayloadRetries:(id)a3;
- (void)setPayloadRetryDelay:(id)a3;
- (void)setPayloadSubject:(id)a3;
- (void)setPayloadSubjectAltName:(id)a3;
- (void)setPayloadURL:(id)a3;
@end

@implementation CEMCredentialSCEPDeclaration_SCEP

+ (NSSet)allowedPayloadKeys
{
  v6[13] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"URL";
  v6[1] = @"Name";
  v6[2] = @"Subject";
  v6[3] = @"Keysize";
  v6[4] = @"Key Type";
  v6[5] = @"Key Usage";
  v6[6] = @"CAFingerprint";
  v6[7] = @"Retries";
  v6[8] = @"RetryDelay";
  v6[9] = @"SubjectAltName";
  v6[10] = @"KeyIsExtractable";
  v6[11] = @"ChallengeCredential";
  v6[12] = @"AllowAllAppsAccess";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:13];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithURL:(id)a3 withName:(id)a4 withSubject:(id)a5 withKeysize:(id)a6 withKeyType:(id)a7 withKeyUsage:(id)a8 withCAFingerprint:(id)a9 withRetries:(id)a10 withRetryDelay:(id)a11 withSubjectAltName:(id)a12 withKeyIsExtractable:(id)a13 withChallengeCredential:(id)a14 withAllowAllAppsAccess:(id)a15
{
  id v42 = a15;
  id v41 = a14;
  id v40 = a13;
  id v39 = a12;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  v23 = (__CFString *)a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  v28 = objc_opt_new();
  [v28 setPayloadURL:v27];

  [v28 setPayloadName:v26];
  [v28 setPayloadSubject:v25];

  if (v24) {
    v29 = v24;
  }
  else {
    v29 = &unk_26C8947A8;
  }
  [v28 setPayloadKeysize:v29];

  if (v23) {
    v30 = v23;
  }
  else {
    v30 = @"RSA";
  }
  [v28 setPayloadKeyType:v30];

  if (v22) {
    v31 = v22;
  }
  else {
    v31 = &unk_26C8947C0;
  }
  [v28 setPayloadKeyUsage:v31];

  [v28 setPayloadCAFingerprint:v21];
  if (v20) {
    v32 = v20;
  }
  else {
    v32 = &unk_26C8947D8;
  }
  [v28 setPayloadRetries:v32];

  if (v19) {
    v33 = v19;
  }
  else {
    v33 = &unk_26C8947F0;
  }
  [v28 setPayloadRetryDelay:v33];

  [v28 setPayloadSubjectAltName:v39];
  if (v40) {
    id v34 = v40;
  }
  else {
    id v34 = (id)MEMORY[0x263EFFA88];
  }
  [v28 setPayloadKeyIsExtractable:v34];

  [v28 setPayloadChallengeCredential:v41];
  if (v42) {
    id v35 = v42;
  }
  else {
    id v35 = (id)MEMORY[0x263EFFA80];
  }
  [v28 setPayloadAllowAllAppsAccess:v35];

  return v28;
}

+ (id)buildRequiredOnlyWithURL:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadURL:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMCredentialSCEPDeclaration_SCEP allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v53 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"URL" isRequired:1 defaultValue:0 error:&v53];
  id v14 = v53;
  payloadURL = self->_payloadURL;
  self->_payloadURL = v13;

  if (!v14)
  {
    id v52 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Name" isRequired:0 defaultValue:0 error:&v52];
    id v14 = v52;
    payloadName = self->_payloadName;
    self->_payloadName = v16;

    if (!v14)
    {
      id v51 = 0;
      v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Subject" validator:&__block_literal_global_10 isRequired:0 defaultValue:0 error:&v51];
      id v14 = v51;
      payloadSubject = self->_payloadSubject;
      self->_payloadSubject = v18;

      if (!v14)
      {
        id v50 = 0;
        id v20 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Keysize" isRequired:0 defaultValue:&unk_26C8947A8 error:&v50];
        id v14 = v50;
        payloadKeysize = self->_payloadKeysize;
        self->_payloadKeysize = v20;

        if (!v14)
        {
          id v49 = 0;
          id v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Key Type" isRequired:0 defaultValue:@"RSA" error:&v49];
          id v14 = v49;
          payloadKeyType = self->_payloadKeyType;
          self->_payloadKeyType = v22;

          if (!v14)
          {
            id v48 = 0;
            id v24 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Key Usage" isRequired:0 defaultValue:&unk_26C8947C0 error:&v48];
            id v14 = v48;
            payloadKeyUsage = self->_payloadKeyUsage;
            self->_payloadKeyUsage = v24;

            if (!v14)
            {
              id v47 = 0;
              id v26 = [(CEMPayloadBase *)self loadDataFromDictionary:v6 withKey:@"CAFingerprint" isRequired:0 defaultValue:0 error:&v47];
              id v14 = v47;
              payloadCAFingerprint = self->_payloadCAFingerprint;
              self->_payloadCAFingerprint = v26;

              if (!v14)
              {
                id v46 = 0;
                v28 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Retries" isRequired:0 defaultValue:&unk_26C8947D8 error:&v46];
                id v14 = v46;
                payloadRetries = self->_payloadRetries;
                self->_payloadRetries = v28;

                if (!v14)
                {
                  id v45 = 0;
                  v30 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"RetryDelay" isRequired:0 defaultValue:&unk_26C8947F0 error:&v45];
                  id v14 = v45;
                  payloadRetryDelay = self->_payloadRetryDelay;
                  self->_payloadRetryDelay = v30;

                  if (!v14)
                  {
                    id v44 = 0;
                    v32 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"SubjectAltName" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v44];
                    id v14 = v44;
                    payloadSubjectAltName = self->_payloadSubjectAltName;
                    self->_payloadSubjectAltName = v32;

                    if (!v14)
                    {
                      id v43 = 0;
                      id v34 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"KeyIsExtractable" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v43];
                      id v14 = v43;
                      payloadKeyIsExtractable = self->_payloadKeyIsExtractable;
                      self->_payloadKeyIsExtractable = v34;

                      if (!v14)
                      {
                        id v42 = 0;
                        v36 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ChallengeCredential" isRequired:0 defaultValue:0 error:&v42];
                        id v14 = v42;
                        payloadChallengeCredential = self->_payloadChallengeCredential;
                        self->_payloadChallengeCredential = v36;

                        if (!v14)
                        {
                          id v41 = 0;
                          v38 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AllowAllAppsAccess" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v41];
                          id v14 = v41;
                          payloadAllowAllAppsAccess = self->_payloadAllowAllAppsAccess;
                          self->_payloadAllowAllAppsAccess = v38;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"URL" withValue:self->_payloadURL isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Name" withValue:self->_payloadName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"Subject" withValue:self->_payloadSubject itemSerializer:&__block_literal_global_145 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"Keysize" withValue:self->_payloadKeysize isRequired:0 defaultValue:&unk_26C8947A8];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Key Type" withValue:self->_payloadKeyType isRequired:0 defaultValue:@"RSA"];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"Key Usage" withValue:self->_payloadKeyUsage isRequired:0 defaultValue:&unk_26C8947C0];
  [(CEMPayloadBase *)self serializeDataIntoDictionary:v5 withKey:@"CAFingerprint" withValue:self->_payloadCAFingerprint isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"Retries" withValue:self->_payloadRetries isRequired:0 defaultValue:&unk_26C8947D8];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"RetryDelay" withValue:self->_payloadRetryDelay isRequired:0 defaultValue:&unk_26C8947F0];
  payloadSubjectAltName = self->_payloadSubjectAltName;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __72__CEMCredentialSCEPDeclaration_SCEP_serializePayloadWithAssetProviders___block_invoke_2;
  v15 = &unk_2642C87E8;
  id v7 = v4;
  id v16 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"SubjectAltName" withValue:payloadSubjectAltName dictSerializer:&v12 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"KeyIsExtractable" withValue:self->_payloadKeyIsExtractable isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  payloadChallengeCredential = self->_payloadChallengeCredential;
  if (payloadChallengeCredential)
  {
    v9 = [v7 objectForKeyedSubscript:self->_payloadChallengeCredential];
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5, @"ChallengeCredential", payloadChallengeCredential, v9, &stru_26C838878, v12, v13, v14, v15 withKey withValue assetProvider transformType isRequired defaultValue];
  }
  else
  {
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5, @"ChallengeCredential", 0, 0, &stru_26C838878, v12, v13, v14, v15 withKey withValue assetProvider transformType isRequired defaultValue];
  }
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"AllowAllAppsAccess" withValue:self->_payloadAllowAllAppsAccess isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  v10 = (void *)[v5 copy];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v32.receiver = self;
  v32.super_class = (Class)CEMCredentialSCEPDeclaration_SCEP;
  id v4 = [(CEMPayloadBase *)&v32 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadURL copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadName copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadSubject copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadKeysize copy];
  uint64_t v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_payloadKeyType copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadKeyUsage copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSData *)self->_payloadCAFingerprint copy];
  v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadRetries copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadRetryDelay copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(CEMCredentialSCEPDeclaration_SCEPSubjectAltName *)self->_payloadSubjectAltName copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadKeyIsExtractable copy];
  id v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSString *)self->_payloadChallengeCredential copy];
  v28 = (void *)v4[13];
  v4[13] = v27;

  uint64_t v29 = [(NSNumber *)self->_payloadAllowAllAppsAccess copy];
  v30 = (void *)v4[14];
  v4[14] = v29;

  return v4;
}

- (NSString)payloadURL
{
  return self->_payloadURL;
}

- (void)setPayloadURL:(id)a3
{
}

- (NSString)payloadName
{
  return self->_payloadName;
}

- (void)setPayloadName:(id)a3
{
}

- (NSArray)payloadSubject
{
  return self->_payloadSubject;
}

- (void)setPayloadSubject:(id)a3
{
}

- (NSNumber)payloadKeysize
{
  return self->_payloadKeysize;
}

- (void)setPayloadKeysize:(id)a3
{
}

- (NSString)payloadKeyType
{
  return self->_payloadKeyType;
}

- (void)setPayloadKeyType:(id)a3
{
}

- (NSNumber)payloadKeyUsage
{
  return self->_payloadKeyUsage;
}

- (void)setPayloadKeyUsage:(id)a3
{
}

- (NSData)payloadCAFingerprint
{
  return self->_payloadCAFingerprint;
}

- (void)setPayloadCAFingerprint:(id)a3
{
}

- (NSNumber)payloadRetries
{
  return self->_payloadRetries;
}

- (void)setPayloadRetries:(id)a3
{
}

- (NSNumber)payloadRetryDelay
{
  return self->_payloadRetryDelay;
}

- (void)setPayloadRetryDelay:(id)a3
{
}

- (CEMCredentialSCEPDeclaration_SCEPSubjectAltName)payloadSubjectAltName
{
  return self->_payloadSubjectAltName;
}

- (void)setPayloadSubjectAltName:(id)a3
{
}

- (NSNumber)payloadKeyIsExtractable
{
  return self->_payloadKeyIsExtractable;
}

- (void)setPayloadKeyIsExtractable:(id)a3
{
}

- (NSString)payloadChallengeCredential
{
  return self->_payloadChallengeCredential;
}

- (void)setPayloadChallengeCredential:(id)a3
{
}

- (NSNumber)payloadAllowAllAppsAccess
{
  return self->_payloadAllowAllAppsAccess;
}

- (void)setPayloadAllowAllAppsAccess:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowAllAppsAccess, 0);
  objc_storeStrong((id *)&self->_payloadChallengeCredential, 0);
  objc_storeStrong((id *)&self->_payloadKeyIsExtractable, 0);
  objc_storeStrong((id *)&self->_payloadSubjectAltName, 0);
  objc_storeStrong((id *)&self->_payloadRetryDelay, 0);
  objc_storeStrong((id *)&self->_payloadRetries, 0);
  objc_storeStrong((id *)&self->_payloadCAFingerprint, 0);
  objc_storeStrong((id *)&self->_payloadKeyUsage, 0);
  objc_storeStrong((id *)&self->_payloadKeyType, 0);
  objc_storeStrong((id *)&self->_payloadKeysize, 0);
  objc_storeStrong((id *)&self->_payloadSubject, 0);
  objc_storeStrong((id *)&self->_payloadName, 0);

  objc_storeStrong((id *)&self->_payloadURL, 0);
}

@end