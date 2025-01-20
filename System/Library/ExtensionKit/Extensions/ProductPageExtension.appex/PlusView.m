@interface PlusView
- (_TtC20ProductPageExtension8PlusView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension8PlusView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation PlusView

- (_TtC20ProductPageExtension8PlusView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension8PlusView_plusColor) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension8PlusView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_100625294(x, y, width, height);
}

- (_TtC20ProductPageExtension8PlusView)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtension8PlusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end