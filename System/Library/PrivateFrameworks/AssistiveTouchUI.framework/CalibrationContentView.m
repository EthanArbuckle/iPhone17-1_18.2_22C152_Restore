@interface CalibrationContentView
- (_TtC16AssistiveTouchUI22CalibrationContentView)initWithCoder:(id)a3;
- (_TtC16AssistiveTouchUI22CalibrationContentView)initWithFrame:(CGRect)a3;
@end

@implementation CalibrationContentView

- (_TtC16AssistiveTouchUI22CalibrationContentView)initWithFrame:(CGRect)a3
{
  return (_TtC16AssistiveTouchUI22CalibrationContentView *)sub_2487C58E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16AssistiveTouchUI22CalibrationContentView)initWithCoder:(id)a3
{
  result = (_TtC16AssistiveTouchUI22CalibrationContentView *)sub_2487CE840();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_blurView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_overlayView);
}

@end