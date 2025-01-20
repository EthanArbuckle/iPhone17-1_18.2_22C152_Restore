@interface ClimateGroupedVentsAutoModeButton
- (BOOL)isHighlighted;
- (_TtC7Climate33ClimateGroupedVentsAutoModeButton)init;
- (void)setHighlighted:(BOOL)a3;
- (void)updateAutoModeLabelWithIsVisible:(BOOL)a3 isAnimated:(BOOL)a4 animationDelay:(double)a5;
@end

@implementation ClimateGroupedVentsAutoModeButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateGroupedVentsAutoModeButton();
  return [(ClimateButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClimateGroupedVentsAutoModeButton();
  v4 = (char *)v5.receiver;
  [(ClimateButton *)&v5 setHighlighted:v3];
  [*(id *)&v4[OBJC_IVAR____TtC7Climate33ClimateGroupedVentsAutoModeButton_primaryButton] setHighlighted:[v4 isHighlighted]];
}

- (void)updateAutoModeLabelWithIsVisible:(BOOL)a3 isAnimated:(BOOL)a4 animationDelay:(double)a5
{
}

- (_TtC7Climate33ClimateGroupedVentsAutoModeButton)init
{
  *(void *)&self->super.autoModeLabel[OBJC_IVAR____TtC7Climate33ClimateGroupedVentsAutoModeButton_delegate] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR____TtC7Climate33ClimateGroupedVentsAutoModeButton_primaryButton;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)[objc_allocWithZone((Class)type metadata accessor for ClimateStepperButton()) init];

  result = (_TtC7Climate33ClimateGroupedVentsAutoModeButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100026DD0((uint64_t)self + OBJC_IVAR____TtC7Climate33ClimateGroupedVentsAutoModeButton_delegate);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate33ClimateGroupedVentsAutoModeButton_primaryButton);
}

@end