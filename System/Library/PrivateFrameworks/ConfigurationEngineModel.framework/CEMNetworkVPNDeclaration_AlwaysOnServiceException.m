@interface CEMNetworkVPNDeclaration_AlwaysOnServiceException
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithServiceName:(id)a3 withAction:(id)a4;
+ (id)buildWithServiceName:(id)a3 withAction:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadAction;
- (NSString)payloadServiceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAction:(id)a3;
- (void)setPayloadServiceName:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_AlwaysOnServiceException

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ServiceName";
  v6[1] = @"Action";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithServiceName:(id)a3 withAction:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadServiceName:v6];

  [v7 setPayloadAction:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithServiceName:(id)a3 withAction:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadServiceName:v6];

  [v7 setPayloadAction:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkVPNDeclaration_AlwaysOnServiceException allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ServiceName" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadServiceName = self->_payloadServiceName;
  self->_payloadServiceName = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Action" isRequired:1 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadAction = self->_payloadAction;
    self->_payloadAction = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ServiceName" withValue:self->_payloadServiceName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Action" withValue:self->_payloadAction isRequired:1 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMNetworkVPNDeclaration_AlwaysOnServiceException;
  v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadServiceName copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadAction copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadServiceName
{
  return self->_payloadServiceName;
}

- (void)setPayloadServiceName:(id)a3
{
}

- (NSString)payloadAction
{
  return self->_payloadAction;
}

- (void)setPayloadAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAction, 0);

  objc_storeStrong((id *)&self->_payloadServiceName, 0);
}

@end