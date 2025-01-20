@interface DOCBrowserContainerController
- (BOOL)allowsPickingMultipleItems;
- (BOOL)establishFirstResponder;
- (BOOL)preventAppearanceForwarding;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (NSArray)additionalLeadingNavigationBarButtonItems;
- (NSArray)additionalTrailingNavigationBarButtonItems;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (_TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController)init;
- (_TtC33com_apple_DocumentManager_Service33DOCBrowserContainedViewController)contentViewController;
- (void)activateContentViewController;
- (void)didMoveToParentViewController:(id)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)getCellFor:(id)a3 :(id)a4;
- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4;
- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5;
- (void)loadView;
- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5;
- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3;
- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3;
- (void)setAllowsPickingMultipleItems:(BOOL)a3;
- (void)setContentViewController:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setPreventAppearanceForwarding:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation DOCBrowserContainerController

- (_TtC33com_apple_DocumentManager_Service33DOCBrowserContainedViewController)contentViewController
{
  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_contentViewController);
  swift_beginAccess();
  return (_TtC33com_apple_DocumentManager_Service33DOCBrowserContainedViewController *)*v2;
}

- (void)setContentViewController:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_contentViewController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BOOL)allowsPickingMultipleItems
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_allowsPickingMultipleItems);
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  v4 = self;
  sub_10046E6A0(a3);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_contentViewController);
  swift_beginAccess();
  v3 = *v2;
  if (*v2)
  {
    sub_100027178((uint64_t *)&unk_10062C9C0);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1004E5180;
    *(void *)(v4 + 32) = v3;
    sub_1004CD5E0();
  }
  id v5 = v3;
  sub_100027178((uint64_t *)&unk_10062BE70);
  v6.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v6.super.isa;
}

- (BOOL)preventAppearanceForwarding
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_preventAppearanceForwarding);
}

- (void)setPreventAppearanceForwarding:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_preventAppearanceForwarding);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_preventAppearanceForwarding) = a3;
  if (v3 == 1 && !a3)
  {
    id v5 = self;
    sub_10047264C();
  }
}

- (NSArray)additionalLeadingNavigationBarButtonItems
{
  return (NSArray *)sub_10041D5AC();
}

- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
}

- (NSArray)additionalTrailingNavigationBarButtonItems
{
  return (NSArray *)sub_10041D5AC();
}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
}

- (void)activateContentViewController
{
  uint64_t v3 = *(void *)&self->super.appearStateTracker[OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_dataSource];
  uint64_t ObjectType = swift_getObjectType();
  id v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  NSArray v6 = self;
  v5(1, ObjectType, v3);
}

- (NSString)description
{
  v2 = self;
  DOCBrowserContainerController.description.getter();

  NSString v3 = sub_1004CD2B0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)loadView
{
  type metadata accessor for DOCBrowserContainerController.DOCBrowserContainerControllerView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v4 = self;
  id v5 = [v3 init];
  [(DOCBrowserContainerController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  v2 = (char *)v5.receiver;
  [(DOCBrowserContainerController *)&v5 viewDidLoad];
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_dataSource + 8];
  uint64_t ObjectType = swift_getObjectType();
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40))(ObjectType, v3) & 1) == 0)
  {
    sub_10046FFC0();
    if (*(void *)&v2[OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_state] == 5) {
      sub_100470130(0, 0, 0);
    }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  NSArray v6 = (char *)v8.receiver;
  [(DOCBrowserContainerController *)&v8 setEditing:v5 animated:v4];
  v7 = (id *)&v6[OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_contentViewController];
  swift_beginAccess();
  [*v7 setEditing:v5 animated:v4];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  objc_super v8 = self;
  char v9 = (char)v8;
  v10 = v8;
  v12.value.super.super.super.isa = (Class)a3;
  v12.is_nil = a4;
  DOCBrowserContainerController.viewDidMove(to:shouldAppearOrDisappear:)(v12, v9);
}

- (void)willMoveToParentViewController:(id)a3
{
  uint64_t v5 = sub_1004CC1B0();
  __chkstk_darwin(v5 - 8);
  NSArray v6 = (objc_class *)type metadata accessor for DOCBrowserContainerController();
  v9.receiver = self;
  v9.super_class = v6;
  id v7 = a3;
  objc_super v8 = self;
  [(DOCBrowserContainerController *)&v9 willMoveToParentViewController:v7];
  sub_1004CC630();
  sub_1004CDD20();
  sub_1004CC1A0();
  sub_1004CDD30();
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  NSArray v6 = self;
  v9.is_nil = (char)v6;
  id v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  DOCBrowserContainerController.didMove(toParent:)(v9);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCBrowserContainerController *)&v6 traitCollectionDidChange:v4];
  sub_100472520();
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  DOCBrowserContainerController.viewWillAppear(_:)(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  id v4 = self;
  DOCBrowserContainerController.viewIsAppearing(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  DOCBrowserContainerController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  DOCBrowserContainerController.viewDidDisappear(_:)(a3);
}

- (_TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController)init
{
  result = (_TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_contentViewController));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_100475CD8(*(unint64_t *)((char *)&self->super.super.super.super.isa
                                    + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_state));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_queue));
  sub_10003B0A8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_stateReporting));
  sub_10003EA7C((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_actionReporting);
  sub_10003EA7C((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController_overlayDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCBrowserContainerController__containerNavigationItem);
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  id v4 = a3;
  id v5 = v9.receiver;
  [(DOCBrowserContainerController *)&v9 effectiveAppearanceDidChange:v4];
  id v6 = objc_msgSend(v5, "viewIfLoaded", v9.receiver, v9.super_class);
  if (v6)
  {
    id v7 = v6;
    id v8 = [v4 backgroundColor];
    [v7 setBackgroundColor:v8];

    id v4 = v7;
    id v5 = v8;
  }
}

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = sub_1004CA420();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1004CA3D0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  UIWindow_optional v12 = self;
  id v13 = sub_100473E24();
  sub_1004CA370(v14);
  v16 = v15;
  aBlock[4] = sub_100056CC8;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100092F7C;
  aBlock[3] = &unk_1005DBF18;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v13 getTransitionControllerForURL:v16 completionBlock:v17];
  _Block_release(v17);

  swift_release();
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  objc_super v9 = self;
  id v10 = sub_100473E24();
  v12[4] = sub_100056CC8;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100092F7C;
  v12[3] = &unk_1005DBEC8;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v10 getTransitionControllerForItem:v8 completionBlock:v11];
  _Block_release(v11);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  objc_super v9 = self;
  id v10 = sub_100473E24();
  v12[4] = sub_1004766DC;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100092F7C;
  v12[3] = &unk_1005DBE78;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v10 getPopoverTrackerForItem:v8 completionBlock:v11];
  _Block_release(v11);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  BOOL v5 = a4;
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = sub_100473E24();
  v14[4] = sub_100476660;
  v14[5] = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10018A6CC;
  v14[3] = &unk_1005DBE28;
  id v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  [v12 getViewFor:v10 waitForNewThumbnail:v5 :v13];
  _Block_release(v13);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)getCellFor:(id)a3 :(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = sub_100473E24();
  v12[4] = sub_1004766DC;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10046D530;
  v12[3] = &unk_1005DBDD8;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v10 getCellFor:v8 :v11];
  _Block_release(v11);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  sub_10003AE74(0, (unint64_t *)&qword_10062AFB0);
  uint64_t v8 = sub_1004CD5C0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = self;
  DOCBrowserContainerController.reveal(items:selectEvenIfVisible:completionBlock:)(v8, a4, (uint64_t)sub_100476630, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (BOOL)establishFirstResponder
{
  v2 = self;
  Swift::Bool v3 = DOCBrowserContainerController.establishFirstResponder()();

  return v3;
}

@end