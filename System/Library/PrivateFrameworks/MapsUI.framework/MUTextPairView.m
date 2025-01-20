@interface MUTextPairView
- (BOOL)isStacked;
- (BOOL)shouldStackForProposedWidth:(double)a3;
- (MUTextPairView)initWithFrame:(CGRect)a3;
- (MUTextPairViewModel)viewModel;
- (void)_contentSizeDidChange;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateConstraints;
- (void)setStacked:(BOOL)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUTextPairView

- (MUTextPairView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MUTextPairView;
  v3 = -[MUTextPairView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUTextPairView *)v3 setAccessibilityIdentifier:@"TextPair"];
    [(MUTextPairView *)v4 _setupSubviews];
    [(MUTextPairView *)v4 _updateConstraints];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(MUTextPairView *)v4 setAccessibilityIdentifier:v6];
  }
  return v4;
}

- (void)_setupSubviews
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  objc_super v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  leftLabel = self->_leftLabel;
  self->_leftLabel = v8;

  [(UILabel *)self->_leftLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_leftLabel setNumberOfLines:1];
  [(UILabel *)self->_leftLabel setAccessibilityIdentifier:@"TextPairLeftLabel"];
  [(MUTextPairView *)self addSubview:self->_leftLabel];
  v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  rightLabel = self->_rightLabel;
  self->_rightLabel = v10;

  [(UILabel *)self->_rightLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_rightLabel setNumberOfLines:1];
  [(UILabel *)self->_rightLabel setAccessibilityIdentifier:@"TextPairRightLabel"];
  [(MUTextPairView *)self addSubview:self->_rightLabel];
  v12 = self;
  v15[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v14 = (id)[(MUTextPairView *)self registerForTraitChanges:v13 withAction:sel__contentSizeDidChange];
}

- (BOOL)shouldStackForProposedWidth:(double)a3
{
  [(UILabel *)self->_leftLabel idealWidth];
  double v6 = v5 + 8.0;
  [(UILabel *)self->_rightLabel idealWidth];
  return v6 + v7 > a3;
}

- (void)setStacked:(BOOL)a3
{
  if (self->_stacked != a3)
  {
    self->_stacked = a3;
    [(MUTextPairView *)self _updateConstraints];
  }
}

- (void)_updateConstraints
{
  v52[7] = *MEMORY[0x1E4F143B8];
  if (self->_constraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  leftLabel = self->_leftLabel;
  if (self->_stacked)
  {
    double v4 = [(UILabel *)leftLabel topAnchor];
    double v5 = [(MUTextPairView *)self topAnchor];
    double v6 = [v4 constraintEqualToAnchor:v5];
    v52[0] = v6;
    double v7 = [(UILabel *)self->_leftLabel bottomAnchor];
    v49 = [(UILabel *)self->_rightLabel topAnchor];
    v50 = v7;
    v48 = [v7 constraintEqualToAnchor:v49];
    v52[1] = v48;
    objc_super v8 = [(UILabel *)self->_leftLabel leadingAnchor];
    v46 = [(MUTextPairView *)self leadingAnchor];
    v47 = v8;
    v45 = [v8 constraintEqualToAnchor:v46];
    v52[2] = v45;
    v9 = [(UILabel *)self->_leftLabel trailingAnchor];
    v44 = [(MUTextPairView *)self trailingAnchor];
    v43 = objc_msgSend(v9, "constraintEqualToAnchor:");
    v52[3] = v43;
    v10 = [(UILabel *)self->_rightLabel leadingAnchor];
    v41 = [(MUTextPairView *)self leadingAnchor];
    v42 = v10;
    v40 = [v10 constraintEqualToAnchor:v41];
    v52[4] = v40;
    v11 = [(UILabel *)self->_rightLabel trailingAnchor];
    v38 = [(MUTextPairView *)self trailingAnchor];
    v39 = v11;
    v37 = [v11 constraintEqualToAnchor:v38];
    v52[5] = v37;
    v12 = [(UILabel *)self->_rightLabel bottomAnchor];
    v13 = [(MUTextPairView *)self bottomAnchor];
    v36 = v12;
    id v14 = [v12 constraintEqualToAnchor:v13];
    v52[6] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:7];
    constraints = self->_constraints;
    self->_constraints = v15;
  }
  else
  {
    v35 = [(UILabel *)leftLabel leadingAnchor];
    uint64_t v34 = [(MUTextPairView *)self leadingAnchor];
    uint64_t v33 = [v35 constraintEqualToAnchor:v34];
    v51[0] = v33;
    v17 = [(UILabel *)self->_leftLabel topAnchor];
    v49 = [(MUTextPairView *)self topAnchor];
    v50 = v17;
    v48 = [v17 constraintEqualToAnchor:v49];
    v51[1] = v48;
    v18 = [(UILabel *)self->_leftLabel bottomAnchor];
    v46 = [(MUTextPairView *)self bottomAnchor];
    v47 = v18;
    v45 = [v18 constraintEqualToAnchor:v46];
    v51[2] = v45;
    v32 = [(UILabel *)self->_leftLabel trailingAnchor];
    v44 = [(UILabel *)self->_rightLabel leadingAnchor];
    v43 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", -8.0);
    v51[3] = v43;
    v19 = [(UILabel *)self->_leftLabel centerYAnchor];
    v41 = [(MUTextPairView *)self centerYAnchor];
    v42 = v19;
    v40 = [v19 constraintEqualToAnchor:v41];
    v51[4] = v40;
    v20 = [(UILabel *)self->_leftLabel firstBaselineAnchor];
    v38 = [(UILabel *)self->_rightLabel firstBaselineAnchor];
    v39 = v20;
    v37 = [v20 constraintEqualToAnchor:v38];
    v51[5] = v37;
    v21 = [(UILabel *)self->_rightLabel leadingAnchor];
    v13 = [(MUTextPairView *)self centerXAnchor];
    v36 = v21;
    id v14 = [v21 constraintEqualToAnchor:v13];
    v51[6] = v14;
    constraints = [(UILabel *)self->_rightLabel topAnchor];
    v31 = [(MUTextPairView *)self topAnchor];
    v30 = [constraints constraintEqualToAnchor:v31];
    v51[7] = v30;
    v29 = [(UILabel *)self->_rightLabel bottomAnchor];
    v22 = [(MUTextPairView *)self bottomAnchor];
    v23 = [v29 constraintEqualToAnchor:v22];
    v51[8] = v23;
    v24 = [(UILabel *)self->_rightLabel trailingAnchor];
    v25 = [(MUTextPairView *)self trailingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v51[9] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:10];
    v28 = self->_constraints;
    self->_constraints = v27;

    v9 = v32;
    double v6 = (void *)v33;

    double v5 = (void *)v34;
    double v4 = v35;
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
}

- (void)setViewModel:(id)a3
{
  double v5 = (MUTextPairViewModel *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_viewModel, a3);
    p_viewModel = (MUTextPairViewModel **)[(MUTextPairView *)self _updateAppearance];
    double v5 = v7;
  }
  MEMORY[0x1F41817F8](p_viewModel, v5);
}

- (void)_updateAppearance
{
  id v3 = [(MUTextPairViewModel *)self->_viewModel leftText];
  [(UILabel *)self->_leftLabel setText:v3];

  id v4 = [(MUTextPairViewModel *)self->_viewModel rightText];
  [(UILabel *)self->_rightLabel setText:v4];
}

- (void)_contentSizeDidChange
{
  uint64_t v3 = *MEMORY[0x1E4FB28C8];
  id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_leftLabel setFont:v4];

  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v3];
  [(UILabel *)self->_rightLabel setFont:v5];
}

- (BOOL)isStacked
{
  return self->_stacked;
}

- (MUTextPairViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);
}

@end