@interface ClimateStepper
- (_TtC7Climate14ClimateStepper)initWithCoder:(id)a3;
- (_TtC7Climate14ClimateStepper)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)longPressTriggered:(id)a3;
@end

@implementation ClimateStepper

- (void)layoutSubviews
{
  v2 = self;
  ClimateStepper.layoutSubviews()();
}

- (void)longPressTriggered:(id)a3
{
  id v4 = a3;
  v5 = self;
  ClimateStepper.longPressTriggered(_:)(v4);
}

- (_TtC7Climate14ClimateStepper)initWithCoder:(id)a3
{
  id v3 = a3;
  _s7Climate0A7StepperC5coderACSgSo7NSCoderC_tcfc_0();
}

- (_TtC7Climate14ClimateStepper)initWithFrame:(CGRect)a3
{
  result = (_TtC7Climate14ClimateStepper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100026DD0((uint64_t)self + OBJC_IVAR____TtC7Climate14ClimateStepper_popoverDelegate);
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate14ClimateStepper_downColorConfig);
  id v4 = *(void **)&self->range[OBJC_IVAR____TtC7Climate14ClimateStepper_downColorConfig];
  swift_bridgeObjectRelease();

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate14ClimateStepper_upColorConfig);
  v6 = *(void **)&self->range[OBJC_IVAR____TtC7Climate14ClimateStepper_upColorConfig];
  swift_bridgeObjectRelease();

  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate14ClimateStepper_colorConfig);
  v8 = *(void **)&self->range[OBJC_IVAR____TtC7Climate14ClimateStepper_colorConfig];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v9 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate14ClimateStepper_backgroundView);
}

@end