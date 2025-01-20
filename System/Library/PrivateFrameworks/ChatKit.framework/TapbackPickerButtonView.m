@interface TapbackPickerButtonView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (void)interfaceStyleChanged;
- (void)longPressRecognized:(id)a3;
@end

@implementation TapbackPickerButtonView

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)longPressRecognized:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F71F924(v4);
}

- (void)interfaceStyleChanged
{
  v2 = self;
  id v3 = [(TapbackPickerButtonView *)v2 traitCollection];
  (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v2->super.super.super.super.super.isa) + 0xF0))();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit23TapbackPickerButtonView_longPressGestureRecognizer));
}

@end