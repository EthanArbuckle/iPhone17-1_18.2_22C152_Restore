@interface CEMApplicationSettingsManagedDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowOpenFromManagedToUnmanaged:(id)a4 withAllowOpenFromUnmanagedToManaged:(id)a5 withForceAirDropUnmanaged:(id)a6 withAllowManagedAppsCloudSync:(id)a7 withAllowManagedToWriteUnmanagedContacts:(id)a8 withAllowUnmanagedToReadManagedContacts:(id)a9;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowManagedAppsCloudSync;
- (NSNumber)payloadAllowManagedToWriteUnmanagedContacts;
- (NSNumber)payloadAllowOpenFromManagedToUnmanaged;
- (NSNumber)payloadAllowOpenFromUnmanagedToManaged;
- (NSNumber)payloadAllowUnmanagedToReadManagedContacts;
- (NSNumber)payloadForceAirDropUnmanaged;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowManagedAppsCloudSync:(id)a3;
- (void)setPayloadAllowManagedToWriteUnmanagedContacts:(id)a3;
- (void)setPayloadAllowOpenFromManagedToUnmanaged:(id)a3;
- (void)setPayloadAllowOpenFromUnmanagedToManaged:(id)a3;
- (void)setPayloadAllowUnmanagedToReadManagedContacts:(id)a3;
- (void)setPayloadForceAirDropUnmanaged:(id)a3;
@end

@implementation CEMApplicationSettingsManagedDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.application.settings.managed";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowOpenFromManagedToUnmanaged";
  v6[1] = @"allowOpenFromUnmanagedToManaged";
  v6[2] = @"forceAirDropUnmanaged";
  v6[3] = @"allowManagedAppsCloudSync";
  v6[4] = @"allowManagedToWriteUnmanagedContacts";
  v6[5] = @"allowUnmanagedToReadManagedContacts";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowOpenFromManagedToUnmanaged";
  v6[1] = @"allowOpenFromUnmanagedToManaged";
  v6[2] = @"forceAirDropUnmanaged";
  v6[3] = @"allowManagedAppsCloudSync";
  v6[4] = @"allowManagedToWriteUnmanagedContacts";
  v6[5] = @"allowUnmanagedToReadManagedContacts";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
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

+ (id)buildWithIdentifier:(id)a3 withAllowOpenFromManagedToUnmanaged:(id)a4 withAllowOpenFromUnmanagedToManaged:(id)a5 withForceAirDropUnmanaged:(id)a6 withAllowManagedAppsCloudSync:(id)a7 withAllowManagedToWriteUnmanagedContacts:(id)a8 withAllowUnmanagedToReadManagedContacts:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = objc_opt_new();
  [v21 setDeclarationType:@"com.apple.configuration.application.settings.managed"];
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
  v24 = (void *)MEMORY[0x263EFFA88];
  if (v20) {
    id v25 = v20;
  }
  else {
    id v25 = (id)MEMORY[0x263EFFA88];
  }
  [v21 setPayloadAllowOpenFromManagedToUnmanaged:v25];

  if (v19) {
    id v26 = v19;
  }
  else {
    id v26 = v24;
  }
  [v21 setPayloadAllowOpenFromUnmanagedToManaged:v26];

  v27 = (void *)MEMORY[0x263EFFA80];
  if (v18) {
    id v28 = v18;
  }
  else {
    id v28 = (id)MEMORY[0x263EFFA80];
  }
  [v21 setPayloadForceAirDropUnmanaged:v28];

  if (v17) {
    id v29 = v17;
  }
  else {
    id v29 = v24;
  }
  [v21 setPayloadAllowManagedAppsCloudSync:v29];

  if (v16) {
    id v30 = v16;
  }
  else {
    id v30 = v27;
  }
  [v21 setPayloadAllowManagedToWriteUnmanagedContacts:v30];

  if (v15) {
    id v31 = v15;
  }
  else {
    id v31 = v27;
  }
  [v21 setPayloadAllowUnmanagedToReadManagedContacts:v31];

  [v21 updateServerHash];

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.application.settings.managed"];
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

  v10 = +[CEMApplicationSettingsManagedDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v32 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowOpenFromManagedToUnmanaged" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v32];
  id v14 = v32;
  payloadAllowOpenFromManagedToUnmanaged = self->_payloadAllowOpenFromManagedToUnmanaged;
  self->_payloadAllowOpenFromManagedToUnmanaged = v13;

  if (!v14)
  {
    id v31 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowOpenFromUnmanagedToManaged" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v31];
    id v14 = v31;
    payloadAllowOpenFromUnmanagedToManaged = self->_payloadAllowOpenFromUnmanagedToManaged;
    self->_payloadAllowOpenFromUnmanagedToManaged = v16;

    if (!v14)
    {
      id v30 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"forceAirDropUnmanaged" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v30];
      id v14 = v30;
      payloadForceAirDropUnmanaged = self->_payloadForceAirDropUnmanaged;
      self->_payloadForceAirDropUnmanaged = v18;

      if (!v14)
      {
        id v29 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowManagedAppsCloudSync" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v29];
        id v14 = v29;
        payloadAllowManagedAppsCloudSync = self->_payloadAllowManagedAppsCloudSync;
        self->_payloadAllowManagedAppsCloudSync = v20;

        if (!v14)
        {
          id v28 = 0;
          v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowManagedToWriteUnmanagedContacts" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v28];
          id v14 = v28;
          payloadAllowManagedToWriteUnmanagedContacts = self->_payloadAllowManagedToWriteUnmanagedContacts;
          self->_payloadAllowManagedToWriteUnmanagedContacts = v22;

          if (!v14)
          {
            id v27 = 0;
            v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowUnmanagedToReadManagedContacts" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v27];
            id v14 = v27;
            payloadAllowUnmanagedToReadManagedContacts = self->_payloadAllowUnmanagedToReadManagedContacts;
            self->_payloadAllowUnmanagedToReadManagedContacts = v24;
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
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowOpenFromManagedToUnmanaged" withValue:self->_payloadAllowOpenFromManagedToUnmanaged isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowOpenFromUnmanagedToManaged" withValue:self->_payloadAllowOpenFromUnmanagedToManaged isRequired:0 defaultValue:v5];
  uint64_t v6 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"forceAirDropUnmanaged" withValue:self->_payloadForceAirDropUnmanaged isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowManagedAppsCloudSync" withValue:self->_payloadAllowManagedAppsCloudSync isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowManagedToWriteUnmanagedContacts" withValue:self->_payloadAllowManagedToWriteUnmanagedContacts isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowUnmanagedToReadManagedContacts" withValue:self->_payloadAllowUnmanagedToReadManagedContacts isRequired:0 defaultValue:v6];
  v7 = (void *)[v4 copy];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEMApplicationSettingsManagedDeclaration;
  v4 = [(CEMDeclarationBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowOpenFromManagedToUnmanaged copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowOpenFromUnmanagedToManaged copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadForceAirDropUnmanaged copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAllowManagedAppsCloudSync copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowManagedToWriteUnmanagedContacts copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadAllowUnmanagedToReadManagedContacts copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSNumber)payloadAllowOpenFromManagedToUnmanaged
{
  return self->_payloadAllowOpenFromManagedToUnmanaged;
}

- (void)setPayloadAllowOpenFromManagedToUnmanaged:(id)a3
{
}

- (NSNumber)payloadAllowOpenFromUnmanagedToManaged
{
  return self->_payloadAllowOpenFromUnmanagedToManaged;
}

- (void)setPayloadAllowOpenFromUnmanagedToManaged:(id)a3
{
}

- (NSNumber)payloadForceAirDropUnmanaged
{
  return self->_payloadForceAirDropUnmanaged;
}

- (void)setPayloadForceAirDropUnmanaged:(id)a3
{
}

- (NSNumber)payloadAllowManagedAppsCloudSync
{
  return self->_payloadAllowManagedAppsCloudSync;
}

- (void)setPayloadAllowManagedAppsCloudSync:(id)a3
{
}

- (NSNumber)payloadAllowManagedToWriteUnmanagedContacts
{
  return self->_payloadAllowManagedToWriteUnmanagedContacts;
}

- (void)setPayloadAllowManagedToWriteUnmanagedContacts:(id)a3
{
}

- (NSNumber)payloadAllowUnmanagedToReadManagedContacts
{
  return self->_payloadAllowUnmanagedToReadManagedContacts;
}

- (void)setPayloadAllowUnmanagedToReadManagedContacts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowUnmanagedToReadManagedContacts, 0);
  objc_storeStrong((id *)&self->_payloadAllowManagedToWriteUnmanagedContacts, 0);
  objc_storeStrong((id *)&self->_payloadAllowManagedAppsCloudSync, 0);
  objc_storeStrong((id *)&self->_payloadForceAirDropUnmanaged, 0);
  objc_storeStrong((id *)&self->_payloadAllowOpenFromUnmanagedToManaged, 0);

  objc_storeStrong((id *)&self->_payloadAllowOpenFromManagedToUnmanaged, 0);
}

@end