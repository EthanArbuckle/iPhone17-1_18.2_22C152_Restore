@interface CEMAnyPayload
+ (id)buildFromDictionary:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSDictionary)payloadKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadKeys:(id)a3;
@end

@implementation CEMAnyPayload

+ (id)buildFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 loadPayload:v3 error:0];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v5 = (NSDictionary *)[a3 copy];
  payloadKeys = self->_payloadKeys;
  self->_payloadKeys = v5;

  return 1;
}

- (id)serializePayload
{
  v2 = (void *)[(NSDictionary *)self->_payloadKeys copy];

  return v2;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v3 = (void *)[(NSDictionary *)self->_payloadKeys copy];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMAnyPayload;
  v4 = [(CEMPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSDictionary *)self->_payloadKeys copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSDictionary)payloadKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPayloadKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end