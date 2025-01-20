@interface PKPaletteErasingAttributesView
- (BOOL)_canShowWhileLocked;
- (BOOL)hideWeightPicker;
- (CGSize)intrinsicContentSize;
- (NSArray)hiddenThicknessPickerConstraints;
- (NSArray)visibleThicknessPickerConstraints;
- (PKPaletteErasingAttributesView)initWithFrame:(CGRect)a3;
- (UISegmentedControl)segmentedControl;
- (_PKInkThicknessPicker)thicknessPicker;
- (int64_t)eraserType;
- (void)_updateThicknessPickerToolConfiguration;
- (void)setEraserType:(int64_t)a3;
- (void)setHiddenThicknessPickerConstraints:(id)a3;
- (void)setHideWeightPicker:(BOOL)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setThicknessPicker:(id)a3;
- (void)setVisibleThicknessPickerConstraints:(id)a3;
@end

@implementation PKPaletteErasingAttributesView

- (PKPaletteErasingAttributesView)initWithFrame:(CGRect)a3
{
  v57[1] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)PKPaletteErasingAttributesView;
  v3 = -[PKPaletteErasingAttributesView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E4FB1C10]);
    segmentedControl = v3->_segmentedControl;
    v3->_segmentedControl = v4;

    [(UISegmentedControl *)v3->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteErasingAttributesView *)v3 addSubview:v3->_segmentedControl];
    v53 = +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:@"com.apple.ink.objectEraser"];
    v6 = (_PKInkThicknessPicker *)-[_PKInkThicknessPicker initWithToolConfiguration:]([_PKInkThicknessPicker alloc], v53);
    thicknessPicker = v3->_thicknessPicker;
    v3->_thicknessPicker = v6;

    [(_PKInkThicknessPicker *)v3->_thicknessPicker setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteErasingAttributesView *)v3 addSubview:v3->_thicknessPicker];
    v8 = [(UISegmentedControl *)v3->_segmentedControl bottomAnchor];
    v9 = [(PKPaletteErasingAttributesView *)v3 safeAreaLayoutGuide];
    v10 = [v9 bottomAnchor];
    v11 = [v8 constraintEqualToAnchor:v10 constant:-10.0];
    v57[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
    hiddenThicknessPickerConstraints = v3->_hiddenThicknessPickerConstraints;
    v3->_hiddenThicknessPickerConstraints = (NSArray *)v12;

    v51 = [(UISegmentedControl *)v3->_segmentedControl bottomAnchor];
    v49 = [(_PKInkThicknessPicker *)v3->_thicknessPicker topAnchor];
    v47 = [v51 constraintEqualToAnchor:v49 constant:-10.0];
    v56[0] = v47;
    v45 = [(_PKInkThicknessPicker *)v3->_thicknessPicker widthAnchor];
    v43 = [v45 constraintEqualToConstant:280.0];
    v56[1] = v43;
    v42 = [(_PKInkThicknessPicker *)v3->_thicknessPicker centerXAnchor];
    v41 = [(UISegmentedControl *)v3->_segmentedControl centerXAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v56[2] = v40;
    v39 = [(_PKInkThicknessPicker *)v3->_thicknessPicker leadingAnchor];
    v14 = [(UISegmentedControl *)v3->_segmentedControl leadingAnchor];
    v15 = [v39 constraintGreaterThanOrEqualToAnchor:v14];
    v56[3] = v15;
    v16 = [(_PKInkThicknessPicker *)v3->_thicknessPicker trailingAnchor];
    v17 = [(UISegmentedControl *)v3->_segmentedControl trailingAnchor];
    v18 = [v16 constraintLessThanOrEqualToAnchor:v17];
    v56[4] = v18;
    v19 = [(_PKInkThicknessPicker *)v3->_thicknessPicker bottomAnchor];
    v20 = [(PKPaletteErasingAttributesView *)v3 safeAreaLayoutGuide];
    v21 = [v20 bottomAnchor];
    v22 = [v19 constraintEqualToAnchor:v21 constant:-10.0];
    v56[5] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:6];
    visibleThicknessPickerConstraints = v3->_visibleThicknessPickerConstraints;
    v3->_visibleThicknessPickerConstraints = (NSArray *)v23;

    v44 = (void *)MEMORY[0x1E4F28DC8];
    v50 = [(UISegmentedControl *)v3->_segmentedControl topAnchor];
    v52 = [(PKPaletteErasingAttributesView *)v3 safeAreaLayoutGuide];
    v48 = [v52 topAnchor];
    v46 = [v50 constraintEqualToAnchor:v48 constant:10.0];
    v55[0] = v46;
    v25 = [(UISegmentedControl *)v3->_segmentedControl leadingAnchor];
    v26 = [(PKPaletteErasingAttributesView *)v3 safeAreaLayoutGuide];
    v27 = [v26 leadingAnchor];
    v28 = [v25 constraintEqualToAnchor:v27 constant:10.0];
    v55[1] = v28;
    v29 = [(UISegmentedControl *)v3->_segmentedControl trailingAnchor];
    v30 = [(PKPaletteErasingAttributesView *)v3 safeAreaLayoutGuide];
    v31 = [v30 trailingAnchor];
    v32 = [v29 constraintEqualToAnchor:v31 constant:-10.0];
    v55[2] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
    [v44 activateConstraints:v33];

    [MEMORY[0x1E4F28DC8] activateConstraints:v3->_visibleThicknessPickerConstraints];
    v34 = v3->_segmentedControl;
    v35 = PKPaletteEraserNameForEraserType(0);
    [(UISegmentedControl *)v34 insertSegmentWithTitle:v35 atIndex:0 animated:0];

    v36 = v3->_segmentedControl;
    v37 = PKPaletteEraserNameForEraserType(1);
    [(UISegmentedControl *)v36 insertSegmentWithTitle:v37 atIndex:1 animated:0];

    [(PKPaletteErasingAttributesView *)v3 setEraserType:1];
  }
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setHideWeightPicker:(BOOL)a3
{
  if (self->_hideWeightPicker != a3)
  {
    self->_hideWeightPicker = a3;
    if (a3)
    {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_visibleThicknessPickerConstraints];
      [(_PKInkThicknessPicker *)self->_thicknessPicker removeFromSuperview];
      v4 = &OBJC_IVAR___PKPaletteErasingAttributesView__hiddenThicknessPickerConstraints;
    }
    else
    {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_hiddenThicknessPickerConstraints];
      [(PKPaletteErasingAttributesView *)self addSubview:self->_thicknessPicker];
      v4 = &OBJC_IVAR___PKPaletteErasingAttributesView__visibleThicknessPickerConstraints;
    }
    [MEMORY[0x1E4F28DC8] activateConstraints:*(Class *)((char *)&self->super.super.super.isa + *v4)];
    [(PKPaletteErasingAttributesView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setEraserType:(int64_t)a3
{
  if ((a3 & 0x8000000000000000) == 0)
  {
    id v8 = [(PKPaletteErasingAttributesView *)self segmentedControl];
    if ([v8 numberOfSegments] <= (unint64_t)a3)
    {
    }
    else
    {
      v5 = [(PKPaletteErasingAttributesView *)self segmentedControl];
      uint64_t v6 = [v5 selectedSegmentIndex];

      if (v6 != a3)
      {
        v7 = [(PKPaletteErasingAttributesView *)self segmentedControl];
        [v7 setSelectedSegmentIndex:a3];

        [(PKPaletteErasingAttributesView *)self _updateThicknessPickerToolConfiguration];
      }
    }
  }
}

- (void)_updateThicknessPickerToolConfiguration
{
  int64_t v3 = [(PKPaletteErasingAttributesView *)self eraserType];
  v4 = PKInkIdentifierObjectEraser;
  if (v3 != 1) {
    v4 = PKInkIdentifierEraser;
  }
  id v5 = +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:*v4];
  -[_PKInkThicknessPicker setToolConfiguration:]((uint64_t)self->_thicknessPicker, v5);
  [(_PKInkThicknessPicker *)self->_thicknessPicker setUserInteractionEnabled:[(PKPaletteErasingAttributesView *)self eraserType] == 0];
}

- (int64_t)eraserType
{
  v2 = [(PKPaletteErasingAttributesView *)self segmentedControl];
  int64_t v3 = [v2 selectedSegmentIndex];

  return v3;
}

- (CGSize)intrinsicContentSize
{
  int64_t v3 = [(PKPaletteErasingAttributesView *)self segmentedControl];
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v5);
  double v7 = v6;
  double v9 = v8;

  if ([(PKPaletteErasingAttributesView *)self hideWeightPicker])
  {
    double v10 = v9 + 20.0;
  }
  else
  {
    v11 = [(PKPaletteErasingAttributesView *)self thicknessPicker];
    objc_msgSend(v11, "sizeThatFits:", v4, v5);
    double v13 = v12;
    double v15 = v14;

    if (v7 < v13) {
      double v7 = v13;
    }
    double v10 = v9 + 30.0 + v15;
  }
  double v16 = v7 + 20.0;
  result.height = v10;
  result.width = v16;
  return result;
}

- (BOOL)hideWeightPicker
{
  return self->_hideWeightPicker;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
}

- (_PKInkThicknessPicker)thicknessPicker
{
  return self->_thicknessPicker;
}

- (void)setThicknessPicker:(id)a3
{
}

- (NSArray)hiddenThicknessPickerConstraints
{
  return self->_hiddenThicknessPickerConstraints;
}

- (void)setHiddenThicknessPickerConstraints:(id)a3
{
}

- (NSArray)visibleThicknessPickerConstraints
{
  return self->_visibleThicknessPickerConstraints;
}

- (void)setVisibleThicknessPickerConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleThicknessPickerConstraints, 0);
  objc_storeStrong((id *)&self->_hiddenThicknessPickerConstraints, 0);
  objc_storeStrong((id *)&self->_thicknessPicker, 0);

  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end