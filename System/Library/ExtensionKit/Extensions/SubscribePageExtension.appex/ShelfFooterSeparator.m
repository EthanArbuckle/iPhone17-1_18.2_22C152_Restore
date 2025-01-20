@interface ShelfFooterSeparator
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtC22SubscribePageExtension20ShelfFooterSeparator)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20ShelfFooterSeparator)initWithFrame:(CGRect)a3;
@end

@implementation ShelfFooterSeparator

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 1.0;
  result.height = v3;
  return result;
}

- (_TtC22SubscribePageExtension20ShelfFooterSeparator)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[ShelfFooterSeparator initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC22SubscribePageExtension20ShelfFooterSeparator)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ShelfFooterSeparator *)&v5 initWithCoder:a3];
}

@end