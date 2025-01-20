@interface DOCNavigationController
- (_TtC33com_apple_DocumentManager_Service23DOCNavigationController)init;
- (_TtC33com_apple_DocumentManager_Service23DOCNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC33com_apple_DocumentManager_Service23DOCNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC33com_apple_DocumentManager_Service23DOCNavigationController)initWithRootViewController:(id)a3;
@end

@implementation DOCNavigationController

- (_TtC33com_apple_DocumentManager_Service23DOCNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  result = (_TtC33com_apple_DocumentManager_Service23DOCNavigationController *)sub_1004CEE70();
  __break(1u);
  return result;
}

- (_TtC33com_apple_DocumentManager_Service23DOCNavigationController)init
{
  type metadata accessor for DOCNavigationBar();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCNavigationController();
  return [(DOCNavigationController *)&v5 initWithNavigationBarClass:ObjCClassFromMetadata toolbarClass:0];
}

- (_TtC33com_apple_DocumentManager_Service23DOCNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC33com_apple_DocumentManager_Service23DOCNavigationController *)sub_1004B7340(a3);
}

- (_TtC33com_apple_DocumentManager_Service23DOCNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC33com_apple_DocumentManager_Service23DOCNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end