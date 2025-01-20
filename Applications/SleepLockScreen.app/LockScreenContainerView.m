@interface LockScreenContainerView
- (_TtC15SleepLockScreen23LockScreenContainerView)initWithCoder:(id)a3;
- (_TtC15SleepLockScreen23LockScreenContainerView)initWithFrame:(CGRect)a3;
- (void)didPan:(id)a3;
- (void)layoutSubviews;
@end

@implementation LockScreenContainerView

- (_TtC15SleepLockScreen23LockScreenContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100004A7C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100003BD4();
}

- (void)didPan:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100004590(v4);
}

- (_TtC15SleepLockScreen23LockScreenContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC15SleepLockScreen23LockScreenContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugSafeContentBoundsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugActualContentBoundsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_model));
  swift_release();
  swift_release();
  sub_100004B60((uint64_t)self + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView);
}

@end