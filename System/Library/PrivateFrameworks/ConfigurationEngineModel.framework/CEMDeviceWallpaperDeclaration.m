@interface CEMDeviceWallpaperDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withLockScreenAsset:(id)a4 withHomeScreenAsset:(id)a5 withAllowWallpaperModification:(id)a6;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowWallpaperModification;
- (NSString)payloadHomeScreenAsset;
- (NSString)payloadLockScreenAsset;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowWallpaperModification:(id)a3;
- (void)setPayloadHomeScreenAsset:(id)a3;
- (void)setPayloadLockScreenAsset:(id)a3;
@end

@implementation CEMDeviceWallpaperDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.device.wallpaper";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"LockScreenAsset";
  v6[1] = @"HomeScreenAsset";
  v6[2] = @"allowWallpaperModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowWallpaperModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
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

+ (id)buildWithIdentifier:(id)a3 withLockScreenAsset:(id)a4 withHomeScreenAsset:(id)a5 withAllowWallpaperModification:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.device.wallpaper"];
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
  [v13 setPayloadLockScreenAsset:v12];

  [v13 setPayloadHomeScreenAsset:v11];
  if (v10) {
    id v16 = v10;
  }
  else {
    id v16 = (id)MEMORY[0x263EFFA88];
  }
  [v13 setPayloadAllowWallpaperModification:v16];

  [v13 updateServerHash];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.device.wallpaper"];
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
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMDeviceWallpaperDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LockScreenAsset" isRequired:0 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadLockScreenAsset = self->_payloadLockScreenAsset;
  self->_payloadLockScreenAsset = v13;

  if (!v14)
  {
    id v22 = 0;
    id v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"HomeScreenAsset" isRequired:0 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadHomeScreenAsset = self->_payloadHomeScreenAsset;
    self->_payloadHomeScreenAsset = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowWallpaperModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v21];
      id v14 = v21;
      payloadAllowWallpaperModification = self->_payloadAllowWallpaperModification;
      self->_payloadAllowWallpaperModification = v18;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"LockScreenAsset" withValue:self->_payloadLockScreenAsset isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"HomeScreenAsset" withValue:self->_payloadHomeScreenAsset isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowWallpaperModification" withValue:self->_payloadAllowWallpaperModification isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMDeviceWallpaperDeclaration;
  v4 = [(CEMDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadLockScreenAsset copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadHomeScreenAsset copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowWallpaperModification copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSString)payloadLockScreenAsset
{
  return self->_payloadLockScreenAsset;
}

- (void)setPayloadLockScreenAsset:(id)a3
{
}

- (NSString)payloadHomeScreenAsset
{
  return self->_payloadHomeScreenAsset;
}

- (void)setPayloadHomeScreenAsset:(id)a3
{
}

- (NSNumber)payloadAllowWallpaperModification
{
  return self->_payloadAllowWallpaperModification;
}

- (void)setPayloadAllowWallpaperModification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowWallpaperModification, 0);
  objc_storeStrong((id *)&self->_payloadHomeScreenAsset, 0);

  objc_storeStrong((id *)&self->_payloadLockScreenAsset, 0);
}

@end