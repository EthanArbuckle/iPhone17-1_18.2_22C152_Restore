@interface AMSExpressCheckoutResultModel
+ (BOOL)supportsSecureCoding;
- (AMSExpressCheckoutResultModel)init;
- (AMSExpressCheckoutResultModel)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSExpressCheckoutResultModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18D7A509C(v4);
}

- (AMSExpressCheckoutResultModel)initWithCoder:(id)a3
{
  return (AMSExpressCheckoutResultModel *)AMSEngagementResult.ResultModel.init(coder:)(a3);
}

- (AMSExpressCheckoutResultModel)init
{
}

- (void).cxx_destruct
{
}

@end