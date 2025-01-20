@interface EKUIFocusBannerView
- (BOOL)disallowAccessibilityTextSizes;
- (BOOL)on;
- (BOOL)scalesLargeContentImage;
- (BOOL)showDividers;
- (BOOL)showsLargeContentViewer;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKUIFocusBannerView)initWithFrame:(CGRect)a3;
- (EKUIFocusBannerViewDelegate)delegate;
- (NSLayoutConstraint)topKeylineHeightConstraint;
- (UIButton)focusFilterToggleButton;
- (UILabel)focusFilterStateDescriptionLabel;
- (UIView)topKeylineView;
- (id)_focusFilterButtonConfiguration;
- (id)_horizontalLayoutConstraints;
- (id)_verticalLayoutConstraints;
- (id)largeContentImage;
- (id)largeContentTitle;
- (unint64_t)_effectiveLayout;
- (unint64_t)layout;
- (void)_tapped;
- (void)_updateKeylineHeightConstraints;
- (void)_updateView;
- (void)largeContentViewerInteraction:(id)a3 didEndOnItem:(id)a4 atPoint:(CGPoint)a5;
- (void)setDelegate:(id)a3;
- (void)setDisallowAccessibilityTextSizes:(BOOL)a3;
- (void)setFocusFilterStateDescriptionLabel:(id)a3;
- (void)setFocusFilterToggleButton:(id)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setOn:(BOOL)a3;
- (void)setShowDividers:(BOOL)a3;
- (void)setTopKeylineHeightConstraint:(id)a3;
- (void)setTopKeylineView:(id)a3;
- (void)updateConstraints;
@end

@implementation EKUIFocusBannerView

- (EKUIFocusBannerView)initWithFrame:(CGRect)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)EKUIFocusBannerView;
  v3 = -[EKUIFocusBannerView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1938]) initWithDelegate:v3];
    [(EKUIFocusBannerView *)v3 addInteraction:v4];

    v5 = [MEMORY[0x1E4FB1618] systemIndigoColor];
    [(EKUIFocusBannerView *)v3 setTintColor:v5];

    [(EKUIFocusBannerView *)v3 setPreservesSuperviewLayoutMargins:1];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    focusFilterStateDescriptionLabel = v3->_focusFilterStateDescriptionLabel;
    v3->_focusFilterStateDescriptionLabel = v6;

    [(UILabel *)v3->_focusFilterStateDescriptionLabel setTextAlignment:4];
    [(EKUIFocusBannerView *)v3 addSubview:v3->_focusFilterStateDescriptionLabel];
    uint64_t v8 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    focusFilterToggleButton = v3->_focusFilterToggleButton;
    v3->_focusFilterToggleButton = (UIButton *)v8;

    v10 = [(EKUIFocusBannerView *)v3 _focusFilterButtonConfiguration];
    [(UIButton *)v3->_focusFilterToggleButton setConfiguration:v10];

    objc_initWeak(&location, v3);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __37__EKUIFocusBannerView_initWithFrame___block_invoke;
    v33[3] = &unk_1E6089838;
    objc_copyWeak(&v34, &location);
    [(UIButton *)v3->_focusFilterToggleButton setConfigurationUpdateHandler:v33];
    [(UIButton *)v3->_focusFilterToggleButton addTarget:v3 action:sel__tapped forControlEvents:0x2000];
    [(EKUIFocusBannerView *)v3 addSubview:v3->_focusFilterToggleButton];
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    topKeylineView = v3->_topKeylineView;
    v3->_topKeylineView = v11;

    [(UIView *)v3->_topKeylineView setHidden:1];
    v13 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v3->_topKeylineView setBackgroundColor:v13];

    [(EKUIFocusBannerView *)v3 addSubview:v3->_topKeylineView];
    [(EKUIFocusBannerView *)v3 _updateView];
    [(UILabel *)v3->_focusFilterStateDescriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v3->_focusFilterToggleButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_topKeylineView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v14) = 1148846080;
    [(UILabel *)v3->_focusFilterStateDescriptionLabel setContentHuggingPriority:0 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [(UILabel *)v3->_focusFilterStateDescriptionLabel setContentHuggingPriority:1 forAxis:v15];
    LODWORD(v16) = 1144750080;
    [(UILabel *)v3->_focusFilterStateDescriptionLabel setContentCompressionResistancePriority:0 forAxis:v16];
    LODWORD(v17) = 1148846080;
    [(UILabel *)v3->_focusFilterStateDescriptionLabel setContentCompressionResistancePriority:1 forAxis:v17];
    LODWORD(v18) = 1148846080;
    [(UIButton *)v3->_focusFilterToggleButton setContentCompressionResistancePriority:0 forAxis:v18];
    LODWORD(v19) = 1148846080;
    [(UIButton *)v3->_focusFilterToggleButton setContentCompressionResistancePriority:1 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(UIButton *)v3->_focusFilterToggleButton setContentHuggingPriority:0 forAxis:v20];
    LODWORD(v21) = 1148846080;
    [(UIButton *)v3->_focusFilterToggleButton setContentHuggingPriority:1 forAxis:v21];
    v22 = [(UIView *)v3->_topKeylineView heightAnchor];
    uint64_t v23 = [v22 constraintEqualToConstant:1.0];
    topKeylineHeightConstraint = v3->_topKeylineHeightConstraint;
    v3->_topKeylineHeightConstraint = (NSLayoutConstraint *)v23;

    v25 = (void *)MEMORY[0x1E4F28DC8];
    v38[0] = v3->_topKeylineHeightConstraint;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    [v25 activateConstraints:v26];

    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v3 selector:sel_contentSizeCategoryDidChange name:*MEMORY[0x1E4FB27A8] object:0];

    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __37__EKUIFocusBannerView_initWithFrame___block_invoke_2;
    v31[3] = &unk_1E60874F8;
    objc_copyWeak(&v32, &location);
    id v29 = (id)[(EKUIFocusBannerView *)v3 registerForTraitChanges:v28 withHandler:v31];
    objc_destroyWeak(&v32);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __37__EKUIFocusBannerView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained _focusFilterButtonConfiguration];
    [v6 setConfiguration:v5];
  }
}

void __37__EKUIFocusBannerView_initWithFrame___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateIntrinsicContentSize];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIFocusBannerView;
  [(EKUIFocusBannerView *)&v5 updateConstraints];
  if ([(EKUIFocusBannerView *)self _effectiveLayout] == 2) {
    [(EKUIFocusBannerView *)self _verticalLayoutConstraints];
  }
  else {
  id v3 = [(EKUIFocusBannerView *)self _horizontalLayoutConstraints];
  }
  activeConstraints = self->_activeConstraints;
  if (activeConstraints != v3)
  {
    if (activeConstraints) {
      objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    }
    [MEMORY[0x1E4F28DC8] activateConstraints:v3];
    objc_storeStrong((id *)&self->_activeConstraints, v3);
  }
  [(EKUIFocusBannerView *)self _updateKeylineHeightConstraints];
}

- (id)_horizontalLayoutConstraints
{
  v39[10] = *MEMORY[0x1E4F143B8];
  horizontalLayoutConstraints = self->_horizontalLayoutConstraints;
  if (!horizontalLayoutConstraints)
  {
    v37 = [(UILabel *)self->_focusFilterStateDescriptionLabel leadingAnchor];
    v38 = [(EKUIFocusBannerView *)self layoutMarginsGuide];
    objc_super v36 = [v38 leadingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v39[0] = v35;
    id v34 = [(UILabel *)self->_focusFilterStateDescriptionLabel trailingAnchor];
    v33 = [(UIButton *)self->_focusFilterToggleButton leadingAnchor];
    id v32 = [v34 constraintLessThanOrEqualToAnchor:v33 constant:-36.0];
    v39[1] = v32;
    v31 = [(UILabel *)self->_focusFilterStateDescriptionLabel centerYAnchor];
    v30 = [(EKUIFocusBannerView *)self centerYAnchor];
    id v29 = [v31 constraintEqualToAnchor:v30];
    v39[2] = v29;
    v28 = [(UILabel *)self->_focusFilterStateDescriptionLabel heightAnchor];
    v27 = [(EKUIFocusBannerView *)self heightAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v39[3] = v26;
    v24 = [(UIButton *)self->_focusFilterToggleButton trailingAnchor];
    v25 = [(EKUIFocusBannerView *)self layoutMarginsGuide];
    uint64_t v23 = [v25 trailingAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v39[4] = v22;
    double v21 = [(UIButton *)self->_focusFilterToggleButton topAnchor];
    double v20 = [(EKUIFocusBannerView *)self topAnchor];
    double v19 = [v21 constraintEqualToAnchor:v20 constant:11.0];
    v39[5] = v19;
    double v18 = [(EKUIFocusBannerView *)self bottomAnchor];
    double v17 = [(UIButton *)self->_focusFilterToggleButton bottomAnchor];
    double v16 = [v18 constraintEqualToAnchor:v17 constant:11.0];
    v39[6] = v16;
    v4 = [(UIView *)self->_topKeylineView leadingAnchor];
    objc_super v5 = [(EKUIFocusBannerView *)self leadingAnchor];
    id v6 = [v4 constraintEqualToAnchor:v5];
    v39[7] = v6;
    v7 = [(EKUIFocusBannerView *)self trailingAnchor];
    uint64_t v8 = [(UIView *)self->_topKeylineView trailingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v39[8] = v9;
    v10 = [(UIView *)self->_topKeylineView topAnchor];
    v11 = [(EKUIFocusBannerView *)self topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v39[9] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:10];
    double v14 = self->_horizontalLayoutConstraints;
    self->_horizontalLayoutConstraints = v13;

    horizontalLayoutConstraints = self->_horizontalLayoutConstraints;
  }

  return horizontalLayoutConstraints;
}

- (id)_verticalLayoutConstraints
{
  v37[9] = *MEMORY[0x1E4F143B8];
  verticalLayoutConstraints = self->_verticalLayoutConstraints;
  if (!verticalLayoutConstraints)
  {
    v35 = [(UILabel *)self->_focusFilterStateDescriptionLabel leadingAnchor];
    objc_super v36 = [(EKUIFocusBannerView *)self layoutMarginsGuide];
    id v34 = [v36 leadingAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v37[0] = v33;
    v31 = [(UILabel *)self->_focusFilterStateDescriptionLabel trailingAnchor];
    id v32 = [(EKUIFocusBannerView *)self layoutMarginsGuide];
    v30 = [v32 trailingAnchor];
    id v29 = [v31 constraintEqualToAnchor:v30];
    v37[1] = v29;
    v28 = [(UILabel *)self->_focusFilterStateDescriptionLabel topAnchor];
    v27 = [(EKUIFocusBannerView *)self topAnchor];
    v26 = [v28 constraintEqualToAnchor:v27 constant:11.0];
    void v37[2] = v26;
    v24 = [(UIButton *)self->_focusFilterToggleButton leadingAnchor];
    v25 = [(EKUIFocusBannerView *)self layoutMarginsGuide];
    uint64_t v23 = [v25 leadingAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v37[3] = v22;
    double v21 = [(UIButton *)self->_focusFilterToggleButton topAnchor];
    double v20 = [(UILabel *)self->_focusFilterStateDescriptionLabel bottomAnchor];
    double v19 = [v21 constraintEqualToAnchor:v20 constant:8.0];
    v37[4] = v19;
    double v18 = [(EKUIFocusBannerView *)self bottomAnchor];
    double v17 = [(UIButton *)self->_focusFilterToggleButton bottomAnchor];
    double v16 = [v18 constraintEqualToAnchor:v17 constant:11.0];
    v37[5] = v16;
    v4 = [(UIView *)self->_topKeylineView leadingAnchor];
    objc_super v5 = [(EKUIFocusBannerView *)self leadingAnchor];
    id v6 = [v4 constraintEqualToAnchor:v5];
    v37[6] = v6;
    v7 = [(EKUIFocusBannerView *)self trailingAnchor];
    uint64_t v8 = [(UIView *)self->_topKeylineView trailingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v37[7] = v9;
    v10 = [(UIView *)self->_topKeylineView topAnchor];
    v11 = [(EKUIFocusBannerView *)self topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v37[8] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:9];
    double v14 = self->_verticalLayoutConstraints;
    self->_verticalLayoutConstraints = v13;

    verticalLayoutConstraints = self->_verticalLayoutConstraints;
  }

  return verticalLayoutConstraints;
}

- (unint64_t)_effectiveLayout
{
  unint64_t result = [(EKUIFocusBannerView *)self layout];
  if (!result)
  {
    v4 = [(EKUIFocusBannerView *)self traitCollection];
    objc_super v5 = [v4 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    if (IsAccessibilityCategory) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  unint64_t v5 = [(EKUIFocusBannerView *)self _effectiveLayout];
  [(EKUIFocusBannerView *)self directionalLayoutMargins];
  double v8 = v6;
  double v9 = v7;
  if (width - v6 - v7 >= 0.0) {
    double v10 = width - v6 - v7;
  }
  else {
    double v10 = 0.0;
  }
  focusFilterToggleButton = self->_focusFilterToggleButton;
  if (v5 == 1)
  {
    double v12 = *(double *)(MEMORY[0x1E4FB2C70] + 8);
    -[UIButton sizeThatFits:](focusFilterToggleButton, "sizeThatFits:", v10, v12);
    double v14 = v13;
    double v16 = v15;
    -[UILabel sizeThatFits:](self->_focusFilterStateDescriptionLabel, "sizeThatFits:", v10 - (v13 + 36.0), v12);
    double v19 = v14 + v8 + v18 + 36.0;
    if (v16 >= v17) {
      double v17 = v16;
    }
    double v20 = v17 + 11.0;
  }
  else
  {
    double v21 = *(double *)(MEMORY[0x1E4FB2C70] + 8);
    -[UIButton sizeThatFits:](focusFilterToggleButton, "sizeThatFits:", *MEMORY[0x1E4FB2C70], v21);
    double v23 = v22;
    double v25 = v24;
    -[UILabel sizeThatFits:](self->_focusFilterStateDescriptionLabel, "sizeThatFits:", v10, v21);
    if (v23 >= v26) {
      double v26 = v23;
    }
    double v19 = v8 + v26;
    double v20 = v25 + v27 + 11.0 + 8.0;
  }
  double v28 = v9 + v19;
  double v29 = v20 + 11.0;
  result.height = v29;
  result.double width = v28;
  return result;
}

- (void)_tapped
{
  [(EKUIFocusBannerView *)self setOn:[(EKUIFocusBannerView *)self on] ^ 1];
  id v3 = [(EKUIFocusBannerView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(EKUIFocusBannerView *)self delegate];
    [v5 focusBannerViewToggled:self];
  }
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(EKUIFocusBannerView *)self _updateView];
  }
}

- (void)setShowDividers:(BOOL)a3
{
  if (self->_showDividers != a3)
  {
    self->_showDividers = a3;
    [(UIView *)self->_topKeylineView setHidden:!a3];
  }
}

- (void)setLayout:(unint64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    [(EKUIFocusBannerView *)self _updateView];
  }
}

- (void)setDisallowAccessibilityTextSizes:(BOOL)a3
{
  if (self->_disallowAccessibilityTextSizes != a3)
  {
    self->_disallowAccessibilityTextSizes = a3;
    [(EKUIFocusBannerView *)self _updateView];
  }
}

- (void)_updateView
{
  v30[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKUIFocusBannerView *)self on];
  char v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v28 = v4;
  if (v3)
  {
    uint64_t v5 = [v4 localizedStringForKey:@"Filtered by Focus" value:&stru_1F0CC2140 table:0];
    [MEMORY[0x1E4FB1618] systemIndigoColor];
  }
  else
  {
    uint64_t v5 = [v4 localizedStringForKey:@"Focus Filter Off" value:&stru_1F0CC2140 table:0];
    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  double v6 = };
  double v7 = (void *)MEMORY[0x1E4FB0870];
  double v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"moon.circle.fill"];
  double v27 = [v7 textAttachmentWithImage:v8];

  uint64_t v9 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v27];
  double v26 = (void *)v9;
  BOOL v10 = [(EKUIFocusBannerView *)self disallowAccessibilityTextSizes];
  v11 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0x8000 options:v10];
  double v12 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];
  uint64_t v13 = *MEMORY[0x1E4FB0700];
  v29[0] = *MEMORY[0x1E4FB06F8];
  v29[1] = v13;
  v30[0] = v12;
  v30[1] = v6;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (CalInterfaceIsLeftToRight()) {
    double v16 = @"%1$@ %2$@";
  }
  else {
    double v16 = @"%2$@ %1$@";
  }
  double v17 = (void *)[v15 initWithString:v16];
  double v18 = objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:", v17, v9, v5);
  double v19 = (void *)[v18 mutableCopy];

  objc_msgSend(v19, "addAttributes:range:", v14, 0, objc_msgSend(v19, "length"));
  double v20 = [(EKUIFocusBannerView *)self focusFilterStateDescriptionLabel];
  [v20 setAttributedText:v19];

  BOOL v21 = [(EKUIFocusBannerView *)self layout] == 1;
  [(EKUIFocusBannerView *)self focusFilterStateDescriptionLabel];
  double v23 = v22 = (void *)v5;
  [v23 setNumberOfLines:v21];

  double v24 = [(EKUIFocusBannerView *)self focusFilterToggleButton];
  [v24 setNeedsUpdateConfiguration];

  double v25 = [(EKUIFocusBannerView *)self focusFilterToggleButton];
  [v25 updateConfiguration];
}

- (id)_focusFilterButtonConfiguration
{
  v27[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKUIFocusBannerView *)self on];
  char v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = v4;
  if (v3) {
    double v6 = @"Turn Off";
  }
  else {
    double v6 = @"Turn On";
  }
  double v7 = [v4 localizedStringForKey:v6 value:&stru_1F0CC2140 table:0];

  BOOL v8 = [(EKUIFocusBannerView *)self disallowAccessibilityTextSizes];
  uint64_t v9 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:32770 options:v8];
  BOOL v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v9 size:0.0];
  v11 = [MEMORY[0x1E4FB1618] systemIndigoColor];
  uint64_t v26 = *MEMORY[0x1E4FB0700];
  v27[0] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v12];
  double v14 = [(EKUIFocusBannerView *)self traitCollection];
  id v15 = [v14 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  if (IsAccessibilityCategory && [(EKUIFocusBannerView *)self _effectiveLayout] == 2)
  {
    double v17 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
    int v18 = 1;
  }
  else
  {
    double v17 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    int v18 = 0;
  }
  [v17 setAttributedTitle:v13];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  double v23 = __54__EKUIFocusBannerView__focusFilterButtonConfiguration__block_invoke;
  double v24 = &unk_1E608AA98;
  id v25 = v10;
  id v19 = v10;
  [v17 setTitleTextAttributesTransformer:&v21];
  objc_msgSend(v17, "setTitleAlignment:", 1, v21, v22, v23, v24);
  [v17 setTitleLineBreakMode:2];
  if (v18)
  {
    [v17 setButtonSize:0];
    [v17 setCornerStyle:4];
  }
  else
  {
    objc_msgSend(v17, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  }

  return v17;
}

id __54__EKUIFocusBannerView__focusFilterButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  char v4 = (void *)[v3 copy];

  return v4;
}

- (void)_updateKeylineHeightConstraints
{
  BOOL v3 = [(EKUIFocusBannerView *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  topKeylineHeightConstraint = self->_topKeylineHeightConstraint;

  [(NSLayoutConstraint *)topKeylineHeightConstraint setConstant:1.0 / v5];
}

- (BOOL)showsLargeContentViewer
{
  return self->_disallowAccessibilityTextSizes;
}

- (id)largeContentTitle
{
  BOOL v3 = NSString;
  double v4 = [(EKUIFocusBannerView *)self focusFilterStateDescriptionLabel];
  double v5 = [v4 attributedText];
  double v6 = [v5 string];
  double v7 = [(EKUIFocusBannerView *)self focusFilterToggleButton];
  BOOL v8 = [v7 titleLabel];
  uint64_t v9 = [v8 attributedText];
  BOOL v10 = [v9 string];
  v11 = [v3 stringWithFormat:@"%@\n%@", v6, v10];

  return v11;
}

- (id)largeContentImage
{
  return (id)[MEMORY[0x1E4FB1818] systemImageNamed:@"moon.circle.fill"];
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (void)largeContentViewerInteraction:(id)a3 didEndOnItem:(id)a4 atPoint:(CGPoint)a5
{
  if (a4 == self) {
    objc_msgSend(a4, "_tapped", a3, a5.x, a5.y);
  }
}

- (BOOL)on
{
  return self->_on;
}

- (BOOL)showDividers
{
  return self->_showDividers;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (BOOL)disallowAccessibilityTextSizes
{
  return self->_disallowAccessibilityTextSizes;
}

- (EKUIFocusBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKUIFocusBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)focusFilterStateDescriptionLabel
{
  return self->_focusFilterStateDescriptionLabel;
}

- (void)setFocusFilterStateDescriptionLabel:(id)a3
{
}

- (UIButton)focusFilterToggleButton
{
  return self->_focusFilterToggleButton;
}

- (void)setFocusFilterToggleButton:(id)a3
{
}

- (UIView)topKeylineView
{
  return self->_topKeylineView;
}

- (void)setTopKeylineView:(id)a3
{
}

- (NSLayoutConstraint)topKeylineHeightConstraint
{
  return self->_topKeylineHeightConstraint;
}

- (void)setTopKeylineHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topKeylineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_topKeylineView, 0);
  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);
  objc_storeStrong((id *)&self->_focusFilterStateDescriptionLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_verticalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_horizontalLayoutConstraints, 0);

  objc_storeStrong((id *)&self->_activeConstraints, 0);
}

@end