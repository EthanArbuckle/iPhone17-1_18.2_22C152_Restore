@interface HAPPairSetupSessionServerInfo
- (HAPPairSetupSessionServerInfo)initWithProductData:(id)a3 maxTries:(int)a4;
- (NSString)productData;
- (int)maxTries;
- (void)setMaxTries:(int)a3;
- (void)setProductData:(id)a3;
@end

@implementation HAPPairSetupSessionServerInfo

- (void).cxx_destruct
{
}

- (void)setMaxTries:(int)a3
{
  self->_maxTries = a3;
}

- (int)maxTries
{
  return self->_maxTries;
}

- (void)setProductData:(id)a3
{
}

- (NSString)productData
{
  return self->_productData;
}

- (HAPPairSetupSessionServerInfo)initWithProductData:(id)a3 maxTries:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HAPPairSetupSessionServerInfo;
  v7 = [(HAPPairSetupSessionServerInfo *)&v10 init];
  if (v7)
  {
    v8 = (void *)[v6 copy];
    [(HAPPairSetupSessionServerInfo *)v7 setProductData:v8];

    [(HAPPairSetupSessionServerInfo *)v7 setMaxTries:v4];
  }

  return v7;
}

@end