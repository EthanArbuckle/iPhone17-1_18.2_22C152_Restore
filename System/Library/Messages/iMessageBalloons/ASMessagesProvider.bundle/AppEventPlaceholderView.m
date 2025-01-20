@interface AppEventPlaceholderView
- (_TtC18ASMessagesProvider23AppEventPlaceholderView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider23AppEventPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppEventPlaceholderView

- (_TtC18ASMessagesProvider23AppEventPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider23AppEventPlaceholderView *)sub_124A8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider23AppEventPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_125108();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_124D74();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider23AppEventPlaceholderView_formattedDatePlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider23AppEventPlaceholderView_appEventPlaceholder);
}

@end