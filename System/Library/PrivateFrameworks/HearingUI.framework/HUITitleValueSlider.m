@interface HUITitleValueSlider
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (HUIStepSlider)slider;
- (HUITitleValueSlider)initWithEffect:(id)a3;
- (UILabel)titleLabel;
- (UILabel)valueLabel;
- (UIVisualEffectView)effectView;
- (id)_accessibilityUserTestingChildren;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setEffectView:(id)a3;
- (void)setSlider:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setValueLabel:(id)a3;
@end

@implementation HUITitleValueSlider

- (HUITitleValueSlider)initWithEffect:(id)a3
{
  id v68 = a3;
  v69.receiver = self;
  v69.super_class = (Class)HUITitleValueSlider;
  v4 = [(HUITitleValueSlider *)&v69 init];
  if (v4)
  {
    v5 = objc_alloc_init(HUIStepSlider);
    slider = v4->_slider;
    v4->_slider = v5;

    [(HUIStepSlider *)v4->_slider setIsAccessibilityElement:0];
    [(HUIStepSlider *)v4->_slider setMinimumValue:0.0];
    LODWORD(v7) = 1.0;
    [(HUIStepSlider *)v4->_slider setMaximumValue:v7];
    [(HUIStepSlider *)v4->_slider setContinuous:1];
    [(HUIStepSlider *)v4->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 0.5;
    [(HUIStepSlider *)v4->_slider setValue:v8];
    uint64_t v9 = [MEMORY[0x263F825C8] systemLightGrayColor];
    [(HUIStepSlider *)v4->_slider setMinimumTrackTintColor:v9];
    [(HUIStepSlider *)v4->_slider setMaximumTrackTintColor:v9];
    v67 = (void *)v9;
    [(HUIStepSlider *)v4->_slider setTickColor:v9];
    [(HUITitleValueSlider *)v4 addSubview:v4->_slider];
    v10 = v4;
    v11 = v10;
    if (v68)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v68];
      id v13 = v10[54];
      v10[54] = (id)v12;

      [v10[54] setTranslatesAutoresizingMaskIntoConstraints:0];
      [v10 addSubview:v10[54]];
      v11 = [v10[54] contentView];
    }
    uint64_t v14 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v10, "semanticContentAttribute"));
    BOOL v65 = v14 != 1;
    BOOL v15 = v14 == 1;
    id v16 = objc_alloc_init(MEMORY[0x263F828E0]);
    id v17 = v10[52];
    v10[52] = v16;

    v18 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835D0] addingSymbolicTraits:0x8000 options:0];
    id v19 = v10[52];
    v20 = (void *)MEMORY[0x263F81708];
    [v18 pointSize];
    v21 = objc_msgSend(v20, "fontWithDescriptor:size:", v18);
    [v19 setFont:v21];

    id v22 = v10[52];
    v23 = [MEMORY[0x263F825C8] clearColor];
    [v22 setBackgroundColor:v23];

    [v10[52] setTextAlignment:2 * v15];
    [v10[52] setNumberOfLines:0];
    [v10[52] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 addSubview:v10[52]];
    id v24 = objc_alloc_init(MEMORY[0x263F828E0]);
    id v25 = v10[53];
    v10[53] = v24;

    id v26 = v10[53];
    v27 = (void *)MEMORY[0x263F81708];
    [v18 pointSize];
    v28 = objc_msgSend(v27, "fontWithDescriptor:size:", v18);
    [v26 setFont:v28];

    id v29 = v10[53];
    v30 = [MEMORY[0x263F825C8] clearColor];
    [v29 setBackgroundColor:v30];

    [v10[53] setTextAlignment:2 * v65];
    [v10[53] setTranslatesAutoresizingMaskIntoConstraints:0];
    v66 = v11;
    [v11 addSubview:v10[53]];
    if (v68)
    {
      v31 = [v10[54] contentView];
      v32 = (void *)MEMORY[0x263F08938];
      v33 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelValu.isa, v10[52], v10[53], 0);
      v34 = [v32 constraintsWithVisualFormat:@"H:|[_titleLabel(>=75.0)]-[_valueLabel(>=75.0)]|" options:0 metrics:0 views:v33];
      [v31 addConstraints:v34];

      v35 = [v10[54] contentView];
      v36 = (void *)MEMORY[0x263F08938];
      v37 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, v10[52], 0);
      v38 = [v36 constraintsWithVisualFormat:@"V:|-[_titleLabel]-|" options:0 metrics:0 views:v37];
      [v35 addConstraints:v38];

      v39 = [v10[54] contentView];
      v40 = (void *)MEMORY[0x263F08938];
      v41 = _NSDictionaryOfVariableBindings(&cfstr_Valuelabel.isa, v10[53], 0);
      v42 = [v40 constraintsWithVisualFormat:@"V:|-[_valueLabel]-|" options:0 metrics:0 views:v41];
      [v39 addConstraints:v42];

      v43 = (void *)MEMORY[0x263F08938];
      v44 = _NSDictionaryOfVariableBindings(&cfstr_Effectview.isa, v10[54], 0);
      v45 = [v43 constraintsWithVisualFormat:@"H:|-[_effectView]-|" options:0 metrics:0 views:v44];
      [v10 addConstraints:v45];

      v46 = (void *)MEMORY[0x263F08938];
      v47 = _NSDictionaryOfVariableBindings(&cfstr_Slider.isa, v4->_slider, 0);
      v48 = [v46 constraintsWithVisualFormat:@"H:|-[_slider]-|" options:0 metrics:0 views:v47];
      [v10 addConstraints:v48];

      v49 = (void *)MEMORY[0x263F08938];
      v50 = _NSDictionaryOfVariableBindings(&cfstr_EffectviewSlid.isa, v10[54], v4->_slider, 0);
      v51 = @"V:|-[_effectView][_slider]-|";
    }
    else
    {
      id v52 = v10[52];
      v53 = [MEMORY[0x263F825C8] whiteColor];
      [v52 setTextColor:v53];

      id v54 = v10[53];
      v55 = [MEMORY[0x263F825C8] whiteColor];
      [v54 setTextColor:v55];

      v56 = (void *)MEMORY[0x263F08938];
      v57 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelValu.isa, v10[52], v10[53], 0);
      v58 = [v56 constraintsWithVisualFormat:@"H:|-[_titleLabel(>=75.0)]-[_valueLabel(>=75.0)]-|" options:0 metrics:0 views:v57];
      [v10 addConstraints:v58];

      v59 = (void *)MEMORY[0x263F08938];
      v60 = _NSDictionaryOfVariableBindings(&cfstr_Slider.isa, v4->_slider, 0);
      v61 = [v59 constraintsWithVisualFormat:@"H:|-[_slider]-|" options:0 metrics:0 views:v60];
      [v10 addConstraints:v61];

      v62 = [MEMORY[0x263F08938] constraintWithItem:v10[53] attribute:10 relatedBy:0 toItem:v10[52] attribute:10 multiplier:1.0 constant:0.0];
      [v10 addConstraint:v62];

      v49 = (void *)MEMORY[0x263F08938];
      v50 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelSlid.isa, v10[52], v4->_slider, 0);
      v51 = @"V:|-[_titleLabel]-[_slider]-|";
    }
    v63 = [v49 constraintsWithVisualFormat:v51 options:0 metrics:0 views:v50];
    [v10 addConstraints:v63];
  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  return [(HUIStepSlider *)self->_slider accessibilityTraits];
}

- (id)accessibilityHint
{
  return (id)[(HUIStepSlider *)self->_slider accessibilityHint];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  [(HUIStepSlider *)self->_slider accessibilityActivationPoint];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (id)_accessibilityUserTestingChildren
{
  v5[3] = *MEMORY[0x263EF8340];
  valueLabel = self->_valueLabel;
  v5[0] = self->_titleLabel;
  v5[1] = valueLabel;
  v5[2] = self->_slider;
  double v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  return v3;
}

- (HUIStepSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);
}

@end