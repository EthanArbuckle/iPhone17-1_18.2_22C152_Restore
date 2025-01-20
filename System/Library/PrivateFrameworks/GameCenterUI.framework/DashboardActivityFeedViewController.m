@interface DashboardActivityFeedViewController
- (NSDirectionalEdgeInsets)collectionViewFrameInsets;
- (_TtC12GameCenterUI35DashboardActivityFeedViewController)initWithCoder:(id)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)makeLayout;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)loadMoreWithContinuationToken:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DashboardActivityFeedViewController

- (_TtC12GameCenterUI35DashboardActivityFeedViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF5D71BC();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1AF5D72DC();
}

- (NSDirectionalEdgeInsets)collectionViewFrameInsets
{
  v2 = self;
  sub_1AF5D735C();
  double v4 = v3;
  double v6 = v5;

  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v4;
  double v10 = v6;
  result.trailing = v10;
  result.bottom = v8;
  result.leading = v9;
  result.top = v7;
  return result;
}

- (id)makeLayout
{
  v2 = self;
  sub_1AF5D7B78();
  double v4 = v3;

  return v4;
}

- (void)viewDidDisappear:(BOOL)a3
{
  double v3 = self;
  sub_1AF5D8958();
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
  sub_1AF5D9448();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_1AF7A9A60();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v11 = a3;
  id v12 = self;
  sub_1AF5D9A40();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = sub_1AF5D9D48(v6, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35DashboardActivityFeedViewController_activityFeedPresenter));
}

- (void)loadMoreWithContinuationToken:(id)a3
{
  sub_1AF7AE0E0();
  double v4 = self;
  sub_1AF5DA17C();

  swift_bridgeObjectRelease();
}

@end