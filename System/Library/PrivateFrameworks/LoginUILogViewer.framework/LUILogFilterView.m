@interface LUILogFilterView
- (LUILogFilterView)initWithFrame:(CGRect)a3;
- (UIButton)addButton;
- (UIButton)applyButton;
- (UICollectionView)predicatesComparisonCandidateCollectionView;
- (UICollectionView)predicatesKeyCandidateCollectionView;
- (UICollectionView)predicatesValueCandidateCollectionView;
- (UILabel)currentPredicateLabel;
- (UIStackView)enterPredicateStackView;
- (UITableView)existingPredicatesTableView;
- (UITextField)predicateTextField;
- (UIView)horizontalSeparatorLine;
- (UIView)veriticalSeparatorLineFirst;
- (UIView)veriticalSeparatorLineSecond;
- (id)_createButtonWithTitle:(id)a3;
- (id)_createCollectionView;
- (id)_createCurrentPredicateLabel;
- (id)_createEnterLabel;
- (id)_createEnterPredicateStackViewWithSubViews:(id)a3;
- (id)_createPredicateTextField;
- (id)_createSeparatorLine;
- (id)_createTableView;
- (void)_setup;
- (void)layoutSubviews;
- (void)setAddButton:(id)a3;
- (void)setApplyButton:(id)a3;
- (void)setCurrentPredicateLabel:(id)a3;
- (void)setEnterPredicateStackView:(id)a3;
- (void)setExistingPredicatesTableView:(id)a3;
- (void)setHorizontalSeparatorLine:(id)a3;
- (void)setPredicateTextField:(id)a3;
- (void)setPredicatesComparisonCandidateCollectionView:(id)a3;
- (void)setPredicatesKeyCandidateCollectionView:(id)a3;
- (void)setPredicatesValueCandidateCollectionView:(id)a3;
- (void)setVeriticalSeparatorLineFirst:(id)a3;
- (void)setVeriticalSeparatorLineSecond:(id)a3;
@end

@implementation LUILogFilterView

- (LUILogFilterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LUILogFilterView;
  v3 = -[LUILogFilterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(LUILogFilterView *)v3 _setup];
  }
  return v4;
}

- (void)_setup
{
  v34[2] = *MEMORY[0x263EF8340];
  v3 = [(LUILogFilterView *)self _createTableView];
  existingPredicatesTableView = self->_existingPredicatesTableView;
  self->_existingPredicatesTableView = v3;

  v5 = [(LUILogFilterView *)self _createCollectionView];
  predicatesKeyCandidateCollectionView = self->_predicatesKeyCandidateCollectionView;
  self->_predicatesKeyCandidateCollectionView = v5;

  v7 = [(LUILogFilterView *)self _createCollectionView];
  predicatesComparisonCandidateCollectionView = self->_predicatesComparisonCandidateCollectionView;
  self->_predicatesComparisonCandidateCollectionView = v7;

  v9 = [(LUILogFilterView *)self _createCollectionView];
  predicatesValueCandidateCollectionView = self->_predicatesValueCandidateCollectionView;
  self->_predicatesValueCandidateCollectionView = v9;

  v11 = [(LUILogFilterView *)self _createSeparatorLine];
  horizontalSeparatorLine = self->_horizontalSeparatorLine;
  self->_horizontalSeparatorLine = v11;

  v13 = [(LUILogFilterView *)self _createSeparatorLine];
  veriticalSeparatorLineFirst = self->_veriticalSeparatorLineFirst;
  self->_veriticalSeparatorLineFirst = v13;

  v15 = [(LUILogFilterView *)self _createSeparatorLine];
  veriticalSeparatorLineSecond = self->_veriticalSeparatorLineSecond;
  self->_veriticalSeparatorLineSecond = v15;

  v17 = [(LUILogFilterView *)self _createButtonWithTitle:@"Add"];
  addButton = self->_addButton;
  self->_addButton = v17;

  v19 = [(LUILogFilterView *)self _createPredicateTextField];
  predicateTextField = self->_predicateTextField;
  self->_predicateTextField = v19;

  v21 = self->_addButton;
  v34[0] = self->_predicateTextField;
  v34[1] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  v23 = [(LUILogFilterView *)self _createEnterPredicateStackViewWithSubViews:v22];
  enterPredicateStackView = self->_enterPredicateStackView;
  self->_enterPredicateStackView = v23;

  v25 = [(LUILogFilterView *)self _createCurrentPredicateLabel];
  currentPredicateLabel = self->_currentPredicateLabel;
  self->_currentPredicateLabel = v25;

  v27 = [(LUILogFilterView *)self _createButtonWithTitle:@"Apply"];
  applyButton = self->_applyButton;
  self->_applyButton = v27;

  id v29 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v30 = [v29 CGColor];
  v31 = [(UIButton *)self->_applyButton layer];
  [v31 setBorderColor:v30];

  v32 = [(UIButton *)self->_applyButton layer];
  [v32 setBorderWidth:1.5];

  v33 = [(UIButton *)self->_applyButton layer];
  [v33 setCornerRadius:5.0];

  [(LUILogFilterView *)self addSubview:self->_existingPredicatesTableView];
  [(LUILogFilterView *)self addSubview:self->_predicatesKeyCandidateCollectionView];
  [(LUILogFilterView *)self addSubview:self->_predicatesComparisonCandidateCollectionView];
  [(LUILogFilterView *)self addSubview:self->_predicatesValueCandidateCollectionView];
  [(LUILogFilterView *)self addSubview:self->_horizontalSeparatorLine];
  [(LUILogFilterView *)self addSubview:self->_veriticalSeparatorLineFirst];
  [(LUILogFilterView *)self addSubview:self->_veriticalSeparatorLineSecond];
  [(LUILogFilterView *)self addSubview:self->_enterPredicateStackView];
  [(LUILogFilterView *)self addSubview:self->_currentPredicateLabel];
  [(LUILogFilterView *)self addSubview:self->_applyButton];
}

- (void)layoutSubviews
{
  [(LUILogFilterView *)self frame];
  CGFloat v3 = CGRectGetWidth(v39) + -20.0;
  v4 = [(LUILogFilterView *)self currentPredicateLabel];
  objc_msgSend(v4, "setFrame:", 10.0, 0.0, v3, 30.0);

  [(LUILogFilterView *)self frame];
  CGFloat v5 = CGRectGetWidth(v40) + -30.0 + -100.0;
  [(LUILogFilterView *)self frame];
  CGFloat v6 = CGRectGetHeight(v41) + -30.0 + -300.0 + -10.0;
  v7 = [(LUILogFilterView *)self existingPredicatesTableView];
  objc_msgSend(v7, "setFrame:", 10.0, 30.0, v5, v6);

  v8 = [(LUILogFilterView *)self existingPredicatesTableView];
  [v8 frame];
  CGFloat v9 = CGRectGetMaxX(v42) + 10.0;
  [(LUILogFilterView *)self frame];
  CGFloat v10 = CGRectGetHeight(v43) + -30.0 + -300.0 + -10.0;
  v11 = [(LUILogFilterView *)self applyButton];
  objc_msgSend(v11, "setFrame:", v9, 30.0, 100.0, v10);

  v12 = [(LUILogFilterView *)self existingPredicatesTableView];
  [v12 frame];
  CGFloat v13 = CGRectGetMaxY(v44) + 10.0;
  [(LUILogFilterView *)self frame];
  CGFloat v14 = CGRectGetWidth(v45) + -20.0;
  v15 = [(LUILogFilterView *)self horizontalSeparatorLine];
  objc_msgSend(v15, "setFrame:", 10.0, v13, v14, 1.5);

  v16 = [(LUILogFilterView *)self horizontalSeparatorLine];
  [v16 frame];
  CGFloat v17 = CGRectGetMaxY(v46) + 10.0;
  [(LUILogFilterView *)self frame];
  CGFloat v18 = CGRectGetWidth(v47) + -20.0;
  v19 = [(LUILogFilterView *)self enterPredicateStackView];
  objc_msgSend(v19, "setFrame:", 10.0, v17, v18, 30.0);

  [(LUILogFilterView *)self frame];
  CGFloat v20 = (CGRectGetWidth(v48) * 0.5 + -40.0) * 0.5;
  v21 = [(LUILogFilterView *)self enterPredicateStackView];
  [v21 frame];
  CGFloat v22 = CGRectGetMaxY(v49) + 10.0;

  [(LUILogFilterView *)self frame];
  CGFloat v23 = CGRectGetHeight(v50) - v22 + -10.0;
  v24 = [(LUILogFilterView *)self predicatesKeyCandidateCollectionView];
  objc_msgSend(v24, "setFrame:", 10.0, v22, v20, v23);

  v25 = [(LUILogFilterView *)self predicatesKeyCandidateCollectionView];
  [v25 frame];
  CGFloat v26 = CGRectGetMaxX(v51) + 10.0;
  v27 = [(LUILogFilterView *)self veriticalSeparatorLineFirst];
  objc_msgSend(v27, "setFrame:", v26, v22, 1.5, v23);

  v28 = [(LUILogFilterView *)self predicatesKeyCandidateCollectionView];
  [v28 frame];
  CGFloat v29 = CGRectGetMaxX(v52) + 20.0;

  uint64_t v30 = [(LUILogFilterView *)self predicatesComparisonCandidateCollectionView];
  objc_msgSend(v30, "setFrame:", v29, v22, v20, v23);

  v31 = [(LUILogFilterView *)self predicatesComparisonCandidateCollectionView];
  [v31 frame];
  CGFloat v32 = CGRectGetMaxX(v53) + 10.0;
  v33 = [(LUILogFilterView *)self veriticalSeparatorLineSecond];
  objc_msgSend(v33, "setFrame:", v32, v22, 1.5, v23);

  v34 = [(LUILogFilterView *)self predicatesComparisonCandidateCollectionView];
  [v34 frame];
  CGFloat v35 = CGRectGetMaxX(v54) + 20.0;

  [(LUILogFilterView *)self frame];
  CGFloat v36 = CGRectGetWidth(v55) - v35 + -10.0;
  id v37 = [(LUILogFilterView *)self predicatesValueCandidateCollectionView];
  objc_msgSend(v37, "setFrame:", v35, v22, v36, v23);
}

- (id)_createEnterPredicateStackViewWithSubViews:(id)a3
{
  CGFloat v3 = (objc_class *)MEMORY[0x263F1C9B8];
  id v4 = a3;
  CGFloat v5 = (void *)[[v3 alloc] initWithArrangedSubviews:v4];

  [v5 setAxis:0];
  [v5 setDistribution:0];
  [v5 setSpacing:10.0];

  return v5;
}

- (id)_createCurrentPredicateLabel
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", 0.0, 0.0, 0.0, 30.0);
  CGFloat v3 = [MEMORY[0x263F1C658] boldSystemFontOfSize:17.0];
  [v2 setFont:v3];

  [v2 setText:@"Current Predicate: "];
  id v4 = [MEMORY[0x263F1C550] whiteColor];
  [v2 setTextColor:v4];

  [v2 sizeToFit];

  return v2;
}

- (id)_createEnterLabel
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", 0.0, 0.0, 0.0, 30.0);
  CGFloat v3 = [MEMORY[0x263F1C658] boldSystemFontOfSize:17.0];
  [v2 setFont:v3];

  [v2 setText:@"   Enter Predicate: "];
  id v4 = [MEMORY[0x263F1C550] whiteColor];
  [v2 setTextColor:v4];

  [v2 sizeToFit];
  LODWORD(v5) = 1148846080;
  [v2 setContentHuggingPriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v2 setContentCompressionResistancePriority:0 forAxis:v6];

  return v2;
}

- (id)_createPredicateTextField
{
  CGFloat v3 = objc_msgSend(objc_alloc(MEMORY[0x263F1CA98]), "initWithFrame:", 0.0, 0.0, 1000.0, 30.0);
  id v4 = [v3 layer];
  [v4 setCornerRadius:15.0];

  id v5 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v6 = [v5 CGColor];
  v7 = [v3 layer];
  [v7 setBorderColor:v6];

  v8 = [v3 layer];
  [v8 setBorderWidth:1.5];

  LODWORD(v9) = 1132068864;
  [v3 setContentHuggingPriority:0 forAxis:v9];
  LODWORD(v10) = 1132068864;
  [v3 setContentCompressionResistancePriority:0 forAxis:v10];
  [v3 setClearButtonMode:3];
  v11 = [MEMORY[0x263F1C550] whiteColor];
  [v3 setTextColor:v11];

  v12 = [MEMORY[0x263F1C550] whiteColor];
  CGFloat v13 = [v3 _clearButton];
  [v13 setTintColor:v12];

  [v3 _setForcesClearButtonHighContrastAppearance:1];
  [v3 setAutocorrectionType:1];
  [v3 setAutocapitalizationType:0];
  [v3 setSmartQuotesType:1];
  [v3 setSpellCheckingType:1];
  [v3 setPlaceholder:@"e.g: process == 'LoginUI'"];
  CGFloat v14 = [MEMORY[0x263F1C550] lightGrayColor];
  v15 = [v3 _placeholderLabel];
  [v15 setTextColor:v14];

  v16 = [(LUILogFilterView *)self _createEnterLabel];
  [v3 setLeftView:v16];
  [v3 setLeftViewMode:3];

  return v3;
}

- (id)_createButtonWithTitle:(id)a3
{
  CGFloat v3 = (objc_class *)MEMORY[0x263F1C488];
  id v4 = a3;
  id v5 = objc_msgSend([v3 alloc], "initWithFrame:", 0.0, 0.0, 80.0, 30.0);
  [v5 setTitle:v4 forState:0];

  uint64_t v6 = [MEMORY[0x263F1C550] whiteColor];
  [v5 setTitleColor:v6 forState:0];

  LODWORD(v7) = 1148846080;
  [v5 setContentHuggingPriority:0 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [v5 setContentCompressionResistancePriority:0 forAxis:v8];

  return v5;
}

- (id)_createCollectionView
{
  id v2 = objc_alloc_init(MEMORY[0x263F1C508]);
  id v3 = objc_alloc(MEMORY[0x263F1C4E0]);
  id v4 = objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v5 = [MEMORY[0x263F1C550] clearColor];
  [v4 setBackgroundColor:v5];

  return v4;
}

- (id)_createTableView
{
  id v2 = objc_alloc(MEMORY[0x263F1CA40]);
  id v3 = objc_msgSend(v2, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v4 = [MEMORY[0x263F1C550] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setAllowsSelection:0];

  return v3;
}

- (id)_createSeparatorLine
{
  id v2 = objc_opt_new();
  id v3 = [MEMORY[0x263F1C550] whiteColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (UITableView)existingPredicatesTableView
{
  return self->_existingPredicatesTableView;
}

- (void)setExistingPredicatesTableView:(id)a3
{
}

- (UICollectionView)predicatesKeyCandidateCollectionView
{
  return self->_predicatesKeyCandidateCollectionView;
}

- (void)setPredicatesKeyCandidateCollectionView:(id)a3
{
}

- (UICollectionView)predicatesComparisonCandidateCollectionView
{
  return self->_predicatesComparisonCandidateCollectionView;
}

- (void)setPredicatesComparisonCandidateCollectionView:(id)a3
{
}

- (UICollectionView)predicatesValueCandidateCollectionView
{
  return self->_predicatesValueCandidateCollectionView;
}

- (void)setPredicatesValueCandidateCollectionView:(id)a3
{
}

- (UIView)horizontalSeparatorLine
{
  return self->_horizontalSeparatorLine;
}

- (void)setHorizontalSeparatorLine:(id)a3
{
}

- (UIView)veriticalSeparatorLineFirst
{
  return self->_veriticalSeparatorLineFirst;
}

- (void)setVeriticalSeparatorLineFirst:(id)a3
{
}

- (UIView)veriticalSeparatorLineSecond
{
  return self->_veriticalSeparatorLineSecond;
}

- (void)setVeriticalSeparatorLineSecond:(id)a3
{
}

- (UILabel)currentPredicateLabel
{
  return self->_currentPredicateLabel;
}

- (void)setCurrentPredicateLabel:(id)a3
{
}

- (UIStackView)enterPredicateStackView
{
  return self->_enterPredicateStackView;
}

- (void)setEnterPredicateStackView:(id)a3
{
}

- (UIButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
}

- (UITextField)predicateTextField
{
  return self->_predicateTextField;
}

- (void)setPredicateTextField:(id)a3
{
}

- (UIButton)applyButton
{
  return self->_applyButton;
}

- (void)setApplyButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyButton, 0);
  objc_storeStrong((id *)&self->_predicateTextField, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_enterPredicateStackView, 0);
  objc_storeStrong((id *)&self->_currentPredicateLabel, 0);
  objc_storeStrong((id *)&self->_veriticalSeparatorLineSecond, 0);
  objc_storeStrong((id *)&self->_veriticalSeparatorLineFirst, 0);
  objc_storeStrong((id *)&self->_horizontalSeparatorLine, 0);
  objc_storeStrong((id *)&self->_predicatesValueCandidateCollectionView, 0);
  objc_storeStrong((id *)&self->_predicatesComparisonCandidateCollectionView, 0);
  objc_storeStrong((id *)&self->_predicatesKeyCandidateCollectionView, 0);

  objc_storeStrong((id *)&self->_existingPredicatesTableView, 0);
}

@end