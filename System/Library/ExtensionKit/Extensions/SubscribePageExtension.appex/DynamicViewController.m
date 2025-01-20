@interface DynamicViewController
- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 URL:(id)a4;
- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4;
- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4;
- (_TtC22SubscribePageExtension21DynamicViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension21DynamicViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation DynamicViewController

- (_TtC22SubscribePageExtension21DynamicViewController)initWithCoder:(id)a3
{
  *(void *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_dynamicDelegate] = 0;
  *(void *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_gridPresenter] = 0;
  v4 = &self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_gridView];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  id v5 = a3;

  result = (_TtC22SubscribePageExtension21DynamicViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_100214F98((unint64_t *)&unk_10093F200, v4, (void (*)(uint64_t))type metadata accessor for DynamicViewController);
  id v5 = self;
  sub_100761FC0();
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(DynamicViewController *)&v6 viewDidLoad];
}

- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
}

- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
}

- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4
{
}

- (_TtC22SubscribePageExtension21DynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4
{
}

- (_TtC22SubscribePageExtension21DynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension21DynamicViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  v3 = *(void **)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC22SubscribePageExtension21DynamicViewController_gridView];
}

@end