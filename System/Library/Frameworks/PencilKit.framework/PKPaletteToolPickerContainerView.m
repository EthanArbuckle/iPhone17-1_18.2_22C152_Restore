@interface PKPaletteToolPickerContainerView
- (NSLayoutConstraint)toolPickerViewBottomConstraint;
- (NSLayoutConstraint)toolPickerViewCenterXConstraint;
- (NSLayoutConstraint)toolPickerViewCenterYConstraint;
- (NSLayoutConstraint)toolPickerViewLeftConstraint;
- (NSLayoutConstraint)toolPickerViewRightConstraint;
- (NSLayoutConstraint)toolPickerViewTopConstraint;
- (PKPaletteToolPickerContainerView)init;
- (PKPaletteToolPickerView)toolPickerView;
- (double)scalingFactor;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)_updateUI;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setScalingFactor:(double)a3;
- (void)setToolPickerViewBottomConstraint:(id)a3;
- (void)setToolPickerViewCenterXConstraint:(id)a3;
- (void)setToolPickerViewCenterYConstraint:(id)a3;
- (void)setToolPickerViewLeftConstraint:(id)a3;
- (void)setToolPickerViewRightConstraint:(id)a3;
- (void)setToolPickerViewTopConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPaletteToolPickerContainerView

- (PKPaletteToolPickerContainerView)init
{
  v37.receiver = self;
  v37.super_class = (Class)PKPaletteToolPickerContainerView;
  v2 = [(PKPaletteToolPickerContainerView *)&v37 init];
  v3 = v2;
  if (v2)
  {
    v2->_scalingFactor = 1.0;
    v4 = objc_alloc_init(PKPaletteToolPickerView);
    toolPickerView = v3->_toolPickerView;
    v3->_toolPickerView = v4;

    [(PKPaletteToolPickerView *)v3->_toolPickerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteToolPickerContainerView *)v3 addSubview:v3->_toolPickerView];
    v6 = [(PKPaletteToolPickerContainerView *)v3 toolPickerView];
    v7 = [v6 topAnchor];
    v8 = [(PKPaletteToolPickerContainerView *)v3 topAnchor];
    uint64_t v9 = [v7 constraintEqualToAnchor:v8];
    toolPickerViewTopConstraint = v3->_toolPickerViewTopConstraint;
    v3->_toolPickerViewTopConstraint = (NSLayoutConstraint *)v9;

    v11 = [(PKPaletteToolPickerContainerView *)v3 toolPickerView];
    v12 = [v11 bottomAnchor];
    v13 = [(PKPaletteToolPickerContainerView *)v3 bottomAnchor];
    uint64_t v14 = [v12 constraintEqualToAnchor:v13];
    toolPickerViewBottomConstraint = v3->_toolPickerViewBottomConstraint;
    v3->_toolPickerViewBottomConstraint = (NSLayoutConstraint *)v14;

    v16 = [(PKPaletteToolPickerContainerView *)v3 toolPickerView];
    v17 = [v16 leftAnchor];
    v18 = [(PKPaletteToolPickerContainerView *)v3 leftAnchor];
    uint64_t v19 = [v17 constraintEqualToAnchor:v18];
    toolPickerViewLeftConstraint = v3->_toolPickerViewLeftConstraint;
    v3->_toolPickerViewLeftConstraint = (NSLayoutConstraint *)v19;

    v21 = [(PKPaletteToolPickerContainerView *)v3 toolPickerView];
    v22 = [v21 rightAnchor];
    v23 = [(PKPaletteToolPickerContainerView *)v3 rightAnchor];
    uint64_t v24 = [v22 constraintEqualToAnchor:v23];
    toolPickerViewRightConstraint = v3->_toolPickerViewRightConstraint;
    v3->_toolPickerViewRightConstraint = (NSLayoutConstraint *)v24;

    v26 = [(PKPaletteToolPickerContainerView *)v3 toolPickerView];
    v27 = [v26 centerXAnchor];
    v28 = [(PKPaletteToolPickerContainerView *)v3 centerXAnchor];
    uint64_t v29 = [v27 constraintEqualToAnchor:v28];
    toolPickerViewCenterXConstraint = v3->_toolPickerViewCenterXConstraint;
    v3->_toolPickerViewCenterXConstraint = (NSLayoutConstraint *)v29;

    v31 = [(PKPaletteToolPickerContainerView *)v3 toolPickerView];
    v32 = [v31 centerYAnchor];
    v33 = [(PKPaletteToolPickerContainerView *)v3 centerYAnchor];
    uint64_t v34 = [v32 constraintEqualToAnchor:v33];
    toolPickerViewCenterYConstraint = v3->_toolPickerViewCenterYConstraint;
    v3->_toolPickerViewCenterYConstraint = (NSLayoutConstraint *)v34;

    [(PKPaletteToolPickerContainerView *)v3 _updateUI];
  }
  return v3;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKPaletteToolPickerContainerView *)self _updateUI];
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    [(PKPaletteToolPickerContainerView *)self _updateUI];
  }
}

- (void)setCornerLocation:(unint64_t)a3
{
  if (self->_cornerLocation != a3)
  {
    self->_cornerLocation = a3;
    [(PKPaletteToolPickerContainerView *)self _updateUI];
  }
}

- (void)_updateUI
{
  v50[6] = *MEMORY[0x1E4F143B8];
  [(PKPaletteToolPickerContainerView *)self scalingFactor];
  double v4 = v3;
  v5 = [(PKPaletteToolPickerContainerView *)self toolPickerView];
  [v5 setScalingFactor:v4];

  unint64_t v6 = [(PKPaletteToolPickerContainerView *)self edgeLocation];
  v7 = [(PKPaletteToolPickerContainerView *)self toolPickerView];
  [v7 setEdgeLocation:v6];

  unint64_t v8 = [(PKPaletteToolPickerContainerView *)self cornerLocation];
  uint64_t v9 = [(PKPaletteToolPickerContainerView *)self toolPickerView];
  [v9 setCornerLocation:v8];

  v10 = (void *)MEMORY[0x1E4F28DC8];
  v11 = [(PKPaletteToolPickerContainerView *)self toolPickerViewTopConstraint];
  v50[0] = v11;
  v12 = [(PKPaletteToolPickerContainerView *)self toolPickerViewBottomConstraint];
  v50[1] = v12;
  v13 = [(PKPaletteToolPickerContainerView *)self toolPickerViewLeftConstraint];
  v50[2] = v13;
  uint64_t v14 = [(PKPaletteToolPickerContainerView *)self toolPickerViewRightConstraint];
  v50[3] = v14;
  v15 = [(PKPaletteToolPickerContainerView *)self toolPickerViewCenterXConstraint];
  v50[4] = v15;
  v16 = [(PKPaletteToolPickerContainerView *)self toolPickerViewCenterYConstraint];
  v50[5] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:6];
  [v10 deactivateConstraints:v17];

  v18 = [(PKPaletteToolPickerContainerView *)self toolPickerViewLeftConstraint];
  [v18 setConstant:0.0];

  uint64_t v19 = [(PKPaletteToolPickerContainerView *)self toolPickerViewRightConstraint];
  [v19 setConstant:0.0];

  v20 = [(PKPaletteToolPickerContainerView *)self toolPickerViewBottomConstraint];
  [v20 setConstant:0.0];

  v21 = [(PKPaletteToolPickerContainerView *)self traitCollection];
  v22 = [(PKPaletteToolPickerContainerView *)self window];
  v23 = [v22 windowScene];
  LODWORD(v10) = PKUseCompactSize(v21, v23);

  if (!v10)
  {
    [(PKPaletteToolPickerContainerView *)self scalingFactor];
    double v33 = v32 * 19.0;
    unint64_t v34 = [(PKPaletteToolPickerContainerView *)self edgeLocation];
    if (v34 != 8 && v34 != 2)
    {
      [(PKPaletteToolPickerContainerView *)self scalingFactor];
      double v40 = v39 * -4.0;
      v41 = [(PKPaletteToolPickerContainerView *)self toolPickerViewCenterXConstraint];
      [v41 setConstant:v40];

      v42 = [(PKPaletteToolPickerContainerView *)self toolPickerViewBottomConstraint];
      [v42 setConstant:v33];

      v43 = (void *)MEMORY[0x1E4F28DC8];
      v27 = [(PKPaletteToolPickerContainerView *)self toolPickerViewTopConstraint];
      v28 = [(PKPaletteToolPickerContainerView *)self toolPickerViewBottomConstraint];
      v47[1] = v28;
      uint64_t v29 = [(PKPaletteToolPickerContainerView *)self toolPickerViewCenterXConstraint];
      v47[2] = v29;
      v44 = (void *)MEMORY[0x1E4F1C978];
      v45 = v47;
LABEL_12:
      v30 = [v44 arrayWithObjects:v45 count:3];
      [v43 activateConstraints:v30];
      goto LABEL_13;
    }
    [(PKPaletteToolPickerContainerView *)self scalingFactor];
    double v36 = v35 * 0.0;
    objc_super v37 = [(PKPaletteToolPickerContainerView *)self toolPickerViewCenterYConstraint];
    [v37 setConstant:v36];

    if ([(PKPaletteToolPickerContainerView *)self edgeLocation] == 2)
    {
      double v33 = -v33;
      v38 = [(PKPaletteToolPickerContainerView *)self toolPickerViewLeftConstraint];
    }
    else
    {
      if ([(PKPaletteToolPickerContainerView *)self edgeLocation] != 8)
      {
LABEL_11:
        v43 = (void *)MEMORY[0x1E4F28DC8];
        v27 = [(PKPaletteToolPickerContainerView *)self toolPickerViewLeftConstraint];
        v48[0] = v27;
        v28 = [(PKPaletteToolPickerContainerView *)self toolPickerViewRightConstraint];
        v48[1] = v28;
        uint64_t v29 = [(PKPaletteToolPickerContainerView *)self toolPickerViewCenterYConstraint];
        v48[2] = v29;
        v44 = (void *)MEMORY[0x1E4F1C978];
        v45 = v48;
        goto LABEL_12;
      }
      v38 = [(PKPaletteToolPickerContainerView *)self toolPickerViewRightConstraint];
    }
    v46 = v38;
    [v38 setConstant:v33];

    goto LABEL_11;
  }
  uint64_t v24 = [(PKPaletteToolPickerContainerView *)self toolPickerViewLeftConstraint];
  [v24 setConstant:0.0];

  v25 = [(PKPaletteToolPickerContainerView *)self toolPickerViewRightConstraint];
  [v25 setConstant:-0.0];

  v26 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(PKPaletteToolPickerContainerView *)self toolPickerViewTopConstraint];
  v49[0] = v27;
  v28 = [(PKPaletteToolPickerContainerView *)self toolPickerViewBottomConstraint];
  v49[1] = v28;
  uint64_t v29 = [(PKPaletteToolPickerContainerView *)self toolPickerViewLeftConstraint];
  v49[2] = v29;
  v30 = [(PKPaletteToolPickerContainerView *)self toolPickerViewRightConstraint];
  v49[3] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  [v26 activateConstraints:v31];

LABEL_13:
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  unint64_t v8 = [(PKPaletteToolPickerContainerView *)self toolPickerView];
  -[PKPaletteToolPickerContainerView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  v13 = [(PKPaletteToolPickerContainerView *)self toolPickerView];
  uint64_t v14 = objc_msgSend(v13, "hitTest:withEvent:", v7, v10, v12);

  if (v14)
  {
    id v15 = v14;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PKPaletteToolPickerContainerView;
    -[PKPaletteToolPickerContainerView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaletteToolPickerContainerView;
  [(PKPaletteToolPickerContainerView *)&v10 traitCollectionDidChange:v4];
  v5 = [(PKPaletteToolPickerContainerView *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];
  if (v6 == [v4 verticalSizeClass])
  {
    id v7 = [(PKPaletteToolPickerContainerView *)self traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];
    uint64_t v9 = [v4 horizontalSizeClass];

    if (v8 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(PKPaletteToolPickerContainerView *)self _updateUI];
LABEL_6:
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (PKPaletteToolPickerView)toolPickerView
{
  return self->_toolPickerView;
}

- (NSLayoutConstraint)toolPickerViewTopConstraint
{
  return self->_toolPickerViewTopConstraint;
}

- (void)setToolPickerViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolPickerViewBottomConstraint
{
  return self->_toolPickerViewBottomConstraint;
}

- (void)setToolPickerViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolPickerViewLeftConstraint
{
  return self->_toolPickerViewLeftConstraint;
}

- (void)setToolPickerViewLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolPickerViewRightConstraint
{
  return self->_toolPickerViewRightConstraint;
}

- (void)setToolPickerViewRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolPickerViewCenterXConstraint
{
  return self->_toolPickerViewCenterXConstraint;
}

- (void)setToolPickerViewCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolPickerViewCenterYConstraint
{
  return self->_toolPickerViewCenterYConstraint;
}

- (void)setToolPickerViewCenterYConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolPickerViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewTopConstraint, 0);

  objc_storeStrong((id *)&self->_toolPickerView, 0);
}

@end