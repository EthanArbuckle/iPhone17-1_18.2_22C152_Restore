@interface TapbackPickerCellBlurContainerView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView)initWithFrame:(CGRect)a3;
@end

@implementation TapbackPickerCellBlurContainerView

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView_hasActiveBlurFilter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView____lazy_storage___blurFilter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView_activeAnimationCount) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerCellBlurContainerView();
  return -[TapbackPickerCellBlurContainerView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView_hasActiveBlurFilter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView____lazy_storage___blurFilter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView_activeAnimationCount) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackPickerCellBlurContainerView();
  return [(TapbackPickerCellBlurContainerView *)&v5 initWithCoder:a3];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18F7B97E0();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  v7 = self;
  char v8 = sub_18F6BC4C8(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF334TapbackPickerCellBlurContainerView____lazy_storage___blurFilter));
}

@end