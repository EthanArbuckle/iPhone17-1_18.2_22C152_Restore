@interface ClimateFanButton
- (CAFService)service;
- (NSUUID)trackerUUID;
- (_TtC7Climate16ClimateFanButton)init;
- (void)siblingDidStartSliding;
- (void)siblingDidStopSlidingWithWasIncreasing:(BOOL)a3;
- (void)siblingDidUpdateWithProgress:(double)a3;
@end

@implementation ClimateFanButton

- (NSUUID)trackerUUID
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (_TtC7Climate16ClimateFanButton)init
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Climate16ClimateFanButton_autoModeGlyph) = 0;
  UUID.init()();
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Climate16ClimateFanButton_shouldIgnoreCarUpdates) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC7Climate16ClimateFanButton____lazy_storage___currentValue;
  *(_DWORD *)v3 = 0;
  v3[4] = 1;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Climate16ClimateFanButton_wasPreviousValueInAutoMode) = 0;

  result = (_TtC7Climate16ClimateFanButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate16ClimateFanButton_autoModeGlyph));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate16ClimateFanButton_progressColors);
  v4 = *(void **)&self->super.autoModeLabel[OBJC_IVAR____TtC7Climate16ClimateFanButton_progressColors];
  v5 = *(void **)&self->super.action[OBJC_IVAR____TtC7Climate16ClimateFanButton_progressColors];
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate16ClimateFanButton_fan));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate16ClimateFanButton_progressCircle));
  v6 = (char *)self + OBJC_IVAR____TtC7Climate16ClimateFanButton_trackerUUID;
  uint64_t v7 = type metadata accessor for UUID();
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);

  v8(v6, v7);
}

- (CAFService)service
{
  return (CAFService *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                               + OBJC_IVAR____TtC7Climate16ClimateFanButton_fan));
}

- (void)siblingDidStartSliding
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Climate16ClimateFanButton_shouldIgnoreCarUpdates) = 1;
}

- (void)siblingDidUpdateWithProgress:(double)a3
{
  v4 = self;
  sub_1000839DC(a3);
}

- (void)siblingDidStopSlidingWithWasIncreasing:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Climate16ClimateFanButton_shouldIgnoreCarUpdates) = 0;
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC7Climate16ClimateFanButton_fan);
  v4 = self;
  sub_1000825B0((float)[v3 fanLevel]);
}

@end