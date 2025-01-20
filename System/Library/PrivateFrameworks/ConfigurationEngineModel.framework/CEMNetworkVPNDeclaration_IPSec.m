@interface CEMNetworkVPNDeclaration_IPSec
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithRemoteAddress:(id)a3 withAuthenticationMethod:(id)a4 withXAuthName:(id)a5 withXAuthPassword:(id)a6 withXAuthEnabled:(id)a7 withXAuthPasswordEncryption:(id)a8 withLocalIdentifier:(id)a9 withLocalIdentifierType:(id)a10 withSharedSecret:(id)a11 withPayloadCertificateUUID:(id)a12 withPromptForVPNPIN:(id)a13 withOnDemandEnabled:(id)a14 withOnDemandMatchDomainsAlways:(id)a15 withOnDemandMatchDomainsNever:(id)a16 withOnDemandMatchDomainsOnRetry:(id)a17 withOnDemandRules:(id)a18 withDisconnectOnIdle:(id)a19 withDisconnectOnIdleTimer:(id)a20;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadOnDemandMatchDomainsAlways;
- (NSArray)payloadOnDemandMatchDomainsNever;
- (NSArray)payloadOnDemandMatchDomainsOnRetry;
- (NSArray)payloadOnDemandRules;
- (NSData)payloadSharedSecret;
- (NSNumber)payloadDisconnectOnIdle;
- (NSNumber)payloadDisconnectOnIdleTimer;
- (NSNumber)payloadOnDemandEnabled;
- (NSNumber)payloadPromptForVPNPIN;
- (NSNumber)payloadXAuthEnabled;
- (NSString)payloadAuthenticationMethod;
- (NSString)payloadLocalIdentifier;
- (NSString)payloadLocalIdentifierType;
- (NSString)payloadPayloadCertificateUUID;
- (NSString)payloadRemoteAddress;
- (NSString)payloadXAuthName;
- (NSString)payloadXAuthPassword;
- (NSString)payloadXAuthPasswordEncryption;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAuthenticationMethod:(id)a3;
- (void)setPayloadDisconnectOnIdle:(id)a3;
- (void)setPayloadDisconnectOnIdleTimer:(id)a3;
- (void)setPayloadLocalIdentifier:(id)a3;
- (void)setPayloadLocalIdentifierType:(id)a3;
- (void)setPayloadOnDemandEnabled:(id)a3;
- (void)setPayloadOnDemandMatchDomainsAlways:(id)a3;
- (void)setPayloadOnDemandMatchDomainsNever:(id)a3;
- (void)setPayloadOnDemandMatchDomainsOnRetry:(id)a3;
- (void)setPayloadOnDemandRules:(id)a3;
- (void)setPayloadPayloadCertificateUUID:(id)a3;
- (void)setPayloadPromptForVPNPIN:(id)a3;
- (void)setPayloadRemoteAddress:(id)a3;
- (void)setPayloadSharedSecret:(id)a3;
- (void)setPayloadXAuthEnabled:(id)a3;
- (void)setPayloadXAuthName:(id)a3;
- (void)setPayloadXAuthPassword:(id)a3;
- (void)setPayloadXAuthPasswordEncryption:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_IPSec

+ (NSSet)allowedPayloadKeys
{
  v6[18] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"RemoteAddress";
  v6[1] = @"AuthenticationMethod";
  v6[2] = @"XAuthName";
  v6[3] = @"XAuthPassword";
  v6[4] = @"XAuthEnabled";
  v6[5] = @"XAuthPasswordEncryption";
  v6[6] = @"LocalIdentifier";
  v6[7] = @"LocalIdentifierType";
  v6[8] = @"SharedSecret";
  v6[9] = @"PayloadCertificateUUID";
  v6[10] = @"PromptForVPNPIN";
  v6[11] = @"OnDemandEnabled";
  v6[12] = @"OnDemandMatchDomainsAlways";
  v6[13] = @"OnDemandMatchDomainsNever";
  v6[14] = @"OnDemandMatchDomainsOnRetry";
  v6[15] = @"OnDemandRules";
  v6[16] = @"DisconnectOnIdle";
  v6[17] = @"DisconnectOnIdleTimer";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:18];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithRemoteAddress:(id)a3 withAuthenticationMethod:(id)a4 withXAuthName:(id)a5 withXAuthPassword:(id)a6 withXAuthEnabled:(id)a7 withXAuthPasswordEncryption:(id)a8 withLocalIdentifier:(id)a9 withLocalIdentifierType:(id)a10 withSharedSecret:(id)a11 withPayloadCertificateUUID:(id)a12 withPromptForVPNPIN:(id)a13 withOnDemandEnabled:(id)a14 withOnDemandMatchDomainsAlways:(id)a15 withOnDemandMatchDomainsNever:(id)a16 withOnDemandMatchDomainsOnRetry:(id)a17 withOnDemandRules:(id)a18 withDisconnectOnIdle:(id)a19 withDisconnectOnIdleTimer:(id)a20
{
  id v50 = a20;
  id v49 = a19;
  id v48 = a18;
  id v47 = a17;
  id v46 = a16;
  id v45 = a15;
  id v44 = a14;
  id v20 = a13;
  id v43 = a12;
  id v42 = a11;
  v21 = (__CFString *)a10;
  id v22 = a9;
  id v23 = a8;
  id v24 = a7;
  id v25 = a6;
  id v26 = a5;
  v27 = (__CFString *)a4;
  id v28 = a3;
  v29 = objc_opt_new();
  [v29 setPayloadRemoteAddress:v28];

  if (v27) {
    v30 = v27;
  }
  else {
    v30 = @"SharedSecret";
  }
  [v29 setPayloadAuthenticationMethod:v30];

  [v29 setPayloadXAuthName:v26];
  [v29 setPayloadXAuthPassword:v25];

  [v29 setPayloadXAuthEnabled:v24];
  [v29 setPayloadXAuthPasswordEncryption:v23];

  [v29 setPayloadLocalIdentifier:v22];
  if (v21) {
    v31 = v21;
  }
  else {
    v31 = @"KeyID";
  }
  [v29 setPayloadLocalIdentifierType:v31];

  [v29 setPayloadSharedSecret:v42];
  [v29 setPayloadPayloadCertificateUUID:v43];

  if (v20) {
    id v32 = v20;
  }
  else {
    id v32 = (id)MEMORY[0x263EFFA80];
  }
  [v29 setPayloadPromptForVPNPIN:v32];

  if (v44) {
    v33 = v44;
  }
  else {
    v33 = &unk_26C894850;
  }
  [v29 setPayloadOnDemandEnabled:v33];

  [v29 setPayloadOnDemandMatchDomainsAlways:v45];
  [v29 setPayloadOnDemandMatchDomainsNever:v46];

  [v29 setPayloadOnDemandMatchDomainsOnRetry:v47];
  [v29 setPayloadOnDemandRules:v48];

  if (v49) {
    v34 = v49;
  }
  else {
    v34 = &unk_26C894850;
  }
  [v29 setPayloadDisconnectOnIdle:v34];

  [v29 setPayloadDisconnectOnIdleTimer:v50];

  return v29;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkVPNDeclaration_IPSec allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v68 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"RemoteAddress" isRequired:0 defaultValue:0 error:&v68];
  id v14 = v68;
  payloadRemoteAddress = self->_payloadRemoteAddress;
  self->_payloadRemoteAddress = v13;

  if (!v14)
  {
    id v67 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AuthenticationMethod" isRequired:0 defaultValue:@"SharedSecret" error:&v67];
    id v14 = v67;
    payloadAuthenticationMethod = self->_payloadAuthenticationMethod;
    self->_payloadAuthenticationMethod = v16;

    if (!v14)
    {
      id v66 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"XAuthName" isRequired:0 defaultValue:0 error:&v66];
      id v14 = v66;
      payloadXAuthName = self->_payloadXAuthName;
      self->_payloadXAuthName = v18;

      if (!v14)
      {
        id v65 = 0;
        id v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"XAuthPassword" isRequired:0 defaultValue:0 error:&v65];
        id v14 = v65;
        payloadXAuthPassword = self->_payloadXAuthPassword;
        self->_payloadXAuthPassword = v20;

        if (!v14)
        {
          id v64 = 0;
          id v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"XAuthEnabled" isRequired:0 defaultValue:0 error:&v64];
          id v14 = v64;
          payloadXAuthEnabled = self->_payloadXAuthEnabled;
          self->_payloadXAuthEnabled = v22;

          if (!v14)
          {
            id v63 = 0;
            id v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"XAuthPasswordEncryption" isRequired:0 defaultValue:0 error:&v63];
            id v14 = v63;
            payloadXAuthPasswordEncryption = self->_payloadXAuthPasswordEncryption;
            self->_payloadXAuthPasswordEncryption = v24;

            if (!v14)
            {
              id v62 = 0;
              id v26 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LocalIdentifier" isRequired:0 defaultValue:0 error:&v62];
              id v14 = v62;
              payloadLocalIdentifier = self->_payloadLocalIdentifier;
              self->_payloadLocalIdentifier = v26;

              if (!v14)
              {
                id v61 = 0;
                id v28 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LocalIdentifierType" isRequired:0 defaultValue:@"KeyID" error:&v61];
                id v14 = v61;
                payloadLocalIdentifierType = self->_payloadLocalIdentifierType;
                self->_payloadLocalIdentifierType = v28;

                if (!v14)
                {
                  id v60 = 0;
                  v30 = [(CEMPayloadBase *)self loadDataFromDictionary:v6 withKey:@"SharedSecret" isRequired:0 defaultValue:0 error:&v60];
                  id v14 = v60;
                  payloadSharedSecret = self->_payloadSharedSecret;
                  self->_payloadSharedSecret = v30;

                  if (!v14)
                  {
                    id v59 = 0;
                    id v32 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PayloadCertificateUUID" isRequired:0 defaultValue:0 error:&v59];
                    id v14 = v59;
                    payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
                    self->_payloadPayloadCertificateUUID = v32;

                    if (!v14)
                    {
                      id v58 = 0;
                      v34 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PromptForVPNPIN" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v58];
                      id v14 = v58;
                      payloadPromptForVPNPIN = self->_payloadPromptForVPNPIN;
                      self->_payloadPromptForVPNPIN = v34;

                      if (!v14)
                      {
                        id v57 = 0;
                        v36 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"OnDemandEnabled" isRequired:0 defaultValue:&unk_26C894850 error:&v57];
                        id v14 = v57;
                        payloadOnDemandEnabled = self->_payloadOnDemandEnabled;
                        self->_payloadOnDemandEnabled = v36;

                        if (!v14)
                        {
                          id v56 = 0;
                          v38 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"OnDemandMatchDomainsAlways" validator:&__block_literal_global_662 isRequired:0 defaultValue:0 error:&v56];
                          id v14 = v56;
                          payloadOnDemandMatchDomainsAlways = self->_payloadOnDemandMatchDomainsAlways;
                          self->_payloadOnDemandMatchDomainsAlways = v38;

                          if (!v14)
                          {
                            id v55 = 0;
                            v40 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"OnDemandMatchDomainsNever" validator:&__block_literal_global_664 isRequired:0 defaultValue:0 error:&v55];
                            id v14 = v55;
                            payloadOnDemandMatchDomainsNever = self->_payloadOnDemandMatchDomainsNever;
                            self->_payloadOnDemandMatchDomainsNever = v40;

                            if (!v14)
                            {
                              id v54 = 0;
                              id v42 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"OnDemandMatchDomainsOnRetry" validator:&__block_literal_global_666 isRequired:0 defaultValue:0 error:&v54];
                              id v14 = v54;
                              payloadOnDemandMatchDomainsOnRetry = self->_payloadOnDemandMatchDomainsOnRetry;
                              self->_payloadOnDemandMatchDomainsOnRetry = v42;

                              if (!v14)
                              {
                                id v53 = 0;
                                id v44 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"OnDemandRules" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v53];
                                id v14 = v53;
                                payloadOnDemandRules = self->_payloadOnDemandRules;
                                self->_payloadOnDemandRules = v44;

                                if (!v14)
                                {
                                  id v52 = 0;
                                  id v46 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisconnectOnIdle" isRequired:0 defaultValue:&unk_26C894850 error:&v52];
                                  id v14 = v52;
                                  payloadDisconnectOnIdle = self->_payloadDisconnectOnIdle;
                                  self->_payloadDisconnectOnIdle = v46;

                                  if (!v14)
                                  {
                                    id v51 = 0;
                                    id v48 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DisconnectOnIdleTimer" isRequired:0 defaultValue:0 error:&v51];
                                    id v14 = v51;
                                    payloadDisconnectOnIdleTimer = self->_payloadDisconnectOnIdleTimer;
                                    self->_payloadDisconnectOnIdleTimer = v48;
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
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"RemoteAddress" withValue:self->_payloadRemoteAddress isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"AuthenticationMethod" withValue:self->_payloadAuthenticationMethod isRequired:0 defaultValue:@"SharedSecret"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"XAuthName" withValue:self->_payloadXAuthName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"XAuthPassword" withValue:self->_payloadXAuthPassword isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"XAuthEnabled" withValue:self->_payloadXAuthEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"XAuthPasswordEncryption" withValue:self->_payloadXAuthPasswordEncryption isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"LocalIdentifier" withValue:self->_payloadLocalIdentifier isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"LocalIdentifierType" withValue:self->_payloadLocalIdentifierType isRequired:0 defaultValue:@"KeyID"];
  [(CEMPayloadBase *)self serializeDataIntoDictionary:v5 withKey:@"SharedSecret" withValue:self->_payloadSharedSecret isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"PayloadCertificateUUID" withValue:self->_payloadPayloadCertificateUUID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"PromptForVPNPIN" withValue:self->_payloadPromptForVPNPIN isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"OnDemandEnabled" withValue:self->_payloadOnDemandEnabled isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"OnDemandMatchDomainsAlways" withValue:self->_payloadOnDemandMatchDomainsAlways itemSerializer:&__block_literal_global_668 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"OnDemandMatchDomainsNever" withValue:self->_payloadOnDemandMatchDomainsNever itemSerializer:&__block_literal_global_670 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"OnDemandMatchDomainsOnRetry" withValue:self->_payloadOnDemandMatchDomainsOnRetry itemSerializer:&__block_literal_global_672 isRequired:0 defaultValue:0];
  payloadOnDemandRules = self->_payloadOnDemandRules;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__CEMNetworkVPNDeclaration_IPSec_serializePayloadWithAssetProviders___block_invoke_4;
  v10[3] = &unk_2642C9048;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"OnDemandRules" withValue:payloadOnDemandRules itemSerializer:v10 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"DisconnectOnIdle" withValue:self->_payloadDisconnectOnIdle isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"DisconnectOnIdleTimer" withValue:self->_payloadDisconnectOnIdleTimer isRequired:0 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v42.receiver = self;
  v42.super_class = (Class)CEMNetworkVPNDeclaration_IPSec;
  id v4 = [(CEMPayloadBase *)&v42 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadRemoteAddress copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadAuthenticationMethod copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadXAuthName copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadXAuthPassword copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadXAuthEnabled copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_payloadXAuthPasswordEncryption copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSString *)self->_payloadLocalIdentifier copy];
  v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSString *)self->_payloadLocalIdentifierType copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSData *)self->_payloadSharedSecret copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSString *)self->_payloadPayloadCertificateUUID copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadPromptForVPNPIN copy];
  id v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadOnDemandEnabled copy];
  id v28 = (void *)v4[13];
  v4[13] = v27;

  uint64_t v29 = [(NSArray *)self->_payloadOnDemandMatchDomainsAlways copy];
  v30 = (void *)v4[14];
  v4[14] = v29;

  uint64_t v31 = [(NSArray *)self->_payloadOnDemandMatchDomainsNever copy];
  id v32 = (void *)v4[15];
  v4[15] = v31;

  uint64_t v33 = [(NSArray *)self->_payloadOnDemandMatchDomainsOnRetry copy];
  v34 = (void *)v4[16];
  v4[16] = v33;

  uint64_t v35 = [(NSArray *)self->_payloadOnDemandRules copy];
  v36 = (void *)v4[17];
  v4[17] = v35;

  uint64_t v37 = [(NSNumber *)self->_payloadDisconnectOnIdle copy];
  v38 = (void *)v4[18];
  v4[18] = v37;

  uint64_t v39 = [(NSNumber *)self->_payloadDisconnectOnIdleTimer copy];
  v40 = (void *)v4[19];
  v4[19] = v39;

  return v4;
}

- (NSString)payloadRemoteAddress
{
  return self->_payloadRemoteAddress;
}

- (void)setPayloadRemoteAddress:(id)a3
{
}

- (NSString)payloadAuthenticationMethod
{
  return self->_payloadAuthenticationMethod;
}

- (void)setPayloadAuthenticationMethod:(id)a3
{
}

- (NSString)payloadXAuthName
{
  return self->_payloadXAuthName;
}

- (void)setPayloadXAuthName:(id)a3
{
}

- (NSString)payloadXAuthPassword
{
  return self->_payloadXAuthPassword;
}

- (void)setPayloadXAuthPassword:(id)a3
{
}

- (NSNumber)payloadXAuthEnabled
{
  return self->_payloadXAuthEnabled;
}

- (void)setPayloadXAuthEnabled:(id)a3
{
}

- (NSString)payloadXAuthPasswordEncryption
{
  return self->_payloadXAuthPasswordEncryption;
}

- (void)setPayloadXAuthPasswordEncryption:(id)a3
{
}

- (NSString)payloadLocalIdentifier
{
  return self->_payloadLocalIdentifier;
}

- (void)setPayloadLocalIdentifier:(id)a3
{
}

- (NSString)payloadLocalIdentifierType
{
  return self->_payloadLocalIdentifierType;
}

- (void)setPayloadLocalIdentifierType:(id)a3
{
}

- (NSData)payloadSharedSecret
{
  return self->_payloadSharedSecret;
}

- (void)setPayloadSharedSecret:(id)a3
{
}

- (NSString)payloadPayloadCertificateUUID
{
  return self->_payloadPayloadCertificateUUID;
}

- (void)setPayloadPayloadCertificateUUID:(id)a3
{
}

- (NSNumber)payloadPromptForVPNPIN
{
  return self->_payloadPromptForVPNPIN;
}

- (void)setPayloadPromptForVPNPIN:(id)a3
{
}

- (NSNumber)payloadOnDemandEnabled
{
  return self->_payloadOnDemandEnabled;
}

- (void)setPayloadOnDemandEnabled:(id)a3
{
}

- (NSArray)payloadOnDemandMatchDomainsAlways
{
  return self->_payloadOnDemandMatchDomainsAlways;
}

- (void)setPayloadOnDemandMatchDomainsAlways:(id)a3
{
}

- (NSArray)payloadOnDemandMatchDomainsNever
{
  return self->_payloadOnDemandMatchDomainsNever;
}

- (void)setPayloadOnDemandMatchDomainsNever:(id)a3
{
}

- (NSArray)payloadOnDemandMatchDomainsOnRetry
{
  return self->_payloadOnDemandMatchDomainsOnRetry;
}

- (void)setPayloadOnDemandMatchDomainsOnRetry:(id)a3
{
}

- (NSArray)payloadOnDemandRules
{
  return self->_payloadOnDemandRules;
}

- (void)setPayloadOnDemandRules:(id)a3
{
}

- (NSNumber)payloadDisconnectOnIdle
{
  return self->_payloadDisconnectOnIdle;
}

- (void)setPayloadDisconnectOnIdle:(id)a3
{
}

- (NSNumber)payloadDisconnectOnIdleTimer
{
  return self->_payloadDisconnectOnIdleTimer;
}

- (void)setPayloadDisconnectOnIdleTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdleTimer, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdle, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandRules, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsOnRetry, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsNever, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsAlways, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandEnabled, 0);
  objc_storeStrong((id *)&self->_payloadPromptForVPNPIN, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadSharedSecret, 0);
  objc_storeStrong((id *)&self->_payloadLocalIdentifierType, 0);
  objc_storeStrong((id *)&self->_payloadLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadXAuthPasswordEncryption, 0);
  objc_storeStrong((id *)&self->_payloadXAuthEnabled, 0);
  objc_storeStrong((id *)&self->_payloadXAuthPassword, 0);
  objc_storeStrong((id *)&self->_payloadXAuthName, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);

  objc_storeStrong((id *)&self->_payloadRemoteAddress, 0);
}

@end