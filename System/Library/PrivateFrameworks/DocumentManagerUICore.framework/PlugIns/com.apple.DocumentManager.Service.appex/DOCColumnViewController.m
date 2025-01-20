@interface DOCColumnViewController
+ (BOOL)supportsDisplayInTraitCollection:(id)a3 availableArea:(CGSize)a4;
+ (NSString)DOCColumnViewControllerUpdatedNavigationItem;
- (BOOL)showsHierarchyIndicator;
- (NSArray)containerControllers;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (_TtC33com_apple_DocumentManager_Service23DOCColumnViewController)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_Service23DOCColumnViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC33com_apple_DocumentManager_Service23DOCColumnViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)getCellFor:(id)a3 :(id)a4;
- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4;
- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5;
- (void)removeChildViewController:(id)a3;
- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setContainerControllers:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsHierarchyIndicator:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFocusHierarchy;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DOCColumnViewController

+ (NSString)DOCColumnViewControllerUpdatedNavigationItem
{
  if (qword_10062A260 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100653D10;
  return (NSString *)v2;
}

+ (BOOL)supportsDisplayInTraitCollection:(id)a3 availableArea:(CGSize)a4
{
  sub_1004CB6C0();
  id v5 = a3;
  v6 = (void *)sub_1004CB6A0();

  if (v6) {
  return v6 != 0;
  }
}

- (NSArray)containerControllers
{
  swift_beginAccess();
  type metadata accessor for DOCBrowserContainerController();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setContainerControllers:(id)a3
{
  type metadata accessor for DOCBrowserContainerController();
  unint64_t v4 = sub_1004CD5C0();
  id v5 = self;
  sub_100049E1C(v4);
}

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  if (a4)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    id v9 = objc_allocWithZone((Class)type metadata accessor for DOCColumnViewControllerCollectionView());
    return objc_msgSend(v9, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (NSString)description
{
  NSArray v2 = self;
  sub_10004F308();

  NSString v3 = sub_1004CD2B0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC33com_apple_DocumentManager_Service23DOCColumnViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100055C1C();
}

- (void)viewDidLoad
{
  NSArray v2 = self;
  sub_10004F454();
}

- (void)viewWillAppear:(BOOL)a3
{
  unint64_t v4 = self;
  sub_10004F960(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  unint64_t v4 = self;
  sub_10004FAB8(a3);
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DOCColumnViewController *)&v3 viewWillLayoutSubviews];
  sub_10004D3EC();
  sub_10004DCD0();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DOCColumnViewController *)&v3 viewDidLayoutSubviews];
  sub_10004E0D4();
  sub_10004E444();
  sub_10004FC74();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_1000514B0(a3, a4);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000511D0(1);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_1000519BC((uint64_t)a3, a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100051C88((uint64_t)a3);
}

- (void)viewLayoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(DOCColumnViewController *)&v4 viewLayoutMarginsDidChange];
  id v3 = v2;
  sub_100055DA4(v3, v3);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1004CA770();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CA700();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1000564D4(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1004CA770();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CA700();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_100056968(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)updateFocusHierarchy
{
  id v2 = self;
  sub_10004E0D4();
}

- (NSArray)preferredFocusEnvironments
{
  id v2 = self;
  sub_1000529F8();

  sub_100027178((uint64_t *)&unk_10062BE70);
  v3.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v3.super.isa;
}

- (BOOL)showsHierarchyIndicator
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC33com_apple_DocumentManager_Service23DOCColumnViewController_showsHierarchyIndicator);
}

- (void)setShowsHierarchyIndicator:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC33com_apple_DocumentManager_Service23DOCColumnViewController_showsHierarchyIndicator);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service23DOCColumnViewController_showsHierarchyIndicator) = a3;
  if (v3 != a3)
  {
    objc_super v4 = self;
    sub_10004DCD0();
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10004DCD0();
  sub_10004FC74();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_100056A70(v5);
}

- (_TtC33com_apple_DocumentManager_Service23DOCColumnViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC33com_apple_DocumentManager_Service23DOCColumnViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC33com_apple_DocumentManager_Service23DOCColumnViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC33com_apple_DocumentManager_Service23DOCColumnViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service23DOCColumnViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service23DOCColumnViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service23DOCColumnViewController_columnViewSpecs));
  sub_10003B3B8((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service23DOCColumnViewController_pendingScrollToItem, (uint64_t *)&unk_10062C230);
  sub_10003B3B8((uint64_t)self+ OBJC_IVAR____TtC33com_apple_DocumentManager_Service23DOCColumnViewController_activeScrollToItemContext, &qword_10062C258);
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service23DOCColumnViewController_fakeLeadingSeparator);
}

- (void)removeChildViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(DOCColumnViewController *)&v7 removeChildViewController:v4];
  id v6 = v4;
  sub_100056048(v5, v6);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC33com_apple_DocumentManager_Service23DOCColumnViewController_containerControllers);
  swift_beginAccess();
  unint64_t v7 = *v6;
  if (!(v7 >> 62)) {
    return *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v10 = a3;
  v11 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = sub_1004CEE90();

  swift_bridgeObjectRelease();
  return v8;
}

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = sub_1004CA420();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  sub_1004CA3D0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = self;
  sub_10005350C((uint64_t)v9, (uint64_t)sub_100056CC8, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
}

- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4
{
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  uint64_t v11 = self;
  sub_100053C40((uint64_t)v10, a4, (uint64_t)sub_100056BCC, v9);

  swift_release();
}

- (void)getCellFor:(id)a3 :(id)a4
{
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  sub_10003AE74(0, (unint64_t *)&qword_10062AFB0);
  uint64_t v8 = sub_1004CD5C0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = self;
  sub_10005418C(v8, a4, (uint64_t)sub_100055C14, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

@end