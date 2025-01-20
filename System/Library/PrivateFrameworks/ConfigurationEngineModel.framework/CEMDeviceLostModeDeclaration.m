@interface CEMDeviceLostModeDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEnable:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withEnable:(id)a4 withMessage:(id)a5 withPhoneNumber:(id)a6 withFootnote:(id)a7;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadEnable;
- (NSString)payloadFootnote;
- (NSString)payloadMessage;
- (NSString)payloadPhoneNumber;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadEnable:(id)a3;
- (void)setPayloadFootnote:(id)a3;
- (void)setPayloadMessage:(id)a3;
- (void)setPayloadPhoneNumber:(id)a3;
@end

@implementation CEMDeviceLostModeDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.device.lostmode";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Enable";
  v6[1] = @"Message";
  v6[2] = @"PhoneNumber";
  v6[3] = @"Footnote";
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
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withEnable:(id)a4 withMessage:(id)a5 withPhoneNumber:(id)a6 withFootnote:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.device.lostmode"];
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
  [v16 setPayloadEnable:v15];

  [v16 setPayloadMessage:v14];
  [v16 setPayloadPhoneNumber:v13];

  [v16 setPayloadFootnote:v12];
  [v16 updateServerHash];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEnable:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.device.lostmode"];
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
  [v7 setPayloadEnable:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceLostModeDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v26 = 0;
  id v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"Enable" isRequired:1 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadEnable = self->_payloadEnable;
  self->_payloadEnable = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Message" isRequired:0 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadMessage = self->_payloadMessage;
    self->_payloadMessage = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PhoneNumber" isRequired:0 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadPhoneNumber = self->_payloadPhoneNumber;
      self->_payloadPhoneNumber = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Footnote" isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadFootnote = self->_payloadFootnote;
        self->_payloadFootnote = v20;
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
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"Enable" withValue:self->_payloadEnable isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Message" withValue:self->_payloadMessage isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"PhoneNumber" withValue:self->_payloadPhoneNumber isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Footnote" withValue:self->_payloadFootnote isRequired:0 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMDeviceLostModeDeclaration;
  v4 = [(CEMDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadEnable copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadMessage copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadPhoneNumber copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadFootnote copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSNumber)payloadEnable
{
  return self->_payloadEnable;
}

- (void)setPayloadEnable:(id)a3
{
}

- (NSString)payloadMessage
{
  return self->_payloadMessage;
}

- (void)setPayloadMessage:(id)a3
{
}

- (NSString)payloadPhoneNumber
{
  return self->_payloadPhoneNumber;
}

- (void)setPayloadPhoneNumber:(id)a3
{
}

- (NSString)payloadFootnote
{
  return self->_payloadFootnote;
}

- (void)setPayloadFootnote:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFootnote, 0);
  objc_storeStrong((id *)&self->_payloadPhoneNumber, 0);
  objc_storeStrong((id *)&self->_payloadMessage, 0);

  objc_storeStrong((id *)&self->_payloadEnable, 0);
}

@end