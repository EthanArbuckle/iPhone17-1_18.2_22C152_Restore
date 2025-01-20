@interface CEMApplicationAnyDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withDesignatedRequirement:(id)a6 withSigningIdentifier:(id)a7;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMAssetBaseDescriptor)payloadDescriptor;
- (NSString)payloadBundleIdentifier;
- (NSString)payloadDesignatedRequirement;
- (NSString)payloadSigningIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadBundleIdentifier:(id)a3;
- (void)setPayloadDescriptor:(id)a3;
- (void)setPayloadDesignatedRequirement:(id)a3;
- (void)setPayloadSigningIdentifier:(id)a3;
@end

@implementation CEMApplicationAnyDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.asset.applicationID";
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Descriptor";
  v6[1] = @"BundleIdentifier";
  v6[2] = @"DesignatedRequirement";
  v6[3] = @"SigningIdentifier";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withDesignatedRequirement:(id)a6 withSigningIdentifier:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.asset.applicationID"];
  if (v11)
  {
    [v16 setDeclarationIdentifier:v11];
  }
  else
  {
    v17 = [MEMORY[0x263F08C38] UUID];
    v18 = [v17 UUIDString];
    [v16 setDeclarationIdentifier:v18];
  }
  [v16 setPayloadDescriptor:v15];

  [v16 setPayloadBundleIdentifier:v14];
  [v16 setPayloadDesignatedRequirement:v13];

  [v16 setPayloadSigningIdentifier:v12];
  [v16 updateServerHash];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.asset.applicationID"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    id v11 = [MEMORY[0x263F08C38] UUID];
    id v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadDescriptor:v9];

  [v10 setPayloadBundleIdentifier:v8];
  [v10 updateServerHash];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationAnyDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v26 = 0;
  id v13 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"Descriptor" classType:objc_opt_class() isRequired:1 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadDescriptor = self->_payloadDescriptor;
  self->_payloadDescriptor = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleIdentifier" isRequired:1 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadBundleIdentifier = self->_payloadBundleIdentifier;
    self->_payloadBundleIdentifier = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DesignatedRequirement" isRequired:0 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadDesignatedRequirement = self->_payloadDesignatedRequirement;
      self->_payloadDesignatedRequirement = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SigningIdentifier" isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadSigningIdentifier = self->_payloadSigningIdentifier;
        self->_payloadSigningIdentifier = v20;
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
  payloadDescriptor = self->_payloadDescriptor;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__CEMApplicationAnyDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_2642C87E8;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"Descriptor" withValue:payloadDescriptor dictSerializer:v10 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"BundleIdentifier" withValue:self->_payloadBundleIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"DesignatedRequirement" withValue:self->_payloadDesignatedRequirement isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"SigningIdentifier" withValue:self->_payloadSigningIdentifier isRequired:0 defaultValue:0];
  id v8 = (void *)[v5 copy];

  return v8;
}

uint64_t __67__CEMApplicationAnyDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMApplicationAnyDeclaration;
  id v4 = [(CEMDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(CEMAssetBaseDescriptor *)self->_payloadDescriptor copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadBundleIdentifier copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadDesignatedRequirement copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadSigningIdentifier copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (CEMAssetBaseDescriptor)payloadDescriptor
{
  return self->_payloadDescriptor;
}

- (void)setPayloadDescriptor:(id)a3
{
}

- (NSString)payloadBundleIdentifier
{
  return self->_payloadBundleIdentifier;
}

- (void)setPayloadBundleIdentifier:(id)a3
{
}

- (NSString)payloadDesignatedRequirement
{
  return self->_payloadDesignatedRequirement;
}

- (void)setPayloadDesignatedRequirement:(id)a3
{
}

- (NSString)payloadSigningIdentifier
{
  return self->_payloadSigningIdentifier;
}

- (void)setPayloadSigningIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSigningIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDesignatedRequirement, 0);
  objc_storeStrong((id *)&self->_payloadBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_payloadDescriptor, 0);
}

@end