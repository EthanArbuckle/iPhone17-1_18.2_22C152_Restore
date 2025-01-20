@interface CEMMediaInstallDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withMedia:(id)a4 withMandatory:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withMedia:(id)a4 withMandatory:(id)a5 withInstallWhenActivated:(id)a6 withRemoveWhenDeactivated:(id)a7;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadInstallWhenActivated;
- (NSNumber)payloadMandatory;
- (NSNumber)payloadRemoveWhenDeactivated;
- (NSString)payloadMedia;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadInstallWhenActivated:(id)a3;
- (void)setPayloadMandatory:(id)a3;
- (void)setPayloadMedia:(id)a3;
- (void)setPayloadRemoveWhenDeactivated:(id)a3;
@end

@implementation CEMMediaInstallDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.media.install";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Media";
  v6[1] = @"Mandatory";
  v6[2] = @"InstallWhenActivated";
  v6[3] = @"RemoveWhenDeactivated";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
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
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  v4 = [(CEMMediaInstallDeclaration *)self payloadMedia];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"book"];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withMedia:(id)a4 withMandatory:(id)a5 withInstallWhenActivated:(id)a6 withRemoveWhenDeactivated:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.media.install"];
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
  [v16 setPayloadMedia:v15];

  [v16 setPayloadMandatory:v14];
  v19 = (void *)MEMORY[0x263EFFA88];
  if (v13) {
    id v20 = v13;
  }
  else {
    id v20 = (id)MEMORY[0x263EFFA88];
  }
  [v16 setPayloadInstallWhenActivated:v20];

  if (v12) {
    id v21 = v12;
  }
  else {
    id v21 = v19;
  }
  [v16 setPayloadRemoveWhenDeactivated:v21];

  [v16 updateServerHash];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withMedia:(id)a4 withMandatory:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.media.install"];
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
  [v10 setPayloadMedia:v9];

  [v10 setPayloadMandatory:v8];
  [v10 updateServerHash];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMMediaInstallDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v26 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Media" isRequired:1 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadMedia = self->_payloadMedia;
  self->_payloadMedia = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"Mandatory" isRequired:1 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadMandatory = self->_payloadMandatory;
    self->_payloadMandatory = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"InstallWhenActivated" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v24];
      id v14 = v24;
      payloadInstallWhenActivated = self->_payloadInstallWhenActivated;
      self->_payloadInstallWhenActivated = v18;

      if (!v14)
      {
        id v23 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"RemoveWhenDeactivated" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v23];
        id v14 = v23;
        payloadRemoveWhenDeactivated = self->_payloadRemoveWhenDeactivated;
        self->_payloadRemoveWhenDeactivated = v20;
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
  payloadMedia = self->_payloadMedia;
  if (payloadMedia)
  {
    id v7 = [v4 objectForKeyedSubscript:self->_payloadMedia];
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"Media", payloadMedia, v7, &stru_26C838878);
  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"Media", 0, 0, &stru_26C838878);
  }
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"Mandatory" withValue:self->_payloadMandatory isRequired:1 defaultValue:0];
  uint64_t v8 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"InstallWhenActivated" withValue:self->_payloadInstallWhenActivated isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"RemoveWhenDeactivated" withValue:self->_payloadRemoveWhenDeactivated isRequired:0 defaultValue:v8];
  id v9 = (void *)[v5 copy];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMMediaInstallDeclaration;
  id v4 = [(CEMDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadMedia copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadMandatory copy];
  uint64_t v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadInstallWhenActivated copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadRemoveWhenDeactivated copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSString)payloadMedia
{
  return self->_payloadMedia;
}

- (void)setPayloadMedia:(id)a3
{
}

- (NSNumber)payloadMandatory
{
  return self->_payloadMandatory;
}

- (void)setPayloadMandatory:(id)a3
{
}

- (NSNumber)payloadInstallWhenActivated
{
  return self->_payloadInstallWhenActivated;
}

- (void)setPayloadInstallWhenActivated:(id)a3
{
}

- (NSNumber)payloadRemoveWhenDeactivated
{
  return self->_payloadRemoveWhenDeactivated;
}

- (void)setPayloadRemoveWhenDeactivated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRemoveWhenDeactivated, 0);
  objc_storeStrong((id *)&self->_payloadInstallWhenActivated, 0);
  objc_storeStrong((id *)&self->_payloadMandatory, 0);

  objc_storeStrong((id *)&self->_payloadMedia, 0);
}

@end