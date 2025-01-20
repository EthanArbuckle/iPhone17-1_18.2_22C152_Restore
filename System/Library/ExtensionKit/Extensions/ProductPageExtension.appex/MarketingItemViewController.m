@interface MarketingItemViewController
- (_TtC20ProductPageExtension27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4;
- (_TtC20ProductPageExtension27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (_TtC20ProductPageExtension27MarketingItemViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4;
- (_TtC20ProductPageExtension27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC20ProductPageExtension27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6;
- (_TtC20ProductPageExtension27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5;
- (void)viewDidLoad;
@end

@implementation MarketingItemViewController

- (_TtC20ProductPageExtension27MarketingItemViewController)initWithCoder:(id)a3
{
  *(void *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension27MarketingItemViewController_dynamicDelegate] = 0;
  *(void *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension27MarketingItemViewController_gridPresenter] = 0;
  v4 = &self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension27MarketingItemViewController_gridView];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  id v5 = a3;

  result = (_TtC20ProductPageExtension27MarketingItemViewController *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_100025880((unint64_t *)&unk_10094B840, v4, (void (*)(uint64_t))type metadata accessor for MarketingItemViewController);
  id v5 = self;
  sub_100776630();
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(MarketingItemViewController *)&v6 viewDidLoad];
}

- (_TtC20ProductPageExtension27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  result = (_TtC20ProductPageExtension27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5
{
  swift_unknownObjectRetain();
  result = (_TtC20ProductPageExtension27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6
{
  id v6 = a5;
  swift_unknownObjectRetain();
  result = (_TtC20ProductPageExtension27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  result = (_TtC20ProductPageExtension27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4
{
  uint64_t v4 = sub_10076A040();
  __chkstk_darwin(v4 - 8);
  sub_10076A000();
  swift_unknownObjectRetain();
  result = (_TtC20ProductPageExtension27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20ProductPageExtension27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  v3 = *(void **)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC20ProductPageExtension27MarketingItemViewController_gridView];
}

@end