@interface BYODDomainPurchaseEligibilityResult
- (BOOL)purchaseAllowed;
- (BYODDomainPurchaseEligibilityResult)initWithDictionary:(id)a3;
@end

@implementation BYODDomainPurchaseEligibilityResult

- (BYODDomainPurchaseEligibilityResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BYODDomainPurchaseEligibilityResult;
  v5 = [(BYODDomainPurchaseEligibilityResult *)&v8 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"purchaseAllowed"];
    v5->_purchaseAllowed = [v6 BOOLValue];
  }
  return v5;
}

- (BOOL)purchaseAllowed
{
  return self->_purchaseAllowed;
}

@end