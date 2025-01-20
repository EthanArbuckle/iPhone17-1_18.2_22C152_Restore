@interface ASCSKPurchaseIntent
- (ASCSKPurchaseIntent)initWithBundleId:(id)a3 productIdentifier:(id)a4 appName:(id)a5 productName:(id)a6;
- (NSString)additionalBuyParams;
- (SKPurchaseIntent)purchaseIntent;
- (id)getAdditionalBuyParams;
- (void)send:(id)a3;
- (void)setAdditionalBuyParams:(id)a3;
@end

@implementation ASCSKPurchaseIntent

- (ASCSKPurchaseIntent)initWithBundleId:(id)a3 productIdentifier:(id)a4 appName:(id)a5 productName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ASCSKPurchaseIntent;
  v14 = [(ASCSKPurchaseIntent *)&v20 init];
  if (v14)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v15 = (void *)qword_1001A6098;
    uint64_t v25 = qword_1001A6098;
    if (!qword_1001A6098)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100022AC4;
      v21[3] = &unk_100184338;
      v21[4] = &v22;
      sub_100022AC4((uint64_t)v21);
      v15 = (void *)v23[3];
    }
    v16 = v15;
    _Block_object_dispose(&v22, 8);
    v17 = (SKPurchaseIntent *)[[v16 alloc] initWithBundleId:v10 productIdentifier:v11 appName:v12 productName:v13];
    purchaseIntent = v14->_purchaseIntent;
    v14->_purchaseIntent = v17;
  }
  return v14;
}

- (id)getAdditionalBuyParams
{
  return [(SKPurchaseIntent *)self->_purchaseIntent additionalBuyParams];
}

- (void)setAdditionalBuyParams:(id)a3
{
}

- (void)send:(id)a3
{
}

- (SKPurchaseIntent)purchaseIntent
{
  return self->_purchaseIntent;
}

- (NSString)additionalBuyParams
{
  return self->_additionalBuyParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalBuyParams, 0);

  objc_storeStrong((id *)&self->_purchaseIntent, 0);
}

@end