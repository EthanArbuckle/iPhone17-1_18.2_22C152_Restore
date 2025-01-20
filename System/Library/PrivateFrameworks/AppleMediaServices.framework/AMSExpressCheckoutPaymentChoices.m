@interface AMSExpressCheckoutPaymentChoices
+ (BOOL)supportsSecureCoding;
- (AMSExpressCheckoutPaymentChoices)init;
- (AMSExpressCheckoutPaymentChoices)initWithCoder:(id)a3;
- (BOOL)isEmpty;
- (NSDictionary)metrics;
- (int64_t)cardsCount;
- (void)encodeWithCoder:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation AMSExpressCheckoutPaymentChoices

- (NSDictionary)metrics
{
  if (sub_18D7A2490())
  {
    v2 = (void *)sub_18DD4DD80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (void)setMetrics:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_18DD4DDA0();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_18D7A2550(v4);
}

- (BOOL)isEmpty
{
  v2 = self;
  BOOL v3 = sub_18D7A2640();

  return v3;
}

- (int64_t)cardsCount
{
  v2 = self;
  int64_t v3 = sub_18D7A26E8();

  return v3;
}

- (AMSExpressCheckoutPaymentChoices)init
{
  return (AMSExpressCheckoutPaymentChoices *)ExpressCheckoutPaymentChoices.init()();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18D7A2BA0(v4);
}

- (AMSExpressCheckoutPaymentChoices)initWithCoder:(id)a3
{
  return (AMSExpressCheckoutPaymentChoices *)ExpressCheckoutPaymentChoices.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end