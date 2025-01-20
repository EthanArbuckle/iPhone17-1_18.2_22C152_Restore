@interface MURatingsAndReviewsSectionController
- (BOOL)isImpressionable;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (MURatingsAndReviewsSectionController)initWithMapItem:(id)a3;
- (MURatingsAndReviewsSectionControllerDelegate)actionDelegate;
- (UIView)sectionView;
- (id)infoCardChildPossibleActions;
- (int)analyticsModuleType;
- (void)_addAppleRatingsCategoryTileIfNeeded:(id)a3;
- (void)_addHorizontalTileToContentStackView:(id)a3 items:(id)a4;
- (void)_addPlaceCollectionPullQuotesIfNeeded:(id)a3;
- (void)_addRatingSnippets:(id)a3 withCellItems:(id)a4;
- (void)_addUserReviewCategoryTilesIfNeeded:(id)a3;
- (void)_sectionHeaderAccessoryTapped;
- (void)_setupRatingRows;
- (void)pullQuoteViewDidTapMore:(id)a3;
- (void)setActionDelegate:(id)a3;
@end

@implementation MURatingsAndReviewsSectionController

- (MURatingsAndReviewsSectionController)initWithMapItem:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MURatingsAndReviewsSectionController;
  v3 = [(MUPlaceSectionController *)&v8 initWithMapItem:a3];
  if (v3)
  {
    v4 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MURatingsAndReviewsSectionControllerInit", "", v7, 2u);
    }

    [(MURatingsAndReviewsSectionController *)v3 _setupRatingRows];
    v5 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MURatingsAndReviewsSectionControllerInit", "", v7, 2u);
    }
  }
  return v3;
}

- (void)_setupRatingRows
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = [MUScrollableStackView alloc];
  v4 = -[MUScrollableStackView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  contentStackView = self->_contentStackView;
  self->_contentStackView = v4;

  [(MUScrollableStackView *)self->_contentStackView setAxis:0];
  -[MUScrollableStackView setContentEdgeInsets:](self->_contentStackView, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  [(MUScrollableStackView *)self->_contentStackView setSpacing:8.0];
  [(MUScrollableStackView *)self->_contentStackView setAccessibilityIdentifier:@"RatingsAndReviews"];
  if (MapKitIdiomIsMacCatalyst()) {
    v6 = [[MUPagingScrollContainerView alloc] initWithHorizontalScrollView:self->_contentStackView];
  }
  else {
    v6 = self->_contentStackView;
  }
  v7 = v6;
  objc_super v8 = objc_alloc_init(MUPlaceReviewAvatarGenerator);
  avatarGenerator = self->_avatarGenerator;
  self->_avatarGenerator = v8;

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11 = objc_alloc_init(MUPlaceRatingReviewTitleBuilder);
  titleBuilder = self->_titleBuilder;
  self->_titleBuilder = v11;

  [(MURatingsAndReviewsSectionController *)self _addAppleRatingsCategoryTileIfNeeded:v10];
  [(MURatingsAndReviewsSectionController *)self _addUserReviewCategoryTilesIfNeeded:v10];
  [(MURatingsAndReviewsSectionController *)self _addPlaceCollectionPullQuotesIfNeeded:v10];
  if ([v10 count])
  {
    id v36 = v10;
    if ([v10 count] == 1)
    {
      v13 = [MUPlaceSectionView alloc];
      v14 = [(MURatingsAndReviewsSectionController *)self sectionHeaderViewModel];
      v15 = [(MUPlaceSectionView *)v13 initWithStyle:1 sectionHeaderViewModel:v14];
      sectionView = self->_sectionView;
      self->_sectionView = v15;

      v17 = self->_sectionView;
      v18 = [v10 firstObject];
      v19 = [v18 ratingView];
      [(MUPlaceSectionView *)v17 attachViewToContentView:v19];
    }
    else
    {
      v35 = v7;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v20 = v10;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v38 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (objc_msgSend(v25, "shouldApplyWidthConstraint", v35))
            {
              v26 = [v25 ratingView];
              v27 = [v26 widthAnchor];
              [v25 preferredWidth];
              v28 = objc_msgSend(v27, "constraintEqualToConstant:");
              [v28 setActive:1];
            }
            v29 = self->_contentStackView;
            v30 = [v25 ratingView];
            [(MUScrollableStackView *)v29 addArrangedSubview:v30];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v22);
      }

      v31 = [MUPlaceSectionView alloc];
      v32 = [(MURatingsAndReviewsSectionController *)self sectionHeaderViewModel];
      v33 = [(MUPlaceSectionView *)v31 initWithStyle:0 sectionHeaderViewModel:v32];
      v34 = self->_sectionView;
      self->_sectionView = v33;

      v7 = v35;
      [(MUPlaceSectionView *)self->_sectionView attachViewToContentView:v35];
    }
    -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self, v35);
    id v10 = v36;
  }
}

- (void)_addAppleRatingsCategoryTileIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MUPlaceSectionController *)self mapItem];
  v6 = [v5 _geoMapItem];
  char v7 = [v6 _hasAppleRatings];

  if (v7)
  {
    objc_super v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = [(MUPlaceSectionController *)self mapItem];
    id v10 = [v9 _geoMapItem];
    v11 = [v10 _appleRatings];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          [v8 addObject:*(void *)(*((void *)&v19 + 1) + 8 * v15++)];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }

    if ([v8 count])
    {
      [(MUPlaceRatingReviewTitleBuilder *)self->_titleBuilder setSupportsRatings:1];
      v16 = [MUAppleRatingSectionView alloc];
      v17 = -[MUAppleRatingSectionView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      id v18 = [v8 copy];
      [v17 setViewModels:v18];

      [(MURatingsAndReviewsSectionController *)self _addHorizontalTileToContentStackView:v17 items:v4];
    }
    else
    {
      v17 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1931EA000, v17, OS_LOG_TYPE_INFO, "MURatingsAndReviewsSectionController: Apple ratings are present but only the overall one is present. Exit early", buf, 2u);
      }
    }
  }
  else
  {
    objc_super v8 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_INFO, "MURatingsAndReviewsSectionController: No Apple ratings present, exit early", buf, 2u);
    }
  }
}

- (void)_addUserReviewCategoryTilesIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = [(MUPlaceSectionController *)self mapItem];
  if ([(MUOverallRatingPlatterView *)v5 _hasUserRatingScore])
  {
    v6 = [(MUPlaceSectionController *)self mapItem];
    char v7 = [v6 _geoMapItem];
    char v8 = [v7 _hasAppleRatings];

    if (v8) {
      goto LABEL_5;
    }
    v9 = [MUOverallRatingPlatterView alloc];
    v5 = -[MUOverallRatingPlatterView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v10 = [(MUPlaceSectionController *)self mapItem];
    [(MUOverallRatingPlatterView *)v5 setViewModel:v10];

    [(MUOverallRatingPlatterView *)v5 addSelectionGestureWithTarget:self action:sel__sectionHeaderAccessoryTapped];
    v11 = [[MUPlatterView alloc] initWithContentView:v5];
    uint64_t v12 = objc_alloc_init(_MURatingCellItem);
    [(_MURatingCellItem *)v12 setRatingView:v11];
    [(_MURatingCellItem *)v12 setShouldApplyWidthConstraint:0];
    [v4 addObject:v12];
    [(MUPlaceRatingReviewTitleBuilder *)self->_titleBuilder setSupportsRatings:1];
  }
LABEL_5:
  uint64_t v13 = [(MUPlaceSectionController *)self mapItem];
  uint64_t v14 = [v13 _reviews];
  uint64_t v15 = [v14 count];

  v16 = [(MUPlaceSectionController *)self mapItem];
  v17 = v16;
  if (v15)
  {
    uint64_t v18 = [v16 _reviews];
LABEL_9:
    long long v21 = (void *)v18;
    [(MURatingsAndReviewsSectionController *)self _addRatingSnippets:v18 withCellItems:v4];

    goto LABEL_10;
  }
  long long v19 = [v16 _tips];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    v17 = [(MUPlaceSectionController *)self mapItem];
    uint64_t v18 = [v17 _tips];
    goto LABEL_9;
  }
  long long v22 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_1931EA000, v22, OS_LOG_TYPE_DEBUG, "POI has neither reviews or tips", v23, 2u);
  }

LABEL_10:
}

- (void)_addRatingSnippets:(id)a3 withCellItems:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = a4;
  if ([v6 count]) {
    [(MUPlaceRatingReviewTitleBuilder *)self->_titleBuilder setSupportsReviews:1];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v18 = *(void *)v26;
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * v13);
        uint64_t v15 = [[MUPlaceReviewViewModel alloc] initWithRatingSnippet:v14 avatarGenerator:self->_avatarGenerator];
        v16 = -[MUPlaceReviewPlatterView initWithFrame:]([MUPlaceReviewPlatterView alloc], "initWithFrame:", v9, v10, v11, v12);
        [(MUPlaceReviewPlatterView *)v16 setViewModel:v15];
        objc_initWeak(&location, self);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __73__MURatingsAndReviewsSectionController__addRatingSnippets_withCellItems___block_invoke;
        v20[3] = &unk_1E574ED68;
        objc_copyWeak(&v23, &location);
        id v17 = v7;
        id v21 = v17;
        uint64_t v22 = v14;
        [(MUPlaceReviewPlatterView *)v16 setActionHandler:v20];
        [(MURatingsAndReviewsSectionController *)self _addHorizontalTileToContentStackView:v16 items:v19];

        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);

        ++v13;
      }
      while (v8 != v13);
      uint64_t v8 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }
}

void __73__MURatingsAndReviewsSectionController__addRatingSnippets_withCellItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) indexOfObject:*(void *)(a1 + 40)];
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v2);
    id v4 = [WeakRetained mapItem];
    v5 = [v4 _reviewsAttribution];
    id v6 = [v5 providerID];
    [WeakRetained captureInfoCardAction:6021 eventValue:v3 feedbackType:176 actionRichProviderId:v6];

    id v7 = [WeakRetained actionDelegate];
    [v7 ratingsAndReviewsSectionController:WeakRetained didSelectViewReview:*(void *)(a1 + 40)];
  }
}

- (void)_addPlaceCollectionPullQuotesIfNeeded:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v4 = [(MUPlaceSectionController *)self mapItem];
  v5 = [v4 _geoMapItem];
  char v6 = [v5 _hasPlaceCollectionPullQuotes];

  if (v6)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = [(MUPlaceSectionController *)self mapItem];
    uint64_t v8 = [v7 _geoMapItem];
    double v9 = [v8 _placeCollections];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      char v12 = 0;
      uint64_t v13 = *(void *)v27;
      double v14 = *MEMORY[0x1E4F1DB28];
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v9);
          }
          id v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v20 = [v19 publisherBlockQuote];
          id v21 = [v20 plainTextDescription];
          uint64_t v22 = [v21 length];

          if (v22)
          {
            id v23 = -[MUPlaceCollectionPullQuotePlatterView initWithFrame:]([MUPlaceCollectionPullQuotePlatterView alloc], "initWithFrame:", v14, v15, v16, v17);
            [(MUPlaceCollectionPullQuotePlatterView *)v23 setDelegate:self];
            [(MUPlaceCollectionPullQuotePlatterView *)v23 setViewModel:v19];
            [(MURatingsAndReviewsSectionController *)self _addHorizontalTileToContentStackView:v23 items:v25];

            char v12 = 1;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v11);
    }
    else
    {
      char v12 = 0;
    }

    [(MUPlaceRatingReviewTitleBuilder *)self->_titleBuilder setSupportsGuides:v12 & 1];
  }
  else
  {
    v24 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v24, OS_LOG_TYPE_INFO, "MURatingsAndReviewsSectionController: No place collection pull quotes present", buf, 2u);
    }
  }
}

- (void)_addHorizontalTileToContentStackView:(id)a3 items:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v8 = objc_alloc_init(_MURatingCellItem);
  [(_MURatingCellItem *)v8 setShouldApplyWidthConstraint:1];
  [(_MURatingCellItem *)v8 setPreferredWidth:307.0];
  id v7 = [[MUPlatterView alloc] initWithContentView:v6];

  [(_MURatingCellItem *)v8 setRatingView:v7];
  [v5 addObject:v8];
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    id v4 = [(MUPlaceRatingReviewTitleBuilder *)self->_titleBuilder buildTitleString];
    id v5 = [(MUPlaceSectionController *)self mapItem];
    id v6 = [v5 _reviewsAttribution];
    id v7 = +[MUPlaceSectionHeaderViewModel viewModelForTitle:v4 attribution:v6 target:self action:sel__sectionHeaderAccessoryTapped];
    uint64_t v8 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v7;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (void)_sectionHeaderAccessoryTapped
{
  v3 = [(MUPlaceSectionController *)self mapItem];
  id v4 = [v3 _reviewsAttribution];
  id v5 = [v4 providerID];
  [(MUPlaceSectionController *)self captureInfoCardAction:6020 eventValue:0 feedbackType:175 actionRichProviderId:v5];

  id v6 = [(MURatingsAndReviewsSectionController *)self actionDelegate];
  [v6 ratingsAndReviewsSectionControllerDidSelectViewAllReviews:self];
}

- (void)pullQuoteViewDidTapMore:(id)a3
{
  id v8 = a3;
  id v4 = [v8 viewModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(MURatingsAndReviewsSectionController *)self actionDelegate];
    id v7 = [v8 viewModel];
    [v6 ratingsAndReviewsSectionController:self didSelectPlaceCollection:v7];
  }
}

- (id)infoCardChildPossibleActions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(MUPlaceSectionController *)self mapItem];
  id v5 = [v4 _reviews];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      [v3 addObject:&unk_1EE404778];
      ++v7;
      id v8 = [(MUPlaceSectionController *)self mapItem];
      double v9 = [v8 _reviews];
      unint64_t v10 = [v9 count];
    }
    while (v7 < v10);
  }
  [v3 addObject:&unk_1EE404790];
  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

- (int)analyticsModuleType
{
  return 36;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MURatingsAndReviewsSectionControllerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  return (MURatingsAndReviewsSectionControllerDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_titleBuilder, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end