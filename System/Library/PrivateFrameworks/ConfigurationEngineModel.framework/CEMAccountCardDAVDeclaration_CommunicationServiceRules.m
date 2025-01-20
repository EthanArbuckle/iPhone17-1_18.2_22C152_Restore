@interface CEMAccountCardDAVDeclaration_CommunicationServiceRules
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithDefaultServiceHandlers:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMAccountCardDAVDeclaration_CommunicationServiceRulesDefaultServiceHandlers)payloadDefaultServiceHandlers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadDefaultServiceHandlers:(id)a3;
@end

@implementation CEMAccountCardDAVDeclaration_CommunicationServiceRules

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"DefaultServiceHandlers";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDefaultServiceHandlers:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadDefaultServiceHandlers:v3];

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

  v10 = +[CEMAccountCardDAVDeclaration_CommunicationServiceRules allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v17 = 0;
  v13 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v7 withKey:@"DefaultServiceHandlers" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v17];

  id v14 = v17;
  payloadDefaultServiceHandlers = self->_payloadDefaultServiceHandlers;
  self->_payloadDefaultServiceHandlers = v13;

  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  payloadDefaultServiceHandlers = self->_payloadDefaultServiceHandlers;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __93__CEMAccountCardDAVDeclaration_CommunicationServiceRules_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_2642C87E8;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"DefaultServiceHandlers" withValue:payloadDefaultServiceHandlers dictSerializer:v10 isRequired:0 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMAccountCardDAVDeclaration_CommunicationServiceRules;
  id v4 = [(CEMPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(CEMAccountCardDAVDeclaration_CommunicationServiceRulesDefaultServiceHandlers *)self->_payloadDefaultServiceHandlers copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (CEMAccountCardDAVDeclaration_CommunicationServiceRulesDefaultServiceHandlers)payloadDefaultServiceHandlers
{
  return self->_payloadDefaultServiceHandlers;
}

- (void)setPayloadDefaultServiceHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end