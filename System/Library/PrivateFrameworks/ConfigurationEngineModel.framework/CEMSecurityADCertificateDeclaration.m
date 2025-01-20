@interface CEMSecurityADCertificateDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withCertServer:(id)a4 withCertTemplate:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withCertServer:(id)a4 withCertTemplate:(id)a5 withDescription:(id)a6 withCertificateRenewalTimeInterval:(id)a7 withCertificateAuthority:(id)a8 withCertificateAcquisitionMechanism:(id)a9 withAllowAllAppsAccess:(id)a10 withPromptForCredentials:(id)a11 withKeyIsExtractable:(id)a12 withKeysize:(id)a13 withEnableAutoRenewal:(id)a14;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowAllAppsAccess;
- (NSNumber)payloadCertificateRenewalTimeInterval;
- (NSNumber)payloadEnableAutoRenewal;
- (NSNumber)payloadKeyIsExtractable;
- (NSNumber)payloadKeysize;
- (NSNumber)payloadPromptForCredentials;
- (NSString)payloadCertServer;
- (NSString)payloadCertTemplate;
- (NSString)payloadCertificateAcquisitionMechanism;
- (NSString)payloadCertificateAuthority;
- (NSString)payloadDescription;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowAllAppsAccess:(id)a3;
- (void)setPayloadCertServer:(id)a3;
- (void)setPayloadCertTemplate:(id)a3;
- (void)setPayloadCertificateAcquisitionMechanism:(id)a3;
- (void)setPayloadCertificateAuthority:(id)a3;
- (void)setPayloadCertificateRenewalTimeInterval:(id)a3;
- (void)setPayloadDescription:(id)a3;
- (void)setPayloadEnableAutoRenewal:(id)a3;
- (void)setPayloadKeyIsExtractable:(id)a3;
- (void)setPayloadKeysize:(id)a3;
- (void)setPayloadPromptForCredentials:(id)a3;
@end

@implementation CEMSecurityADCertificateDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.security.adcertificate";
}

+ (id)profileType
{
  return @"com.apple.ADCertificate.managed";
}

+ (NSSet)allowedPayloadKeys
{
  v6[11] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"CertServer";
  v6[1] = @"CertTemplate";
  v6[2] = @"Description";
  v6[3] = @"CertificateRenewalTimeInterval";
  v6[4] = @"CertificateAuthority";
  v6[5] = @"CertificateAcquisitionMechanism";
  v6[6] = @"AllowAllAppsAccess";
  v6[7] = @"PromptForCredentials";
  v6[8] = @"KeyIsExtractable";
  v6[9] = @"Keysize";
  v6[10] = @"EnableAutoRenewal";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:11];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 1;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withCertServer:(id)a4 withCertTemplate:(id)a5 withDescription:(id)a6 withCertificateRenewalTimeInterval:(id)a7 withCertificateAuthority:(id)a8 withCertificateAcquisitionMechanism:(id)a9 withAllowAllAppsAccess:(id)a10 withPromptForCredentials:(id)a11 withKeyIsExtractable:(id)a12 withKeysize:(id)a13 withEnableAutoRenewal:(id)a14
{
  id v44 = a3;
  id v43 = a14;
  id v42 = a13;
  id v41 = a12;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  v25 = v44;
  v26 = objc_opt_new();
  [v26 setDeclarationType:@"com.apple.configuration.security.adcertificate"];
  if (v44)
  {
    [v26 setDeclarationIdentifier:v44];
  }
  else
  {
    v27 = [MEMORY[0x263F08C38] UUID];
    [v27 UUIDString];
    id v40 = v20;
    id v28 = v17;
    v30 = id v29 = v19;
    [v26 setDeclarationIdentifier:v30];

    id v19 = v29;
    id v17 = v28;
    id v20 = v40;

    v25 = 0;
  }
  objc_msgSend(v26, "setPayloadCertServer:", v24, a5);

  [v26 setPayloadCertTemplate:v23];
  [v26 setPayloadDescription:v22];

  [v26 setPayloadCertificateRenewalTimeInterval:v21];
  [v26 setPayloadCertificateAuthority:v20];

  [v26 setPayloadCertificateAcquisitionMechanism:v19];
  v31 = (void *)MEMORY[0x263EFFA80];
  if (v18) {
    id v32 = v18;
  }
  else {
    id v32 = (id)MEMORY[0x263EFFA80];
  }
  [v26 setPayloadAllowAllAppsAccess:v32];

  if (v17) {
    id v33 = v17;
  }
  else {
    id v33 = v31;
  }
  [v26 setPayloadPromptForCredentials:v33];

  if (v41) {
    id v34 = v41;
  }
  else {
    id v34 = v31;
  }
  [v26 setPayloadKeyIsExtractable:v34];

  if (v42) {
    v35 = v42;
  }
  else {
    v35 = &unk_26C894928;
  }
  [v26 setPayloadKeysize:v35];

  if (v43) {
    id v36 = v43;
  }
  else {
    id v36 = v31;
  }
  [v26 setPayloadEnableAutoRenewal:v36];

  [v26 updateServerHash];

  return v26;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withCertServer:(id)a4 withCertTemplate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.security.adcertificate"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadCertServer:v9];

  [v10 setPayloadCertTemplate:v8];
  [v10 updateServerHash];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMSecurityADCertificateDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v47 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CertServer" isRequired:1 defaultValue:0 error:&v47];
  id v14 = v47;
  payloadCertServer = self->_payloadCertServer;
  self->_payloadCertServer = v13;

  if (!v14)
  {
    id v46 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CertTemplate" isRequired:1 defaultValue:0 error:&v46];
    id v14 = v46;
    payloadCertTemplate = self->_payloadCertTemplate;
    self->_payloadCertTemplate = v16;

    if (!v14)
    {
      id v45 = 0;
      id v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Description" isRequired:0 defaultValue:0 error:&v45];
      id v14 = v45;
      payloadDescription = self->_payloadDescription;
      self->_payloadDescription = v18;

      if (!v14)
      {
        id v44 = 0;
        id v20 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"CertificateRenewalTimeInterval" isRequired:0 defaultValue:0 error:&v44];
        id v14 = v44;
        payloadCertificateRenewalTimeInterval = self->_payloadCertificateRenewalTimeInterval;
        self->_payloadCertificateRenewalTimeInterval = v20;

        if (!v14)
        {
          id v43 = 0;
          id v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CertificateAuthority" isRequired:0 defaultValue:0 error:&v43];
          id v14 = v43;
          payloadCertificateAuthority = self->_payloadCertificateAuthority;
          self->_payloadCertificateAuthority = v22;

          if (!v14)
          {
            id v42 = 0;
            id v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CertificateAcquisitionMechanism" isRequired:0 defaultValue:0 error:&v42];
            id v14 = v42;
            payloadCertificateAcquisitionMechanism = self->_payloadCertificateAcquisitionMechanism;
            self->_payloadCertificateAcquisitionMechanism = v24;

            if (!v14)
            {
              id v41 = 0;
              v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AllowAllAppsAccess" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v41];
              id v14 = v41;
              payloadAllowAllAppsAccess = self->_payloadAllowAllAppsAccess;
              self->_payloadAllowAllAppsAccess = v26;

              if (!v14)
              {
                id v40 = 0;
                id v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PromptForCredentials" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v40];
                id v14 = v40;
                payloadPromptForCredentials = self->_payloadPromptForCredentials;
                self->_payloadPromptForCredentials = v28;

                if (!v14)
                {
                  id v39 = 0;
                  v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"KeyIsExtractable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v39];
                  id v14 = v39;
                  payloadKeyIsExtractable = self->_payloadKeyIsExtractable;
                  self->_payloadKeyIsExtractable = v30;

                  if (!v14)
                  {
                    id v38 = 0;
                    id v32 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Keysize" isRequired:0 defaultValue:&unk_26C894928 error:&v38];
                    id v14 = v38;
                    payloadKeysize = self->_payloadKeysize;
                    self->_payloadKeysize = v32;

                    if (!v14)
                    {
                      id v37 = 0;
                      id v34 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EnableAutoRenewal" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v37];
                      id v14 = v37;
                      payloadEnableAutoRenewal = self->_payloadEnableAutoRenewal;
                      self->_payloadEnableAutoRenewal = v34;
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
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"CertServer" withValue:self->_payloadCertServer isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"CertTemplate" withValue:self->_payloadCertTemplate isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Description" withValue:self->_payloadDescription isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"CertificateRenewalTimeInterval" withValue:self->_payloadCertificateRenewalTimeInterval isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"CertificateAuthority" withValue:self->_payloadCertificateAuthority isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"CertificateAcquisitionMechanism" withValue:self->_payloadCertificateAcquisitionMechanism isRequired:0 defaultValue:0];
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"AllowAllAppsAccess" withValue:self->_payloadAllowAllAppsAccess isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"PromptForCredentials" withValue:self->_payloadPromptForCredentials isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"KeyIsExtractable" withValue:self->_payloadKeyIsExtractable isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Keysize" withValue:self->_payloadKeysize isRequired:0 defaultValue:&unk_26C894928];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EnableAutoRenewal" withValue:self->_payloadEnableAutoRenewal isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CEMSecurityADCertificateDeclaration;
  v4 = [(CEMDeclarationBase *)&v28 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadCertServer copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadCertTemplate copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadDescription copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadCertificateRenewalTimeInterval copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_payloadCertificateAuthority copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadCertificateAcquisitionMechanism copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadAllowAllAppsAccess copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadPromptForCredentials copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadKeyIsExtractable copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadKeysize copy];
  id v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadEnableAutoRenewal copy];
  v26 = (void *)v4[19];
  v4[19] = v25;

  return v4;
}

- (NSString)payloadCertServer
{
  return self->_payloadCertServer;
}

- (void)setPayloadCertServer:(id)a3
{
}

- (NSString)payloadCertTemplate
{
  return self->_payloadCertTemplate;
}

- (void)setPayloadCertTemplate:(id)a3
{
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
}

- (NSNumber)payloadCertificateRenewalTimeInterval
{
  return self->_payloadCertificateRenewalTimeInterval;
}

- (void)setPayloadCertificateRenewalTimeInterval:(id)a3
{
}

- (NSString)payloadCertificateAuthority
{
  return self->_payloadCertificateAuthority;
}

- (void)setPayloadCertificateAuthority:(id)a3
{
}

- (NSString)payloadCertificateAcquisitionMechanism
{
  return self->_payloadCertificateAcquisitionMechanism;
}

- (void)setPayloadCertificateAcquisitionMechanism:(id)a3
{
}

- (NSNumber)payloadAllowAllAppsAccess
{
  return self->_payloadAllowAllAppsAccess;
}

- (void)setPayloadAllowAllAppsAccess:(id)a3
{
}

- (NSNumber)payloadPromptForCredentials
{
  return self->_payloadPromptForCredentials;
}

- (void)setPayloadPromptForCredentials:(id)a3
{
}

- (NSNumber)payloadKeyIsExtractable
{
  return self->_payloadKeyIsExtractable;
}

- (void)setPayloadKeyIsExtractable:(id)a3
{
}

- (NSNumber)payloadKeysize
{
  return self->_payloadKeysize;
}

- (void)setPayloadKeysize:(id)a3
{
}

- (NSNumber)payloadEnableAutoRenewal
{
  return self->_payloadEnableAutoRenewal;
}

- (void)setPayloadEnableAutoRenewal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEnableAutoRenewal, 0);
  objc_storeStrong((id *)&self->_payloadKeysize, 0);
  objc_storeStrong((id *)&self->_payloadKeyIsExtractable, 0);
  objc_storeStrong((id *)&self->_payloadPromptForCredentials, 0);
  objc_storeStrong((id *)&self->_payloadAllowAllAppsAccess, 0);
  objc_storeStrong((id *)&self->_payloadCertificateAcquisitionMechanism, 0);
  objc_storeStrong((id *)&self->_payloadCertificateAuthority, 0);
  objc_storeStrong((id *)&self->_payloadCertificateRenewalTimeInterval, 0);
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_payloadCertTemplate, 0);

  objc_storeStrong((id *)&self->_payloadCertServer, 0);
}

@end