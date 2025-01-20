@interface CEMSecuritySingleSignOnDeclaration_Kerberos
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithRealm:(id)a3;
+ (id)buildWithPrincipalName:(id)a3 withPayloadCertificateUUID:(id)a4 withRealm:(id)a5 withURLPrefixMatches:(id)a6 withAppIdentifierMatches:(id)a7;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadAppIdentifierMatches;
- (NSArray)payloadURLPrefixMatches;
- (NSString)payloadPayloadCertificateUUID;
- (NSString)payloadPrincipalName;
- (NSString)payloadRealm;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAppIdentifierMatches:(id)a3;
- (void)setPayloadPayloadCertificateUUID:(id)a3;
- (void)setPayloadPrincipalName:(id)a3;
- (void)setPayloadRealm:(id)a3;
- (void)setPayloadURLPrefixMatches:(id)a3;
@end

@implementation CEMSecuritySingleSignOnDeclaration_Kerberos

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"PrincipalName";
  v6[1] = @"PayloadCertificateUUID";
  v6[2] = @"Realm";
  v6[3] = @"URLPrefixMatches";
  v6[4] = @"AppIdentifierMatches";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithPrincipalName:(id)a3 withPayloadCertificateUUID:(id)a4 withRealm:(id)a5 withURLPrefixMatches:(id)a6 withAppIdentifierMatches:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setPayloadPrincipalName:v15];

  [v16 setPayloadPayloadCertificateUUID:v14];
  [v16 setPayloadRealm:v13];

  [v16 setPayloadURLPrefixMatches:v12];
  [v16 setPayloadAppIdentifierMatches:v11];

  return v16;
}

+ (id)buildRequiredOnlyWithRealm:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadRealm:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSecuritySingleSignOnDeclaration_Kerberos allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PrincipalName" isRequired:0 defaultValue:0 error:&v29];
  id v14 = v29;
  payloadPrincipalName = self->_payloadPrincipalName;
  self->_payloadPrincipalName = v13;

  if (!v14)
  {
    id v28 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PayloadCertificateUUID" isRequired:0 defaultValue:0 error:&v28];
    id v14 = v28;
    payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
    self->_payloadPayloadCertificateUUID = v16;

    if (!v14)
    {
      id v27 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Realm" isRequired:1 defaultValue:0 error:&v27];
      id v14 = v27;
      payloadRealm = self->_payloadRealm;
      self->_payloadRealm = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"URLPrefixMatches" validator:&__block_literal_global_36 isRequired:0 defaultValue:0 error:&v26];
        id v14 = v26;
        payloadURLPrefixMatches = self->_payloadURLPrefixMatches;
        self->_payloadURLPrefixMatches = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"AppIdentifierMatches" validator:&__block_literal_global_119 isRequired:0 defaultValue:0 error:&v25];
          id v14 = v25;
          payloadAppIdentifierMatches = self->_payloadAppIdentifierMatches;
          self->_payloadAppIdentifierMatches = v22;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"PrincipalName" withValue:self->_payloadPrincipalName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"PayloadCertificateUUID" withValue:self->_payloadPayloadCertificateUUID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Realm" withValue:self->_payloadRealm isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"URLPrefixMatches" withValue:self->_payloadURLPrefixMatches itemSerializer:&__block_literal_global_122 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"AppIdentifierMatches" withValue:self->_payloadAppIdentifierMatches itemSerializer:&__block_literal_global_124_0 isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMSecuritySingleSignOnDeclaration_Kerberos;
  v4 = [(CEMPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadPrincipalName copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadPayloadCertificateUUID copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadRealm copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadURLPrefixMatches copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSArray *)self->_payloadAppIdentifierMatches copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)payloadPrincipalName
{
  return self->_payloadPrincipalName;
}

- (void)setPayloadPrincipalName:(id)a3
{
}

- (NSString)payloadPayloadCertificateUUID
{
  return self->_payloadPayloadCertificateUUID;
}

- (void)setPayloadPayloadCertificateUUID:(id)a3
{
}

- (NSString)payloadRealm
{
  return self->_payloadRealm;
}

- (void)setPayloadRealm:(id)a3
{
}

- (NSArray)payloadURLPrefixMatches
{
  return self->_payloadURLPrefixMatches;
}

- (void)setPayloadURLPrefixMatches:(id)a3
{
}

- (NSArray)payloadAppIdentifierMatches
{
  return self->_payloadAppIdentifierMatches;
}

- (void)setPayloadAppIdentifierMatches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAppIdentifierMatches, 0);
  objc_storeStrong((id *)&self->_payloadURLPrefixMatches, 0);
  objc_storeStrong((id *)&self->_payloadRealm, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);

  objc_storeStrong((id *)&self->_payloadPrincipalName, 0);
}

@end