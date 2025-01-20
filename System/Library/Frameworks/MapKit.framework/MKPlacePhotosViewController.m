@interface MKPlacePhotosViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hoverActive;
- (BOOL)isCompactMode;
- (BOOL)isFirstParty;
- (BOOL)isParsecProcess;
- (BOOL)isSafariProcess;
- (BOOL)isSiriProcess;
- (BOOL)shouldShowAddPhotoButtons;
- (BOOL)showsBottomHairline;
- (CGSize)_photoActionSize;
- (CGSize)_photoSizeForIndex:(unint64_t)a3;
- (CGSize)sizeForIndex:(unint64_t)a3;
- (MKLookAroundView)lookAroundView;
- (MKPlaceCardPhotosControllerDelegate)photosControllerDelegate;
- (MKPlacePhotosViewController)initWithMapItem:(id)a3 mode:(unint64_t)a4 options:(unint64_t)a5;
- (_MKInfoCardAnalyticsDelegate)analyticsDelegate;
- (_MKPlaceViewController)owner;
- (id)_firstPartyMorePhotosAttributionString;
- (id)attributionString;
- (id)formattedAttributionString;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (unint64_t)numberOfBigAttributionViews;
- (void)_adjustScrollIndexByOffset:(int64_t)a3;
- (void)_applyCornerRadius;
- (void)_cancelLoadPhotos;
- (void)_catchScrollNotification:(id)a3;
- (void)_createImageViews;
- (void)_didBecomeActive:(id)a3;
- (void)_didTapAttributionViewWithPresentingViewController:(id)a3 photoAttributionView:(id)a4;
- (void)_loadPhotos;
- (void)_logUGCAction:(int)a3;
- (void)_photoSelected:(id)a3;
- (void)_photoTappedAtIndex:(unint64_t)a3;
- (void)_scrollNext;
- (void)_scrollPrevious;
- (void)_setContentVisibility:(int64_t)a3;
- (void)_updateAlphaAttribution;
- (void)_updateChevronVisibility;
- (void)_updatePhotoBackgroundColor:(id)a3;
- (void)addAttributionCell;
- (void)dealloc;
- (void)didTapPrimaryAttributionViewWithPresentingViewController:(id)a3;
- (void)didTapSecondaryAttributionViewWithPresentingViewController:(id)a3;
- (void)handleHover:(id)a3;
- (void)infoCardThemeChanged;
- (void)layoutImages;
- (void)lookAroundContainerView:(id)a3 didAddLookAroundView:(id)a4;
- (void)openURL;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setContentVisibility:(int64_t)a3;
- (void)setHoverActive:(BOOL)a3;
- (void)setOwner:(id)a3;
- (void)setPhotosControllerDelegate:(id)a3;
- (void)setShowsBottomHairline:(BOOL)a3;
- (void)updateAttributionCell;
- (void)updateAttributionPositionWithOffset:(double)a3;
- (void)updateBottomHairlineVisibility;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MKPlacePhotosViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isSiriProcess
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.siri"];

  return v4;
}

- (BOOL)isParsecProcess
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  char v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.Spotlight"];

  if (v5) {
    return 1;
  }

  return [(MKPlacePhotosViewController *)self isSafariProcess];
}

- (BOOL)isSafariProcess
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.mobilesafari"];

  return v4;
}

- (BOOL)isFirstParty
{
  v2 = [(MKMapItem *)self->_mapItem _mapkit_preferredFirstPhotoVendor];
  char v3 = [v2 shouldHandlePhotosLocally];

  return v3;
}

- (unint64_t)numberOfBigAttributionViews
{
  unint64_t v3 = [(MKPlacePhotosViewController *)self isFirstParty];
  if ([(MKPlacePhotosViewController *)self shouldShowAddPhotoButtons])
  {
    unint64_t v4 = 1;
    if (v3) {
      unint64_t v4 = 2;
    }
    if (self->_photosCount > 3) {
      return v4;
    }
  }
  return v3;
}

- (BOOL)shouldShowAddPhotoButtons
{
  return 0;
}

- (_MKInfoCardAnalyticsDelegate)analyticsDelegate
{
  unint64_t v3 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
  int v4 = [v3 conformsToProtocol:&unk_1ED9B2D90];

  if (v4)
  {
    char v5 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
  }
  else
  {
    char v5 = 0;
  }

  return (_MKInfoCardAnalyticsDelegate *)v5;
}

- (BOOL)isCompactMode
{
  return self->_mode - 1 < 3;
}

- (MKPlacePhotosViewController)initWithMapItem:(id)a3 mode:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MKPlacePhotosViewController;
  v10 = [(MKPlacePhotosViewController *)&v50 init];
  if (v10)
  {
    v11 = MKGetPlaceCardLog();
    v10->_os_signpost_id_t initialAppearanceSignpostID = os_signpost_id_generate(v11);

    v12 = MKGetPlaceCardLog();
    v13 = v12;
    os_signpost_id_t initialAppearanceSignpostID = v10->_initialAppearanceSignpostID;
    if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v13, OS_SIGNPOST_INTERVAL_BEGIN, initialAppearanceSignpostID, "PlacecardPhotosInitialAppearance", (const char *)&unk_18BD3917F, buf, 2u);
    }

    objc_storeStrong((id *)&v10->_mapItem, a3);
    v10->_unint64_t mode = a4;
    v10->_options = a5;
    v10->_originalMode = a4;
    v10->_photoLoaded = 0;
    id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v16 = [(MKMapItem *)v10->_mapItem _geoMapItem];
    v17 = [v16 _photos];
    v18 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v17, "count"));

    if ((unint64_t)[v18 count] >= 4)
    {
      v19 = objc_msgSend(v18, "subarrayWithRange:", 0, 3);
      uint64_t v20 = [v19 mutableCopy];

      v18 = (void *)v20;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v21 = [(MKMapItem *)v10->_mapItem _geoMapItem];
    v22 = [v21 _photos];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [[MKMapItemPhoto alloc] initWithGeoMapItemPhoto:*(void *)(*((void *)&v45 + 1) + 8 * i)];
          [v18 addObject:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v24);
    }

    uint64_t v28 = [v18 copy];
    photos = v10->_photos;
    v10->_photos = (NSArray *)v28;

    uint64_t v30 = [(NSArray *)v10->_photos indexOfObjectPassingTest:&__block_literal_global_59];
    unint64_t v31 = [(NSArray *)v10->_photos count];
    v10->_unint64_t photosCount = v31;
    if (v30 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_17;
    }
    unint64_t mode = v10->_mode;
    if (mode != 2)
    {
      if (v31 == 3)
      {
LABEL_17:
        uint64_t v33 = 2;
LABEL_18:
        v10->_unint64_t mode = v33;
        goto LABEL_19;
      }
      if (!mode && v31 <= 2)
      {
        uint64_t v33 = 1;
        goto LABEL_18;
      }
    }
LABEL_19:
    BOOL IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    unint64_t v35 = v10->_mode;
    if (IsMacCatalyst && v35 == 2)
    {
      v10->_unint64_t mode = 0;
    }
    else if (v35)
    {
      goto LABEL_30;
    }
    if (v10->_photosCount >= 4)
    {
      uint64_t v36 = [(MKPlacePhotosViewController *)v10 numberOfBigAttributionViews];
      unint64_t photosCount = v10->_photosCount;
      unint64_t v38 = photosCount % 3;
      if (v36 == 2)
      {
        if (!v38) {
          goto LABEL_30;
        }
        unint64_t v39 = photosCount - v38;
      }
      else
      {
        if (v38 != 2) {
          goto LABEL_30;
        }
        unint64_t v39 = photosCount - 1;
      }
      v10->_unint64_t photosCount = v39;
    }
LABEL_30:
    if (v10->_mode - 1 <= 2)
    {
      unint64_t v40 = v10->_photosCount;
      if (v40 >= 3) {
        unint64_t v40 = 3;
      }
      v10->_unint64_t photosCount = v40;
    }
    uint64_t v41 = [(NSArray *)v10->_photos indexOfObjectPassingTest:&__block_literal_global_109];
    v10->_canUseFullscreenViewer = v41 == 0x7FFFFFFFFFFFFFFFLL;
    if (v41 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(MKPlacePhotosViewController *)v10 isSiriProcess]
        || [(MKPlacePhotosViewController *)v10 isParsecProcess])
      {
        int BOOL = GEOConfigGetBOOL();
        v10->_canUseFullscreenViewer = BOOL;
        if (BOOL)
        {
LABEL_39:
          v10->_isRTL = MKApplicationLayoutDirectionIsRightToLeft();

          goto LABEL_40;
        }
      }
      else if (v10->_canUseFullscreenViewer)
      {
        goto LABEL_39;
      }
    }
    v43 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v10->_canUseFullscreenViewer = [v43 BOOLForKey:@"MKPlacecardForceFullScreenGallery"];

    goto LABEL_39;
  }
LABEL_40:

  return v10;
}

BOOL __60__MKPlacePhotosViewController_initWithMapItem_mode_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 useGallery]) {
    return *a4 != 0;
  }
  BOOL result = 1;
  *a4 = 1;
  return result;
}

BOOL __60__MKPlacePhotosViewController_initWithMapItem_mode_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 displayFullScreenPhotoGallery]) {
    return *a4 != 0;
  }
  BOOL result = 1;
  *a4 = 1;
  return result;
}

- (void)viewDidLoad
{
  v176[6] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlacePhotosViewDidLoad", (const char *)&unk_18BD3917F, buf, 2u);
  }

  v169.receiver = self;
  v169.super_class = (Class)MKPlacePhotosViewController;
  [(MKPlacePhotosViewController *)&v169 viewDidLoad];
  int v4 = [(MKPlacePhotosViewController *)self view];
  [v4 setPreservesSuperviewLayoutMargins:1];

  id v5 = objc_alloc(MEMORY[0x1E4F42DB0]);
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = (UIScrollView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
  photosContainerScrollView = self->_photosContainerScrollView;
  self->_photosContainerScrollView = v10;

  [(UIScrollView *)self->_photosContainerScrollView setDelegate:self];
  [(UIScrollView *)self->_photosContainerScrollView setAlwaysBounceHorizontal:0];
  [(UIScrollView *)self->_photosContainerScrollView setAlwaysBounceVertical:0];
  [(UIScrollView *)self->_photosContainerScrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_photosContainerScrollView setShowsVerticalScrollIndicator:0];
  v12 = [(MKPlacePhotosViewController *)self traitCollection];
  uint64_t v13 = [v12 userInterfaceIdiom];

  v14 = self->_photosContainerScrollView;
  if (v13 == 5)
  {
    [(UIScrollView *)v14 setClipsToBounds:1];
    id v15 = [(UIScrollView *)self->_photosContainerScrollView layer];
    [v15 setCornerRadius:4.0];
  }
  else
  {
    [(UIScrollView *)v14 setClipsToBounds:0];
  }
  objc_storeStrong((id *)&self->_photosContainer, self->_photosContainerScrollView);
  v16 = [(MKPlacePhotosViewController *)self traitCollection];
  uint64_t v17 = [v16 userInterfaceIdiom];

  if (v17 == 5)
  {
    v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v6, v7, v8, v9);
    attributionClippingview = self->_attributionClippingview;
    self->_attributionClippingview = v18;

    [(UIView *)self->_attributionClippingview setClipsToBounds:1];
    [(UIView *)self->_attributionClippingview setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  [(UIScrollView *)self->_photosContainerScrollView setPreservesSuperviewLayoutMargins:1];
  [(UIScrollView *)self->_photosContainerScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v20 = [(MKPlacePhotosViewController *)self view];
  [v20 addSubview:self->_photosContainerScrollView];

  if (self->_attributionClippingview)
  {
    v21 = [(MKPlacePhotosViewController *)self view];
    [v21 addSubview:self->_attributionClippingview];
  }
  uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v23 = [(MKPlacePhotosViewController *)self traitCollection];
  uint64_t v24 = [v23 userInterfaceIdiom];

  v168 = (void *)v22;
  if (v24 == 5)
  {
    uint64_t v25 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.compact.left"];
    v26 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    previousPageButton = self->_previousPageButton;
    self->_previousPageButton = v26;

    [(UIButton *)self->_previousPageButton setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v28 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UIButton *)self->_previousPageButton setTintColor:v28];

    [(UIButton *)self->_previousPageButton setAlpha:0.0];
    v164 = (void *)v25;
    [(UIButton *)self->_previousPageButton setImage:v25 forState:0];
    v29 = self->_previousPageButton;
    uint64_t v30 = [MEMORY[0x1E4F42A98] configurationWithPointSize:21.0];
    [(UIButton *)v29 setPreferredSymbolConfiguration:v30 forImageInState:0];

    [(UIButton *)self->_previousPageButton addTarget:self action:sel__scrollPrevious forControlEvents:64];
    unint64_t v31 = [(MKPlacePhotosViewController *)self view];
    [v31 addSubview:self->_previousPageButton];

    uint64_t v32 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.compact.right"];
    uint64_t v33 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    nextPageButton = self->_nextPageButton;
    self->_nextPageButton = v33;

    [(UIButton *)self->_nextPageButton setTranslatesAutoresizingMaskIntoConstraints:0];
    unint64_t v35 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UIButton *)self->_nextPageButton setTintColor:v35];

    [(UIButton *)self->_nextPageButton setAlpha:0.0];
    v162 = (void *)v32;
    [(UIButton *)self->_nextPageButton setImage:v32 forState:0];
    uint64_t v36 = self->_nextPageButton;
    v37 = [MEMORY[0x1E4F42A98] configurationWithPointSize:21.0];
    [(UIButton *)v36 setPreferredSymbolConfiguration:v37 forImageInState:0];

    [(UIButton *)self->_nextPageButton addTarget:self action:sel__scrollNext forControlEvents:64];
    unint64_t v38 = [(MKPlacePhotosViewController *)self view];
    [v38 addSubview:self->_nextPageButton];

    v160 = [(UIView *)self->_attributionClippingview centerXAnchor];
    v157 = [(UIScrollView *)self->_photosContainerScrollView centerXAnchor];
    v154 = [v160 constraintEqualToAnchor:v157];
    v176[0] = v154;
    v151 = [(UIView *)self->_attributionClippingview centerYAnchor];
    v149 = [(UIScrollView *)self->_photosContainerScrollView centerYAnchor];
    v147 = [v151 constraintEqualToAnchor:v149];
    v176[1] = v147;
    v144 = [(UIView *)self->_attributionClippingview heightAnchor];
    v142 = [(UIScrollView *)self->_photosContainerScrollView heightAnchor];
    v140 = [v144 constraintEqualToAnchor:v142];
    v176[2] = v140;
    v138 = [(UIView *)self->_attributionClippingview widthAnchor];
    v136 = [(UIScrollView *)self->_photosContainerScrollView widthAnchor];
    v135 = [v138 constraintEqualToAnchor:v136];
    v176[3] = v135;
    unint64_t v39 = [(UIButton *)self->_previousPageButton centerYAnchor];
    unint64_t v40 = [(UIScrollView *)self->_photosContainerScrollView centerYAnchor];
    [v39 constraintEqualToAnchor:v40];
    v42 = uint64_t v41 = (void *)v22;
    v176[4] = v42;
    v43 = [(UIButton *)self->_nextPageButton centerYAnchor];
    v44 = [(UIScrollView *)self->_photosContainerScrollView centerYAnchor];
    long long v45 = [v43 constraintEqualToAnchor:v44];
    v176[5] = v45;
    long long v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:6];
    [v41 addObjectsFromArray:v46];

    long long v47 = self->_previousPageButton;
    if (self->_isRTL)
    {
      long long v48 = [(UIButton *)v47 leadingAnchor];
      v49 = [(UIScrollView *)self->_photosContainerScrollView trailingAnchor];
      objc_super v50 = [v48 constraintEqualToAnchor:v49 constant:3.0];
      v175[0] = v50;
      v51 = [(UIButton *)self->_nextPageButton trailingAnchor];
      uint64_t v52 = [(UIScrollView *)self->_photosContainerScrollView leadingAnchor];
      v53 = [v51 constraintEqualToAnchor:v52 constant:-3.0];
      v175[1] = v53;
      v54 = v175;
    }
    else
    {
      long long v48 = [(UIButton *)v47 trailingAnchor];
      v49 = [(UIScrollView *)self->_photosContainerScrollView leadingAnchor];
      objc_super v50 = [v48 constraintEqualToAnchor:v49 constant:-3.0];
      v174[0] = v50;
      v51 = [(UIButton *)self->_nextPageButton leadingAnchor];
      uint64_t v52 = [(UIScrollView *)self->_photosContainerScrollView trailingAnchor];
      v53 = [v51 constraintEqualToAnchor:v52 constant:3.0];
      v174[1] = v53;
      v54 = v174;
    }
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    uint64_t v22 = (uint64_t)v168;
    [v168 addObjectsFromArray:v55];
  }
  uint64_t v56 = [objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:self action:sel_handleHover_];
  v57 = [(MKPlacePhotosViewController *)self view];
  v166 = (void *)v56;
  [v57 addGestureRecognizer:v56];

  uint64_t v58 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__photoSelected_];
  v59 = [(MKPlacePhotosViewController *)self view];
  v165 = (void *)v58;
  [v59 addGestureRecognizer:v58];

  if ([(MKPlacePhotosViewController *)self shouldShowAddPhotoButtons])
  {
    v60 = (void *)v22;
  }
  else
  {
    v61 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v62 = [v61 BOOLForKey:@"MKPlacecardForceNativePhotoCarousel"];

    if (v62) {
      goto LABEL_24;
    }
    if (self->_mode == 2) {
      goto LABEL_24;
    }
    v63 = [(MKMapItem *)self->_mapItem _mapkit_preferredFirstPhotoVendor];
    char v64 = [v63 shouldSuppressPhotoAttribution];

    if ((v64 & 1) != 0
      || self->_mode == 3
      || (v65 = [[MKPhotoSmallAttributionView alloc] initWithMapItem:self->_mapItem], photosSmallAttributionsView = self->_photosSmallAttributionsView, self->_photosSmallAttributionsView = &v65->super, photosSmallAttributionsView, [(UIView *)self->_photosSmallAttributionsView setAlpha:0.0], !self->_photosSmallAttributionsView))
    {
LABEL_24:
      v60 = (void *)v22;
    }
    else
    {
      v67 = self->_attributionClippingview;
      v60 = (void *)v22;
      if (v67)
      {
        -[UIView addSubview:](v67, "addSubview:");
      }
      else
      {
        v134 = [(MKPlacePhotosViewController *)self view];
        [v134 addSubview:self->_photosSmallAttributionsView];
      }
    }
  }
  unint64_t mode = self->_mode;
  if (mode) {
    BOOL v69 = mode == 3;
  }
  else {
    BOOL v69 = 1;
  }
  if (v69) {
    double v70 = 170.0;
  }
  else {
    double v70 = 163.0;
  }
  v71 = [(UIScrollView *)self->_photosContainerScrollView heightAnchor];
  v72 = [v71 constraintEqualToConstant:v70];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v72;

  v74 = [(UIScrollView *)self->_photosContainerScrollView leadingAnchor];
  v75 = [(MKPlacePhotosViewController *)self view];
  v76 = [v75 layoutMarginsGuide];
  v77 = [v76 leadingAnchor];
  uint64_t v78 = [v74 constraintEqualToAnchor:v77];

  v79 = [(UIScrollView *)self->_photosContainerScrollView trailingAnchor];
  v80 = [(MKPlacePhotosViewController *)self view];
  v81 = [v80 layoutMarginsGuide];
  v82 = [v81 trailingAnchor];
  uint64_t v83 = [v79 constraintEqualToAnchor:v82];

  v173[0] = self->_heightConstraint;
  v84 = [(UIScrollView *)self->_photosContainerScrollView topAnchor];
  v85 = [(MKPlacePhotosViewController *)self view];
  v86 = [v85 topAnchor];
  v87 = [v84 constraintEqualToAnchor:v86];
  v173[1] = v87;
  v173[2] = v78;
  v161 = (void *)v83;
  v163 = (void *)v78;
  v173[3] = v83;
  v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:4];
  v89 = v60;
  [v60 addObjectsFromArray:v88];

  v90 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  bottomHairline = self->_bottomHairline;
  self->_bottomHairline = v90;

  [(UIView *)self->_bottomHairline setTranslatesAutoresizingMaskIntoConstraints:0];
  v92 = [(MKPlacePhotosViewController *)self view];
  [v92 addSubview:self->_bottomHairline];

  v93 = [(UIViewController *)self mk_theme];
  v94 = [v93 separatorLineColor];
  [(UIView *)self->_bottomHairline setBackgroundColor:v94];

  [(UIView *)self->_bottomHairline setHidden:1];
  v95 = [(UIView *)self->_bottomHairline leadingAnchor];
  v155 = [(MKPlacePhotosViewController *)self view];
  v152 = [v155 layoutMarginsGuide];
  [v152 leadingAnchor];
  v150 = v158 = v95;
  v148 = objc_msgSend(v95, "constraintEqualToAnchor:");
  v172[0] = v148;
  v96 = [(UIView *)self->_bottomHairline trailingAnchor];
  v145 = [(MKPlacePhotosViewController *)self view];
  v143 = [v145 layoutMarginsGuide];
  [v143 trailingAnchor];
  v141 = v146 = v96;
  v139 = objc_msgSend(v96, "constraintEqualToAnchor:");
  v172[1] = v139;
  v97 = [(UIView *)self->_bottomHairline bottomAnchor];
  v98 = [(MKPlacePhotosViewController *)self view];
  v99 = [v98 bottomAnchor];
  v137 = v97;
  v100 = [v97 constraintEqualToAnchor:v99];
  v172[2] = v100;
  v101 = [(UIView *)self->_bottomHairline heightAnchor];
  v102 = [(MKPlacePhotosViewController *)self view];
  v103 = [v102 window];
  v104 = [v103 screen];
  if (v104)
  {
    v105 = [v102 window];
    v106 = [v105 screen];
    [v106 nativeScale];
    double v108 = v107;

    v89 = v168;
  }
  else
  {
    v105 = [MEMORY[0x1E4F42D90] mainScreen];
    [v105 nativeScale];
    double v108 = v109;
  }

  double v110 = 1.0;
  if (v108 > 0.0) {
    double v110 = 1.0 / v108;
  }
  v111 = [v101 constraintEqualToConstant:v110];
  v172[3] = v111;
  v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:4];
  [v89 addObjectsFromArray:v112];

  if (self->_mapItem) {
    [(MKPlacePhotosViewController *)self _createImageViews];
  }
  attributionCell = self->_attributionCell;
  if (attributionCell)
  {
    v114 = [(MKPlaceAttributionCell *)attributionCell bottomAnchor];
    v115 = [(MKPlacePhotosViewController *)self view];
    v116 = [v115 bottomAnchor];
    v117 = [v114 constraintEqualToAnchor:v116];
    bottomConstraint = self->_bottomConstraint;
    self->_bottomConstraint = v117;

    v167 = [(MKPlaceAttributionCell *)self->_attributionCell topAnchor];
    uint64_t v153 = [(UIView *)self->_photosContainer bottomAnchor];
    v119 = [v167 constraintEqualToAnchor:v153];
    v171[0] = v119;
    v156 = [(MKPlaceAttributionCell *)self->_attributionCell leadingAnchor];
    v159 = [(MKPlacePhotosViewController *)self view];
    v120 = [v159 leadingAnchor];
    v121 = [(NSLayoutConstraint *)v156 constraintEqualToAnchor:v120];
    v171[1] = v121;
    v122 = [(MKPlaceAttributionCell *)self->_attributionCell trailingAnchor];
    v123 = [(MKPlacePhotosViewController *)self view];
    v124 = [v123 trailingAnchor];
    v125 = [v122 constraintEqualToAnchor:v124];
    v171[2] = v125;
    v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:3];
    [v168 addObjectsFromArray:v126];

    v127 = (void *)v153;
    v128 = v167;

    v89 = v168;
    v129 = v156;
  }
  else
  {
    v128 = [(UIScrollView *)self->_photosContainerScrollView bottomAnchor];
    v127 = [(MKPlacePhotosViewController *)self view];
    v119 = [v127 bottomAnchor];
    v130 = [v128 constraintEqualToAnchor:v119];
    v129 = self->_bottomConstraint;
    self->_bottomConstraint = v130;
  }

  [v89 addObject:self->_bottomConstraint];
  [MEMORY[0x1E4F28DC8] activateConstraints:v89];
  [(MKPlacePhotosViewController *)self updateBottomHairlineVisibility];
  v131 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v131 addObserver:self selector:sel__didBecomeActive_ name:*MEMORY[0x1E4F43648] object:0];

  v132 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v132 addObserver:self selector:sel__willResignActive_ name:*MEMORY[0x1E4F43710] object:0];

  v133 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v133))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v133, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlacePhotosViewDidLoad", (const char *)&unk_18BD3917F, buf, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)MKPlacePhotosViewController;
  [(MKPlacePhotosViewController *)&v18 viewDidAppear:a3];
  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__catchScrollNotification_ name:@"MKStackingScrollNotification" object:0];

  id v5 = [(MKPlacePhotosViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  lookAroundContainerView = self->_lookAroundContainerView;
  mapItem = self->_mapItem;
  BOOL v9 = v6 == 5 || [(UIViewController *)self contentVisibility] == 3;
  [(MKLookAroundContainerView *)lookAroundContainerView setMapItem:mapItem wantsCloseUpView:v9];
  uint64_t v10 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
  v11 = (void *)v10;
  if (v10)
  {
    v19 = @"MKLookAroundView";
    v20[0] = v10;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  }
  else
  {
    v12 = 0;
  }
  uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"MKPlacePhotosViewControllerDidDisplayPhotos" object:self userInfo:v12];

  if (self->_initialAppearanceSignpostID != -1)
  {
    v14 = MKGetPlaceCardLog();
    id v15 = v14;
    os_signpost_id_t initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
    if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v15, OS_SIGNPOST_INTERVAL_END, initialAppearanceSignpostID, "PlacecardPhotosInitialAppearance", (const char *)&unk_18BD3917F, v17, 2u);
    }

    self->_os_signpost_id_t initialAppearanceSignpostID = -1;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKPlacePhotosViewController;
  [(MKPlacePhotosViewController *)&v5 viewWillAppear:a3];
  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MKPlacePhotosViewControllerWillDisplayPhotos" object:self];

  self->_isDisappearing = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKPlacePhotosViewController;
  [(MKPlacePhotosViewController *)&v5 viewWillDisappear:a3];
  self->_isDisappearing = 1;
  [(MKPlacePhotosViewController *)self _cancelLoadPhotos];
  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"MKStackingScrollNotification" object:0];
}

- (void)_didBecomeActive:(id)a3
{
  if ([(MKPlacePhotosViewController *)self isViewLoaded])
  {
    int v4 = [(MKPlacePhotosViewController *)self view];
    objc_super v5 = [v4 window];

    if (v5)
    {
      [(MKPlacePhotosViewController *)self _loadPhotos];
    }
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MKPlacePhotosViewController;
  [(MKPlacePhotosViewController *)&v2 dealloc];
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  if (self->_showsBottomHairline != a3)
  {
    self->_showsBottomHairline = a3;
    [(MKPlacePhotosViewController *)self updateBottomHairlineVisibility];
  }
}

- (void)updateBottomHairlineVisibility
{
  if ([(MKPlacePhotosViewController *)self showsBottomHairline])
  {
    [(UIView *)self->_bottomHairline setHidden:0];
    id v12 = [(MKPlacePhotosViewController *)self view];
    unint64_t v3 = [v12 window];
    int v4 = [v3 screen];
    if (v4)
    {
      objc_super v5 = [v12 window];
      uint64_t v6 = [v5 screen];
      [v6 nativeScale];
      double v8 = v7;
    }
    else
    {
      objc_super v5 = [MEMORY[0x1E4F42D90] mainScreen];
      [v5 nativeScale];
      double v8 = v10;
    }

    double v11 = 1.0 / v8 + 16.0;
    if (v8 <= 0.0) {
      double v11 = 17.0;
    }
    [(NSLayoutConstraint *)self->_bottomConstraint setConstant:-v11];
  }
  else
  {
    [(NSLayoutConstraint *)self->_bottomConstraint setConstant:0.0];
    bottomHairline = self->_bottomHairline;
    [(UIView *)bottomHairline setHidden:1];
  }
}

- (MKLookAroundView)lookAroundView
{
  return (MKLookAroundView *)[(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
}

- (void)addAttributionCell
{
  if (!self->_attributionCell)
  {
    unint64_t v3 = [MKPlaceAttributionCell alloc];
    int v4 = -[MKPlaceAttributionCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    attributionCell = self->_attributionCell;
    self->_attributionCell = v4;

    [(MKPlaceAttributionCell *)self->_attributionCell setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKPlaceAttributionCell *)self->_attributionCell setCellDelegate:self];
    uint64_t v6 = [(MKPlacePhotosViewController *)self view];
    [v6 addSubview:self->_attributionCell];

    [(MKPlacePhotosViewController *)self updateAttributionCell];
  }
}

- (void)updateAttributionCell
{
  attributionCell = self->_attributionCell;
  if (attributionCell)
  {
    id v3 = [(MKPlacePhotosViewController *)self formattedAttributionString];
    [(MKPlaceAttributionCell *)attributionCell setAttributionString:v3];
  }
}

- (id)formattedAttributionString
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(MKPlacePhotosViewController *)self attributionString];
  int v4 = [MEMORY[0x1E4F42670] defaultParagraphStyle];
  objc_super v5 = (void *)[v4 mutableCopy];

  [v5 setAlignment:4];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v3];
  uint64_t v7 = *MEMORY[0x1E4F42540];
  v14[0] = v5;
  uint64_t v8 = *MEMORY[0x1E4F42510];
  v13[0] = v7;
  v13[1] = v8;
  BOOL v9 = [(UIViewController *)self mk_theme];
  double v10 = [v9 tintColor];
  v14[1] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  objc_msgSend(v6, "addAttributes:range:", v11, 0, objc_msgSend(v6, "length"));

  return v6;
}

- (id)_firstPartyMorePhotosAttributionString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F42698]);
  objc_super v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"photo.on.rectangle"];
  uint64_t v6 = (void *)MEMORY[0x1E4F42A98];
  uint64_t v7 = [MEMORY[0x1E4F42A30] systemFontOfSize:13.0];
  uint64_t v8 = [v6 configurationWithFont:v7];
  BOOL v9 = [v5 imageWithConfiguration:v8];
  double v10 = [v9 imageWithRenderingMode:2];
  [v4 setImage:v10];

  double v11 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v4];
  id v12 = _MKLocalizedStringFromThisBundle(@"More Photos");
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12];
  [v3 appendAttributedString:v11];
  [v3 appendAttributedString:v13];
  uint64_t v14 = [v3 length];
  uint64_t v15 = *MEMORY[0x1E4F42508];
  v16 = [MEMORY[0x1E4F42A30] systemFontOfSize:13.0];
  objc_msgSend(v3, "addAttribute:value:range:", v15, v16, 0, v14);

  uint64_t v17 = *MEMORY[0x1E4F42510];
  objc_super v18 = [(UIViewController *)self mk_theme];
  v19 = [v18 tintColor];
  objc_msgSend(v3, "addAttribute:value:range:", v17, v19, 0, v14);

  return v3;
}

- (id)attributionString
{
  mapItem = self->_mapItem;
  id v4 = [(MKMapItem *)mapItem _mapkit_preferredFirstPhotoVendor];
  objc_super v5 = _MKLocalizedStringFromThisBundle(@"More Photos on %@");
  uint64_t v6 = _MKLocalizedStringFromThisBundle(@"More Photos on %@");
  uint64_t v7 = [(UIViewController *)self mk_theme];
  if ([v7 isDarkTheme])
  {
    uint64_t v8 = [MEMORY[0x1E4F428B8] whiteColor];
    BOOL v9 = [(MKMapItem *)mapItem _attributionFor:v4 sourceStringFormat:v5 moreSourceStringFormat:v6 imageTintColor:v8];
  }
  else
  {
    BOOL v9 = [(MKMapItem *)mapItem _attributionFor:v4 sourceStringFormat:v5 moreSourceStringFormat:v6 imageTintColor:0];
  }

  return v9;
}

- (void)openURL
{
  id v6 = [(MKPlacePhotosViewController *)self analyticsDelegate];
  if (v6) {
    [v6 infoCardAnalyticsDidSelectAction:6023 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
  }
  id v3 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_super v5 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
    [v5 placeCardActionControllerDidSelectViewAllPhotos:0 presentingViewController:self];
  }
}

- (void)_createImageViews
{
  if (self->_photosCount == 3 && !MapKitIdiomIsMacCatalyst()) {
    self->_unint64_t mode = 2;
  }
  id v30 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_photosCount];
  id v3 = [(MKPlacePhotosViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 5
    && ([MEMORY[0x1E4F64918] modernManager],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isMuninEnabled],
        v5,
        v6)
    && ((unint64_t v7 = self->_options & 1, [(MKMapItem *)self->_mapItem _hasLookAroundStorefront])
      ? (BOOL v8 = v7 == 0)
      : (BOOL v8 = 0),
        v8))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_photosControllerDelegate);
    uint64_t v25 = [WeakRetained lookAroundContainerForPlaceCardPhotosController:self];
    lookAroundContainerView = self->_lookAroundContainerView;
    self->_lookAroundContainerView = v25;

    [(MKLookAroundContainerView *)self->_lookAroundContainerView setDelegate:self];
    [(MKLookAroundContainerView *)self->_lookAroundContainerView setMapItem:self->_mapItem];
    objc_storeStrong((id *)&self->_externalView, self->_lookAroundContainerView);
    [(UIView *)self->_photosContainer addSubview:self->_externalView];
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)&self->_photosControllerDelegate);
    [v9 cleanLookAroundContainerForPlaceCardPhotosController:self];
  }
  if (self->_photosCount)
  {
    unint64_t v10 = 0;
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v11, v12, v13, v14);
      [v15 setClipsToBounds:1];
      [v15 setContentMode:2];
      [v30 addObject:v15];
      [(UIView *)self->_photosContainer addSubview:v15];

      ++v10;
    }
    while (v10 < self->_photosCount);
  }
  unint64_t mode = self->_mode;
  if (mode == 2)
  {
    [(MKPlacePhotosViewController *)self addAttributionCell];
    goto LABEL_29;
  }
  if (mode == 3) {
    goto LABEL_29;
  }
  BOOL v17 = [(MKPlacePhotosViewController *)self isFirstParty] || self->_photosCount > 2;
  objc_super v18 = +[MKPhotoBigAttributionView bigAttributionViewForMapItem:self->_mapItem attributionType:v17 isFirstParty:[(MKPlacePhotosViewController *)self isFirstParty] context:0];
  primaryAttributionView = self->_primaryAttributionView;
  self->_primaryAttributionView = v18;

  if ([(MKPlacePhotosViewController *)self shouldShowAddPhotoButtons])
  {
    if (self->_photosCount < 4) {
      goto LABEL_28;
    }
LABEL_25:
    uint64_t v22 = +[MKPhotoBigAttributionView bigAttributionViewForMapItem:self->_mapItem attributionType:0 isFirstParty:[(MKPlacePhotosViewController *)self isFirstParty] context:0];
    secondaryAttributionView = self->_secondaryAttributionView;
    self->_secondaryAttributionView = v22;

    [v30 addObject:self->_secondaryAttributionView];
    [(UIView *)self->_photosContainer addSubview:self->_secondaryAttributionView];
    goto LABEL_28;
  }
  uint64_t v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (([v20 BOOLForKey:@"MKPlacecardForceNativePhotoCarousel"] & 1) == 0)
  {

    goto LABEL_28;
  }
  unint64_t photosCount = self->_photosCount;

  if (photosCount > 3) {
    goto LABEL_25;
  }
LABEL_28:
  [v30 addObject:self->_primaryAttributionView];
  [(UIView *)self->_photosContainer addSubview:self->_primaryAttributionView];
LABEL_29:
  v27 = (NSArray *)[v30 copy];
  photoViews = self->_photoViews;
  self->_photoViews = v27;

  v29 = [(UIViewController *)self mk_theme];
  [(MKPlacePhotosViewController *)self _updatePhotoBackgroundColor:v29];

  [(MKPlacePhotosViewController *)self layoutImages];
  [(MKPlacePhotosViewController *)self _applyCornerRadius];
}

- (void)_applyCornerRadius
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSArray *)self->_photoViews count];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v4 = self->_photoViews;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        unint64_t v10 = objc_msgSend(v9, "layer", (void)v58);
        [v10 setCornerRadius:0.0];

        double v11 = [v9 layer];
        [v11 setMaskedCorners:0];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v6);
  }

  externalView = self->_externalView;
  if (externalView)
  {
    double v13 = externalView;
    double v14 = [(UIView *)v13 layer];
    [v14 setCornerRadius:4.0];

    uint64_t v15 = [(UIView *)v13 layer];
    [v15 setMaskedCorners:15];

    uint64_t v16 = *MEMORY[0x1E4F39EA8];
    BOOL v17 = [(UIView *)v13 layer];

    [v17 setCornerCurve:v16];
  }
  if (v3)
  {
    if (v3 == 1)
    {
      objc_super v18 = [(NSArray *)self->_photoViews firstObject];
      v19 = [v18 layer];
      [v19 setCornerRadius:4.0];

      uint64_t v20 = [v18 layer];
      [v20 setMaskedCorners:15];

      uint64_t v21 = *MEMORY[0x1E4F39EA8];
      uint64_t v22 = [v18 layer];
      [v22 setCornerCurve:v21];
    }
    else
    {
      if (v3 % 3 - 1 >= 2)
      {
        if (v3 % 3) {
          goto LABEL_25;
        }
        BOOL isRTL = self->_isRTL;
        objc_super v18 = [(NSArray *)self->_photoViews firstObject];
        uint64_t v25 = [v18 layer];
        [v25 setCornerRadius:4.0];

        v26 = [v18 layer];
        v27 = v26;
        NSUInteger v28 = v3 - 2;
        if (isRTL)
        {
          [v26 setMaskedCorners:10];

          uint64_t v29 = *MEMORY[0x1E4F39EA8];
          id v30 = [v18 layer];
          [v30 setCornerCurve:v29];

          uint64_t v22 = [(NSArray *)self->_photoViews objectAtIndexedSubscript:v28];
          unint64_t v31 = [v22 layer];
          [v31 setCornerRadius:4.0];

          uint64_t v32 = [v22 layer];
          [v32 setMaskedCorners:1];

          uint64_t v33 = [v22 layer];
          [v33 setCornerCurve:v29];

          v34 = [(NSArray *)self->_photoViews lastObject];
          unint64_t v35 = [v34 layer];
          [v35 setCornerRadius:4.0];

          uint64_t v36 = [v34 layer];
          v37 = v36;
          uint64_t v38 = 4;
        }
        else
        {
          [v26 setMaskedCorners:5];

          uint64_t v29 = *MEMORY[0x1E4F39EA8];
          long long v45 = [v18 layer];
          [v45 setCornerCurve:v29];

          uint64_t v22 = [(NSArray *)self->_photoViews objectAtIndexedSubscript:v28];
          long long v46 = [v22 layer];
          [v46 setCornerRadius:4.0];

          long long v47 = [v22 layer];
          [v47 setMaskedCorners:2];

          long long v48 = [v22 layer];
          [v48 setCornerCurve:v29];

          v34 = [(NSArray *)self->_photoViews lastObject];
          v49 = [v34 layer];
          [v49 setCornerRadius:4.0];

          uint64_t v36 = [v34 layer];
          v37 = v36;
          uint64_t v38 = 8;
        }
        objc_msgSend(v36, "setMaskedCorners:", v38, (void)v58);

        objc_super v50 = [v34 layer];
        [v50 setCornerCurve:v29];
      }
      else
      {
        photoViews = self->_photoViews;
        if (self->_isRTL)
        {
          objc_super v18 = [(NSArray *)photoViews lastObject];
          [(NSArray *)self->_photoViews firstObject];
        }
        else
        {
          objc_super v18 = [(NSArray *)photoViews firstObject];
          [(NSArray *)self->_photoViews lastObject];
        uint64_t v22 = };
        unint64_t v39 = objc_msgSend(v18, "layer", (void)v58);
        [v39 setCornerRadius:4.0];

        unint64_t v40 = [v18 layer];
        [v40 setMaskedCorners:5];

        uint64_t v41 = *MEMORY[0x1E4F39EA8];
        v42 = [v18 layer];
        [v42 setCornerCurve:v41];

        v43 = [v22 layer];
        [v43 setCornerRadius:4.0];

        v44 = [v22 layer];
        [v44 setMaskedCorners:10];

        v34 = [v22 layer];
        [v34 setCornerCurve:v41];
      }
    }
LABEL_25:
    if ([(MKPlacePhotosViewController *)self numberOfBigAttributionViews] == 2)
    {
      v51 = [(MKPhotoBigAttributionView *)self->_secondaryAttributionView layer];
      [v51 setCornerRadius:4.0];

      uint64_t v52 = [(MKPhotoBigAttributionView *)self->_secondaryAttributionView layer];
      [v52 setMaskedCorners:2];

      uint64_t v53 = *MEMORY[0x1E4F39EA8];
      v54 = [(MKPhotoBigAttributionView *)self->_secondaryAttributionView layer];
      [v54 setCornerCurve:v53];

      v55 = [(MKPhotoBigAttributionView *)self->_primaryAttributionView layer];
      [v55 setCornerRadius:4.0];

      uint64_t v56 = [(MKPhotoBigAttributionView *)self->_primaryAttributionView layer];
      [v56 setMaskedCorners:8];

      v57 = [(MKPhotoBigAttributionView *)self->_primaryAttributionView layer];
      [v57 setCornerCurve:v53];
    }
  }
}

- (void)layoutImages
{
  objc_super v2 = self;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  [(UIScrollView *)self->_photosContainerScrollView bounds];
  double v4 = v3;
  double v6 = v5;
  if ([(NSArray *)v2->_photoViews count])
  {
    if (v6 == 0.0 || v4 == 0.0) {
      return;
    }
    externalView = v2->_externalView;
  }
  else
  {
    externalView = v2->_externalView;
    if (!externalView || v6 == 0.0 || v4 == 0.0) {
      return;
    }
  }
  if (externalView) {
    double v8 = 170.0;
  }
  else {
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (externalView) {
    double v9 = 226.5;
  }
  else {
    double v9 = *MEMORY[0x1E4F1DB30];
  }
  if (!v2->_mode)
  {
    uint64_t v59 = 1072;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    p_isa = (id *)&v2->super.super.super.isa;
    uint64_t v58 = 1008;
    obj = v2->_photoViews;
    uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      unint64_t v19 = 0;
      id v12 = 0;
      if (externalView) {
        double v20 = 231.5;
      }
      else {
        double v20 = 0.0;
      }
      uint64_t v21 = *(void *)v66;
      double v22 = 0.0;
      do
      {
        uint64_t v23 = 0;
        unint64_t v24 = v19;
        uint64_t v25 = v12;
        do
        {
          if (*(void *)v66 != v21) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v65 + 1) + 8 * v23);
          objc_opt_class();
          int v27 = v19 + v23 + (objc_opt_isKindOfClass() & 1) - 3 * (v24 / 3);
          [p_isa sizeForIndex:v19 + v23];
          double v29 = v28;
          double v31 = v30;
          objc_msgSend(v26, "setFrame:", v20, v22, v28, v30);
          double v32 = v31 + 2.0;
          if (v27) {
            double v33 = v22;
          }
          else {
            double v33 = 0.0;
          }
          if (v27) {
            double v34 = v20;
          }
          else {
            double v34 = v20 + v29 + 2.0;
          }
          if (v27 == 1)
          {
            double v35 = v20;
          }
          else
          {
            double v32 = v33;
            double v35 = v34;
          }
          if (v27 == 2) {
            double v22 = 0.0;
          }
          else {
            double v22 = v32;
          }
          if (v27 == 2) {
            double v20 = v20 + v29 + 2.0;
          }
          else {
            double v20 = v35;
          }
          id v12 = v26;

          ++v24;
          ++v23;
          uint64_t v25 = v12;
        }
        while (v18 != v23);
        uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v65 objects:v70 count:16];
        v19 += v23;
      }
      while (v18);
    }
    else
    {
      id v12 = 0;
    }

    objc_super v2 = (MKPlacePhotosViewController *)p_isa;
    [p_isa[129] setHidden:0];
    [p_isa[127] setAlwaysBounceHorizontal:1];
    goto LABEL_63;
  }
  [(UIScrollView *)v2->_photosContainerScrollView bounds];
  double Width = CGRectGetWidth(v72);
  [(UIScrollView *)v2->_photosContainerScrollView bounds];
  double Height = CGRectGetHeight(v73);
  id v12 = v2->_externalView;
  double v13 = (Width + -2.0) / 1.5;
  if (v12)
  {
    if (v2->_photosCount) {
      double v9 = (Width + -2.0) / 1.5;
    }
    else {
      double v9 = Width;
    }
    double v14 = v9 + 5.0;
    id v15 = v12;
    double v8 = Height;
  }
  else
  {
    double v14 = 0.0;
  }
  unint64_t v36 = [(NSArray *)v2->_photoViews count];
  photoViews = v2->_photoViews;
  if (v36 < 2)
  {
    if ([(NSArray *)photoViews count] != 1) {
      goto LABEL_52;
    }
    unint64_t v39 = [(NSArray *)v2->_photoViews objectAtIndexedSubscript:0];
    objc_msgSend(v39, "setFrame:", v14, 0.0, Width, Height);

    [(NSArray *)v2->_photoViews objectAtIndexedSubscript:0];
    uint64_t v38 = v12;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v38 = [(NSArray *)photoViews objectAtIndexedSubscript:0];
    objc_msgSend(v38, "setFrame:", v14, 0.0, (Width + -2.0) / 1.5, Height);
  }

LABEL_52:
  double v40 = Width + -2.0 - v13;
  if ([(NSArray *)v2->_photoViews count] == 3)
  {
    double Height = (Height + -2.0) * 0.5;
    double v41 = v13 + v14 + 2.0;
    v42 = [(NSArray *)v2->_photoViews objectAtIndexedSubscript:1];
    objc_msgSend(v42, "setFrame:", v41, 0.0, v40, Height);

    double v43 = Height + 2.0;
    uint64_t v44 = 2;
    long long v45 = [(NSArray *)v2->_photoViews objectAtIndexedSubscript:2];
LABEL_56:
    objc_msgSend(v45, "setFrame:", v41, v43, v40, Height);

    uint64_t v46 = [(NSArray *)v2->_photoViews objectAtIndexedSubscript:v44];

    id v12 = (id)v46;
    goto LABEL_57;
  }
  if ([(NSArray *)v2->_photoViews count] == 2)
  {
    double v41 = v13 + v14 + 2.0;
    uint64_t v44 = 1;
    long long v45 = [(NSArray *)v2->_photoViews objectAtIndexedSubscript:1];
    double v43 = 0.0;
    goto LABEL_56;
  }
LABEL_57:
  if (v2->_externalView) {
    BOOL v47 = [(NSArray *)v2->_photoViews count] != 0;
  }
  else {
    BOOL v47 = 0;
  }
  [(UIScrollView *)v2->_photosContainerScrollView setAlwaysBounceHorizontal:v47];
LABEL_63:
  -[UIView setFrame:](v2->_externalView, "setFrame:", 0.0, 0.0, v9, v8, v58, v59);
  photosContainerScrollView = v2->_photosContainerScrollView;
  [v12 frame];
  double MaxX = CGRectGetMaxX(v74);
  [(UIScrollView *)v2->_photosContainerScrollView frame];
  -[UIScrollView setContentSize:](photosContainerScrollView, "setContentSize:", MaxX, CGRectGetHeight(v75));
  if (v2->_isRTL)
  {
    [v12 frame];
    double v50 = CGRectGetMaxX(v76);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v51 = v2->_photoViews;
    uint64_t v52 = [(NSArray *)v51 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v62 != v54) {
            objc_enumerationMutation(v51);
          }
          uint64_t v56 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          [v56 frame];
          objc_msgSend(v56, "setFrame:", v50 - CGRectGetMaxX(v77), v77.origin.y, v77.size.width, v77.size.height);
        }
        uint64_t v53 = [(NSArray *)v51 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v53);
    }

    v57 = v2->_externalView;
    if (v57)
    {
      [(UIView *)v57 frame];
      -[UIView setFrame:](v2->_externalView, "setFrame:", v50 - CGRectGetMaxX(v78), v78.origin.y, v78.size.width, v78.size.height);
    }
    [(UIScrollView *)v2->_photosContainerScrollView frame];
    -[UIScrollView setContentOffset:](v2->_photosContainerScrollView, "setContentOffset:", v50 - CGRectGetWidth(v79), 0.0);
  }
}

- (CGSize)sizeForIndex:(unint64_t)a3
{
  if (self->_photosCount <= a3) {
    [(MKPlacePhotosViewController *)self _photoActionSize];
  }
  else {
    -[MKPlacePhotosViewController _photoSizeForIndex:](self, "_photoSizeForIndex:");
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_photoActionSize
{
  double v2 = 112.0;
  double v3 = 170.0;
  if ((self->_primaryAttributionView != 0) != (self->_secondaryAttributionView != 0)) {
    double v2 = 170.0;
  }
  else {
    double v3 = 84.0;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_photoSizeForIndex:(unint64_t)a3
{
  if (self->_photosCount <= a3)
  {
    BOOL v13 = a3 != 0;
    BOOL v14 = 0xAAAAAAAAAAAAAAABLL * a3 - 0x5555555555555556 < 0x5555555555555555;
    if (v13 && v14) {
      double v11 = 84.0;
    }
    else {
      double v11 = 170.0;
    }
    if (v13 && v14) {
      double v12 = 112.0;
    }
    else {
      double v12 = 170.0;
    }
  }
  else
  {
    unint64_t v5 = a3 % 3;
    if (a3 % 3)
    {
      double v6 = [(NSArray *)self->_photos objectAtIndexedSubscript:a3];
      if (v5 == 1) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = -1;
      }
      unint64_t v8 = v7 + a3;
      if (v7 + a3 >= [(NSArray *)self->_photos count]) {
        unint64_t v9 = a3;
      }
      else {
        unint64_t v9 = v8;
      }
      unint64_t v10 = [(NSArray *)self->_photos objectAtIndexedSubscript:v9];
      if ([v6 format] == 2 && objc_msgSend(v10, "format") == 2)
      {
        double v11 = 84.0;
        double v12 = 112.0;
      }
      else
      {
        double v12 = 84.0;
        double v11 = 84.0;
      }
    }
    else
    {
      id v15 = [(NSArray *)self->_photos objectAtIndexedSubscript:a3];
      uint64_t v16 = [v15 format];
      if (v16 == 2) {
        double v12 = 226.5;
      }
      else {
        double v12 = dbl_18BD1B4B0[v16 == 1];
      }

      double v11 = 170.0;
    }
  }
  double v17 = v12;
  double v18 = v11;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v8 = a3;
  [v8 contentOffset];
  double v5 = v4;
  if (self->_isRTL)
  {
    [v8 contentSize];
    double v7 = v6 - v5;
    [v8 frame];
    double v5 = v7 - CGRectGetWidth(v10);
  }
  [(MKPlacePhotosViewController *)self updateAttributionPositionWithOffset:v5];
  [(MKPlacePhotosViewController *)self _updateChevronVisibility];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  self->_photoScrollViewScrollingLeft = 0;
  self->_photoScrollViewScrollingRight = 0;
}

- (void)updateAttributionPositionWithOffset:(double)a3
{
  photosSmallAttributionsView = self->_photosSmallAttributionsView;
  if (!photosSmallAttributionsView) {
    return;
  }
  [(UIView *)photosSmallAttributionsView intrinsicContentSize];
  double v7 = v6;
  double v9 = v8;
  CGRect v10 = [(MKPlacePhotosViewController *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 == 5)
  {
    externalView = self->_externalView;
    if (externalView)
    {
      [(UIView *)externalView bounds];
      double v14 = v13 + 0.0;
    }
    else
    {
      double v14 = 0.0;
    }
  }
  else
  {
    id v15 = [(MKPlacePhotosViewController *)self view];
    [v15 directionalLayoutMargins];
    double v17 = v16;

    double v18 = self->_externalView;
    if (v18)
    {
      [(UIView *)v18 bounds];
      double v20 = v19 + 5.0;
    }
    else
    {
      double v20 = 0.0;
    }
    double v14 = v17 + v20;
  }
  uint64_t v21 = [(MKPlacePhotosViewController *)self analyticsDelegate];

  if (v21)
  {
    double lastPhotoScrollOffset = self->_lastPhotoScrollOffset;
    if (lastPhotoScrollOffset < a3 && !self->_photoScrollViewScrollingLeft)
    {
      self->_photoScrollViewScrollingLeft = 1;
      self->_photoScrollViewScrollingRight = 0;
      uint64_t v23 = [(MKPlacePhotosViewController *)self analyticsDelegate];
      unint64_t v24 = v23;
      uint64_t v25 = 6048;
      goto LABEL_17;
    }
    if (lastPhotoScrollOffset > a3 && !self->_photoScrollViewScrollingRight)
    {
      self->_photoScrollViewScrollingLeft = 0;
      self->_photoScrollViewScrollingRight = 1;
      uint64_t v23 = [(MKPlacePhotosViewController *)self analyticsDelegate];
      unint64_t v24 = v23;
      uint64_t v25 = 6049;
LABEL_17:
      [v23 infoCardAnalyticsDidSelectAction:v25 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
    }
  }
  self->_double lastPhotoScrollOffset = a3;
  double v26 = v14 - a3;
  if (v14 - a3 <= 0.0) {
    double v27 = 8.0;
  }
  else {
    double v27 = v14 - a3 + 8.0;
  }
  [(UIScrollView *)self->_photosContainerScrollView frame];
  double v28 = CGRectGetHeight(v34) - v9 + -8.0;
  if (self->_isRTL)
  {
    double v29 = [(MKPlacePhotosViewController *)self view];
    [v29 frame];
    double MaxX = CGRectGetMaxX(v35);

    v36.origin.x = v27;
    v36.origin.y = v28;
    v36.size.width = v7;
    v36.size.height = v9;
    double v27 = MaxX - CGRectGetMaxX(v36) + -8.0;
  }
  -[UIView setFrame:](self->_photosSmallAttributionsView, "setFrame:", v27, v28, v7, v9);
  if (v28 < 0.0 || !self->_parentScrollView)
  {
    double v31 = 0.0;
    if (v28 >= 0.0) {
      double v31 = 1.0;
    }
    double v32 = self->_photosSmallAttributionsView;
    [(UIView *)v32 setAlpha:v31];
  }
}

- (void)_catchScrollNotification:(id)a3
{
  double v4 = [a3 object];
  parentScrollView = self->_parentScrollView;
  self->_parentScrollView = v4;

  [(MKPlacePhotosViewController *)self _updateAlphaAttribution];
}

- (void)_updateAlphaAttribution
{
  if (self->_parentScrollView)
  {
    photosSmallAttributionsView = self->_photosSmallAttributionsView;
    if (photosSmallAttributionsView)
    {
      [(UIView *)photosSmallAttributionsView bounds];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      [(UIScrollView *)self->_parentScrollView bounds];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      v38.origin.x = v5;
      v38.origin.y = v7;
      v38.size.width = v9;
      v38.size.height = v11;
      double MaxY = CGRectGetMaxY(v38);
      -[UIScrollView convertRect:fromView:](self->_parentScrollView, "convertRect:fromView:", self->_photosSmallAttributionsView, v5, v7, v9, v11);
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat rect = v26;
      v39.origin.x = v13;
      v39.origin.y = v15;
      v39.size.width = v17;
      v39.size.height = v19;
      double v27 = CGRectGetMaxY(v39);
      v40.origin.x = v13;
      v40.origin.y = v15;
      v40.size.width = v17;
      v40.size.height = v19;
      double v28 = CGRectGetMaxY(v40);
      v41.origin.x = v21;
      v41.origin.y = v23;
      v41.size.width = v25;
      v41.size.height = rect;
      double v29 = CGRectGetMaxY(v41);
      [(UIView *)self->_photosSmallAttributionsView setHidden:v29 >= v27];
      double v31 = 0.0;
      if (v29 < v27)
      {
        double v30 = v28 - MaxY;
        double v31 = 1.0;
        if (v28 - MaxY <= v29 && v29 < v27)
        {
          double v33 = (v29 - v30) / MaxY;
          double v30 = 1.0;
          double v31 = 1.0 - v33;
        }
      }
      CGRect v34 = self->_photosSmallAttributionsView;
      -[UIView setAlpha:](v34, "setAlpha:", v31, v30);
    }
  }
}

- (void)_scrollPrevious
{
}

- (void)_scrollNext
{
}

- (void)_adjustScrollIndexByOffset:(int64_t)a3
{
  [(UIScrollView *)self->_photosContainerScrollView frame];
  double Width = CGRectGetWidth(v13);
  [(UIScrollView *)self->_photosContainerScrollView contentOffset];
  double v7 = round(v6 / Width);
  [(UIScrollView *)self->_photosContainerScrollView contentSize];
  double v9 = v8 - Width;
  double v10 = v7 + (double)a3;
  if (v10 < 0.0) {
    double v10 = 0.0;
  }
  double v11 = Width * v10;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__MKPlacePhotosViewController__adjustScrollIndexByOffset___block_invoke;
  v12[3] = &unk_1E54B81B0;
  if (v11 < v9) {
    double v9 = v11;
  }
  v12[4] = self;
  *(double *)&v12[5] = v9;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v12 animations:0.2];
}

uint64_t __58__MKPlacePhotosViewController__adjustScrollIndexByOffset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1016), "setContentOffset:", *(double *)(a1 + 40), 0.0);
}

- (void)handleHover:(id)a3
{
  BOOL v4 = (unint64_t)([a3 state] - 1) < 2;

  [(MKPlacePhotosViewController *)self setHoverActive:v4];
}

- (void)setHoverActive:(BOOL)a3
{
  if (self->_hoverActive != a3)
  {
    self->_hoverActive = a3;
    [(MKPlacePhotosViewController *)self _updateChevronVisibility];
  }
}

- (void)_updateChevronVisibility
{
  [(UIScrollView *)self->_photosContainerScrollView frame];
  double Width = CGRectGetWidth(v12);
  [(UIScrollView *)self->_photosContainerScrollView contentSize];
  double v5 = v4 - Width;
  [(UIScrollView *)self->_photosContainerScrollView contentOffset];
  BOOL v7 = v6 <= 0.0;
  [(UIScrollView *)self->_photosContainerScrollView contentOffset];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__MKPlacePhotosViewController__updateChevronVisibility__block_invoke;
  v9[3] = &unk_1E54BB9B0;
  v9[4] = self;
  BOOL v10 = v7;
  BOOL v11 = v8 >= v5;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v9 animations:0.2];
}

uint64_t __55__MKPlacePhotosViewController__updateChevronVisibility__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hoverActive];
  double v3 = 0.0;
  double v4 = 0.0;
  if (v2 && !*(unsigned char *)(a1 + 40)) {
    double v4 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1144) setAlpha:v4];
  if ([*(id *)(a1 + 32) hoverActive])
  {
    if (*(unsigned char *)(a1 + 41)) {
      double v3 = 0.0;
    }
    else {
      double v3 = 1.0;
    }
  }
  double v5 = *(void **)(*(void *)(a1 + 32) + 1152);

  return [v5 setAlpha:v3];
}

- (void)infoCardThemeChanged
{
  v6.receiver = self;
  v6.super_class = (Class)MKPlacePhotosViewController;
  [(UIViewController *)&v6 infoCardThemeChanged];
  double v3 = [(UIViewController *)self mk_theme];
  [(MKPlacePhotosViewController *)self _updatePhotoBackgroundColor:v3];

  [(MKPlacePhotosViewController *)self updateAttributionCell];
  double v4 = [(UIViewController *)self mk_theme];
  double v5 = [v4 separatorLineColor];
  [(UIView *)self->_bottomHairline setBackgroundColor:v5];
}

- (void)_updatePhotoBackgroundColor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v4 = [a3 normalBackgroundColor];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = self->_photoViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_mapkit_setBackgroundColor:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_cancelLoadPhotos
{
  if (self->_photoLoaded)
  {
    NSUInteger v3 = [(NSArray *)self->_photoViews count];
    unint64_t photosCount = self->_photosCount;
    if (v3 < photosCount) {
      unint64_t photosCount = [(NSArray *)self->_photoViews count];
    }
    if (photosCount)
    {
      for (uint64_t i = 0; i != photosCount; ++i)
      {
        uint64_t v6 = [(NSArray *)self->_photoViews objectAtIndexedSubscript:i];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v6;
          uint64_t v8 = [(NSArray *)self->_photos objectAtIndex:i];
          [v7 frame];
          double Width = CGRectGetWidth(v16);
          if (Width <= 0.0)
          {
            double v13 = 100.0;
          }
          else
          {
            double v10 = Width;
            long long v11 = +[MKSystemController sharedInstance];
            [v11 screenScale];
            double v13 = v10 * v12;
          }
          double v14 = objc_msgSend(v8, "urlForBestPhotoForSize:", v13, v13);
          if (v14)
          {
            uint64_t v15 = +[MKAppImageManager sharedImageManager];
            [v15 cancelLoadAppImageAtURL:v14];
          }
        }
      }
    }
  }
}

- (void)_loadPhotos
{
  if (!self->_photoLoaded || self->_loadAppImageCanceledOrFailed)
  {
    self->_photoLoaded = 1;
    self->_loadAppImageCanceledOrFailed = 0;
    uint64_t v3 = 1008;
    NSUInteger v4 = [(NSArray *)self->_photoViews count];
    if (v4)
    {
      NSUInteger v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      double v20 = v23;
      uint64_t v19 = 1008;
      NSUInteger v21 = v4;
      do
      {
        uint64_t v8 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v3), "objectAtIndexedSubscript:", v6, v19, v20);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          double v10 = [(NSArray *)self->_photos objectAtIndex:v7];
          [v9 frame];
          double Width = CGRectGetWidth(v27);
          if (Width <= 0.0)
          {
            double v15 = 100.0;
          }
          else
          {
            double v12 = Width;
            double v13 = +[MKSystemController sharedInstance];
            [v13 screenScale];
            double v15 = v12 * v14;
          }
          CGRect v16 = objc_msgSend(v10, "urlForBestPhotoForSize:", v15, v15);
          if (v16)
          {
            CGFloat v17 = [v9 image];

            if (!v17)
            {
              objc_initWeak(&location, self);
              double v18 = +[MKAppImageManager sharedImageManager];
              v22[0] = MEMORY[0x1E4F143A8];
              v22[1] = 3221225472;
              v23[0] = __42__MKPlacePhotosViewController__loadPhotos__block_invoke;
              v23[1] = &unk_1E54BB9D8;
              objc_copyWeak(&v25, &location);
              id v24 = v9;
              [v18 loadAppImageAtURL:v16 completionHandler:v22];

              objc_destroyWeak(&v25);
              objc_destroyWeak(&location);
              uint64_t v3 = v19;
            }
          }
          ++v7;

          NSUInteger v5 = v21;
        }

        ++v6;
      }
      while (v5 != v6);
    }
  }
}

void __42__MKPlacePhotosViewController__loadPhotos__block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v10 = WeakRetained;
  if (WeakRetained)
  {
    if (!a5 && (a4 & 1) != 0 || (*((unsigned char *)WeakRetained + 1060) = 1, !*((unsigned char *)WeakRetained + 1184)))
    {
      long long v11 = (void *)MEMORY[0x1E4F42FF0];
      double v12 = *(void **)(a1 + 32);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __42__MKPlacePhotosViewController__loadPhotos__block_invoke_2;
      v13[3] = &unk_1E54B8248;
      id v14 = v12;
      id v15 = v8;
      [v11 transitionWithView:v14 duration:5242880 options:v13 animations:0 completion:0.200000003];
    }
  }
}

uint64_t __42__MKPlacePhotosViewController__loadPhotos__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
}

- (void)_photoSelected:(id)a3
{
  [a3 locationInView:self->_photosContainer];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  if (self->_externalView)
  {
    id v14 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
    [(MKLookAroundContainerView *)self->_lookAroundContainerView frame];
    v17.x = v5;
    v17.y = v7;
    if (CGRectContainsPoint(v18, v17))
    {
      [v14 jumpToCloseUpView];
      id v8 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        double v10 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
        [v10 placeCardPhotosController:self enterLookAroundForMapItem:self->_mapItem lookAroundView:v14];
      }

      return;
    }
  }
  long long v11 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    photoViews = self->_photoViews;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__MKPlacePhotosViewController__photoSelected___block_invoke;
    v15[3] = &unk_1E54BBA00;
    *(CGFloat *)&v15[5] = v5;
    *(CGFloat *)&v15[6] = v7;
    v15[4] = self;
    [(NSArray *)photoViews enumerateObjectsUsingBlock:v15];
  }
}

uint64_t __46__MKPlacePhotosViewController__photoSelected___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 frame];
  uint64_t result = CGRectContainsPoint(v8, *(CGPoint *)(a1 + 40));
  if (result)
  {
    double v6 = *(void **)(a1 + 32);
    return [v6 _photoTappedAtIndex:a3];
  }
  return result;
}

- (void)_photoTappedAtIndex:(unint64_t)a3
{
  id v15 = [(MKPlacePhotosViewController *)self analyticsDelegate];
  if ([(NSArray *)self->_photoViews count] > a3)
  {
    CGFloat v5 = [(NSArray *)self->_photoViews objectAtIndexedSubscript:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_secondaryAttributionView == v5)
      {
        [(MKPlacePhotosViewController *)self didTapSecondaryAttributionViewWithPresentingViewController:self];
      }
      else if (self->_primaryAttributionView == v5)
      {
        [(MKPlacePhotosViewController *)self didTapPrimaryAttributionViewWithPresentingViewController:self];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v6 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
        char v7 = objc_opt_respondsToSelector();

        if (v7)
        {
          CGRect v8 = [(NSArray *)self->_photos objectAtIndex:a3];
          char v9 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
          double v10 = [v8 photoID];
          [v9 placeCardPhotosController:self didSelectViewPhotoWithID:v10 presentingViewController:self];
        }
        else
        {
          CGRect v8 = 0;
        }
        if (self->_canUseFullscreenViewer) {
          uint64_t v11 = 6006;
        }
        else {
          uint64_t v11 = 6018;
        }
        char v12 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
        double v13 = [v8 attribution];
        id v14 = [v13 providerID];
        [v15 infoCardAnalyticsDidSelectAction:v11 eventValue:v12 feedbackDelegateSelector:173 actionRichProviderId:v14];
      }
    }
  }
}

- (void)didTapSecondaryAttributionViewWithPresentingViewController:(id)a3
{
}

- (void)didTapPrimaryAttributionViewWithPresentingViewController:(id)a3
{
}

- (void)_didTapAttributionViewWithPresentingViewController:(id)a3 photoAttributionView:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (v6)
  {
    char v7 = [(MKPlacePhotosViewController *)self analyticsDelegate];
    if ([v6 type])
    {
      if ([(MKPlacePhotosViewController *)self isFirstParty]) {
        [v7 infoCardAnalyticsDidSelectAction:6102 eventValue:@"photo slider" feedbackDelegateSelector:0 actionRichProviderId:0];
      }
      CGRect v8 = [(MKMapItem *)self->_mapItem _mapkit_preferredFirstPhotoVendor];
      uint64_t v9 = [v8 providerID];
      double v10 = [v6 mapItem];
      uint64_t v11 = [v10 _attribution];
      char v12 = [v11 providerID];
      [v7 infoCardAnalyticsDidSelectAction:6023 eventValue:v9 feedbackDelegateSelector:0 actionRichProviderId:v12];

      double v13 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
      LOBYTE(v9) = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0) {
        goto LABEL_11;
      }
      id v14 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
      [v14 placeCardActionControllerDidSelectViewAllPhotos:0 presentingViewController:v21];
    }
    else
    {
      id v15 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        [v7 infoCardAnalyticsDidSelectAction:2147 eventValue:@"photo slider" feedbackDelegateSelector:0 actionRichProviderId:0];
        id v14 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
        [v14 placeCardActionControllerDidSelectAddPhoto:0 presentingViewController:v21 sourceView:v6];
      }
      else
      {
        id v14 = [(MKMapItem *)self->_mapItem _mapkit_preferredFirstPhotoVendor];
        CGPoint v17 = [v14 providerID];
        CGRect v18 = [v6 mapItem];
        uint64_t v19 = [v18 _attribution];
        double v20 = [v19 providerID];
        [v7 infoCardAnalyticsDidSelectAction:6025 eventValue:v17 feedbackDelegateSelector:174 actionRichProviderId:v20];
      }
    }

LABEL_11:
  }
}

- (void)lookAroundContainerView:(id)a3 didAddLookAroundView:(id)a4
{
  id v10 = a4;
  CGFloat v5 = [(MKPlacePhotosViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 5) {
    goto LABEL_5;
  }
  int64_t v7 = [(UIViewController *)self contentVisibility];
  if (v7 == 2)
  {
    [v10 moveToStandOffView];
    goto LABEL_7;
  }
  BOOL v8 = v7 == 3;
  uint64_t v9 = v10;
  if (v8)
  {
LABEL_5:
    [v10 moveToCloseUpView];
LABEL_7:
    uint64_t v9 = v10;
  }
}

- (void)_logUGCAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(MKPlacePhotosViewController *)self isFirstParty])
  {
    double v4 = (void *)MEMORY[0x1E4F63E30];
    [v4 captureUGCUserAction:v3 target:612 value:0 photoSources:0];
  }
}

- (id)infoCardChildPossibleActions
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  double v4 = v3;
  if (self->_externalView) {
    [v3 addObject:&unk_1ED97E718];
  }
  if ([(NSArray *)self->_photoViews count])
  {
    unint64_t v5 = 0;
    do
    {
      if (self->_canUseFullscreenViewer) {
        uint64_t v6 = &unk_1ED97E748;
      }
      else {
        uint64_t v6 = &unk_1ED97E730;
      }
      [v4 addObject:v6];
      ++v5;
    }
    while (v5 < [(NSArray *)self->_photoViews count]);
  }

  return v4;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setContentVisibility:(int64_t)a3
{
  unint64_t v5 = [(MKPlacePhotosViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 != 5)
  {
    [(MKPlacePhotosViewController *)self _setContentVisibility:a3];
  }
}

- (void)_setContentVisibility:(int64_t)a3
{
  int64_t v5 = [(UIViewController *)self contentVisibility];
  v12.receiver = self;
  v12.super_class = (Class)MKPlacePhotosViewController;
  [(UIViewController *)&v12 setContentVisibility:a3];
  if (v5 != a3)
  {
    uint64_t v6 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
    int64_t v7 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [(MKPlacePhotosViewController *)self photosControllerDelegate];
      char v10 = [v9 shouldMoveLookAroundStorefrontViewForPlaceCardPhotosController:self];

      char v11 = v10 ^ 1;
      if (!v6) {
        goto LABEL_11;
      }
    }
    else
    {
      char v11 = 0;
      if (!v6)
      {
LABEL_11:

        return;
      }
    }
    if ((v11 & 1) == 0)
    {
      if (a3 == 2)
      {
        [v6 moveToStandOffView];
      }
      else if (a3 == 3)
      {
        [v6 moveToCloseUpView];
      }
    }
    goto LABEL_11;
  }
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlacePhotosViewController;
  [(MKPlacePhotosViewController *)&v3 viewLayoutMarginsDidChange];
  [(MKPlacePhotosViewController *)self scrollViewDidScroll:self->_photosContainerScrollView];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MKPlacePhotosViewController;
  [(MKPlacePhotosViewController *)&v4 viewDidLayoutSubviews];
  [(MKPlacePhotosViewController *)self layoutImages];
  [(UIView *)self->_photosSmallAttributionsView alpha];
  if (v3 == 0.0) {
    [(MKPlacePhotosViewController *)self updateAttributionPositionWithOffset:0.0];
  }
  [(MKPlacePhotosViewController *)self _loadPhotos];
}

- (_MKPlaceViewController)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

  return (_MKPlaceViewController *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (MKPlaceCardPhotosControllerDelegate)photosControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photosControllerDelegate);

  return (MKPlaceCardPhotosControllerDelegate *)WeakRetained;
}

- (void)setPhotosControllerDelegate:(id)a3
{
}

- (BOOL)showsBottomHairline
{
  return self->_showsBottomHairline;
}

- (BOOL)hoverActive
{
  return self->_hoverActive;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photosControllerDelegate);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_parentScrollView, 0);
  objc_storeStrong((id *)&self->_lookAroundContainerView, 0);
  objc_storeStrong((id *)&self->_nextPageButton, 0);
  objc_storeStrong((id *)&self->_previousPageButton, 0);
  objc_storeStrong((id *)&self->_attributionCell, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_externalView, 0);
  objc_storeStrong((id *)&self->_attributionClippingview, 0);
  objc_storeStrong((id *)&self->_photosSmallAttributionsView, 0);
  objc_storeStrong((id *)&self->_photosContainer, 0);
  objc_storeStrong((id *)&self->_photosContainerScrollView, 0);
  objc_storeStrong((id *)&self->_photoViews, 0);
  objc_storeStrong((id *)&self->_secondaryAttributionView, 0);
  objc_storeStrong((id *)&self->_primaryAttributionView, 0);
  objc_storeStrong((id *)&self->_imageViewForTransition, 0);

  objc_storeStrong((id *)&self->_bottomHairline, 0);
}

@end