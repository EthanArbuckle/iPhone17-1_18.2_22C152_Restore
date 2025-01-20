@interface MFComposeStyleSelectorViewController
- (CGSize)preferredContentSize;
- (MFComposeColorPickerController)colorPicker;
- (MFComposeFontSelectorButton)fontSelectorButton;
- (MFComposeStyleSelectorButton)boldButton;
- (MFComposeStyleSelectorButton)bulletListButton;
- (MFComposeStyleSelectorButton)decreaseFontSizeButton;
- (MFComposeStyleSelectorButton)decreaseQuoteButton;
- (MFComposeStyleSelectorButton)increaseFontSizeButton;
- (MFComposeStyleSelectorButton)increaseQuoteButton;
- (MFComposeStyleSelectorButton)indentLeftButton;
- (MFComposeStyleSelectorButton)indentRightButton;
- (MFComposeStyleSelectorButton)italicsButton;
- (MFComposeStyleSelectorButton)justifyCenterButton;
- (MFComposeStyleSelectorButton)justifyLeftButton;
- (MFComposeStyleSelectorButton)justifyRightButton;
- (MFComposeStyleSelectorButton)numberedListButton;
- (MFComposeStyleSelectorButton)strikethroughButton;
- (MFComposeStyleSelectorButton)underlineButton;
- (MFComposeStyleSelectorViewControllerDelegate)styleDelegate;
- (MFComposeTextColorButton)textColorButton;
- (MFRoundedCornersStackView)indentStackView;
- (MFRoundedCornersStackView)justifyStackView;
- (MFRoundedCornersStackView)listStackView;
- (MFRoundedCornersStackView)quoteLevelStackView;
- (MFRoundedCornersStackView)textAttributeStackView;
- (UIStackView)containerStackView;
- (UIStackView)fontAttributeStackView;
- (UIStackView)fontTextAttributeStackView;
- (UIStackView)listJustifyStackView;
- (UIStackView)quoteIndentListJustifyStackView;
- (UIStackView)quoteIndentStackView;
- (double)preferredHeightForTraitCollection:(id)a3;
- (id)_composeStyleSelectorButtonForAttributeType:(int64_t)a3;
- (id)_roundedEquallyFilledHorizontalStackView;
- (int64_t)currentFontSize;
- (void)_setupButtons;
- (void)_setupContainer;
- (void)_updateFontsButton:(id)a3;
- (void)changeFontSizeAction:(id)a3;
- (void)closeStyleSelector:(id)a3;
- (void)colorPicker:(id)a3 didChangeSelectedColor:(id)a4;
- (void)colorPickerDidCancel:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)fontPickerViewControllerDidCancel:(id)a3;
- (void)fontPickerViewControllerDidPickFont:(id)a3;
- (void)loadView;
- (void)pickFontAction:(id)a3;
- (void)pickTextColor:(id)a3;
- (void)setBoldButton:(id)a3;
- (void)setBulletListButton:(id)a3;
- (void)setColorPicker:(id)a3;
- (void)setContainerStackView:(id)a3;
- (void)setCurrentFontSize:(int64_t)a3;
- (void)setDecreaseFontSizeButton:(id)a3;
- (void)setDecreaseQuoteButton:(id)a3;
- (void)setFontAttributeStackView:(id)a3;
- (void)setFontSelectorButton:(id)a3;
- (void)setFontTextAttributeStackView:(id)a3;
- (void)setIncreaseFontSizeButton:(id)a3;
- (void)setIncreaseQuoteButton:(id)a3;
- (void)setIndentLeftButton:(id)a3;
- (void)setIndentRightButton:(id)a3;
- (void)setIndentStackView:(id)a3;
- (void)setItalicsButton:(id)a3;
- (void)setJustifyCenterButton:(id)a3;
- (void)setJustifyLeftButton:(id)a3;
- (void)setJustifyRightButton:(id)a3;
- (void)setJustifyStackView:(id)a3;
- (void)setListJustifyStackView:(id)a3;
- (void)setListStackView:(id)a3;
- (void)setNumberedListButton:(id)a3;
- (void)setQuoteIndentListJustifyStackView:(id)a3;
- (void)setQuoteIndentStackView:(id)a3;
- (void)setQuoteLevelStackView:(id)a3;
- (void)setStrikethroughButton:(id)a3;
- (void)setStyleDelegate:(id)a3;
- (void)setTextAttributeStackView:(id)a3;
- (void)setTextColorButton:(id)a3;
- (void)setUnderlineButton:(id)a3;
- (void)styleSelectorAction:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateStateUsingFontAttributes:(id)a3;
- (void)viewDidLoad;
@end

@implementation MFComposeStyleSelectorViewController

- (UIStackView)containerStackView
{
  v16[2] = *MEMORY[0x1E4F143B8];
  containerStackView = self->_containerStackView;
  if (!containerStackView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v5 = [(MFComposeStyleSelectorViewController *)self fontTextAttributeStackView];
    v16[0] = v5;
    v6 = [(MFComposeStyleSelectorViewController *)self quoteIndentListJustifyStackView];
    v16[1] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v8 = (UIStackView *)[v4 initWithArrangedSubviews:v7];
    v9 = self->_containerStackView;
    self->_containerStackView = v8;

    [(UIStackView *)self->_containerStackView setAxis:1];
    [(UIStackView *)self->_containerStackView setAlignment:0];
    [(UIStackView *)self->_containerStackView setDistribution:0];
    [(UIStackView *)self->_containerStackView setSpacing:8.0];
    [(UIStackView *)self->_containerStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(MFComposeStyleSelectorViewController *)self fontTextAttributeStackView];
    v11 = [v10 heightAnchor];
    v12 = [(MFComposeStyleSelectorViewController *)self quoteIndentListJustifyStackView];
    v13 = [v12 heightAnchor];
    v14 = [v11 constraintEqualToAnchor:v13 multiplier:1.0];
    [v14 setActive:1];

    containerStackView = self->_containerStackView;
  }

  return containerStackView;
}

- (UIStackView)quoteIndentStackView
{
  v12[2] = *MEMORY[0x1E4F143B8];
  quoteIndentStackView = self->_quoteIndentStackView;
  if (!quoteIndentStackView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v5 = [(MFComposeStyleSelectorViewController *)self quoteLevelStackView];
    v12[0] = v5;
    v6 = [(MFComposeStyleSelectorViewController *)self indentStackView];
    v12[1] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    uint64_t v8 = [v4 initWithArrangedSubviews:v7];
    p_quoteIndentStackView = (id *)&self->_quoteIndentStackView;
    id v10 = *p_quoteIndentStackView;
    id *p_quoteIndentStackView = (id)v8;

    [*p_quoteIndentStackView setAxis:0];
    [*p_quoteIndentStackView setAlignment:0];
    [*p_quoteIndentStackView setDistribution:1];
    [*p_quoteIndentStackView setSpacing:8.0];
    quoteIndentStackView = (UIStackView *)*p_quoteIndentStackView;
  }

  return quoteIndentStackView;
}

- (UIStackView)quoteIndentListJustifyStackView
{
  v11[2] = *MEMORY[0x1E4F143B8];
  quoteIndentListJustifyStackView = self->_quoteIndentListJustifyStackView;
  if (!quoteIndentListJustifyStackView)
  {
    objc_msgSend(MEMORY[0x1E4FB1C60], "mf_equallyFilledVerticalStackView");
    id v4 = (UIStackView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_quoteIndentListJustifyStackView;
    self->_quoteIndentListJustifyStackView = v4;

    [(UIStackView *)self->_quoteIndentListJustifyStackView setSpacing:8.0];
    v6 = self->_quoteIndentListJustifyStackView;
    v7 = [(MFComposeStyleSelectorViewController *)self listJustifyStackView];
    v11[0] = v7;
    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self quoteIndentStackView];
    v11[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(UIStackView *)v6 mf_addArrangedSubviews:v9];

    quoteIndentListJustifyStackView = self->_quoteIndentListJustifyStackView;
  }

  return quoteIndentListJustifyStackView;
}

- (UIStackView)fontTextAttributeStackView
{
  v11[2] = *MEMORY[0x1E4F143B8];
  fontTextAttributeStackView = self->_fontTextAttributeStackView;
  if (!fontTextAttributeStackView)
  {
    objc_msgSend(MEMORY[0x1E4FB1C60], "mf_equallyFilledVerticalStackView");
    id v4 = (UIStackView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fontTextAttributeStackView;
    self->_fontTextAttributeStackView = v4;

    [(UIStackView *)self->_fontTextAttributeStackView setSpacing:8.0];
    v6 = self->_fontTextAttributeStackView;
    v7 = [(MFComposeStyleSelectorViewController *)self textAttributeStackView];
    v11[0] = v7;
    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self fontAttributeStackView];
    v11[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(UIStackView *)v6 mf_addArrangedSubviews:v9];

    fontTextAttributeStackView = self->_fontTextAttributeStackView;
  }

  return fontTextAttributeStackView;
}

- (UIStackView)fontAttributeStackView
{
  v40[2] = *MEMORY[0x1E4F143B8];
  fontAttributeStackView = self->_fontAttributeStackView;
  if (!fontAttributeStackView)
  {
    v35 = [(MFComposeStyleSelectorViewController *)self _roundedEquallyFilledHorizontalStackView];
    id v4 = [(MFComposeStyleSelectorViewController *)self decreaseFontSizeButton];
    v40[0] = v4;
    v5 = [(MFComposeStyleSelectorViewController *)self increaseFontSizeButton];
    v40[1] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    objc_msgSend(v35, "mf_addArrangedSubviews:", v6);

    id v7 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v39[0] = v35;
    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self textColorButton];
    v39[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    v36 = (void *)[v7 initWithArrangedSubviews:v9];

    [v36 setAxis:0];
    [v36 setAlignment:0];
    [v36 setDistribution:0];
    [v36 setSpacing:16.0];
    id v10 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v11 = [(MFComposeStyleSelectorViewController *)self fontSelectorButton];
    v38[0] = v11;
    v38[1] = v36;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    v13 = (UIStackView *)[v10 initWithArrangedSubviews:v12];
    v14 = self->_fontAttributeStackView;
    self->_fontAttributeStackView = v13;

    [(UIStackView *)self->_fontAttributeStackView setAxis:0];
    [(UIStackView *)self->_fontAttributeStackView setAlignment:3];
    [(UIStackView *)self->_fontAttributeStackView setDistribution:1];
    [(UIStackView *)self->_fontAttributeStackView setSpacing:8.0];
    v15 = (void *)MEMORY[0x1E4F28DC8];
    v31 = [(MFComposeStyleSelectorViewController *)self fontSelectorButton];
    v34 = [v31 heightAnchor];
    v30 = [(UIStackView *)self->_fontAttributeStackView heightAnchor];
    v29 = objc_msgSend(v34, "constraintEqualToAnchor:");
    v37[0] = v29;
    v28 = [(MFComposeStyleSelectorViewController *)self textColorButton];
    v33 = [v28 widthAnchor];
    v27 = [(UIStackView *)self->_fontAttributeStackView heightAnchor];
    v26 = objc_msgSend(v33, "constraintEqualToAnchor:");
    v37[1] = v26;
    v25 = [(MFComposeStyleSelectorViewController *)self textColorButton];
    v32 = [v25 heightAnchor];
    v16 = [(MFComposeStyleSelectorViewController *)self textColorButton];
    v17 = [v16 widthAnchor];
    v18 = [v32 constraintEqualToAnchor:v17];
    v37[2] = v18;
    v19 = [v35 heightAnchor];
    v20 = [(UIStackView *)self->_fontAttributeStackView heightAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v37[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    [v15 activateConstraints:v22];

    objc_msgSend(MEMORY[0x1E4FB08E0], "mf_defaultComposeFontPixelSize");
    [(MFComposeStyleSelectorViewController *)self setCurrentFontSize:(uint64_t)v23];

    fontAttributeStackView = self->_fontAttributeStackView;
  }

  return fontAttributeStackView;
}

- (UIStackView)listJustifyStackView
{
  v12[2] = *MEMORY[0x1E4F143B8];
  listJustifyStackView = self->_listJustifyStackView;
  if (!listJustifyStackView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v5 = [(MFComposeStyleSelectorViewController *)self listStackView];
    v12[0] = v5;
    v6 = [(MFComposeStyleSelectorViewController *)self justifyStackView];
    v12[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    uint64_t v8 = [v4 initWithArrangedSubviews:v7];
    p_listJustifyStackView = (id *)&self->_listJustifyStackView;
    id v10 = *p_listJustifyStackView;
    id *p_listJustifyStackView = (id)v8;

    [*p_listJustifyStackView setAxis:0];
    [*p_listJustifyStackView setAlignment:0];
    [*p_listJustifyStackView setDistribution:1];
    [*p_listJustifyStackView setSpacing:8.0];
    listJustifyStackView = (UIStackView *)*p_listJustifyStackView;
  }

  return listJustifyStackView;
}

- (MFRoundedCornersStackView)textAttributeStackView
{
  v13[4] = *MEMORY[0x1E4F143B8];
  textAttributeStackView = self->_textAttributeStackView;
  if (!textAttributeStackView)
  {
    id v4 = [(MFComposeStyleSelectorViewController *)self _roundedEquallyFilledHorizontalStackView];
    v5 = self->_textAttributeStackView;
    self->_textAttributeStackView = v4;

    v6 = self->_textAttributeStackView;
    id v7 = [(MFComposeStyleSelectorViewController *)self boldButton];
    v13[0] = v7;
    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self italicsButton];
    v13[1] = v8;
    v9 = [(MFComposeStyleSelectorViewController *)self underlineButton];
    v13[2] = v9;
    id v10 = [(MFComposeStyleSelectorViewController *)self strikethroughButton];
    v13[3] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
    [(MFRoundedCornersStackView *)v6 mf_addArrangedSubviews:v11];

    textAttributeStackView = self->_textAttributeStackView;
  }

  return textAttributeStackView;
}

- (MFRoundedCornersStackView)listStackView
{
  v11[2] = *MEMORY[0x1E4F143B8];
  listStackView = self->_listStackView;
  if (!listStackView)
  {
    id v4 = [(MFComposeStyleSelectorViewController *)self _roundedEquallyFilledHorizontalStackView];
    v5 = self->_listStackView;
    self->_listStackView = v4;

    v6 = self->_listStackView;
    id v7 = [(MFComposeStyleSelectorViewController *)self numberedListButton];
    v11[0] = v7;
    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self bulletListButton];
    v11[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(MFRoundedCornersStackView *)v6 mf_addArrangedSubviews:v9];

    listStackView = self->_listStackView;
  }

  return listStackView;
}

- (MFRoundedCornersStackView)indentStackView
{
  v11[2] = *MEMORY[0x1E4F143B8];
  indentStackView = self->_indentStackView;
  if (!indentStackView)
  {
    id v4 = [(MFComposeStyleSelectorViewController *)self _roundedEquallyFilledHorizontalStackView];
    v5 = self->_indentStackView;
    self->_indentStackView = v4;

    v6 = self->_indentStackView;
    id v7 = [(MFComposeStyleSelectorViewController *)self indentLeftButton];
    v11[0] = v7;
    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self indentRightButton];
    v11[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(MFRoundedCornersStackView *)v6 mf_addArrangedSubviews:v9];

    indentStackView = self->_indentStackView;
  }

  return indentStackView;
}

- (MFRoundedCornersStackView)justifyStackView
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  justifyStackView = self->_justifyStackView;
  if (!justifyStackView)
  {
    id v4 = [(MFComposeStyleSelectorViewController *)self _roundedEquallyFilledHorizontalStackView];
    v5 = self->_justifyStackView;
    self->_justifyStackView = v4;

    v6 = self->_justifyStackView;
    id v7 = [(MFComposeStyleSelectorViewController *)self justifyLeftButton];
    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self justifyCenterButton];
    v12[1] = v8;
    v9 = [(MFComposeStyleSelectorViewController *)self justifyRightButton];
    v12[2] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    [(MFRoundedCornersStackView *)v6 mf_addArrangedSubviews:v10];

    justifyStackView = self->_justifyStackView;
  }

  return justifyStackView;
}

- (MFRoundedCornersStackView)quoteLevelStackView
{
  v11[2] = *MEMORY[0x1E4F143B8];
  quoteLevelStackView = self->_quoteLevelStackView;
  if (!quoteLevelStackView)
  {
    id v4 = [(MFComposeStyleSelectorViewController *)self _roundedEquallyFilledHorizontalStackView];
    v5 = self->_quoteLevelStackView;
    self->_quoteLevelStackView = v4;

    v6 = self->_quoteLevelStackView;
    id v7 = [(MFComposeStyleSelectorViewController *)self decreaseQuoteButton];
    v11[0] = v7;
    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self increaseQuoteButton];
    v11[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(MFRoundedCornersStackView *)v6 mf_addArrangedSubviews:v9];

    quoteLevelStackView = self->_quoteLevelStackView;
  }

  return quoteLevelStackView;
}

- (MFComposeFontSelectorButton)fontSelectorButton
{
  fontSelectorButton = self->_fontSelectorButton;
  if (!fontSelectorButton)
  {
    uint64_t v4 = *MEMORY[0x1E4FB28C8];
    v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v6 = +[MFComposeFontSelectorButton buttonWithFont:v5];
    id v7 = self->_fontSelectorButton;
    self->_fontSelectorButton = v6;

    uint64_t v8 = [(MFComposeFontSelectorButton *)self->_fontSelectorButton layer];
    [v8 setCornerRadius:10.0];

    v9 = [(MFComposeFontSelectorButton *)self->_fontSelectorButton layer];
    [v9 setMasksToBounds:1];

    [(MFComposeFontSelectorButton *)self->_fontSelectorButton addTarget:self action:sel_pickFontAction_ forControlEvents:64];
    id v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v4];
    [(MFComposeStyleSelectorViewController *)self _updateFontsButton:v10];

    fontSelectorButton = self->_fontSelectorButton;
  }

  return fontSelectorButton;
}

- (MFComposeTextColorButton)textColorButton
{
  textColorButton = self->_textColorButton;
  if (!textColorButton)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] labelColor];
    v5 = +[MFComposeTextColorButton buttonWithColor:v4];
    v6 = self->_textColorButton;
    self->_textColorButton = v5;

    [(MFComposeTextColorButton *)self->_textColorButton addTarget:self action:sel_pickTextColor_ forControlEvents:64];
    textColorButton = self->_textColorButton;
  }

  return textColorButton;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)MFComposeStyleSelectorViewController;
  [(MFComposeStyleSelectorViewController *)&v9 loadView];
  v3 = [MEMORY[0x1E4FB1618] mailStyleSheetBackground];
  uint64_t v4 = [(MFComposeStyleSelectorViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(MFComposeStyleSelectorViewController *)self _setupButtons];
  [(MFComposeStyleSelectorViewController *)self _setupContainer];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"FORMAT_TITLE" value:&stru_1F0817A00 table:@"Main"];
  [(MFComposeStyleSelectorViewController *)self setTitle:v6];

  id v7 = [MEMORY[0x1E4FB1618] mailStyleSheetBackground];
  uint64_t v8 = [(MFComposeStyleSelectorViewController *)self popoverPresentationController];
  [v8 setArrowBackgroundColor:v7];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)MFComposeStyleSelectorViewController;
  [(MFComposeStyleSelectorViewController *)&v15 viewDidLoad];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"FORMAT_TITLE" value:&stru_1F0817A00 table:@"Main"];

  v5 = [(MFComposeStyleSelectorViewController *)self popoverPresentationController];

  if (v5)
  {
    [(MFComposeStyleSelectorViewController *)self setTitle:v4];
  }
  else
  {
    v6 = [MFComposeActionCardTitleView alloc];
    id v7 = -[MFComposeActionCardTitleView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v9 = [v8 localizedStringForKey:@"FORMAT_TITLE" value:&stru_1F0817A00 table:@"Main"];
    id v10 = [(MFComposeActionCardTitleView *)v7 titleLabel];
    [v10 setText:v9];

    v11 = [(MFComposeActionCardTitleView *)v7 closeButton];
    [v11 addTarget:self action:sel_closeStyleSelector_ forEvents:64];

    v12 = [(MFComposeStyleSelectorViewController *)self navigationItem];
    [v12 setTitleView:v7];

    v13 = [(MFComposeStyleSelectorViewController *)self navigationItem];
    [v13 _setManualScrollEdgeAppearanceProgress:0.0];

    v14 = [(MFComposeStyleSelectorViewController *)self navigationItem];
    [v14 _setManualScrollEdgeAppearanceEnabled:1];
  }
}

- (CGSize)preferredContentSize
{
  v3 = [(MFComposeStyleSelectorViewController *)self traitCollection];
  [(MFComposeStyleSelectorViewController *)self preferredHeightForTraitCollection:v3];
  double v5 = v4;

  double v6 = 375.0;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFComposeStyleSelectorViewController;
  [(MFComposeStyleSelectorViewController *)&v9 traitCollectionDidChange:v4];
  double v5 = [(MFComposeStyleSelectorViewController *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];

  double v7 = [(MFComposeStyleSelectorViewController *)self fontTextAttributeStackView];
  if (v6 == 1)
  {
    [v7 setAxis:0];

    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self quoteIndentListJustifyStackView];
    [v8 setAxis:0];
  }
  else
  {
    [v7 setAxis:1];

    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self quoteIndentListJustifyStackView];
    [v8 setAxis:1];
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(MFComposeStyleSelectorViewController *)self presentedViewController];

  if (v7)
  {
    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self presentedViewController];
    [v8 dismissViewControllerAnimated:v4 completion:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)MFComposeStyleSelectorViewController;
  [(MFComposeStyleSelectorViewController *)&v9 dismissViewControllerAnimated:v4 completion:v6];
}

- (void)styleSelectorAction:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(MFComposeStyleSelectorViewController *)self styleDelegate];
  double v5 = +[MFComposeTextStyle composeTextStyleForTextStyleType:](MFComposeTextStyle, "composeTextStyleForTextStyleType:", [v6 styleType]);
  [v4 composeStyleSelector:self didSelectStyle:v5];
}

- (void)closeStyleSelector:(id)a3
{
  id v4 = [(MFComposeStyleSelectorViewController *)self styleDelegate];
  [v4 composeStyleSelectorDidCancel:self];
}

- (void)pickTextColor:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(MFComposeStyleSelectorViewController *)self presentedViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v4 topViewController],
        double v5 = (MFComposeColorPickerController *)objc_claimAutoreleasedReturnValue(),
        id v6 = self->_colorPicker,
        v5,
        v5 != v6))
  {
    double v7 = [(MFComposeStyleSelectorViewController *)self popoverPresentationController];

    uint64_t v8 = [MFComposeColorPickerController alloc];
    objc_super v9 = [(MFComposeStyleSelectorViewController *)self textColorButton];
    id v10 = [v9 color];
    v11 = [(MFComposeColorPickerController *)v8 initWithSelectedColor:v10 shouldShowTitleBar:v7 == 0];
    colorPicker = self->_colorPicker;
    self->_colorPicker = v11;

    [(MFComposeColorPickerController *)self->_colorPicker setDelegate:self];
    if (v7)
    {
      v13 = [(MFComposeStyleSelectorViewController *)self navigationController];
      [v13 pushViewController:self->_colorPicker animated:1];
    }
    else
    {
      v14 = (objc_class *)objc_opt_class();
      objc_super v15 = NSStringFromClass(v14);
      v16 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_colorPicker];
      v17 = [v16 presentationController];
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v18 = (void *)MEMORY[0x1E4FB1C30];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __54__MFComposeStyleSelectorViewController_pickTextColor___block_invoke;
      v22[3] = &unk_1E5F79EF0;
      objc_copyWeak(&v23, &location);
      v19 = [v18 _detentWithIdentifier:v15 resolutionContextBlock:v22];
      v25[0] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      [v17 setDetents:v20];

      [v17 setLargestUndimmedDetentIdentifier:v15];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __54__MFComposeStyleSelectorViewController_pickTextColor___block_invoke_2;
      v21[3] = &unk_1E5F79088;
      v21[4] = self;
      [(MFComposeStyleSelectorViewController *)self presentViewController:v16 animated:1 completion:v21];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

double __54__MFComposeStyleSelectorViewController_pickTextColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = [v3 _containerTraitCollection];
  [WeakRetained preferredHeightForTraitCollection:v5];
  double v7 = v6;

  return v7;
}

void __54__MFComposeStyleSelectorViewController_pickTextColor___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) styleDelegate];
  if (objc_opt_respondsToSelector()) {
    [v2 composeStyleSelectorDidPresentColorPicker:*(void *)(a1 + 32)];
  }
}

- (void)pickFontAction:(id)a3
{
  id v11 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FB17B8]);
  [v4 setIncludeFaces:0];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB17B0]) initWithConfiguration:v4];
  double v6 = [v11 representedFont];
  double v7 = [v6 fontDescriptor];
  [v5 setSelectedFontDescriptor:v7];

  [v5 setDelegate:self];
  uint64_t v8 = [(MFComposeStyleSelectorViewController *)self styleDelegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v8 presentingViewControllerForComposeStyleSelector:self],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = (MFComposeStyleSelectorViewController *)v9;
    [(MFComposeStyleSelectorViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v10 = self;
  }
  [(MFComposeStyleSelectorViewController *)v10 presentViewController:v5 animated:1 completion:0];
}

- (void)changeFontSizeAction:(id)a3
{
  id v6 = a3;
  if ([v6 styleType] == 6
    && [(MFComposeStyleSelectorViewController *)self currentFontSize] <= 999)
  {
    int64_t v4 = [(MFComposeStyleSelectorViewController *)self currentFontSize] + 1;
LABEL_7:
    [(MFComposeStyleSelectorViewController *)self setCurrentFontSize:v4];
    goto LABEL_8;
  }
  if ([v6 styleType] == 5
    && [(MFComposeStyleSelectorViewController *)self currentFontSize] >= 3)
  {
    int64_t v4 = [(MFComposeStyleSelectorViewController *)self currentFontSize] - 1;
    goto LABEL_7;
  }
LABEL_8:
  double v5 = [(MFComposeStyleSelectorViewController *)self styleDelegate];
  objc_msgSend(v5, "composeStyleSelector:didChangeFontSize:", self, (double)-[MFComposeStyleSelectorViewController currentFontSize](self, "currentFontSize"));
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = [(MFComposeStyleSelectorViewController *)self popoverPresentationController];

  double v6 = 0.0;
  if (!v5)
  {
    +[MFComposeActionCardTitleView heightForTraitCollection:v4];
    double v6 = v7;
  }
  uint64_t v8 = [v4 verticalSizeClass];
  uint64_t v9 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
  [v9 lineHeight];
  if (v8 == 1) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 4;
  }
  double v12 = ceil(v10);
  double v13 = v12 + v12;

  return v6 + (double)(v11 - 1) * 8.0 + (double)v11 * fmax(v13, 46.0) + 10.0 + 25.0;
}

- (void)updateStateUsingFontAttributes:(id)a3
{
  id v30 = a3;
  id v4 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  double v5 = v4;
  if (v4)
  {
    [v4 pointSize];
    [(MFComposeStyleSelectorViewController *)self setCurrentFontSize:(uint64_t)v6];
    unsigned int v7 = [v5 traits];
    uint64_t v8 = [(MFComposeStyleSelectorViewController *)self boldButton];
    [v8 setSelected:(v7 >> 1) & 1];

    LOBYTE(v7) = [v5 traits];
    uint64_t v9 = [(MFComposeStyleSelectorViewController *)self italicsButton];
    [v9 setSelected:v7 & 1];

    [(MFComposeStyleSelectorViewController *)self _updateFontsButton:v5];
  }
  double v10 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4FB0808]];
  uint64_t v11 = [(MFComposeStyleSelectorViewController *)self underlineButton];
  [v11 setSelected:v10 != 0];

  double v12 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4FB0768]];
  double v13 = [(MFComposeStyleSelectorViewController *)self strikethroughButton];
  [v13 setSelected:v12 != 0];

  v14 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
  objc_super v15 = v14;
  if (!v14)
  {
    objc_super v15 = [MEMORY[0x1E4FB1618] labelColor];
  }
  v16 = [(MFComposeStyleSelectorViewController *)self textColorButton];
  [v16 setColor:v15];

  if (!v14) {
  v17 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];
  }
  if (v17)
  {
    v18 = [(MFComposeStyleSelectorViewController *)self justifyLeftButton];
    [v18 setSelected:0];

    v19 = [(MFComposeStyleSelectorViewController *)self justifyCenterButton];
    [v19 setSelected:0];

    v20 = [(MFComposeStyleSelectorViewController *)self justifyRightButton];
    [v20 setSelected:0];

    uint64_t v21 = [v17 alignment];
    if (v21)
    {
      if (v21 == 1)
      {
        v22 = [(MFComposeStyleSelectorViewController *)self justifyCenterButton];
        [v22 setSelected:1];
      }
      else
      {
        if (v21 != 2)
        {
LABEL_15:
          id v23 = [(MFComposeStyleSelectorViewController *)self bulletListButton];
          [v23 setSelected:0];

          v24 = [(MFComposeStyleSelectorViewController *)self numberedListButton];
          [v24 setSelected:0];

          v25 = [v17 textLists];
          if ([v25 count])
          {
            v26 = [v25 lastObject];
            v27 = [v26 markerFormat];
            BOOL v28 = +[MFComposeTextStyle isTextListStyleOrdered:v27];

            if (v28) {
              [(MFComposeStyleSelectorViewController *)self numberedListButton];
            }
            else {
            v29 = [(MFComposeStyleSelectorViewController *)self bulletListButton];
            }
            [v29 setSelected:1];
          }
          goto LABEL_21;
        }
        v22 = [(MFComposeStyleSelectorViewController *)self justifyRightButton];
        [v22 setSelected:1];
      }
    }
    else
    {
      v22 = [(MFComposeStyleSelectorViewController *)self justifyLeftButton];
      [v22 setSelected:1];
    }

    goto LABEL_15;
  }
LABEL_21:
}

- (void)colorPickerDidCancel:(id)a3
{
  id v4 = [(MFComposeStyleSelectorViewController *)self colorPicker];
  [v4 dismissViewControllerAnimated:1 completion:0];

  [(MFComposeStyleSelectorViewController *)self setColorPicker:0];
}

- (void)colorPicker:(id)a3 didChangeSelectedColor:(id)a4
{
  id v7 = a4;
  double v5 = [(MFComposeStyleSelectorViewController *)self textColorButton];
  [v5 setColor:v7];

  double v6 = [(MFComposeStyleSelectorViewController *)self styleDelegate];
  [v6 composeStyleSelector:self didChangeTextColor:v7];
}

- (void)fontPickerViewControllerDidCancel:(id)a3
{
  id v5 = a3;
  id v4 = [(MFComposeStyleSelectorViewController *)self styleDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 composeStyleSelectorDidDismissFontPicker:self];
  }
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB08E0];
  id v9 = v4;
  double v6 = [v4 selectedFontDescriptor];
  id v7 = objc_msgSend(v5, "fontWithDescriptor:size:", v6, (double)-[MFComposeStyleSelectorViewController currentFontSize](self, "currentFontSize"));

  [(MFComposeStyleSelectorViewController *)self _updateFontsButton:v7];
  uint64_t v8 = [(MFComposeStyleSelectorViewController *)self styleDelegate];
  [v8 composeStyleSelector:self didChangeFont:v7];

  [v9 dismissViewControllerAnimated:1 completion:0];
}

- (void)_setupContainer
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(MFComposeStyleSelectorViewController *)self view];
  id v4 = [(MFComposeStyleSelectorViewController *)self containerStackView];
  [v3 addSubview:v4];

  id v5 = (void *)MEMORY[0x1E4F28DC8];
  id v30 = [(MFComposeStyleSelectorViewController *)self containerStackView];
  v29 = [v30 topAnchor];
  v26 = [(MFComposeStyleSelectorViewController *)self view];
  v25 = [v26 layoutMarginsGuide];
  v24 = [v25 topAnchor];
  id v23 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", 10.0);
  v31[0] = v23;
  v22 = [(MFComposeStyleSelectorViewController *)self containerStackView];
  BOOL v28 = [v22 leadingAnchor];
  uint64_t v21 = [(MFComposeStyleSelectorViewController *)self view];
  v20 = [v21 layoutMarginsGuide];
  v19 = [v20 leadingAnchor];
  v18 = objc_msgSend(v28, "constraintEqualToAnchor:");
  v31[1] = v18;
  v17 = [(MFComposeStyleSelectorViewController *)self containerStackView];
  v27 = [v17 trailingAnchor];
  v16 = [(MFComposeStyleSelectorViewController *)self view];
  objc_super v15 = [v16 layoutMarginsGuide];
  double v6 = [v15 trailingAnchor];
  id v7 = [v27 constraintEqualToAnchor:v6];
  v31[2] = v7;
  uint64_t v8 = [(MFComposeStyleSelectorViewController *)self view];
  id v9 = [v8 layoutMarginsGuide];
  double v10 = [v9 bottomAnchor];
  uint64_t v11 = [(MFComposeStyleSelectorViewController *)self containerStackView];
  double v12 = [v11 bottomAnchor];
  double v13 = [v10 constraintEqualToAnchor:v12 constant:25.0];
  v31[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  [v5 activateConstraints:v14];
}

- (id)_roundedEquallyFilledHorizontalStackView
{
  id v2 = +[UIStackView mf_equallyFilledHorizontalStackView];
  [v2 setSpacing:1.0];
  [v2 setCornerRadius:10.0];

  return v2;
}

- (id)_composeStyleSelectorButtonForAttributeType:(int64_t)a3
{
  id v3 = +[MFComposeStyleSelectorButton buttonWithStyleType:a3 target:self action:sel_styleSelectorAction_ maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];

  return v3;
}

- (void)_setupButtons
{
  id v3 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:1];
  boldButton = self->_boldButton;
  self->_boldButton = v3;

  id v5 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:2];
  italicsButton = self->_italicsButton;
  self->_italicsButton = v5;

  id v7 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:3];
  underlineButton = self->_underlineButton;
  self->_underlineButton = v7;

  id v9 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:4];
  strikethroughButton = self->_strikethroughButton;
  self->_strikethroughButton = v9;

  id v11 = (id)*MEMORY[0x1E4FB2798];
  double v12 = +[MFComposeStyleSelectorButton buttonWithStyleType:5 target:self action:sel_changeFontSizeAction_ maximumContentSizeCategory:v11];
  decreaseFontSizeButton = self->_decreaseFontSizeButton;
  self->_decreaseFontSizeButton = v12;

  id v14 = v11;
  objc_super v15 = +[MFComposeStyleSelectorButton buttonWithStyleType:6 target:self action:sel_changeFontSizeAction_ maximumContentSizeCategory:v14];
  increaseFontSizeButton = self->_increaseFontSizeButton;
  self->_increaseFontSizeButton = v15;

  v17 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:7];
  numberedListButton = self->_numberedListButton;
  self->_numberedListButton = v17;

  v19 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:8];
  bulletListButton = self->_bulletListButton;
  self->_bulletListButton = v19;

  uint64_t v21 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:13];
  justifyLeftButton = self->_justifyLeftButton;
  self->_justifyLeftButton = v21;

  id v23 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:14];
  justifyCenterButton = self->_justifyCenterButton;
  self->_justifyCenterButton = v23;

  v25 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:15];
  justifyRightButton = self->_justifyRightButton;
  self->_justifyRightButton = v25;

  v27 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:11];
  increaseQuoteButton = self->_increaseQuoteButton;
  self->_increaseQuoteButton = v27;

  v29 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:12];
  decreaseQuoteButton = self->_decreaseQuoteButton;
  self->_decreaseQuoteButton = v29;

  v31 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:9];
  indentLeftButton = self->_indentLeftButton;
  self->_indentLeftButton = v31;

  v33 = [(MFComposeStyleSelectorViewController *)self _composeStyleSelectorButtonForAttributeType:10];
  indentRightButton = self->_indentRightButton;
  self->_indentRightButton = v33;
}

- (void)_updateFontsButton:(id)a3
{
  id v6 = a3;
  objc_msgSend(MEMORY[0x1E4FB08E0], "mf_defaultComposeFontPixelSize");
  id v4 = objc_msgSend(v6, "fontWithSize:");
  id v5 = [(MFComposeStyleSelectorViewController *)self fontSelectorButton];
  [v5 setRepresentedFont:v4];
}

- (MFComposeStyleSelectorViewControllerDelegate)styleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleDelegate);

  return (MFComposeStyleSelectorViewControllerDelegate *)WeakRetained;
}

- (void)setStyleDelegate:(id)a3
{
}

- (void)setContainerStackView:(id)a3
{
}

- (MFComposeColorPickerController)colorPicker
{
  return self->_colorPicker;
}

- (void)setColorPicker:(id)a3
{
}

- (void)setFontTextAttributeStackView:(id)a3
{
}

- (void)setFontAttributeStackView:(id)a3
{
}

- (void)setTextAttributeStackView:(id)a3
{
}

- (void)setQuoteIndentListJustifyStackView:(id)a3
{
}

- (void)setListJustifyStackView:(id)a3
{
}

- (void)setListStackView:(id)a3
{
}

- (void)setIndentStackView:(id)a3
{
}

- (void)setQuoteIndentStackView:(id)a3
{
}

- (void)setJustifyStackView:(id)a3
{
}

- (void)setQuoteLevelStackView:(id)a3
{
}

- (void)setFontSelectorButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)decreaseFontSizeButton
{
  return self->_decreaseFontSizeButton;
}

- (void)setDecreaseFontSizeButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)increaseFontSizeButton
{
  return self->_increaseFontSizeButton;
}

- (void)setIncreaseFontSizeButton:(id)a3
{
}

- (void)setTextColorButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)italicsButton
{
  return self->_italicsButton;
}

- (void)setItalicsButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)underlineButton
{
  return self->_underlineButton;
}

- (void)setUnderlineButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)strikethroughButton
{
  return self->_strikethroughButton;
}

- (void)setStrikethroughButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)bulletListButton
{
  return self->_bulletListButton;
}

- (void)setBulletListButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)numberedListButton
{
  return self->_numberedListButton;
}

- (void)setNumberedListButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)justifyLeftButton
{
  return self->_justifyLeftButton;
}

- (void)setJustifyLeftButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)justifyCenterButton
{
  return self->_justifyCenterButton;
}

- (void)setJustifyCenterButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)justifyRightButton
{
  return self->_justifyRightButton;
}

- (void)setJustifyRightButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)increaseQuoteButton
{
  return self->_increaseQuoteButton;
}

- (void)setIncreaseQuoteButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)decreaseQuoteButton
{
  return self->_decreaseQuoteButton;
}

- (void)setDecreaseQuoteButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)indentLeftButton
{
  return self->_indentLeftButton;
}

- (void)setIndentLeftButton:(id)a3
{
}

- (MFComposeStyleSelectorButton)indentRightButton
{
  return self->_indentRightButton;
}

- (void)setIndentRightButton:(id)a3
{
}

- (int64_t)currentFontSize
{
  return self->_currentFontSize;
}

- (void)setCurrentFontSize:(int64_t)a3
{
  self->_currentFontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indentRightButton, 0);
  objc_storeStrong((id *)&self->_indentLeftButton, 0);
  objc_storeStrong((id *)&self->_decreaseQuoteButton, 0);
  objc_storeStrong((id *)&self->_increaseQuoteButton, 0);
  objc_storeStrong((id *)&self->_justifyRightButton, 0);
  objc_storeStrong((id *)&self->_justifyCenterButton, 0);
  objc_storeStrong((id *)&self->_justifyLeftButton, 0);
  objc_storeStrong((id *)&self->_numberedListButton, 0);
  objc_storeStrong((id *)&self->_bulletListButton, 0);
  objc_storeStrong((id *)&self->_strikethroughButton, 0);
  objc_storeStrong((id *)&self->_underlineButton, 0);
  objc_storeStrong((id *)&self->_italicsButton, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_textColorButton, 0);
  objc_storeStrong((id *)&self->_increaseFontSizeButton, 0);
  objc_storeStrong((id *)&self->_decreaseFontSizeButton, 0);
  objc_storeStrong((id *)&self->_fontSelectorButton, 0);
  objc_storeStrong((id *)&self->_quoteLevelStackView, 0);
  objc_storeStrong((id *)&self->_justifyStackView, 0);
  objc_storeStrong((id *)&self->_quoteIndentStackView, 0);
  objc_storeStrong((id *)&self->_indentStackView, 0);
  objc_storeStrong((id *)&self->_listStackView, 0);
  objc_storeStrong((id *)&self->_listJustifyStackView, 0);
  objc_storeStrong((id *)&self->_quoteIndentListJustifyStackView, 0);
  objc_storeStrong((id *)&self->_textAttributeStackView, 0);
  objc_storeStrong((id *)&self->_fontAttributeStackView, 0);
  objc_storeStrong((id *)&self->_fontTextAttributeStackView, 0);
  objc_storeStrong((id *)&self->_colorPicker, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);

  objc_destroyWeak((id *)&self->_styleDelegate);
}

@end