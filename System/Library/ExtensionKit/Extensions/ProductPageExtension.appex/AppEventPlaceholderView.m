@interface AppEventPlaceholderView
- (_TtC20ProductPageExtension23AppEventPlaceholderView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23AppEventPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppEventPlaceholderView

- (_TtC20ProductPageExtension23AppEventPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23AppEventPlaceholderView *)sub_1005A76BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23AppEventPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005A7CDC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005A79A4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23AppEventPlaceholderView_formattedDatePlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension23AppEventPlaceholderView_appEventPlaceholder);
}

@end