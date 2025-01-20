@interface EKRecurrenceMonthlyChooserController
- (BOOL)drawBackgroundForRow:(int64_t)a3;
- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence;
- (EKRecurrenceMonthlyChooserController)initWithDate:(id)a3;
- (double)heightForRow:(int64_t)a3;
- (id)_currentChooser;
- (id)backgroundColor;
- (id)cellForRow:(int64_t)a3;
- (int64_t)frequency;
- (int64_t)numberOfRows;
- (void)_selectRow:(int64_t)a3;
- (void)rowTapped:(int64_t)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3;
- (void)updateFromRecurrenceRule:(id)a3;
- (void)updateRecurrenceRuleBuilder:(id)a3;
@end

@implementation EKRecurrenceMonthlyChooserController

- (EKRecurrenceMonthlyChooserController)initWithDate:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EKRecurrenceMonthlyChooserController;
  v5 = [(EKRecurrenceChooserController *)&v21 initWithDate:v4];
  if (v5)
  {
    v6 = [[EKRecurrenceMonthDayChooserController alloc] initWithDate:v4];
    monthDayChooser = v5->_monthDayChooser;
    v5->_monthDayChooser = v6;

    v8 = [[EKRecurrenceOrdinalChooserController alloc] initWithDate:v4];
    ordinalChooser = v5->_ordinalChooser;
    v5->_ordinalChooser = v8;

    v10 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    onEachCell = v5->_onEachCell;
    v5->_onEachCell = &v10->super;

    v12 = EventKitUIBundle();
    v13 = [v12 localizedStringForKey:@"Each" value:&stru_1F0CC2140 table:0];
    v14 = [(UITableViewCell *)v5->_onEachCell textLabel];
    [v14 setText:v13];

    v15 = [(EKUITableViewCell *)[EKUIFullWidthDividerTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    onTheCell = v5->_onTheCell;
    v5->_onTheCell = &v15->super.super;

    v17 = EventKitUIBundle();
    v18 = [v17 localizedStringForKey:@"On the…" value:&stru_1F0CC2140 table:0];
    v19 = [(UITableViewCell *)v5->_onTheCell textLabel];
    [v19 setText:v18];
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  [(EKRecurrenceChooserController *)self->_monthDayChooser setDelegate:v5];
  [(EKRecurrenceChooserController *)self->_ordinalChooser setDelegate:v5];
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(EKRecurrenceMonthlyChooserController *)self _currentChooser];
  [v5 updateRecurrenceRuleBuilder:v4];
}

- (void)updateFromRecurrenceRule:(id)a3
{
  monthDayChooser = self->_monthDayChooser;
  id v5 = a3;
  [(EKRecurrenceMonthDayChooserController *)monthDayChooser updateFromRecurrenceRule:v5];
  [(EKRecurrenceOrdinalChooserController *)self->_ordinalChooser updateFromRecurrenceRule:v5];
  BOOL v6 = +[EKUICustomRecurrenceViewController isRecurrenceRuleOrdinal:v5];

  [(EKRecurrenceMonthlyChooserController *)self _selectRow:v6];
}

- (int64_t)frequency
{
  return 2;
}

- (id)_currentChooser
{
  if (self->_selectedRow) {
    v2 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__ordinalChooser;
  }
  else {
    v2 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__monthDayChooser;
  }
  return *(id *)((char *)&self->super.super.isa + *v2);
}

- (int64_t)numberOfRows
{
  return 3;
}

- (id)cellForRow:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v5 = 72;
  }
  else
  {
    if (a3 == 2)
    {
      v3 = [(EKRecurrenceMonthlyChooserController *)self _currentChooser];
      id v4 = [v3 cellForRow:0];

      goto LABEL_7;
    }
    uint64_t v5 = 64;
  }
  id v4 = *(id *)((char *)&self->super.super.isa + v5);
LABEL_7:

  return v4;
}

- (double)heightForRow:(int64_t)a3
{
  if (a3 != 2) {
    return *MEMORY[0x1E4FB2F28];
  }
  v3 = [(EKRecurrenceMonthlyChooserController *)self _currentChooser];
  [v3 heightForRow:0];
  double v5 = v4;

  return v5;
}

- (void)rowTapped:(int64_t)a3
{
  [(EKRecurrenceMonthlyChooserController *)self _selectRow:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained recurrenceChooser:self wantsRowReload:2];

  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = [(EKRecurrenceMonthlyChooserController *)self _currentChooser];
  [v6 recurrenceChooserUpdated:v5];
}

- (BOOL)drawBackgroundForRow:(int64_t)a3
{
  if (a3 != 2) {
    return 1;
  }
  v3 = [(EKRecurrenceMonthlyChooserController *)self _currentChooser];
  char v4 = [v3 drawBackgroundForRow:2];

  return v4;
}

- (void)_selectRow:(int64_t)a3
{
  self->_selectedRow = a3;
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    char v4 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__onEachCell;
    double v5 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__onTheCell;
  }
  else
  {
    char v4 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__onTheCell;
    double v5 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__onEachCell;
  }
  [*(id *)((char *)&self->super.super.isa + *v5) setAccessoryType:3];
  id v6 = *(Class *)((char *)&self->super.super.isa + *v4);

  [v6 setAccessoryType:0];
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  return [(EKRecurrenceMonthDayChooserController *)self->_monthDayChooser prohibitsMultipleDaysInMonthlyRecurrence];
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
}

- (id)backgroundColor
{
  v2 = [(EKRecurrenceMonthlyChooserController *)self _currentChooser];
  v3 = [v2 backgroundColor];

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  monthDayChooser = self->_monthDayChooser;
  id v5 = a3;
  [(EKRecurrenceChooserController *)monthDayChooser setBackgroundColor:v5];
  [(EKRecurrenceChooserController *)self->_ordinalChooser setBackgroundColor:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onTheCell, 0);
  objc_storeStrong((id *)&self->_onEachCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ordinalChooser, 0);

  objc_storeStrong((id *)&self->_monthDayChooser, 0);
}

@end