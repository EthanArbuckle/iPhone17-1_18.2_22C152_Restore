@interface CEMSystemTVRemoteDeclaration_AllowedTVsItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithTVDeviceID:(id)a3;
+ (id)buildWithTVDeviceID:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadTVDeviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadTVDeviceID:(id)a3;
@end

@implementation CEMSystemTVRemoteDeclaration_AllowedTVsItem

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"TVDeviceID";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithTVDeviceID:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadTVDeviceID:v3];

  return v4;
}

+ (id)buildRequiredOnlyWithTVDeviceID:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadTVDeviceID:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  v8 = [v7 allKeys];
  v9 = [v6 setWithArray:v8];

  v10 = +[CEMSystemTVRemoteDeclaration_AllowedTVsItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v17 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v7 withKey:@"TVDeviceID" isRequired:1 defaultValue:0 error:&v17];

  id v14 = v17;
  payloadTVDeviceID = self->_payloadTVDeviceID;
  self->_payloadTVDeviceID = v13;

  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"TVDeviceID" withValue:self->_payloadTVDeviceID isRequired:1 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMSystemTVRemoteDeclaration_AllowedTVsItem;
  v4 = [(CEMPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadTVDeviceID copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSString)payloadTVDeviceID
{
  return self->_payloadTVDeviceID;
}

- (void)setPayloadTVDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end