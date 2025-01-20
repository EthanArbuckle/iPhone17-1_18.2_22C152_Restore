@interface GameLayerAchievementsViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC12GameCenterUI35GameLayerAchievementsViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI35GameLayerAchievementsViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC12GameCenterUI35GameLayerAchievementsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)didReceiveMemoryWarning;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GameLayerAchievementsViewController

- (_TtC12GameCenterUI35GameLayerAchievementsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF740704();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  GameLayerAchievementsViewController.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACEC80);
  id v3 = (void *)sub_1AF7AE2A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)viewDidLoad
{
  v2 = self;
  GameLayerAchievementsViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  GameLayerAchievementsViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  GameLayerAchievementsViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  GameLayerAchievementsViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  GameLayerAchievementsViewController.viewDidDisappear(_:)(a3);
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  GameLayerAchievementsViewController.didReceiveMemoryWarning()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  GameLayerAchievementsViewController.traitCollectionDidChange(_:)(v9);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  GameLayerAchievementsViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  GameLayerAchievementsViewController.viewWillLayoutSubviews()();
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
  GameLayerAchievementsViewController.collectionView(_:willDisplay:forItemAt:)((uint64_t)v12, v13, (uint64_t)v11);

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
  GameLayerAchievementsViewController.collectionView(_:didEndDisplaying:forItemAt:)();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AF7A9A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v10 = a3;
  v11 = self;
  GameLayerAchievementsViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_1AF7A9A60();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v11 = a3;
  uint64_t v12 = self;
  GameLayerAchievementsViewController.collectionView(_:contextMenuConfigurationForItemAt:point:)();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  uint64_t v6 = (UICollectionView *)a3;
  id v7 = a4;
  uint64_t v8 = self;
  uint64_t v9 = (void *)GameLayerAchievementsViewController.collectionView(_:previewForDismissingContextMenuWithConfiguration:)(v6, (UIContextMenuConfiguration)v7);

  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  id v5 = self;
  GameLayerAchievementsViewController.scrollViewDidScroll(_:)(v4);
}

- (_TtC12GameCenterUI35GameLayerAchievementsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  GameLayerAchievementsViewController.init(collectionViewLayout:)();
}

- (_TtC12GameCenterUI35GameLayerAchievementsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  GameLayerAchievementsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35GameLayerAchievementsViewController_bootstrapPresenter));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v2 = (void *)OUTLINED_FUNCTION_15_54(OBJC_IVAR____TtC12GameCenterUI35GameLayerAchievementsViewController_style);

  sub_1AF3DB200(v2, v3, v4, v5, v6, v7, v8);
}

@end