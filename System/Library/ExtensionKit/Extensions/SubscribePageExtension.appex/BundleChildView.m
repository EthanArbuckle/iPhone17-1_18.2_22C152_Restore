@interface BundleChildView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension15BundleChildView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension15BundleChildView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BundleChildView

- (_TtC22SubscribePageExtension15BundleChildView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension15BundleChildView *)sub_1006EC2E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension15BundleChildView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006ECAF0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006EC694();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1006ECD58();
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
                     + OBJC_IVAR____TtC22SubscribePageExtension15BundleChildView_icon));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension15BundleChildView_titleLabel);
}

@end