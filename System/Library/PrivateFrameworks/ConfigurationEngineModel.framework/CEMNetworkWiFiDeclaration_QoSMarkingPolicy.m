@interface CEMNetworkWiFiDeclaration_QoSMarkingPolicy
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithQoSMarkingWhitelistedAppIdentifiers:(id)a3 withQoSMarkingAppleAudioVideoCalls:(id)a4 withQoSMarkingEnabled:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadQoSMarkingWhitelistedAppIdentifiers;
- (NSNumber)payloadQoSMarkingAppleAudioVideoCalls;
- (NSNumber)payloadQoSMarkingEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadQoSMarkingAppleAudioVideoCalls:(id)a3;
- (void)setPayloadQoSMarkingEnabled:(id)a3;
- (void)setPayloadQoSMarkingWhitelistedAppIdentifiers:(id)a3;
@end

@implementation CEMNetworkWiFiDeclaration_QoSMarkingPolicy

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"QoSMarkingWhitelistedAppIdentifiers";
  v6[1] = @"QoSMarkingAppleAudioVideoCalls";
  v6[2] = @"QoSMarkingEnabled";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithQoSMarkingWhitelistedAppIdentifiers:(id)a3 withQoSMarkingAppleAudioVideoCalls:(id)a4 withQoSMarkingEnabled:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadQoSMarkingWhitelistedAppIdentifiers:v9];

  v11 = (void *)MEMORY[0x263EFFA88];
  if (v8) {
    id v12 = v8;
  }
  else {
    id v12 = (id)MEMORY[0x263EFFA88];
  }
  [v10 setPayloadQoSMarkingAppleAudioVideoCalls:v12];

  if (v7) {
    id v13 = v7;
  }
  else {
    id v13 = v11;
  }
  [v10 setPayloadQoSMarkingEnabled:v13];

  return v10;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkWiFiDeclaration_QoSMarkingPolicy allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v23 = 0;
  id v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"QoSMarkingWhitelistedAppIdentifiers" validator:&__block_literal_global_587_0 isRequired:0 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadQoSMarkingWhitelistedAppIdentifiers = self->_payloadQoSMarkingWhitelistedAppIdentifiers;
  self->_payloadQoSMarkingWhitelistedAppIdentifiers = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"QoSMarkingAppleAudioVideoCalls" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v22];
    id v14 = v22;
    payloadQoSMarkingAppleAudioVideoCalls = self->_payloadQoSMarkingAppleAudioVideoCalls;
    self->_payloadQoSMarkingAppleAudioVideoCalls = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"QoSMarkingEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v21];
      id v14 = v21;
      payloadQoSMarkingEnabled = self->_payloadQoSMarkingEnabled;
      self->_payloadQoSMarkingEnabled = v18;
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
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"QoSMarkingWhitelistedAppIdentifiers" withValue:self->_payloadQoSMarkingWhitelistedAppIdentifiers itemSerializer:&__block_literal_global_589 isRequired:0 defaultValue:0];
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"QoSMarkingAppleAudioVideoCalls" withValue:self->_payloadQoSMarkingAppleAudioVideoCalls isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"QoSMarkingEnabled" withValue:self->_payloadQoSMarkingEnabled isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMNetworkWiFiDeclaration_QoSMarkingPolicy;
  v4 = [(CEMPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadQoSMarkingWhitelistedAppIdentifiers copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadQoSMarkingAppleAudioVideoCalls copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadQoSMarkingEnabled copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSArray)payloadQoSMarkingWhitelistedAppIdentifiers
{
  return self->_payloadQoSMarkingWhitelistedAppIdentifiers;
}

- (void)setPayloadQoSMarkingWhitelistedAppIdentifiers:(id)a3
{
}

- (NSNumber)payloadQoSMarkingAppleAudioVideoCalls
{
  return self->_payloadQoSMarkingAppleAudioVideoCalls;
}

- (void)setPayloadQoSMarkingAppleAudioVideoCalls:(id)a3
{
}

- (NSNumber)payloadQoSMarkingEnabled
{
  return self->_payloadQoSMarkingEnabled;
}

- (void)setPayloadQoSMarkingEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadQoSMarkingEnabled, 0);
  objc_storeStrong((id *)&self->_payloadQoSMarkingAppleAudioVideoCalls, 0);

  objc_storeStrong((id *)&self->_payloadQoSMarkingWhitelistedAppIdentifiers, 0);
}

@end