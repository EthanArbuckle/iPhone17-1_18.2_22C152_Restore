@interface TapbackPickerGradientMaskView
- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF329TapbackPickerGradientMaskView)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF329TapbackPickerGradientMaskView)initWithFrame:(CGRect)a3;
@end

@implementation TapbackPickerGradientMaskView

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF329TapbackPickerGradientMaskView)initWithCoder:(id)a3
{
  result = (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF329TapbackPickerGradientMaskView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF329TapbackPickerGradientMaskView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerGradientMaskView();
  v3 = -[TapbackPickerCircleView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v4 = self;
  v5 = v3;
  id v6 = objc_msgSend(v4, sel_whiteColor);
  [(TapbackPickerGradientMaskView *)v5 setBackgroundColor:v6];

  return v5;
}

@end