@interface AFibBurdenLifeFactorsView
- (_TtC5Heart25AFibBurdenLifeFactorsView)initWithCoder:(id)a3;
- (_TtC5Heart25AFibBurdenLifeFactorsView)initWithFrame:(CGRect)a3;
@end

@implementation AFibBurdenLifeFactorsView

- (_TtC5Heart25AFibBurdenLifeFactorsView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart25AFibBurdenLifeFactorsView____lazy_storage___lifeFactorsViews) = 0;
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5Heart25AFibBurdenLifeFactorsView_delegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC5Heart25AFibBurdenLifeFactorsView *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (_TtC5Heart25AFibBurdenLifeFactorsView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Heart25AFibBurdenLifeFactorsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_240A484BC((uint64_t)self + OBJC_IVAR____TtC5Heart25AFibBurdenLifeFactorsView_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Heart25AFibBurdenLifeFactorsView_healthStore);
}

@end