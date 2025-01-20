@interface DOCNavigationController
- (_TtC11SaveToFiles23DOCNavigationController)init;
- (_TtC11SaveToFiles23DOCNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC11SaveToFiles23DOCNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11SaveToFiles23DOCNavigationController)initWithRootViewController:(id)a3;
@end

@implementation DOCNavigationController

- (_TtC11SaveToFiles23DOCNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  result = (_TtC11SaveToFiles23DOCNavigationController *)sub_1004D2DC0();
  __break(1u);
  return result;
}

- (_TtC11SaveToFiles23DOCNavigationController)init
{
  type metadata accessor for DOCNavigationBar();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCNavigationController();
  return [(DOCNavigationController *)&v5 initWithNavigationBarClass:ObjCClassFromMetadata toolbarClass:0];
}

- (_TtC11SaveToFiles23DOCNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC11SaveToFiles23DOCNavigationController *)sub_10031E508(a3);
}

- (_TtC11SaveToFiles23DOCNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC11SaveToFiles23DOCNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end