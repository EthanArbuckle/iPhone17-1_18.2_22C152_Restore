@interface ApplePayBubbleView
- (_TtC8Business18ApplePayBubbleView)initWithCoder:(id)a3;
@end

@implementation ApplePayBubbleView

- (_TtC8Business18ApplePayBubbleView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business18ApplePayBubbleView_applePayButtonWidthConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business18ApplePayBubbleView____lazy_storage___applePayButton) = 0;
  id v4 = a3;

  result = (_TtC8Business18ApplePayBubbleView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business18ApplePayBubbleView_applePayManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business18ApplePayBubbleView_applePayButtonWidthConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business18ApplePayBubbleView____lazy_storage___applePayButton);
}

@end