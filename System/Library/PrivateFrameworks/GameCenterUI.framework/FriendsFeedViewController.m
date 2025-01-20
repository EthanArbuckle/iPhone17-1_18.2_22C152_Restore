@interface FriendsFeedViewController
- (NSDirectionalEdgeInsets)collectionViewFrameInsets;
- (_TtC12GameCenterUI25FriendsFeedViewController)initWithCoder:(id)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)makeLayout;
- (void)loadMoreWithContinuationToken:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FriendsFeedViewController

- (_TtC12GameCenterUI25FriendsFeedViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF61E298();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AF61E380(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1AF61E41C();
}

- (NSDirectionalEdgeInsets)collectionViewFrameInsets
{
  v2 = self;
  sub_1AF61E49C();
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
  sub_1AF61EC6C();
  double v4 = v3;

  return v4;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_1AF7A9A60();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  double v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_1AF61F674(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = sub_1AF61F99C(v6, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25FriendsFeedViewController_activityFeedPresenter));
}

- (void)loadMoreWithContinuationToken:(id)a3
{
  sub_1AF7AE0E0();
  double v4 = self;
  sub_1AF61FDE0();

  swift_bridgeObjectRelease();
}

@end