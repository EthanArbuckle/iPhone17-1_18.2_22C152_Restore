@interface AMSMediaResult
- (AMSMediaResult)initWithResult:(id)a3;
- (NSArray)responseDataItems;
- (NSDictionary)responseDictionary;
@end

@implementation AMSMediaResult

- (NSArray)responseDataItems
{
  v2 = [(AMSMediaResult *)self responseDictionary];
  v3 = [v2 objectForKeyedSubscript:@"data"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (AMSMediaResult)initWithResult:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSMediaResult;
  v5 = [(AMSURLResult *)&v10 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }

    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = v7;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end