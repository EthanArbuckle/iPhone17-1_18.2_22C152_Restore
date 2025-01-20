@interface NavigationBarManualCheckLayoutMarginsChange
- (_TtC20ProductPageExtension43NavigationBarManualCheckLayoutMarginsChange)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension43NavigationBarManualCheckLayoutMarginsChange)initWithFrame:(CGRect)a3;
- (void)layoutMarginsDidChange;
@end

@implementation NavigationBarManualCheckLayoutMarginsChange

- (void)layoutMarginsDidChange
{
  v2 = self;
  sub_1000478DC();
}

- (_TtC20ProductPageExtension43NavigationBarManualCheckLayoutMarginsChange)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtension43NavigationBarManualCheckLayoutMarginsChange__cachedLayoutMargins;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[NavigationBarManualCheckLayoutMarginsChange initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC20ProductPageExtension43NavigationBarManualCheckLayoutMarginsChange)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtension43NavigationBarManualCheckLayoutMarginsChange__cachedLayoutMargins;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[32] = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(NavigationBarManualCheckLayoutMarginsChange *)&v8 initWithCoder:a3];
}

@end