@interface StoreTabBarController
- (NSArray)keyCommands;
- (_TtC20ProductPageExtension21StoreTabBarController)init;
- (_TtC20ProductPageExtension21StoreTabBarController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension21StoreTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC20ProductPageExtension21StoreTabBarController)initWithTabs:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)accountPageViewControllerDidFinish:(id)a3;
- (void)handleSearchKeyCommandWithCommand:(id)a3;
- (void)handleTabSwitchKeyCommandWithCommand:(id)a3;
@end

@implementation StoreTabBarController

- (_TtC20ProductPageExtension21StoreTabBarController)init
{
  return [(StoreTabBarController *)self initWithNibName:0 bundle:0];
}

- (_TtC20ProductPageExtension21StoreTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10077BCB0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC20ProductPageExtension21StoreTabBarController *)sub_10016B9A4(v5, v7, a4);
}

- (_TtC20ProductPageExtension21StoreTabBarController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension21StoreTabBarController_objectGraph) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension21StoreTabBarController_tabChangeDelegate) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension21StoreTabBarController *)sub_10077D120();
  __break(1u);
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  id v5 = [(StoreTabBarController *)v4 selectedViewController];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [v5 supportedInterfaceOrientations];
  }
  else
  {
    v9.receiver = v4;
    v9.super_class = ObjectType;
    id v7 = [(StoreTabBarController *)&v9 supportedInterfaceOrientations];
  }
  return (unint64_t)v7;
}

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = sub_10016C058();

  if (v3)
  {
    sub_100019840(0, (unint64_t *)&qword_10094C750);
    v4.super.isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)handleTabSwitchKeyCommandWithCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10016C1E4(v4);
}

- (void)handleSearchKeyCommandWithCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10016CDE4();
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
}

- (_TtC20ProductPageExtension21StoreTabBarController)initWithTabs:(id)a3
{
  result = (_TtC20ProductPageExtension21StoreTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension21StoreTabBarController_tabChangeDelegate);
}

@end