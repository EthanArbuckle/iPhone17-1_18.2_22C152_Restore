@interface AMSBAAKeychainItems
- (AMSBAAKeychainItems)initWithBAACert:(id)a3 BIKKey:(__SecKey *)a4 intermediateRootCert:(id)a5;
- (NSData)BAACert;
- (NSData)IntermediateRootCert;
- (__SecKey)BIKKeyRef;
@end

@implementation AMSBAAKeychainItems

- (AMSBAAKeychainItems)initWithBAACert:(id)a3 BIKKey:(__SecKey *)a4 intermediateRootCert:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSBAAKeychainItems;
  v10 = [(AMSBAAKeychainItems *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    BAACert = v10->_BAACert;
    v10->_BAACert = (NSData *)v11;

    id BIKKey = v10->_BIKKey;
    v10->_id BIKKey = a4;

    uint64_t v14 = [v9 copy];
    IntermediateRootCert = v10->_IntermediateRootCert;
    v10->_IntermediateRootCert = (NSData *)v14;
  }
  return v10;
}

- (__SecKey)BIKKeyRef
{
  return (__SecKey *)self->_BIKKey;
}

- (NSData)BAACert
{
  return self->_BAACert;
}

- (NSData)IntermediateRootCert
{
  return self->_IntermediateRootCert;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IntermediateRootCert, 0);
  objc_storeStrong((id *)&self->_BAACert, 0);
  objc_storeStrong(&self->_BIKKey, 0);
}

@end