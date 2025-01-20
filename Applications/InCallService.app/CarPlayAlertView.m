@interface CarPlayAlertView
- (_TtC13InCallService16CarPlayAlertView)initWithCoder:(id)a3;
- (_TtC13InCallService16CarPlayAlertView)initWithFrame:(CGRect)a3;
@end

@implementation CarPlayAlertView

- (_TtC13InCallService16CarPlayAlertView)initWithFrame:(CGRect)a3
{
  return (_TtC13InCallService16CarPlayAlertView *)sub_1001B5024(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13InCallService16CarPlayAlertView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001B5B88();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService16CarPlayAlertView____lazy_storage___soundButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService16CarPlayAlertView____lazy_storage___callAgainButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13InCallService16CarPlayAlertView____lazy_storage___cancelButton);
}

@end