@interface ExpressCheckoutCard
+ (BOOL)supportsSecureCoding;
- (_TtC18AppleMediaServices19ExpressCheckoutCard)init;
- (_TtC18AppleMediaServices19ExpressCheckoutCard)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ExpressCheckoutCard

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18D79F2A4(v4);
}

- (_TtC18AppleMediaServices19ExpressCheckoutCard)initWithCoder:(id)a3
{
  return (_TtC18AppleMediaServices19ExpressCheckoutCard *)ExpressCheckoutCard.init(coder:)(a3);
}

- (_TtC18AppleMediaServices19ExpressCheckoutCard)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end