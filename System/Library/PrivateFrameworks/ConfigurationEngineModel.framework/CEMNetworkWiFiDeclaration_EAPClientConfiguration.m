@interface CEMNetworkWiFiDeclaration_EAPClientConfiguration
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithAcceptEAPTypes:(id)a3;
+ (id)buildWithAcceptEAPTypes:(id)a3 withUserName:(id)a4 withUserPassword:(id)a5 withOneTimePassword:(id)a6 withPayloadCertificateAnchorUUID:(id)a7 withTLSTrustedCertificates:(id)a8 withTLSTrustedServerNames:(id)a9 withTLSAllowTrustExceptions:(id)a10 withTLSCertificateIsRequired:(id)a11 withTTLSInnerAuthentication:(id)a12 withTLSMinimumVersion:(id)a13 withTLSMaximumVersion:(id)a14 withOuterIdentity:(id)a15 withEAPFASTUsePAC:(id)a16 withEAPFASTProvisionPAC:(id)a17 withEAPFASTProvisionPACAnonymously:(id)a18 withEAPSIMNumberOfRANDs:(id)a19 withSystemModeCredentialsSource:(id)a20 withSystemModeUseOpenDirectoryCredentials:(id)a21 withOneTimeUserPassword:(id)a22 withEAPSIMAKAEncryptedIdentityEnabled:(id)a23;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadAcceptEAPTypes;
- (NSArray)payloadPayloadCertificateAnchorUUID;
- (NSArray)payloadTLSTrustedCertificates;
- (NSArray)payloadTLSTrustedServerNames;
- (NSNumber)payloadEAPFASTProvisionPAC;
- (NSNumber)payloadEAPFASTProvisionPACAnonymously;
- (NSNumber)payloadEAPFASTUsePAC;
- (NSNumber)payloadEAPSIMAKAEncryptedIdentityEnabled;
- (NSNumber)payloadEAPSIMNumberOfRANDs;
- (NSNumber)payloadOneTimePassword;
- (NSNumber)payloadOneTimeUserPassword;
- (NSNumber)payloadSystemModeUseOpenDirectoryCredentials;
- (NSNumber)payloadTLSAllowTrustExceptions;
- (NSNumber)payloadTLSCertificateIsRequired;
- (NSString)payloadOuterIdentity;
- (NSString)payloadSystemModeCredentialsSource;
- (NSString)payloadTLSMaximumVersion;
- (NSString)payloadTLSMinimumVersion;
- (NSString)payloadTTLSInnerAuthentication;
- (NSString)payloadUserName;
- (NSString)payloadUserPassword;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAcceptEAPTypes:(id)a3;
- (void)setPayloadEAPFASTProvisionPAC:(id)a3;
- (void)setPayloadEAPFASTProvisionPACAnonymously:(id)a3;
- (void)setPayloadEAPFASTUsePAC:(id)a3;
- (void)setPayloadEAPSIMAKAEncryptedIdentityEnabled:(id)a3;
- (void)setPayloadEAPSIMNumberOfRANDs:(id)a3;
- (void)setPayloadOneTimePassword:(id)a3;
- (void)setPayloadOneTimeUserPassword:(id)a3;
- (void)setPayloadOuterIdentity:(id)a3;
- (void)setPayloadPayloadCertificateAnchorUUID:(id)a3;
- (void)setPayloadSystemModeCredentialsSource:(id)a3;
- (void)setPayloadSystemModeUseOpenDirectoryCredentials:(id)a3;
- (void)setPayloadTLSAllowTrustExceptions:(id)a3;
- (void)setPayloadTLSCertificateIsRequired:(id)a3;
- (void)setPayloadTLSMaximumVersion:(id)a3;
- (void)setPayloadTLSMinimumVersion:(id)a3;
- (void)setPayloadTLSTrustedCertificates:(id)a3;
- (void)setPayloadTLSTrustedServerNames:(id)a3;
- (void)setPayloadTTLSInnerAuthentication:(id)a3;
- (void)setPayloadUserName:(id)a3;
- (void)setPayloadUserPassword:(id)a3;
@end

@implementation CEMNetworkWiFiDeclaration_EAPClientConfiguration

+ (NSSet)allowedPayloadKeys
{
  v6[21] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AcceptEAPTypes";
  v6[1] = @"UserName";
  v6[2] = @"UserPassword";
  v6[3] = @"OneTimePassword";
  v6[4] = @"PayloadCertificateAnchorUUID";
  v6[5] = @"TLSTrustedCertificates";
  v6[6] = @"TLSTrustedServerNames";
  v6[7] = @"TLSAllowTrustExceptions";
  v6[8] = @"TLSCertificateIsRequired";
  v6[9] = @"TTLSInnerAuthentication";
  v6[10] = @"TLSMinimumVersion";
  v6[11] = @"TLSMaximumVersion";
  v6[12] = @"OuterIdentity";
  v6[13] = @"EAPFASTUsePAC";
  v6[14] = @"EAPFASTProvisionPAC";
  v6[15] = @"EAPFASTProvisionPACAnonymously";
  v6[16] = @"EAPSIMNumberOfRANDs";
  v6[17] = @"SystemModeCredentialsSource";
  v6[18] = @"SystemModeUseOpenDirectoryCredentials";
  v6[19] = @"OneTimeUserPassword";
  v6[20] = @"EAPSIMAKAEncryptedIdentityEnabled";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:21];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithAcceptEAPTypes:(id)a3 withUserName:(id)a4 withUserPassword:(id)a5 withOneTimePassword:(id)a6 withPayloadCertificateAnchorUUID:(id)a7 withTLSTrustedCertificates:(id)a8 withTLSTrustedServerNames:(id)a9 withTLSAllowTrustExceptions:(id)a10 withTLSCertificateIsRequired:(id)a11 withTTLSInnerAuthentication:(id)a12 withTLSMinimumVersion:(id)a13 withTLSMaximumVersion:(id)a14 withOuterIdentity:(id)a15 withEAPFASTUsePAC:(id)a16 withEAPFASTProvisionPAC:(id)a17 withEAPFASTProvisionPACAnonymously:(id)a18 withEAPSIMNumberOfRANDs:(id)a19 withSystemModeCredentialsSource:(id)a20 withSystemModeUseOpenDirectoryCredentials:(id)a21 withOneTimeUserPassword:(id)a22 withEAPSIMAKAEncryptedIdentityEnabled:(id)a23
{
  id v66 = a23;
  id v65 = a22;
  id v64 = a21;
  id v63 = a20;
  id v62 = a19;
  id v61 = a18;
  id v60 = a17;
  id v59 = a16;
  id v58 = a15;
  v57 = (__CFString *)a14;
  v56 = (__CFString *)a13;
  v55 = (__CFString *)a12;
  id v23 = a11;
  id v24 = a10;
  id v25 = a9;
  id v26 = a8;
  id v27 = a7;
  id v28 = a6;
  id v29 = a5;
  id v30 = a4;
  id v31 = a3;
  v32 = objc_opt_new();
  [v32 setPayloadAcceptEAPTypes:v31];

  [v32 setPayloadUserName:v30];
  [v32 setPayloadUserPassword:v29];

  v33 = (void *)MEMORY[0x263EFFA80];
  if (v28) {
    id v34 = v28;
  }
  else {
    id v34 = (id)MEMORY[0x263EFFA80];
  }
  [v32 setPayloadOneTimePassword:v34];

  [v32 setPayloadPayloadCertificateAnchorUUID:v27];
  [v32 setPayloadTLSTrustedCertificates:v26];

  [v32 setPayloadTLSTrustedServerNames:v25];
  v35 = (void *)MEMORY[0x263EFFA88];
  if (v24) {
    id v36 = v24;
  }
  else {
    id v36 = (id)MEMORY[0x263EFFA88];
  }
  [v32 setPayloadTLSAllowTrustExceptions:v36];

  if (v23) {
    id v37 = v23;
  }
  else {
    id v37 = v33;
  }
  [v32 setPayloadTLSCertificateIsRequired:v37];

  if (v55) {
    v38 = v55;
  }
  else {
    v38 = @"MSCHAPv2";
  }
  [v32 setPayloadTTLSInnerAuthentication:v38];

  if (v56) {
    v39 = v56;
  }
  else {
    v39 = @"1.0";
  }
  [v32 setPayloadTLSMinimumVersion:v39];

  if (v57) {
    v40 = v57;
  }
  else {
    v40 = @"1.2";
  }
  [v32 setPayloadTLSMaximumVersion:v40];

  [v32 setPayloadOuterIdentity:v58];
  if (v59) {
    id v41 = v59;
  }
  else {
    id v41 = v33;
  }
  [v32 setPayloadEAPFASTUsePAC:v41];

  if (v60) {
    id v42 = v60;
  }
  else {
    id v42 = v33;
  }
  [v32 setPayloadEAPFASTProvisionPAC:v42];

  if (v61) {
    id v43 = v61;
  }
  else {
    id v43 = v33;
  }
  [v32 setPayloadEAPFASTProvisionPACAnonymously:v43];

  if (v62) {
    v44 = v62;
  }
  else {
    v44 = &unk_26C8948E0;
  }
  [v32 setPayloadEAPSIMNumberOfRANDs:v44];

  [v32 setPayloadSystemModeCredentialsSource:v63];
  if (v64) {
    id v45 = v64;
  }
  else {
    id v45 = v33;
  }
  [v32 setPayloadSystemModeUseOpenDirectoryCredentials:v45];

  if (v65) {
    id v46 = v65;
  }
  else {
    id v46 = v33;
  }
  [v32 setPayloadOneTimeUserPassword:v46];

  if (v66) {
    id v47 = v66;
  }
  else {
    id v47 = v35;
  }
  [v32 setPayloadEAPSIMAKAEncryptedIdentityEnabled:v47];

  return v32;
}

+ (id)buildRequiredOnlyWithAcceptEAPTypes:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadAcceptEAPTypes:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkWiFiDeclaration_EAPClientConfiguration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v77 = 0;
  v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"AcceptEAPTypes" validator:&__block_literal_global_449 isRequired:1 defaultValue:0 error:&v77];
  id v14 = v77;
  payloadAcceptEAPTypes = self->_payloadAcceptEAPTypes;
  self->_payloadAcceptEAPTypes = v13;

  if (!v14)
  {
    id v76 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"UserName" isRequired:0 defaultValue:0 error:&v76];
    id v14 = v76;
    payloadUserName = self->_payloadUserName;
    self->_payloadUserName = v16;

    if (!v14)
    {
      id v75 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"UserPassword" isRequired:0 defaultValue:0 error:&v75];
      id v14 = v75;
      payloadUserPassword = self->_payloadUserPassword;
      self->_payloadUserPassword = v18;

      if (!v14)
      {
        id v74 = 0;
        v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"OneTimePassword" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v74];
        id v14 = v74;
        payloadOneTimePassword = self->_payloadOneTimePassword;
        self->_payloadOneTimePassword = v20;

        if (!v14)
        {
          id v73 = 0;
          v22 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"PayloadCertificateAnchorUUID" validator:&__block_literal_global_452 isRequired:0 defaultValue:0 error:&v73];
          id v14 = v73;
          payloadPayloadCertificateAnchorUUID = self->_payloadPayloadCertificateAnchorUUID;
          self->_payloadPayloadCertificateAnchorUUID = v22;

          if (!v14)
          {
            id v72 = 0;
            id v24 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"TLSTrustedCertificates" validator:&__block_literal_global_454 isRequired:0 defaultValue:0 error:&v72];
            id v14 = v72;
            payloadTLSTrustedCertificates = self->_payloadTLSTrustedCertificates;
            self->_payloadTLSTrustedCertificates = v24;

            if (!v14)
            {
              id v71 = 0;
              id v26 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"TLSTrustedServerNames" validator:&__block_literal_global_456 isRequired:0 defaultValue:0 error:&v71];
              id v14 = v71;
              payloadTLSTrustedServerNames = self->_payloadTLSTrustedServerNames;
              self->_payloadTLSTrustedServerNames = v26;

              if (!v14)
              {
                id v70 = 0;
                id v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"TLSAllowTrustExceptions" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v70];
                id v14 = v70;
                payloadTLSAllowTrustExceptions = self->_payloadTLSAllowTrustExceptions;
                self->_payloadTLSAllowTrustExceptions = v28;

                if (!v14)
                {
                  id v69 = 0;
                  id v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"TLSCertificateIsRequired" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v69];
                  id v14 = v69;
                  payloadTLSCertificateIsRequired = self->_payloadTLSCertificateIsRequired;
                  self->_payloadTLSCertificateIsRequired = v30;

                  if (!v14)
                  {
                    id v68 = 0;
                    v32 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"TTLSInnerAuthentication" isRequired:0 defaultValue:@"MSCHAPv2" error:&v68];
                    id v14 = v68;
                    payloadTTLSInnerAuthentication = self->_payloadTTLSInnerAuthentication;
                    self->_payloadTTLSInnerAuthentication = v32;

                    if (!v14)
                    {
                      id v67 = 0;
                      id v34 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"TLSMinimumVersion" isRequired:0 defaultValue:@"1.0" error:&v67];
                      id v14 = v67;
                      payloadTLSMinimumVersion = self->_payloadTLSMinimumVersion;
                      self->_payloadTLSMinimumVersion = v34;

                      if (!v14)
                      {
                        id v66 = 0;
                        id v36 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"TLSMaximumVersion" isRequired:0 defaultValue:@"1.2" error:&v66];
                        id v14 = v66;
                        payloadTLSMaximumVersion = self->_payloadTLSMaximumVersion;
                        self->_payloadTLSMaximumVersion = v36;

                        if (!v14)
                        {
                          id v65 = 0;
                          v38 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OuterIdentity" isRequired:0 defaultValue:0 error:&v65];
                          id v14 = v65;
                          payloadOuterIdentity = self->_payloadOuterIdentity;
                          self->_payloadOuterIdentity = v38;

                          if (!v14)
                          {
                            id v64 = 0;
                            v40 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EAPFASTUsePAC" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v64];
                            id v14 = v64;
                            payloadEAPFASTUsePAC = self->_payloadEAPFASTUsePAC;
                            self->_payloadEAPFASTUsePAC = v40;

                            if (!v14)
                            {
                              id v63 = 0;
                              id v42 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EAPFASTProvisionPAC" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v63];
                              id v14 = v63;
                              payloadEAPFASTProvisionPAC = self->_payloadEAPFASTProvisionPAC;
                              self->_payloadEAPFASTProvisionPAC = v42;

                              if (!v14)
                              {
                                id v62 = 0;
                                v44 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EAPFASTProvisionPACAnonymously" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v62];
                                id v14 = v62;
                                payloadEAPFASTProvisionPACAnonymously = self->_payloadEAPFASTProvisionPACAnonymously;
                                self->_payloadEAPFASTProvisionPACAnonymously = v44;

                                if (!v14)
                                {
                                  id v61 = 0;
                                  id v46 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"EAPSIMNumberOfRANDs" isRequired:0 defaultValue:&unk_26C8948E0 error:&v61];
                                  id v14 = v61;
                                  payloadEAPSIMNumberOfRANDs = self->_payloadEAPSIMNumberOfRANDs;
                                  self->_payloadEAPSIMNumberOfRANDs = v46;

                                  if (!v14)
                                  {
                                    id v60 = 0;
                                    v48 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SystemModeCredentialsSource" isRequired:0 defaultValue:0 error:&v60];
                                    id v14 = v60;
                                    payloadSystemModeCredentialsSource = self->_payloadSystemModeCredentialsSource;
                                    self->_payloadSystemModeCredentialsSource = v48;

                                    if (!v14)
                                    {
                                      id v59 = 0;
                                      v50 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SystemModeUseOpenDirectoryCredentials" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v59];
                                      id v14 = v59;
                                      payloadSystemModeUseOpenDirectoryCredentials = self->_payloadSystemModeUseOpenDirectoryCredentials;
                                      self->_payloadSystemModeUseOpenDirectoryCredentials = v50;

                                      if (!v14)
                                      {
                                        id v58 = 0;
                                        v52 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"OneTimeUserPassword" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v58];
                                        id v14 = v58;
                                        payloadOneTimeUserPassword = self->_payloadOneTimeUserPassword;
                                        self->_payloadOneTimeUserPassword = v52;

                                        if (!v14)
                                        {
                                          id v57 = 0;
                                          v54 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EAPSIMAKAEncryptedIdentityEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v57];
                                          id v14 = v57;
                                          payloadEAPSIMAKAEncryptedIdentityEnabled = self->_payloadEAPSIMAKAEncryptedIdentityEnabled;
                                          self->_payloadEAPSIMAKAEncryptedIdentityEnabled = v54;
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
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"AcceptEAPTypes" withValue:self->_payloadAcceptEAPTypes itemSerializer:&__block_literal_global_458 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"UserName" withValue:self->_payloadUserName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"UserPassword" withValue:self->_payloadUserPassword isRequired:0 defaultValue:0];
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"OneTimePassword" withValue:self->_payloadOneTimePassword isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"PayloadCertificateAnchorUUID" withValue:self->_payloadPayloadCertificateAnchorUUID itemSerializer:&__block_literal_global_460 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"TLSTrustedCertificates" withValue:self->_payloadTLSTrustedCertificates itemSerializer:&__block_literal_global_462 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"TLSTrustedServerNames" withValue:self->_payloadTLSTrustedServerNames itemSerializer:&__block_literal_global_464 isRequired:0 defaultValue:0];
  uint64_t v6 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"TLSAllowTrustExceptions" withValue:self->_payloadTLSAllowTrustExceptions isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"TLSCertificateIsRequired" withValue:self->_payloadTLSCertificateIsRequired isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"TTLSInnerAuthentication" withValue:self->_payloadTTLSInnerAuthentication isRequired:0 defaultValue:@"MSCHAPv2"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"TLSMinimumVersion" withValue:self->_payloadTLSMinimumVersion isRequired:0 defaultValue:@"1.0"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"TLSMaximumVersion" withValue:self->_payloadTLSMaximumVersion isRequired:0 defaultValue:@"1.2"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"OuterIdentity" withValue:self->_payloadOuterIdentity isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EAPFASTUsePAC" withValue:self->_payloadEAPFASTUsePAC isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EAPFASTProvisionPAC" withValue:self->_payloadEAPFASTProvisionPAC isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EAPFASTProvisionPACAnonymously" withValue:self->_payloadEAPFASTProvisionPACAnonymously isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"EAPSIMNumberOfRANDs" withValue:self->_payloadEAPSIMNumberOfRANDs isRequired:0 defaultValue:&unk_26C8948E0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"SystemModeCredentialsSource" withValue:self->_payloadSystemModeCredentialsSource isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"SystemModeUseOpenDirectoryCredentials" withValue:self->_payloadSystemModeUseOpenDirectoryCredentials isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"OneTimeUserPassword" withValue:self->_payloadOneTimeUserPassword isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EAPSIMAKAEncryptedIdentityEnabled" withValue:self->_payloadEAPSIMAKAEncryptedIdentityEnabled isRequired:0 defaultValue:v6];
  v7 = (void *)[v4 copy];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v48.receiver = self;
  v48.super_class = (Class)CEMNetworkWiFiDeclaration_EAPClientConfiguration;
  v4 = [(CEMPayloadBase *)&v48 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadAcceptEAPTypes copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadUserName copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadUserPassword copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadOneTimePassword copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSArray *)self->_payloadPayloadCertificateAnchorUUID copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSArray *)self->_payloadTLSTrustedCertificates copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSArray *)self->_payloadTLSTrustedServerNames copy];
  v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadTLSAllowTrustExceptions copy];
  v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadTLSCertificateIsRequired copy];
  v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSString *)self->_payloadTTLSInnerAuthentication copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSString *)self->_payloadTLSMinimumVersion copy];
  id v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSString *)self->_payloadTLSMaximumVersion copy];
  id v28 = (void *)v4[13];
  v4[13] = v27;

  uint64_t v29 = [(NSString *)self->_payloadOuterIdentity copy];
  id v30 = (void *)v4[14];
  v4[14] = v29;

  uint64_t v31 = [(NSNumber *)self->_payloadEAPFASTUsePAC copy];
  v32 = (void *)v4[15];
  v4[15] = v31;

  uint64_t v33 = [(NSNumber *)self->_payloadEAPFASTProvisionPAC copy];
  id v34 = (void *)v4[16];
  v4[16] = v33;

  uint64_t v35 = [(NSNumber *)self->_payloadEAPFASTProvisionPACAnonymously copy];
  id v36 = (void *)v4[17];
  v4[17] = v35;

  uint64_t v37 = [(NSNumber *)self->_payloadEAPSIMNumberOfRANDs copy];
  v38 = (void *)v4[18];
  v4[18] = v37;

  uint64_t v39 = [(NSString *)self->_payloadSystemModeCredentialsSource copy];
  v40 = (void *)v4[19];
  v4[19] = v39;

  uint64_t v41 = [(NSNumber *)self->_payloadSystemModeUseOpenDirectoryCredentials copy];
  id v42 = (void *)v4[20];
  v4[20] = v41;

  uint64_t v43 = [(NSNumber *)self->_payloadOneTimeUserPassword copy];
  v44 = (void *)v4[21];
  v4[21] = v43;

  uint64_t v45 = [(NSNumber *)self->_payloadEAPSIMAKAEncryptedIdentityEnabled copy];
  id v46 = (void *)v4[22];
  v4[22] = v45;

  return v4;
}

- (NSArray)payloadAcceptEAPTypes
{
  return self->_payloadAcceptEAPTypes;
}

- (void)setPayloadAcceptEAPTypes:(id)a3
{
}

- (NSString)payloadUserName
{
  return self->_payloadUserName;
}

- (void)setPayloadUserName:(id)a3
{
}

- (NSString)payloadUserPassword
{
  return self->_payloadUserPassword;
}

- (void)setPayloadUserPassword:(id)a3
{
}

- (NSNumber)payloadOneTimePassword
{
  return self->_payloadOneTimePassword;
}

- (void)setPayloadOneTimePassword:(id)a3
{
}

- (NSArray)payloadPayloadCertificateAnchorUUID
{
  return self->_payloadPayloadCertificateAnchorUUID;
}

- (void)setPayloadPayloadCertificateAnchorUUID:(id)a3
{
}

- (NSArray)payloadTLSTrustedCertificates
{
  return self->_payloadTLSTrustedCertificates;
}

- (void)setPayloadTLSTrustedCertificates:(id)a3
{
}

- (NSArray)payloadTLSTrustedServerNames
{
  return self->_payloadTLSTrustedServerNames;
}

- (void)setPayloadTLSTrustedServerNames:(id)a3
{
}

- (NSNumber)payloadTLSAllowTrustExceptions
{
  return self->_payloadTLSAllowTrustExceptions;
}

- (void)setPayloadTLSAllowTrustExceptions:(id)a3
{
}

- (NSNumber)payloadTLSCertificateIsRequired
{
  return self->_payloadTLSCertificateIsRequired;
}

- (void)setPayloadTLSCertificateIsRequired:(id)a3
{
}

- (NSString)payloadTTLSInnerAuthentication
{
  return self->_payloadTTLSInnerAuthentication;
}

- (void)setPayloadTTLSInnerAuthentication:(id)a3
{
}

- (NSString)payloadTLSMinimumVersion
{
  return self->_payloadTLSMinimumVersion;
}

- (void)setPayloadTLSMinimumVersion:(id)a3
{
}

- (NSString)payloadTLSMaximumVersion
{
  return self->_payloadTLSMaximumVersion;
}

- (void)setPayloadTLSMaximumVersion:(id)a3
{
}

- (NSString)payloadOuterIdentity
{
  return self->_payloadOuterIdentity;
}

- (void)setPayloadOuterIdentity:(id)a3
{
}

- (NSNumber)payloadEAPFASTUsePAC
{
  return self->_payloadEAPFASTUsePAC;
}

- (void)setPayloadEAPFASTUsePAC:(id)a3
{
}

- (NSNumber)payloadEAPFASTProvisionPAC
{
  return self->_payloadEAPFASTProvisionPAC;
}

- (void)setPayloadEAPFASTProvisionPAC:(id)a3
{
}

- (NSNumber)payloadEAPFASTProvisionPACAnonymously
{
  return self->_payloadEAPFASTProvisionPACAnonymously;
}

- (void)setPayloadEAPFASTProvisionPACAnonymously:(id)a3
{
}

- (NSNumber)payloadEAPSIMNumberOfRANDs
{
  return self->_payloadEAPSIMNumberOfRANDs;
}

- (void)setPayloadEAPSIMNumberOfRANDs:(id)a3
{
}

- (NSString)payloadSystemModeCredentialsSource
{
  return self->_payloadSystemModeCredentialsSource;
}

- (void)setPayloadSystemModeCredentialsSource:(id)a3
{
}

- (NSNumber)payloadSystemModeUseOpenDirectoryCredentials
{
  return self->_payloadSystemModeUseOpenDirectoryCredentials;
}

- (void)setPayloadSystemModeUseOpenDirectoryCredentials:(id)a3
{
}

- (NSNumber)payloadOneTimeUserPassword
{
  return self->_payloadOneTimeUserPassword;
}

- (void)setPayloadOneTimeUserPassword:(id)a3
{
}

- (NSNumber)payloadEAPSIMAKAEncryptedIdentityEnabled
{
  return self->_payloadEAPSIMAKAEncryptedIdentityEnabled;
}

- (void)setPayloadEAPSIMAKAEncryptedIdentityEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEAPSIMAKAEncryptedIdentityEnabled, 0);
  objc_storeStrong((id *)&self->_payloadOneTimeUserPassword, 0);
  objc_storeStrong((id *)&self->_payloadSystemModeUseOpenDirectoryCredentials, 0);
  objc_storeStrong((id *)&self->_payloadSystemModeCredentialsSource, 0);
  objc_storeStrong((id *)&self->_payloadEAPSIMNumberOfRANDs, 0);
  objc_storeStrong((id *)&self->_payloadEAPFASTProvisionPACAnonymously, 0);
  objc_storeStrong((id *)&self->_payloadEAPFASTProvisionPAC, 0);
  objc_storeStrong((id *)&self->_payloadEAPFASTUsePAC, 0);
  objc_storeStrong((id *)&self->_payloadOuterIdentity, 0);
  objc_storeStrong((id *)&self->_payloadTLSMaximumVersion, 0);
  objc_storeStrong((id *)&self->_payloadTLSMinimumVersion, 0);
  objc_storeStrong((id *)&self->_payloadTTLSInnerAuthentication, 0);
  objc_storeStrong((id *)&self->_payloadTLSCertificateIsRequired, 0);
  objc_storeStrong((id *)&self->_payloadTLSAllowTrustExceptions, 0);
  objc_storeStrong((id *)&self->_payloadTLSTrustedServerNames, 0);
  objc_storeStrong((id *)&self->_payloadTLSTrustedCertificates, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateAnchorUUID, 0);
  objc_storeStrong((id *)&self->_payloadOneTimePassword, 0);
  objc_storeStrong((id *)&self->_payloadUserPassword, 0);
  objc_storeStrong((id *)&self->_payloadUserName, 0);

  objc_storeStrong((id *)&self->_payloadAcceptEAPTypes, 0);
}

@end