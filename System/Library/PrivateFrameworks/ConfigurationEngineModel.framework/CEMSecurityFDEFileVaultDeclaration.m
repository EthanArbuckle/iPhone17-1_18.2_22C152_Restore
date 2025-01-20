@interface CEMSecurityFDEFileVaultDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEnable:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withEnable:(id)a4 withDefer:(id)a5 withUserEntersMissingInfo:(id)a6 withUseRecoveryKey:(id)a7 withShowRecoveryKey:(id)a8 withOutputPath:(id)a9 withUsername:(id)a10 withPassword:(id)a11 withUseKeychain:(id)a12 withDeferForceAtUserLoginMaxBypassAttempts:(id)a13 withDeferDontAskAtUserLogout:(id)a14 withCertificateIdentifier:(id)a15;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadDefer;
- (NSNumber)payloadDeferDontAskAtUserLogout;
- (NSNumber)payloadDeferForceAtUserLoginMaxBypassAttempts;
- (NSNumber)payloadShowRecoveryKey;
- (NSNumber)payloadUseKeychain;
- (NSNumber)payloadUseRecoveryKey;
- (NSNumber)payloadUserEntersMissingInfo;
- (NSString)payloadCertificateIdentifier;
- (NSString)payloadEnable;
- (NSString)payloadOutputPath;
- (NSString)payloadPassword;
- (NSString)payloadUsername;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadCertificateIdentifier:(id)a3;
- (void)setPayloadDefer:(id)a3;
- (void)setPayloadDeferDontAskAtUserLogout:(id)a3;
- (void)setPayloadDeferForceAtUserLoginMaxBypassAttempts:(id)a3;
- (void)setPayloadEnable:(id)a3;
- (void)setPayloadOutputPath:(id)a3;
- (void)setPayloadPassword:(id)a3;
- (void)setPayloadShowRecoveryKey:(id)a3;
- (void)setPayloadUseKeychain:(id)a3;
- (void)setPayloadUseRecoveryKey:(id)a3;
- (void)setPayloadUserEntersMissingInfo:(id)a3;
- (void)setPayloadUsername:(id)a3;
@end

@implementation CEMSecurityFDEFileVaultDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.security.fde.filevault";
}

+ (id)profileType
{
  return @"com.apple.MCX.FileVault2";
}

+ (NSSet)allowedPayloadKeys
{
  v6[12] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Enable";
  v6[1] = @"Defer";
  v6[2] = @"UserEntersMissingInfo";
  v6[3] = @"UseRecoveryKey";
  v6[4] = @"ShowRecoveryKey";
  v6[5] = @"OutputPath";
  v6[6] = @"Username";
  v6[7] = @"Password";
  v6[8] = @"UseKeychain";
  v6[9] = @"DeferForceAtUserLoginMaxBypassAttempts";
  v6[10] = @"DeferDontAskAtUserLogout";
  v6[11] = @"CertificateIdentifier";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:12];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withEnable:(id)a4 withDefer:(id)a5 withUserEntersMissingInfo:(id)a6 withUseRecoveryKey:(id)a7 withShowRecoveryKey:(id)a8 withOutputPath:(id)a9 withUsername:(id)a10 withPassword:(id)a11 withUseKeychain:(id)a12 withDeferForceAtUserLoginMaxBypassAttempts:(id)a13 withDeferDontAskAtUserLogout:(id)a14 withCertificateIdentifier:(id)a15
{
  id v48 = a3;
  id v47 = a15;
  id v46 = a14;
  id v45 = a13;
  id v17 = a12;
  id v44 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  v25 = v48;
  v26 = objc_opt_new();
  [v26 setDeclarationType:@"com.apple.configuration.security.fde.filevault"];
  if (v48)
  {
    [v26 setDeclarationIdentifier:v48];
  }
  else
  {
    v27 = [MEMORY[0x263F08C38] UUID];
    [v27 UUIDString];
    id v43 = v17;
    id v28 = v19;
    v30 = id v29 = v18;
    [v26 setDeclarationIdentifier:v30];

    id v18 = v29;
    id v19 = v28;
    id v17 = v43;

    v25 = 0;
  }
  objc_msgSend(v26, "setPayloadEnable:", v24, a6);

  v31 = (void *)MEMORY[0x263EFFA80];
  if (v23) {
    id v32 = v23;
  }
  else {
    id v32 = (id)MEMORY[0x263EFFA80];
  }
  [v26 setPayloadDefer:v32];

  if (v22) {
    id v33 = v22;
  }
  else {
    id v33 = v31;
  }
  [v26 setPayloadUserEntersMissingInfo:v33];

  v34 = (void *)MEMORY[0x263EFFA88];
  if (v21) {
    id v35 = v21;
  }
  else {
    id v35 = (id)MEMORY[0x263EFFA88];
  }
  [v26 setPayloadUseRecoveryKey:v35];

  if (v20) {
    id v36 = v20;
  }
  else {
    id v36 = v34;
  }
  [v26 setPayloadShowRecoveryKey:v36];

  [v26 setPayloadOutputPath:v19];
  [v26 setPayloadUsername:v18];

  [v26 setPayloadPassword:v44];
  if (v17) {
    id v37 = v17;
  }
  else {
    id v37 = v31;
  }
  [v26 setPayloadUseKeychain:v37];

  [v26 setPayloadDeferForceAtUserLoginMaxBypassAttempts:v45];
  if (v46) {
    id v38 = v46;
  }
  else {
    id v38 = v31;
  }
  [v26 setPayloadDeferDontAskAtUserLogout:v38];

  [v26 setPayloadCertificateIdentifier:v47];
  [v26 updateServerHash];

  return v26;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEnable:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.security.fde.filevault"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadEnable:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSecurityFDEFileVaultDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v50 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Enable" isRequired:1 defaultValue:0 error:&v50];
  id v14 = v50;
  payloadEnable = self->_payloadEnable;
  self->_payloadEnable = v13;

  if (!v14)
  {
    id v49 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"Defer" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v49];
    id v14 = v49;
    payloadDefer = self->_payloadDefer;
    self->_payloadDefer = v16;

    if (!v14)
    {
      id v48 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"UserEntersMissingInfo" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v48];
      id v14 = v48;
      payloadUserEntersMissingInfo = self->_payloadUserEntersMissingInfo;
      self->_payloadUserEntersMissingInfo = v18;

      if (!v14)
      {
        id v47 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"UseRecoveryKey" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v47];
        id v14 = v47;
        payloadUseRecoveryKey = self->_payloadUseRecoveryKey;
        self->_payloadUseRecoveryKey = v20;

        if (!v14)
        {
          id v46 = 0;
          id v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ShowRecoveryKey" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v46];
          id v14 = v46;
          payloadShowRecoveryKey = self->_payloadShowRecoveryKey;
          self->_payloadShowRecoveryKey = v22;

          if (!v14)
          {
            id v45 = 0;
            id v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OutputPath" isRequired:0 defaultValue:0 error:&v45];
            id v14 = v45;
            payloadOutputPath = self->_payloadOutputPath;
            self->_payloadOutputPath = v24;

            if (!v14)
            {
              id v44 = 0;
              v26 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Username" isRequired:0 defaultValue:0 error:&v44];
              id v14 = v44;
              payloadUsername = self->_payloadUsername;
              self->_payloadUsername = v26;

              if (!v14)
              {
                id v43 = 0;
                id v28 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Password" isRequired:0 defaultValue:0 error:&v43];
                id v14 = v43;
                payloadPassword = self->_payloadPassword;
                self->_payloadPassword = v28;

                if (!v14)
                {
                  id v42 = 0;
                  v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"UseKeychain" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v42];
                  id v14 = v42;
                  payloadUseKeychain = self->_payloadUseKeychain;
                  self->_payloadUseKeychain = v30;

                  if (!v14)
                  {
                    id v41 = 0;
                    id v32 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DeferForceAtUserLoginMaxBypassAttempts" isRequired:0 defaultValue:0 error:&v41];
                    id v14 = v41;
                    payloadDeferForceAtUserLoginMaxBypassAttempts = self->_payloadDeferForceAtUserLoginMaxBypassAttempts;
                    self->_payloadDeferForceAtUserLoginMaxBypassAttempts = v32;

                    if (!v14)
                    {
                      id v40 = 0;
                      v34 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DeferDontAskAtUserLogout" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v40];
                      id v14 = v40;
                      payloadDeferDontAskAtUserLogout = self->_payloadDeferDontAskAtUserLogout;
                      self->_payloadDeferDontAskAtUserLogout = v34;

                      if (!v14)
                      {
                        id v39 = 0;
                        id v36 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CertificateIdentifier" isRequired:0 defaultValue:0 error:&v39];
                        id v14 = v39;
                        payloadCertificateIdentifier = self->_payloadCertificateIdentifier;
                        self->_payloadCertificateIdentifier = v36;
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
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Enable" withValue:self->_payloadEnable isRequired:1 defaultValue:0];
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"Defer" withValue:self->_payloadDefer isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"UserEntersMissingInfo" withValue:self->_payloadUserEntersMissingInfo isRequired:0 defaultValue:v5];
  uint64_t v6 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"UseRecoveryKey" withValue:self->_payloadUseRecoveryKey isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ShowRecoveryKey" withValue:self->_payloadShowRecoveryKey isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"OutputPath" withValue:self->_payloadOutputPath isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Username" withValue:self->_payloadUsername isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Password" withValue:self->_payloadPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"UseKeychain" withValue:self->_payloadUseKeychain isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"DeferForceAtUserLoginMaxBypassAttempts" withValue:self->_payloadDeferForceAtUserLoginMaxBypassAttempts isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DeferDontAskAtUserLogout" withValue:self->_payloadDeferDontAskAtUserLogout isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"CertificateIdentifier" withValue:self->_payloadCertificateIdentifier isRequired:0 defaultValue:0];
  v7 = (void *)[v4 copy];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v30.receiver = self;
  v30.super_class = (Class)CEMSecurityFDEFileVaultDeclaration;
  v4 = [(CEMDeclarationBase *)&v30 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadEnable copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadDefer copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadUserEntersMissingInfo copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadUseRecoveryKey copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadShowRecoveryKey copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadOutputPath copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSString *)self->_payloadUsername copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSString *)self->_payloadPassword copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadUseKeychain copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadDeferForceAtUserLoginMaxBypassAttempts copy];
  id v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadDeferDontAskAtUserLogout copy];
  v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSString *)self->_payloadCertificateIdentifier copy];
  id v28 = (void *)v4[20];
  v4[20] = v27;

  return v4;
}

- (NSString)payloadEnable
{
  return self->_payloadEnable;
}

- (void)setPayloadEnable:(id)a3
{
}

- (NSNumber)payloadDefer
{
  return self->_payloadDefer;
}

- (void)setPayloadDefer:(id)a3
{
}

- (NSNumber)payloadUserEntersMissingInfo
{
  return self->_payloadUserEntersMissingInfo;
}

- (void)setPayloadUserEntersMissingInfo:(id)a3
{
}

- (NSNumber)payloadUseRecoveryKey
{
  return self->_payloadUseRecoveryKey;
}

- (void)setPayloadUseRecoveryKey:(id)a3
{
}

- (NSNumber)payloadShowRecoveryKey
{
  return self->_payloadShowRecoveryKey;
}

- (void)setPayloadShowRecoveryKey:(id)a3
{
}

- (NSString)payloadOutputPath
{
  return self->_payloadOutputPath;
}

- (void)setPayloadOutputPath:(id)a3
{
}

- (NSString)payloadUsername
{
  return self->_payloadUsername;
}

- (void)setPayloadUsername:(id)a3
{
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
}

- (NSNumber)payloadUseKeychain
{
  return self->_payloadUseKeychain;
}

- (void)setPayloadUseKeychain:(id)a3
{
}

- (NSNumber)payloadDeferForceAtUserLoginMaxBypassAttempts
{
  return self->_payloadDeferForceAtUserLoginMaxBypassAttempts;
}

- (void)setPayloadDeferForceAtUserLoginMaxBypassAttempts:(id)a3
{
}

- (NSNumber)payloadDeferDontAskAtUserLogout
{
  return self->_payloadDeferDontAskAtUserLogout;
}

- (void)setPayloadDeferDontAskAtUserLogout:(id)a3
{
}

- (NSString)payloadCertificateIdentifier
{
  return self->_payloadCertificateIdentifier;
}

- (void)setPayloadCertificateIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCertificateIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDeferDontAskAtUserLogout, 0);
  objc_storeStrong((id *)&self->_payloadDeferForceAtUserLoginMaxBypassAttempts, 0);
  objc_storeStrong((id *)&self->_payloadUseKeychain, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadUsername, 0);
  objc_storeStrong((id *)&self->_payloadOutputPath, 0);
  objc_storeStrong((id *)&self->_payloadShowRecoveryKey, 0);
  objc_storeStrong((id *)&self->_payloadUseRecoveryKey, 0);
  objc_storeStrong((id *)&self->_payloadUserEntersMissingInfo, 0);
  objc_storeStrong((id *)&self->_payloadDefer, 0);

  objc_storeStrong((id *)&self->_payloadEnable, 0);
}

@end