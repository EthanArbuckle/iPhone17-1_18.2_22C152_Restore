@interface PKPaletteContainerView
- (NSLayoutConstraint)accessoryViewBottomConstraint;
- (NSLayoutConstraint)accessoryViewHeightConstraint;
- (NSLayoutConstraint)accessoryViewLeftConstraint;
- (NSLayoutConstraint)accessoryViewRightConstraint;
- (NSLayoutConstraint)accessoryViewTopConstraint;
- (NSLayoutConstraint)accessoryViewWidthConstraint;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSLayoutConstraint)contentViewLeftConstraint;
- (NSLayoutConstraint)contentViewRightConstraint;
- (NSLayoutConstraint)contentViewTopConstraint;
- (PKAccessoryView)accessoryView;
- (PKPaletteContainerView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (double)scalingFactor;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)_installAccessoryView;
- (void)_installContentView;
- (void)_updateUI;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryViewBottomConstraint:(id)a3;
- (void)setAccessoryViewHeightConstraint:(id)a3;
- (void)setAccessoryViewLeftConstraint:(id)a3;
- (void)setAccessoryViewRightConstraint:(id)a3;
- (void)setAccessoryViewTopConstraint:(id)a3;
- (void)setAccessoryViewWidthConstraint:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setContentViewLeftConstraint:(id)a3;
- (void)setContentViewRightConstraint:(id)a3;
- (void)setContentViewTopConstraint:(id)a3;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setScalingFactor:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation PKPaletteContainerView

- (PKPaletteContainerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteContainerView;
  v3 = -[PKPaletteContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    [(PKPaletteContainerView *)v3 _installAccessoryView];
    [(PKPaletteContainerView *)v4 _installContentView];
    [(PKPaletteContainerView *)v4 _updateUI];
  }
  return v4;
}

- (void)_installAccessoryView
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(PKAccessoryView);
  accessoryView = self->_accessoryView;
  self->_accessoryView = v3;

  [(PKAccessoryView *)self->_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PKAccessoryView *)self->_accessoryView setUserInteractionEnabled:0];
  [(PKPaletteContainerView *)self addSubview:self->_accessoryView];
  v5 = [(PKAccessoryView *)self->_accessoryView topAnchor];
  objc_super v6 = [(PKPaletteContainerView *)self topAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  accessoryViewTopConstraint = self->_accessoryViewTopConstraint;
  self->_accessoryViewTopConstraint = v7;

  v9 = [(PKAccessoryView *)self->_accessoryView bottomAnchor];
  v10 = [(PKPaletteContainerView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  accessoryViewBottomConstraint = self->_accessoryViewBottomConstraint;
  self->_accessoryViewBottomConstraint = v11;

  v13 = [(PKAccessoryView *)self->_accessoryView leftAnchor];
  v14 = [(PKPaletteContainerView *)self leftAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  accessoryViewLeftConstraint = self->_accessoryViewLeftConstraint;
  self->_accessoryViewLeftConstraint = v15;

  v17 = [(PKAccessoryView *)self->_accessoryView rightAnchor];
  v18 = [(PKPaletteContainerView *)self rightAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  accessoryViewRightConstraint = self->_accessoryViewRightConstraint;
  self->_accessoryViewRightConstraint = v19;

  v21 = [(PKAccessoryView *)self->_accessoryView widthAnchor];
  v22 = [v21 constraintEqualToConstant:19.0];
  accessoryViewWidthConstraint = self->_accessoryViewWidthConstraint;
  self->_accessoryViewWidthConstraint = v22;

  v24 = [(PKAccessoryView *)self->_accessoryView heightAnchor];
  v25 = [v24 constraintEqualToConstant:19.0];
  accessoryViewHeightConstraint = self->_accessoryViewHeightConstraint;
  self->_accessoryViewHeightConstraint = v25;

  v27 = (void *)MEMORY[0x1E4F28DC8];
  v28 = self->_accessoryViewLeftConstraint;
  v31[0] = self->_accessoryViewTopConstraint;
  v31[1] = v28;
  v29 = self->_accessoryViewHeightConstraint;
  v31[2] = self->_accessoryViewRightConstraint;
  v31[3] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  [v27 activateConstraints:v30];
}

- (void)_installContentView
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  contentView = self->_contentView;
  self->_contentView = v3;

  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PKPaletteContainerView *)self addSubview:self->_contentView];
  v5 = [(UIView *)self->_contentView topAnchor];
  objc_super v6 = [(PKPaletteContainerView *)self topAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  contentViewTopConstraint = self->_contentViewTopConstraint;
  self->_contentViewTopConstraint = v7;

  v9 = [(UIView *)self->_contentView bottomAnchor];
  v10 = [(PKPaletteContainerView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  contentViewBottomConstraint = self->_contentViewBottomConstraint;
  self->_contentViewBottomConstraint = v11;

  v13 = [(UIView *)self->_contentView leftAnchor];
  v14 = [(PKPaletteContainerView *)self leftAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  contentViewLeftConstraint = self->_contentViewLeftConstraint;
  self->_contentViewLeftConstraint = v15;

  v17 = [(UIView *)self->_contentView rightAnchor];
  v18 = [(PKPaletteContainerView *)self rightAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  contentViewRightConstraint = self->_contentViewRightConstraint;
  self->_contentViewRightConstraint = v19;

  v21 = (void *)MEMORY[0x1E4F28DC8];
  v22 = self->_contentViewBottomConstraint;
  v25[0] = self->_contentViewTopConstraint;
  v25[1] = v22;
  v23 = self->_contentViewRightConstraint;
  v25[2] = self->_contentViewLeftConstraint;
  v25[3] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  [v21 activateConstraints:v24];
}

- (void)updateConstraints
{
  v3 = [(PKPaletteContainerView *)self accessoryViewHeightConstraint];
  [v3 setConstant:0.0];

  v4 = [(PKPaletteContainerView *)self accessoryViewWidthConstraint];
  [v4 setConstant:0.0];

  v5 = [(PKPaletteContainerView *)self contentViewTopConstraint];
  [v5 setConstant:0.0];

  objc_super v6 = [(PKPaletteContainerView *)self contentViewBottomConstraint];
  [v6 setConstant:0.0];

  v7 = [(PKPaletteContainerView *)self contentViewLeftConstraint];
  [v7 setConstant:0.0];

  v8 = [(PKPaletteContainerView *)self contentViewRightConstraint];
  [v8 setConstant:0.0];

  v9 = [(PKPaletteContainerView *)self traitCollection];
  v10 = [(PKPaletteContainerView *)self window];
  v11 = [v10 windowScene];
  BOOL v12 = PKUseCompactSize(v9, v11);

  if (!v12)
  {
    [(PKPaletteContainerView *)self scalingFactor];
    double v14 = v13;
    [(PKPaletteContainerView *)self scalingFactor];
    double v16 = v15;
    unint64_t v17 = [(PKPaletteContainerView *)self edgeLocation];
    if (v17 <= 0xF)
    {
      double v18 = v14 * 19.0;
      double v19 = v16 * 19.0;
      if (((1 << v17) & 0x8013) != 0)
      {
        v20 = [(PKPaletteContainerView *)self contentViewTopConstraint];
        [v20 setConstant:v19];

        v21 = [(PKPaletteContainerView *)self contentViewBottomConstraint];
        [v21 setConstant:-v19];

        v22 = [(PKPaletteContainerView *)self accessoryViewHeightConstraint];
LABEL_7:
        v25 = v22;
        [v22 setConstant:v18];

        goto LABEL_8;
      }
      if (((1 << v17) & 0x104) != 0)
      {
        v23 = [(PKPaletteContainerView *)self accessoryViewWidthConstraint];
        [v23 setConstant:v18];

        v24 = [(PKPaletteContainerView *)self contentViewLeftConstraint];
        [v24 setConstant:v19];

        double v18 = -v19;
        v22 = [(PKPaletteContainerView *)self contentViewRightConstraint];
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  v26.receiver = self;
  v26.super_class = (Class)PKPaletteContainerView;
  [(PKPaletteContainerView *)&v26 updateConstraints];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [(PKPaletteContainerView *)self contentView];
  -[PKPaletteContainerView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v13 = [(PKPaletteContainerView *)self contentView];
  double v14 = [v13 subviews];
  double v15 = [v14 reverseObjectEnumerator];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v21 = [(PKPaletteContainerView *)self contentView];
        objc_msgSend(v21, "convertPoint:toView:", v20, v10, v12);
        double v23 = v22;
        double v25 = v24;

        uint64_t v26 = objc_msgSend(v20, "hitTest:withEvent:", v7, v23, v25);
        if (v26)
        {
          v27 = (void *)v26;

          goto LABEL_11;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  v29.receiver = self;
  v29.super_class = (Class)PKPaletteContainerView;
  v27 = -[PKPaletteContainerView hitTest:withEvent:](&v29, sel_hitTest_withEvent_, v7, x, y);
LABEL_11:

  return v27;
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    [(PKPaletteContainerView *)self _updateUI];
    [(PKPaletteContainerView *)self setNeedsUpdateConstraints];
  }
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKPaletteContainerView *)self _updateUI];
    [(PKPaletteContainerView *)self setNeedsUpdateConstraints];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaletteContainerView;
  [(PKPaletteContainerView *)&v10 traitCollectionDidChange:v4];
  v5 = [(PKPaletteContainerView *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];
  if (v6 == [v4 verticalSizeClass])
  {
    id v7 = [(PKPaletteContainerView *)self traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];
    uint64_t v9 = [v4 horizontalSizeClass];

    if (v8 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(PKPaletteContainerView *)self _updateUI];
  [(PKPaletteContainerView *)self setNeedsUpdateConstraints];
LABEL_6:
}

- (void)_updateUI
{
  v34[6] = *MEMORY[0x1E4F143B8];
  v3 = [(PKPaletteContainerView *)self traitCollection];
  id v4 = [(PKPaletteContainerView *)self window];
  v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  if (!v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v8 = [(PKPaletteContainerView *)self accessoryViewTopConstraint];
    v34[0] = v8;
    uint64_t v9 = [(PKPaletteContainerView *)self accessoryViewLeftConstraint];
    v34[1] = v9;
    objc_super v10 = [(PKPaletteContainerView *)self accessoryViewRightConstraint];
    v34[2] = v10;
    double v11 = [(PKPaletteContainerView *)self accessoryViewBottomConstraint];
    v34[3] = v11;
    double v12 = [(PKPaletteContainerView *)self accessoryViewHeightConstraint];
    v34[4] = v12;
    double v13 = [(PKPaletteContainerView *)self accessoryViewWidthConstraint];
    v34[5] = v13;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:6];
    [v7 deactivateConstraints:v14];

    unint64_t v15 = [(PKPaletteContainerView *)self edgeLocation];
    switch(v15)
    {
      case 0uLL:
      case 1uLL:
      case 4uLL:
        goto LABEL_3;
      case 2uLL:
        uint64_t v16 = (void *)MEMORY[0x1E4F28DC8];
        uint64_t v17 = [(PKPaletteContainerView *)self accessoryViewTopConstraint];
        v32[0] = v17;
        uint64_t v18 = [(PKPaletteContainerView *)self accessoryViewRightConstraint];
        v32[1] = v18;
        double v19 = [(PKPaletteContainerView *)self accessoryViewBottomConstraint];
        v32[2] = v19;
        v20 = [(PKPaletteContainerView *)self accessoryViewWidthConstraint];
        v32[3] = v20;
        v21 = (void *)MEMORY[0x1E4F1C978];
        double v22 = v32;
        goto LABEL_8;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 8uLL:
        uint64_t v16 = (void *)MEMORY[0x1E4F28DC8];
        uint64_t v17 = [(PKPaletteContainerView *)self accessoryViewTopConstraint];
        uint64_t v18 = [(PKPaletteContainerView *)self accessoryViewLeftConstraint];
        v31[1] = v18;
        double v19 = [(PKPaletteContainerView *)self accessoryViewBottomConstraint];
        v31[2] = v19;
        v20 = [(PKPaletteContainerView *)self accessoryViewWidthConstraint];
        v31[3] = v20;
        v21 = (void *)MEMORY[0x1E4F1C978];
        double v22 = v31;
        goto LABEL_8;
      default:
        if (v15 != 15) {
          break;
        }
LABEL_3:
        uint64_t v16 = (void *)MEMORY[0x1E4F28DC8];
        uint64_t v17 = [(PKPaletteContainerView *)self accessoryViewTopConstraint];
        v33[0] = v17;
        uint64_t v18 = [(PKPaletteContainerView *)self accessoryViewLeftConstraint];
        v33[1] = v18;
        double v19 = [(PKPaletteContainerView *)self accessoryViewRightConstraint];
        v33[2] = v19;
        v20 = [(PKPaletteContainerView *)self accessoryViewHeightConstraint];
        v33[3] = v20;
        v21 = (void *)MEMORY[0x1E4F1C978];
        double v22 = v33;
LABEL_8:
        double v23 = [v21 arrayWithObjects:v22 count:4];
        [v16 activateConstraints:v23];

        break;
    }
  }
  unint64_t v24 = [(PKPaletteContainerView *)self edgeLocation];
  double v25 = [(PKPaletteContainerView *)self accessoryView];
  [v25 setEdgeLocation:v24];

  [(PKPaletteContainerView *)self scalingFactor];
  double v27 = v26;
  v28 = [(PKPaletteContainerView *)self accessoryView];
  [v28 setScalingFactor:v27];

  uint64_t v29 = PKIsVisionDevice() | v6;
  long long v30 = [(PKPaletteContainerView *)self accessoryView];
  [v30 setHidden:v29];
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewLeftConstraint
{
  return self->_contentViewLeftConstraint;
}

- (void)setContentViewLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewRightConstraint
{
  return self->_contentViewRightConstraint;
}

- (void)setContentViewRightConstraint:(id)a3
{
}

- (PKAccessoryView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
}

- (NSLayoutConstraint)accessoryViewTopConstraint
{
  return self->_accessoryViewTopConstraint;
}

- (void)setAccessoryViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)accessoryViewBottomConstraint
{
  return self->_accessoryViewBottomConstraint;
}

- (void)setAccessoryViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)accessoryViewLeftConstraint
{
  return self->_accessoryViewLeftConstraint;
}

- (void)setAccessoryViewLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)accessoryViewRightConstraint
{
  return self->_accessoryViewRightConstraint;
}

- (void)setAccessoryViewRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)accessoryViewWidthConstraint
{
  return self->_accessoryViewWidthConstraint;
}

- (void)setAccessoryViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)accessoryViewHeightConstraint
{
  return self->_accessoryViewHeightConstraint;
}

- (void)setAccessoryViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_contentViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end