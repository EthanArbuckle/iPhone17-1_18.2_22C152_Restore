@interface CEMSystemNotificationsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withNotificationSettings:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withNotificationSettings:(id)a4 withAllowNotificationsModification:(id)a5;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadNotificationSettings;
- (NSNumber)payloadAllowNotificationsModification;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowNotificationsModification:(id)a3;
- (void)setPayloadNotificationSettings:(id)a3;
@end

@implementation CEMSystemNotificationsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.notifications";
}

+ (id)profileType
{
  return @"com.apple.notificationsettings";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"NotificationSettings";
  v6[1] = @"allowNotificationsModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowNotificationsModification";
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

+ (id)buildWithIdentifier:(id)a3 withNotificationSettings:(id)a4 withAllowNotificationsModification:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.system.notifications"];
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
  [v10 setPayloadNotificationSettings:v9];

  if (v8) {
    id v13 = v8;
  }
  else {
    id v13 = (id)MEMORY[0x263EFFA88];
  }
  [v10 setPayloadAllowNotificationsModification:v13];

  [v10 updateServerHash];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withNotificationSettings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.system.notifications"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    id v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadNotificationSettings:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemNotificationsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v20 = 0;
  id v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"NotificationSettings" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadNotificationSettings = self->_payloadNotificationSettings;
  self->_payloadNotificationSettings = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowNotificationsModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v19];
    id v14 = v19;
    payloadAllowNotificationsModification = self->_payloadAllowNotificationsModification;
    self->_payloadAllowNotificationsModification = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  payloadNotificationSettings = self->_payloadNotificationSettings;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__CEMSystemNotificationsDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_2642C9860;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"NotificationSettings" withValue:payloadNotificationSettings itemSerializer:v10 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"allowNotificationsModification" withValue:self->_payloadAllowNotificationsModification isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  id v8 = (void *)[v5 copy];

  return v8;
}

uint64_t __72__CEMSystemNotificationsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMSystemNotificationsDeclaration;
  id v4 = [(CEMDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadNotificationSettings copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowNotificationsModification copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSArray)payloadNotificationSettings
{
  return self->_payloadNotificationSettings;
}

- (void)setPayloadNotificationSettings:(id)a3
{
}

- (NSNumber)payloadAllowNotificationsModification
{
  return self->_payloadAllowNotificationsModification;
}

- (void)setPayloadAllowNotificationsModification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowNotificationsModification, 0);

  objc_storeStrong((id *)&self->_payloadNotificationSettings, 0);
}

@end