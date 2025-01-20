@interface BundleChildView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider15BundleChildView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider15BundleChildView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BundleChildView

- (_TtC18ASMessagesProvider15BundleChildView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider15BundleChildView *)sub_67C5B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider15BundleChildView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_67CDB8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_67C95C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_67D020();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider15BundleChildView_titleLabel);
}

@end