@interface IconGridView
- (_TtC18ASMessagesProvider12IconGridView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider12IconGridView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IconGridView

- (_TtC18ASMessagesProvider12IconGridView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5420B0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_541490();
}

- (_TtC18ASMessagesProvider12IconGridView)initWithFrame:(CGRect)a3
{
  result = (_TtC18ASMessagesProvider12IconGridView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider12IconGridView_viewPool;
  uint64_t v4 = sub_FD50(&qword_962888);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_release();
}

@end