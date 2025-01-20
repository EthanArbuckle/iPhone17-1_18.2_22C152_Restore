@interface CEMApplicationAppStoreDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withITunesStoreID:(id)a6;
+ (id)buildWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withITunesStoreID:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMAssetBaseDescriptor)payloadDescriptor;
- (NSNumber)payloadITunesStoreID;
- (NSString)payloadBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadBundleIdentifier:(id)a3;
- (void)setPayloadDescriptor:(id)a3;
- (void)setPayloadITunesStoreID:(id)a3;
@end

@implementation CEMApplicationAppStoreDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.asset.application.appstore";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Descriptor";
  v6[1] = @"BundleIdentifier";
  v6[2] = @"iTunesStoreID";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withITunesStoreID:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.asset.application.appstore"];
  if (v9)
  {
    [v13 setDeclarationIdentifier:v9];
  }
  else
  {
    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    [v13 setDeclarationIdentifier:v15];
  }
  [v13 setPayloadDescriptor:v12];

  [v13 setPayloadBundleIdentifier:v11];
  [v13 setPayloadITunesStoreID:v10];

  [v13 updateServerHash];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withITunesStoreID:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.asset.application.appstore"];
  if (v9)
  {
    [v13 setDeclarationIdentifier:v9];
  }
  else
  {
    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    [v13 setDeclarationIdentifier:v15];
  }
  [v13 setPayloadDescriptor:v12];

  [v13 setPayloadBundleIdentifier:v11];
  [v13 setPayloadITunesStoreID:v10];

  [v13 updateServerHash];

  return v13;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMApplicationAppStoreDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"Descriptor" classType:objc_opt_class() isRequired:1 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadDescriptor = self->_payloadDescriptor;
  self->_payloadDescriptor = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleIdentifier" isRequired:1 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadBundleIdentifier = self->_payloadBundleIdentifier;
    self->_payloadBundleIdentifier = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"iTunesStoreID" isRequired:1 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadITunesStoreID = self->_payloadITunesStoreID;
      self->_payloadITunesStoreID = v18;
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
  v10[2] = __72__CEMApplicationAppStoreDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_2642C87E8;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"Descriptor" withValue:payloadDescriptor dictSerializer:v10 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"BundleIdentifier" withValue:self->_payloadBundleIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"iTunesStoreID" withValue:self->_payloadITunesStoreID isRequired:1 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

uint64_t __72__CEMApplicationAppStoreDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMApplicationAppStoreDeclaration;
  id v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(CEMAssetBaseDescriptor *)self->_payloadDescriptor copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadBundleIdentifier copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadITunesStoreID copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

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

- (NSNumber)payloadITunesStoreID
{
  return self->_payloadITunesStoreID;
}

- (void)setPayloadITunesStoreID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadITunesStoreID, 0);
  objc_storeStrong((id *)&self->_payloadBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_payloadDescriptor, 0);
}

@end