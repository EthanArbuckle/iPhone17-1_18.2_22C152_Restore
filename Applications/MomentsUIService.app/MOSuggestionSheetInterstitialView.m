@interface MOSuggestionSheetInterstitialView
- (_TtC16MomentsUIService33MOSuggestionSheetInterstitialView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService33MOSuggestionSheetInterstitialView)initWithNibName:(id)a3 bundle:(id)a4;
- (void)addButtonTapped;
- (void)cancelSheet;
- (void)didToggleListCarouselViewButtonWithCarouselIndex:(int64_t)a3;
- (void)handleContentSizeChanged;
- (void)handleLabelEditTap:(id)a3;
- (void)journalButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MOSuggestionSheetInterstitialView

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  MOSuggestionSheetInterstitialView.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (_TtC16MomentsUIService33MOSuggestionSheetInterstitialView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionSheetInterstitialView.init(coder:)();
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MOSuggestionSheetInterstitialView();
  id v2 = v6.receiver;
  [(MOSuggestionSheetInterstitialView *)&v6 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    id v5 = [self systemBackgroundColor];
    [v4 setBackgroundColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  MOSuggestionSheetInterstitialView.viewDidDisappear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)cancelSheet
{
  uint64_t v2 = one-time initialization token for shared;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  (*(void (**)(void))(*(void *)static MOSuggestionAssetCacheManager.shared + 288))();
  [(MOSuggestionSheetInterstitialView *)v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)journalButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = self;
  specialized MOSuggestionSheetInterstitialView.journalButtonTapped(_:)();
}

- (void)addButtonTapped
{
  uint64_t v2 = self;
  MOSuggestionSheetInterstitialView.addButtonTapped()();
}

- (void)handleContentSizeChanged
{
  uint64_t v2 = self;
  MOSuggestionSheetInterstitialView.updateTitleLabelString()();
}

- (void)handleLabelEditTap:(id)a3
{
  id v4 = a3;
  id v5 = self;
  specialized MOSuggestionSheetInterstitialView.handleLabelEditTap(_:)();
}

- (void)didToggleListCarouselViewButtonWithCarouselIndex:(int64_t)a3
{
  id v3 = self;
  specialized MOSuggestionSheetInterstitialView.didToggleListCarouselViewButton(carouselIndex:)();
}

- (_TtC16MomentsUIService33MOSuggestionSheetInterstitialView)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MomentsUIService33MOSuggestionSheetInterstitialView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_presentationDelegate);
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_indexPath;
  uint64_t v4 = type metadata accessor for IndexPath();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_assetCarouselView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_assetListView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_navigationBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_photoMemoryBanner));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_toggleListViewCarouselButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_assetTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_emptySelectionLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_journalButtonLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_journalButtonTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_journalButtonBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_journalButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_quickAddButton);
}

@end