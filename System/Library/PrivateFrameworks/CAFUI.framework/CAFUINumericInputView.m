@interface CAFUINumericInputView
- (void)buttonTouchCancelWithSender:(id)a3;
- (void)buttonTouchDownWithSender:(id)a3;
- (void)buttonTouchUpWithSender:(id)a3;
- (void)buttonValueChangedWithSender:(id)a3;
- (void)dealloc;
- (void)sliderChangedWithSender:(id)a3;
@end

@implementation CAFUINumericInputView

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5CAFUI21CAFUINumericInputView_touchTimer);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5CAFUI21CAFUINumericInputView_touchTimer) = 0;
  v3 = self;

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CAFUINumericInputView();
  [(CAFUINumericInputView *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI21CAFUINumericInputView_decrementButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI21CAFUINumericInputView_incrementButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI21CAFUINumericInputView_touchTimer));

  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5CAFUI21CAFUINumericInputView_slider);
}

- (void)buttonTouchDownWithSender:(id)a3
{
  objc_super v4 = (UIControl *)a3;
  v5 = self;
  CAFUINumericInputView.buttonTouchDown(sender:)(v4);
}

- (void)buttonTouchUpWithSender:(id)a3
{
  objc_super v4 = (UIControl *)a3;
  v5 = self;
  [(UIControl *)v4 sendActionsForControlEvents:4096];
  CAFUINumericInputView.buttonTouchCancel(sender:)(v4);
}

- (void)buttonTouchCancelWithSender:(id)a3
{
  objc_super v4 = (UIControl *)a3;
  v5 = self;
  CAFUINumericInputView.buttonTouchCancel(sender:)(v4);
}

- (void)buttonValueChangedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  CAFUINumericInputView.buttonValueChanged(sender:)();
}

- (void)sliderChangedWithSender:(id)a3
{
  id v4 = (UISlider *)a3;
  v5 = self;
  CAFUINumericInputView.sliderChanged(sender:)(v4);
}

@end