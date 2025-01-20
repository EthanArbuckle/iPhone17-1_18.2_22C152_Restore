@interface UIKitNavigationController
+ (BOOL)_isFromSwiftUI;
- (BOOL)_canShowWhileLocked;
- (BOOL)_supportsDataDrivenNavigation;
- (_TtC7SwiftUI25UIKitNavigationController)initWithCoder:(id)a3;
- (_TtC7SwiftUI25UIKitNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC7SwiftUI25UIKitNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7SwiftUI25UIKitNavigationController)initWithRootViewController:(id)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_observeScrollViewGeometryAffectingContentBottomDidChange:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIKitNavigationController

- (BOOL)_supportsDataDrivenNavigation
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitNavigationController_isDataDriven);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  UIKitNavigationController._observeScrollViewDidScroll(_:)(v4);
}

- (void)_observeScrollViewGeometryAffectingContentBottomDidChange:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  UIKitNavigationController._observeScrollViewGeometryAffectingContentBottomDidChange(_:)(v4);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  UIKitNavigationController.viewWillLayoutSubviews()();
}

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI25UIKitNavigationController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  return (_TtC7SwiftUI25UIKitNavigationController *)UIKitNavigationController.init(rootViewController:)(a3);
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIViewController);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for UIKitNavigationController();
  [(UIKitNavigationController *)&v8 setViewControllers:isa animated:v4];

  swift_bridgeObjectRelease();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for UIKitNavigationController();
  id v4 = v11.receiver;
  [(UIKitNavigationController *)&v11 viewDidAppear:v3];
  id v5 = objc_msgSend(v4, sel_delegate, v11.receiver, v11.super_class);
  if (v5)
  {
    id v6 = v5;
    swift_getObjectType();
    uint64_t v7 = swift_conformsToProtocol2();
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    if (v7) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
    if (v9)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(id, BOOL, uint64_t, uint64_t))(v8 + 8))(v4, v3, ObjectType, v8);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC7SwiftUI25UIKitNavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized UIKitNavigationController.init(coder:)();
}

- (BOOL)_canShowWhileLocked
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitNavigationController_isSecure);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = (UIViewController *)a3;
  uint64_t v7 = self;
  UIKitNavigationController.pushViewController(_:animated:)(v6, a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  UIKitNavigationController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC7SwiftUI25UIKitNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC7SwiftUI25UIKitNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI25UIKitNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_release();
  _s7SwiftUI16PreferenceValuesV5ValueVy_AA019PresentationOptionsC0VGWOhTm_0((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25UIKitNavigationController_navigationAuthority, &lazy cache variable for type metadata for NavigationAuthority?, (uint64_t)&type metadata for NavigationAuthority, MEMORY[0x1E4FBB718]);
  outlined destroy of UIKitNavigationController.PlatformNavigationRequestStrategy((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25UIKitNavigationController_platformNavigationPresentationStrategy);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7SwiftUI25UIKitNavigationController_backgroundHost);
}

@end