@interface BaseSplitCollectionViewController
+ (double)customHeaderHeight;
+ (double)leadingAndTrailingInsetForCustomHeader;
+ (double)mainCollectionViewWidth;
+ (double)topAndBottomInsetForCustomHeader;
+ (double)topInsetWithCustomHeader;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)shouldDisplayCustomHeader;
- (BOOL)shouldDisplayInSplitView;
- (NSDirectionalEdgeInsets)collectionViewFrameInsets;
- (NSDirectionalEdgeInsets)secondaryCollectionViewFrameInsets;
- (UICollectionView)secondaryCollectionView;
- (UICollectionViewCompositionalLayout)secondaryCompositionalLayout;
- (_TtC12GameCenterUI12GradientView)leftPaneBackgroundView;
- (_TtC12GameCenterUI18BaseSplitPresenter)dataPresenter;
- (_TtC12GameCenterUI33BaseSplitCollectionViewController)initWithCoder:(id)a3;
- (double)mainSecondaryCollectionViewSpacing;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)makeSecondaryLayout;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)loadView;
- (void)mainSecondaryCollectionViewLayout;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setSecondaryCollectionView:(id)a3;
- (void)setSecondaryCompositionalLayout:(id)a3;
- (void)setShouldDisplayCustomHeader:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BaseSplitCollectionViewController

- (_TtC12GameCenterUI33BaseSplitCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  BaseSplitCollectionViewController.init(coder:)();
}

+ (double)topInsetWithCustomHeader
{
  return 165.0;
}

+ (double)topAndBottomInsetForCustomHeader
{
  return 40.0;
}

+ (double)leadingAndTrailingInsetForCustomHeader
{
  return 25.0;
}

+ (double)customHeaderHeight
{
  return 125.0;
}

+ (double)mainCollectionViewWidth
{
  return static BaseSplitCollectionViewController.mainCollectionViewWidth.getter();
}

- (UICollectionView)secondaryCollectionView
{
  v2 = sub_1AF580A78();

  return (UICollectionView *)v2;
}

- (void)setSecondaryCollectionView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF580AC0(a3);
}

- (_TtC12GameCenterUI12GradientView)leftPaneBackgroundView
{
  id v2 = sub_1AF583C74();

  return (_TtC12GameCenterUI12GradientView *)v2;
}

- (void)loadView
{
  id v2 = self;
  sub_1AF583C84();
}

- (NSDirectionalEdgeInsets)collectionViewFrameInsets
{
  sub_1AF583F94(self, (uint64_t)a2, sub_1AF580864);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)secondaryCollectionViewFrameInsets
{
  sub_1AF583F94(self, (uint64_t)a2, (void (*)(void))sub_1AF580B70);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)mainSecondaryCollectionViewLayout
{
  double v2 = self;
  sub_1AF5815A0();
}

- (double)mainSecondaryCollectionViewSpacing
{
  double v2 = self;
  double v3 = sub_1AF582B38();

  return v3;
}

- (BOOL)shouldDisplayInSplitView
{
  double v2 = self;
  unsigned __int8 v3 = sub_1AF582C00();

  return v3 & 1;
}

- (BOOL)shouldDisplayCustomHeader
{
  return sub_1AF582EFC() & 1;
}

- (void)setShouldDisplayCustomHeader:(BOOL)a3
{
}

- (UICollectionViewCompositionalLayout)secondaryCompositionalLayout
{
  double v2 = sub_1AF582F1C();

  return (UICollectionViewCompositionalLayout *)v2;
}

- (void)setSecondaryCompositionalLayout:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF582F4C((uint64_t)a3);
}

- (_TtC12GameCenterUI18BaseSplitPresenter)dataPresenter
{
  double v2 = self;
  unsigned __int8 v3 = (void *)sub_1AF5841BC();

  return (_TtC12GameCenterUI18BaseSplitPresenter *)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF58422C((uint64_t)a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  sub_1AF5842E0(a4);
  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  double v2 = self;
  sub_1AF58460C();
}

- (void)viewDidAppear:(BOOL)a3
{
  double v4 = self;
  sub_1AF5846FC(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  double v4 = self;
  sub_1AF584818(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  double v4 = self;
  sub_1AF5848D8(a3);
}

- (void)viewWillLayoutSubviews
{
  double v2 = self;
  sub_1AF587C00(type metadata accessor for BaseSplitCollectionViewController, (SEL *)&selRef_viewWillLayoutSubviews);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF580644();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF585710(v4);
}

- (id)makeSecondaryLayout
{
  double v2 = self;
  sub_1AF583010();
  id v4 = v3;

  return v4;
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
  sub_1AF586264();
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
  sub_1AF586694();

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
  sub_1AF586AA0();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_1AF7A9A60();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v11 = a3;
  uint64_t v12 = self;
  sub_1AF587184();
  id v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = sub_1AF587598(v6, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI33BaseSplitCollectionViewController_secondaryCollectionView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI33BaseSplitCollectionViewController_leftPaneBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI33BaseSplitCollectionViewController_secondaryCompositionalLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI33BaseSplitCollectionViewController_secondaryDiffableDataSource));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI33BaseSplitCollectionViewController____lazy_storage___updateCollectionViewConstraintOnce);

  sub_1AF368930(v3);
}

@end