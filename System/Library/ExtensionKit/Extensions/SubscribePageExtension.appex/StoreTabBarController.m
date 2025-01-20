@interface StoreTabBarController
- (NSArray)keyCommands;
- (_TtC22SubscribePageExtension21StoreTabBarController)init;
- (_TtC22SubscribePageExtension21StoreTabBarController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension21StoreTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC22SubscribePageExtension21StoreTabBarController)initWithTabs:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)accountPageViewControllerDidFinish:(id)a3;
- (void)handleSearchKeyCommandWithCommand:(id)a3;
- (void)handleTabSwitchKeyCommandWithCommand:(id)a3;
@end

@implementation StoreTabBarController

- (_TtC22SubscribePageExtension21StoreTabBarController)init
{
  return [(StoreTabBarController *)self initWithNibName:0 bundle:0];
}

- (_TtC22SubscribePageExtension21StoreTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1007675F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22SubscribePageExtension21StoreTabBarController *)sub_10070EA74(v5, v7, a4);
}

- (_TtC22SubscribePageExtension21StoreTabBarController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension21StoreTabBarController_objectGraph) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension21StoreTabBarController_tabChangeDelegate) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension21StoreTabBarController *)sub_100768A40();
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
  v3 = sub_10070F128();

  if (v3)
  {
    sub_10001A860(0, (unint64_t *)&qword_100934370);
    v4.super.isa = sub_1007677F0().super.isa;
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
  sub_10070F2B4(v4);
}

- (void)handleSearchKeyCommandWithCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10070FEB4();
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
}

- (_TtC22SubscribePageExtension21StoreTabBarController)initWithTabs:(id)a3
{
  result = (_TtC22SubscribePageExtension21StoreTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension21StoreTabBarController_tabChangeDelegate);
}

@end