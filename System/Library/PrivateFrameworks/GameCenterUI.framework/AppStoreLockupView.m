@interface AppStoreLockupView
- (_TtC12GameCenterUI18AppStoreLockupView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI18AppStoreLockupView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation AppStoreLockupView

- (_TtC12GameCenterUI18AppStoreLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI18AppStoreLockupView *)sub_1AF374D2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI18AppStoreLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3750A8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF37518C();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1AF375354((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18AppStoreLockupView_appStoreLockup));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI18AppStoreLockupView_appStoreLockupSize);
}

@end