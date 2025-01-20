@interface CEMCredentialSCEPDeclaration_SCEPSubjectAltName
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithRfc822Name:(id)a3 withDNSName:(id)a4 withUniformResourceIdentifier:(id)a5 withNtPrincipalName:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadDNSName;
- (NSString)payloadNtPrincipalName;
- (NSString)payloadRfc822Name;
- (NSString)payloadUniformResourceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadDNSName:(id)a3;
- (void)setPayloadNtPrincipalName:(id)a3;
- (void)setPayloadRfc822Name:(id)a3;
- (void)setPayloadUniformResourceIdentifier:(id)a3;
@end

@implementation CEMCredentialSCEPDeclaration_SCEPSubjectAltName

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"rfc822Name";
  v6[1] = @"dNSName";
  v6[2] = @"uniformResourceIdentifier";
  v6[3] = @"ntPrincipalName";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithRfc822Name:(id)a3 withDNSName:(id)a4 withUniformResourceIdentifier:(id)a5 withNtPrincipalName:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadRfc822Name:v12];

  [v13 setPayloadDNSName:v11];
  [v13 setPayloadUniformResourceIdentifier:v10];

  [v13 setPayloadNtPrincipalName:v9];

  return v13;
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
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMCredentialSCEPDeclaration_SCEPSubjectAltName allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"rfc822Name" isRequired:0 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadRfc822Name = self->_payloadRfc822Name;
  self->_payloadRfc822Name = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"dNSName" isRequired:0 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadDNSName = self->_payloadDNSName;
    self->_payloadDNSName = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"uniformResourceIdentifier" isRequired:0 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadUniformResourceIdentifier = self->_payloadUniformResourceIdentifier;
      self->_payloadUniformResourceIdentifier = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ntPrincipalName" isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadNtPrincipalName = self->_payloadNtPrincipalName;
        self->_payloadNtPrincipalName = v20;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"rfc822Name" withValue:self->_payloadRfc822Name isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"dNSName" withValue:self->_payloadDNSName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"uniformResourceIdentifier" withValue:self->_payloadUniformResourceIdentifier isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ntPrincipalName" withValue:self->_payloadNtPrincipalName isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMCredentialSCEPDeclaration_SCEPSubjectAltName;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadRfc822Name copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadDNSName copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadUniformResourceIdentifier copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadNtPrincipalName copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadRfc822Name
{
  return self->_payloadRfc822Name;
}

- (void)setPayloadRfc822Name:(id)a3
{
}

- (NSString)payloadDNSName
{
  return self->_payloadDNSName;
}

- (void)setPayloadDNSName:(id)a3
{
}

- (NSString)payloadUniformResourceIdentifier
{
  return self->_payloadUniformResourceIdentifier;
}

- (void)setPayloadUniformResourceIdentifier:(id)a3
{
}

- (NSString)payloadNtPrincipalName
{
  return self->_payloadNtPrincipalName;
}

- (void)setPayloadNtPrincipalName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNtPrincipalName, 0);
  objc_storeStrong((id *)&self->_payloadUniformResourceIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDNSName, 0);

  objc_storeStrong((id *)&self->_payloadRfc822Name, 0);
}

@end