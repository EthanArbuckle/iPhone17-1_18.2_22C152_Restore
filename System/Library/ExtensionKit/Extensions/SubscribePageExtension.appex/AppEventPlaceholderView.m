@interface AppEventPlaceholderView
- (_TtC22SubscribePageExtension23AppEventPlaceholderView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension23AppEventPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppEventPlaceholderView

- (_TtC22SubscribePageExtension23AppEventPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension23AppEventPlaceholderView *)sub_1000F60F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension23AppEventPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000F6710();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000F63D8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23AppEventPlaceholderView_formattedDatePlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension23AppEventPlaceholderView_appEventPlaceholder);
}

@end