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
  sub_1005CA904();
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

  v4[OBJC_IVAR____TtC22SubscribePageExtension21AccountViewController_allowBatchUpdates] = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccountViewController();
  id v4 = v5.receiver;
  [(StoreCollectionViewController *)&v5 viewWillDisappear:v3];
  v4[OBJC_IVAR____TtC22SubscribePageExtension21AccountViewController_allowBatchUpdates] = 0;
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
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  v12 = self;
  sub_1005CF154(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
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
  sub_1005D017C((uint64_t)v6, a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1005D038C((uint64_t)v4);
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
  sub_1005D256C();
}

- (void)fetchUpdates
{
  double v2 = self;
  sub_1005D2764();
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  sub_10001A860(0, &qword_100952408);
  uint64_t v6 = sub_100767480();
  id v7 = a3;
  uint64_t v8 = self;
  sub_1005D4008(v6);

  swift_bridgeObjectRelease();
}

- (void)signInControllerDidCancel:(id)a3
{
  uint64_t v4 = qword_100932158;
  id v5 = a3;
  id v7 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100767330();
  sub_10001076C(v6, (uint64_t)qword_100952250);
  sub_10000FB44(&qword_10093C6D0);
  sub_100766940();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1007B8210;
  sub_100766920();
  sub_100766890();
  sub_1007671F0();
  swift_bridgeObjectRelease();
  [(AccountViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  sub_10075A7A0();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AccountViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AccountViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AccountViewController_refreshControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AccountViewController_flowPreviewing));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21AccountViewController_compoundScrollObserver));

  swift_release();
}

@end