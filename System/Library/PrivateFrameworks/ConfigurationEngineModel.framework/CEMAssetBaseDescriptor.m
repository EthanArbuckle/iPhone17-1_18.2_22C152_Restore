@interface CEMAssetBaseDescriptor
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithTitle:(id)a3;
+ (id)buildWithTitle:(id)a3 withDescription:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadDescription;
- (NSString)payloadTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadDescription:(id)a3;
- (void)setPayloadTitle:(id)a3;
@end

@implementation CEMAssetBaseDescriptor

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Title";
  v6[1] = @"Description";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithTitle:(id)a3 withDescription:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadTitle:v6];

  [v7 setPayloadDescription:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithTitle:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadTitle:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMAssetBaseDescriptor allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Title" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadTitle = self->_payloadTitle;
  self->_payloadTitle = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Description" isRequired:0 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadDescription = self->_payloadDescription;
    self->_payloadDescription = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Title" withValue:self->_payloadTitle isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Description" withValue:self->_payloadDescription isRequired:0 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMAssetBaseDescriptor;
  v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadTitle copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadDescription copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadTitle
{
  return self->_payloadTitle;
}

- (void)setPayloadTitle:(id)a3
{
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDescription, 0);

  objc_storeStrong((id *)&self->_payloadTitle, 0);
}

@end