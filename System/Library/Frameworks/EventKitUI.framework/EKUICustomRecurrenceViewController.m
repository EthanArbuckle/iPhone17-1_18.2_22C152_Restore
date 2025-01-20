@interface EKUICustomRecurrenceViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)isRecurrenceRuleOrdinal:(id)a3;
- (BOOL)_disallowsRecurrenceInterval;
- (BOOL)canManagePresentationStyle;
- (BOOL)canRequirePushOrPresentation;
- (BOOL)prefersPushForSizeClass:(int64_t)a3;
- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence;
- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence;
- (BOOL)prohibitsYearlyRecurrenceInterval;
- (BOOL)wantsManagement;
- (CGSize)calculatePreferredContentSize;
- (EKRecurrenceChooserController)currentChooser;
- (EKRecurrenceMonthChooserController)yearlyChooser;
- (EKRecurrenceMonthlyChooserController)monthlyChooser;
- (EKRecurrenceOrdinalChooserController)yearlyOrdinalChooser;
- (EKRecurrenceWeekdayChooserController)weeklyChooser;
- (EKUICustomRecurrenceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (EKUICustomRecurrenceViewController)initWithStartDate:(id)a3 timeZone:(id)a4 clearBackground:(BOOL)a5;
- (NSDate)startDate;
- (NSString)recurrenceSummaryString;
- (NSTimeZone)timeZone;
- (UISwitch)yearOrdinalSwitch;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_chooserForFrequency:(int64_t)a3;
- (id)_everyStringForFrequency:(int64_t)a3 interval:(int64_t)a4;
- (id)_stringForFrequency:(int64_t)a3;
- (id)_stringForFrequency:(int64_t)a3 interval:(int64_t)a4;
- (id)completionBlock;
- (id)frequencyPopupMenu;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (id)recurrenceRule;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_numberOfRowsForSection:(int64_t)a3;
- (int64_t)_tagForIndexPath:(id)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_createChoosersAndControls;
- (void)_frequencyPickerViewUpdated;
- (void)_refreshCacheAndPickers;
- (void)_setShowingIntervalPicker:(BOOL)a3;
- (void)_toggleInlineSpinnerForTag:(int64_t)a3;
- (void)_updateCustomPickerView;
- (void)_updateFrequencyRows;
- (void)_updateRecurrenceRule;
- (void)_updateSummaryLabel;
- (void)_updateTableSectionsFromFrequency:(int64_t)a3 toFrequency:(int64_t)a4;
- (void)_yearOrdinalSwitchChanged:(id)a3;
- (void)loadView;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)recurrenceChooser:(id)a3 wantsRowReload:(int64_t)a4;
- (void)recurrenceChooserWantsReload:(id)a3;
- (void)resetBackgroundColor;
- (void)setCompletionBlock:(id)a3;
- (void)setCurrentChooser:(id)a3;
- (void)setMonthlyChooser:(id)a3;
- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3;
- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3;
- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3;
- (void)setRecurrenceRule:(id)a3;
- (void)setRecurrenceRule:(id)a3 shouldUpdatePickers:(BOOL)a4;
- (void)setRecurrenceSummaryString:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setWeeklyChooser:(id)a3;
- (void)setYearOrdinalSwitch:(id)a3;
- (void)setYearlyChooser:(id)a3;
- (void)setYearlyOrdinalChooser:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKUICustomRecurrenceViewController

- (EKUICustomRecurrenceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)EKUICustomRecurrenceViewController;
  v4 = [(EKUICustomRecurrenceViewController *)&v13 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_cachedFrequency = 0;
    v4->_cachedInterval = 1;
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    v10 = EventKitUIBundle();
    v11 = [v10 localizedStringForKey:@"Custom" value:&stru_1F0CC2140 table:0];
    [(EKUICustomRecurrenceViewController *)v5 setTitle:v11];
  }
  return v5;
}

- (EKUICustomRecurrenceViewController)initWithStartDate:(id)a3 timeZone:(id)a4 clearBackground:(BOOL)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [(EKUICustomRecurrenceViewController *)self initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_timeZone, a4);
    v12->_useClearBackground = a5;
    [(EKUICustomRecurrenceViewController *)v12 _createChoosersAndControls];
    objc_initWeak(&location, v12);
    v19[0] = objc_opt_class();
    objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__EKUICustomRecurrenceViewController_initWithStartDate_timeZone_clearBackground___block_invoke;
    v16[3] = &unk_1E60874F8;
    objc_copyWeak(&v17, &location);
    id v14 = (id)[(EKUICustomRecurrenceViewController *)v12 registerForTraitChanges:v13 withHandler:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __81__EKUICustomRecurrenceViewController_initWithStartDate_timeZone_clearBackground___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetBackgroundColor];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(EKUICustomRecurrenceViewController *)self setTableView:v4];

  v5 = [(EKUICustomRecurrenceViewController *)self tableView];
  [v5 setDelegate:self];

  uint64_t v6 = [(EKUICustomRecurrenceViewController *)self tableView];
  [v6 setDataSource:self];

  v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v7 lineHeight];
  double v9 = v8;
  id v10 = [(EKUICustomRecurrenceViewController *)self tableView];
  [v10 setEstimatedRowHeight:v9];

  [(EKUICustomRecurrenceViewController *)self resetBackgroundColor];
  if (EKUIUnscaledCatalyst())
  {
    double v11 = EKUIUnscaledCatalystTableRowHeightDefault();
    v12 = [(EKUICustomRecurrenceViewController *)self tableView];
    [v12 setRowHeight:v11];

    objc_super v13 = [(EKUICustomRecurrenceViewController *)self tableView];
    [v13 setSeparatorStyle:1];
  }
  id v14 = [(EKUICustomRecurrenceViewController *)self tableView];
  [(EKUICustomRecurrenceViewController *)self setView:v14];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKUICustomRecurrenceViewController;
  [(EKUICustomRecurrenceViewController *)&v4 viewWillAppear:a3];
  [(EKUICustomRecurrenceViewController *)self calculatePreferredContentSize];
  -[EKUICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)resetBackgroundColor
{
  if (self->_useClearBackground || [(UIViewController *)self isPresentedInsidePopover])
  {
    id v5 = [(EKUICustomRecurrenceViewController *)self tableView];
    uint64_t v3 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    id v5 = [(EKUICustomRecurrenceViewController *)self tableView];
    uint64_t v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  objc_super v4 = (void *)v3;
  [v5 setBackgroundColor:v3];
}

- (CGSize)calculatePreferredContentSize
{
  [(UITableView *)self->_tableView layoutIfNeeded];
  -[UITableView systemLayoutSizeFittingSize:](self->_tableView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C70], *(double *)(MEMORY[0x1E4FB2C70] + 8));
  double v4 = v3;
  double v5 = EKUIContainedControllerIdealWidth();
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)_createChoosersAndControls
{
  double v3 = [[EKRecurrenceWeekdayChooserController alloc] initWithDate:self->_startDate];
  weeklyChooser = self->_weeklyChooser;
  self->_weeklyChooser = v3;

  [(EKRecurrenceChooserController *)self->_weeklyChooser setDelegate:self];
  double v5 = [[EKRecurrenceMonthlyChooserController alloc] initWithDate:self->_startDate];
  monthlyChooser = self->_monthlyChooser;
  self->_monthlyChooser = v5;

  [(EKRecurrenceMonthlyChooserController *)self->_monthlyChooser setDelegate:self];
  v7 = [[EKRecurrenceMonthChooserController alloc] initWithDate:self->_startDate];
  yearlyChooser = self->_yearlyChooser;
  self->_yearlyChooser = v7;

  [(EKRecurrenceChooserController *)self->_yearlyChooser setDelegate:self];
  double v9 = [[EKRecurrenceOrdinalChooserController alloc] initWithDate:self->_startDate];
  yearlyOrdinalChooser = self->_yearlyOrdinalChooser;
  self->_yearlyOrdinalChooser = v9;

  [(EKRecurrenceChooserController *)self->_yearlyOrdinalChooser setDelegate:self];
  double v11 = (UISwitch *)objc_opt_new();
  yearOrdinalSwitch = self->_yearOrdinalSwitch;
  self->_yearOrdinalSwitch = v11;

  [(UISwitch *)self->_yearOrdinalSwitch addTarget:self action:sel__yearOrdinalSwitchChanged_ forControlEvents:4096];
  objc_super v13 = [[EKUIPopupTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  frequencySummaryCell = self->_frequencySummaryCell;
  self->_frequencySummaryCell = v13;

  v15 = EventKitUIBundle();
  v16 = [v15 localizedStringForKey:@"Frequency" value:&stru_1F0CC2140 table:0];
  id v17 = [(EKUIPopupTableViewCell *)self->_frequencySummaryCell textLabel];
  [v17 setText:v16];

  v18 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  intervalSummaryCell = self->_intervalSummaryCell;
  self->_intervalSummaryCell = &v18->super;

  if (self->_useClearBackground)
  {
    v20 = [MEMORY[0x1E4FB1618] clearColor];
    [(EKRecurrenceMonthlyChooserController *)self->_monthlyChooser setBackgroundColor:v20];

    v21 = [MEMORY[0x1E4FB1618] clearColor];
    [(EKRecurrenceChooserController *)self->_yearlyChooser setBackgroundColor:v21];

    id v22 = [MEMORY[0x1E4FB1618] clearColor];
    [(EKRecurrenceChooserController *)self->_yearlyOrdinalChooser setBackgroundColor:v22];
  }
}

- (id)frequencyPopupMenu
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  double v4 = 0;
  do
  {
    double v5 = (void *)MEMORY[0x1E4FB13F0];
    double v6 = [(EKUICustomRecurrenceViewController *)self _stringForFrequency:v4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__EKUICustomRecurrenceViewController_frequencyPopupMenu__block_invoke;
    v10[3] = &unk_1E608AF40;
    objc_copyWeak(v11, &location);
    v11[1] = v4;
    v7 = [v5 actionWithTitle:v6 image:0 identifier:0 handler:v10];

    if (v4 == (char *)self->_cachedFrequency) {
      [v7 setState:1];
    }
    [v3 addObject:v7];

    objc_destroyWeak(v11);
    ++v4;
  }
  while (v4 != (char *)4);
  double v8 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v3];
  objc_destroyWeak(&location);

  return v8;
}

void __56__EKUICustomRecurrenceViewController_frequencyPopupMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  if (WeakRetained[122] != v3)
  {
    WeakRetained[122] = v3;
    double v4 = WeakRetained;
    [WeakRetained _frequencyPickerViewUpdated];
    id WeakRetained = v4;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(EKUICustomRecurrenceViewController *)self isBeingDismissed] & 1) != 0
    || [(EKUICustomRecurrenceViewController *)self isMovingFromParentViewController])
  {
    double v5 = [(EKUICustomRecurrenceViewController *)self completionBlock];
    double v6 = [(EKUICustomRecurrenceViewController *)self recurrenceRule];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)EKUICustomRecurrenceViewController;
  [(EKUICustomRecurrenceViewController *)&v7 viewWillDisappear:v3];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(EKUICustomRecurrenceViewController *)self _numberOfRowsForSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(EKUICustomRecurrenceViewController *)self _tagForIndexPath:v7];
  p_super = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
  [(EKUITableViewCell *)p_super setSelectionStyle:0];
  switch(v8)
  {
    case 1:
      id v10 = [(EKUICustomRecurrenceViewController *)self frequencyPopupMenu];
      [(EKUIPopupTableViewCell *)self->_frequencySummaryCell setPopupMenu:v10];

      double v11 = self->_frequencySummaryCell;
      p_super = &v11->super;
      break;
    case 2:
      v12 = self->_intervalSummaryCell;

      objc_super v13 = [(EKUICustomRecurrenceViewController *)self _everyStringForFrequency:self->_cachedFrequency interval:self->_cachedInterval];
      id v14 = [(UITableViewCell *)v12 textLabel];
      [v14 setText:v13];

      v15 = [(EKUICustomRecurrenceViewController *)self _stringForFrequency:self->_cachedFrequency interval:self->_cachedInterval];
      v16 = [(UITableViewCell *)v12 detailTextLabel];
      [v16 setText:v15];

      goto LABEL_14;
    case 3:
      if (!self->_intervalPicker)
      {
        id v17 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
        intervalPicker = self->_intervalPicker;
        self->_intervalPicker = v17;

        [(UIPickerView *)self->_intervalPicker setDelegate:self];
        [(UIPickerView *)self->_intervalPicker setDataSource:self];
        [(UIPickerView *)self->_intervalPicker setTranslatesAutoresizingMaskIntoConstraints:0];
      }
      v19 = [(EKUITableViewCell *)p_super contentView];
      [v19 addSubview:self->_intervalPicker];

      v20 = [(EKUITableViewCell *)p_super contentView];
      v21 = (void *)MEMORY[0x1E4F28DC8];
      id v22 = _NSDictionaryOfVariableBindings(&cfstr_Intervalpicker.isa, self->_intervalPicker, 0);
      v23 = [v21 constraintsWithVisualFormat:@"H:|[_intervalPicker]|" options:0 metrics:0 views:v22];
      [v20 addConstraints:v23];

      v24 = [(EKUITableViewCell *)p_super contentView];
      v25 = (void *)MEMORY[0x1E4F28DC8];
      v26 = _NSDictionaryOfVariableBindings(&cfstr_Intervalpicker.isa, self->_intervalPicker, 0);
      v27 = [v25 constraintsWithVisualFormat:@"V:|[_intervalPicker]|" options:0 metrics:0 views:v26];
      [v24 addConstraints:v27];

      int64_t v28 = self->_cachedInterval - 1;
      if ([(EKUICustomRecurrenceViewController *)self _disallowsRecurrenceInterval]) {
        uint64_t v29 = 1;
      }
      else {
        uint64_t v29 = v28;
      }
      [(UIPickerView *)self->_intervalPicker selectRow:v29 inComponent:0 animated:0];
      break;
    case 4:
      v30 = EventKitUIBundle();
      v31 = [v30 localizedStringForKey:@"Days of Week" value:&stru_1F0CC2140 table:0];
      v32 = [(EKUITableViewCell *)p_super textLabel];
      [v32 setText:v31];

      [(EKUITableViewCell *)p_super setAccessoryView:self->_yearOrdinalSwitch];
      break;
    case 5:
      v33 = [(EKUICustomRecurrenceViewController *)self yearlyOrdinalChooser];
      goto LABEL_13;
    case 6:
      v33 = [(EKUICustomRecurrenceViewController *)self currentChooser];
LABEL_13:
      v34 = v33;
      objc_msgSend(v33, "cellForRow:", objc_msgSend(v7, "row"));
      v12 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      p_super = (EKUITableViewCell *)v12;
      break;
    default:
      break;
  }
  if (EKUICatalyst())
  {
    v35 = [v6 backgroundColor];
    [(EKUITableViewCell *)p_super setBackgroundColor:v35];
  }

  return p_super;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t cachedFrequency = self->_cachedFrequency;
  int64_t v4 = 1;
  if (cachedFrequency) {
    int64_t v4 = 2;
  }
  if (cachedFrequency == 3) {
    return 3;
  }
  else {
    return v4;
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([(EKUICustomRecurrenceViewController *)self _tagForIndexPath:v7])
  {
    case 0:
    case 1:
    case 2:
    case 4:
      [v6 rowHeight];
      goto LABEL_3;
    case 3:
      double v9 = *MEMORY[0x1E4FB2F28];
      break;
    case 5:
      double v11 = [(EKUICustomRecurrenceViewController *)self yearlyOrdinalChooser];
      objc_msgSend(v11, "heightForRow:", objc_msgSend(v7, "row"));
      double v9 = v12;

      break;
    case 6:
      objc_super v13 = [(EKUICustomRecurrenceViewController *)self currentChooser];
      objc_msgSend(v13, "heightForRow:", objc_msgSend(v7, "row"));
      double v9 = v14;

      if (EKUIUnscaledCatalyst() && *MEMORY[0x1E4FB2F28] == v9)
      {
        double v8 = EKUIUnscaledCatalystTableRowHeightDefault();
LABEL_3:
        double v9 = v8;
      }
      break;
    default:
      double v9 = 0.0;
      break;
  }

  return v9;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [a3 cellForRowAtIndexPath:v5];
  if ([v6 selectionStyle]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  [a3 deselectRowAtIndexPath:v8 animated:1];
  int64_t v6 = [(EKUICustomRecurrenceViewController *)self _tagForIndexPath:v8];
  if (v6 == 2)
  {
    [(EKUICustomRecurrenceViewController *)self _toggleInlineSpinnerForTag:2];
  }
  else if (v6 == 6)
  {
    id v7 = [(EKUICustomRecurrenceViewController *)self currentChooser];
    objc_msgSend(v7, "rowTapped:", objc_msgSend(v8, "row"));
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    int64_t v6 = 0;
  }
  else
  {
    int64_t v6 = [(EKUICustomRecurrenceViewController *)self recurrenceSummaryString];
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v9 = a3;
  id v6 = a4;
  if (EKUICatalyst())
  {
    id v7 = [v9 backgroundColor];
    id v8 = [v6 contentView];
    [v8 setBackgroundColor:v7];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (self->_useClearBackground
    || [v9 section] == 1
    && ([(EKUICustomRecurrenceViewController *)self currentChooser],
        double v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = objc_msgSend(v14, "drawBackgroundForRow:", objc_msgSend(v10, "row")),
        v14,
        (v15 & 1) == 0))
  {
    double v11 = [MEMORY[0x1E4FB1618] clearColor];
    [v8 setBackgroundColor:v11];

    double v12 = [MEMORY[0x1E4FB1618] clearColor];
    objc_super v13 = [v8 backgroundView];
    [v13 setBackgroundColor:v12];
  }
}

- (void)_toggleInlineSpinnerForTag:(int64_t)a3
{
  uint64_t v5 = [(EKUICustomRecurrenceViewController *)self tableView];
  [v5 beginUpdates];

  if (a3 == 2) {
    [(EKUICustomRecurrenceViewController *)self _setShowingIntervalPicker:!self->_showingIntervalPicker];
  }
  id v6 = [(EKUICustomRecurrenceViewController *)self tableView];
  [v6 endUpdates];

  [(EKUICustomRecurrenceViewController *)self calculatePreferredContentSize];

  -[EKUICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_setShowingIntervalPicker:(BOOL)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (self->_showingIntervalPicker != a3)
  {
    BOOL v3 = a3;
    self->_BOOL showingIntervalPicker = a3;
    uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForRow:2 inSection:0];
    BOOL showingIntervalPicker = self->_showingIntervalPicker;
    id v7 = [(EKUICustomRecurrenceViewController *)self tableView];
    if (showingIntervalPicker)
    {
      v12[0] = v5;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v7 insertRowsAtIndexPaths:v8 withRowAnimation:6];
    }
    else
    {
      double v11 = v5;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
      [v7 deleteRowsAtIndexPaths:v8 withRowAnimation:6];
    }

    if (v3)
    {
      id v7 = [(EKUICustomRecurrenceViewController *)self view];
      [v7 tintColor];
    }
    else
    {
      [MEMORY[0x1E4FB1618] tableCellGrayTextColor];
    id v9 = };
    id v10 = [(UITableViewCell *)self->_intervalSummaryCell detailTextLabel];
    [v10 setTextColor:v9];

    if (v3)
    {

      id v9 = v7;
    }
  }
}

- (void)recurrenceChooserWantsReload:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__EKUICustomRecurrenceViewController_recurrenceChooserWantsReload___block_invoke;
  v3[3] = &unk_1E6087570;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

void __67__EKUICustomRecurrenceViewController_recurrenceChooserWantsReload___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  v1 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
  [v2 reloadSections:v1 withRowAnimation:0];
}

- (void)recurrenceChooser:(id)a3 wantsRowReload:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__EKUICustomRecurrenceViewController_recurrenceChooser_wantsRowReload___block_invoke;
  v4[3] = &unk_1E6087E70;
  v4[4] = self;
  v4[5] = a4;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
}

void __71__EKUICustomRecurrenceViewController_recurrenceChooser_wantsRowReload___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) tableView];
  BOOL v3 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(a1 + 40) inSection:1];
  v5[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 reloadRowsAtIndexPaths:v4 withRowAnimation:0];
}

- (void)_updateRecurrenceRule
{
  int64_t cachedFrequency = self->_cachedFrequency;
  int64_t cachedInterval = self->_cachedInterval;
  id v12 = (id)objc_opt_new();
  uint64_t v5 = [(EKUICustomRecurrenceViewController *)self currentChooser];
  id v6 = v5;
  if (v5)
  {
    int64_t cachedFrequency = [v5 frequency];
    [v6 updateRecurrenceRuleBuilder:v12];
  }
  [v12 setFrequency:cachedFrequency];
  [v12 setInterval:cachedInterval];
  id v7 = [(EKUICustomRecurrenceViewController *)self yearlyChooser];
  if (v6 == v7)
  {
    id v8 = [(EKUICustomRecurrenceViewController *)self yearOrdinalSwitch];
    int v9 = [v8 isOn];

    if (!v9) {
      goto LABEL_7;
    }
    id v7 = [(EKUICustomRecurrenceViewController *)self yearlyOrdinalChooser];
    [v7 updateRecurrenceRuleBuilder:v12];
  }

LABEL_7:
  id v10 = [v12 recurrenceRule];
  objc_msgSend(v10, "setFirstDayOfTheWeek:", -[EKRecurrenceRule firstDayOfTheWeek](self->_cachedRecurrenceRule, "firstDayOfTheWeek"));
  double v11 = [(EKRecurrenceRule *)self->_cachedRecurrenceRule recurrenceEnd];
  [v10 setRecurrenceEnd:v11];

  [(EKUICustomRecurrenceViewController *)self setRecurrenceRule:v10 shouldUpdatePickers:0];
}

- (id)recurrenceRule
{
  cachedRecurrenceRule = self->_cachedRecurrenceRule;
  if (!cachedRecurrenceRule)
  {
    [(EKUICustomRecurrenceViewController *)self _updateRecurrenceRule];
    cachedRecurrenceRule = self->_cachedRecurrenceRule;
  }

  return cachedRecurrenceRule;
}

- (void)setRecurrenceRule:(id)a3
{
}

- (void)setRecurrenceRule:(id)a3 shouldUpdatePickers:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (EKRecurrenceRule *)a3;
  if (self->_cachedRecurrenceRule != v7)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_cachedRecurrenceRule, a3);
    id v7 = v8;
    if (v8)
    {
      [(EKUICustomRecurrenceViewController *)self _updateSummaryLabel];
      id v7 = v8;
    }
    if (v4)
    {
      [(EKUICustomRecurrenceViewController *)self _refreshCacheAndPickers];
      id v7 = v8;
    }
  }
}

- (void)_refreshCacheAndPickers
{
  self->_int64_t cachedInterval = [(EKRecurrenceRule *)self->_cachedRecurrenceRule interval];
  self->_int64_t cachedFrequency = [(EKRecurrenceRule *)self->_cachedRecurrenceRule frequency];
  uint64_t v3 = [(id)objc_opt_class() isRecurrenceRuleOrdinal:self->_cachedRecurrenceRule];
  [(EKUICustomRecurrenceViewController *)self _updateCustomPickerView];
  if ([(EKRecurrenceRule *)self->_cachedRecurrenceRule frequency] == EKRecurrenceFrequencyYearly)
  {
    id v4 = [(EKUICustomRecurrenceViewController *)self yearOrdinalSwitch];
    [v4 setOn:v3];
  }
}

+ (BOOL)isRecurrenceRuleOrdinal:(id)a3
{
  id v3 = a3;
  id v4 = [v3 setPositions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else if ([v3 frequency] == 2 || objc_msgSend(v3, "frequency") == 3)
  {
    id v7 = [v3 daysOfTheWeek];
    BOOL v6 = [v7 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  id v2 = [(EKUICustomRecurrenceViewController *)self monthlyChooser];
  char v3 = [v2 prohibitsMultipleDaysInMonthlyRecurrence];

  return v3;
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKUICustomRecurrenceViewController *)self monthlyChooser];
  [v4 setProhibitsMultipleDaysInMonthlyRecurrence:v3];
}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  id v2 = [(EKUICustomRecurrenceViewController *)self yearlyChooser];
  char v3 = [v2 prohibitsMultipleMonthsInYearlyRecurrence];

  return v3;
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKUICustomRecurrenceViewController *)self yearlyChooser];
  [v4 setProhibitsMultipleMonthsInYearlyRecurrence:v3];
}

- (void)_updateSummaryLabel
{
  BOOL v3 = [(EKUICustomRecurrenceViewController *)self recurrenceRule];
  id v4 = [(EKUICustomRecurrenceViewController *)self startDate];
  uint64_t v5 = CUIKStringForRecurrenceRuleAndDate();
  [(EKUICustomRecurrenceViewController *)self setRecurrenceSummaryString:v5];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__EKUICustomRecurrenceViewController__updateSummaryLabel__block_invoke;
  v6[3] = &unk_1E6087570;
  v6[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
}

void __57__EKUICustomRecurrenceViewController__updateSummaryLabel__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  BOOL v3 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v2 _reloadSectionHeaderFooters:v3 withRowAnimation:0];

  id v5 = [*(id *)(a1 + 32) tableView];
  id v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v5 _reloadSectionHeaderFooters:v4 withRowAnimation:0];
}

- (void)_updateCustomPickerView
{
  BOOL v3 = [(EKUICustomRecurrenceViewController *)self currentChooser];
  uint64_t v4 = [v3 frequency];

  id v5 = [(EKUICustomRecurrenceViewController *)self _chooserForFrequency:self->_cachedFrequency];
  [(EKUICustomRecurrenceViewController *)self setCurrentChooser:v5];

  BOOL v6 = [(EKUICustomRecurrenceViewController *)self currentChooser];
  uint64_t v7 = [v6 frequency];

  id v8 = [(EKUICustomRecurrenceViewController *)self currentChooser];
  [v8 updateFromRecurrenceRule:self->_cachedRecurrenceRule];

  [(EKUICustomRecurrenceViewController *)self _updateTableSectionsFromFrequency:v4 toFrequency:v7];
}

- (void)_updateTableSectionsFromFrequency:(int64_t)a3 toFrequency:(int64_t)a4
{
  uint64_t v7 = [(EKUICustomRecurrenceViewController *)self tableView];
  [v7 beginUpdates];

  if (a3 == 3 || a4 != 3)
  {
    if (a3 == 3 && a4 != 3)
    {
      objc_super v13 = [(EKUICustomRecurrenceViewController *)self tableView];
      double v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:2];
      [v13 deleteSections:v14 withRowAnimation:6];

      BOOL v10 = a4 != 0;
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = [(EKUICustomRecurrenceViewController *)self tableView];
    int v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:2];
    [v8 insertSections:v9 withRowAnimation:6];
  }
  BOOL v10 = a4 != 0;
  if (!a3 && a4)
  {
    double v11 = [(EKUICustomRecurrenceViewController *)self tableView];
    id v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v11 insertSections:v12 withRowAnimation:6];
LABEL_13:

    goto LABEL_14;
  }
LABEL_10:
  if (a3 && !a4)
  {
    double v11 = [(EKUICustomRecurrenceViewController *)self tableView];
    id v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v11 deleteSections:v12 withRowAnimation:6];
    goto LABEL_13;
  }
  char v16 = !v10;
  if (a3 == a4) {
    char v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__EKUICustomRecurrenceViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke;
    v17[3] = &unk_1E6087570;
    v17[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v17];
  }
LABEL_14:
  char v15 = [(EKUICustomRecurrenceViewController *)self tableView];
  [v15 endUpdates];

  [(EKUICustomRecurrenceViewController *)self calculatePreferredContentSize];
  -[EKUICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

void __84__EKUICustomRecurrenceViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  v1 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
  [v2 reloadSections:v1 withRowAnimation:0];
}

- (void)_updateFrequencyRows
{
  v7[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:0];
  id v5 = [(EKUICustomRecurrenceViewController *)self tableView];
  v7[0] = v3;
  v7[1] = v4;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  [v5 reloadRowsAtIndexPaths:v6 withRowAnimation:5];
}

- (void)_frequencyPickerViewUpdated
{
  [(EKUICustomRecurrenceViewController *)self _updateCustomPickerView];
  [(EKUICustomRecurrenceViewController *)self _updateRecurrenceRule];
  [(EKUICustomRecurrenceViewController *)self _updateFrequencyRows];
  intervalPicker = self->_intervalPicker;

  [(UIPickerView *)intervalPicker reloadAllComponents];
}

- (id)_chooserForFrequency:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      BOOL v3 = [(EKUICustomRecurrenceViewController *)self yearlyChooser];
      break;
    case 2:
      BOOL v3 = [(EKUICustomRecurrenceViewController *)self monthlyChooser];
      break;
    case 1:
      BOOL v3 = [(EKUICustomRecurrenceViewController *)self weeklyChooser];
      break;
    default:
      BOOL v3 = 0;
      break;
  }

  return v3;
}

- (void)_yearOrdinalSwitchChanged:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F28D58];
  id v5 = a3;
  BOOL v6 = [v4 indexPathForRow:1 inSection:2];
  int v7 = [v5 isOn];

  id v8 = [(EKUICustomRecurrenceViewController *)self tableView];
  if (v7)
  {
    v12[0] = v6;
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v8 insertRowsAtIndexPaths:v9 withRowAnimation:6];

    id v8 = [(EKUICustomRecurrenceViewController *)self tableView];
    [v8 scrollToRowAtIndexPath:v6 atScrollPosition:3 animated:1];
  }
  else
  {
    double v11 = v6;
    BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v8 deleteRowsAtIndexPaths:v10 withRowAnimation:6];
  }
  [(EKUICustomRecurrenceViewController *)self _updateRecurrenceRule];
}

- (id)_stringForFrequency:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
  {
    CUIKStringForRepeatType();
    self = (EKUICustomRecurrenceViewController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_stringForFrequency:(int64_t)a3 interval:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      if (a4 <= 1)
      {
        id v5 = EventKitUIBundle();
        BOOL v6 = v5;
        int v7 = @"Custom recurrence frequency day";
        id v8 = @"Day";
        goto LABEL_11;
      }
      BOOL v10 = NSString;
      double v11 = EventKitUIBundle();
      BOOL v6 = v11;
      id v12 = @"repeat_interval_days";
      goto LABEL_16;
    case 1:
      if (a4 <= 1)
      {
        id v5 = EventKitUIBundle();
        BOOL v6 = v5;
        int v7 = @"Custom recurrence frequency week";
        id v8 = @"Week";
        goto LABEL_11;
      }
      BOOL v10 = NSString;
      double v11 = EventKitUIBundle();
      BOOL v6 = v11;
      id v12 = @"repeat_interval_weeks";
      goto LABEL_16;
    case 2:
      if (a4 <= 1)
      {
        id v5 = EventKitUIBundle();
        BOOL v6 = v5;
        int v7 = @"Custom recurrence frequency month";
        id v8 = @"Month";
        goto LABEL_11;
      }
      BOOL v10 = NSString;
      double v11 = EventKitUIBundle();
      BOOL v6 = v11;
      id v12 = @"repeat_interval_months";
      goto LABEL_16;
    case 3:
      if (a4 > 1)
      {
        BOOL v10 = NSString;
        double v11 = EventKitUIBundle();
        BOOL v6 = v11;
        id v12 = @"repeat_interval_years";
LABEL_16:
        objc_super v13 = [v11 localizedStringForKey:v12 value:&stru_1F0CC2140 table:0];
        int v9 = objc_msgSend(v10, "localizedStringWithFormat:", v13, a4);
      }
      else
      {
        id v5 = EventKitUIBundle();
        BOOL v6 = v5;
        int v7 = @"Custom recurrence frequency year";
        id v8 = @"Year";
LABEL_11:
        int v9 = [v5 localizedStringForKey:v7 value:v8 table:0];
      }

LABEL_18:
      return v9;
    default:
      int v9 = 0;
      goto LABEL_18;
  }
}

- (id)_everyStringForFrequency:(int64_t)a3 interval:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      if (a4 <= 1)
      {
        id v5 = EventKitUIBundle();
        BOOL v6 = v5;
        int v7 = @"Custom recurrence frequency day every string";
        goto LABEL_11;
      }
      int v9 = NSString;
      BOOL v10 = EventKitUIBundle();
      BOOL v6 = v10;
      double v11 = @"every_interval_days";
      goto LABEL_16;
    case 1:
      if (a4 <= 1)
      {
        id v5 = EventKitUIBundle();
        BOOL v6 = v5;
        int v7 = @"Custom recurrence frequency week every string";
        goto LABEL_11;
      }
      int v9 = NSString;
      BOOL v10 = EventKitUIBundle();
      BOOL v6 = v10;
      double v11 = @"every_interval_weeks";
      goto LABEL_16;
    case 2:
      if (a4 <= 1)
      {
        id v5 = EventKitUIBundle();
        BOOL v6 = v5;
        int v7 = @"Custom recurrence frequency month every string";
        goto LABEL_11;
      }
      int v9 = NSString;
      BOOL v10 = EventKitUIBundle();
      BOOL v6 = v10;
      double v11 = @"every_interval_months";
      goto LABEL_16;
    case 3:
      if (a4 > 1)
      {
        int v9 = NSString;
        BOOL v10 = EventKitUIBundle();
        BOOL v6 = v10;
        double v11 = @"every_interval_years";
LABEL_16:
        id v12 = [v10 localizedStringForKey:v11 value:&stru_1F0CC2140 table:0];
        id v8 = objc_msgSend(v9, "localizedStringWithFormat:", v12, a4);
      }
      else
      {
        id v5 = EventKitUIBundle();
        BOOL v6 = v5;
        int v7 = @"Custom recurrence frequency year every string";
LABEL_11:
        id v8 = [v5 localizedStringForKey:v7 value:@"Every" table:0];
      }

LABEL_18:
      return v8;
    default:
      id v8 = 0;
      goto LABEL_18;
  }
}

- (int64_t)_tagForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  if (v6 == 2)
  {
    if (self->_cachedFrequency == 3)
    {
      if (v5) {
        return 5;
      }
      else {
        return 4;
      }
    }
    return 0;
  }
  if (v6 == 1) {
    return 6;
  }
  if (v6) {
    return 0;
  }
  if (!v5) {
    return 1;
  }
  if (v5 != 2)
  {
    if (v5 == 1) {
      return 2;
    }
    return 0;
  }
  if (self->_showingIntervalPicker) {
    return 3;
  }
  else {
    return 0;
  }
}

- (int64_t)_numberOfRowsForSection:(int64_t)a3
{
  if (a3 == 2)
  {
    if (self->_cachedFrequency == 3)
    {
      int v7 = [(EKUICustomRecurrenceViewController *)self yearOrdinalSwitch];
      if ([v7 isOn]) {
        int64_t v3 = 2;
      }
      else {
        int64_t v3 = 1;
      }

      return v3;
    }
    return 0;
  }
  if (a3 == 1)
  {
    id v4 = [(EKUICustomRecurrenceViewController *)self currentChooser];
    int64_t v5 = [v4 numberOfRows];

    return v5;
  }
  if (a3) {
    return 0;
  }
  return self->_showingIntervalPicker | 2;
}

- (BOOL)_disallowsRecurrenceInterval
{
  BOOL v3 = [(EKUICustomRecurrenceViewController *)self prohibitsYearlyRecurrenceInterval];
  if (v3) {
    LOBYTE(v3) = self->_cachedFrequency == 3;
  }
  return v3;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  if ([(EKUICustomRecurrenceViewController *)self _disallowsRecurrenceInterval])
  {
    return 1;
  }
  return 999;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = v10;
  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v11 setTextAlignment:1];
    id v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:21.0];
    [v11 setFont:v12];

    [v11 setAdjustsFontSizeToFitWidth:1];
    [v11 setMinimumScaleFactor:0.7];
  }
  if (a5 == 1)
  {
    uint64_t v14 = [v9 selectedRowInComponent:0] + 1;
    switch(self->_cachedFrequency)
    {
      case 0:
        char v15 = NSString;
        char v16 = EventKitUIBundle();
        id v17 = v16;
        v18 = @"days";
        break;
      case 1:
        char v15 = NSString;
        char v16 = EventKitUIBundle();
        id v17 = v16;
        v18 = @"weeks";
        break;
      case 2:
        char v15 = NSString;
        char v16 = EventKitUIBundle();
        id v17 = v16;
        v18 = @"months";
        break;
      case 3:
        char v15 = NSString;
        char v16 = EventKitUIBundle();
        id v17 = v16;
        v18 = @"years";
        break;
      default:
        goto LABEL_8;
    }
    v19 = [v16 localizedStringForKey:v18 value:&stru_1F0CC2140 table:0];
    objc_super v13 = objc_msgSend(v15, "localizedStringWithFormat:", v19, v14);
  }
  else if (a5)
  {
LABEL_8:
    objc_super v13 = 0;
  }
  else
  {
    objc_super v13 = CUIKLocalizedStringForInteger();
  }
  [v11 setText:v13];
  [v9 rowSizeForComponent:a5];
  objc_msgSend(v11, "setFrame:", 0.0, 0.0, v20 + -18.0, v21);

  return v11;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7 = a3;
  self->_int64_t cachedInterval = [v7 selectedRowInComponent:0] + 1;
  [(EKUICustomRecurrenceViewController *)self _frequencyPickerViewUpdated];
  if (!a5) {
    [v7 reloadComponent:1];
  }
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 0;
}

- (BOOL)prefersPushForSizeClass:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return EKUIUseLargeFormatPhoneUI();
  }
}

- (BOOL)canRequirePushOrPresentation
{
  return 1;
}

- (BOOL)prohibitsYearlyRecurrenceInterval
{
  return self->_prohibitsYearlyRecurrenceInterval;
}

- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3
{
  self->_prohibitsYearlyRecurrenceInterval = a3;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 1040, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (UITableView)tableView
{
  return (UITableView *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setTableView:(id)a3
{
}

- (EKRecurrenceChooserController)currentChooser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentChooser);

  return (EKRecurrenceChooserController *)WeakRetained;
}

- (void)setCurrentChooser:(id)a3
{
}

- (EKRecurrenceWeekdayChooserController)weeklyChooser
{
  return (EKRecurrenceWeekdayChooserController *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setWeeklyChooser:(id)a3
{
}

- (EKRecurrenceMonthlyChooserController)monthlyChooser
{
  return (EKRecurrenceMonthlyChooserController *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setMonthlyChooser:(id)a3
{
}

- (EKRecurrenceMonthChooserController)yearlyChooser
{
  return (EKRecurrenceMonthChooserController *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setYearlyChooser:(id)a3
{
}

- (EKRecurrenceOrdinalChooserController)yearlyOrdinalChooser
{
  return (EKRecurrenceOrdinalChooserController *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setYearlyOrdinalChooser:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setTimeZone:(id)a3
{
}

- (UISwitch)yearOrdinalSwitch
{
  return (UISwitch *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setYearOrdinalSwitch:(id)a3
{
}

- (NSString)recurrenceSummaryString
{
  return (NSString *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setRecurrenceSummaryString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurrenceSummaryString, 0);
  objc_storeStrong((id *)&self->_yearOrdinalSwitch, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_yearlyOrdinalChooser, 0);
  objc_storeStrong((id *)&self->_yearlyChooser, 0);
  objc_storeStrong((id *)&self->_monthlyChooser, 0);
  objc_storeStrong((id *)&self->_weeklyChooser, 0);
  objc_destroyWeak((id *)&self->_currentChooser);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_intervalPicker, 0);
  objc_storeStrong((id *)&self->_intervalSummaryCell, 0);
  objc_storeStrong((id *)&self->_frequencySummaryCell, 0);

  objc_storeStrong((id *)&self->_cachedRecurrenceRule, 0);
}

@end