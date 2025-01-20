@interface CEMManagementTestMessageMessage
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithEcho:(id)a3;
+ (id)buildWithEcho:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadEcho;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadEcho:(id)a3;
@end

@implementation CEMManagementTestMessageMessage

+ (NSString)registeredClassName
{
  return (NSString *)@"Messages";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.message.management.test";
}

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Echo";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithEcho:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadEcho:v3];

  return v4;
}

+ (id)buildRequiredOnlyWithEcho:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadEcho:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  v8 = [v7 allKeys];
  v9 = [v6 setWithArray:v8];

  v10 = +[CEMManagementTestMessageMessage allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v17 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v7 withKey:@"Echo" isRequired:1 defaultValue:0 error:&v17];

  id v14 = v17;
  payloadEcho = self->_payloadEcho;
  self->_payloadEcho = v13;

  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Echo" withValue:self->_payloadEcho isRequired:1 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMManagementTestMessageMessage;
  v4 = [(CEMMessageBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadEcho copy];
  v6 = (void *)v4[7];
  v4[7] = v5;

  return v4;
}

- (NSString)payloadEcho
{
  return self->_payloadEcho;
}

- (void)setPayloadEcho:(id)a3
{
}

- (void).cxx_destruct
{
}

@end