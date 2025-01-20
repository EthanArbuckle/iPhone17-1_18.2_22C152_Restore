@interface MOSuggestionSheetViewController
- (_TtC16MomentsUIService31MOSuggestionSheetViewController)initWithCoder:(id)a3;
- (_TtC16MomentsUIService31MOSuggestionSheetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelSheet;
- (void)handleContentSizeChanged;
- (void)pressedSegmentControl;
- (void)shouldDismissOnboarding;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MOSuggestionSheetViewController

- (void)shouldDismissOnboarding
{
  v2 = self;
  MOSuggestionSheetViewController.shouldDismissOnboarding()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  MOSuggestionSheetViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)handleContentSizeChanged
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_suggestionCollectionView);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    id v5 = [(MOSuggestionSheetViewController *)v3 traitCollection];
    id v6 = [v5 preferredContentSizeCategory];

    (*(void (**)(id))((swift_isaMask & *v4) + 0x260))(v6);
  }
}

- (void)cancelSheet
{
  v2 = self;
  MOSuggestionSheetViewController.cancelSheet()();
}

- (_TtC16MomentsUIService31MOSuggestionSheetViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionSheetViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MOSuggestionSheetViewController();
  id v2 = v6.receiver;
  [(MOSuggestionSheetViewController *)&v6 viewDidLoad];
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

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  MOSuggestionSheetViewController.viewDidAppear(_:)(a3);
}

- (void)pressedSegmentControl
{
  id v2 = self;
  MOSuggestionSheetViewController.pressedSegmentControl()();
}

- (_TtC16MomentsUIService31MOSuggestionSheetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_segmentedDelegate);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_segmentedVisibilityDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_suggestionCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_options));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController____lazy_storage___suggestionSegmentedControl));
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_presentationDelegate);
  id v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_rootControllerDelegate;

  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)v3);
}

@end