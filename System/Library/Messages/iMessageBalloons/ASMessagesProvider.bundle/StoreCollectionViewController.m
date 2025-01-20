@interface StoreCollectionViewController
- (UICollectionView)collectionView;
- (_TtC18ASMessagesProvider29StoreCollectionViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider29StoreCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC18ASMessagesProvider29StoreCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)applicationDidBecomeActive:(id)a3;
- (void)as_viewDidBecomeFullyVisible;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)as_viewWillBecomePartiallyVisible;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)loadView;
- (void)setCollectionView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation StoreCollectionViewController

- (_TtC18ASMessagesProvider29StoreCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_737164();
}

- (UICollectionView)collectionView
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StoreCollectionViewController();
  v2 = [(StoreCollectionViewController *)&v4 collectionView];

  return v2;
}

- (void)setCollectionView:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StoreCollectionViewController();
  id v4 = v9.receiver;
  id v5 = a3;
  [(StoreCollectionViewController *)&v9 setCollectionView:v5];
  id v6 = objc_msgSend(v4, "view", v9.receiver, v9.super_class);
  if (v6)
  {
    v7 = v6;
    type metadata accessor for InsetCollectionViewControllerContentView();
    if (swift_dynamicCastClass())
    {
      id v8 = [v4 collectionView];
      swift_unknownObjectWeakAssign();

      return;
    }
  }
  __break(1u);
}

- (void)loadView
{
  v2 = self;
  sub_734E98();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_735290();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_7365F0(a3, (SEL *)&selRef_viewWillAppear_, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:));
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_735774(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_735A14(a3);
}

- (void)as_viewWillBecomeFullyVisible
{
  v2 = self;
  sub_735E08();
}

- (void)as_viewDidBecomeFullyVisible
{
  v2 = self;
  sub_736370((SEL *)&selRef_as_viewDidBecomeFullyVisible, &enum case for StoreViewControllerLifecycleEvent.didBecomeFullyVisible(_:));
}

- (void)as_viewWillBecomePartiallyVisible
{
  v2 = self;
  sub_736370((SEL *)&selRef_as_viewWillBecomePartiallyVisible, &enum case for StoreViewControllerLifecycleEvent.willBecomePartiallyVisible(_:));
}

- (void)as_viewDidBecomePartiallyVisible
{
  v2 = self;
  sub_736370((SEL *)&selRef_as_viewDidBecomePartiallyVisible, &enum case for StoreViewControllerLifecycleEvent.didBecomePartiallyVisible(_:));
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_7365F0(a3, (SEL *)&selRef_viewDidDisappear_, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:));
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_7367FC();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(StoreCollectionViewController *)v2 traitCollection];
  id v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&def_270DE0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)appEnteredWhileAppeared
{
  v2 = self;
  sub_734B88();
}

- (void)appExitedWhileAppeared
{
  v2 = self;
  sub_734B94();
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = (_TtC18ASMessagesProvider29StoreCollectionViewController *)a3;
  v7 = self;
  id v5 = [(StoreCollectionViewController *)v7 collectionView];
  if (v5)
  {
    id v6 = (_TtC18ASMessagesProvider29StoreCollectionViewController *)v5;
    [(UICollectionView *)v5 selectItemAtIndexPath:0 animated:1 scrollPosition:0];

    id v4 = v7;
    v7 = v6;
  }
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC18ASMessagesProvider29StoreCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18ASMessagesProvider29StoreCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18ASMessagesProvider29StoreCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider29StoreCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider29StoreCollectionViewController_lifecycleObserver, (uint64_t *)&unk_974F50);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29StoreCollectionViewController_statusBarBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29StoreCollectionViewController_overlayViewController));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end