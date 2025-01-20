@interface CPSAppStoreButton
- (CGSize)intrinsicContentSize;
- (CPSAppStoreButton)initWithCoder:(id)a3;
- (CPSAppStoreButton)initWithFrame:(CGRect)a3;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_commonInit;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSAppStoreButton

- (CPSAppStoreButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPSAppStoreButton;
  v3 = -[CPSButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CPSAppStoreButton *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (CPSAppStoreButton)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPSAppStoreButton;
  v3 = [(CPSButton *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(CPSAppStoreButton *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  v57[3] = *MEMORY[0x1E4F143B8];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_lastLayoutBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_lastLayoutBounds.size = v3;
  v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  label = self->_label;
  self->_label = v4;

  [(UILabel *)self->_label setAdjustsFontForContentSizeCategory:1];
  v6 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43880] variant:256];
  [(UILabel *)self->_label setFont:v6];

  objc_super v7 = _CPSLocalizedString();
  [(UILabel *)self->_label setText:v7];

  LODWORD(v8) = 1144733696;
  [(UILabel *)self->_label setContentCompressionResistancePriority:0 forAxis:v8];
  id v9 = objc_alloc(MEMORY[0x1E4F42E20]);
  v10 = makeAppStoreImageView();
  v57[0] = v10;
  v11 = makeVibrant(self->_label, 1);
  v57[1] = v11;
  v12 = makeChevronImageView();
  v57[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:3];
  v14 = (UIStackView *)[v9 initWithArrangedSubviews:v13];
  fullSizeStack = self->_fullSizeStack;
  self->_fullSizeStack = v14;

  [(UIStackView *)self->_fullSizeStack setSpacing:3.0];
  [(UIStackView *)self->_fullSizeStack setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSAppStoreButton *)self addSubview:self->_fullSizeStack];
  id v16 = objc_alloc(MEMORY[0x1E4F42E20]);
  v17 = makeAppStoreImageView();
  v56[0] = v17;
  v18 = makeChevronImageView();
  v56[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  v20 = (UIStackView *)[v16 initWithArrangedSubviews:v19];
  glyphOnlyStack = self->_glyphOnlyStack;
  self->_glyphOnlyStack = v20;

  [(UIStackView *)self->_glyphOnlyStack setSpacing:3.0];
  [(UIStackView *)self->_glyphOnlyStack setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSAppStoreButton *)self addSubview:self->_glyphOnlyStack];
  v42 = (void *)MEMORY[0x1E4F28DC8];
  v54 = [(UIStackView *)self->_fullSizeStack centerXAnchor];
  v53 = [(CPSAppStoreButton *)self centerXAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v55[0] = v52;
  v51 = [(UIStackView *)self->_fullSizeStack centerYAnchor];
  v50 = [(CPSAppStoreButton *)self centerYAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v55[1] = v49;
  v48 = [(UIStackView *)self->_fullSizeStack widthAnchor];
  v47 = [(CPSAppStoreButton *)self widthAnchor];
  v46 = [v48 constraintLessThanOrEqualToAnchor:v47];
  v55[2] = v46;
  v45 = [(UIStackView *)self->_fullSizeStack heightAnchor];
  v44 = [(CPSAppStoreButton *)self heightAnchor];
  v43 = [v45 constraintLessThanOrEqualToAnchor:v44];
  v55[3] = v43;
  v41 = [(UIStackView *)self->_fullSizeStack heightAnchor];
  v40 = [(CPSAppStoreButton *)self heightAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  LODWORD(v22) = 1144750080;
  v38 = objc_msgSend(v39, "cps_setPriority:", v22);
  v55[4] = v38;
  v37 = [(UIStackView *)self->_glyphOnlyStack centerYAnchor];
  v36 = [(CPSAppStoreButton *)self centerYAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v55[5] = v35;
  v34 = [(UIStackView *)self->_glyphOnlyStack heightAnchor];
  v23 = [(CPSAppStoreButton *)self heightAnchor];
  v24 = [v34 constraintLessThanOrEqualToAnchor:v23];
  v55[6] = v24;
  v25 = [(UIStackView *)self->_glyphOnlyStack heightAnchor];
  v26 = [(CPSAppStoreButton *)self heightAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  LODWORD(v28) = 1144750080;
  v29 = objc_msgSend(v27, "cps_setPriority:", v28);
  v55[7] = v29;
  v30 = [(UIStackView *)self->_glyphOnlyStack trailingAnchor];
  v31 = [(CPSAppStoreButton *)self trailingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v55[8] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:9];
  [v42 activateConstraints:v33];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)CPSAppStoreButton;
  [(CPSAppStoreButton *)&v10 layoutSubviews];
  [(CPSAppStoreButton *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  if (!CGRectEqualToRect(v11, self->_lastLayoutBounds))
  {
    self->_lastLayoutBounds.origin.CGFloat x = x;
    self->_lastLayoutBounds.origin.CGFloat y = y;
    self->_lastLayoutBounds.size.CGFloat width = width;
    self->_lastLayoutBounds.size.CGFloat height = height;
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    double v7 = CGRectGetWidth(v12);
    -[UIStackView systemLayoutSizeFittingSize:](self->_fullSizeStack, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
    BOOL v9 = v7 >= v8;
    [(UIStackView *)self->_fullSizeStack setHidden:v7 < v8];
    [(UIStackView *)self->_glyphOnlyStack setHidden:v9];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPSAppStoreButton;
  id v4 = a3;
  [(CPSAppStoreButton *)&v10 traitCollectionDidChange:v4];
  v5 = [(CPSAppStoreButton *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7);
  if (v8)
  {
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_lastLayoutBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_lastLayoutBounds.size = v9;
    [(CPSAppStoreButton *)self setNeedsLayout];
    [(CPSAppStoreButton *)self invalidateIntrinsicContentSize];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPSAppStoreButton;
  [(CPSButton *)&v4 setHighlighted:a3];
  [(UIStackView *)self->_fullSizeStack cps_configureForAnimatesAlphaWhenHighlighted:[(CPSAppStoreButton *)self isHighlighted]];
  [(UIStackView *)self->_glyphOnlyStack cps_configureForAnimatesAlphaWhenHighlighted:[(CPSAppStoreButton *)self isHighlighted]];
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (void)invalidateIntrinsicContentSize
{
  self->_intrinsicContentSizeIsValid = 0;
  v2.receiver = self;
  v2.super_class = (Class)CPSAppStoreButton;
  [(CPSAppStoreButton *)&v2 invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  p_intrinsicContentSize = &self->_intrinsicContentSize;
  if (self->_intrinsicContentSizeIsValid)
  {
    double width = p_intrinsicContentSize->width;
    double height = self->_intrinsicContentSize.height;
  }
  else
  {
    -[UIStackView systemLayoutSizeFittingSize:](self->_glyphOnlyStack, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
    p_intrinsicContentSize->double width = width;
    p_intrinsicContentSize->double height = height;
    self->_intrinsicContentSizeIsValid = 1;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_glyphOnlyStack, 0);

  objc_storeStrong((id *)&self->_fullSizeStack, 0);
}

@end