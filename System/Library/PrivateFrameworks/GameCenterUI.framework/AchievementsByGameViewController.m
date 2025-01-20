@interface AchievementsByGameViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (_TtC12GameCenterUI32AchievementsByGameViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI32AchievementsByGameViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AchievementsByGameViewController

- (_TtC12GameCenterUI32AchievementsByGameViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3CC334();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF3CC474();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AF3CC558(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1AF3CC720(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1AF3CC8AC(a3);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AF7A9A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v10 = a3;
  v11 = self;
  sub_1AF3CEE6C();
  LOBYTE(self) = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AF7A9A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v10 = a3;
  v11 = self;
  sub_1AF3CF1F4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_1AF7A9A60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7AE0E0();
  sub_1AF7A99E0();
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_1AF3CF594();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (_TtC12GameCenterUI32AchievementsByGameViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  sub_1AF3D03B4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI32AchievementsByGameViewController_bootstrapPresenter));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI32AchievementsByGameViewController_compositionalLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI32AchievementsByGameViewController_diffableDataSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI32AchievementsByGameViewController_sortGamesBarButtonItem));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI32AchievementsByGameViewController_navigationBarFocusGuide);
}

@end