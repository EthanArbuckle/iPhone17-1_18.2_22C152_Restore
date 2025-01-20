@interface IKAppDynamicUIResult
+ (id)_rawResultWithDynamicUIResult:(id)a3;
+ (id)_responseDictionaryWithCarrierLinkResult:(id)a3;
- (AMSCarrierLinkResult)carrierLinkResult;
- (AMSPurchaseResult)purchaseResult;
- (IKAppDynamicUIResult)initWithCarrierLinkResult:(id)a3;
- (IKAppDynamicUIResult)initWithPurchaseResult:(id)a3;
- (id)rawResponse;
- (void)setCarrierLinkResult:(id)a3;
- (void)setPurchaseResult:(id)a3;
@end

@implementation IKAppDynamicUIResult

- (IKAppDynamicUIResult)initWithPurchaseResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKAppDynamicUIResult;
  v6 = [(IKAppDynamicUIResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_purchaseResult, a3);
  }

  return v7;
}

- (IKAppDynamicUIResult)initWithCarrierLinkResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKAppDynamicUIResult;
  v6 = [(IKAppDynamicUIResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_carrierLinkResult, a3);
  }

  return v7;
}

- (id)rawResponse
{
  v3 = objc_opt_class();
  return (id)[v3 _rawResultWithDynamicUIResult:self];
}

+ (id)_responseDictionaryWithCarrierLinkResult:(id)a3
{
  id v3 = a3;
  v4 = [v3 response];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
    v6 = [v3 linkParams];
    v7 = [v6 dictionary];
    [v5 setObject:v7 forKeyedSubscript:@"linkParams"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)_rawResultWithDynamicUIResult:(id)a3
{
  id v3 = a3;
  v4 = [v3 purchaseResult];
  id v5 = [v4 responseDictionary];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = objc_opt_class();
    objc_super v9 = [v3 carrierLinkResult];
    id v7 = [v8 _responseDictionaryWithCarrierLinkResult:v9];
  }
  return v7;
}

- (AMSPurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (void)setPurchaseResult:(id)a3
{
}

- (AMSCarrierLinkResult)carrierLinkResult
{
  return self->_carrierLinkResult;
}

- (void)setCarrierLinkResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierLinkResult, 0);
  objc_storeStrong((id *)&self->_purchaseResult, 0);
}

@end