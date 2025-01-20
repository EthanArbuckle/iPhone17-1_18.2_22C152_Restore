@interface BundleSearchResultContentView
- (_TtC18ASMessagesProvider29BundleSearchResultContentView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider29BundleSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BundleSearchResultContentView

- (_TtC18ASMessagesProvider29BundleSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider29BundleSearchResultContentView *)sub_70A698(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider29BundleSearchResultContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider29BundleSearchResultContentView_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC18ASMessagesProvider29BundleSearchResultContentView_bundleView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BundleView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC18ASMessagesProvider29BundleSearchResultContentView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_70A8F8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29BundleSearchResultContentView_lockupView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider29BundleSearchResultContentView_bundleView);
}

@end