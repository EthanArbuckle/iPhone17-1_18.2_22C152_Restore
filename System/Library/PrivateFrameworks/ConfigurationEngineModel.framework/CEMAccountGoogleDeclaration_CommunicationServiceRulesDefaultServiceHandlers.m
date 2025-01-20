@interface CEMAccountGoogleDeclaration_CommunicationServiceRulesDefaultServiceHandlers
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithAudioCall:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadAudioCall;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAudioCall:(id)a3;
@end

@implementation CEMAccountGoogleDeclaration_CommunicationServiceRulesDefaultServiceHandlers

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AudioCall";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithAudioCall:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadAudioCall:v3];

  return v4;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  v8 = [v7 allKeys];
  v9 = [v6 setWithArray:v8];

  v10 = +[CEMAccountGoogleDeclaration_CommunicationServiceRulesDefaultServiceHandlers allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v17 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v7 withKey:@"AudioCall" isRequired:0 defaultValue:0 error:&v17];

  id v14 = v17;
  payloadAudioCall = self->_payloadAudioCall;
  self->_payloadAudioCall = v13;

  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  payloadAudioCall = self->_payloadAudioCall;
  if (payloadAudioCall)
  {
    id v7 = [v4 objectForKeyedSubscript:self->_payloadAudioCall];
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"AudioCall", payloadAudioCall, v7, &stru_26C838878);
  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"AudioCall", 0, 0, &stru_26C838878);
  }
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMAccountGoogleDeclaration_CommunicationServiceRulesDefaultServiceHandlers;
  id v4 = [(CEMPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadAudioCall copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSString)payloadAudioCall
{
  return self->_payloadAudioCall;
}

- (void)setPayloadAudioCall:(id)a3
{
}

- (void).cxx_destruct
{
}

@end