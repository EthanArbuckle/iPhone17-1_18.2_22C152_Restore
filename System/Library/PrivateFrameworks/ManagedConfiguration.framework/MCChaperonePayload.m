@interface MCChaperonePayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)nonChaperonePairingAllowed;
- (MCChaperonePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSData)pairingCertificateData;
- (NSNumber)nonChaperonePairingAllowedNum;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
@end

@implementation MCChaperonePayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.chaperone";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"CHAPERONE_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"CHAPERONE_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCChaperonePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v45.receiver = self;
  v45.super_class = (Class)MCChaperonePayload;
  id v10 = [(MCPayload *)&v45 initWithDictionary:v8 profile:v9 outError:a5];
  if (v10)
  {
    if ([v9 isStub])
    {
      id v44 = 0;
      uint64_t v11 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"AllowNonChaperonePairing" isRequired:0 outError:&v44];
      id v12 = v44;
      v13 = (void *)*((void *)v10 + 13);
      *((void *)v10 + 13) = v11;

      if (!v12)
      {
        *((unsigned char *)v10 + 96) = [*((id *)v10 + 13) BOOLValue];
        id v43 = 0;
        uint64_t v14 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"PairingCertificate" isRequired:0 outError:&v43];
        id v12 = v43;
        v15 = (void *)*((void *)v10 + 11);
        *((void *)v10 + 11) = v14;

        if (!v12) {
          goto LABEL_17;
        }
      }
    }
    else
    {
      v16 = [v10 organization];
      uint64_t v17 = [v16 length];

      if (v17)
      {
        id v42 = 0;
        uint64_t v18 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"AllowNonChaperonePairing" isRequired:0 outError:&v42];
        id v12 = v42;
        v19 = (void *)*((void *)v10 + 13);
        *((void *)v10 + 13) = v18;

        if (!v12)
        {
          *((unsigned char *)v10 + 96) = [*((id *)v10 + 13) BOOLValue];
          id v41 = 0;
          uint64_t v20 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"PairingCertificate" isRequired:1 outError:&v41];
          id v12 = v41;
          v21 = (void *)*((void *)v10 + 11);
          *((void *)v10 + 11) = v20;

          if (!v12)
          {
            SecCertificateRef v22 = SecCertificateCreateWithData(0, *((CFDataRef *)v10 + 11));
            if (v22)
            {
              CFRelease(v22);
              goto LABEL_17;
            }
            v31 = (void *)MEMORY[0x1E4F28C58];
            v32 = [v10 friendlyName];
            v40 = MCErrorArray(@"CHAPERONE_BAD_CERT_DATA_P_PAYLOAD", v33, v34, v35, v36, v37, v38, v39, v32);
            id v12 = [v31 MCErrorWithDomain:@"MCSupervisedErrorDomain" code:29003 descriptionArray:v40 errorType:@"MCFatalError"];

            if (!v12) {
              goto LABEL_17;
            }
          }
        }
      }
      else
      {
        id v12 = +[MCProfile missingFieldErrorWithField:@"PayloadOrganization"];
        if (!v12) {
          goto LABEL_17;
        }
      }
    }
    v23 = [v10 malformedPayloadErrorWithError:v12];
    v24 = v23;
    if (a5) {
      *a5 = v23;
    }
    v25 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      v27 = objc_opt_class();
      id v28 = v27;
      v29 = [v24 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v47 = v27;
      __int16 v48 = 2114;
      v49 = v29;
      _os_log_impl(&dword_1A13F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    id v10 = 0;
  }
LABEL_17:

  return (MCChaperonePayload *)v10;
}

- (id)stubDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)MCChaperonePayload;
  uint64_t v3 = [(MCPayload *)&v8 stubDictionary];
  uint64_t v4 = v3;
  pairingCertificateData = self->_pairingCertificateData;
  if (pairingCertificateData) {
    [v3 setObject:pairingCertificateData forKey:@"PairingCertificate"];
  }
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_nonChaperonePairingAllowed];
  [v4 setObject:v6 forKey:@"AllowNonChaperonePairing"];

  return v4;
}

- (id)subtitle1Label
{
  uint64_t v2 = [(MCPayload *)self organization];
  if (v2)
  {
    uint64_t v3 = MCLocalizedString(@"CHAPERONE_DETAIL_ORG_COLON");
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)subtitle2Label
{
  return MCLocalizedString(@"CHAPERONE_DETAIL_PAIRING_COLON");
}

- (id)subtitle2Description
{
  if (self->_nonChaperonePairingAllowed) {
    uint64_t v2 = @"CHAPERONE_PAIRING_ALLOWED";
  }
  else {
    uint64_t v2 = @"CHAPERONE_PAIRING_PROHIBITED";
  }
  uint64_t v3 = MCLocalizedString(v2);
  return v3;
}

- (id)verboseDescription
{
  v8.receiver = self;
  v8.super_class = (Class)MCChaperonePayload;
  uint64_t v3 = [(MCPayload *)&v8 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = MCStringForBool(self->_pairingCertificateData != 0);
  [v4 appendFormat:@"Pairing Cert present          : %@\n", v5];

  uint64_t v6 = MCStringForBool(self->_nonChaperonePairingAllowed);
  [v4 appendFormat:@"Non-Supervised pairing allowed: %@\n", v6];

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MCPayload *)self organization];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [MCKeyValue alloc];
    uint64_t v7 = [(MCPayload *)self organization];
    objc_super v8 = MCLocalizedString(@"ORGANIZATION");
    id v9 = [(MCKeyValue *)v6 initWithLocalizedString:v7 localizedKey:v8];

    [v3 addObject:v9];
  }
  id v10 = [MCKeyValue alloc];
  uint64_t v11 = MCLocalizedStringForBool(self->_pairingCertificateData != 0);
  id v12 = MCLocalizedString(@"PAIRING_CERTIFICATE_PRESENT");
  v13 = [(MCKeyValue *)v10 initWithLocalizedString:v11 localizedKey:v12];
  [v3 addObject:v13];

  if (self->_nonChaperonePairingAllowedNum)
  {
    uint64_t v14 = [MCKeyValue alloc];
    v15 = MCLocalizedStringForBool([(NSNumber *)self->_nonChaperonePairingAllowedNum BOOLValue]);
    v16 = MCLocalizedString(@"NON_SUPERVISED_PAIRING_ALLOWED");
    uint64_t v17 = [(MCKeyValue *)v14 initWithLocalizedString:v15 localizedKey:v16];

    [v3 addObject:v17];
  }
  uint64_t v18 = +[MCKeyValueSection sectionWithKeyValues:v3];
  v21[0] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

  return v19;
}

- (NSData)pairingCertificateData
{
  return self->_pairingCertificateData;
}

- (BOOL)nonChaperonePairingAllowed
{
  return self->_nonChaperonePairingAllowed;
}

- (NSNumber)nonChaperonePairingAllowedNum
{
  return self->_nonChaperonePairingAllowedNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonChaperonePairingAllowedNum, 0);
  objc_storeStrong((id *)&self->_pairingCertificateData, 0);
}

@end