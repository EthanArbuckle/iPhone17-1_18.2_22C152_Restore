@interface TTRIVibrantTemplateImageView
- (CGSize)intrinsicContentSize;
- (_TtC21RemindersSiriUIPlugin28TTRIVibrantTemplateImageView)initWithCoder:(id)a3;
- (_TtC21RemindersSiriUIPlugin28TTRIVibrantTemplateImageView)initWithEffect:(id)a3;
@end

@implementation TTRIVibrantTemplateImageView

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIVibrantTemplateImageView_imageView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC21RemindersSiriUIPlugin28TTRIVibrantTemplateImageView)initWithCoder:(id)a3
{
  return (_TtC21RemindersSiriUIPlugin28TTRIVibrantTemplateImageView *)sub_BB18(a3);
}

- (_TtC21RemindersSiriUIPlugin28TTRIVibrantTemplateImageView)initWithEffect:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC21RemindersSiriUIPlugin28TTRIVibrantTemplateImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIVibrantTemplateImageView_image));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC21RemindersSiriUIPlugin28TTRIVibrantTemplateImageView_imageView);
}

@end