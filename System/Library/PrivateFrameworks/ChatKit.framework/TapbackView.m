@interface TapbackView
- (_TtC7ChatKit11TapbackView)initWithCoder:(id)a3;
- (_TtC7ChatKit11TapbackView)initWithFrame:(CGRect)a3;
- (void)performSendAnimation;
- (void)performViewControllerAppearingAnimation;
- (void)prepareForAppearingAnimation;
@end

@implementation TapbackView

- (void)prepareForAppearingAnimation
{
}

- (void)performViewControllerAppearingAnimation
{
  v2 = self;
  sub_18F677994();
}

- (void)performSendAnimation
{
  v2 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x58);
  v3 = self;
  v2();
}

- (_TtC7ChatKit11TapbackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackView();
  return -[TapbackView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit11TapbackView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackView();
  return [(TapbackView *)&v5 initWithCoder:a3];
}

@end