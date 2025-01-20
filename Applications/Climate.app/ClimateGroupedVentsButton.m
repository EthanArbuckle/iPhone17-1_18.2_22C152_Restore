@interface ClimateGroupedVentsButton
- (_TtC7Climate25ClimateGroupedVentsButton)init;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)appMovedToForeground;
- (void)drawRect:(CGRect)a3;
- (void)showAutoModeUI;
- (void)showDisabledUI;
- (void)showStackUI;
- (void)updateAutoModeLabelWithIsVisible:(BOOL)a3 isAnimated:(BOOL)a4 animationDelay:(double)a5;
@end

@implementation ClimateGroupedVentsButton

- (_TtC7Climate25ClimateGroupedVentsButton)init
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC7Climate25ClimateGroupedVentsButton_type) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Climate25ClimateGroupedVentsButton_isAnimatingFromDisabled) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Climate25ClimateGroupedVentsButton____lazy_storage___autoModeCenterYConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Climate25ClimateGroupedVentsButton____lazy_storage___stackView) = 0;

  result = (_TtC7Climate25ClimateGroupedVentsButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)appMovedToForeground
{
  v2 = self;
  sub_1000182F8();
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_100018740(x, y, width, height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ClimateGroupedVentsButton();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[ClimateGroupedVentsButton hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_100007310(0, (unint64_t *)&qword_1000E7AB0);
  id v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = static NSObject.== infix(_:_:)();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }

  return v7;
}

- (void)updateAutoModeLabelWithIsVisible:(BOOL)a3 isAnimated:(BOOL)a4 animationDelay:(double)a5
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate25ClimateGroupedVentsButton_autoModeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate25ClimateGroupedVentsButton_autoModeAnimatedConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate25ClimateGroupedVentsButton____lazy_storage___autoModeCenterYConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate25ClimateGroupedVentsButton____lazy_storage___stackView);
}

- (void)showAutoModeUI
{
  v2 = self;
  sub_100019B94();
}

- (void)showDisabledUI
{
  v2 = self;
  sub_100019EE0();
}

- (void)showStackUI
{
  v2 = self;
  sub_10001A9E8();
}

@end