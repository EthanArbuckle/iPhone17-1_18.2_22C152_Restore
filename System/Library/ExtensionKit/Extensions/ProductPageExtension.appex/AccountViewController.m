@interface AccountViewController
- (UIEdgeInsets)pageMarginInsets;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)fetchUpdates;
- (void)refreshControlValueChanged;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4;
- (void)signInControllerDidCancel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AccountViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100682E90();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AccountViewController();
  id v4 = v7.receiver;
  [(StoreCollectionViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, "collectionView", v7.receiver, v7.super_class);
  if (v5)
  {
    id v6 = v5;
    [v5 selectItemAtIndexPath:0 animated:1 scrollPosition:0];

    id v4 = v6;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountViewController();
  id v4 = v6.receiver;
  [(StoreCollectionViewController *)&v6 viewDidAppear:v3];
  id v5 = objc_msgSend(self, "sharedCoordinator", v6.receiver, v6.super_class);
  [v5 beginDelayingNotifications];

  v4[OBJC_IVAR____TtC20ProductPageExtension21AccountViewController_allowBatchUpdates] = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccountViewController();
  id v4 = v5.receiver;
  [(StoreCollectionViewController *)&v5 viewWillDisappear:v3];
  v4[OBJC_IVAR____TtC20ProductPageExtension21AccountViewController_allowBatchUpdates] = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountViewController();
  id v4 = v6.receiver;
  [(StoreCollectionViewController *)&v6 viewDidDisappear:v3];
  id v5 = objc_msgSend(self, "sharedCoordinator", v6.receiver, v6.super_class);
  [v5 endDelayingNotifications];
}

- (UIEdgeInsets)pageMarginInsets
{
  double v2 = 0.0;
  double v3 = 16.0;
  double v4 = 0.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  v11 = self;
  sub_1006876E0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_100688708((uint64_t)v6, a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100688918((uint64_t)v4);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)refreshControlValueChanged
{
  double v2 = self;
  sub_10068AAF8();
}

- (void)fetchUpdates
{
  double v2 = self;
  sub_10068ACF0();
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  sub_100019840(0, &qword_10096DDF8);
  uint64_t v6 = sub_10077BB40();
  id v7 = a3;
  uint64_t v8 = self;
  sub_10068C5CC(v6);

  swift_bridgeObjectRelease();
}

- (void)signInControllerDidCancel:(id)a3
{
  uint64_t v4 = qword_100949F68;
  id v5 = a3;
  id v7 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10077B9F0();
  sub_10000D2C4(v6, (uint64_t)qword_10096DC40);
  sub_10000D280((uint64_t *)&unk_10094B830);
  sub_10077AFE0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10078DE60;
  sub_10077AFC0();
  sub_10077AF20();
  sub_10077B890();
  swift_bridgeObjectRelease();
  [(AccountViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  sub_10076EC90();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AccountViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AccountViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AccountViewController_refreshControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AccountViewController_flowPreviewing));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AccountViewController_compoundScrollObserver));

  swift_release();
}

@end