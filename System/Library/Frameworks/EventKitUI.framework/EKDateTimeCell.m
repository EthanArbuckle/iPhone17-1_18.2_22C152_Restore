@interface EKDateTimeCell
- (BOOL)usingMultiLineLayout;
- (EKDateTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (EKDateTimeCellDelegate)dateTimeDelegate;
- (void)_datePicker:(id)a3 didSelectComponent:(int64_t)a4;
- (void)_updateConstraints;
- (void)contentSizeCategoryChanged;
- (void)datePickerBeganEditing:(id)a3;
- (void)datePickerChanged:(id)a3;
- (void)datePickerEndedEditing:(id)a3;
- (void)didMoveToWindow;
- (void)handleTap;
- (void)replaceControlsWithPicker:(id)a3;
- (void)resetDatePickerSelection;
- (void)setDateTimeDelegate:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateWithDate:(id)a3 timeZone:(id)a4 allDay:(BOOL)a5 needsStrikethrough:(BOOL)a6;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation EKDateTimeCell

- (EKDateTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)EKDateTimeCell;
  v4 = [(EKDateTimeCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v6;

    v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v4->_titleLabel setFont:v8];

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v9) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:0 forAxis:v9];
    v10 = [(EKDateTimeCell *)v4 contentView];
    [v10 addSubview:v4->_titleLabel];

    v11 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E4FB16B0]);
    datePicker = v4->_datePicker;
    v4->_datePicker = v11;

    [(UIDatePicker *)v4->_datePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v13) = 1148846080;
    [(UIDatePicker *)v4->_datePicker setContentHuggingPriority:0 forAxis:v13];
    [(UIDatePicker *)v4->_datePicker setPreferredDatePickerStyle:2];
    [(UIDatePicker *)v4->_datePicker setDatePickerMode:2];
    [(UIDatePicker *)v4->_datePicker _setCompactStyleDelegate:v4];
    [(UIDatePicker *)v4->_datePicker addTarget:v4 action:sel_datePickerChanged_ forControlEvents:4096];
    [(UIDatePicker *)v4->_datePicker addTarget:v4 action:sel_datePickerBeganEditing_ forControlEvents:0x10000];
    [(UIDatePicker *)v4->_datePicker addTarget:v4 action:sel_datePickerEndedEditing_ forControlEvents:0x40000];
    v14 = [(EKDateTimeCell *)v4 contentView];
    [v14 addSubview:v4->_datePicker];

    [(EKDateTimeCell *)v4 _updateConstraints];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel_handleTap];
    gestureRecognizer = v4->_gestureRecognizer;
    v4->_gestureRecognizer = (UITapGestureRecognizer *)v15;

    [(EKDateTimeCell *)v4 addGestureRecognizer:v4->_gestureRecognizer];
  }
  return v4;
}

- (void)contentSizeCategoryChanged
{
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_titleLabel setFont:v3];

  [(EKDateTimeCell *)self _updateConstraints];
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3) {
    [(UIDatePicker *)self->_datePicker _compactStyleSetActiveComponent:self->_currentVisibleComponent];
  }
}

- (void)didMoveToWindow
{
  v3 = [(EKDateTimeCell *)self window];

  if (v3)
  {
    [(EKDateTimeCell *)self _updateConstraints];
  }
}

- (BOOL)usingMultiLineLayout
{
  return self->_usingMultiLineLayout;
}

- (void)_updateConstraints
{
  v37[6] = *MEMORY[0x1E4F143B8];
  if (self->_currentConstraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  if ((EKUICatalyst() & 1) != 0
    || !EKUIUsesLargeTextLayout(0) && EKUICurrentWindowWidthWithViewHierarchy(self) >= 375.0)
  {
    [(UIDatePicker *)self->_datePicker setContentHorizontalAlignment:5];
    v23 = (void *)MEMORY[0x1E4F28DC8];
    titleLabel = self->_titleLabel;
    v35 = [(EKDateTimeCell *)self contentView];
    v34 = objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", titleLabel, 5, 0, 1.0, 0.0);
    v36[0] = v34;
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v26 = self->_titleLabel;
    v33 = [(EKDateTimeCell *)self contentView];
    v32 = objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 10, 0, 1.0, 0.0);
    v36[1] = v32;
    v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_datePicker attribute:5 relatedBy:1 toItem:self->_titleLabel attribute:6 multiplier:1.0 constant:8.0];
    v36[2] = v7;
    v27 = (void *)MEMORY[0x1E4F28DC8];
    datePicker = self->_datePicker;
    v10 = [(EKDateTimeCell *)self contentView];
    v11 = [v27 constraintWithItem:datePicker attribute:10 relatedBy:0 toItem:v10 attribute:10 multiplier:1.0 constant:0.0];
    v36[3] = v11;
    v29 = (void *)MEMORY[0x1E4F28DC8];
    v30 = self->_datePicker;
    v14 = [(EKDateTimeCell *)self contentView];
    uint64_t v15 = [v29 constraintWithItem:v30 attribute:6 relatedBy:0 toItem:v14 attribute:18 multiplier:1.0 constant:0.0];
    v36[4] = v15;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:5];
    BOOL v22 = 0;
    currentConstraints = self->_currentConstraints;
    self->_currentConstraints = v31;
  }
  else
  {
    [(UIDatePicker *)self->_datePicker setContentHorizontalAlignment:4];
    v3 = (void *)MEMORY[0x1E4F28DC8];
    v4 = self->_titleLabel;
    v35 = [(EKDateTimeCell *)self contentView];
    v34 = objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 5, 0, 1.0, 0.0);
    v37[0] = v34;
    id v5 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v6 = self->_titleLabel;
    v33 = [(EKDateTimeCell *)self contentView];
    v32 = objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 3, 0, 1.0, 0.0);
    v37[1] = v32;
    v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_datePicker attribute:3 relatedBy:0 toItem:self->_titleLabel attribute:4 multiplier:1.0 constant:0.0];
    v37[2] = v7;
    v8 = (void *)MEMORY[0x1E4F28DC8];
    double v9 = self->_datePicker;
    v10 = [(EKDateTimeCell *)self contentView];
    v11 = [v8 constraintWithItem:v9 attribute:5 relatedBy:0 toItem:v10 attribute:17 multiplier:1.0 constant:0.0];
    v37[3] = v11;
    v12 = (void *)MEMORY[0x1E4F28DC8];
    double v13 = self->_datePicker;
    v14 = [(EKDateTimeCell *)self contentView];
    uint64_t v15 = [v12 constraintWithItem:v13 attribute:6 relatedBy:-1 toItem:v14 attribute:18 multiplier:1.0 constant:0.0];
    v37[4] = v15;
    v16 = (void *)MEMORY[0x1E4F28DC8];
    v17 = self->_datePicker;
    currentConstraints = [(EKDateTimeCell *)self contentView];
    v19 = [v16 constraintWithItem:v17 attribute:4 relatedBy:0 toItem:currentConstraints attribute:16 multiplier:1.0 constant:0.0];
    v37[5] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:6];
    v21 = self->_currentConstraints;
    self->_currentConstraints = v20;

    BOOL v22 = 1;
  }

  self->_usingMultiLineLayout = v22;
  [MEMORY[0x1E4F28DC8] activateConstraints:self->_currentConstraints];
}

- (void)setTitle:(id)a3
{
}

- (void)updateWithDate:(id)a3 timeZone:(id)a4 allDay:(BOOL)a5 needsStrikethrough:(BOOL)a6
{
  BOOL v6 = a6;
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a5) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  datePicker = self->_datePicker;
  id v11 = a4;
  id v12 = a3;
  [(UIDatePicker *)datePicker setDatePickerMode:v9];
  uint64_t v18 = *MEMORY[0x1E4FB0768];
  double v13 = [NSNumber numberWithBool:v6];
  v19[0] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  [(UIDatePicker *)self->_datePicker _setOverrideCompactTextAttributes:v14];

  uint64_t v15 = (void *)[v12 copy];
  [v15 setTimeZone:v11];
  v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v17 = [v16 dateFromComponents:v15];

  [(UIDatePicker *)self->_datePicker setDate:v17 animated:0];
  [(UIDatePicker *)self->_datePicker _setDisplaysTimeZone:v11 != 0];
  [(UIDatePicker *)self->_datePicker setTimeZone:v11];
}

- (void)resetDatePickerSelection
{
  self->_currentVisibleComponent = 0;
  [(UIDatePicker *)self->_datePicker _compactStyleSetActiveComponent:0];
}

- (void)replaceControlsWithPicker:(id)a3
{
  id v4 = a3;
  [(EKDateTimeCell *)self addSubview:v4];
  id v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  [v5 setActive:1];

  BOOL v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4 attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:0.0];

  [v6 setActive:1];
  datePicker = self->_datePicker;

  [(UIDatePicker *)datePicker setHidden:1];
}

- (void)handleTap
{
  gestureRecognizer = self->_gestureRecognizer;
  id v4 = [(EKDateTimeCell *)self contentView];
  [(UITapGestureRecognizer *)gestureRecognizer locationInView:v4];
  double v6 = v5;

  [(UIDatePicker *)self->_datePicker frame];
  CGFloat MaxX = CGRectGetMaxX(v13);
  uint64_t v8 = 2;
  if (v6 <= MaxX) {
    uint64_t v8 = 1;
  }
  int64_t currentVisibleComponent = self->_currentVisibleComponent;
  if (v8 == currentVisibleComponent) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10 != currentVisibleComponent)
  {
    [(EKDateTimeCell *)self _datePicker:self->_datePicker didSelectComponent:v10];
    datePicker = self->_datePicker;
    [(UIDatePicker *)datePicker _compactStyleSetActiveComponent:v10];
  }
}

- (void)datePickerChanged:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  double v6 = [v4 currentCalendar];
  v7 = [v5 timeZone];
  uint64_t v8 = [v5 date];

  id v12 = [v6 componentsInTimeZone:v7 fromDate:v8];

  [v12 setTimeZone:0];
  uint64_t v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v10 = [v9 dateFromComponents:v12];

  id v11 = [(EKDateTimeCell *)self dateTimeDelegate];
  [v11 dateTimeCell:self dateChanged:v10];
}

- (void)datePickerBeganEditing:(id)a3
{
  self->_isEditing = 1;
  id v4 = [(EKDateTimeCell *)self dateTimeDelegate];
  [v4 dateTimeCellBeganEditing:self];
}

- (void)datePickerEndedEditing:(id)a3
{
  self->_isEditing = 0;
  id v4 = [(EKDateTimeCell *)self dateTimeDelegate];
  [v4 dateTimeCellEndedEditing:self];
}

- (void)_datePicker:(id)a3 didSelectComponent:(int64_t)a4
{
  if (self->_currentVisibleComponent) {
    BOOL v6 = a4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    int64_t currentVisibleComponent = self->_currentVisibleComponent;
  }
  else {
    int64_t currentVisibleComponent = a4;
  }
  if (!self->_isEditing && (EKUICatalyst() & 1) == 0)
  {
    if (currentVisibleComponent == 2)
    {
      uint64_t v8 = [(EKDateTimeCell *)self dateTimeDelegate];
      [v8 dateTimeCellTimeTapped:self];
      goto LABEL_13;
    }
    if (currentVisibleComponent == 1)
    {
      uint64_t v8 = [(EKDateTimeCell *)self dateTimeDelegate];
      [v8 dateTimeCellDateTapped:self];
LABEL_13:
    }
  }
  self->_int64_t currentVisibleComponent = a4;
}

- (EKDateTimeCellDelegate)dateTimeDelegate
{
  return self->_dateTimeDelegate;
}

- (void)setDateTimeDelegate:(id)a3
{
  self->_dateTimeDelegate = (EKDateTimeCellDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end