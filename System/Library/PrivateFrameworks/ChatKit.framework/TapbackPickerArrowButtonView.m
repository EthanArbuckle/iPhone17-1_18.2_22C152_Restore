@interface TapbackPickerArrowButtonView
- (void)layoutSubviews;
@end

@implementation TapbackPickerArrowButtonView

- (void)layoutSubviews
{
  v2 = self;
  sub_18F720898();
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerArrowButtonView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit28TapbackPickerArrowButtonView_gradientBackground));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit28TapbackPickerArrowButtonView_gradientMask);
}

@end