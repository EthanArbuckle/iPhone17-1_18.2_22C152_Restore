@interface CEMAccountmacOSServerDeclaration_ConfiguredAccountsItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithType:(id)a3;
+ (id)buildWithType:(id)a3 withPort:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadPort;
- (NSString)payloadType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadPort:(id)a3;
- (void)setPayloadType:(id)a3;
@end

@implementation CEMAccountmacOSServerDeclaration_ConfiguredAccountsItem

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v6[1] = @"Port";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithType:(id)a3 withPort:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadType:v6];

  if (v5) {
    v8 = v5;
  }
  else {
    v8 = &unk_26C894730;
  }
  [v7 setPayloadPort:v8];

  return v7;
}

+ (id)buildRequiredOnlyWithType:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadType:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMAccountmacOSServerDeclaration_ConfiguredAccountsItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Type" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadType = self->_payloadType;
  self->_payloadType = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Port" isRequired:0 defaultValue:&unk_26C894730 error:&v19];
    id v14 = v19;
    payloadPort = self->_payloadPort;
    self->_payloadPort = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Type" withValue:self->_payloadType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Port" withValue:self->_payloadPort isRequired:0 defaultValue:&unk_26C894730];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMAccountmacOSServerDeclaration_ConfiguredAccountsItem;
  v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadPort copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPort, 0);

  objc_storeStrong((id *)&self->_payloadType, 0);
}

@end