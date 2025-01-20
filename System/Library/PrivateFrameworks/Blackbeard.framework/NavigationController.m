@interface NavigationController
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC10Blackbeard20NavigationController)init;
- (_TtC10Blackbeard20NavigationController)initWithCoder:(id)a3;
- (_TtC10Blackbeard20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC10Blackbeard20NavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC10Blackbeard20NavigationController)initWithRootViewController:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NavigationController

- (_TtC10Blackbeard20NavigationController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10Blackbeard20NavigationController_pictureInPictureSurrogate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10Blackbeard20NavigationController_palette) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10Blackbeard20NavigationController_paletteViewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10Blackbeard20NavigationController_pendingPresentation) = (Class)MEMORY[0x263F8EE78];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(NavigationController *)&v5 initWithNibName:0 bundle:0];
}

- (_TtC10Blackbeard20NavigationController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10Blackbeard20NavigationController_pictureInPictureSurrogate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10Blackbeard20NavigationController_palette) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10Blackbeard20NavigationController_paletteViewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10Blackbeard20NavigationController_pendingPresentation) = (Class)MEMORY[0x263F8EE78];
  id v5 = a3;

  result = (_TtC10Blackbeard20NavigationController *)sub_24925E6D0();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_24913A9FC();
}

- (void).cxx_destruct
{
  sub_248BC60C4((uint64_t)self + OBJC_IVAR____TtC10Blackbeard20NavigationController_pictureInPictureSurrogate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10Blackbeard20NavigationController_palette));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10Blackbeard20NavigationController_paletteViewController));
  swift_bridgeObjectRelease();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  id v5 = (UIViewController *)[(NavigationController *)v4 topViewController];
  if (!v5)
  {
    v8.receiver = v4;
    v8.super_class = ObjectType;
    id v5 = [(NavigationController *)&v8 childViewControllerForStatusBarStyle];
  }
  v6 = v5;

  return v6;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = (char *)v9.receiver;
  -[NavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  objc_super v8 = *(void **)&v7[OBJC_IVAR____TtC10Blackbeard20NavigationController_paletteViewController];
  if (v8) {
    objc_msgSend(v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height, v9.receiver, v9.super_class);
  }
  swift_unknownObjectRelease();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(NavigationController *)&v5 viewDidAppear:v3];
  sub_24913B298();
}

- (void)didMoveToParentViewController:(id)a3
{
  if (a3)
  {
    id v4 = self;
    id v5 = a3;
    if ([(NavigationController *)v4 isViewLoaded]) {
      sub_24913B298();
    }
  }
}

- (_TtC10Blackbeard20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC10Blackbeard20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10Blackbeard20NavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC10Blackbeard20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10Blackbeard20NavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10Blackbeard20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end