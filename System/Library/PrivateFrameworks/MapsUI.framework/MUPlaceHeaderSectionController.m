@interface MUPlaceHeaderSectionController
+ (double)minimalModeHeight;
- (BOOL)isImpressionable;
- (BOOL)shouldBlurChromeHeaderButtons;
- (MUPlaceHeaderSectionController)initWithPlaceItem:(id)a3 configuration:(id)a4;
- (MUPlaceHeaderSectionControllerDelegate)headerDelegate;
- (UILayoutGuide)headerViewTitleLabelToTopLayoutGuide;
- (UIView)viewForContainmentString;
- (double)verifiedBusinessHeaderHeight;
- (id)draggableContent;
- (id)sectionView;
- (int)analyticsModuleType;
- (void)_notifyDidTapParentMapItem:(id)a3;
- (void)_populateRevealedAnalyticsModule:(id)a3;
- (void)_setupHeaderView;
- (void)headerView:(id)a3 didSelectEnclosingMapItem:(id)a4;
- (void)headerView:(id)a3 didSelectEnclosingMapItemIdentifier:(id)a4;
- (void)headerView:(id)a3 didSelectShareWithPresentationOptions:(id)a4;
- (void)hideTitle:(BOOL)a3;
- (void)reloadTrailingConstraint;
- (void)setCardExpansionProgress:(double)a3;
- (void)setHeaderDelegate:(id)a3;
- (void)verifiedBusinessHeaderScrollPositionChanged:(double)a3;
@end

@implementation MUPlaceHeaderSectionController

- (MUPlaceHeaderSectionController)initWithPlaceItem:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 mapItem];
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceHeaderSectionController;
  v10 = [(MUPlaceSectionController *)&v15 initWithMapItem:v9];

  if (v10)
  {
    v11 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceHeaderSectionControllerInit", "", v14, 2u);
    }

    objc_storeStrong((id *)&v10->_placeItem, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    [(MUPlaceHeaderSectionController *)v10 _setupHeaderView];
    v12 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceHeaderSectionControllerInit", "", v14, 2u);
    }
  }
  return v10;
}

- (void)_setupHeaderView
{
  v3 = objc_alloc_init(MUPlaceCoverPhotoOptions);
  [(MUPlaceCoverPhotoOptions *)v3 setShowShareButton:[(MUPlaceHeaderSectionControllerConfiguration *)self->_configuration showShareButton]];
  [(MUPlaceCoverPhotoOptions *)v3 setInsetsCoverPhoto:[(MUPlaceHeaderSectionControllerConfiguration *)self->_configuration shouldInsetRoundCoverPhoto]];
  v4 = [MUPlaceItemHeaderViewModel alloc];
  placeItem = self->_placeItem;
  BOOL v6 = [(MUPlaceHeaderSectionControllerConfiguration *)self->_configuration isDeveloperPlaceCard];
  id v7 = [(MUPlaceHeaderSectionControllerConfiguration *)self->_configuration developerPlaceCardAuditToken];
  id v8 = [(MUPlaceItemHeaderViewModel *)v4 initWithPlaceItem:placeItem isDeveloperPlaceCard:v6 developerPlaceCardAuditToken:v7];

  objc_initWeak(&location, self);
  v9 = [MUPlaceHeaderView alloc];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __50__MUPlaceHeaderSectionController__setupHeaderView__block_invoke;
  v18 = &unk_1E5750898;
  objc_copyWeak(&v19, &location);
  v10 = [(MUPlaceHeaderView *)v9 initWithViewModel:v8 coverPhotoOptions:v3 trailingConstraintProvider:&v15];
  headerView = self->_headerView;
  self->_headerView = v10;

  -[MUPlaceHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v15, v16, v17, v18);
  [(MUPlaceHeaderView *)self->_headerView setSuppressContainmentTap:[(MUPlaceHeaderSectionControllerConfiguration *)self->_configuration suppressContainmentPunchout]];
  if ([(MUPlaceHeaderSectionControllerConfiguration *)self->_configuration drawDynamicPlacecardDebugBackground])
  {
    v12 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.0500000007];
    [(MUPlaceHeaderView *)self->_headerView setBackgroundColor:v12];
  }
  BOOL v13 = [(MUPlaceHeaderSectionControllerConfiguration *)self->_configuration alwaysShowExpandedVerifiedBusinessHeader];
  double v14 = 0.0;
  if (v13) {
    double v14 = 1.0;
  }
  [(MUPlaceHeaderView *)self->_headerView setVerifiedBusinessHeaderExpansionProgress:v14];
  [(MUPlaceHeaderView *)self->_headerView setDelegate:self];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

double __50__MUPlaceHeaderSectionController__setupHeaderView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  double v3 = 0.0;
  if (WeakRetained)
  {
    v4 = [WeakRetained headerDelegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      BOOL v6 = [v2 headerDelegate];
      [v6 placeHeaderSectionControllerRequestsTrailingConstant:v2];
      double v3 = v7;
    }
  }

  return v3;
}

- (id)sectionView
{
  return self->_headerView;
}

- (UILayoutGuide)headerViewTitleLabelToTopLayoutGuide
{
  return [(MUPlaceHeaderView *)self->_headerView titleLabelToTopLayoutGuide];
}

- (void)setHeaderDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerDelegate);

  char v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_headerDelegate, obj);
    [(MUPlaceHeaderView *)self->_headerView reloadTrailingConstraint];
    char v5 = obj;
  }
}

+ (double)minimalModeHeight
{
  +[MUPlaceHeaderView minimalModeHeight];
  return result;
}

- (void)hideTitle:(BOOL)a3
{
}

- (double)verifiedBusinessHeaderHeight
{
  [(MUPlaceHeaderView *)self->_headerView verifiedBusinessHeaderHeight];
  return result;
}

- (void)verifiedBusinessHeaderScrollPositionChanged:(double)a3
{
}

- (void)setCardExpansionProgress:(double)a3
{
  if (![(MUPlaceHeaderSectionControllerConfiguration *)self->_configuration alwaysShowExpandedVerifiedBusinessHeader])
  {
    headerView = self->_headerView;
    [(MUPlaceHeaderView *)headerView setVerifiedBusinessHeaderExpansionProgress:a3];
  }
}

- (void)headerView:(id)a3 didSelectEnclosingMapItem:(id)a4
{
}

- (void)headerView:(id)a3 didSelectEnclosingMapItemIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MUPlaceHeaderSectionController *)self headerDelegate];

  v9 = MUGetPlaceCardLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1931EA000, v9, OS_LOG_TYPE_INFO, "MUPlaceHeaderSectionController: About to refine enclosing map item", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    [(MUPlaceHeaderView *)self->_headerView beginAnimatingActivityIndicator];
    v11 = [(MUPlaceHeaderView *)self->_headerView viewModel];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__MUPlaceHeaderSectionController_headerView_didSelectEnclosingMapItemIdentifier___block_invoke;
    v12[3] = &unk_1E574FCB8;
    objc_copyWeak(&v13, buf);
    [v11 refineEnclosingMapItemWithCompletion:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  else
  {
    if (v10)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1931EA000, v9, OS_LOG_TYPE_INFO, "MUPlaceHeaderSectionController: User tapped enclosing map item identifier but no delegate set, early return", (uint8_t *)buf, 2u);
    }
  }
}

void __81__MUPlaceHeaderSectionController_headerView_didSelectEnclosingMapItemIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_DEBUG, "MUPlaceHeaderSectionController: Finished refining enclosing map item %@ with error %@", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _notifyDidTapParentMapItem:v5];
    [v9[9] endAnimatingActivityIndicatorWithError:v6];
  }
}

- (void)headerView:(id)a3 didSelectShareWithPresentationOptions:(id)a4
{
  id v5 = a4;
  id v6 = [(MUPlaceHeaderSectionController *)self headerDelegate];
  [v6 placeHeaderSectionController:self didSelectShareWithPresentationOptions:v5];
}

- (void)_notifyDidTapParentMapItem:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "stringWithFormat:", @"%llu", objc_msgSend(v5, "_muid"));
  [(MUPlaceSectionController *)self captureInfoCardAction:6047 eventValue:v6 feedbackType:0 actionRichProviderId:0];

  id v7 = [(MUPlaceHeaderSectionController *)self headerDelegate];
  [v7 placeHeaderSectionController:self didTapMapItem:v5];
}

- (id)draggableContent
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_headerView)
  {
    double v3 = objc_alloc_init(MUInfoCardDraggableContent);
    [(MUInfoCardDraggableContent *)v3 setView:self->_headerView];
    v4 = [(MUPlaceSectionController *)self mapItem];
    [(MUInfoCardDraggableContent *)v3 setDraggableContent:v4];

    [(MUInfoCardDraggableContent *)v3 setHeader:1];
    [(MUInfoCardDraggableContent *)v3 setAnalyticsTarget:1501];
    v7[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (int)analyticsModuleType
{
  return 1;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void)_populateRevealedAnalyticsModule:(id)a3
{
  headerView = self->_headerView;
  id v4 = a3;
  id v6 = [(MUPlaceHeaderView *)headerView viewModel];
  id v5 = MUHeaderRevealedModuleForViewModel(v6);
  [v4 setTitle:v5];
}

- (BOOL)shouldBlurChromeHeaderButtons
{
  return [(MUPlaceHeaderView *)self->_headerView shouldBlurChromeHeaderButtons];
}

- (void)reloadTrailingConstraint
{
}

- (UIView)viewForContainmentString
{
  return [(MUPlaceHeaderView *)self->_headerView viewForContainmentString];
}

- (MUPlaceHeaderSectionControllerDelegate)headerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerDelegate);
  return (MUPlaceHeaderSectionControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_headerDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end