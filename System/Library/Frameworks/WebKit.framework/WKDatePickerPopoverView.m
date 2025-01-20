@interface WKDatePickerPopoverView
- (CGSize)estimatedMaximumPopoverSize;
- (UIDatePicker)datePicker;
- (UIToolbar)accessoryView;
- (WKDatePickerPopoverView)initWithCalendarView:(id)a3 selectionWeekOfYear:(id)a4;
- (WKDatePickerPopoverView)initWithDatePicker:(id)a3;
- (id).cxx_construct;
- (id)calendarView;
- (void)setupView:(id)a3 toolbarBottomMargin:(double)a4;
@end

@implementation WKDatePickerPopoverView

- (void)setupView:(id)a3 toolbarBottomMargin:(double)a4
{
  v29[15] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F427D8] effectWithStyle:8];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v7];
  m_ptr = self->_backgroundView.m_ptr;
  self->_backgroundView.m_ptr = v8;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v10 = objc_opt_new();
  v11 = self->_accessoryView.m_ptr;
  self->_accessoryView.m_ptr = v10;
  if (v11) {
    CFRelease(v11);
  }
  [self->_backgroundView.m_ptr setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WKDatePickerPopoverView *)self addSubview:self->_backgroundView.m_ptr];
  [a3 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(a3, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  [a3 sizeToFit];
  objc_msgSend((id)objc_msgSend(self->_backgroundView.m_ptr, "contentView"), "addSubview:", a3);
  [self->_accessoryView.m_ptr setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = self->_accessoryView.m_ptr;
  v13 = objc_opt_new();
  [v13 setBackgroundEffect:0];
  [v12 setStandardAppearance:(id)CFMakeCollectable(v13)];
  [self->_accessoryView.m_ptr sizeToFit];
  objc_msgSend((id)objc_msgSend(self->_backgroundView.m_ptr, "contentView"), "addSubview:", self->_accessoryView.m_ptr);
  [a3 bounds];
  double v15 = v14;
  double v17 = v16;
  v18 = (PAL *)[self->_accessoryView.m_ptr bounds];
  double v21 = v20;
  if (v15 >= v19) {
    double v22 = v15;
  }
  else {
    double v22 = v19;
  }
  self->_contentSize.width = v22 + 32.0;
  self->_contentSize.height = a4 + 32.0 + v17 + v20;
  int IsVision = PAL::currentUserInterfaceIdiomIsVision(v18);
  v24 = (void *)MEMORY[0x1E4F28DC8];
  v29[1] = objc_msgSend((id)-[WKDatePickerPopoverView heightAnchor](self, "heightAnchor", objc_msgSend((id)-[WKDatePickerPopoverView widthAnchor](self, "widthAnchor"), "constraintEqualToConstant:", self->_contentSize.width)), "constraintEqualToConstant:", self->_contentSize.height);
  v29[2] = objc_msgSend((id)objc_msgSend(self->_backgroundView.m_ptr, "leadingAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView leadingAnchor](self, "leadingAnchor"));
  v29[3] = objc_msgSend((id)objc_msgSend(self->_backgroundView.m_ptr, "trailingAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView trailingAnchor](self, "trailingAnchor"));
  v29[4] = objc_msgSend((id)objc_msgSend(self->_backgroundView.m_ptr, "topAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView topAnchor](self, "topAnchor"));
  v29[5] = objc_msgSend((id)objc_msgSend(self->_backgroundView.m_ptr, "bottomAnchor"), "constraintEqualToAnchor:constant:", -[WKDatePickerPopoverView bottomAnchor](self, "bottomAnchor"), -a4);
  v29[6] = objc_msgSend((id)objc_msgSend(a3, "heightAnchor"), "constraintEqualToConstant:", v17);
  v29[7] = objc_msgSend((id)objc_msgSend(a3, "leadingAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView leadingAnchor](self, "leadingAnchor"));
  v29[8] = objc_msgSend((id)objc_msgSend(a3, "trailingAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView trailingAnchor](self, "trailingAnchor"));
  v29[9] = objc_msgSend((id)objc_msgSend(a3, "topAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView topAnchor](self, "topAnchor"));
  v29[10] = objc_msgSend((id)objc_msgSend(a3, "bottomAnchor"), "constraintEqualToSystemSpacingBelowAnchor:multiplier:", objc_msgSend(self->_accessoryView.m_ptr, "topAnchor"), 1.0);
  v25 = (void *)[self->_accessoryView.m_ptr leadingAnchor];
  uint64_t v26 = [(WKDatePickerPopoverView *)self leadingAnchor];
  if (IsVision) {
    double v27 = 16.0;
  }
  else {
    double v27 = 0.0;
  }
  if (IsVision) {
    double v28 = -16.0;
  }
  else {
    double v28 = 0.0;
  }
  v29[11] = [v25 constraintEqualToAnchor:v26 constant:v27];
  v29[12] = objc_msgSend((id)objc_msgSend(self->_accessoryView.m_ptr, "trailingAnchor"), "constraintEqualToAnchor:constant:", -[WKDatePickerPopoverView trailingAnchor](self, "trailingAnchor"), v28);
  v29[13] = objc_msgSend((id)objc_msgSend(self->_accessoryView.m_ptr, "heightAnchor"), "constraintEqualToConstant:", v21);
  v29[14] = objc_msgSend((id)objc_msgSend(self->_accessoryView.m_ptr, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(self->_backgroundView.m_ptr, "bottomAnchor"));
  objc_msgSend(v24, "activateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 15));
}

- (WKDatePickerPopoverView)initWithCalendarView:(id)a3 selectionWeekOfYear:(id)a4
{
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v13.receiver = self;
  v13.super_class = (Class)WKDatePickerPopoverView;
  v10 = -[WKDatePickerPopoverView initWithFrame:](&v13, sel_initWithFrame_, v6, v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_calendarView, a3);
    objc_msgSend(objc_loadWeak((id *)&v11->_calendarView), "setCalendar:", objc_msgSend(MEMORY[0x1E4F1C9A8], "calendarWithIdentifier:", *MEMORY[0x1E4F1C328]));
    [objc_loadWeak((id *)&v11->_calendarView) setSelectionBehavior:a4];
    [(WKDatePickerPopoverView *)v11 setupView:a3 toolbarBottomMargin:2.0];
  }
  return v11;
}

- (WKDatePickerPopoverView)initWithDatePicker:(id)a3
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v13.receiver = self;
  v13.super_class = (Class)WKDatePickerPopoverView;
  double v8 = -[WKDatePickerPopoverView initWithFrame:](&v13, sel_initWithFrame_, v4, v5, v6, v7);
  double v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_datePicker, a3);
    uint64_t v10 = [objc_loadWeak((id *)&v9->_datePicker) datePickerMode];
    double v11 = 2.0;
    if (v10 == 2) {
      double v11 = 8.0;
    }
    [(WKDatePickerPopoverView *)v9 setupView:a3 toolbarBottomMargin:v11];
  }
  return v9;
}

- (UIDatePicker)datePicker
{
  return (UIDatePicker *)objc_loadWeak((id *)&self->_datePicker);
}

- (id)calendarView
{
  return objc_loadWeak((id *)&self->_calendarView);
}

- (UIToolbar)accessoryView
{
  return (UIToolbar *)self->_accessoryView.m_ptr;
}

- (CGSize)estimatedMaximumPopoverSize
{
  double width = self->_contentSize.width;
  double v3 = self->_contentSize.height + 80.0;
  result.height = v3;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  m_ptr = self->_accessoryView.m_ptr;
  self->_accessoryView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  double v4 = self->_selectionWeekOfYear.m_ptr;
  self->_selectionWeekOfYear.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  objc_destroyWeak((id *)&self->_calendarView);
  objc_destroyWeak((id *)&self->_datePicker);
  double v5 = self->_backgroundView.m_ptr;
  self->_backgroundView.m_ptr = 0;
  if (v5)
  {
    CFRelease(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 51) = 0;
  *((void *)self + 54) = 0;
  *((void *)self + 55) = 0;
  return self;
}

@end