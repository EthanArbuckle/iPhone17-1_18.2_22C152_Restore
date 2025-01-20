@interface GKExpandedGroupViewController
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSLayoutConstraint)collectionViewHeightConstraint;
- (NSLayoutConstraint)contentViewWidthConstraint;
- (UIButton)doneButton;
- (UICollectionView)collectionView;
- (UILabel)titleLabel;
- (UIView)container;
- (UIVisualEffectView)visualEffectView;
- (_TtC12GameCenterUI29GKExpandedGroupViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI29GKExpandedGroupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP12GameCenterUI37GKExpandedGroupViewControllerDelegate_)delegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)configureWithPlayers:(id)a3 groupName:(id)a4 caption:(id)a5 playerSelectionProxy:(id)a6;
- (void)dismissView;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewHeightConstraint:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContentViewWidthConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVisualEffectView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GKExpandedGroupViewController

- (UIButton)doneButton
{
}

- (void)setDoneButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF717F60();
}

- (UICollectionView)collectionView
{
}

- (void)setCollectionView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF718040();
}

- (NSLayoutConstraint)contentViewWidthConstraint
{
}

- (void)setContentViewWidthConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF718120();
}

- (UIVisualEffectView)visualEffectView
{
}

- (void)setVisualEffectView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF718200();
}

- (UIView)container
{
}

- (void)setContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF7182E0();
}

- (UILabel)titleLabel
{
}

- (void)setTitleLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF7183C0();
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF7184A0();
}

- (_TtP12GameCenterUI37GKExpandedGroupViewControllerDelegate_)delegate
{
  v2 = (void *)sub_1AF718518();

  return (_TtP12GameCenterUI37GKExpandedGroupViewControllerDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1AF7185C4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF71895C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AF719048();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF7191D0(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1AF719428(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1AF719654(a3);
}

- (void)dismissView
{
  v2 = self;
  sub_1AF719750();
}

- (void)configureWithPlayers:(id)a3 groupName:(id)a4 caption:(id)a5 playerSelectionProxy:(id)a6
{
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC38A0);
  uint64_t v10 = sub_1AF7AE2B0();
  if (a4) {
    sub_1AF7AE0E0();
  }
  if (a5) {
    sub_1AF7AE0E0();
  }
  v11 = self;
  swift_unknownObjectRetain();
  sub_1AF7197B0(v10, v12, v13, v14, v15, a6);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AF7A9A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = sub_1AF719954(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AF7A9A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_1AF719BE0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AF7A9A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v10 = a3;
  v11 = self;
  sub_1AF719CE8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  int64_t v7 = sub_1AF719E04();

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1AF7A9A60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1AF719EB8();
  double v16 = v15;
  double v18 = v17;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (_TtC12GameCenterUI29GKExpandedGroupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC12GameCenterUI29GKExpandedGroupViewController *)sub_1AF71B104((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))GKExpandedGroupViewController.init(nibName:bundle:));
}

- (_TtC12GameCenterUI29GKExpandedGroupViewController)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI29GKExpandedGroupViewController *)GKExpandedGroupViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_1AF3E32DC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI29GKExpandedGroupViewController_playerSelectionProxy);
  sub_1AF3E32DC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI29GKExpandedGroupViewController_delegate);
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end