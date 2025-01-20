@interface AABridgedMescalSigner
- (AABridgedMescalSigner)init;
- (AMSBag)bag;
- (id)signatureWithData:(id)a3 error:(id *)a4;
- (void)setBag:(id)a3;
@end

@implementation AABridgedMescalSigner

- (AABridgedMescalSigner)init
{
  v7.receiver = self;
  v7.super_class = (Class)AABridgedMescalSigner;
  v2 = [(AABridgedMescalSigner *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [(objc_class *)getAMSBagClass() bagForProfile:@"AppAnalytics" profileVersion:@"1"];
    bag = v2->_bag;
    v2->_bag = (AMSBag *)v3;

    id v5 = objc_alloc_init(getAMSMutableBagKeySetClass());
    [v5 addBagKey:@"sign-sap-setup-cert" valueType:5];
    [v5 addBagKey:@"sign-sap-setup" valueType:5];
    [v5 addBagKey:@"trustedDomains" valueType:0];
    [v5 addBagKey:@"signed-actions" valueType:6];
    [v5 addBagKey:@"metrics" valueType:6];
    [v5 addBagKey:@"sign-sap-request" valueType:6];
    [v5 addBagKey:@"sign-sap-response" valueType:6];
    [(objc_class *)getAMSMutableBagKeySetClass() registerBagKeySet:v5 forProfile:@"AppAnalytics" profileVersion:@"1"];
  }
  return v2;
}

- (id)signatureWithData:(id)a3 error:(id *)a4
{
  v6 = (Class (__cdecl *)())getAMSMescalClass;
  id v7 = a3;
  Class v8 = v6();
  v9 = [(AABridgedMescalSigner *)self bag];
  v10 = [(objc_class *)v8 signatureFromData:v7 type:1 bag:v9 error:a4];

  return v10;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end