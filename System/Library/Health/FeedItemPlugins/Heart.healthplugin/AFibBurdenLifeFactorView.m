@interface AFibBurdenLifeFactorView
- (_TtC5Heart24AFibBurdenLifeFactorView)initWithCoder:(id)a3;
- (_TtC5Heart24AFibBurdenLifeFactorView)initWithFrame:(CGRect)a3;
- (void)tapped;
@end

@implementation AFibBurdenLifeFactorView

- (_TtC5Heart24AFibBurdenLifeFactorView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___imageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___titleDetailView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___infoView) = 0;
  id v5 = a3;

  result = (_TtC5Heart24AFibBurdenLifeFactorView *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (void)tapped
{
  v2 = self;
  sub_240AB3B34();
}

- (_TtC5Heart24AFibBurdenLifeFactorView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Heart24AFibBurdenLifeFactorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_240A484BC((uint64_t)self + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___titleDetailView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Heart24AFibBurdenLifeFactorView____lazy_storage___infoView);
}

@end