@interface BYODDomainPurchaseEligibilityResponse
- (BYODDomainPurchaseEligibilityResponse)initWithDictionary:(id)a3;
- (BYODDomainPurchaseEligibilityResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (BYODDomainPurchaseEligibilityResult)result;
- (void)setResult:(id)a3;
@end

@implementation BYODDomainPurchaseEligibilityResponse

- (BYODDomainPurchaseEligibilityResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BYODDomainPurchaseEligibilityResponse;
  v8 = [(BYODDomainPurchaseEligibilityResponse *)&v11 initWithHTTPResponse:v6 data:v7 bodyIsPlist:0];
  if (v8) {
    v9 = [(BYODDomainPurchaseEligibilityResponse *)v8 initWithDictionary:*(void *)&v8->super.AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary]];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (BYODDomainPurchaseEligibilityResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYODDomainPurchaseEligibilityResponse;
  v5 = [(BYODBaseResponse *)&v11 initWithDictionary:v4];
  if (v5)
  {
    id v6 = [BYODDomainPurchaseEligibilityResult alloc];
    id v7 = [v4 objectForKeyedSubscript:@"result"];
    v8 = [(BYODDomainPurchaseEligibilityResult *)v6 initWithDictionary:v7];
    v9 = v5->_result;
    v5->_result = v8;
  }
  return v5;
}

- (BYODDomainPurchaseEligibilityResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end