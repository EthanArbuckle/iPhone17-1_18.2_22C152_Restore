@interface CEMAccountSubscribedCalendarDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withSubCalAccountHostName:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withSubCalAccountDescription:(id)a4 withSubCalAccountHostName:(id)a5 withSubCalAccountUseSSL:(id)a6 withSubCalAccountCredentials:(id)a7;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadSubCalAccountUseSSL;
- (NSString)payloadSubCalAccountCredentials;
- (NSString)payloadSubCalAccountDescription;
- (NSString)payloadSubCalAccountHostName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadSubCalAccountCredentials:(id)a3;
- (void)setPayloadSubCalAccountDescription:(id)a3;
- (void)setPayloadSubCalAccountHostName:(id)a3;
- (void)setPayloadSubCalAccountUseSSL:(id)a3;
@end

@implementation CEMAccountSubscribedCalendarDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.subscribedcalendar";
}

+ (id)profileType
{
  return @"com.apple.subscribedcalendar.account";
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"SubCalAccountDescription";
  v6[1] = @"SubCalAccountHostName";
  v6[2] = @"SubCalAccountUseSSL";
  v6[3] = @"SubCalAccountCredentials";
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
  v4 = [(CEMAccountSubscribedCalendarDeclaration *)self payloadSubCalAccountCredentials];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"credential"];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withSubCalAccountDescription:(id)a4 withSubCalAccountHostName:(id)a5 withSubCalAccountUseSSL:(id)a6 withSubCalAccountCredentials:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.account.subscribedcalendar"];
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
  [v16 setPayloadSubCalAccountDescription:v15];

  [v16 setPayloadSubCalAccountHostName:v14];
  if (v13) {
    id v19 = v13;
  }
  else {
    id v19 = (id)MEMORY[0x263EFFA80];
  }
  [v16 setPayloadSubCalAccountUseSSL:v19];

  [v16 setPayloadSubCalAccountCredentials:v12];
  [v16 updateServerHash];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withSubCalAccountHostName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.account.subscribedcalendar"];
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
  [v7 setPayloadSubCalAccountHostName:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMAccountSubscribedCalendarDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v26 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SubCalAccountDescription" isRequired:0 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadSubCalAccountDescription = self->_payloadSubCalAccountDescription;
  self->_payloadSubCalAccountDescription = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SubCalAccountHostName" isRequired:1 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadSubCalAccountHostName = self->_payloadSubCalAccountHostName;
    self->_payloadSubCalAccountHostName = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SubCalAccountUseSSL" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v24];
      id v14 = v24;
      payloadSubCalAccountUseSSL = self->_payloadSubCalAccountUseSSL;
      self->_payloadSubCalAccountUseSSL = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SubCalAccountCredentials" isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadSubCalAccountCredentials = self->_payloadSubCalAccountCredentials;
        self->_payloadSubCalAccountCredentials = v20;
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
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"SubCalAccountDescription" withValue:self->_payloadSubCalAccountDescription isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"SubCalAccountHostName" withValue:self->_payloadSubCalAccountHostName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"SubCalAccountUseSSL" withValue:self->_payloadSubCalAccountUseSSL isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  payloadSubCalAccountCredentials = self->_payloadSubCalAccountCredentials;
  if (payloadSubCalAccountCredentials)
  {
    v7 = [v4 objectForKeyedSubscript:self->_payloadSubCalAccountCredentials];
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"SubCalAccountCredentials", payloadSubCalAccountCredentials, v7, &stru_26C838878);
  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"SubCalAccountCredentials", 0, 0, &stru_26C838878);
  }
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMAccountSubscribedCalendarDeclaration;
  id v4 = [(CEMDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadSubCalAccountDescription copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadSubCalAccountHostName copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadSubCalAccountUseSSL copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadSubCalAccountCredentials copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSString)payloadSubCalAccountDescription
{
  return self->_payloadSubCalAccountDescription;
}

- (void)setPayloadSubCalAccountDescription:(id)a3
{
}

- (NSString)payloadSubCalAccountHostName
{
  return self->_payloadSubCalAccountHostName;
}

- (void)setPayloadSubCalAccountHostName:(id)a3
{
}

- (NSNumber)payloadSubCalAccountUseSSL
{
  return self->_payloadSubCalAccountUseSSL;
}

- (void)setPayloadSubCalAccountUseSSL:(id)a3
{
}

- (NSString)payloadSubCalAccountCredentials
{
  return self->_payloadSubCalAccountCredentials;
}

- (void)setPayloadSubCalAccountCredentials:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSubCalAccountCredentials, 0);
  objc_storeStrong((id *)&self->_payloadSubCalAccountUseSSL, 0);
  objc_storeStrong((id *)&self->_payloadSubCalAccountHostName, 0);

  objc_storeStrong((id *)&self->_payloadSubCalAccountDescription, 0);
}

@end