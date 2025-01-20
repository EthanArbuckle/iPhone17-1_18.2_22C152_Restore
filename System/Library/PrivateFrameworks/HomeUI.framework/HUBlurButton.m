@interface HUBlurButton
- (_TtC6HomeUI12HUBlurButton)initWithCoder:(id)a3;
- (_TtC6HomeUI12HUBlurButton)initWithFrame:(CGRect)a3;
@end

@implementation HUBlurButton

- (_TtC6HomeUI12HUBlurButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC6HomeUI12HUBlurButton_horizontalPadding) = (Class)0x4034000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC6HomeUI12HUBlurButton_verticalPadding) = (Class)0x4014000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC6HomeUI12HUBlurButton_cornerRadius) = (Class)0x4034000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC6HomeUI12HUBlurButton_blurBackgroundView) = 0;
  id v4 = a3;

  result = (_TtC6HomeUI12HUBlurButton *)sub_1BE9C5A78();
  __break(1u);
  return result;
}

- (_TtC6HomeUI12HUBlurButton)initWithFrame:(CGRect)a3
{
  return (_TtC6HomeUI12HUBlurButton *)HUBlurButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI12HUBlurButton_blurBackgroundView));
}

@end