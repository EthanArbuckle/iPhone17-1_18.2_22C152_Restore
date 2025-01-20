@interface RoundedShadowView
- (_TtC24MenstrualCyclesAppPlugin17RoundedShadowView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin17RoundedShadowView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RoundedShadowView

- (_TtC24MenstrualCyclesAppPlugin17RoundedShadowView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin17RoundedShadowView *)sub_2414DD2C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin17RoundedShadowView)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin17RoundedShadowView *)sub_2414DD578(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  id v3 = [(RoundedShadowView *)v2 layer];
  [(RoundedShadowView *)v2 bounds];
  id v8 = objc_msgSend(self, sel_bezierPathWithRect_, v4, v5, v6, v7);
  id v9 = objc_msgSend(v8, sel_CGPath);

  objc_msgSend(v3, sel_setShadowPath_, v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17RoundedShadowView_roundedView));
}

@end