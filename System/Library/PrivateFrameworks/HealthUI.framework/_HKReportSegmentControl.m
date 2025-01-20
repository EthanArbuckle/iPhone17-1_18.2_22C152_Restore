@interface _HKReportSegmentControl
- (BOOL)isOpaque;
- (CGSize)intrinsicContentSize;
- (HKBarButtonItemControl)rightControl;
- (UISegmentedControl)segmentControl;
- (UIView)dividerView;
- (_HKReportSegmentControl)initWithBackgroundColor:(id)a3 dividerColor:(id)a4 rightControl:(id)a5;
- (void)layoutSubviews;
@end

@implementation _HKReportSegmentControl

- (_HKReportSegmentControl)initWithBackgroundColor:(id)a3 dividerColor:(id)a4 rightControl:(id)a5
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_HKReportSegmentControl;
  v11 = [(_HKReportSegmentControl *)&v23 init];
  if (v11)
  {
    id v22 = v10;
    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v13 = [v12 localizedStringForKey:@"REPORT_FORMATTED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v24[0] = v13;
    v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v15 = [v14 localizedStringForKey:@"REPORT_RAW" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v24[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:v16];
    segmentControl = v11->_segmentControl;
    v11->_segmentControl = (UISegmentedControl *)v17;

    [(_HKReportSegmentControl *)v11 addSubview:v11->_segmentControl];
    [(UISegmentedControl *)v11->_segmentControl setSelectedSegmentIndex:0];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 1.0, 0.5);
    dividerView = v11->_dividerView;
    v11->_dividerView = (UIView *)v19;

    [(UIView *)v11->_dividerView setBackgroundColor:v9];
    [(_HKReportSegmentControl *)v11 addSubview:v11->_dividerView];
    objc_storeStrong((id *)&v11->_rightControl, a5);
    if (v11->_rightControl) {
      -[_HKReportSegmentControl addSubview:](v11, "addSubview:");
    }
    [(_HKReportSegmentControl *)v11 setBackgroundColor:v8];

    id v10 = v22;
  }

  return v11;
}

- (CGSize)intrinsicContentSize
{
  [(UISegmentedControl *)self->_segmentControl frame];
  double v3 = v2;
  double v5 = v4 + 12.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  [(_HKReportSegmentControl *)self frame];
  double v4 = v3;
  double v6 = v5;
  v7 = [(_HKReportSegmentControl *)self layoutMarginsGuide];
  [v7 layoutFrame];
  double v9 = v8;
  double v11 = v10;

  [(UISegmentedControl *)self->_segmentControl frame];
  double v13 = v12;
  [(UIView *)self->_dividerView frame];
  double v15 = v14;
  -[UISegmentedControl setFrame:](self->_segmentControl, "setFrame:", v4 * 0.5 - (v11 + v11) / 3.0 * 0.5, v6 * 0.5 - v13 * 0.5, (v11 + v11) / 3.0, v13);
  [(UISegmentedControl *)self->_segmentControl setWidth:0 forSegmentAtIndex:v11 / 3.0];
  [(UISegmentedControl *)self->_segmentControl setWidth:1 forSegmentAtIndex:v11 / 3.0];
  double v16 = v6 - v15;
  -[UIView setFrame:](self->_dividerView, "setFrame:", 0.0, v16, v4, v15);
  rightControl = self->_rightControl;
  if (rightControl)
  {
    [(HKBarButtonItemControl *)rightControl intrinsicContentSize];
    double v19 = v18 + -10.0;
    v20 = self->_rightControl;
    double v21 = v9 + v11 - v18 + -16.0;
    -[HKBarButtonItemControl setFrame:](v20, "setFrame:", v21, 0.0, v19, v16);
  }
}

- (BOOL)isOpaque
{
  return 1;
}

- (UISegmentedControl)segmentControl
{
  return self->_segmentControl;
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (HKBarButtonItemControl)rightControl
{
  return self->_rightControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightControl, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_segmentControl, 0);
}

@end