@interface CEMBookEnterpriseDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withDescriptor:(id)a4 withReference:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withDescriptor:(id)a4 withReference:(id)a5 withKind:(id)a6 withVersion:(id)a7 withAuthor:(id)a8 withTitle:(id)a9;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMAssetBaseDescriptor)payloadDescriptor;
- (CEMAssetBaseReference)payloadReference;
- (NSString)payloadAuthor;
- (NSString)payloadKind;
- (NSString)payloadTitle;
- (NSString)payloadVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAuthor:(id)a3;
- (void)setPayloadDescriptor:(id)a3;
- (void)setPayloadKind:(id)a3;
- (void)setPayloadReference:(id)a3;
- (void)setPayloadTitle:(id)a3;
- (void)setPayloadVersion:(id)a3;
@end

@implementation CEMBookEnterpriseDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.asset.book.enterprise";
}

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Descriptor";
  v6[1] = @"Reference";
  v6[2] = @"Kind";
  v6[3] = @"Version";
  v6[4] = @"Author";
  v6[5] = @"Title";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withDescriptor:(id)a4 withReference:(id)a5 withKind:(id)a6 withVersion:(id)a7 withAuthor:(id)a8 withTitle:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = objc_opt_new();
  [v21 setDeclarationType:@"com.apple.asset.book.enterprise"];
  if (v14)
  {
    [v21 setDeclarationIdentifier:v14];
  }
  else
  {
    v22 = [MEMORY[0x263F08C38] UUID];
    v23 = [v22 UUIDString];
    [v21 setDeclarationIdentifier:v23];
  }
  [v21 setPayloadDescriptor:v20];

  [v21 setPayloadReference:v19];
  [v21 setPayloadKind:v18];

  [v21 setPayloadVersion:v17];
  [v21 setPayloadAuthor:v16];

  [v21 setPayloadTitle:v15];
  [v21 updateServerHash];

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withDescriptor:(id)a4 withReference:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.asset.book.enterprise"];
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
  [v10 setPayloadDescriptor:v9];

  [v10 setPayloadReference:v8];
  [v10 updateServerHash];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMBookEnterpriseDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v32 = 0;
  v13 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"Descriptor" classType:objc_opt_class() isRequired:1 defaultValue:0 error:&v32];
  id v14 = v32;
  payloadDescriptor = self->_payloadDescriptor;
  self->_payloadDescriptor = v13;

  if (!v14)
  {
    id v31 = 0;
    id v16 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"Reference" classType:objc_opt_class() isRequired:1 defaultValue:0 error:&v31];
    id v14 = v31;
    payloadReference = self->_payloadReference;
    self->_payloadReference = v16;

    if (!v14)
    {
      id v30 = 0;
      id v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Kind" isRequired:0 defaultValue:0 error:&v30];
      id v14 = v30;
      payloadKind = self->_payloadKind;
      self->_payloadKind = v18;

      if (!v14)
      {
        id v29 = 0;
        id v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Version" isRequired:0 defaultValue:0 error:&v29];
        id v14 = v29;
        payloadVersion = self->_payloadVersion;
        self->_payloadVersion = v20;

        if (!v14)
        {
          id v28 = 0;
          v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Author" isRequired:0 defaultValue:0 error:&v28];
          id v14 = v28;
          payloadAuthor = self->_payloadAuthor;
          self->_payloadAuthor = v22;

          if (!v14)
          {
            id v27 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Title" isRequired:0 defaultValue:0 error:&v27];
            id v14 = v27;
            payloadTitle = self->_payloadTitle;
            self->_payloadTitle = v24;
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
  payloadDescriptor = self->_payloadDescriptor;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__CEMBookEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v17[3] = &unk_2642C87E8;
  id v7 = v4;
  id v18 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"Descriptor" withValue:payloadDescriptor dictSerializer:v17 isRequired:1 defaultValue:0];
  payloadReference = self->_payloadReference;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __67__CEMBookEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  id v15 = &unk_2642C87E8;
  id v16 = v7;
  id v9 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"Reference" withValue:payloadReference dictSerializer:&v12 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5, @"Kind", self->_payloadKind, 0, 0, v12, v13, v14, v15 withKey withValue isRequired defaultValue];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Version" withValue:self->_payloadVersion isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Author" withValue:self->_payloadAuthor isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Title" withValue:self->_payloadTitle isRequired:0 defaultValue:0];
  v10 = (void *)[v5 copy];

  return v10;
}

uint64_t __67__CEMBookEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __67__CEMBookEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEMBookEnterpriseDeclaration;
  id v4 = [(CEMDeclarationBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(CEMAssetBaseDescriptor *)self->_payloadDescriptor copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(CEMAssetBaseReference *)self->_payloadReference copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadKind copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadVersion copy];
  uint64_t v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_payloadAuthor copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadTitle copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (CEMAssetBaseDescriptor)payloadDescriptor
{
  return self->_payloadDescriptor;
}

- (void)setPayloadDescriptor:(id)a3
{
}

- (CEMAssetBaseReference)payloadReference
{
  return self->_payloadReference;
}

- (void)setPayloadReference:(id)a3
{
}

- (NSString)payloadKind
{
  return self->_payloadKind;
}

- (void)setPayloadKind:(id)a3
{
}

- (NSString)payloadVersion
{
  return self->_payloadVersion;
}

- (void)setPayloadVersion:(id)a3
{
}

- (NSString)payloadAuthor
{
  return self->_payloadAuthor;
}

- (void)setPayloadAuthor:(id)a3
{
}

- (NSString)payloadTitle
{
  return self->_payloadTitle;
}

- (void)setPayloadTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTitle, 0);
  objc_storeStrong((id *)&self->_payloadAuthor, 0);
  objc_storeStrong((id *)&self->_payloadVersion, 0);
  objc_storeStrong((id *)&self->_payloadKind, 0);
  objc_storeStrong((id *)&self->_payloadReference, 0);

  objc_storeStrong((id *)&self->_payloadDescriptor, 0);
}

@end