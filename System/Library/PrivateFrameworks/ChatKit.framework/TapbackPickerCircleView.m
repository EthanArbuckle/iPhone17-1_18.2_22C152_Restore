@interface TapbackPickerCircleView
- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF323TapbackPickerCircleView)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF323TapbackPickerCircleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TapbackPickerCircleView

- (void)layoutSubviews
{
  v2 = self;
  sub_18F6BCFCC();
}

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF323TapbackPickerCircleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerCircleView();
  return -[TapbackPickerCircleView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF323TapbackPickerCircleView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackPickerCircleView();
  return [(TapbackPickerCircleView *)&v5 initWithCoder:a3];
}

@end