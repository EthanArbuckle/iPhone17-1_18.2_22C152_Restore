@interface CEMManagementOrganizationInformationDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withOrganizationName:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withOrganizationName:(id)a4 withOrganizationAddress:(id)a5 withOrganizationPhone:(id)a6 withOrganizationEmail:(id)a7 withOrganizationMagic:(id)a8;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSString)payloadOrganizationAddress;
- (NSString)payloadOrganizationEmail;
- (NSString)payloadOrganizationMagic;
- (NSString)payloadOrganizationName;
- (NSString)payloadOrganizationPhone;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadOrganizationAddress:(id)a3;
- (void)setPayloadOrganizationEmail:(id)a3;
- (void)setPayloadOrganizationMagic:(id)a3;
- (void)setPayloadOrganizationName:(id)a3;
- (void)setPayloadOrganizationPhone:(id)a3;
@end

@implementation CEMManagementOrganizationInformationDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.management.organization";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"OrganizationName";
  v6[1] = @"OrganizationAddress";
  v6[2] = @"OrganizationPhone";
  v6[3] = @"OrganizationEmail";
  v6[4] = @"OrganizationMagic";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withOrganizationName:(id)a4 withOrganizationAddress:(id)a5 withOrganizationPhone:(id)a6 withOrganizationEmail:(id)a7 withOrganizationMagic:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = objc_opt_new();
  [v19 setDeclarationType:@"com.apple.configuration.management.organization"];
  if (v13)
  {
    [v19 setDeclarationIdentifier:v13];
  }
  else
  {
    v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    [v19 setDeclarationIdentifier:v21];
  }
  [v19 setPayloadOrganizationName:v18];

  [v19 setPayloadOrganizationAddress:v17];
  [v19 setPayloadOrganizationPhone:v16];

  [v19 setPayloadOrganizationEmail:v15];
  [v19 setPayloadOrganizationMagic:v14];

  [v19 updateServerHash];

  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withOrganizationName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.management.organization"];
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
  [v7 setPayloadOrganizationName:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMManagementOrganizationInformationDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OrganizationName" isRequired:1 defaultValue:0 error:&v29];
  id v14 = v29;
  payloadOrganizationName = self->_payloadOrganizationName;
  self->_payloadOrganizationName = v13;

  if (!v14)
  {
    id v28 = 0;
    id v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OrganizationAddress" isRequired:0 defaultValue:0 error:&v28];
    id v14 = v28;
    payloadOrganizationAddress = self->_payloadOrganizationAddress;
    self->_payloadOrganizationAddress = v16;

    if (!v14)
    {
      id v27 = 0;
      id v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OrganizationPhone" isRequired:0 defaultValue:0 error:&v27];
      id v14 = v27;
      payloadOrganizationPhone = self->_payloadOrganizationPhone;
      self->_payloadOrganizationPhone = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OrganizationEmail" isRequired:0 defaultValue:0 error:&v26];
        id v14 = v26;
        payloadOrganizationEmail = self->_payloadOrganizationEmail;
        self->_payloadOrganizationEmail = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OrganizationMagic" isRequired:0 defaultValue:0 error:&v25];
          id v14 = v25;
          payloadOrganizationMagic = self->_payloadOrganizationMagic;
          self->_payloadOrganizationMagic = v22;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"OrganizationName" withValue:self->_payloadOrganizationName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"OrganizationAddress" withValue:self->_payloadOrganizationAddress isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"OrganizationPhone" withValue:self->_payloadOrganizationPhone isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"OrganizationEmail" withValue:self->_payloadOrganizationEmail isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"OrganizationMagic" withValue:self->_payloadOrganizationMagic isRequired:0 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMManagementOrganizationInformationDeclaration;
  v4 = [(CEMDeclarationBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadOrganizationName copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadOrganizationAddress copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadOrganizationPhone copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadOrganizationEmail copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_payloadOrganizationMagic copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  return v4;
}

- (NSString)payloadOrganizationName
{
  return self->_payloadOrganizationName;
}

- (void)setPayloadOrganizationName:(id)a3
{
}

- (NSString)payloadOrganizationAddress
{
  return self->_payloadOrganizationAddress;
}

- (void)setPayloadOrganizationAddress:(id)a3
{
}

- (NSString)payloadOrganizationPhone
{
  return self->_payloadOrganizationPhone;
}

- (void)setPayloadOrganizationPhone:(id)a3
{
}

- (NSString)payloadOrganizationEmail
{
  return self->_payloadOrganizationEmail;
}

- (void)setPayloadOrganizationEmail:(id)a3
{
}

- (NSString)payloadOrganizationMagic
{
  return self->_payloadOrganizationMagic;
}

- (void)setPayloadOrganizationMagic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadOrganizationMagic, 0);
  objc_storeStrong((id *)&self->_payloadOrganizationEmail, 0);
  objc_storeStrong((id *)&self->_payloadOrganizationPhone, 0);
  objc_storeStrong((id *)&self->_payloadOrganizationAddress, 0);

  objc_storeStrong((id *)&self->_payloadOrganizationName, 0);
}

@end