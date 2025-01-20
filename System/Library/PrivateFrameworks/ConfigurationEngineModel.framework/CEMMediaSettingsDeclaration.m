@interface CEMMediaSettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowBookstore:(id)a4 withAllowBookstoreErotica:(id)a5 withAllowEnterpriseBookBackup:(id)a6 withAllowEnterpriseBookMetadataSync:(id)a7;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowBookstore;
- (NSNumber)payloadAllowBookstoreErotica;
- (NSNumber)payloadAllowEnterpriseBookBackup;
- (NSNumber)payloadAllowEnterpriseBookMetadataSync;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowBookstore:(id)a3;
- (void)setPayloadAllowBookstoreErotica:(id)a3;
- (void)setPayloadAllowEnterpriseBookBackup:(id)a3;
- (void)setPayloadAllowEnterpriseBookMetadataSync:(id)a3;
@end

@implementation CEMMediaSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.media.settings";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowBookstore";
  v6[1] = @"allowBookstoreErotica";
  v6[2] = @"allowEnterpriseBookBackup";
  v6[3] = @"allowEnterpriseBookMetadataSync";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowBookstore";
  v6[1] = @"allowBookstoreErotica";
  v6[2] = @"allowEnterpriseBookBackup";
  v6[3] = @"allowEnterpriseBookMetadataSync";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowBookstore:(id)a4 withAllowBookstoreErotica:(id)a5 withAllowEnterpriseBookBackup:(id)a6 withAllowEnterpriseBookMetadataSync:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.media.settings"];
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
  v19 = (void *)MEMORY[0x263EFFA88];
  if (v15) {
    id v20 = v15;
  }
  else {
    id v20 = (id)MEMORY[0x263EFFA88];
  }
  [v16 setPayloadAllowBookstore:v20];

  if (v14) {
    id v21 = v14;
  }
  else {
    id v21 = v19;
  }
  [v16 setPayloadAllowBookstoreErotica:v21];

  if (v13) {
    id v22 = v13;
  }
  else {
    id v22 = v19;
  }
  [v16 setPayloadAllowEnterpriseBookBackup:v22];

  if (v12) {
    id v23 = v12;
  }
  else {
    id v23 = v19;
  }
  [v16 setPayloadAllowEnterpriseBookMetadataSync:v23];

  [v16 updateServerHash];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.media.settings"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMMediaSettingsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v26 = 0;
  id v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowBookstore" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v26];
  id v14 = v26;
  payloadAllowBookstore = self->_payloadAllowBookstore;
  self->_payloadAllowBookstore = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowBookstoreErotica" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v25];
    id v14 = v25;
    payloadAllowBookstoreErotica = self->_payloadAllowBookstoreErotica;
    self->_payloadAllowBookstoreErotica = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowEnterpriseBookBackup" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v24];
      id v14 = v24;
      payloadAllowEnterpriseBookBackup = self->_payloadAllowEnterpriseBookBackup;
      self->_payloadAllowEnterpriseBookBackup = v18;

      if (!v14)
      {
        id v23 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowEnterpriseBookMetadataSync" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v23];
        id v14 = v23;
        payloadAllowEnterpriseBookMetadataSync = self->_payloadAllowEnterpriseBookMetadataSync;
        self->_payloadAllowEnterpriseBookMetadataSync = v20;
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
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowBookstore" withValue:self->_payloadAllowBookstore isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowBookstoreErotica" withValue:self->_payloadAllowBookstoreErotica isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowEnterpriseBookBackup" withValue:self->_payloadAllowEnterpriseBookBackup isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowEnterpriseBookMetadataSync" withValue:self->_payloadAllowEnterpriseBookMetadataSync isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMMediaSettingsDeclaration;
  v4 = [(CEMDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowBookstore copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowBookstoreErotica copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowEnterpriseBookBackup copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAllowEnterpriseBookMetadataSync copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSNumber)payloadAllowBookstore
{
  return self->_payloadAllowBookstore;
}

- (void)setPayloadAllowBookstore:(id)a3
{
}

- (NSNumber)payloadAllowBookstoreErotica
{
  return self->_payloadAllowBookstoreErotica;
}

- (void)setPayloadAllowBookstoreErotica:(id)a3
{
}

- (NSNumber)payloadAllowEnterpriseBookBackup
{
  return self->_payloadAllowEnterpriseBookBackup;
}

- (void)setPayloadAllowEnterpriseBookBackup:(id)a3
{
}

- (NSNumber)payloadAllowEnterpriseBookMetadataSync
{
  return self->_payloadAllowEnterpriseBookMetadataSync;
}

- (void)setPayloadAllowEnterpriseBookMetadataSync:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowEnterpriseBookMetadataSync, 0);
  objc_storeStrong((id *)&self->_payloadAllowEnterpriseBookBackup, 0);
  objc_storeStrong((id *)&self->_payloadAllowBookstoreErotica, 0);

  objc_storeStrong((id *)&self->_payloadAllowBookstore, 0);
}

@end