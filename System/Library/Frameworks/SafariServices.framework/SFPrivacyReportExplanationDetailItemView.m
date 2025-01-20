@interface SFPrivacyReportExplanationDetailItemView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)usesInsetStyle;
- (SFPrivacyReportExplanationDetailItemView)initWithFrame:(CGRect)a3;
- (SFPrivacyReportGridItemDelegate)delegate;
- (UIColor)cellBackgroundColor;
- (UILabel)titleLabel;
- (UITextView)bodyTextView;
- (double)cellBackgroundCornerRadius;
- (double)hairlineTopSpacing;
- (double)titleLabelTopSpacing;
- (id)action;
- (unint64_t)gridPosition;
- (void)_preferredContentSizeCategoryDidChange;
- (void)_updateTopConstraints;
- (void)_updateTopSpacing;
- (void)setAction:(id)a3;
- (void)setCellBackgroundColor:(id)a3;
- (void)setCellBackgroundCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setGridPosition:(unint64_t)a3;
- (void)setHairlineTopSpacing:(double)a3;
- (void)setTitleLabelTopSpacing:(double)a3;
- (void)setUsesInsetStyle:(BOOL)a3;
@end

@implementation SFPrivacyReportExplanationDetailItemView

- (SFPrivacyReportExplanationDetailItemView)initWithFrame:(CGRect)a3
{
  v71[1] = *MEMORY[0x1E4F143B8];
  v67.receiver = self;
  v67.super_class = (Class)SFPrivacyReportExplanationDetailItemView;
  v3 = -[SFPrivacyReportExplanationDetailItemView initWithFrame:](&v67, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFPrivacyReportExplanationDetailItemView *)v3 setPreservesSuperviewLayoutMargins:1];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    hairline = v4->_hairline;
    v4->_hairline = v5;

    [(UIView *)v4->_hairline setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIView *)v4->_hairline setBackgroundColor:v7];

    [(SFPrivacyReportExplanationDetailItemView *)v4 addSubview:v4->_hairline];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v8;

    uint64_t v10 = *MEMORY[0x1E4FB2950];
    v11 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)v4->_titleLabel setFont:v11];

    v12 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v12];

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(SFPrivacyReportExplanationDetailItemView *)v4 addSubview:v4->_titleLabel];
    v13 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    bodyTextView = v4->_bodyTextView;
    v4->_bodyTextView = v13;

    v15 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v10];
    [(UITextView *)v4->_bodyTextView setFont:v15];

    v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UITextView *)v4->_bodyTextView setTextColor:v16];

    [(UITextView *)v4->_bodyTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)v4->_bodyTextView setAdjustsFontForContentSizeCategory:1];
    v17 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v4->_bodyTextView setBackgroundColor:v17];

    [(UITextView *)v4->_bodyTextView setShowsVerticalScrollIndicator:0];
    [(UITextView *)v4->_bodyTextView setEditable:0];
    [(UITextView *)v4->_bodyTextView setSelectable:1];
    [(UITextView *)v4->_bodyTextView setScrollEnabled:0];
    v18 = [(UITextView *)v4->_bodyTextView textContainer];
    [v18 setLineFragmentPadding:0.0];

    [(UITextView *)v4->_bodyTextView _setInteractiveTextSelectionDisabled:1];
    -[UITextView setTextContainerInset:](v4->_bodyTextView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    uint64_t v70 = *MEMORY[0x1E4FB12B8];
    v19 = [MEMORY[0x1E4FB1618] linkColor];
    v71[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
    [(UITextView *)v4->_bodyTextView setLinkTextAttributes:v20];

    [(UITextView *)v4->_bodyTextView setDelegate:v4];
    [(SFPrivacyReportExplanationDetailItemView *)v4 addSubview:v4->_bodyTextView];
    v21 = [(UILabel *)v4->_titleLabel topAnchor];
    v22 = [(SFPrivacyReportExplanationDetailItemView *)v4 topAnchor];
    uint64_t v23 = [v21 constraintEqualToAnchor:v22 constant:0.0];
    titleTopConstraint = v4->_titleTopConstraint;
    v4->_titleTopConstraint = (NSLayoutConstraint *)v23;

    v25 = [(UIView *)v4->_hairline topAnchor];
    v26 = [(SFPrivacyReportExplanationDetailItemView *)v4 topAnchor];
    uint64_t v27 = [v25 constraintEqualToAnchor:v26];
    hairlineTopConstraint = v4->_hairlineTopConstraint;
    v4->_hairlineTopConstraint = (NSLayoutConstraint *)v27;

    v29 = [(SFPrivacyReportExplanationDetailItemView *)v4 layoutMarginsGuide];
    v54 = (void *)MEMORY[0x1E4F28DC8];
    v69[0] = v4->_hairlineTopConstraint;
    v66 = [(UIView *)v4->_hairline leadingAnchor];
    v65 = [v29 leadingAnchor];
    v64 = [v66 constraintEqualToAnchor:v65];
    v69[1] = v64;
    v63 = [(UIView *)v4->_hairline centerXAnchor];
    v59 = v29;
    v62 = [v29 centerXAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v69[2] = v61;
    v60 = [(UIView *)v4->_hairline heightAnchor];
    _SFOnePixel();
    v58 = objc_msgSend(v60, "constraintEqualToConstant:");
    v69[3] = v58;
    v57 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v56 = [v29 leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v69[4] = v55;
    v53 = [(UILabel *)v4->_titleLabel centerXAnchor];
    v52 = [v29 centerXAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v69[5] = v51;
    v50 = [(UITextView *)v4->_bodyTextView leadingAnchor];
    v49 = [v29 leadingAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v69[6] = v48;
    v47 = [(UITextView *)v4->_bodyTextView centerXAnchor];
    v46 = [v29 centerXAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v69[7] = v45;
    v69[8] = v4->_titleTopConstraint;
    v30 = [(UITextView *)v4->_bodyTextView topAnchor];
    v31 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v32 = [v30 constraintEqualToSystemSpacingBelowAnchor:v31 multiplier:0.5];
    v69[9] = v32;
    v33 = [(UITextView *)v4->_bodyTextView bottomAnchor];
    v34 = [(SFPrivacyReportExplanationDetailItemView *)v4 bottomAnchor];
    v35 = [v33 constraintLessThanOrEqualToAnchor:v34];
    v69[10] = v35;
    v36 = [(UITextView *)v4->_bodyTextView bottomAnchor];
    v37 = [(SFPrivacyReportExplanationDetailItemView *)v4 bottomAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];

    LODWORD(v39) = 1131413504;
    [v38 setPriority:v39];
    v69[11] = v38;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:12];
    [v54 activateConstraints:v40];

    uint64_t v68 = objc_opt_class();
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    id v42 = (id)[(SFPrivacyReportExplanationDetailItemView *)v4 registerForTraitChanges:v41 withTarget:v4 action:sel__preferredContentSizeCategoryDidChange];

    v43 = v4;
  }

  return v4;
}

- (void)setUsesInsetStyle:(BOOL)a3
{
  if (self->_usesInsetStyle != a3)
  {
    self->_usesInsetStyle = a3;
    [(SFPrivacyReportExplanationDetailItemView *)self _updateTopSpacing];
  }
}

- (void)setGridPosition:(unint64_t)a3
{
  if (self->_gridPosition != a3)
  {
    self->_gridPosition = a3;
    [(UIView *)self->_hairline setHidden:(a3 & 1) == 0];
    [(SFPrivacyReportExplanationDetailItemView *)self _updateTopSpacing];
  }
}

- (void)setTitleLabelTopSpacing:(double)a3
{
  if (self->_titleLabelTopSpacing != a3)
  {
    self->_titleLabelTopSpacing = a3;
    [(SFPrivacyReportExplanationDetailItemView *)self _updateTopConstraints];
  }
}

- (void)setHairlineTopSpacing:(double)a3
{
  if (self->_hairlineTopSpacing != a3)
  {
    self->_hairlineTopSpacing = a3;
    [(SFPrivacyReportExplanationDetailItemView *)self _updateTopConstraints];
  }
}

- (void)_updateTopConstraints
{
  [(NSLayoutConstraint *)self->_titleTopConstraint setConstant:self->_titleLabelTopSpacing + self->_hairlineTopSpacing];
  double hairlineTopSpacing = self->_hairlineTopSpacing;
  hairlineTopConstraint = self->_hairlineTopConstraint;

  [(NSLayoutConstraint *)hairlineTopConstraint setConstant:hairlineTopSpacing];
}

- (void)_updateTopSpacing
{
  BOOL v3 = [(UIView *)self->_hairline isHidden];
  double v4 = 0.0;
  double v5 = 0.0;
  if (!v3)
  {
    double v4 = 35.0;
    double v5 = 20.0;
    if (!self->_usesInsetStyle) {
      double v5 = 35.0;
    }
  }
  [(SFPrivacyReportExplanationDetailItemView *)self setTitleLabelTopSpacing:v5];

  [(SFPrivacyReportExplanationDetailItemView *)self setHairlineTopSpacing:v4];
}

- (void)_preferredContentSizeCategoryDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained itemDidChangeContentSize:self];
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 0;
}

- (SFPrivacyReportGridItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFPrivacyReportGridItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)gridPosition
{
  return self->_gridPosition;
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (void)setCellBackgroundColor:(id)a3
{
}

- (double)cellBackgroundCornerRadius
{
  return self->_cellBackgroundCornerRadius;
}

- (void)setCellBackgroundCornerRadius:(double)a3
{
  self->_cellBackgroundCornerRadius = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UITextView)bodyTextView
{
  return self->_bodyTextView;
}

- (double)titleLabelTopSpacing
{
  return self->_titleLabelTopSpacing;
}

- (double)hairlineTopSpacing
{
  return self->_hairlineTopSpacing;
}

- (BOOL)usesInsetStyle
{
  return self->_usesInsetStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hairlineTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleTopConstraint, 0);

  objc_storeStrong((id *)&self->_hairline, 0);
}

@end