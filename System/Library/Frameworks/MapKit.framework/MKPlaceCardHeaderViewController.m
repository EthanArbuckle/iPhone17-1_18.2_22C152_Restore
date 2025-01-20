@interface MKPlaceCardHeaderViewController
+ (double)minimalModeHeight;
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasSecondaryName;
- (BOOL)_isLikelyToShowDistance;
- (BOOL)_mapItemShouldDisplayDistance:(id)a3;
- (BOOL)shouldShowCallToActionWithRatingHeaderInfo;
- (GEOTransitLineItem)lineItem;
- (MKPlaceCardHeaderViewController)initWithLineItem:(id)a3 layout:(unint64_t)a4;
- (MKPlaceCardHeaderViewController)initWithPlaceItem:(id)a3 layout:(unint64_t)a4;
- (MKPlaceCardHeaderViewControllerDelegate)delegate;
- (_MKLocalizedHoursBuilder)localizedHoursBuilder;
- (_MKPlaceItem)placeItem;
- (double)contentAlpha;
- (double)lastLabelToBottomConstant;
- (double)secondaryNameLabelPadding;
- (id)_currentTitle;
- (id)_openStateString;
- (id)_reviewLabelText;
- (id)_secondaryNameTitle;
- (id)_verifiedText;
- (id)newLabel;
- (id)secondaryNameTimingFunction;
- (id)titleFont;
- (void)ETAProviderUpdated:(id)a3;
- (void)_commonInit;
- (void)_contentSizeDidChange;
- (void)_contentSizeDidChangeNotificationHandler;
- (void)_createViews;
- (void)_loadLogo;
- (void)_setupDatas;
- (void)animateSecondLabelWithPercentage:(double)a3;
- (void)infoCardThemeChanged;
- (void)setConstraints;
- (void)setContentAlpha:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalizedHoursBuilder:(id)a3;
- (void)updateContent;
- (void)updateContentAlpha;
- (void)updateHeaderTitle;
- (void)updateViews;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MKPlaceCardHeaderViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)titleFont
{
  unint64_t layout = self->_layout;
  v3 = +[MKFontManager sharedManager];
  v4 = v3;
  if (layout == 1) {
    [v3 brandTitleFont];
  }
  else {
  v5 = [v3 largeTitleFont];
  }

  return v5;
}

+ (double)minimalModeHeight
{
  v2 = +[MKFontManager sharedManager];
  v3 = [v2 largeTitleFont];

  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 32.0);
  double v5 = v4 + 4.0;
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 21.0);
  double v7 = v5 + v6 + 21.0;

  return v7;
}

- (id)secondaryNameTimingFunction
{
  if (qword_1E9154150 != -1) {
    dispatch_once(&qword_1E9154150, &__block_literal_global_45);
  }
  v2 = (void *)_MergedGlobals_1_6;

  return v2;
}

void __62__MKPlaceCardHeaderViewController_secondaryNameTimingFunction__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
  v1 = (void *)_MergedGlobals_1_6;
  _MergedGlobals_1_6 = v0;
}

- (double)lastLabelToBottomConstant
{
  v2 = +[MKFontManager sharedManager];
  v3 = [v2 subtitleFont];

  double v4 = +[MKSystemController sharedInstance];
  int v5 = [v4 userInterfaceIdiom];

  double v6 = 0.0;
  if (v5 != 2)
  {
    objc_msgSend(v3, "_mapkit_scaledValueForValue:", 21.0);
    double v6 = -v7;
  }

  return v6;
}

- (BOOL)shouldShowCallToActionWithRatingHeaderInfo
{
  return 0;
}

- (MKPlaceCardHeaderViewController)initWithPlaceItem:(id)a3 layout:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKPlaceCardHeaderViewController;
  v8 = [(MKPlaceCardHeaderViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_placeItem, a3);
    v9->_unint64_t layout = a4;
    [(MKPlaceCardHeaderViewController *)v9 _commonInit];
  }

  return v9;
}

- (MKPlaceCardHeaderViewController)initWithLineItem:(id)a3 layout:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKPlaceCardHeaderViewController;
  v8 = [(MKPlaceCardHeaderViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lineItem, a3);
    v9->_unint64_t layout = a4;
    [(MKPlaceCardHeaderViewController *)v9 _commonInit];
  }

  return v9;
}

- (void)_commonInit
{
  self->_optionSmallScreen = _MKPlaceCardUseSmallerFont();
  v3 = objc_alloc_init(_MKDataHeaderModel);
  dataModel = self->_dataModel;
  self->_dataModel = v3;

  int v5 = objc_alloc_init(_MKTokenAttributedString);
  titleToken = self->_titleToken;
  self->_titleToken = v5;

  id v7 = objc_alloc_init(_MKTokenAttributedString);
  secondaryNameToken = self->_secondaryNameToken;
  self->_secondaryNameToken = v7;

  v9 = objc_alloc_init(_MKTokenAttributedString);
  distanceToken = self->_distanceToken;
  self->_distanceToken = v9;

  objc_super v11 = objc_alloc_init(_MKTokenAttributedString);
  ratingsToken = self->_ratingsToken;
  self->_ratingsToken = v11;

  v13 = objc_alloc_init(_MKTokenAttributedString);
  openStateToken = self->_openStateToken;
  self->_openStateToken = v13;

  v15 = objc_alloc_init(_MKTokenAttributedString);
  priceToken = self->_priceToken;
  self->_priceToken = v15;

  v17 = objc_alloc_init(_MKTokenAttributedString);
  categoryToken = self->_categoryToken;
  self->_categoryToken = v17;

  v19 = objc_alloc_init(_MKTokenAttributedString);
  userLocationToken = self->_userLocationToken;
  self->_userLocationToken = v19;

  v21 = objc_alloc_init(_MKTokenAttributedString);
  venueToken = self->_venueToken;
  self->_venueToken = v21;

  v23 = objc_alloc_init(_MKTokenAttributedString);
  verifiedToken = self->_verifiedToken;
  self->_verifiedToken = v23;

  self->_isUserLocation = [(_MKPlaceItem *)self->_placeItem options] & 1;
  v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 addObserver:self selector:sel__contentSizeDidChangeNotificationHandler name:*MEMORY[0x1E4F43788] object:0];

  id v28 = [(_MKPlaceItem *)self->_placeItem mapItem];
  objc_msgSend(v28, "_bestBrandIconURLForSize:allowSmaller:", 1, 86.0, 86.0);
  v26 = (NSURL *)objc_claimAutoreleasedReturnValue();
  logoURL = self->_logoURL;
  self->_logoURL = v26;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)MKPlaceCardHeaderViewController;
  [(MKPlaceCardHeaderViewController *)&v6 viewDidLoad];
  v3 = [(MKPlaceSectionViewController *)self sectionView];
  [v3 setPreservesSuperviewLayoutMargins:1];

  double v4 = [(MKPlaceSectionViewController *)self sectionView];
  [v4 setShowsBottomHairline:0];

  [(MKPlaceCardHeaderViewController *)self _createViews];
  [(MKPlaceCardHeaderViewController *)self _setupDatas];
  [(MKPlaceCardHeaderViewController *)self updateContent];
  int v5 = [(MKPlaceCardHeaderViewController *)self view];
  [(_MKDataHeaderModel *)self->_dataModel setOwnerView:v5];
}

- (void)updateHeaderTitle
{
  v3 = [(_MKPlaceItem *)self->_placeItem mapItem];
  id v5 = [v3 name];

  double v4 = [(MKPlaceCardHeaderViewController *)self view];

  if (v4)
  {
    [(_MKTokenAttributedString *)self->_titleToken setString:v5];
    [(MKPlaceCardHeaderViewController *)self updateViews];
  }
}

- (double)contentAlpha
{
  char v3 = [(MKPlaceSectionRowView *)self->_labelsSectionView isHidden];
  double result = 0.0;
  if ((v3 & 1) == 0) {
    return self->_contentAlpha;
  }
  return result;
}

- (void)setContentAlpha:(double)a3
{
  if (self->_contentAlpha != a3)
  {
    self->_contentAlpha = a3;
    [(MKPlaceCardHeaderViewController *)self updateContentAlpha];
  }
}

- (void)updateContentAlpha
{
  labelsSectionView = self->_labelsSectionView;
  if (labelsSectionView && ([(MKPlaceSectionRowView *)labelsSectionView isHidden] & 1) == 0)
  {
    [(MKPlaceCardHeaderViewController *)self animateSecondLabelWithPercentage:self->_contentAlpha];
    [(UIView *)self->_thirdDisplayedLabel setAlpha:self->_contentAlpha];
    id v6 = [(MKPlaceCardHeaderViewController *)self secondaryNameTimingFunction];
    double contentAlpha = self->_contentAlpha;
    *(float *)&double contentAlpha = contentAlpha;
    [v6 _solveForInput:contentAlpha];
    [(_MKUILabel *)self->_secondaryNameLabel setAlpha:v5];
  }
}

- (void)animateSecondLabelWithPercentage:(double)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  double v4 = fmin(a3, 1.0);
  if (v4 >= 0.0) {
    double v5 = v4;
  }
  else {
    double v5 = 0.0;
  }
  secondLabelToFirstLabelConstraint = self->_secondLabelToFirstLabelConstraint;
  if (secondLabelToFirstLabelConstraint)
  {
    BOOL v7 = [(NSLayoutConstraint *)secondLabelToFirstLabelConstraint isActive];
    if (v5 == 1.0)
    {
      if (v7)
      {
        v8 = (void *)MEMORY[0x1E4F28DC8];
        v14[0] = self->_secondLabelToFirstLabelConstraint;
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        [v8 deactivateConstraints:v9];
      }
    }
    else
    {
      if (!v7)
      {
        v10 = (void *)MEMORY[0x1E4F28DC8];
        v13 = self->_secondLabelToFirstLabelConstraint;
        objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
        [v10 activateConstraints:v11];
      }
      [(MKPlaceCardHeaderViewController *)self secondaryNameLabelPadding];
      [(NSLayoutConstraint *)self->_secondLabelToFirstLabelConstraint setConstant:self->_secondLabelToFirstLabelConstraintConstantMin + v12 * v5];
    }
  }
}

- (double)secondaryNameLabelPadding
{
  return self->_secondLabelToFirstLabelConstraintConstantMax - self->_secondLabelToFirstLabelConstraintConstantMin;
}

- (id)_currentTitle
{
  char v3 = [(_MKPlaceItem *)self->_placeItem name];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    placeItem = self->_placeItem;
LABEL_4:
    uint64_t v8 = [(_MKPlaceItem *)placeItem name];
LABEL_5:
    v9 = (void *)v8;
    goto LABEL_6;
  }
  id v6 = [(GEOTransitLineItem *)self->_lineItem name];
  uint64_t v7 = [v6 length];

  placeItem = self->_lineItem;
  if (v7) {
    goto LABEL_4;
  }
  objc_super v11 = [(_MKPlaceItem *)placeItem system];
  double v12 = [v11 name];
  uint64_t v13 = [v12 length];

  lineItem = self->_lineItem;
  if (v13)
  {
    v15 = [(GEOTransitLineItem *)lineItem system];
    v9 = [v15 name];
  }
  else
  {
    if (lineItem)
    {
      uint64_t v8 = _MKLocalizedStringFromThisBundle(@"Line_Card_Default_Title");
      goto LABEL_5;
    }
    v9 = 0;
  }
LABEL_6:

  return v9;
}

- (BOOL)_hasSecondaryName
{
  v2 = [(MKPlaceCardHeaderViewController *)self _secondaryNameTitle];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)_secondaryNameTitle
{
  v2 = [(_MKPlaceItem *)self->_placeItem mapItem];
  BOOL v3 = [v2 _secondaryName];

  return v3;
}

- (id)_verifiedText
{
  v25[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_MKPlaceItem *)self->_placeItem mapItem];
  int v4 = [v3 _isMessageIDVerified];

  if (v4)
  {
    double v5 = [(UIViewController *)self mk_theme];
    id v6 = [v5 lightTextColor];

    id v7 = objc_alloc_init(MEMORY[0x1E4F42698]);
    uint64_t v8 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark.seal.fill"];
    v9 = [v8 imageWithRenderingMode:2];

    [v7 setImage:v9];
    v10 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v7];
    objc_super v11 = (void *)[v10 mutableCopy];

    uint64_t v24 = *MEMORY[0x1E4F42510];
    uint64_t v12 = v24;
    v25[0] = v6;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    objc_msgSend(v11, "addAttributes:range:", v13, 0, 1);

    v14 = (void *)[v11 copy];
    id v15 = objc_alloc(MEMORY[0x1E4F28E48]);
    v16 = _MKLocalizedStringFromThisBundle(@"Brand_Card_Verified");
    v22[0] = *MEMORY[0x1E4F42508];
    v17 = +[MKFontManager sharedManager];
    v18 = [v17 subtitleFont];
    v22[1] = v12;
    v23[0] = v18;
    v23[1] = v6;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    v20 = (void *)[v15 initWithString:v16 attributes:v19];

    if (v14) {
      [v20 appendAttributedString:v14];
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_reviewLabelText
{
  BOOL v3 = [(_MKPlaceItem *)self->_placeItem mapItem];
  int v4 = [v3 _hasUserRatingScore];

  if (v4)
  {
    double v5 = [(UIViewController *)self mk_theme];
    id v6 = [v5 lightTextColor];

    id v7 = [(_MKPlaceItem *)self->_placeItem mapItem];
    uint64_t v8 = +[MKFontManager sharedManager];
    v9 = [v8 subtitleFont];
    v10 = [(UIViewController *)self mk_theme];
    objc_super v11 = +[MKRatingStringBuilder ratingAndReviewSummaryAttributedStringForMapItem:v7 textColor:v6 font:v9 theme:v10];
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

- (_MKLocalizedHoursBuilder)localizedHoursBuilder
{
  localizedHoursBuilder = self->_localizedHoursBuilder;
  if (!localizedHoursBuilder)
  {
    int v4 = [_MKLocalizedHoursBuilder alloc];
    double v5 = [(_MKPlaceItem *)self->_placeItem mapItem];
    id v6 = [(_MKLocalizedHoursBuilder *)v4 initWithMapItem:v5 localizedHoursStringOptions:0];
    id v7 = self->_localizedHoursBuilder;
    self->_localizedHoursBuilder = v6;

    localizedHoursBuilder = self->_localizedHoursBuilder;
  }

  return localizedHoursBuilder;
}

- (id)_openStateString
{
  v16[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_MKPlaceItem *)self->_placeItem mapItem];
  int v4 = [v3 _hasBusinessHours];

  if (v4)
  {
    if (self->_optionSmallScreen) {
      uint64_t v5 = 13;
    }
    else {
      uint64_t v5 = 9;
    }
    id v6 = [(MKPlaceCardHeaderViewController *)self localizedHoursBuilder];
    [v6 setLocalizedHoursStringOptions:v5];

    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v8 = [(MKPlaceCardHeaderViewController *)self localizedHoursBuilder];
    v9 = [v8 localizedOperatingHours];
    uint64_t v15 = *MEMORY[0x1E4F42510];
    v10 = [(MKPlaceCardHeaderViewController *)self localizedHoursBuilder];
    objc_super v11 = [v10 hoursStateLabelColor];
    v16[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v13 = (void *)[v7 initWithString:v9 attributes:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)_setupDatas
{
  BOOL v3 = [(MKPlaceCardHeaderViewController *)self _currentTitle];
  [(_MKTokenAttributedString *)self->_titleToken setString:v3];

  int v4 = [(MKPlaceCardHeaderViewController *)self _secondaryNameTitle];
  [(_MKTokenAttributedString *)self->_secondaryNameToken setString:v4];

  uint64_t v5 = [(MKPlaceCardHeaderViewController *)self _reviewLabelText];
  [(_MKTokenAttributedString *)self->_ratingsToken setAttributedString:v5];

  id v6 = [(_MKPlaceItem *)self->_placeItem mapItem];
  char v7 = [v6 _hasPriceDescription];
  uint64_t v8 = [(_MKPlaceItem *)self->_placeItem mapItem];
  v9 = v8;
  if (v7) {
    [v8 _priceDescription];
  }
  else {
  v10 = [v8 _priceRangeString];
  }
  [(_MKTokenAttributedString *)self->_priceToken setString:v10];

  objc_super v11 = [(MKPlaceCardHeaderViewController *)self _openStateString];
  [(_MKTokenAttributedString *)self->_openStateToken setAttributedString:v11];

  uint64_t v12 = [(MKPlaceCardHeaderViewController *)self _verifiedText];
  [(_MKTokenAttributedString *)self->_verifiedToken setAttributedString:v12];

  uint64_t v13 = [(_MKPlaceItem *)self->_placeItem mapItem];
  v14 = [v13 _firstLocalizedCategoryName];
  uint64_t v15 = [v14 length];

  unint64_t v16 = 0x1EB312000uLL;
  if (v15)
  {
    v17 = [(_MKPlaceItem *)self->_placeItem mapItem];
    v18 = [v17 _firstLocalizedCategoryName];
    [(_MKTokenAttributedString *)self->_categoryToken setString:v18];
  }
  else
  {
    if (!self->_lineItem) {
      goto LABEL_9;
    }
    v17 = _MKLocalizedStringFromThisBundle(@"Line_Card_Category");
    [(_MKTokenAttributedString *)self->_categoryToken setString:v17];
  }

LABEL_9:
  if (!self->_isUserLocation) {
    goto LABEL_20;
  }
  v19 = _MKLocalizedStringFromThisBundle(@"NEAR_BY_PLACE_HEADER_STRING");
  v20 = +[MKLocationManager sharedLocationManager];
  int v21 = [v20 isAuthorizedForPreciseLocation];

  v22 = [(_MKPlaceItem *)self->_placeItem mapItem];
  v23 = [v22 _geoAddress];
  uint64_t v24 = [v23 structuredAddress];
  v25 = v24;
  if (!v21)
  {
    v26 = [v24 locality];

    if ([v26 length])
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", v19, v26);
      id v28 = [(_MKPlaceItem *)self->_placeItem mapItem];
      v29 = [v28 _geoAddress];
      v30 = [v29 structuredAddress];
      v31 = [v30 administrativeAreaCode];

      if ([v31 length])
      {
        uint64_t v32 = [v27 stringByAppendingFormat:@", %@", v31];

        v27 = (void *)v32;
      }
      unint64_t v16 = 0x1EB312000;

      goto LABEL_19;
    }
    goto LABEL_17;
  }
  v26 = [v24 fullThoroughfare];

  if (![v26 length])
  {
LABEL_17:
    v27 = 0;
    goto LABEL_18;
  }
  v27 = objc_msgSend(NSString, "stringWithFormat:", v19, v26);
LABEL_18:
  unint64_t v16 = 0x1EB312000uLL;
LABEL_19:

  [(_MKTokenAttributedString *)self->_userLocationToken setString:v27];
LABEL_20:
  v33 = [(_MKPlaceItem *)self->_placeItem mapItem];
  if ([v33 _venueFeatureType] == 4)
  {
  }
  else
  {
    BOOL isUserLocation = self->_isUserLocation;

    if (!isUserLocation) {
      goto LABEL_24;
    }
  }
  v35 = [(_MKPlaceItem *)self->_placeItem mapItem];
  v36 = [v35 venueLabelWithContext:2];
  [(_MKTokenAttributedString *)self->_venueToken setString:v36];

LABEL_24:
  v37 = [(_MKDataHeaderModel *)self->_dataModel transitLabel];
  [v37 removeFromSuperview];

  [(_MKDataHeaderModel *)self->_dataModel setTransitLabel:0];
  v38 = [(_MKPlaceItem *)self->_placeItem mapItem];
  if ([v38 _hasTransitLabels])
  {
  }
  else
  {
    uint64_t v39 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *(int *)(v16 + 3688));

    if (!v39) {
      goto LABEL_32;
    }
  }
  v40 = [MKTransitInfoLabelView alloc];
  v41 = [(_MKPlaceItem *)self->_placeItem mapItem];
  v42 = [(MKTransitInfoLabelView *)v40 initWithMapItem:v41];
  [(_MKDataHeaderModel *)self->_dataModel setTransitLabel:v42];

  v43 = [(_MKDataHeaderModel *)self->_dataModel transitLabel];
  objc_msgSend(v43, "set_mapkit_themeColorProvider:", &__block_literal_global_61);

  uint64_t v44 = *(int *)(v16 + 3688);
  v45 = *(Class *)((char *)&self->super.super.super.super.isa + v44);
  if (v45)
  {
    v46 = [v45 labelItems];
    uint64_t v47 = [v46 count];

    if (v47)
    {
      v48 = [*(id *)((char *)&self->super.super.super.super.isa + v44) labelItems];
      v49 = [(_MKDataHeaderModel *)self->_dataModel transitLabel];
      [v49 setLabelItems:v48];
    }
    else
    {
      [(_MKDataHeaderModel *)self->_dataModel setTransitLabel:0];
    }
  }
  v50 = [(_MKDataHeaderModel *)self->_dataModel transitLabel];
  [v50 setTranslatesAutoresizingMaskIntoConstraints:0];

LABEL_32:
  BOOL v51 = [(MKPlaceCardHeaderViewController *)self _isLikelyToShowDistance];
  v52 = [(_MKDataHeaderModel *)self->_dataModel secondLine];
  [v52 setShouldUseEmptyPlaceholder:v51];

  v53 = [(_MKDataHeaderModel *)self->_dataModel firstLine];
  [v53 addToken:self->_titleToken];

  if (self->_layout == 1)
  {
    p_verifiedToken = &self->_verifiedToken;
    BOOL v55 = [(_MKTokenAttributedString *)self->_verifiedToken isEmpty];
    self->_notVerified = v55;
    if (v55) {
      return;
    }
    v61 = [(_MKDataHeaderModel *)self->_dataModel secondLine];
  }
  else
  {
    if ([(_MKTokenAttributedString *)self->_userLocationToken isEmpty])
    {
      v56 = [(_MKDataHeaderModel *)self->_dataModel secondLine];
      [v56 addToken:self->_categoryToken];

      v57 = [(_MKDataHeaderModel *)self->_dataModel secondLine];
      [v57 addToken:self->_venueToken];

      v58 = [(_MKDataHeaderModel *)self->_dataModel secondLine];
      [v58 addToken:self->_distanceToken];

      v59 = [(_MKDataHeaderModel *)self->_dataModel secondLine];
      p_openStateToken = &self->_openStateToken;
    }
    else
    {
      BOOL v62 = [(_MKTokenAttributedString *)self->_venueToken isEmpty];
      v59 = [(_MKDataHeaderModel *)self->_dataModel secondLine];
      if (v62) {
        p_openStateToken = &self->_userLocationToken;
      }
      else {
        p_openStateToken = &self->_venueToken;
      }
    }
    [v59 addToken:*p_openStateToken];

    if ([(MKPlaceCardHeaderViewController *)self _hasSecondaryName]
      && ![(_MKTokenAttributedString *)self->_secondaryNameToken isEmpty])
    {
      v63 = [(_MKDataHeaderModel *)self->_dataModel secondaryNameLine];
      [v63 addToken:self->_secondaryNameToken];
    }
    v64 = [(_MKDataHeaderModel *)self->_dataModel thirdLine];
    [v64 addToken:self->_ratingsToken];

    v61 = [(_MKDataHeaderModel *)self->_dataModel thirdLine];
    p_verifiedToken = &self->_priceToken;
  }
  id v65 = v61;
  [v61 addToken:*p_verifiedToken];
}

uint64_t __46__MKPlaceCardHeaderViewController__setupDatas__block_invoke(uint64_t a1, void *a2)
{
  return [a2 textColor];
}

- (BOOL)_isLikelyToShowDistance
{
  v2 = [(_MKPlaceItem *)self->_placeItem mapItem];
  if (+[_MKQuickRouteManager isLikelyToReturnETAForLocation:v2])
  {
    BOOL v3 = 1;
  }
  else
  {
    int v4 = +[MKLocationManager sharedLocationManager];
    uint64_t v5 = [v4 lastLocation];
    BOOL v3 = v5 != 0;
  }
  return v3;
}

- (void)_loadLogo
{
  if (self->_logoURL)
  {
    BOOL v3 = +[MKAppImageManager sharedImageManager];
    logoURL = self->_logoURL;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__MKPlaceCardHeaderViewController__loadLogo__block_invoke;
    v5[3] = &unk_1E54B9820;
    v5[4] = self;
    [v3 loadAppImageAtURL:logoURL completionHandler:v5];
  }
}

void __44__MKPlaceCardHeaderViewController__loadLogo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 1008);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__MKPlaceCardHeaderViewController__loadLogo__block_invoke_2;
  v8[3] = &unk_1E54B8248;
  v8[4] = v5;
  id v9 = v3;
  id v7 = v3;
  [v4 transitionWithView:v6 duration:5242880 options:v8 animations:0 completion:0.200000003];
}

uint64_t __44__MKPlaceCardHeaderViewController__loadLogo__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1008) setImage:*(void *)(a1 + 40)];
}

- (void)ETAProviderUpdated:(id)a3
{
  id v21 = a3;
  uint64_t v5 = [(_MKTokenAttributedString *)self->_distanceToken string];
  uint64_t v6 = [v21 distanceString];
  if (v5 == v6)
  {
    id v3 = [v21 distanceString];
    if (!v3)
    {
      v14 = v5;
LABEL_17:

      goto LABEL_18;
    }
  }
  uint64_t v7 = [(_MKTokenAttributedString *)self->_distanceToken string];
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [v21 distanceString];
  if (!v9)
  {

LABEL_8:
    if (v5 == v6) {

    }
    goto LABEL_14;
  }
  v10 = (void *)v9;
  objc_super v11 = [(_MKTokenAttributedString *)self->_distanceToken string];
  uint64_t v12 = [v21 distanceString];
  char v13 = [v11 isEqualToString:v12];

  if (v5 == v6)
  {
  }
  else
  {
  }
  if (v13) {
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v15 = [(_MKPlaceItem *)self->_placeItem mapItem];
  BOOL v16 = [(MKPlaceCardHeaderViewController *)self _mapItemShouldDisplayDistance:v15];

  if (v16)
  {
    v17 = [(MKPlaceCardHeaderViewController *)self view];

    if (v17)
    {
      v18 = [v21 distanceString];
      [(_MKTokenAttributedString *)self->_distanceToken setString:v18];

      [(MKPlaceCardHeaderViewController *)self updateViews];
      v19 = [(MKPlaceCardHeaderViewController *)self view];
      v20 = [v19 superview];
      objc_msgSend(v20, "_mapkit_setNeedsLayout");

      v14 = [(MKPlaceCardHeaderViewController *)self view];
      uint64_t v5 = [v14 superview];
      objc_msgSend(v5, "_mapkit_layoutIfNeeded");
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (BOOL)_mapItemShouldDisplayDistance:(id)a3
{
  id v3 = a3;
  if ([v3 _hasVenueFeatureType]) {
    BOOL v4 = [v3 _venueFeatureType] != 4;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (id)newLabel
{
  v2 = [_MKUILabel alloc];
  id v3 = -[_MKUILabel initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(_MKUILabel *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKUILabel *)v3 setNumberOfLines:0];
  return v3;
}

- (void)_createViews
{
  if (self->_layout == 1)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
    BOOL v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    logoImageView = self->_logoImageView;
    self->_logoImageView = v4;

    [(UIImageView *)self->_logoImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v6 = [(UIImageView *)self->_logoImageView layer];
    objc_msgSend(v6, "setBounds:", 0.0, 0.0, 86.0, 86.0);

    uint64_t v7 = [(UIImageView *)self->_logoImageView layer];
    [v7 setCornerRadius:11.0];

    uint64_t v8 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIImageView *)self->_logoImageView setBackgroundColor:v8];

    [(UIImageView *)self->_logoImageView setContentMode:2];
    [(UIImageView *)self->_logoImageView setClipsToBounds:1];
  }
  uint64_t v9 = [(MKPlaceCardHeaderViewController *)self newLabel];
  titleOnlyLabel = self->_titleOnlyLabel;
  self->_titleOnlyLabel = v9;

  [(_MKUILabel *)self->_titleOnlyLabel setTextAlignment:1];
  objc_super v11 = [(MKPlaceCardHeaderViewController *)self newLabel];
  firstLabel = self->_firstLabel;
  self->_firstLabel = v11;

  char v13 = [(MKPlaceCardHeaderViewController *)self newLabel];
  secondLabel = self->_secondLabel;
  self->_secondLabel = v13;

  if (self->_layout == 1)
  {
    [(_MKUILabel *)self->_firstLabel setTextAlignment:1];
    [(_MKUILabel *)self->_secondLabel setTextAlignment:1];
  }
  uint64_t v15 = [(MKPlaceCardHeaderViewController *)self newLabel];
  thirdLabel = self->_thirdLabel;
  self->_thirdLabel = v15;

  if (self->_layout == 1) {
    [(_MKUILabel *)self->_thirdLabel setTextAlignment:1];
  }
  v17 = objc_alloc_init(MKPlaceSectionRowView);
  titleSectionView = self->_titleSectionView;
  self->_titleSectionView = v17;

  [(MKPlaceSectionRowView *)self->_titleSectionView setPreservesSuperviewLayoutMargins:1];
  [(MKPlaceSectionRowView *)self->_titleSectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKViewWithHairline *)self->_titleSectionView setTopHairlineHidden:1];
  [(MKViewWithHairline *)self->_titleSectionView setBottomHairlineHidden:1];
  [(MKPlaceSectionRowView *)self->_titleSectionView addSubview:self->_titleOnlyLabel];
  v19 = objc_alloc_init(MKPlaceSectionRowView);
  labelsSectionView = self->_labelsSectionView;
  self->_labelsSectionView = v19;

  [(MKPlaceSectionRowView *)self->_labelsSectionView setPreservesSuperviewLayoutMargins:1];
  [(MKPlaceSectionRowView *)self->_labelsSectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v21) = 1148846080;
  [(UIView *)self->_labelsSectionView _mapkit_setContentCompressionResistancePriority:1 forAxis:v21];
  [(MKViewWithHairline *)self->_labelsSectionView setTopHairlineHidden:1];
  [(MKViewWithHairline *)self->_labelsSectionView setBottomHairlineHidden:1];
  [(MKPlaceSectionRowView *)self->_labelsSectionView addSubview:self->_firstLabel];
  unint64_t layout = self->_layout;
  if ([(MKPlaceCardHeaderViewController *)self _hasSecondaryName])
  {
    if (!layout)
    {
      v23 = [(MKPlaceCardHeaderViewController *)self newLabel];
      secondaryNameLabel = self->_secondaryNameLabel;
      self->_secondaryNameLabel = v23;

      LODWORD(v25) = 1148846080;
      [(UIView *)self->_secondaryNameLabel _mapkit_setContentCompressionResistancePriority:1 forAxis:v25];
      if (!self->_layout) {
        [(MKPlaceSectionRowView *)self->_labelsSectionView addSubview:self->_secondaryNameLabel];
      }
    }
  }
  [(MKPlaceSectionRowView *)self->_labelsSectionView addSubview:self->_secondLabel];
  [(MKPlaceSectionRowView *)self->_labelsSectionView addSubview:self->_thirdLabel];
  v26 = [(MKPlaceSectionViewController *)self sectionView];
  [v26 setStackDelegate:self];

  v27 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
  leadingGuide = self->_leadingGuide;
  self->_leadingGuide = v27;

  v29 = self->_labelsSectionView;
  v30 = self->_leadingGuide;

  [(MKPlaceSectionRowView *)v29 addLayoutGuide:v30];
}

- (void)updateViews
{
  v36[1] = *MEMORY[0x1E4F143B8];
  unint64_t layout = self->_layout;
  BOOL v4 = layout == 1;
  if (layout == 1)
  {
    uint64_t v5 = [(UIImageView *)self->_logoImageView superview];

    if (!v5)
    {
      [(MKPlaceSectionRowView *)self->_labelsSectionView addSubview:self->_logoImageView];
      [(MKPlaceCardHeaderViewController *)self _loadLogo];
    }
  }
  uint64_t v6 = [(_MKDataHeaderModel *)self->_dataModel firstLine];
  [v6 setColorProvider:&__block_literal_global_72_0];

  LOBYTE(v34) = v4;
  uint64_t v7 = [(_MKDataHeaderModel *)self->_dataModel secondLine];
  [v7 setColorProvider:&v33];

  uint64_t v8 = [(_MKDataHeaderModel *)self->_dataModel thirdLine];
  [v8 setColorProvider:&__block_literal_global_74];

  uint64_t v9 = [(_MKDataHeaderModel *)self->_dataModel forthLine];
  [v9 setColorProvider:&__block_literal_global_76];

  v10 = [(_MKDataHeaderModel *)self->_dataModel secondaryNameLine];
  [v10 setColorProvider:&__block_literal_global_78];

  if ([(MKPlaceCardHeaderViewController *)self _hasSecondaryName])
  {
    if (self->_layout == 1)
    {
LABEL_10:
      v22 = [(_MKDataHeaderModel *)self->_dataModel firstLine];
      v23 = [v22 contentAttributedString];
      [(_MKUILabel *)self->_firstLabel setAttributedText:v23];

      uint64_t v24 = [(_MKDataHeaderModel *)self->_dataModel secondLine];
      double v25 = [v24 contentAttributedString];
      [(_MKUILabel *)self->_secondLabel setAttributedText:v25];

      v26 = [(_MKDataHeaderModel *)self->_dataModel thirdLine];
      v27 = [v26 contentAttributedString];
      [(_MKUILabel *)self->_thirdLabel setAttributedText:v27];

      id v28 = [(MKPlaceSectionViewController *)self sectionView];
      labelsSectionView = self->_labelsSectionView;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&labelsSectionView count:1];
      [v28 setRowViews:v29];

      [(_MKUILabel *)self->_secondLabel setHidden:self->_notVerified];
      goto LABEL_11;
    }
    objc_super v11 = [(_MKDataHeaderModel *)self->_dataModel secondaryNameLine];
    uint64_t v12 = [v11 contentAttributedString];
    [(_MKUILabel *)self->_secondaryNameLabel setAttributedText:v12];
  }
  unint64_t v13 = self->_layout;
  if (v13 == 1) {
    goto LABEL_10;
  }
  if (!v13)
  {
    v14 = [(_MKDataHeaderModel *)self->_dataModel firstLine];
    uint64_t v15 = [v14 contentAttributedString];
    [(_MKUILabel *)self->_firstLabel setAttributedText:v15];

    BOOL v16 = [(_MKDataHeaderModel *)self->_dataModel secondLine];
    v17 = [v16 contentAttributedString];
    [(_MKUILabel *)self->_secondLabel setAttributedText:v17];

    v18 = [(_MKDataHeaderModel *)self->_dataModel thirdLine];
    v19 = [v18 contentAttributedString];
    [(_MKUILabel *)self->_thirdLabel setAttributedText:v19];

    v20 = [(MKPlaceSectionViewController *)self sectionView];
    v36[0] = self->_labelsSectionView;
    double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    [v20 setRowViews:v21];

    [(MKPlaceCardHeaderViewController *)self lastLabelToBottomConstant];
    -[NSLayoutConstraint setConstant:](self->_lastLabelToBottomConstraint, "setConstant:");
  }
LABEL_11:
  v30 = [(_MKDataHeaderModel *)self->_dataModel transitLabel];

  if (v30)
  {
    v31 = [(_MKDataHeaderModel *)self->_dataModel transitLabel];
    thirdDisplayedLabel = self->_thirdDisplayedLabel;
    self->_thirdDisplayedLabel = v31;

    [(MKPlaceSectionRowView *)self->_labelsSectionView addSubview:self->_thirdDisplayedLabel];
    [(_MKUILabel *)self->_thirdLabel setHidden:1];
  }
  else
  {
    objc_storeStrong((id *)&self->_thirdDisplayedLabel, self->_thirdLabel);
  }
  [(_MKUILabel *)self->_thirdLabel invalidateIntrinsicContentSize];
  [(MKPlaceCardHeaderViewController *)self setConstraints];
}

uint64_t __46__MKPlaceCardHeaderViewController_updateViews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 textColor];
}

id __46__MKPlaceCardHeaderViewController_updateViews__block_invoke_2(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    [a2 lightTextColor];
  }
  else {
  v2 = [a2 textColor];
  }

  return v2;
}

uint64_t __46__MKPlaceCardHeaderViewController_updateViews__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 lightTextColor];
}

uint64_t __46__MKPlaceCardHeaderViewController_updateViews__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 lightTextColor];
}

uint64_t __46__MKPlaceCardHeaderViewController_updateViews__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 lightTextColor];
}

- (void)setConstraints
{
  v104[2] = *MEMORY[0x1E4F143B8];
  if (!self->_constraintsCreated)
  {
    self->_constraintsCreated = 1;
    id v3 = +[MKFontManager sharedManager];
    v82 = [v3 subtitleFont];

    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
    BOOL v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    double v5 = 0.0;
    if (!self->_layout)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained placeCardHeaderViewControllerTrailingConstantForTitle:self];
      double v5 = v7;
    }
    uint64_t v8 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v83 = [v8 userInterfaceIdiom];

    uint64_t v9 = [(UILayoutGuide *)self->_leadingGuide leadingAnchor];
    v10 = [(MKPlaceSectionRowView *)self->_labelsSectionView layoutMarginsGuide];
    objc_super v11 = [v10 leadingAnchor];
    uint64_t v12 = [v9 constraintEqualToAnchor:v11];
    v104[0] = v12;
    unint64_t v13 = [(UILayoutGuide *)self->_leadingGuide widthAnchor];
    [v13 constraintEqualToConstant:0.0];
    v14 = v86 = self;
    v104[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
    v93 = v4;
    [v4 addObjectsFromArray:v15];

    BOOL v16 = self;
    if (self->_layout != 1) {
      goto LABEL_8;
    }
    v91 = [(UIImageView *)self->_logoImageView centerXAnchor];
    v89 = [(MKPlaceSectionRowView *)self->_labelsSectionView centerXAnchor];
    v87 = [v91 constraintEqualToAnchor:v89];
    v103[0] = v87;
    v84 = [(UIImageView *)self->_logoImageView topAnchor];
    v17 = [(MKPlaceSectionRowView *)self->_labelsSectionView topAnchor];
    v18 = [v84 constraintEqualToAnchor:v17 constant:15.0];
    v103[1] = v18;
    v19 = [(UIImageView *)self->_logoImageView widthAnchor];
    v20 = [v19 constraintEqualToConstant:86.0];
    v103[2] = v20;
    double v21 = [(UIImageView *)self->_logoImageView widthAnchor];
    v22 = [(UIImageView *)self->_logoImageView heightAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v103[3] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:4];
    [v4 addObjectsFromArray:v24];

    BOOL v16 = self;
    if (self->_layout == 1)
    {
      double v25 = self->_logoImageView;
      if (self->_notVerified)
      {
        firstLabel = self->_firstLabel;
        v26 = (void *)MEMORY[0x1E4F1C978];
        p_firstLabel = &firstLabel;
        uint64_t v28 = 1;
      }
      else
      {
        secondLabel = self->_secondLabel;
        v101[0] = self->_firstLabel;
        v101[1] = secondLabel;
        v26 = (void *)MEMORY[0x1E4F1C978];
        p_firstLabel = (_MKUILabel **)v101;
        uint64_t v28 = 2;
      }
      v37 = [v26 arrayWithObjects:p_firstLabel count:v28];
    }
    else
    {
LABEL_8:
      v29 = v16->_secondLabel;
      v100[0] = v16->_firstLabel;
      v100[1] = v29;
      v100[2] = v16->_thirdDisplayedLabel;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:3];
      v31 = (void *)[v30 mutableCopy];

      if ([(MKPlaceCardHeaderViewController *)v16 _hasSecondaryName] && !v16->_layout)
      {
        [v31 insertObject:v16->_secondaryNameLabel atIndex:1];
        uint64_t v32 = [(_MKUILabel *)v16->_secondLabel topAnchor];
        uint64_t v33 = [(_MKUILabel *)v16->_firstLabel bottomAnchor];
        uint64_t v34 = [v32 constraintEqualToAnchor:v33];
        secondLabelToFirstLabelConstraint = v16->_secondLabelToFirstLabelConstraint;
        v16->_secondLabelToFirstLabelConstraint = (NSLayoutConstraint *)v34;

        LODWORD(v36) = 1148846080;
        [(NSLayoutConstraint *)v16->_secondLabelToFirstLabelConstraint setPriority:v36];
      }
      v37 = (void *)[v31 copy];

      double v25 = 0;
    }
    v80 = [v37 lastObject];
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v39 = v37;
    uint64_t v88 = [v39 countByEnumeratingWithState:&v94 objects:v99 count:16];
    if (v88)
    {
      v40 = 0;
      uint64_t v85 = *(void *)v95;
      id obj = v39;
      do
      {
        for (uint64_t i = 0; i != v88; ++i)
        {
          v92 = v40;
          if (*(void *)v95 != v85) {
            objc_enumerationMutation(obj);
          }
          v42 = *(_MKUILabel **)(*((void *)&v94 + 1) + 8 * i);
          v43 = [(_MKUILabel *)v42 leadingAnchor];
          uint64_t v44 = [(UILayoutGuide *)v16->_leadingGuide trailingAnchor];
          v45 = [v43 constraintEqualToAnchor:v44 constant:0.0];
          v98[0] = v45;
          v90 = v42;
          v46 = [(_MKUILabel *)v42 trailingAnchor];
          uint64_t v47 = [(MKPlaceSectionRowView *)v16->_labelsSectionView layoutMarginsGuide];
          v48 = [v47 trailingAnchor];
          if (v25) {
            double v49 = 0.0;
          }
          else {
            double v49 = -v5;
          }
          v50 = [v46 constraintEqualToAnchor:v48 constant:v49];
          v98[1] = v50;
          [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:2];
          v52 = BOOL v51 = v25;
          [v93 addObjectsFromArray:v52];

          if (v92)
          {
            double v25 = v51;
            if (v83 == 5)
            {
              v53 = v90;
              if (v80 == v90) {
                double v54 = 6.0;
              }
              else {
                double v54 = 1.0;
              }
              BOOL v55 = [(_MKUILabel *)v90 topAnchor];
              v56 = [(_MKUILabel *)v92 bottomAnchor];
              BOOL v51 = [v55 constraintEqualToAnchor:v56 constant:v54];

              BOOL v16 = v86;
            }
            else
            {
              v53 = v90;
              BOOL v62 = [(_MKUILabel *)v90 firstBaselineAnchor];
              v63 = [(_MKUILabel *)v92 lastBaselineAnchor];
              BOOL v16 = v86;
              if (v86->_layout == 1) {
                double v64 = 26.0;
              }
              else {
                double v64 = 21.0;
              }
              objc_msgSend(v82, "_mapkit_scaledValueForValue:", v64);
              objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63);
              BOOL v51 = (UIImageView *)objc_claimAutoreleasedReturnValue();
            }
            if (v53 == v16->_secondLabel)
            {
              LODWORD(v57) = 1148829696;
              [(UIImageView *)v51 setPriority:v57];
            }
            [v93 addObject:v51];
          }
          else if (v51)
          {
            v53 = v90;
            v68 = [(_MKUILabel *)v90 firstBaselineAnchor];
            v69 = [(UIImageView *)v51 bottomAnchor];
            objc_msgSend(v82, "_mapkit_scaledValueForValue:", 34.0);
            v70 = objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69);
            [v93 addObject:v70];

            double v25 = 0;
            BOOL v16 = v86;
          }
          else
          {
            BOOL v16 = v86;
            v53 = v90;
            if (v83 == 5)
            {
              BOOL v51 = [(_MKUILabel *)v90 topAnchor];
              v58 = [(MKPlaceSectionRowView *)v86->_labelsSectionView topAnchor];
              double v59 = 15.0;
              v60 = v51;
              v61 = v58;
            }
            else
            {
              objc_msgSend(v82, "_mapkit_scaledValueForValue:scalingForMacIdiom:respectingTraitEnvironment:", 0, 0, *(double *)&kMapKitPlaceCardHeaderTitleLabelBaselineToTop);
              double v66 = v65;
              BOOL v51 = [(_MKUILabel *)v90 firstBaselineAnchor];
              v58 = [(MKPlaceSectionRowView *)v86->_labelsSectionView topAnchor];
              v60 = v51;
              v61 = v58;
              double v59 = v66;
            }
            v67 = [(UIImageView *)v60 constraintEqualToAnchor:v61 constant:v59];
            [v93 addObject:v67];

            double v25 = 0;
          }

          v40 = v53;
        }
        id v39 = obj;
        uint64_t v88 = [obj countByEnumeratingWithState:&v94 objects:v99 count:16];
      }
      while (v88);

      if (v40)
      {
        v71 = +[MKSystemController sharedInstance];
        int v72 = [v71 userInterfaceIdiom];

        if (v72 == 2) {
          [(_MKUILabel *)v40 bottomAnchor];
        }
        else {
        v74 = [(_MKUILabel *)v40 lastBaselineAnchor];
        }
        v75 = [(MKPlaceSectionRowView *)v16->_labelsSectionView bottomAnchor];
        [(MKPlaceCardHeaderViewController *)v16 lastLabelToBottomConstant];
        uint64_t v76 = objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75);
        lastLabelToBottomConstraint = v16->_lastLabelToBottomConstraint;
        v16->_lastLabelToBottomConstraint = (NSLayoutConstraint *)v76;

        v73 = v93;
        [v93 addObject:v16->_lastLabelToBottomConstraint];
        goto LABEL_50;
      }
    }
    else
    {

      v40 = 0;
    }
    v73 = v93;
LABEL_50:
    uint64_t v78 = [v73 copy];
    constraints = v16->_constraints;
    v16->_constraints = (NSArray *)v78;

    [MEMORY[0x1E4F28DC8] activateConstraints:v16->_constraints];
  }
}

- (void)viewDidLayoutSubviews
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)MKPlaceCardHeaderViewController;
  [(MKPlaceCardHeaderViewController *)&v15 viewDidLayoutSubviews];
  if ([(MKPlaceCardHeaderViewController *)self _hasSecondaryName]
    && self->_constraintsCreated
    && (self->_secondLabelToFirstLabelConstraintConstantMax <= 0.0
     || self->_secondLabelToFirstLabelConstraintConstantMin <= 0.0))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = [(MKPlaceCardHeaderViewController *)self view];
    BOOL v4 = [v3 subviews];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          [v9 setNeedsLayout];
          [v9 layoutIfNeeded];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v6);
    }

    [(_MKUILabel *)self->_firstLabel frame];
    double MaxY = CGRectGetMaxY(v18);
    [(_MKUILabel *)self->_secondLabel frame];
    self->_secondLabelToFirstLabelConstraintConstantMax = CGRectGetMinY(v19) - MaxY;
    [(_MKUILabel *)self->_secondaryNameLabel frame];
    self->_secondLabelToFirstLabelConstraintConstantMin = CGRectGetMinY(v20) - MaxY;
  }
}

- (void)_contentSizeDidChangeNotificationHandler
{
  self->_constraintsCreated = 0;
  [(MKPlaceCardHeaderViewController *)self _contentSizeDidChange];
}

- (void)_contentSizeDidChange
{
  self->_secondLabelToFirstLabelConstraintConstantMax = 0.0;
  self->_secondLabelToFirstLabelConstraintConstantMin = 0.0;
  [(MKPlaceCardHeaderViewController *)self updateContent];
}

- (void)updateContent
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MKPlaceCardHeaderViewController *)self view];

  if (v3)
  {
    BOOL v4 = +[MKFontManager sharedManager];
    uint64_t v5 = [v4 subtitleFont];

    uint64_t v28 = *MEMORY[0x1E4F42508];
    uint64_t v6 = v28;
    uint64_t v7 = [(MKPlaceCardHeaderViewController *)self titleFont];
    v29[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v9 = [(_MKDataHeaderModel *)self->_dataModel firstLine];
    [v9 setFontAttribute:v8];

    uint64_t v26 = v6;
    v27 = v5;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    long long v11 = [(_MKDataHeaderModel *)self->_dataModel secondLine];
    [v11 setFontAttribute:v10];

    uint64_t v24 = v6;
    double v25 = v5;
    long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    long long v13 = [(_MKDataHeaderModel *)self->_dataModel thirdLine];
    [v13 setFontAttribute:v12];

    uint64_t v22 = v6;
    v23 = v5;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    objc_super v15 = [(_MKDataHeaderModel *)self->_dataModel forthLine];
    [v15 setFontAttribute:v14];

    uint64_t v20 = v6;
    double v21 = v5;
    BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v17 = [(_MKDataHeaderModel *)self->_dataModel secondaryNameLine];
    [v17 setFontAttribute:v16];

    CGRect v18 = [(MKPlaceCardHeaderViewController *)self _reviewLabelText];
    [(_MKTokenAttributedString *)self->_ratingsToken setAttributedString:v18];

    CGRect v19 = [(MKPlaceCardHeaderViewController *)self _verifiedText];
    [(_MKTokenAttributedString *)self->_verifiedToken setAttributedString:v19];

    [(MKPlaceCardHeaderViewController *)self updateViews];
  }
}

- (void)infoCardThemeChanged
{
  v4.receiver = self;
  v4.super_class = (Class)MKPlaceCardHeaderViewController;
  [(UIViewController *)&v4 infoCardThemeChanged];
  id v3 = [(MKPlaceCardHeaderViewController *)self _reviewLabelText];
  [(_MKTokenAttributedString *)self->_ratingsToken setAttributedString:v3];

  [(MKPlaceCardHeaderViewController *)self updateViews];
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (MKPlaceCardHeaderViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKPlaceCardHeaderViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setLocalizedHoursBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedHoursBuilder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_lastLabelToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_secondLabelToFirstLabelConstraint, 0);
  objc_storeStrong((id *)&self->_titleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_verifiedToken, 0);
  objc_storeStrong((id *)&self->_venueToken, 0);
  objc_storeStrong((id *)&self->_userLocationToken, 0);
  objc_storeStrong((id *)&self->_openStateToken, 0);
  objc_storeStrong((id *)&self->_categoryToken, 0);
  objc_storeStrong((id *)&self->_priceToken, 0);
  objc_storeStrong((id *)&self->_ratingsToken, 0);
  objc_storeStrong((id *)&self->_distanceToken, 0);
  objc_storeStrong((id *)&self->_secondaryNameToken, 0);
  objc_storeStrong((id *)&self->_titleToken, 0);
  objc_storeStrong((id *)&self->_dataModel, 0);
  objc_storeStrong((id *)&self->_logoURL, 0);
  objc_storeStrong((id *)&self->_leadingGuide, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_thirdDisplayedLabel, 0);
  objc_storeStrong((id *)&self->_thirdLabel, 0);
  objc_storeStrong((id *)&self->_secondaryNameLabel, 0);
  objc_storeStrong((id *)&self->_secondLabel, 0);
  objc_storeStrong((id *)&self->_firstLabel, 0);
  objc_storeStrong((id *)&self->_titleOnlyLabel, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_labelsSectionView, 0);

  objc_storeStrong((id *)&self->_titleSectionView, 0);
}

@end