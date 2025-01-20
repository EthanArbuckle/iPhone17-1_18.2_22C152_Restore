@interface CategoryBrickPlaceholderView
- (_TtC20ProductPageExtension28CategoryBrickPlaceholderView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension28CategoryBrickPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CategoryBrickPlaceholderView

- (_TtC20ProductPageExtension28CategoryBrickPlaceholderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC20ProductPageExtension28CategoryBrickPlaceholderView_artworkPlaceholder;
  sub_10076C770();
  v10 = self;
  id v11 = (id)sub_10076C580();
  sub_1007700D0();

  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)v11;
  v14.receiver = v10;
  v14.super_class = ObjectType;
  v12 = -[CategoryBrickPlaceholderView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  [(CategoryBrickPlaceholderView *)v12 addSubview:*(Class *)((char *)&v12->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension28CategoryBrickPlaceholderView_artworkPlaceholder)];
  return v12;
}

- (_TtC20ProductPageExtension28CategoryBrickPlaceholderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension28CategoryBrickPlaceholderView_artworkPlaceholder;
  sub_10076C770();
  id v6 = a3;
  id v7 = (id)sub_10076C580();
  sub_1007700D0();

  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v7;
  result = (_TtC20ProductPageExtension28CategoryBrickPlaceholderView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005CBB7C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28CategoryBrickPlaceholderView_artworkPlaceholder));
}

@end