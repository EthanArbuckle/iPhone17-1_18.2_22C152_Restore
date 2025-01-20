@interface BKUIPearlInstructionView
- (BKUIPearlInstructionView)init;
- (BOOL)darkMode;
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)labelsWidthConstraint;
- (NSLayoutYAxisAnchor)instructionTextTopAnchor;
- (NSString)detail;
- (NSString)instruction;
- (UIEdgeInsets)labelsHorizontalMargin;
- (UILabel)detailLabel;
- (UILabel)instructionLabel;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_configureConstraints;
- (void)setDarkMode:(BOOL)a3;
- (void)setDetail:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setInstruction:(id)a3;
- (void)setInstructionLabel:(id)a3;
- (void)setLabelsHorizontalMargin:(UIEdgeInsets)a3;
- (void)setLabelsWidthConstraint:(id)a3;
@end

@implementation BKUIPearlInstructionView

- (BKUIPearlInstructionView)init
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)BKUIPearlInstructionView;
  v2 = [(BKUIPearlInstructionView *)&v24 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    v4 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438F0]];
    uint64_t v5 = [v4 fontDescriptorWithSymbolicTraits:2];

    v19 = (void *)v5;
    v6 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v5 size:0.0];
    [v3 setFont:v6];

    objc_storeWeak((id *)&v2->_instructionLabel, v3);
    id v7 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [v7 setFont:v8];

    objc_storeWeak((id *)&v2->_detailLabel, v7);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_instructionLabel);
    v25[0] = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&v2->_detailLabel);
    v25[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          [v16 setTextAlignment:1];
          [v16 setNumberOfLines:0];
          v17 = [MEMORY[0x1E4F428B8] whiteColor];
          [v16 setTextColor:v17];

          [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(BKUIPearlInstructionView *)v2 addSubview:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v13);
    }

    [(BKUIPearlInstructionView *)v2 _configureConstraints];
    +[BKUIStyle _layoutMarginsForPearEnrollView];
    -[BKUIPearlInstructionView setLabelsHorizontalMargin:](v2, "setLabelsHorizontalMargin:");
  }
  return v2;
}

- (void)_configureConstraints
{
  v45[7] = *MEMORY[0x1E4F143B8];
  p_instructionLabel = &self->_instructionLabel;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instructionLabel);
  uint64_t v5 = [WeakRetained widthAnchor];
  v6 = [(BKUIPearlInstructionView *)self widthAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  [(BKUIPearlInstructionView *)self setLabelsWidthConstraint:v7];

  v33 = (void *)MEMORY[0x1E4F28DC8];
  v44 = [(BKUIPearlInstructionView *)self labelsWidthConstraint];
  v45[0] = v44;
  id v43 = objc_loadWeakRetained((id *)p_instructionLabel);
  v42 = [v43 topAnchor];
  v41 = [(BKUIPearlInstructionView *)self topAnchor];
  v40 = [v42 constraintEqualToAnchor:v41 constant:16.0];
  v45[1] = v40;
  id v39 = objc_loadWeakRetained((id *)p_instructionLabel);
  v38 = [v39 centerXAnchor];
  v37 = [(BKUIPearlInstructionView *)self centerXAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v45[2] = v36;
  location = (id *)p_instructionLabel;
  id v35 = objc_loadWeakRetained((id *)p_instructionLabel);
  v31 = [v35 bottomAnchor];
  p_detailLabel = &self->_detailLabel;
  id v32 = objc_loadWeakRetained((id *)&self->_detailLabel);
  v30 = [v32 topAnchor];
  v29 = [v31 constraintLessThanOrEqualToAnchor:v30];
  v45[3] = v29;
  id v28 = objc_loadWeakRetained((id *)&self->_detailLabel);
  uint64_t v27 = [v28 centerXAnchor];
  v26 = [(BKUIPearlInstructionView *)self centerXAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v45[4] = v25;
  id v24 = objc_loadWeakRetained((id *)&self->_detailLabel);
  v9 = [v24 widthAnchor];
  id v10 = objc_loadWeakRetained((id *)p_instructionLabel);
  v11 = [v10 widthAnchor];
  uint64_t v12 = [v9 constraintEqualToAnchor:v11];
  v45[5] = v12;
  id v13 = objc_loadWeakRetained((id *)&self->_detailLabel);
  uint64_t v14 = [v13 bottomAnchor];
  v15 = [(BKUIPearlInstructionView *)self bottomAnchor];
  v16 = [v14 constraintLessThanOrEqualToAnchor:v15];
  v45[6] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:7];
  [v33 activateConstraints:v17];

  id v18 = objc_loadWeakRetained((id *)p_detailLabel);
  v19 = [v18 firstBaselineAnchor];
  id v20 = objc_loadWeakRetained(location);
  long long v21 = [v20 lastBaselineAnchor];
  long long v22 = [v19 constraintEqualToAnchor:v21 constant:33.0];

  LODWORD(v23) = 1144750080;
  [v22 setPriority:v23];
  [v22 setActive:1];
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
  if (a3) {
    [MEMORY[0x1E4F428B8] whiteColor];
  }
  else {
  id v6 = [MEMORY[0x1E4F428B8] labelColor];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instructionLabel);
  [WeakRetained setTextColor:v6];

  id v5 = objc_loadWeakRetained((id *)&self->_detailLabel);
  [v5 setTextColor:v6];
}

- (void)setInstruction:(id)a3
{
  objc_storeStrong((id *)&self->_instruction, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instructionLabel);
  [WeakRetained setText:v5];
}

- (void)setDetail:(id)a3
{
  objc_storeStrong((id *)&self->_detail, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailLabel);
  [WeakRetained setText:v5];
}

- (id)viewForFirstBaselineLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instructionLabel);

  return WeakRetained;
}

- (id)viewForLastBaselineLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailLabel);

  return WeakRetained;
}

- (void)setLabelsHorizontalMargin:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(BKUIPearlInstructionView *)self labelsHorizontalMargin];
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    self->_labelsHorizontalMargin.double top = top;
    self->_labelsHorizontalMargin.double left = left;
    self->_labelsHorizontalMargin.double bottom = bottom;
    self->_labelsHorizontalMargin.double right = right;
    id v18 = [(BKUIPearlInstructionView *)self superview];
    [v18 size];
    double v16 = v15 - self->_labelsHorizontalMargin.left - self->_labelsHorizontalMargin.right;
    v17 = [(BKUIPearlInstructionView *)self labelsWidthConstraint];
    [v17 setConstant:v16];
  }
}

- (NSLayoutYAxisAnchor)instructionTextTopAnchor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instructionLabel);
  id v3 = [WeakRetained topAnchor];

  return (NSLayoutYAxisAnchor *)v3;
}

- (CGSize)intrinsicContentSize
{
  [(BKUIPearlInstructionView *)self size];
  double v4 = v3;
  id v5 = [(BKUIPearlInstructionView *)self instructionLabel];
  [v5 intrinsicContentSize];
  double v7 = v6;
  double v8 = [(BKUIPearlInstructionView *)self detailLabel];
  [v8 intrinsicContentSize];
  double v10 = v7 + v9;

  double v11 = v4;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (NSString)instruction
{
  return self->_instruction;
}

- (NSString)detail
{
  return self->_detail;
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (UILabel)instructionLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instructionLabel);

  return (UILabel *)WeakRetained;
}

- (void)setInstructionLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDetailLabel:(id)a3
{
}

- (UIEdgeInsets)labelsHorizontalMargin
{
  double top = self->_labelsHorizontalMargin.top;
  double left = self->_labelsHorizontalMargin.left;
  double bottom = self->_labelsHorizontalMargin.bottom;
  double right = self->_labelsHorizontalMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSLayoutConstraint)labelsWidthConstraint
{
  return self->_labelsWidthConstraint;
}

- (void)setLabelsWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_detailLabel);
  objc_destroyWeak((id *)&self->_instructionLabel);
  objc_storeStrong((id *)&self->_detail, 0);

  objc_storeStrong((id *)&self->_instruction, 0);
}

@end