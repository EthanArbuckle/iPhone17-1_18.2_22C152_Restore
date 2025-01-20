@interface HeaderWithIconView
- (_TtC18HealthExperienceUI18HeaderWithIconView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI18HeaderWithIconView)initWithFrame:(CGRect)a3;
@end

@implementation HeaderWithIconView

- (_TtC18HealthExperienceUI18HeaderWithIconView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI18HeaderWithIconView_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI18HeaderWithIconView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI18HeaderWithIconView)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI18HeaderWithIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI18HeaderWithIconView_configuration;
  uint64_t v4 = sub_1AD73D120();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1AD206DD0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI18HeaderWithIconView_item, (uint64_t (*)(void))sub_1AD1E1B04);
}

@end