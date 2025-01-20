@interface ClimateOnButton
- (_TtC7Climate15ClimateOnButton)init;
@end

@implementation ClimateOnButton

- (_TtC7Climate15ClimateOnButton)init
{
  return (_TtC7Climate15ClimateOnButton *)sub_100088D90();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate15ClimateOnButton_highlightedBackgroundView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate15ClimateOnButton_onColor);
  v4 = *(void **)&self->super.autoModeLabel[OBJC_IVAR____TtC7Climate15ClimateOnButton_onColor];
  swift_bridgeObjectRelease();

  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate15ClimateOnButton_offColor);
  v6 = *(void **)&self->super.autoModeLabel[OBJC_IVAR____TtC7Climate15ClimateOnButton_offColor];
  id v7 = v5;
  swift_bridgeObjectRelease();
}

@end