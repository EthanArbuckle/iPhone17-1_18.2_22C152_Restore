@interface IconGridView
- (_TtC22SubscribePageExtension12IconGridView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension12IconGridView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IconGridView

- (_TtC22SubscribePageExtension12IconGridView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10072FD4C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10072F12C();
}

- (_TtC22SubscribePageExtension12IconGridView)initWithFrame:(CGRect)a3
{
  result = (_TtC22SubscribePageExtension12IconGridView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_viewPool;
  uint64_t v4 = sub_10000FB44(&qword_10093B900);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_release();
}

@end