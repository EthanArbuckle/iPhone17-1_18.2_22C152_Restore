@interface TTRIVibrantCompletedButton
- (_TtC21RemindersSiriUIPlugin26TTRIVibrantCompletedButton)init;
- (_TtC21RemindersSiriUIPlugin26TTRIVibrantCompletedButton)initWithCoder:(id)a3;
- (_TtC21RemindersSiriUIPlugin26TTRIVibrantCompletedButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRIVibrantCompletedButton

- (_TtC21RemindersSiriUIPlugin26TTRIVibrantCompletedButton)init
{
  return (_TtC21RemindersSiriUIPlugin26TTRIVibrantCompletedButton *)sub_BF4C();
}

- (_TtC21RemindersSiriUIPlugin26TTRIVibrantCompletedButton)initWithCoder:(id)a3
{
  return (_TtC21RemindersSiriUIPlugin26TTRIVibrantCompletedButton *)sub_C05C(a3);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRIVibrantCompletedButton();
  v2 = (char *)v4.receiver;
  [(TTRIVibrantCompletedButton *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC21RemindersSiriUIPlugin26TTRIVibrantCompletedButton_vibrantImage];
  objc_msgSend(v2, "intrinsicContentSize", v4.receiver, v4.super_class);
  [v3 frame];
  objc_msgSend(v3, "setFrame:");
}

- (_TtC21RemindersSiriUIPlugin26TTRIVibrantCompletedButton)initWithFrame:(CGRect)a3
{
  result = (_TtC21RemindersSiriUIPlugin26TTRIVibrantCompletedButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->superclass_opaque[OBJC_IVAR____TtC21RemindersSiriUIPlugin26TTRIVibrantCompletedButton_image];
}

@end