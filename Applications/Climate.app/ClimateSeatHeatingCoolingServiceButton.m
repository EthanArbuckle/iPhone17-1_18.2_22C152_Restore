@interface ClimateSeatHeatingCoolingServiceButton
- (BOOL)isHighlighted;
- (_TtC7Climate38ClimateSeatHeatingCoolingServiceButton)init;
- (void)heatingCoolingService:(id)a3 didUpdateHeatingCoolingLevel:(int)a4;
- (void)heatingCoolingService:(id)a3 didUpdateOn:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ClimateSeatHeatingCoolingServiceButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateSeatHeatingCoolingServiceButton();
  return [(ClimateButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClimateSeatHeatingCoolingServiceButton();
  v4 = (char *)v7.receiver;
  [(ClimateButton *)&v7 setHighlighted:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_progressView];
  if (v4[OBJC_IVAR____TtC7Climate13ClimateButton_shouldBeHighlighted]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [v4 isHighlighted];
  }
  (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0xB8))(v6);
}

- (_TtC7Climate38ClimateSeatHeatingCoolingServiceButton)init
{
  *(_DWORD *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_currentValue) = 0;
  uint64_t v3 = OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_autoModeGlyph;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)[objc_allocWithZone((Class)UIImageView) init];

  result = (_TtC7Climate38ClimateSeatHeatingCoolingServiceButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_seatHeatingCooling));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_progressView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate38ClimateSeatHeatingCoolingServiceButton_autoModeGlyph);
}

- (void)heatingCoolingService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100059294();
}

- (void)heatingCoolingService:(id)a3 didUpdateHeatingCoolingLevel:(int)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100059294();
}

@end