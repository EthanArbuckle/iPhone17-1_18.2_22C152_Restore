@interface MKPlaceHeaderButtonsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)resizableViewsDisabled;
- (BOOL)shouldStackForButtons:(id)a3;
- (GEOTransitLineItem)lineItem;
- (MKPlaceHeaderButtonsViewController)init;
- (MKPlaceHeaderButtonsViewControllerDelegate)delegate;
- (NSArray)buttons;
- (UIView)contentView;
- (_MKPlaceActionButtonController)alternatePrimaryButtonController;
- (_MKPlaceActionButtonController)secondaryButtonController;
- (_MKPlaceItem)placeItem;
- (id)attributedStringWith:(id)a3;
- (id)directionAttributedStringWithETAString;
- (id)etaStringFor:(unint64_t)a3 travelTime:(double)a4;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (id)primaryAttributedString;
- (id)rerouteAttributedString;
- (id)updateButton:(id)a3 withController:(id)a4;
- (unint64_t)primaryButtonType;
- (void)ETAProviderUpdated:(id)a3;
- (void)_commonInit;
- (void)_contentSizeDidChange;
- (void)primaryButtonSelected:(id)a3;
- (void)setAlternatePrimaryButtonController:(id)a3;
- (void)setConstraints;
- (void)setDelegate:(id)a3;
- (void)setLineItem:(id)a3;
- (void)setPlaceItem:(id)a3;
- (void)setPrimaryButtonType:(unint64_t)a3;
- (void)setResizableViewsDisabled:(BOOL)a3;
- (void)setSecondaryButtonController:(id)a3;
- (void)setupPrimaryButton;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MKPlaceHeaderButtonsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MKPlaceHeaderButtonsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKPlaceHeaderButtonsViewController;
  v2 = [(MKPlaceHeaderButtonsViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MKPlaceHeaderButtonsViewController *)v2 _commonInit];
  }
  return v3;
}

- (void)_commonInit
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];
}

- (void)viewDidLoad
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlaceHeaderButtonsViewDidLoad", (const char *)&unk_18BD3917F, buf, 2u);
  }

  v13.receiver = self;
  v13.super_class = (Class)MKPlaceHeaderButtonsViewController;
  [(MKPlaceHeaderButtonsViewController *)&v13 viewDidLoad];
  v4 = [(MKPlaceSectionViewController *)self sectionView];
  [v4 setPreservesSuperviewLayoutMargins:1];

  objc_super v5 = [(MKPlaceSectionViewController *)self sectionView];
  [v5 setShowsBottomHairline:0];

  v6 = objc_alloc_init(MKPlaceSectionRowView);
  buttonsContainerView = self->_buttonsContainerView;
  self->_buttonsContainerView = v6;

  [(MKPlaceSectionRowView *)self->_buttonsContainerView setPreservesSuperviewLayoutMargins:1];
  [(MKViewWithHairline *)self->_buttonsContainerView setTopHairlineHidden:1];
  [(MKViewWithHairline *)self->_buttonsContainerView setBottomHairlineHidden:1];
  v8 = [(MKPlaceSectionViewController *)self sectionView];
  v15[0] = self->_buttonsContainerView;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v8 setRowViews:v9];

  [(MKPlaceHeaderButtonsViewController *)self setupPrimaryButton];
  v10 = [(MKPlaceHeaderButtonsViewController *)self updateButton:self->_secondaryButton withController:self->_secondaryButtonController];
  secondaryButton = self->_secondaryButton;
  self->_secondaryButton = v10;

  [(MKPlaceHeaderButtonsViewController *)self setConstraints];
  v12 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlaceHeaderButtonsViewDidLoad", (const char *)&unk_18BD3917F, buf, 2u);
  }
}

- (UIView)contentView
{
  return (UIView *)self->_buttonsContainerView;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MKPlaceHeaderButtonsViewController;
  id v7 = a4;
  -[MKPlaceHeaderButtonsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__MKPlaceHeaderButtonsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E54BECF0;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

uint64_t __89__MKPlaceHeaderButtonsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConstraints];
}

- (void)setLineItem:(id)a3
{
  objc_super v5 = (GEOTransitLineItem *)a3;
  if (self->_lineItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lineItem, a3);
    [(MKPlaceHeaderButtonsViewController *)self setPrimaryButtonType:0];
    objc_super v5 = v6;
  }
}

- (void)setPlaceItem:(id)a3
{
  objc_super v5 = (_MKPlaceItem *)a3;
  if (self->_placeItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeItem, a3);
    [(MKPlaceHeaderButtonsViewController *)self setPrimaryButtonType:0];
    objc_super v5 = v6;
  }
}

- (id)etaStringFor:(unint64_t)a3 travelTime:(double)a4
{
  unint64_t v4 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v4) & 1) != 0)
  {
    v6 = _MKLocalizedStringFromThisBundle(off_1E54BED10[v4]);
    id v7 = NSString;
    v8 = _MKPlaceCardFormattedStringForTimeInterval();
    objc_super v9 = objc_msgSend(v7, "stringWithFormat:", v6, v8);

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9];
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v10];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)directionAttributedStringWithETAString
{
  v35[1] = *MEMORY[0x1E4F143B8];
  currentETAString = self->_currentETAString;
  uint64_t v4 = *MEMORY[0x1E4F42508];
  unint64_t v5 = 0x1E4F42000uLL;
  if (currentETAString)
  {
    uint64_t v34 = *MEMORY[0x1E4F42508];
    v6 = (void *)MEMORY[0x1E4F42A30];
    int v7 = _MKPlaceCardUseSmallerFont();
    uint64_t v8 = *MEMORY[0x1E4F43890];
    uint64_t v9 = *MEMORY[0x1E4F438C0];
    if (v7) {
      uint64_t v10 = *MEMORY[0x1E4F43890];
    }
    else {
      uint64_t v10 = *MEMORY[0x1E4F438C0];
    }
    v11 = [v6 preferredFontForTextStyle:v10];
    [v11 pointSize];
    v12 = objc_msgSend(v6, "systemFontOfSize:weight:");
    v35[0] = v12;
    objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    -[NSMutableAttributedString addAttributes:range:](currentETAString, "addAttributes:range:", v13, 0, [(NSMutableAttributedString *)self->_currentETAString length]);

    unint64_t v5 = 0x1E4F42000;
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4F43890];
    uint64_t v9 = *MEMORY[0x1E4F438C0];
  }
  v14 = _MKLocalizedStringFromThisBundle(@"PlaceCard_GetDirections_No_ETA_Short");
  uint64_t v32 = v4;
  v15 = *(void **)(v5 + 2608);
  v16 = (void *)MEMORY[0x1E4F42A38];
  if (_MKPlaceCardUseSmallerFont()) {
    uint64_t v17 = v8;
  }
  else {
    uint64_t v17 = v9;
  }
  v18 = [v16 preferredFontDescriptorWithTextStyle:v17 addingSymbolicTraits:2 options:0];
  v19 = [v15 fontWithDescriptor:v18 size:0.0];
  v33 = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14 attributes:v20];
  v22 = v21;
  if (self->_currentETAString)
  {
    v23 = [v21 string];
    uint64_t v24 = [v23 rangeOfString:@"%@"];
    uint64_t v26 = v25;

    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v27 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n" attributes:v20];
      [v22 appendAttributedString:v27];

      [v22 appendAttributedString:self->_currentETAString];
    }
    else
    {
      objc_msgSend(v22, "replaceCharactersInRange:withAttributedString:", v24, v26, self->_currentETAString);
    }
  }
  v28 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
  v29 = (void *)[v28 mutableCopy];

  [v29 setAlignment:1];
  [v29 setParagraphSpacing:-3.0];
  [v29 setLineBreakMode:5];
  uint64_t v30 = [v22 length];
  objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E4F42540], v29, 0, v30);

  return v22;
}

- (id)rerouteAttributedString
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(_MKPlaceItem *)self->_placeItem mapItem];
  uint64_t v4 = [v3 _detourInfo];
  [v4 detourTime];
  if (v5 > 60.0)
  {
    v6 = [(_MKPlaceItem *)self->_placeItem mapItem];
    int v7 = [v6 _detourInfo];
    [v7 detourTime];
  }
  uint64_t v8 = NSString;
  uint64_t v9 = _MKLocalizedStringFromThisBundle(@"PlaceCard_Reroute_Cost");
  uint64_t v10 = _MKPlaceCardFormattedStringForTimeInterval();
  v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);

  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v34 = *MEMORY[0x1E4F42508];
  uint64_t v13 = v34;
  uint64_t v14 = *MEMORY[0x1E4F438F8];
  v15 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F8]];
  v35[0] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
  uint64_t v17 = (void *)[v12 initWithString:v11 attributes:v16];

  v18 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
  v19 = (void *)[v18 mutableCopy];

  [v19 setAlignment:1];
  id v20 = objc_alloc(MEMORY[0x1E4F28E48]);
  v21 = _MKLocalizedStringFromThisBundle(@"PlaceCard_Reroute_Button");
  v32[0] = v13;
  v22 = (void *)MEMORY[0x1E4F42A30];
  v23 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:v14 addingSymbolicTraits:2 options:0];
  uint64_t v24 = [v22 fontWithDescriptor:v23 size:0.0];
  v32[1] = *MEMORY[0x1E4F42540];
  v33[0] = v24;
  v33[1] = v19;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  uint64_t v26 = (void *)[v20 initWithString:v21 attributes:v25];

  v27 = [v26 string];
  uint64_t v28 = [v27 rangeOfString:@"%@"];
  uint64_t v30 = v29;

  if (v17 && v28 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v26, "replaceCharactersInRange:withAttributedString:", v28, v30, v17);
  }

  return v26;
}

- (id)attributedStringWith:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F42678];
  id v4 = a3;
  double v5 = [v3 defaultParagraphStyle];
  v6 = (void *)[v5 mutableCopy];

  [v6 setAlignment:1];
  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  v17[0] = *MEMORY[0x1E4F42508];
  uint64_t v8 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v9 = (void *)MEMORY[0x1E4F42A38];
  int v10 = _MKPlaceCardUseSmallerFont();
  v11 = (void *)MEMORY[0x1E4F43890];
  if (!v10) {
    v11 = (void *)MEMORY[0x1E4F438C0];
  }
  id v12 = [v9 preferredFontDescriptorWithTextStyle:*v11 addingSymbolicTraits:2 options:0];
  uint64_t v13 = [v8 fontWithDescriptor:v12 size:0.0];
  v17[1] = *MEMORY[0x1E4F42540];
  v18[0] = v13;
  v18[1] = v6;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v15 = (void *)[v7 initWithString:v4 attributes:v14];

  return v15;
}

- (id)primaryAttributedString
{
  switch(self->_primaryButtonType)
  {
    case 1uLL:
      uint64_t v3 = [(MKPlaceHeaderButtonsViewController *)self directionAttributedStringWithETAString];
      goto LABEL_5;
    case 2uLL:
      uint64_t v3 = [(MKPlaceHeaderButtonsViewController *)self rerouteAttributedString];
LABEL_5:
      id v4 = (void *)v3;
      break;
    case 3uLL:
      double v5 = @"Share My Location";
      goto LABEL_8;
    case 4uLL:
      double v5 = @"Add Stop\nto route";
LABEL_8:
      v6 = _MKLocalizedStringFromThisBundle(v5);
      id v4 = [(MKPlaceHeaderButtonsViewController *)self attributedStringWith:v6];

      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (void)ETAProviderUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 etaTransportType];
  [v4 etaTravelTime];
  double v7 = v6;

  uint64_t v8 = [(MKPlaceHeaderButtonsViewController *)self etaStringFor:v5 travelTime:v7];
  currentETAString = self->_currentETAString;
  self->_currentETAString = v8;

  [(MKPlaceHeaderButtonsViewController *)self setupPrimaryButton];
}

- (void)_contentSizeDidChange
{
  [(MKPlaceHeaderButtonsViewController *)self setupPrimaryButton];

  [(MKPlaceHeaderButtonsViewController *)self setConstraints];
}

- (BOOL)shouldStackForButtons:(id)a3
{
  if ((unint64_t)[a3 count] > 2) {
    return 1;
  }
  id v4 = [(MKPlaceHeaderButtonsViewController *)self view];
  [v4 frame];
  double Width = CGRectGetWidth(v19);

  if (Width <= 320.0) {
    return 1;
  }
  double v6 = (void *)MEMORY[0x1E4F42A30];
  double v7 = (void *)MEMORY[0x1E4F42A38];
  int v8 = _MKPlaceCardUseSmallerFont();
  uint64_t v9 = (void *)MEMORY[0x1E4F43890];
  if (!v8) {
    uint64_t v9 = (void *)MEMORY[0x1E4F438C0];
  }
  int v10 = [v7 preferredFontDescriptorWithTextStyle:*v9 addingSymbolicTraits:2 options:0];
  v11 = [v6 fontWithDescriptor:v10 size:0.0];

  [v11 pointSize];
  double v13 = v12;
  int v14 = _MKPlaceCardUseSmallerFont();
  double v15 = 15.0;
  if (v14) {
    double v15 = 13.0;
  }
  if (v13 <= v15)
  {
    uint64_t v17 = [(MKPlaceHeaderButtonsViewController *)self view];
    [v17 frame];
    BOOL v16 = CGRectGetWidth(v20) <= 320.0;
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (void)setConstraints
{
  v2 = self;
  v153[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MKPlaceHeaderButtonsViewController *)self viewIfLoaded];

  if (v3)
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v2->_constraints];
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
    v137 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    uint64_t v5 = (void *)[v4 mutableCopy];
    double v6 = v5;
    if (v2->_primaryButton) {
      objc_msgSend(v5, "addObject:");
    }
    if (v2->_secondaryButton) {
      objc_msgSend(v6, "addObject:");
    }
    BOOL v7 = [(MKPlaceHeaderButtonsViewController *)v2 shouldStackForButtons:v6];
    if (v2->_primaryButton || v2->_secondaryButton)
    {
      int v8 = [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton superview];

      if (!v8) {
        [(MKPlaceSectionRowView *)v2->_buttonsContainerView addSubview:v2->_alternatePrimaryButton];
      }
    }
    else
    {
      [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton removeFromSuperview];
    }
    alternatePrimaryButton = v2->_alternatePrimaryButton;
    if (alternatePrimaryButton)
    {
      int v10 = [(_MKPlaceActionControlledButton *)alternatePrimaryButton superview];
      buttonsContainerView = v2->_buttonsContainerView;

      if (v10 != buttonsContainerView)
      {
        [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton removeFromSuperview];
        [(MKPlaceSectionRowView *)v2->_buttonsContainerView addSubview:v2->_alternatePrimaryButton];
      }
    }
    primaryButton = v2->_primaryButton;
    if (primaryButton && v2->_alternatePrimaryButton)
    {
      v111 = v6;
      v130 = [(_MKPlaceActionControlledButton *)primaryButton topAnchor];
      v127 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView topAnchor];
      id v118 = [v130 constraintEqualToAnchor:v127];
      v153[0] = v118;
      v108 = [(_MKPlaceActionControlledButton *)v2->_primaryButton leadingAnchor];
      id obja = [(MKPlaceSectionRowView *)v2->_buttonsContainerView layoutMarginsGuide];
      v105 = [obja leadingAnchor];
      v102 = [v108 constraintEqualToAnchor:v105];
      v153[1] = v102;
      v100 = [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton topAnchor];
      v98 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView topAnchor];
      v96 = [v100 constraintEqualToAnchor:v98];
      v153[2] = v96;
      v94 = [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton leadingAnchor];
      v92 = [(_MKPlaceActionControlledButton *)v2->_primaryButton trailingAnchor];
      v90 = [v94 constraintEqualToAnchor:v92 constant:6.0];
      v153[3] = v90;
      double v13 = [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton trailingAnchor];
      int v14 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView layoutMarginsGuide];
      double v15 = [v14 trailingAnchor];
      BOOL v16 = [v13 constraintEqualToAnchor:v15];
      v153[4] = v16;
      uint64_t v17 = [(_MKPlaceActionControlledButton *)v2->_primaryButton widthAnchor];
      v18 = [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton widthAnchor];
      CGRect v19 = [v17 constraintEqualToAnchor:v18];
      v153[5] = v19;
      CGRect v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:6];
      [v137 addObjectsFromArray:v20];

      secondaryButton = v2->_secondaryButton;
      if (secondaryButton)
      {
        v22 = [(_MKPlaceActionControlledButton *)secondaryButton leadingAnchor];
        id v23 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView layoutMarginsGuide];
        uint64_t v131 = [v23 leadingAnchor];
        id v119 = v22;
        uint64_t v128 = [v22 constraintEqualToAnchor:v131];
        v152[0] = v128;
        v109 = [(_MKPlaceActionControlledButton *)v2->_secondaryButton trailingAnchor];
        id objb = [(MKPlaceSectionRowView *)v2->_buttonsContainerView layoutMarginsGuide];
        v106 = [objb trailingAnchor];
        v103 = [v109 constraintEqualToAnchor:v106];
        v152[1] = v103;
        uint64_t v24 = [(_MKPlaceActionControlledButton *)v2->_secondaryButton topAnchor];
        uint64_t v25 = [(_MKPlaceActionControlledButton *)v2->_primaryButton bottomAnchor];
        uint64_t v26 = v24;
        v27 = [v24 constraintEqualToAnchor:v25 constant:10.0];
        v152[2] = v27;
        uint64_t v28 = [(_MKPlaceActionControlledButton *)v2->_secondaryButton bottomAnchor];
        uint64_t v29 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView bottomAnchor];
        uint64_t v30 = [v28 constraintEqualToAnchor:v29 constant:-0.0];
        v152[3] = v30;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:4];
        uint64_t v32 = v31 = v2;
        v33 = v137;
        [v137 addObjectsFromArray:v32];

        v2 = v31;
        uint64_t v34 = (void *)v131;

        v35 = (void *)v128;
      }
      else
      {
        v80 = [(_MKPlaceActionControlledButton *)v2->_primaryButton bottomAnchor];
        id v23 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView bottomAnchor];
        id v119 = v80;
        uint64_t v34 = [v80 constraintEqualToAnchor:v23 constant:-0.0];
        v151 = v34;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v151 count:1];
        v33 = v137;
        [v137 addObjectsFromArray:v35];
      }
LABEL_47:
      double v6 = v111;
      goto LABEL_48;
    }
    v36 = v2->_secondaryButton;
    if (v36 && v2->_alternatePrimaryButton)
    {
      v37 = [(_MKPlaceActionControlledButton *)v36 topAnchor];
      id v23 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView topAnchor];
      id v119 = v37;
      uint64_t v132 = [v37 constraintEqualToAnchor:v23];
      v150[0] = v132;
      v129 = [(_MKPlaceActionControlledButton *)v2->_secondaryButton leadingAnchor];
      v124 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView layoutMarginsGuide];
      v121 = [v124 leadingAnchor];
      id objc = [v129 constraintEqualToAnchor:v121];
      v150[1] = objc;
      v112 = [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton topAnchor];
      v110 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView topAnchor];
      v107 = [v112 constraintEqualToAnchor:v110];
      v150[2] = v107;
      v104 = [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton leadingAnchor];
      v101 = [(_MKPlaceActionControlledButton *)v2->_secondaryButton trailingAnchor];
      v99 = [v104 constraintEqualToAnchor:v101 constant:6.0];
      v150[3] = v99;
      v95 = [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton trailingAnchor];
      v97 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView layoutMarginsGuide];
      v93 = [v97 trailingAnchor];
      v91 = [v95 constraintEqualToAnchor:v93];
      v150[4] = v91;
      v89 = [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton bottomAnchor];
      v88 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView bottomAnchor];
      v87 = [v89 constraintEqualToAnchor:v88 constant:-0.0];
      v150[5] = v87;
      v86 = [(_MKPlaceActionControlledButton *)v2->_secondaryButton widthAnchor];
      v38 = [(_MKPlaceActionControlledButton *)v2->_alternatePrimaryButton widthAnchor];
      v39 = [v86 constraintEqualToAnchor:v38];
      v150[6] = v39;
      [(_MKPlaceActionControlledButton *)v2->_secondaryButton bottomAnchor];
      v41 = v40 = v6;
      v42 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView bottomAnchor];
      v43 = [v41 constraintEqualToAnchor:v42 constant:-0.0];
      v150[7] = v43;
      v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:8];
      v33 = v137;
      [v137 addObjectsFromArray:v44];

      uint64_t v34 = (void *)v132;
      double v6 = v40;

      v35 = v129;
LABEL_48:

LABEL_49:
      v45 = v119;
LABEL_50:

LABEL_51:
      uint64_t v81 = [v6 copy];
      buttons = v2->_buttons;
      v2->_buttons = (NSArray *)v81;

      uint64_t v83 = [v33 copy];
      constraints = v2->_constraints;
      v2->_constraints = (NSArray *)v83;

      [MEMORY[0x1E4F28DC8] activateConstraints:v2->_constraints];
      v85 = [(MKPlaceHeaderButtonsViewController *)v2 view];
      objc_msgSend(v85, "_mapkit_setNeedsLayout");

      return;
    }
    if (v7)
    {
      long long v144 = 0u;
      long long v145 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      v45 = (void *)[v6 copy];
      uint64_t v122 = [v45 countByEnumeratingWithState:&v142 objects:v149 count:16];
      if (v122)
      {
        v113 = v6;
        id v46 = 0;
        id obj = v45;
        id v120 = *(id *)v143;
        v135 = v2;
        do
        {
          uint64_t v47 = 0;
          id v48 = v46;
          do
          {
            v133 = v48;
            if (*(id *)v143 != v120) {
              objc_enumerationMutation(obj);
            }
            v49 = *(void **)(*((void *)&v142 + 1) + 8 * v47);
            v125 = [v49 leadingAnchor];
            v50 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView layoutMarginsGuide];
            v51 = [v50 leadingAnchor];
            v52 = [v125 constraintEqualToAnchor:v51];
            v148[0] = v52;
            v53 = [v49 trailingAnchor];
            v54 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView layoutMarginsGuide];
            v55 = [v54 trailingAnchor];
            v56 = [v53 constraintEqualToAnchor:v55];
            v148[1] = v56;
            v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:2];
            [v137 addObjectsFromArray:v57];

            v58 = [v49 topAnchor];
            if (v133)
            {
              v59 = [v133 bottomAnchor];
              v60 = [v58 constraintEqualToAnchor:v59 constant:10.0];
              v2 = v135;
            }
            else
            {
              v2 = v135;
              v59 = [(MKPlaceSectionRowView *)v135->_buttonsContainerView topAnchor];
              v60 = [v58 constraintEqualToAnchor:v59];
            }
            [v137 addObject:v60];

            id v46 = v49;
            ++v47;
            id v48 = v46;
          }
          while (v122 != v47);
          uint64_t v122 = [obj countByEnumeratingWithState:&v142 objects:v149 count:16];
        }
        while (v122);

        v33 = v137;
        double v6 = v113;
        if (!v46) {
          goto LABEL_51;
        }
        id v119 = v46;
        id v23 = [v46 bottomAnchor];
        uint64_t v34 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView bottomAnchor];
        v35 = [v23 constraintEqualToAnchor:v34 constant:-0.0];
        [v137 addObject:v35];
        goto LABEL_48;
      }
    }
    else
    {
      v45 = [v6 reverseObjectEnumerator];
      long long v138 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      uint64_t v126 = [v45 countByEnumeratingWithState:&v138 objects:v147 count:16];
      if (v126)
      {
        v111 = v6;
        id v23 = 0;
        id v119 = v45;
        uint64_t v123 = *(void *)v139;
        v136 = v2;
        do
        {
          uint64_t v61 = 0;
          id v62 = v23;
          do
          {
            v134 = v62;
            if (*(void *)v139 != v123) {
              objc_enumerationMutation(v119);
            }
            v63 = *(void **)(*((void *)&v138 + 1) + 8 * v61);
            v64 = [v63 topAnchor];
            v65 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView topAnchor];
            v66 = [v64 constraintEqualToAnchor:v65];
            v146[0] = v66;
            v67 = [v63 bottomAnchor];
            v68 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView bottomAnchor];
            v69 = [v67 constraintEqualToAnchor:v68 constant:-0.0];
            v146[1] = v69;
            v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:2];
            [v137 addObjectsFromArray:v70];

            if (v134)
            {
              v71 = [v63 widthAnchor];
              v72 = [v134 widthAnchor];
              v73 = [v71 constraintEqualToAnchor:v72];
              [v137 addObject:v73];

              v74 = [v63 leadingAnchor];
              v75 = [v134 trailingAnchor];
              v76 = [v74 constraintEqualToAnchor:v75 constant:10.0];
              [v137 addObject:v76];
              v2 = v136;
            }
            else
            {
              v74 = [v63 leadingAnchor];
              v2 = v136;
              v75 = [(MKPlaceSectionRowView *)v136->_buttonsContainerView layoutMarginsGuide];
              v76 = [v75 leadingAnchor];
              v77 = [v74 constraintEqualToAnchor:v76];
              [v137 addObject:v77];
            }
            id v23 = v63;

            ++v61;
            id v62 = v23;
          }
          while (v126 != v61);
          uint64_t v126 = [v119 countByEnumeratingWithState:&v138 objects:v147 count:16];
        }
        while (v126);
        if (!v23)
        {
          v33 = v137;
          double v6 = v111;
          goto LABEL_49;
        }
        uint64_t v34 = [v23 trailingAnchor];
        v35 = [(MKPlaceSectionRowView *)v2->_buttonsContainerView layoutMarginsGuide];
        v78 = [v35 trailingAnchor];
        v79 = [v34 constraintEqualToAnchor:v78];
        v33 = v137;
        [v137 addObject:v79];

        goto LABEL_47;
      }
    }
    v33 = v137;
    goto LABEL_50;
  }
}

- (void)setPrimaryButtonType:(unint64_t)a3
{
  if (self->_primaryButtonType != a3)
  {
    self->_primaryButtonType = a3;
    currentETAString = self->_currentETAString;
    self->_currentETAString = 0;

    [(MKPlaceHeaderButtonsViewController *)self setupPrimaryButton];
    [(MKPlaceHeaderButtonsViewController *)self setConstraints];
  }
}

- (void)setupPrimaryButton
{
  uint64_t v3 = [(MKPlaceHeaderButtonsViewController *)self viewIfLoaded];

  if (v3)
  {
    id v4 = [(MKPlaceHeaderButtonsViewController *)self traitCollection];
    if ([v4 userInterfaceIdiom] == 5)
    {
      unint64_t primaryButtonType = self->_primaryButtonType;

      if (primaryButtonType == 3) {
        return;
      }
    }
    else
    {
    }
    primaryButton = self->_primaryButton;
    if (self->_primaryButtonType)
    {
      if (!primaryButton)
      {
        BOOL v7 = [[MKPlaceHeaderButton alloc] initWithPrimaryType:self->_primaryButtonType];
        int v8 = self->_primaryButton;
        self->_primaryButton = (_MKPlaceActionControlledButton *)v7;

        [(_MKPlaceActionControlledButton *)self->_primaryButton _mapkit_setTarget:self action:sel_primaryButtonSelected_];
        [(MKPlaceSectionRowView *)self->_buttonsContainerView addSubview:self->_primaryButton];
      }
    }
    else
    {
      [(_MKPlaceActionControlledButton *)primaryButton removeFromSuperview];
      uint64_t v9 = self->_primaryButton;
      self->_primaryButton = 0;
    }
    int v10 = self->_primaryButton;
    id v11 = [(MKPlaceHeaderButtonsViewController *)self primaryAttributedString];
    [(_MKPlaceActionControlledButton *)v10 setPrimaryTitle:v11];
  }
}

- (void)primaryButtonSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(MKPlaceHeaderButtonsViewController *)self delegate];
  [v5 placeHeaderButtonsViewController:self didSelectPrimaryType:self->_primaryButtonType withView:v4];
}

- (id)updateButton:(id)a3 withController:(id)a4
{
  double v6 = (MKPlaceHeaderButton *)a3;
  id v7 = a4;
  int v8 = [(MKPlaceHeaderButtonsViewController *)self viewIfLoaded];

  if (!v8) {
    goto LABEL_4;
  }
  uint64_t v9 = [(MKPlaceHeaderButtonsViewController *)self traitCollection];
  if ([v9 userInterfaceIdiom] == 5)
  {
    unint64_t primaryButtonType = self->_primaryButtonType;

    if (primaryButtonType == 3)
    {
LABEL_4:
      id v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
  }
  double v12 = [v7 buttonTitle];
  uint64_t v13 = [v12 length];
  if (!v6 && v13)
  {
    double v6 = objc_alloc_init(MKPlaceHeaderButton);
    [(MKPlaceSectionRowView *)self->_buttonsContainerView addSubview:v6];
LABEL_13:
    [(MKPlaceHeaderButton *)v6 setButtonController:v7];
    goto LABEL_14;
  }
  if (!v6 || v13)
  {
    if (v13) {
      goto LABEL_13;
    }
  }
  else
  {
    [(MKPlaceHeaderButton *)v6 removeFromSuperview];

    double v6 = 0;
  }
LABEL_14:
  double v6 = v6;

  id v11 = v6;
LABEL_15:

  return v11;
}

- (void)setSecondaryButtonController:(id)a3
{
  p_secondaryButtonController = &self->_secondaryButtonController;
  uint64_t v9 = (_MKPlaceActionButtonController *)a3;
  if (*p_secondaryButtonController != v9)
  {
    [(_MKPlaceActionControlledButton *)self->_secondaryButton removeFromSuperview];
    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = 0;

    objc_storeStrong((id *)&self->_secondaryButtonController, a3);
    id v7 = [(MKPlaceHeaderButtonsViewController *)self updateButton:self->_secondaryButton withController:*p_secondaryButtonController];
    int v8 = self->_secondaryButton;
    self->_secondaryButton = v7;

    if (self->_buttonsContainerView) {
      [(MKPlaceHeaderButtonsViewController *)self setConstraints];
    }
  }
}

- (void)setAlternatePrimaryButtonController:(id)a3
{
  p_alternatePrimaryButtonController = &self->_alternatePrimaryButtonController;
  uint64_t v9 = (_MKPlaceActionButtonController *)a3;
  if (*p_alternatePrimaryButtonController != v9)
  {
    [(_MKPlaceActionControlledButton *)self->_alternatePrimaryButton removeFromSuperview];
    alternatePrimaryButton = self->_alternatePrimaryButton;
    self->_alternatePrimaryButton = 0;

    objc_storeStrong((id *)&self->_alternatePrimaryButtonController, a3);
    id v7 = [(MKPlaceHeaderButtonsViewController *)self updateButton:self->_alternatePrimaryButton withController:*p_alternatePrimaryButtonController];
    int v8 = self->_alternatePrimaryButton;
    self->_alternatePrimaryButton = v7;

    if (self->_buttonsContainerView) {
      [(MKPlaceHeaderButtonsViewController *)self setConstraints];
    }
  }
}

- (id)infoCardChildPossibleActions
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  unint64_t v5 = self->_primaryButtonType - 1;
  if (v5 <= 2) {
    [v3 addObject:qword_1E54BED50[v5]];
  }
  double v6 = [(_MKPlaceItem *)self->_placeItem mapItem];
  char v7 = [v6 _hasFlyover];

  if (v7)
  {
    int v8 = &unk_1ED97EEE0;
  }
  else if ([(_MKPlaceItem *)self->_placeItem options])
  {
    int v8 = &unk_1ED97EEF8;
  }
  else
  {
    if (([(_MKPlaceItem *)self->_placeItem options] & 2) == 0) {
      goto LABEL_10;
    }
    int v8 = &unk_1ED97EF10;
  }
  [v4 addObject:v8];
LABEL_10:
  uint64_t v9 = [(MKPlaceHeaderButtonsViewController *)self secondaryButtonController];
  int v10 = [v9 conformsToProtocol:&unk_1ED9AF3A0];

  if (v10)
  {
    id v11 = [(MKPlaceHeaderButtonsViewController *)self secondaryButtonController];
    if (objc_opt_respondsToSelector())
    {
      double v12 = [v11 infoCardChildPossibleActions];
      if ([v12 count]) {
        [v4 addObjectsFromArray:v12];
      }
    }
  }

  return v4;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)resizableViewsDisabled
{
  return self->_resizableViewsDisabled;
}

- (void)setResizableViewsDisabled:(BOOL)a3
{
  self->_resizableViewsDisabled = a3;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (MKPlaceHeaderButtonsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKPlaceHeaderButtonsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)primaryButtonType
{
  return self->_primaryButtonType;
}

- (_MKPlaceActionButtonController)alternatePrimaryButtonController
{
  return self->_alternatePrimaryButtonController;
}

- (_MKPlaceActionButtonController)secondaryButtonController
{
  return self->_secondaryButtonController;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_secondaryButtonController, 0);
  objc_storeStrong((id *)&self->_alternatePrimaryButtonController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_currentETAString, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_alternatePrimaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_buttonsContainerView, 0);
}

@end