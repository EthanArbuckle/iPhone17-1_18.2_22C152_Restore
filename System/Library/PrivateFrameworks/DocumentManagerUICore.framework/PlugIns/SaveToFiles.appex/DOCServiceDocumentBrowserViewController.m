@interface DOCServiceDocumentBrowserViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)documentBrowser:(id)a3 shouldShowActivityViewControllerForDocumentURLs:(id)a4 popoverTracker:(id)a5 isContentManaged:(BOOL)a6 additionalActivities:(id)a7 activityProxy:(id)a8;
- (BOOL)establishFirstResponder;
- (_TtC11SaveToFiles39DOCServiceDocumentBrowserViewController)initWithCoder:(id)a3;
- (_TtC11SaveToFiles39DOCServiceDocumentBrowserViewController)initWithConfiguration:(id)a3;
- (id)initForOpeningContentTypes:(id)a3;
- (id)initForOpeningFilesWithContentTypes:(id)a3;
- (void)_applyBrowserStateChange:(id)a3 force:(BOOL)a4;
- (void)_clearCurrentOpenInteraction;
- (void)_dismissAllPresentedViewControllers:(BOOL)a3 completion:(id)a4;
- (void)_establishFirstResponderAndPerformKeyCommand:(id)a3;
- (void)_getAnimationInfoForDocumentAtURL:(id)a3 completion:(id)a4;
- (void)_importDocumentAtURLWrapper:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5;
- (void)_importDocumentAtURLWrapper:(id)a3 nextToDocumentAtURLWrapper:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6;
- (void)_initiateDocumentCreationWithIntent:(id)a3;
- (void)_renameDocumentAtURL:(id)a3 newName:(id)a4 completion:(id)a5;
- (void)_revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 completion:(id)a5;
- (void)_revealSymbolicLocation:(unint64_t)a3 completion:(id)a4;
- (void)_setAdditionalLeadingNavigationBarButtonItems:(id)a3;
- (void)_setAdditionalTrailingNavigationBarButtonItems:(id)a3;
- (void)_setAllowsDocumentCreation:(BOOL)a3;
- (void)_setAllowsPickingMultipleItems:(BOOL)a3;
- (void)_setCreateButtonTitle:(id)a3;
- (void)_setCustomActions:(id)a3;
- (void)_setDefaultDocumentAspectRatio:(double)a3;
- (void)_setSceneIdentifier:(id)a3;
- (void)configureUIPDocumentLandingStyleIfNecessary;
- (void)didPerformActionOn:(id)a3;
- (void)didPerformActionOn:(id)a3 overflowAction:(BOOL)a4;
- (void)documentBrowser:(id)a3 didImportDocumentAtURL:(id)a4 toDestinationURL:(id)a5;
- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4;
- (void)documentBrowser:(id)a3 failedToImportDocumentAtURL:(id)a4 error:(id)a5;
- (void)documentManagerWasCancelled:(id)a3;
- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)tabbedBrowserViewController:(id)a3 didFinishInitialLoad:(BOOL)a4 ofTab:(unint64_t)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DOCServiceDocumentBrowserViewController

- (_TtC11SaveToFiles39DOCServiceDocumentBrowserViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles39DOCServiceDocumentBrowserViewController_remoteAdditionalLeadingNavigationBarButtonItems) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles39DOCServiceDocumentBrowserViewController_remoteAdditionalTrailingNavigationBarButtonItems) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11SaveToFiles39DOCServiceDocumentBrowserViewController_hasAddedUIPBackdrop) = 0;
  uint64_t v4 = OBJC_IVAR____TtC11SaveToFiles39DOCServiceDocumentBrowserViewController_updateBarButtonTrackingViews_lastSentFramesByUUID;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_100024E48((uint64_t)_swiftEmptyArrayStorage);

  result = (_TtC11SaveToFiles39DOCServiceDocumentBrowserViewController *)sub_1004D2DC0();
  __break(1u);
  return result;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCServiceDocumentBrowserViewController();
  id v6 = a3;
  id v7 = v8.receiver;
  [(DOCServiceDocumentBrowserViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  objc_msgSend(v6, "makeKeyWindow", v8.receiver, v8.super_class);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCServiceDocumentBrowserViewController();
  id v2 = v3.receiver;
  [(DOCTabbedBrowserViewController *)&v3 viewDidLoad];
  if (objc_msgSend(v2, "enclosedInUIPDocumentLanding", v3.receiver, v3.super_class)) {
    sub_10035D62C();
  }
  [v2 setTabbedBrowserViewControllerDelegate:v2];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCServiceDocumentBrowserViewController();
  id v4 = v8.receiver;
  [(DOCTabbedBrowserViewController *)&v8 viewDidAppear:v3];
  id v5 = objc_msgSend(v4, "view", v8.receiver, v8.super_class);
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 window];

    [v7 makeKeyWindow];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_10035D838(a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)didPerformActionOn:(id)a3 overflowAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  sub_10035DB08(v6, v4);
}

- (void)didPerformActionOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10035DB08(v4, 0);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCServiceDocumentBrowserViewController();
  swift_unknownObjectRetain();
  id v4 = v5.receiver;
  [(DOCServiceDocumentBrowserViewController *)&v5 preferredContentSizeDidChangeForChildContentContainer:a3];
  objc_msgSend(a3, "preferredContentSize", v5.receiver, v5.super_class);
  objc_msgSend(v4, "setPreferredContentSize:");
  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCServiceDocumentBrowserViewController();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[DOCTabbedBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_10036EFFC;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1002923F0;
  v11[3] = &unk_1005D64F0;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:0 completion:v9];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)_setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
}

- (void)_setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
}

- (void)_revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = self;
  *(void *)(v10 + 24) = a3;
  *(unsigned char *)(v10 + 32) = a4;
  *(void *)(v10 + 40) = sub_10036F02C;
  *(void *)(v10 + 48) = v9;
  v15[4] = sub_10036EDFC;
  v15[5] = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100053418;
  v15[3] = &unk_1005D6310;
  v11 = _Block_copy(v15);
  id v12 = a3;
  v13 = self;
  id v14 = v12;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v11);

  swift_release();
}

- (void)_revealSymbolicLocation:(unint64_t)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a3;
  v8[3] = sub_10036F02C;
  v8[4] = v7;
  v8[5] = self;
  v11[4] = sub_10036EB50;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100053418;
  v11[3] = &unk_1005D60E0;
  uint64_t v9 = _Block_copy(v11);
  uint64_t v10 = self;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v9);

  swift_release();
}

- (void)_initiateDocumentCreationWithIntent:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_10036BFE4();
}

- (void)_renameDocumentAtURL:(id)a3 newName:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1004D1240();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a3;
  id v12 = self;
  sub_10036C774(v11, v8, v10, v12, (void (**)(const void *, void, void *))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)_dismissAllPresentedViewControllers:(BOOL)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  *(unsigned char *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = sub_100152C70;
  *(void *)(v8 + 40) = v7;
  v11[4] = sub_10036E8BC;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100053418;
  v11[3] = &unk_1005D5E88;
  uint64_t v9 = _Block_copy(v11);
  uint64_t v10 = self;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v9);

  swift_release();
}

- (void)_setCustomActions:(id)a3
{
  sub_100036804(0, &qword_100633AA0);
  uint64_t v4 = sub_1004D1510();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  *(void *)(v5 + 24) = v4;
  v8[4] = sub_10036E828;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100053418;
  v8[3] = &unk_1005D5DC0;
  id v6 = _Block_copy(v8);
  uint64_t v7 = self;
  swift_bridgeObjectRetain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)_setSceneIdentifier:(id)a3
{
}

- (void)_establishFirstResponderAndPerformKeyCommand:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  *(void *)(v5 + 24) = a3;
  v10[4] = sub_10036E7B8;
  v10[5] = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100053418;
  v10[3] = &unk_1005D5D20;
  id v6 = _Block_copy(v10);
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = v7;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v6);
}

- (void)_importDocumentAtURLWrapper:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = self;
  v10[4] = a4;
  v10[5] = sub_10036F02C;
  void v10[6] = v9;
  v16[4] = sub_10036E678;
  v16[5] = v10;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_100053418;
  v16[3] = &unk_1005D5BE0;
  id v11 = _Block_copy(v16);
  id v12 = a3;
  v13 = self;
  id v14 = v12;
  v15 = v13;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v11);

  swift_release();
}

- (void)_importDocumentAtURLWrapper:(id)a3 nextToDocumentAtURLWrapper:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = self;
  v12[5] = a5;
  v12[6] = sub_10036E4EC;
  v12[7] = v11;
  v20[4] = sub_10036E558;
  v20[5] = v12;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_100053418;
  v20[3] = &unk_1005D5AA0;
  v13 = _Block_copy(v20);
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  id v17 = v14;
  id v18 = v15;
  v19 = v16;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v13);

  swift_release();
}

- (void)_setAllowsDocumentCreation:(BOOL)a3
{
}

- (void)_setAllowsPickingMultipleItems:(BOOL)a3
{
}

- (void)_setCreateButtonTitle:(id)a3
{
}

- (void)_setDefaultDocumentAspectRatio:(double)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  *(double *)(v5 + 24) = a3;
  v8[4] = sub_10036E404;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100053418;
  v8[3] = &unk_1005D5938;
  id v6 = _Block_copy(v8);
  id v7 = self;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v6);
}

- (void)_clearCurrentOpenInteraction
{
  id v2 = self;
  sub_1003650B0();
}

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = sub_100099978;
  v8[4] = v7;
  v8[5] = a3;
  v13[4] = sub_10036E3C0;
  v13[5] = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100053418;
  v13[3] = &unk_1005D58C0;
  uint64_t v9 = _Block_copy(v13);
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = v10;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v9);

  swift_release();
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = sub_100099748;
  v8[4] = v7;
  v8[5] = a3;
  v13[4] = sub_10036E3B0;
  v13[5] = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100053418;
  v13[3] = &unk_1005D5820;
  uint64_t v9 = _Block_copy(v13);
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = v10;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v9);

  swift_release();
}

- (void)_getAnimationInfoForDocumentAtURL:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1003658B8(v8, (uint64_t)sub_1001119EC, v7);

  swift_release();
}

- (BOOL)documentBrowser:(id)a3 shouldShowActivityViewControllerForDocumentURLs:(id)a4 popoverTracker:(id)a5 isContentManaged:(BOOL)a6 additionalActivities:(id)a7 activityProxy:(id)a8
{
  sub_1004CE370();
  uint64_t v13 = sub_1004D1510();
  uint64_t v14 = sub_1004D1510();
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = a5;
  *(unsigned char *)(v16 + 32) = a6;
  *(void *)(v16 + 40) = v14;
  *(void *)(v16 + 48) = a8;
  swift_unknownObjectRetain_n();
  swift_unknownObjectRetain_n();
  id v17 = a3;
  id v18 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1003675B8(v13, 0, (uint64_t)sub_10036E39C, v16);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return 0;
}

- (void)documentManagerWasCancelled:(id)a3
{
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  sub_1004CE370();
  uint64_t v6 = sub_1004D1510();
  id v7 = a3;
  id v8 = self;
  sub_10036DB4C(v6);

  swift_bridgeObjectRelease();
}

- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles39DOCServiceDocumentBrowserViewController_hostProxy);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10036E2F0;
  *(void *)(v9 + 24) = v7;
  v13[4] = sub_10036E330;
  v13[5] = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100366F60;
  v13[3] = &unk_1005D5708;
  id v10 = _Block_copy(v13);
  id v11 = a3;
  id v12 = self;
  swift_retain();
  swift_release();
  [v8 _didRequestDocumentCreationWithHandler:v10];
  _Block_release(v10);

  swift_release();
}

- (void)documentBrowser:(id)a3 didImportDocumentAtURL:(id)a4 toDestinationURL:(id)a5
{
  uint64_t v7 = sub_1004CE370();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v17 - v12;
  sub_1004CE320();
  sub_1004CE320();
  id v14 = a3;
  uint64_t v15 = self;
  sub_10036DE2C((uint64_t)v13, (uint64_t)v10);

  uint64_t v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  v16(v13, v7);
}

- (void)documentBrowser:(id)a3 failedToImportDocumentAtURL:(id)a4 error:(id)a5
{
  uint64_t v8 = sub_1004CE370();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE320();
  uint64_t v12 = *(Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC11SaveToFiles39DOCServiceDocumentBrowserViewController_hostProxy);
  id v13 = a3;
  id v14 = self;
  id v15 = a5;
  sub_1004CE2C0(v16);
  id v18 = v17;
  if (v15) {
    v19 = (void *)sub_1004CE1B0();
  }
  else {
    v19 = 0;
  }
  [v12 _failedToImportDocumentAtURL:v18 error:v19];

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)initForOpeningFilesWithContentTypes:(id)a3
{
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initForOpeningContentTypes:(id)a3
{
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11SaveToFiles39DOCServiceDocumentBrowserViewController)initWithConfiguration:(id)a3
{
  id v3 = a3;
  id result = (_TtC11SaveToFiles39DOCServiceDocumentBrowserViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)tabbedBrowserViewController:(id)a3 didFinishInitialLoad:(BOOL)a4 ofTab:(unint64_t)a5
{
  if (a4)
  {
    uint64_t v7 = self;
    v11[4] = sub_1003689A4;
    v11[5] = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_100053418;
    v11[3] = &unk_1005D5398;
    uint64_t v8 = _Block_copy(v11);
    id v9 = a3;
    uint64_t v10 = self;
    [v7 performAfterCATransactionCommits:v8];
    _Block_release(v8);
  }
}

- (BOOL)establishFirstResponder
{
  id v2 = self;
  unsigned __int8 v3 = sub_100368AE8();

  return v3 & 1;
}

- (void)_applyBrowserStateChange:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = sub_1004D0100();
  __chkstk_darwin(v7);
  id v8 = a3;
  id v9 = self;
  if ([v8 documentLandingMode] != (id)-1)
  {
    [v8 documentLandingMode];
    sub_1004D1C70();
    sub_1004D0080();
    sub_1004D1C80();
    [(DOCServiceDocumentBrowserViewController *)v9 configureUIPDocumentLandingStyleIfNecessary];
  }
  uint64_t v10 = (objc_class *)type metadata accessor for DOCServiceDocumentBrowserViewController();
  v11.receiver = v9;
  v11.super_class = v10;
  [(DOCTabbedBrowserViewController *)&v11 _applyBrowserStateChange:v8 force:v4];
}

- (void)configureUIPDocumentLandingStyleIfNecessary
{
  id v2 = self;
  sub_100368EF0();
}

@end