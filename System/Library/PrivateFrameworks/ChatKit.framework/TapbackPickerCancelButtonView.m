@interface TapbackPickerCancelButtonView
- (UIHoverGestureRecognizer)hoverRecognizer;
- (void)setHoverRecognizer:(id)a3;
@end

@implementation TapbackPickerCancelButtonView

- (UIHoverGestureRecognizer)hoverRecognizer
{
  return (UIHoverGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                             + OBJC_IVAR____TtC7ChatKit29TapbackPickerCancelButtonView_hoverRecognizer));
}

- (void)setHoverRecognizer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit29TapbackPickerCancelButtonView_hoverRecognizer);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29TapbackPickerCancelButtonView_hoverRecognizer) = (Class)a3;
  id v3 = a3;
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit29TapbackPickerCancelButtonView_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit29TapbackPickerCancelButtonView_hoverRecognizer);
}

@end