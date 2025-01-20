@interface DOCNavigationController
- (_TtC14RecentsAvocado23DOCNavigationController)init;
- (_TtC14RecentsAvocado23DOCNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC14RecentsAvocado23DOCNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC14RecentsAvocado23DOCNavigationController)initWithRootViewController:(id)a3;
@end

@implementation DOCNavigationController

- (_TtC14RecentsAvocado23DOCNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  result = (_TtC14RecentsAvocado23DOCNavigationController *)sub_1004CF6B0();
  __break(1u);
  return result;
}

- (_TtC14RecentsAvocado23DOCNavigationController)init
{
  type metadata accessor for DOCNavigationBar();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCNavigationController();
  return [(DOCNavigationController *)&v5 initWithNavigationBarClass:ObjCClassFromMetadata toolbarClass:0];
}

- (_TtC14RecentsAvocado23DOCNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC14RecentsAvocado23DOCNavigationController *)sub_1001D4458(a3);
}

- (_TtC14RecentsAvocado23DOCNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC14RecentsAvocado23DOCNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end