@interface DOCItemInfoContentViewController
+ (BOOL)itemTapDrillsIntoNode:(id)a3;
- (BOOL)showsItemLocation;
- (BOOL)showsShareButton;
- (UIEdgeInsets)layoutMargins;
- (UIScrollView)scrollView;
- (_TtC14RecentsAvocado32DOCItemInfoContentViewController)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado32DOCItemInfoContentViewController)initWithConfiguration:(id)a3 nodes:(id)a4 allowOpenButton:(BOOL)a5 documentManager:(id)a6 actionManager:(id)a7 actionDelegate:(id)a8;
- (_TtC14RecentsAvocado32DOCItemInfoContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP14RecentsAvocado30DOCItemInfoContentTagsDelegate_)tagsWorkflowDelegate;
- (_TtP14RecentsAvocado34DOCBrowserContainedActionReporting_)actionReporting;
- (double)layoutHeightForWidth:(double)a3;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)didTapAttributionView;
- (void)doc_startPreheatIfNecessary;
- (void)documentPreviewTappedWithSender:(id)a3;
- (void)loadView;
- (void)nodeDownloadButton:(id)a3 downloadingNode:(id)a4 encounteredError:(id)a5;
- (void)nodeDownloadButton:(id)a3 requestedOpeningNode:(id)a4;
- (void)openSelectedItem:(id)a3;
- (void)setActionReporting:(id)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setScrollView:(id)a3;
- (void)setShowsItemLocation:(BOOL)a3;
- (void)setShowsShareButton:(BOOL)a3;
- (void)setTagsWorkflowDelegate:(id)a3;
- (void)tagsCollectionItem:(id)a3 didDeleteTag:(id)a4;
- (void)tagsCollectionView:(id)a3 didSelectAddTagButton:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DOCItemInfoContentViewController

- (UIEdgeInsets)layoutMargins
{
  double v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_layoutMargins);
  double v3 = *(double *)&self->configuration[OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_layoutMargins];
  double v4 = *(double *)&self->actionManager[OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_layoutMargins];
  double v5 = *(double *)&self->documentManager[OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_layoutMargins];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_layoutMargins) = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_rootContentView), "setLayoutMargins:");
}

- (_TtP14RecentsAvocado34DOCBrowserContainedActionReporting_)actionReporting
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (_TtP14RecentsAvocado34DOCBrowserContainedActionReporting_ *)Strong;
}

- (void)setActionReporting:(id)a3
{
}

- (_TtP14RecentsAvocado30DOCItemInfoContentTagsDelegate_)tagsWorkflowDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (_TtP14RecentsAvocado30DOCItemInfoContentTagsDelegate_ *)Strong;
}

- (void)setTagsWorkflowDelegate:(id)a3
{
}

- (BOOL)showsShareButton
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_showsShareButton);
}

- (void)setShowsShareButton:(BOOL)a3
{
  double v4 = self;
  sub_10004B7E4(a3);
}

- (BOOL)showsItemLocation
{
  double v2 = self;
  double v3 = sub_10004C1F8(&OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___metadataView, (uint64_t (*)(uint64_t))sub_10004C8E8);
  char v4 = v3[OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_showsItemLocation];

  return v4;
}

- (void)setShowsItemLocation:(BOOL)a3
{
  int v3 = a3;
  char v4 = self;
  double v5 = (unsigned __int8 *)sub_10004C1F8(&OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___metadataView, (uint64_t (*)(uint64_t))sub_10004C8E8);
  int v6 = v5[OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_showsItemLocation];
  id v7 = v5;
  v5[OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_showsItemLocation] = v3;
  if (v6 != v3) {
    sub_10029C968();
  }
}

- (UIScrollView)scrollView
{
  double v2 = self;
  id v3 = sub_10004F668();

  return (UIScrollView *)v3;
}

- (void)setScrollView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___scrollView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___scrollView) = (Class)a3;
  id v3 = a3;
}

- (_TtC14RecentsAvocado32DOCItemInfoContentViewController)initWithConfiguration:(id)a3 nodes:(id)a4 allowOpenButton:(BOOL)a5 documentManager:(id)a6 actionManager:(id)a7 actionDelegate:(id)a8
{
  sub_100031648(&qword_1006274C0);
  uint64_t v12 = sub_1004CDE30();
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  swift_unknownObjectRetain();
  return (_TtC14RecentsAvocado32DOCItemInfoContentViewController *)sub_10004F73C(v13, v12, a5, a6, a7);
}

- (_TtC14RecentsAvocado32DOCItemInfoContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100059E7C();
}

- (void)loadView
{
  double v2 = self;
  id v3 = sub_10004F668();
  [(DOCItemInfoContentViewController *)v2 setView:v3];
}

- (void)viewDidLoad
{
  double v2 = self;
  DOCItemInfoContentViewController.viewDidLoad()();
}

- (void)viewWillLayoutSubviews
{
  double v2 = self;
  DOCItemInfoContentViewController.viewWillLayoutSubviews()();
}

- (void)viewDidLayoutSubviews
{
  double v2 = self;
  DOCItemInfoContentViewController.viewDidLayoutSubviews()();
}

- (double)layoutHeightForWidth:(double)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_rootContentView), "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, UILayoutFittingCompressedSize.height, v3, v4);
  return v5;
}

- (void)doc_startPreheatIfNecessary
{
  if (*((unsigned char *)&self->super.super.super.isa
       + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_hasMetadataViewFinishedPreheat) == 1)
  {
    double v2 = self;
    sub_100054448();
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v6 = v8.receiver;
  id v7 = a3;
  [(DOCItemInfoContentViewController *)&v8 viewDidMoveToWindow:v7 shouldAppearOrDisappear:v4];
  if (v7)
  {
    sub_1000505F0(0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v4 = self;
  DOCItemInfoContentViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v4 = self;
  DOCItemInfoContentViewController.viewDidDisappear(_:)(a3);
}

- (void)documentPreviewTappedWithSender:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10005A130();
}

- (void)openSelectedItem:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  swift_unknownObjectRetain();
  id v6 = self;
  sub_100059030(a3, (char *)v6, ObjectType);
  swift_unknownObjectRelease();
}

- (_TtC14RecentsAvocado32DOCItemInfoContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  UIEdgeInsets result = (_TtC14RecentsAvocado32DOCItemInfoContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_actionManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_documentManager));
  double v3 = *(void **)&self->metrics[OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_metrics + 32];

  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_actionDelegate);
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_eventReporting);
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_actionReporting);
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_tagsWorkflowDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___filenameTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___shareStatusLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___kindAndSizeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___syncingErrorLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___downloadButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___metadataSectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___metadataTitleRowSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___metadataTitleRow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___showMoreMetadataButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___metadataView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___tagsTitleRowSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___tagsTitleRow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___tagsSectionTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___addTagsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___tagsCollectionView));
  sub_10005AC04(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___actionsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___shareView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___actionsRow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_rootContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_attributionView));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC14RecentsAvocado32DOCItemInfoContentViewController_rootContentView));
}

- (void)tagsCollectionItem:(id)a3 didDeleteTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  sub_10005A28C(v7);
}

- (void)tagsCollectionView:(id)a3 didSelectAddTagButton:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  _s14RecentsAvocado32DOCItemInfoContentViewControllerC014tagsCollectionF0_21didSelectAddTagButtonySo07DOCTagsiF0C_So6UIViewCtF_0(v6);
}

- (void)nodeDownloadButton:(id)a3 downloadingNode:(id)a4 encounteredError:(id)a5
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a5;
  *(void *)(v8 + 24) = self;
  v15[4] = sub_10005B6F0;
  v15[5] = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_1003A422C;
  v15[3] = &unk_1005B7728;
  v9 = _Block_copy(v15);
  id v10 = a5;
  v11 = self;
  id v12 = v10;
  id v13 = v11;
  id v14 = a3;
  swift_unknownObjectRetain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v9);

  swift_unknownObjectRelease();
}

- (void)nodeDownloadButton:(id)a3 requestedOpeningNode:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_10005A3F8(a4);

  swift_unknownObjectRelease();
}

+ (BOOL)itemTapDrillsIntoNode:(id)a3
{
  swift_unknownObjectRetain();
  if ([a3 isFolder])
  {
    unsigned __int8 v4 = objc_msgSend(a3, "doc_isCollaborationInvitation");
    swift_unknownObjectRelease();
    if ((v4 & 1) == 0) {
      return 1;
    }
  }
  else
  {
    swift_unknownObjectRelease();
  }
  return 0;
}

- (void)didTapAttributionView
{
  double v2 = self;
  sub_100057BA4();
}

@end