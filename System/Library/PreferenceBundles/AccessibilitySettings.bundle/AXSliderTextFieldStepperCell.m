@interface AXSliderTextFieldStepperCell
- (BOOL)shouldResizeTextFieldOnUpdate;
- (UISlider)slider;
- (void)_didUpdateSlider:(id)a3;
- (void)initializeView;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setSlider:(id)a3;
- (void)updateWithValue:(double)a3 shouldUpdateTextField:(BOOL)a4;
@end

@implementation AXSliderTextFieldStepperCell

- (void)initializeView
{
  v8.receiver = self;
  v8.super_class = (Class)AXSliderTextFieldStepperCell;
  [(AXSliderTextFieldStepperCell *)&v8 initializeView];
  v3 = [(AXSliderTextFieldStepperCell *)self slider];

  if (!v3)
  {
    v4 = objc_opt_new();
    [(AXSliderTextFieldStepperCell *)self setSlider:v4];

    v5 = [(AXSliderTextFieldStepperCell *)self slider];
    [v5 addTarget:self action:"_didUpdateSlider:" forControlEvents:4096];

    v6 = [(AXSliderTextFieldStepperCell *)self contentView];
    v7 = [(AXSliderTextFieldStepperCell *)self slider];
    [v6 addSubview:v7];
  }
}

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)AXSliderTextFieldStepperCell;
  [(AXSliderTextFieldStepperCell *)&v53 layoutSubviews];
  v3 = [(AXSliderTextFieldStepperCell *)self nameTextField];
  [v3 frame];
  CGFloat rect = v4;
  CGFloat rect_16 = v6;
  double rect_24 = v5;

  v7 = [(AXSliderTextFieldStepperCell *)self stepper];
  [v7 frame];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t rect_8 = v14;

  v15 = [(AXSliderTextFieldStepperCell *)self contentView];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(AXSliderTextFieldStepperCell *)self contentView];
  [v24 layoutMargins];
  double v26 = v17 + v25;
  double v28 = v19 + v27;
  double v30 = v21 - (v25 + v29);
  double v32 = v23 - (v27 + v31);

  v33 = +[UIFontMetrics defaultMetrics];
  [v33 scaledValueForValue:40.0];
  double v35 = v34;

  v36 = (char *)[UIApp userInterfaceLayoutDirection];
  uint64_t v37 = v9;
  uint64_t v38 = v11;
  uint64_t v39 = v13;
  uint64_t v40 = rect_8;
  if (v36 == (unsigned char *)&dword_0 + 1)
  {
    double v41 = CGRectGetMaxX(*(CGRect *)&v37) + 0.0;
    v54.origin.x = v41;
    double v42 = rect_16;
    v54.origin.y = rect_24;
    v54.size.width = v35;
    v54.size.height = rect_16;
    double v43 = CGRectGetMaxX(v54) + 20.0;
    v55.origin.x = v26;
    v55.origin.y = v28;
    v55.size.width = v30;
    v55.size.height = v32;
    double v44 = CGRectGetMaxX(v55) - v43;
  }
  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v37);
    v56.origin.x = rect;
    double v42 = rect_16;
    v56.origin.y = rect_24;
    v56.size.width = v35;
    v56.size.height = rect_16;
    double v46 = MinX - CGRectGetWidth(v56) + -20.0;
    v57.origin.x = v26;
    v57.origin.y = v28;
    v57.size.width = v30;
    v57.size.height = v32;
    double v44 = v46 - CGRectGetMinX(v57);
    v58.origin.x = v26;
    v58.origin.y = v28;
    v58.size.width = v44;
    v58.size.height = v32;
    double v41 = CGRectGetMaxX(v58) + 20.0;
    double v43 = v26;
  }
  v47 = [(AXSliderTextFieldStepperCell *)self nameTextField];
  objc_msgSend(v47, "setFrame:", v41, rect_24, v35, v42);

  v48 = [(AXSliderTextFieldStepperCell *)self slider];
  objc_msgSend(v48, "setFrame:", v43, v28, v44, v32);
}

- (void)setDelegate:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)AXSliderTextFieldStepperCell;
  [(AXSliderTextFieldStepperCell *)&v19 setDelegate:a3];
  double v4 = [(AXSliderTextFieldStepperCell *)self stepper];
  [v4 minimumValue];
  float v6 = v5;
  v7 = [(AXSliderTextFieldStepperCell *)self slider];
  *(float *)&double v8 = v6;
  [v7 setMinimumValue:v8];

  uint64_t v9 = [(AXSliderTextFieldStepperCell *)self stepper];
  [v9 maximumValue];
  float v11 = v10;
  uint64_t v12 = [(AXSliderTextFieldStepperCell *)self slider];
  *(float *)&double v13 = v11;
  [v12 setMaximumValue:v13];

  uint64_t v14 = [(AXSliderTextFieldStepperCell *)self stepper];
  [v14 value];
  float v16 = v15;
  double v17 = [(AXSliderTextFieldStepperCell *)self slider];
  *(float *)&double v18 = v16;
  [v17 setValue:v18];
}

- (BOOL)shouldResizeTextFieldOnUpdate
{
  return 0;
}

- (void)updateWithValue:(double)a3 shouldUpdateTextField:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AXSliderTextFieldStepperCell;
  [(AXSliderTextFieldStepperCell *)&v10 updateWithValue:a4 shouldUpdateTextField:a3];
  double v5 = [(AXSliderTextFieldStepperCell *)self stepper];
  [v5 value];
  float v7 = v6;
  double v8 = [(AXSliderTextFieldStepperCell *)self slider];
  *(float *)&double v9 = v7;
  [v8 setValue:v9];
}

- (void)_didUpdateSlider:(id)a3
{
  [a3 value];
  double v5 = roundf(v4);

  [(AXSliderTextFieldStepperCell *)self updateWithValue:1 shouldUpdateTextField:v5];
}

- (UISlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end