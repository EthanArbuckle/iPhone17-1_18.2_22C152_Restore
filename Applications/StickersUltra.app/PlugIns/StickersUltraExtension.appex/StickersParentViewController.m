@interface StickersParentViewController
- (BOOL)isExpanded;
- (UIEdgeInsets)additionalSafeAreaInsets;
- (_TtC22StickersUltraExtension28StickersParentViewController)initWithCoder:(id)a3;
- (_TtC22StickersUltraExtension28StickersParentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC22StickersUltraExtension28StickersParentViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (id)defaultMessagesChildViewControllerForPresentationContext:(unint64_t)a3;
- (id)dragControllerTranscriptDelegate;
- (id)stickerCollectionViewController:(id)a3 requestsMSStickerFromURL:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6 error:(id *)a7;
- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3;
- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4;
- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4;
- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6;
- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)_animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4;
- (void)_didRemoveStickerPreview;
- (void)_prepareForAddStickerFromSubjectLift;
- (void)_setPluginIdentifierToShow:(NSString *)a3 completion:(id)a4;
- (void)commitSticker:(id)a3 stickerFrame:(CGRect)a4;
- (void)commitSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5;
- (void)dealloc;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)dismissAndReloadInputViews:(BOOL)a3;
- (void)handleCloseButton;
- (void)openURL:(NSURL *)a3 applicationIdentifier:(NSString *)a4 pluginID:(NSString *)a5 completionHandler:(id)a6;
- (void)openURL:(NSURL *)a3 pluginID:(NSString *)a4 completionHandler:(id)a5;
- (void)presentAlertWithTitle:(NSString *)a3 message:(NSString *)a4 buttonTitle:(NSString *)a5 completion:(id)a6;
- (void)requestPresentationStyleExpanded:(BOOL)a3;
- (void)requestPresentationWithStickerType:(id)a3 identifier:(id)a4;
- (void)requestStickerExtensionMetadataDictionary:(id)a3;
- (void)setPhotoPickerDidDismissClosure:(id)a3;
- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4;
- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4 forPlugin:(id)a5;
- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4;
- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4 withFrame:(CGRect)a5;
- (void)stickerCollectionViewController:(id)a3 isDonePresenting:(id)a4;
- (void)stickerCollectionViewController:(id)a3 isPresenting:(id)a4;
- (void)stickerCollectionViewController:(id)a3 performTransitionForView:(id)a4 withImage:(id)a5 bounds:(CGRect)a6;
- (void)stickerCollectionViewController:(id)a3 requestsDisplayStickerFor:(id)a4 completionHandler:(id)a5;
- (void)stickerCollectionViewController:(id)a3 requestsMSStickerFromSticker:(id)a4 completionHandler:(id)a5;
- (void)stickerCollectionViewControllerPrepareForNewSticker:(id)a3 fromPhotoPicker:(BOOL)a4;
- (void)stickerCollectionViewControllerRequestsMoreStickers:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)traitStyleDidChange;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation StickersParentViewController

- (void)dealloc
{
  v3 = (void **)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_imageAnalysisInteraction);
  swift_beginAccess();
  v4 = *v3;
  *v3 = 0;
  v5 = self;

  id v6 = [self defaultCenter];
  [v6 removeObserver:v5];

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for StickersParentViewController();
  [(BaseMessagesViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_stickerProvidingViewController));
  sub_10002B264(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_photoPickerDidDismissClosure));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController__isAddingStickerMu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_rootNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_visualEffectViewBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_mainController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_stickerCollectionViewControllerPresentedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_stickerPackStripHostHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_contentControllerTopAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_stickerPackStripTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController____lazy_storage___stickerPackStripHost));
  sub_1000312B0((uint64_t)self+ OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController____lazy_storage___stickerPackStrip, (uint64_t *)&unk_1000AB940);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_imageAnalysisInteraction));
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100019378();
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v7 = self;
  id v4 = a3;
  id v5 = [(StickersParentViewController *)v7 traitCollection];
  id v6 = [v5 _presentationSemanticContext];

  if (!v4 || v6 != [v4 _presentationSemanticContext])
  {
    (*(void (**)(void))((swift_isaMask & (uint64_t)v7->super.super.super.super.super.super.isa) + 0x310))();
    sub_100019D38();
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_10001A4BC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_traitRegistration))
  {
    id v5 = self;
    swift_unknownObjectRetain();
    sub_10007A4E0();
    swift_unknownObjectRelease();
  }
  else
  {
    id v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for StickersParentViewController();
  [(StickersParentViewController *)&v7 viewWillDisappear:v3];
}

- (void)traitStyleDidChange
{
  uint64_t v3 = sub_100079310();
  __chkstk_darwin(v3);
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_rootNavigationController);
  id v5 = self;
  id v6 = v4;
  id v7 = [(StickersParentViewController *)v5 traitCollection];
  [v7 userInterfaceStyle];

  sub_10007A4B0();
  sub_100079300();
  sub_10007A4C0();
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  v2 = self;
  double v3 = sub_10001A970();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (void)_setPluginIdentifierToShow:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000074E0(&qword_1000ABB80);
  __chkstk_darwin(v7 - 8);
  double v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v10 = _Block_copy(a4);
  double v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_10007A3F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  double v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000ABC20;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000ABC28;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10002AC1C((uint64_t)v9, (uint64_t)&unk_1000ABC30, (uint64_t)v14);
  swift_release();
}

- (void)requestStickerExtensionMetadataDictionary:(id)a3
{
  double v4 = _Block_copy(a3);
  _Block_copy(v4);
  double v5 = self;
  sub_10002C1B4((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)handleCloseButton
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa) + 0x100);
  double v5 = self;
  double v3 = (void *)v2();
  if (v3)
  {
    double v4 = v3;
    (*(void (**)(void))((swift_isaMask & *v3) + 0x150))();
  }
  [(StickersParentViewController *)v5 dismiss];
}

- (void)requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  uint64_t v6 = sub_10007A250();
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = sub_10007A250();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  double v11 = self;
  sub_10001BEF4(v6, v8, v9, (unint64_t)a4);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)defaultMessagesChildViewControllerForPresentationContext:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StickersParentViewController();
  double v4 = v9.receiver;
  id v5 = [(BaseMessagesViewController *)&v9 defaultMessagesChildViewControllerForPresentationContext:a3];
  id result = [v5 view];
  if (result)
  {
    id v7 = result;
    id v8 = [self clearColor];
    [v7 setBackgroundColor:v8];

    (*(void (**)(BOOL))((swift_isaMask & *v4) + 0x288))(a3 == 0);
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10001C96C(v4);
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  id v4 = self;
  sub_10001CDB0(a3);
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  id v4 = self;
  sub_10001D254(a3);
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  id v5 = _Block_copy(a4);
  sub_10000A990(0, &qword_1000AB9A0);
  sub_10007A340();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = self;
  Class isa = sub_10007A320().super.isa;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_1000306F4;
  *(void *)(v9 + 24) = v6;
  v11[4] = sub_10002B484;
  v11[5] = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10001D780;
  v11[3] = &unk_10009BD98;
  double v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  [(StickersParentViewController *)v7 _addStickerToStoreWithRepresentations:isa completionWithStickerIDs:v10];
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  id v5 = _Block_copy(a4);
  sub_10000A990(0, &qword_1000AB9A0);
  unint64_t v6 = sub_10007A340();
  _Block_copy(v5);
  id v7 = self;
  sub_10002C754(v6, (char *)v7, (void (**)(const void *, void, void *, CGFloat, double, double, double))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = _Block_copy(a5);
  sub_10000A990(0, &qword_1000AB9A0);
  uint64_t v11 = sub_10007A340();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  double v13 = *(void (**)(uint64_t, void, uint64_t, uint64_t (*)(), uint64_t, double, double, double, double))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa) + 0x330);
  v14 = self;
  v13(v11, 0, 1, sub_10003136C, v12, x, y, width, height);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v12 = _Block_copy(a6);
  sub_10000A990(0, &qword_1000AB9A0);
  uint64_t v13 = sub_10007A340();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  v15 = *(void (**)(uint64_t, int64_t, void, uint64_t (*)(), uint64_t, double, double, double, double))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa) + 0x330);
  v16 = self;
  v15(v13, a5, 0, sub_10003136C, v14, x, y, width, height);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v11 = _Block_copy(a5);
  _Block_copy(v11);
  id v12 = a3;
  uint64_t v13 = self;
  sub_10002D264(v12, v13, v11, x, y, width, height);
  _Block_release(v11);
  _Block_release(v11);
}

- (void)_prepareForAddStickerFromSubjectLift
{
  v2 = self;
  sub_10002026C();
}

- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  unint64_t v6 = self;
  sub_1000208A4((uint64_t)sub_100030688, v5);

  swift_release();
}

- (void)_didRemoveStickerPreview
{
  v2 = self;
  sub_100020C00();
}

- (void)_animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  sub_10007A1C0();
  uint64_t v5 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa) + 0x100);
  unint64_t v6 = self;
  id v7 = (void *)v5();
  if (v7 && (id v8 = v7, v9 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v7) + 0x118))(), v8, v9))
  {
    id v10 = v9;
    sub_100079150();

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (_TtC22StickersUltraExtension28StickersParentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10007A250();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22StickersUltraExtension28StickersParentViewController *)sub_100024EA0(v5, v7, a4);
}

- (_TtC22StickersUltraExtension28StickersParentViewController)initWithCoder:(id)a3
{
  return (_TtC22StickersUltraExtension28StickersParentViewController *)sub_10002517C(a3);
}

- (_TtC22StickersUltraExtension28StickersParentViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (_TtC22StickersUltraExtension28StickersParentViewController *)sub_100025428(a3);
}

- (void)stickerCollectionViewController:(id)a3 requestsMSStickerFromSticker:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  Sticker.asMSSticker(completionHandler:)((void (*)(id, void))sub_100031368, v9);

  swift_release();
}

- (void)stickerCollectionViewController:(id)a3 requestsDisplayStickerFor:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  Sticker.asDisplaySticker(completionHandler:)((uint64_t)sub_1000304FC, v9);

  swift_release();
}

- (id)stickerCollectionViewController:(id)a3 requestsMSStickerFromURL:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6 error:(id *)a7
{
  v21 = a7;
  uint64_t v9 = sub_100078F50();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100078F30();
  uint64_t v13 = sub_10007A250();
  uint64_t v15 = v14;
  uint64_t v16 = sub_10007A250();
  id v17 = a3;
  v18 = self;
  id v19 = sub_10002DD3C((uint64_t)v12, v13, v15, v16);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v19;
}

- (void)stickerCollectionViewController:(id)a3 performTransitionForView:(id)a4 withImage:(id)a5 bounds:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = self;
  sub_10002DF28(v14, v15, x, y, width, height);
}

- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100025B98();
}

- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4 withFrame:(CGRect)a5
{
  CGRect v12 = a5;
  char v13 = 0;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  sub_10002B1FC((uint64_t)&v12, v8 + 24);
  uint64_t v9 = self;
  id v10 = a3;
  id v11 = a4;
  Sticker.asMSSticker(completionHandler:)(sub_1000314B4, v8);
  swift_release();
  sub_100025B98();
}

- (void)stickerCollectionViewControllerPrepareForNewSticker:(id)a3 fromPhotoPicker:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100026500(v6, a4);
}

- (void)setPhotoPickerDidDismissClosure:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = *(void (**)(uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa)
                                                     + 0x120);
  id v7 = self;
  swift_retain();
  v6(sub_1000304B0, v5);

  swift_release();
}

- (void)stickerCollectionViewControllerRequestsMoreStickers:(id)a3
{
}

- (BOOL)isExpanded
{
  return [(StickersParentViewController *)self presentationStyle] == (id)1;
}

- (void)stickerCollectionViewController:(id)a3 isPresenting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10002E0FC(v7);
}

- (void)stickerCollectionViewController:(id)a3 isDonePresenting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10002E200();
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_10002EF7C(a3);
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4 forPlugin:(id)a5
{
  if (a5)
  {
    uint64_t v7 = sub_10007A250();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = self;
  sub_10002F2E8(a3, v7, v9);

  swift_bridgeObjectRelease();
}

- (void)openURL:(NSURL *)a3 pluginID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1000074E0(&qword_1000ABB80);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  CGRect v12 = _Block_copy(a5);
  char v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_10007A3F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000ABBF0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1000ABBF8;
  v16[5] = v15;
  id v17 = a3;
  v18 = a4;
  id v19 = self;
  sub_10002AC1C((uint64_t)v11, (uint64_t)&unk_1000ABC00, (uint64_t)v16);
  swift_release();
}

- (void)openURL:(NSURL *)a3 applicationIdentifier:(NSString *)a4 pluginID:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_1000074E0(&qword_1000ABB80);
  __chkstk_darwin(v11 - 8);
  char v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  id v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_10007A3F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  id v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1000ABBD0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1000ABBD8;
  v18[5] = v17;
  id v19 = a3;
  uint64_t v20 = a4;
  v21 = a5;
  v22 = self;
  sub_10002AC1C((uint64_t)v13, (uint64_t)&unk_1000ABBE0, (uint64_t)v18);
  swift_release();
}

- (void)dismissAndReloadInputViews:(BOOL)a3
{
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
}

- (void)presentAlertWithTitle:(NSString *)a3 message:(NSString *)a4 buttonTitle:(NSString *)a5 completion:(id)a6
{
  uint64_t v11 = sub_1000074E0(&qword_1000ABB80);
  __chkstk_darwin(v11 - 8);
  char v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  id v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_10007A3F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  id v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1000ABB90;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1000ABBA0;
  v18[5] = v17;
  id v19 = a3;
  uint64_t v20 = a4;
  v21 = a5;
  v22 = self;
  sub_10002AC1C((uint64_t)v13, (uint64_t)&unk_1000ABBB0, (uint64_t)v18);
  swift_release();
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)commitSticker:(id)a3 stickerFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a3;
  uint64_t v11 = self;
  sub_10002A198(a3, x, y, width, height);
}

- (void)commitSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = self;
  sub_10002F60C(a3);
}

@end