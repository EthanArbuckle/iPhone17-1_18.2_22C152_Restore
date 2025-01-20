@interface ServiceNavigationController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC7Sidecar27ServiceNavigationController)initWithCoder:(id)a3;
- (_TtC7Sidecar27ServiceNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC7Sidecar27ServiceNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Sidecar27ServiceNavigationController)initWithRootViewController:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation ServiceNavigationController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  v2 = self;
  char v3 = sub_100011B88();

  return v3 & 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  unint64_t v3 = sub_100011C18();

  return v3;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = self;
  id v3 = sub_100011CB8();

  return (UIViewController *)v3;
}

- (_TtC7Sidecar27ServiceNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return (_TtC7Sidecar27ServiceNavigationController *)sub_100011CF0(ObjCClassMetadata, v6);
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata();
  return (_TtC7Sidecar27ServiceNavigationController *)sub_100011CF0(ObjCClassMetadata, v6);
}

- (_TtC7Sidecar27ServiceNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC7Sidecar27ServiceNavigationController *)sub_100011DCC(a3, type metadata accessor for ServiceNavigationController, (SEL *)&selRef_initWithRootViewController_);
}

- (_TtC7Sidecar27ServiceNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC7Sidecar27ServiceNavigationController *)sub_100011F14((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t))type metadata accessor for ServiceNavigationController);
}

- (_TtC7Sidecar27ServiceNavigationController)initWithCoder:(id)a3
{
  return (_TtC7Sidecar27ServiceNavigationController *)sub_100011F88(a3, type metadata accessor for ServiceNavigationController);
}

@end