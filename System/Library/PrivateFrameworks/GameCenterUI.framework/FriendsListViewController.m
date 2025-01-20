@interface FriendsListViewController
- (BOOL)isDeeplinked;
- (NSDirectionalEdgeInsets)collectionViewFrameInsets;
- (_TtC12GameCenterUI13BasePresenter)dataPresenter;
- (_TtC12GameCenterUI25FriendsListViewController)initWithCoder:(id)a3;
- (id)makeLayout;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)didDismissSearchController:(id)a3;
- (void)setDataPresenter:(id)a3;
- (void)setIsDeeplinked:(BOOL)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FriendsListViewController

- (_TtC12GameCenterUI25FriendsListViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6E1B1C();
}

- (_TtC12GameCenterUI13BasePresenter)dataPresenter
{
  id v2 = sub_1AF6E1BF8();

  return (_TtC12GameCenterUI13BasePresenter *)v2;
}

- (void)setDataPresenter:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF6E1C64(v4);
}

- (BOOL)isDeeplinked
{
  return sub_1AF6E1DA4() & 1;
}

- (void)setIsDeeplinked:(BOOL)a3
{
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_1AF6E1E10();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1AF6E1EBC(a3);
}

- (NSDirectionalEdgeInsets)collectionViewFrameInsets
{
  double v2 = sub_1AF542360();
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (id)makeLayout
{
  double v2 = self;
  sub_1AF6E2C20();
  double v4 = v3;

  return v4;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1AF7A9A60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1AF6E3554();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1AF7A9A60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1AF6E3B20((uint64_t)v12, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1AF6E3D38(v4);
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1AF6E3E14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25FriendsListViewController_friendsPresenter));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI25FriendsListViewController_searchController);
}

@end