@interface ClimateRecirculationServiceButton
- (_TtC7Climate33ClimateRecirculationServiceButton)init;
- (void)recirculationService:(id)a3 didUpdateAutoMode:(BOOL)a4;
- (void)recirculationService:(id)a3 didUpdateOn:(BOOL)a4;
@end

@implementation ClimateRecirculationServiceButton

- (_TtC7Climate33ClimateRecirculationServiceButton)init
{
  uint64_t v3 = OBJC_IVAR____TtC7Climate33ClimateRecirculationServiceButton_autoModeGlyph;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)[objc_allocWithZone((Class)UIImageView) init];

  result = (_TtC7Climate33ClimateRecirculationServiceButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate33ClimateRecirculationServiceButton_recirculation));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate33ClimateRecirculationServiceButton_autoModeGlyph);
}

- (void)recirculationService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_10009078C();
}

- (void)recirculationService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_10009019C();
}

@end