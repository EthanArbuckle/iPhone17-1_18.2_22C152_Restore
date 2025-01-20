@interface AXUISettingsLabeledSliderCell
- (AXUISettingsLabeledSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BOOL)isAccessibilityElement;
- (BOOL)segmented;
- (CGPoint)accessibilityActivationPoint;
- (Class)sliderCellClass;
- (UILabel)rightLabel;
- (UISlider)sliderView;
- (UITraitChangeRegistration)traitRegistration;
- (UIView)leftView;
- (UIView)rightView;
- (double)initialValue;
- (double)maximumValue;
- (double)minimumValue;
- (double)rightViewPadding;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)labelTextColor;
- (id)maximumTextSizeString;
- (unint64_t)accessibilityTraits;
- (void)_updateLabelFont:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)dealloc;
- (void)didChangeTraitPreferredContentSizeCategory;
- (void)didMoveToSuperview;
- (void)setLabelText:(id)a3;
- (void)setLeftView:(id)a3;
- (void)setRightLabel:(id)a3;
- (void)setRightView:(id)a3;
- (void)setSegmented:(BOOL)a3;
- (void)setSliderView:(id)a3;
- (void)setTraitRegistration:(id)a3;
@end

@implementation AXUISettingsLabeledSliderCell

- (AXUISettingsLabeledSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v67.receiver = self;
  v67.super_class = (Class)AXUISettingsLabeledSliderCell;
  v9 = [(PSTableCell *)&v67 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(PSTableCell *)v9 setSpecifier:v8];
    [(AXUISettingsLabeledSliderCell *)v10 setUserInteractionEnabled:1];
    v11 = [(AXUISettingsLabeledSliderCell *)v10 contentView];
    [v11 setHidden:0];

    id v12 = objc_alloc([(AXUISettingsLabeledSliderCell *)v10 sliderCellClass]);
    double v13 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], v14, v15, v16);
    [(AXUISettingsLabeledSliderCell *)v10 setSliderView:v17];
    [(AXUISettingsLabeledSliderCell *)v10 minimumValue];
    *(float *)&double v18 = v18;
    [v17 setMinimumValue:v18];
    [(AXUISettingsLabeledSliderCell *)v10 maximumValue];
    *(float *)&double v19 = v19;
    [v17 setMaximumValue:v19];
    [(AXUISettingsLabeledSliderCell *)v10 initialValue];
    *(float *)&double v20 = v20;
    [v17 setValue:v20];
    [v17 setContinuous:1];
    [v17 addTarget:v10 action:sel_handleSliderBeingDragged_ forControlEvents:4096];
    [v17 addTarget:v10 action:sel_handleSliderDidFinishDrag_ forControlEvents:192];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v21) = 1148846080;
    [v17 setContentCompressionResistancePriority:1 forAxis:v21];
    v22 = [(AXUISettingsLabeledSliderCell *)v10 contentView];
    [v22 addSubview:v17];

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v13, v14, v15, v16);
    [(AXUISettingsLabeledSliderCell *)v10 setRightView:v23];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v24) = 1148846080;
    [v23 setContentCompressionResistancePriority:0 forAxis:v24];
    LODWORD(v25) = 1148846080;
    [v23 setContentCompressionResistancePriority:1 forAxis:v25];
    v26 = [(AXUISettingsLabeledSliderCell *)v10 contentView];
    [v26 addSubview:v23];

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v13, v14, v15, v16);
    [(AXUISettingsLabeledSliderCell *)v10 setRightLabel:v27];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v23 addSubview:v27];
    [v27 setTextAlignment:2];
    [v27 setNumberOfLines:1];
    [v27 setLineBreakMode:2];
    [(AXUISettingsLabeledSliderCell *)v10 _updateLabelFont:v27];
    v28 = [(AXUISettingsLabeledSliderCell *)v10 labelTextColor];
    [v27 setTextColor:v28];

    [v27 setAdjustsFontForContentSizeCategory:1];
    [(AXUISettingsLabeledSliderCell *)v10 rightViewPadding];
    *(float *)&double v13 = v29;
    v30 = [v17 leadingAnchor];
    v31 = [(AXUISettingsLabeledSliderCell *)v10 contentView];
    v32 = [v31 leadingAnchor];
    v33 = [v30 constraintEqualToAnchor:v32 constant:25.0];
    [(AXUISettingsLabeledSliderCell *)v10 addConstraint:v33];

    v34 = [v17 trailingAnchor];
    v35 = [v23 leadingAnchor];
    double v36 = (float)-*(float *)&v13;
    v37 = [v34 constraintEqualToAnchor:v35 constant:v36];
    [(AXUISettingsLabeledSliderCell *)v10 addConstraint:v37];

    v38 = [v23 trailingAnchor];
    v39 = [(AXUISettingsLabeledSliderCell *)v10 contentView];
    v40 = [v39 trailingAnchor];
    v41 = [v38 constraintEqualToAnchor:v40 constant:v36];
    [(AXUISettingsLabeledSliderCell *)v10 addConstraint:v41];

    v42 = [v17 centerYAnchor];
    v43 = [(AXUISettingsLabeledSliderCell *)v10 contentView];
    v44 = [v43 centerYAnchor];
    v45 = [v42 constraintEqualToAnchor:v44 constant:0.0];
    [(AXUISettingsLabeledSliderCell *)v10 addConstraint:v45];

    v46 = [v23 centerYAnchor];
    v47 = [(AXUISettingsLabeledSliderCell *)v10 contentView];
    v48 = [v47 centerYAnchor];
    v49 = [v46 constraintEqualToAnchor:v48 constant:0.0];
    [(AXUISettingsLabeledSliderCell *)v10 addConstraint:v49];

    v50 = [v23 heightAnchor];
    v51 = [(AXUISettingsLabeledSliderCell *)v10 contentView];
    v52 = [v51 heightAnchor];
    v53 = [v50 constraintEqualToAnchor:v52 constant:0.0];
    [(AXUISettingsLabeledSliderCell *)v10 addConstraint:v53];

    v54 = [v27 leadingAnchor];
    v55 = [v23 leadingAnchor];
    v56 = [v54 constraintEqualToAnchor:v55 constant:0.0];
    [(AXUISettingsLabeledSliderCell *)v10 addConstraint:v56];

    v57 = [v27 trailingAnchor];
    v58 = [v23 trailingAnchor];
    v59 = [v57 constraintEqualToAnchor:v58 constant:0.0];
    [(AXUISettingsLabeledSliderCell *)v10 addConstraint:v59];

    v60 = [v27 centerYAnchor];
    v61 = [v23 centerYAnchor];
    v62 = [v60 constraintEqualToAnchor:v61 constant:0.0];
    [(AXUISettingsLabeledSliderCell *)v10 addConstraint:v62];

    v68[0] = objc_opt_class();
    v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
    uint64_t v64 = [(AXUISettingsLabeledSliderCell *)v10 registerForTraitChanges:v63 withAction:sel_didChangeTraitPreferredContentSizeCategory];
    traitRegistration = v10->_traitRegistration;
    v10->_traitRegistration = (UITraitChangeRegistration *)v64;
  }
  return v10;
}

- (void)dealloc
{
  [(AXUISettingsLabeledSliderCell *)self unregisterForTraitChanges:self->_traitRegistration];
  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsLabeledSliderCell;
  [(PSTableCell *)&v3 dealloc];
}

- (double)rightViewPadding
{
  return 10.0;
}

- (void)didMoveToSuperview
{
  objc_super v3 = [(AXUISettingsLabeledSliderCell *)self maximumTextSizeString];
  if (v3)
  {
    id v10 = v3;
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v5 setNumberOfLines:1];
    [(AXUISettingsLabeledSliderCell *)self _updateLabelFont:v5];
    [v5 setAdjustsFontForContentSizeCategory:1];
    [v5 setText:v10];
    objc_msgSend(v5, "sizeThatFits:", 10000.0, 10000.0);
    double v7 = v6;

    objc_super v3 = v10;
    if (v7 > 0.0)
    {
      id v8 = [(AXUISettingsLabeledSliderCell *)self rightView];
      v9 = objc_msgSend(v8, "ax_addedConstraintForLayoutAttribute:asEqualToConstant:", 7, v7);
      [(AXUISettingsLabeledSliderCell *)self addConstraint:v9];

      objc_super v3 = v10;
    }
  }
}

- (id)maximumTextSizeString
{
  return 0;
}

- (Class)sliderCellClass
{
  return (Class)objc_opt_class();
}

- (void)_updateLabelFont:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4FB1798];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  id v5 = a3;
  id v8 = [v3 preferredFontForTextStyle:v4];
  double v6 = (void *)MEMORY[0x1E4FB1798];
  [v8 pointSize];
  double v7 = objc_msgSend(v6, "monospacedDigitSystemFontOfSize:weight:");
  [v5 setFont:v7];
}

- (id)labelTextColor
{
  return (id)[MEMORY[0x1E4FB1618] systemGrayColor];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  v2 = [(AXUISettingsLabeledSliderCell *)self rightLabel];
  objc_super v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(AXUISettingsLabeledSliderCell *)self sliderView];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (void)accessibilityDecrement
{
  v2 = [(AXUISettingsLabeledSliderCell *)self sliderView];
  [v2 accessibilityDecrement];

  AXPerformBlockAsynchronouslyOnMainThread();
}

void __55__AXUISettingsLabeledSliderCell_accessibilityDecrement__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 sliderView];
  [v1 handleSliderDidFinishDrag:v2];
}

- (void)accessibilityIncrement
{
  id v2 = [(AXUISettingsLabeledSliderCell *)self sliderView];
  [v2 accessibilityIncrement];

  AXPerformBlockAsynchronouslyOnMainThread();
}

void __55__AXUISettingsLabeledSliderCell_accessibilityIncrement__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 sliderView];
  [v1 handleSliderDidFinishDrag:v2];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(AXUISettingsLabeledSliderCell *)self isHidden])
  {
    v12.receiver = self;
    v12.super_class = (Class)AXUISettingsLabeledSliderCell;
    id v8 = -[AXUISettingsLabeledSliderCell hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  }
  else
  {
    v9 = [(AXUISettingsLabeledSliderCell *)self sliderView];
    id v10 = [(AXUISettingsLabeledSliderCell *)self sliderView];
    -[AXUISettingsLabeledSliderCell convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
    id v8 = objc_msgSend(v9, "hitTest:withEvent:", v7);
  }
  return v8;
}

- (void)setLabelText:(id)a3
{
  id v4 = a3;
  id v5 = [(AXUISettingsLabeledSliderCell *)self rightLabel];
  [v5 setText:v4];
}

- (id)accessibilityLabel
{
  v4.receiver = self;
  v4.super_class = (Class)AXUISettingsLabeledSliderCell;
  id v2 = [(AXUISettingsLabeledSliderCell *)&v4 accessibilityLabel];
  return v2;
}

- (double)maximumValue
{
  return 1.0;
}

- (double)minimumValue
{
  return 0.0;
}

- (double)initialValue
{
  return 0.5;
}

- (CGPoint)accessibilityActivationPoint
{
  id v2 = [(AXUISettingsLabeledSliderCell *)self sliderView];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)didChangeTraitPreferredContentSizeCategory
{
  id v3 = [(AXUISettingsLabeledSliderCell *)self rightLabel];
  [(AXUISettingsLabeledSliderCell *)self _updateLabelFont:v3];
}

- (UIView)leftView
{
  return self->_leftView;
}

- (void)setLeftView:(id)a3
{
}

- (UISlider)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
}

- (UIView)rightView
{
  return self->_rightView;
}

- (void)setRightView:(id)a3
{
}

- (UILabel)rightLabel
{
  return self->_rightLabel;
}

- (void)setRightLabel:(id)a3
{
}

- (BOOL)segmented
{
  return self->_segmented;
}

- (void)setSegmented:(BOOL)a3
{
  self->_segmented = a3;
}

- (UITraitChangeRegistration)traitRegistration
{
  return self->_traitRegistration;
}

- (void)setTraitRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitRegistration, 0);
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
}

@end