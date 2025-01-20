@interface BundleChildView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension15BundleChildView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension15BundleChildView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BundleChildView

- (_TtC20ProductPageExtension15BundleChildView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension15BundleChildView *)sub_1000544CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension15BundleChildView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100054CD4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100054878();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_100054F3C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15BundleChildView_icon));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension15BundleChildView_titleLabel);
}

@end