@interface IconGridView
- (_TtC20ProductPageExtension12IconGridView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension12IconGridView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IconGridView

- (_TtC20ProductPageExtension12IconGridView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003D8238();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003D7618();
}

- (_TtC20ProductPageExtension12IconGridView)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtension12IconGridView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension12IconGridView_viewPool;
  uint64_t v4 = sub_10000D280(&qword_100954138);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_release();
}

@end