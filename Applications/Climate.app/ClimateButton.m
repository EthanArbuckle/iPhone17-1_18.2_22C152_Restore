@interface ClimateButton
- (BOOL)isHighlighted;
- (_TtC7Climate13ClimateButton)init;
- (_TtC7Climate13ClimateButton)initWithCoder:(id)a3;
- (_TtC7Climate13ClimateButton)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)longPressGestureTriggered:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)touchUpInsideActionTriggered;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateAutoModeLabelWithIsVisible:(BOOL)a3 isAnimated:(BOOL)a4 animationDelay:(double)a5;
@end

@implementation ClimateButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateButton();
  return [(ClimateButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClimateButton();
  id v4 = v5.receiver;
  [(ClimateButton *)&v5 setHighlighted:v3];
  sub_100060140();
}

- (_TtC7Climate13ClimateButton)init
{
  return (_TtC7Climate13ClimateButton *)ClimateButton.init()();
}

- (_TtC7Climate13ClimateButton)initWithCoder:(id)a3
{
  id v3 = a3;
  _s7Climate0A6ButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  v2 = self;
  ClimateButton.layoutSubviews()();
}

- (void)touchUpInsideActionTriggered
{
  v2 = self;
  ClimateButton.touchUpInsideActionTriggered()();
}

- (void)longPressGestureTriggered:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  ClimateButton.longPressGestureTriggered(_:)(v4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateButton();
  id v2 = v3.receiver;
  [(ClimateButton *)&v3 didMoveToSuperview];
  sub_10007AB50();
}

- (_TtC7Climate13ClimateButton)initWithFrame:(CGRect)a3
{
  result = (_TtC7Climate13ClimateButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate13ClimateButton_autoModeLabel));
  sub_100005690(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC7Climate13ClimateButton_action));
  sub_100026DD0((uint64_t)self + OBJC_IVAR____TtC7Climate13ClimateButton_popoverDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate13ClimateButton____lazy_storage___imageSymbolConfiguration));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate13ClimateButton_attributedTitle));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7Climate13ClimateButton_colorConfig);
  id v4 = *(void **)&self->autoModeLabel[OBJC_IVAR____TtC7Climate13ClimateButton_colorConfig];
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate13ClimateButton_backgroundView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)updateAutoModeLabelWithIsVisible:(BOOL)a3 isAnimated:(BOOL)a4 animationDelay:(double)a5
{
  v8 = self;
  ClimateButton.updateAutoModeLabel(isVisible:isAnimated:animationDelay:)(a3, a4, a5);
}

@end