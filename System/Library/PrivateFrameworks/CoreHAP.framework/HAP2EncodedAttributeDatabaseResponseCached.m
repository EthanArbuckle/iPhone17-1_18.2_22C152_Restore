@interface HAP2EncodedAttributeDatabaseResponseCached
- (BOOL)isEncrypted;
- (HAP2EncodedAttributeDatabaseResponseCached)initWithAttributeDatabase:(id)a3;
- (NSDictionary)attributeDatabase;
@end

@implementation HAP2EncodedAttributeDatabaseResponseCached

- (void).cxx_destruct
{
}

- (NSDictionary)attributeDatabase
{
  return self->_attributeDatabase;
}

- (BOOL)isEncrypted
{
  return 1;
}

- (HAP2EncodedAttributeDatabaseResponseCached)initWithAttributeDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2EncodedAttributeDatabaseResponseCached;
  v6 = [(HAP2EncodedAttributeDatabaseResponseCached *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attributeDatabase, a3);
  }

  return v7;
}

@end