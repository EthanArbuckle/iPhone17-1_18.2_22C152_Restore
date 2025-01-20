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
  sub_441BC();
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

  v4[OBJC_IVAR____TtC18ASMessagesProvider21AccountViewController_allowBatchUpdates] = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccountViewController();
  id v4 = v5.receiver;
  [(StoreCollectionViewController *)&v5 viewWillDisappear:v3];
  v4[OBJC_IVAR____TtC18ASMessagesProvider21AccountViewController_allowBatchUpdates] = 0;
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
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v10 = a3;
  v11 = self;
  sub_48A0C(v10);

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
  sub_49A34((uint64_t)v6, a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_49C44((uint64_t)v4);
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
  sub_4BE24();
}

- (void)fetchUpdates
{
  double v2 = self;
  sub_4C01C();
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  sub_FE2C(0, &qword_951F28);
  uint64_t v6 = sub_77D500();
  id v7 = a3;
  uint64_t v8 = self;
  sub_4D964(v6);

  swift_bridgeObjectRelease();
}

- (void)signInControllerDidCancel:(id)a3
{
  uint64_t v4 = qword_94D598;
  id v5 = a3;
  id v7 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_77D3B0();
  sub_FDF4(v6, (uint64_t)qword_951D20);
  sub_FD50((uint64_t *)&unk_951E60);
  sub_77C9B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_78FEE0;
  sub_77C990();
  sub_77C900();
  sub_77D260();
  swift_bridgeObjectRelease();
  [(AccountViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  sub_7707A0();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AccountViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AccountViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AccountViewController_refreshControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AccountViewController_flowPreviewing));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21AccountViewController_compoundScrollObserver));

  swift_release();
}

@end