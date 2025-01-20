@interface EKRecurrenceOrdinalPickerViewController
- (EKRecurrenceOrdinalPickerViewControllerDelegate)delegate;
- (id)_leftColumn;
- (id)_rightColumn;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (int)dayMask;
- (int)ordinalValue;
- (int64_t)dayOfWeekForRow:(int64_t)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)rowForDayOfWeek:(int64_t)a3;
- (void)loadView;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setDelegate:(id)a3;
- (void)updateFromRecurrenceRule:(id)a3;
- (void)updateRecurrenceRuleBuilder:(id)a3;
- (void)viewDidLoad;
@end

@implementation EKRecurrenceOrdinalPickerViewController

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1A98]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setDataSource:self];
  [v4 setDelegate:self];
  [(EKRecurrenceOrdinalPickerViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)EKRecurrenceOrdinalPickerViewController;
  [(EKRecurrenceOrdinalPickerViewController *)&v4 viewDidLoad];
  id v3 = [(EKRecurrenceOrdinalPickerViewController *)self pickerView];
  [v3 _setHostsLayoutEngine:0];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)dayOfWeekForRow:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 <= 6)
  {
    uint64_t v4 = CUIKZeroIndexedWeekStart();
    if (v4 + v3 <= 6) {
      v3 += v4;
    }
    else {
      return v4 + v3 - 7;
    }
  }
  return v3;
}

- (int64_t)rowForDayOfWeek:(int64_t)a3
{
  uint64_t v4 = CUIKZeroIndexedWeekStart();
  if (a3 >= v4) {
    return a3 - v4;
  }
  else {
    return a3 - v4 + 7;
  }
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = [(EKRecurrenceOrdinalPickerViewController *)self _rightColumn];
  }
  else
  {
    if (a4)
    {
      int64_t v9 = 0;
      goto LABEL_7;
    }
    v7 = [(EKRecurrenceOrdinalPickerViewController *)self _leftColumn];
  }
  v8 = v7;
  int64_t v9 = [v7 count];

LABEL_7:
  return v9;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = v11;
  if (v11)
  {
    if (a5)
    {
LABEL_3:
      v13 = [(EKRecurrenceOrdinalPickerViewController *)self _rightColumn];
      int64_t v14 = [(EKRecurrenceOrdinalPickerViewController *)self dayOfWeekForRow:a4];
      v15 = v13;
      goto LABEL_6;
    }
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v12 setTextAlignment:1];
    v16 = [MEMORY[0x1E4FB08E0] systemFontOfSize:21.0];
    [v12 setFont:v16];

    [v12 setAdjustsFontSizeToFitWidth:1];
    [v12 setMinimumScaleFactor:0.7];
    if (a5) {
      goto LABEL_3;
    }
  }
  v15 = [(EKRecurrenceOrdinalPickerViewController *)self _leftColumn];
  v13 = v15;
  int64_t v14 = a4;
LABEL_6:
  v17 = [v15 objectAtIndexedSubscript:v14];

  [v12 setText:v17];
  [v10 rowSizeForComponent:a5];
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v18 + -18.0, v19);

  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = [(EKRecurrenceOrdinalPickerViewController *)self delegate];
  [v6 frequencyPickerUpdated:self];
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setDays:", -[EKRecurrenceOrdinalPickerViewController dayMask](self, "dayMask"));
  objc_msgSend(v4, "setOrdinalValue:", -[EKRecurrenceOrdinalPickerViewController ordinalValue](self, "ordinalValue"));
}

- (void)updateFromRecurrenceRule:(id)a3
{
  id v14 = a3;
  id v4 = [v14 setPositions];
  v5 = [v4 firstObject];

  id v6 = [v14 daysOfTheWeek];
  if ([v6 count])
  {
    v7 = [v6 objectAtIndexedSubscript:0];
    if ([v6 count] == 1)
    {
      uint64_t v8 = [v7 dayOfTheWeek] - 1;
    }
    else if ([v14 isWeekendRule])
    {
      uint64_t v8 = 9;
    }
    else if ([v14 isWeekdayRule])
    {
      uint64_t v8 = 8;
    }
    else if ([v14 isAnyDayRule])
    {
      uint64_t v8 = 7;
    }
    else
    {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v9 = [v7 weekNumber];

    if (v5) {
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5) {
LABEL_14:
    }
      unint64_t v9 = [v5 integerValue];
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v10 = [(EKRecurrenceOrdinalPickerViewController *)self rowForDayOfWeek:v8];
    id v11 = [(EKRecurrenceOrdinalPickerViewController *)self pickerView];
    [v11 selectRow:v10 inComponent:1 animated:0];
  }
  if (v9 == -2)
  {
    uint64_t v12 = 5;
  }
  else
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_24;
    }
    if (v9 >= 6) {
      uint64_t v12 = 6;
    }
    else {
      uint64_t v12 = v9 - 1;
    }
  }
  v13 = [(EKRecurrenceOrdinalPickerViewController *)self pickerView];
  [v13 selectRow:v12 inComponent:0 animated:0];

LABEL_24:
}

- (int)dayMask
{
  int64_t v3 = [(EKRecurrenceOrdinalPickerViewController *)self pickerView];
  uint64_t v4 = [v3 selectedRowInComponent:1];

  if (v4 > 6)
  {
    if ((unint64_t)(v4 - 7) > 2) {
      return 0;
    }
    else {
      return dword_1B413AB38[v4 - 7];
    }
  }
  else
  {
    int64_t v5 = [(EKRecurrenceOrdinalPickerViewController *)self dayOfWeekForRow:v4] + 1;
    return +[EKRecurrenceChooserController dayFromNumber:v5];
  }
}

- (int)ordinalValue
{
  v2 = [(EKRecurrenceOrdinalPickerViewController *)self pickerView];
  int v3 = [v2 selectedRowInComponent:0];

  return v3 + 1;
}

- (id)_leftColumn
{
  if (_leftColumn_onceToken != -1) {
    dispatch_once(&_leftColumn_onceToken, &__block_literal_global_43);
  }
  v2 = (void *)_leftColumn___leftColumn;

  return v2;
}

void __54__EKRecurrenceOrdinalPickerViewController__leftColumn__block_invoke()
{
  v10[7] = *MEMORY[0x1E4F143B8];
  v0 = EventKitUIBundle();
  v1 = [v0 localizedStringForKey:@"first" value:&stru_1F0CC2140 table:0];
  v2 = objc_msgSend(v0, "localizedStringForKey:value:table:", @"second", &stru_1F0CC2140, 0, v1);
  v10[1] = v2;
  int v3 = [v0 localizedStringForKey:@"third" value:&stru_1F0CC2140 table:0];
  v10[2] = v3;
  uint64_t v4 = [v0 localizedStringForKey:@"fourth" value:&stru_1F0CC2140 table:0];
  v10[3] = v4;
  int64_t v5 = [v0 localizedStringForKey:@"fifth" value:&stru_1F0CC2140 table:0];
  v10[4] = v5;
  id v6 = [v0 localizedStringForKey:@"next to last" value:&stru_1F0CC2140 table:0];
  v10[5] = v6;
  v7 = [v0 localizedStringForKey:@"last" value:&stru_1F0CC2140 table:0];
  v10[6] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:7];
  unint64_t v9 = (void *)_leftColumn___leftColumn;
  _leftColumn___leftColumn = v8;
}

- (id)_rightColumn
{
  if (_rightColumn_onceToken != -1) {
    dispatch_once(&_rightColumn_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)_rightColumn___rightColumn;

  return v2;
}

void __55__EKRecurrenceOrdinalPickerViewController__rightColumn__block_invoke()
{
  v13[10] = *MEMORY[0x1E4F143B8];
  v0 = EventKitUIBundle();
  uint64_t v12 = CUIKStringForDayOfWeekNotStandalone();
  v13[0] = v12;
  v1 = CUIKStringForDayOfWeekNotStandalone();
  v13[1] = v1;
  v2 = CUIKStringForDayOfWeekNotStandalone();
  v13[2] = v2;
  int v3 = CUIKStringForDayOfWeekNotStandalone();
  v13[3] = v3;
  uint64_t v4 = CUIKStringForDayOfWeekNotStandalone();
  v13[4] = v4;
  int64_t v5 = CUIKStringForDayOfWeekNotStandalone();
  v13[5] = v5;
  id v6 = CUIKStringForDayOfWeekNotStandalone();
  v13[6] = v6;
  v7 = [v0 localizedStringForKey:@"day" value:&stru_1F0CC2140 table:0];
  v13[7] = v7;
  uint64_t v8 = [v0 localizedStringForKey:@"weekday" value:&stru_1F0CC2140 table:0];
  v13[8] = v8;
  unint64_t v9 = [v0 localizedStringForKey:@"weekend day" value:&stru_1F0CC2140 table:0];
  v13[9] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:10];
  id v11 = (void *)_rightColumn___rightColumn;
  _rightColumn___rightColumn = v10;
}

- (EKRecurrenceOrdinalPickerViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (EKRecurrenceOrdinalPickerViewControllerDelegate *)a3;
}

@end