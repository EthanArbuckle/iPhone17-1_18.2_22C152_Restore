@interface AMSPaymentConfirmationResult
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (AMSPaymentConfirmationResult)init;
- (AMSPaymentConfirmationResult)initWithCoder:(id)a3;
- (id)initWitChoice:(int64_t)a3;
- (int64_t)paymentConfirmationChoice;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSPaymentConfirmationResult

- (int64_t)paymentConfirmationChoice
{
  return PaymentConfirmationResult.paymentConfirmationChoice.getter();
}

- (id)initWitChoice:(int64_t)a3
{
  return PaymentConfirmationResult.init(_:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return static PaymentConfirmationResult.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (AMSPaymentConfirmationResult)initWithCoder:(id)a3
{
  return (AMSPaymentConfirmationResult *)PaymentConfirmationResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18D770474(v4);
}

- (AMSPaymentConfirmationResult)init
{
}

@end