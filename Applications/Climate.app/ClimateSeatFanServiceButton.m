@interface ClimateSeatFanServiceButton
- (BOOL)isHighlighted;
- (_TtC7Climate27ClimateSeatFanServiceButton)init;
- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4;
- (void)fanService:(id)a3 didUpdateOn:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ClimateSeatFanServiceButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateSeatFanServiceButton();
  return [(ClimateButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClimateSeatFanServiceButton();
  v4 = (char *)v7.receiver;
  [(ClimateButton *)&v7 setHighlighted:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC7Climate27ClimateSeatFanServiceButton_progressView];
  if (v4[OBJC_IVAR____TtC7Climate13ClimateButton_shouldBeHighlighted]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [v4 isHighlighted];
  }
  (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0xB8))(v6);
}

- (_TtC7Climate27ClimateSeatFanServiceButton)init
{
  *((unsigned char *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Climate27ClimateSeatFanServiceButton_currentValue) = 0;
  uint64_t v3 = OBJC_IVAR____TtC7Climate27ClimateSeatFanServiceButton_autoModeGlyph;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)[objc_allocWithZone((Class)UIImageView) init];

  result = (_TtC7Climate27ClimateSeatFanServiceButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateSeatFanServiceButton_seatFan));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateSeatFanServiceButton_progressView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate27ClimateSeatFanServiceButton_autoModeGlyph);
}

- (void)fanService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10004C610();
}

- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10004C610();
}

@end