@interface MFNavigationController
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (_TtC16MagnifierSupport22MFNavigationController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport22MFNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC16MagnifierSupport22MFNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC16MagnifierSupport22MFNavigationController)initWithRootViewController:(id)a3;
@end

@implementation MFNavigationController

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport22MFNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MFNavigationController();
  return [(MFNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC16MagnifierSupport22MFNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC16MagnifierSupport22MFNavigationController *)sub_2358BFF30(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for MFNavigationController, (SEL *)&selRef_initWithRootViewController_);
}

- (_TtC16MagnifierSupport22MFNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_235949AC8();
    id v6 = a4;
    objc_super v7 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    objc_super v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MFNavigationController();
  v9 = [(MFNavigationController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC16MagnifierSupport22MFNavigationController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport22MFNavigationController *)sub_2358C0018(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for MFNavigationController);
}

@end