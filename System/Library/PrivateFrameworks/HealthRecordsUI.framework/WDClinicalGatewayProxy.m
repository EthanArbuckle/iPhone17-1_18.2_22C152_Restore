@interface WDClinicalGatewayProxy
- (NSString)batchID;
- (NSString)gatewayID;
- (WDClinicalGatewayProxy)init;
- (WDClinicalGatewayProxy)initWithGatewayID:(id)a3 batchID:(id)a4;
@end

@implementation WDClinicalGatewayProxy

- (WDClinicalGatewayProxy)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (WDClinicalGatewayProxy)initWithGatewayID:(id)a3 batchID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDClinicalGatewayProxy;
  v8 = [(WDClinicalGatewayProxy *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    gatewayID = v8->_gatewayID;
    v8->_gatewayID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    batchID = v8->_batchID;
    v8->_batchID = (NSString *)v11;
  }
  return v8;
}

- (NSString)gatewayID
{
  return self->_gatewayID;
}

- (NSString)batchID
{
  return self->_batchID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchID, 0);
  objc_storeStrong((id *)&self->_gatewayID, 0);
}

@end