@interface _BSProtobufTranslator_BSAuditToken
+ (id)protobufSchema;
- (NSData)tokenData;
- (NSString)bundleID;
- (id)didFinishProtobufDecodingWithError:(id *)a3;
- (id)initProtobufTranslatorForObject:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setTokenData:(id)a3;
@end

@implementation _BSProtobufTranslator_BSAuditToken

+ (id)protobufSchema
{
  return +[BSProtobufSerialization buildSchemaForClass:a1 builder:&__block_literal_global_33];
}

- (id)initProtobufTranslatorForObject:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BSProtobufTranslator_BSAuditToken;
  v5 = [(_BSProtobufTranslator_BSAuditToken *)&v11 init];
  if (v5)
  {
    uint64_t v6 = -[BSAuditToken _auditTokenAsData]((uint64_t)v4);
    tokenData = v5->_tokenData;
    v5->_tokenData = (NSData *)v6;

    uint64_t v8 = [v4 bundleID];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;
  }
  return v5;
}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  id v3 = -[BSAuditToken _initWithData:bundleID:]([BSAuditToken alloc], self->_tokenData, self->_bundleID);
  return v3;
}

- (NSData)tokenData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTokenData:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_tokenData, 0);
}

@end