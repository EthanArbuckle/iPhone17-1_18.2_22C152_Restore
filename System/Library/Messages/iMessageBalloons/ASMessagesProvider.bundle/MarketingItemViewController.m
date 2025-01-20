@interface MarketingItemViewController
- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4;
- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4;
- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6;
- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5;
- (void)viewDidLoad;
@end

@implementation MarketingItemViewController

- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithCoder:(id)a3
{
  *(void *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC18ASMessagesProvider27MarketingItemViewController_dynamicDelegate] = 0;
  *(void *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC18ASMessagesProvider27MarketingItemViewController_gridPresenter] = 0;
  v4 = &self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC18ASMessagesProvider27MarketingItemViewController_gridView];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  id v5 = a3;

  result = (_TtC18ASMessagesProvider27MarketingItemViewController *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_52E20((unint64_t *)&unk_952550, v4, (void (*)(uint64_t))type metadata accessor for MarketingItemViewController);
  id v5 = self;
  sub_778090();
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(MarketingItemViewController *)&v6 viewDidLoad];
}

- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  result = (_TtC18ASMessagesProvider27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5
{
  swift_unknownObjectRetain();
  result = (_TtC18ASMessagesProvider27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6
{
  id v6 = a5;
  swift_unknownObjectRetain();
  result = (_TtC18ASMessagesProvider27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  result = (_TtC18ASMessagesProvider27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4
{
  uint64_t v4 = sub_76BC30();
  __chkstk_darwin(v4 - 8);
  sub_76BBF0();
  swift_unknownObjectRetain();
  result = (_TtC18ASMessagesProvider27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18ASMessagesProvider27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  v3 = *(void **)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC18ASMessagesProvider27MarketingItemViewController_gridView];
}

@end