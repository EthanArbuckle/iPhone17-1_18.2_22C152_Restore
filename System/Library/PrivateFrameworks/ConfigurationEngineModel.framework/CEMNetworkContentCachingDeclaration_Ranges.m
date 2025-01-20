@interface CEMNetworkContentCachingDeclaration_Ranges
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithFirst:(id)a3 withLast:(id)a4;
+ (id)buildWithType:(id)a3 withFirst:(id)a4 withLast:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadFirst;
- (NSString)payloadLast;
- (NSString)payloadType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadFirst:(id)a3;
- (void)setPayloadLast:(id)a3;
- (void)setPayloadType:(id)a3;
@end

@implementation CEMNetworkContentCachingDeclaration_Ranges

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"type";
  v6[1] = @"first";
  v6[2] = @"last";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithType:(id)a3 withFirst:(id)a4 withLast:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = (__CFString *)a3;
  v10 = objc_opt_new();
  v11 = v10;
  if (v9) {
    v12 = v9;
  }
  else {
    v12 = @"IPv4";
  }
  [v10 setPayloadType:v12];

  [v11 setPayloadFirst:v8];
  [v11 setPayloadLast:v7];

  return v11;
}

+ (id)buildRequiredOnlyWithFirst:(id)a3 withLast:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setPayloadFirst:v6];

  [v7 setPayloadLast:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkContentCachingDeclaration_Ranges allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"type" isRequired:0 defaultValue:@"IPv4" error:&v23];
  id v14 = v23;
  payloadType = self->_payloadType;
  self->_payloadType = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"first" isRequired:1 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadFirst = self->_payloadFirst;
    self->_payloadFirst = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"last" isRequired:1 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadLast = self->_payloadLast;
      self->_payloadLast = v18;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"type" withValue:self->_payloadType isRequired:0 defaultValue:@"IPv4"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"first" withValue:self->_payloadFirst isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"last" withValue:self->_payloadLast isRequired:1 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMNetworkContentCachingDeclaration_Ranges;
  v4 = [(CEMPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadFirst copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadLast copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
}

- (NSString)payloadFirst
{
  return self->_payloadFirst;
}

- (void)setPayloadFirst:(id)a3
{
}

- (NSString)payloadLast
{
  return self->_payloadLast;
}

- (void)setPayloadLast:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLast, 0);
  objc_storeStrong((id *)&self->_payloadFirst, 0);

  objc_storeStrong((id *)&self->_payloadType, 0);
}

@end