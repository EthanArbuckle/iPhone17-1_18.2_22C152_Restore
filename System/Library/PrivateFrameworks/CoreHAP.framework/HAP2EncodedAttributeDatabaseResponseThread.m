@interface HAP2EncodedAttributeDatabaseResponseThread
- (HAP2EncodedAttributeDatabaseResponseThread)initWithBTLEResponse:(id)a3 attributeDatabase:(id)a4;
- (NSDictionary)attributeDatabase;
@end

@implementation HAP2EncodedAttributeDatabaseResponseThread

- (void).cxx_destruct
{
}

- (NSDictionary)attributeDatabase
{
  return self->_attributeDatabase;
}

- (HAP2EncodedAttributeDatabaseResponseThread)initWithBTLEResponse:(id)a3 attributeDatabase:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAP2EncodedAttributeDatabaseResponseThread;
  v8 = [(HAP2EncodedResponseThread *)&v12 initWithBTLEResponse:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attributeDatabase, a4);
    v10 = v9;
  }

  return v9;
}

@end