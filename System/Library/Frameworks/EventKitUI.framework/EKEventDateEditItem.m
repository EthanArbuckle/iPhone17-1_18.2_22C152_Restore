@interface EKEventDateEditItem
+ (id)_timeZoneLocalizedString;
- (BOOL)_endDateIsBeforeStartDate;
- (BOOL)_shouldShowTimeZone;
- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3;
- (BOOL)configureForCalendarConstraints:(id)a3;
- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4;
- (BOOL)handleClassicSubitemSelection:(int64_t)a3;
- (BOOL)isInline;
- (BOOL)proposedTime;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (BOOL)showsAllDay;
- (BOOL)usesClassicUI;
- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3;
- (EKEventDateEditItem)init;
- (EKEventDateEditItemDelegate)eventDateEditItemDelegate;
- (NSDate)pendingProposedTime;
- (NSString)description;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)_allDayCell;
- (id)_calendarForEventComponents:(BOOL)a3;
- (id)_classicEndDateCell;
- (id)_classicStartDateCell;
- (id)_dateComponentsInSystemCalendarFromDate:(id)a3;
- (id)_dateFromComponents:(id)a3 timeZone:(id)a4;
- (id)_dateInSystemCalendarFromComponents:(id)a3;
- (id)_endDatePickerCell;
- (id)_endTimeZoneCell;
- (id)_modernEndDateCell;
- (id)_modernStartDateCell;
- (id)_newDatePicker;
- (id)_startDatePickerCell;
- (id)_startTimeZoneCell;
- (id)_timeZoneDescription:(id)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (int64_t)_rowForSubitem:(int64_t)a3;
- (int64_t)_subitemForRow:(int64_t)a3;
- (unint64_t)numberOfSubitems;
- (unint64_t)onSaveEditItemsToRefresh;
- (unint64_t)onSaveEditorReloadBehavior;
- (void)_adjustEndDateIfNeededAfterTogglingAllDay;
- (void)_adjustStartAndEndComponentsForEventIfNeeded:(id)a3;
- (void)_allDayChanged:(id)a3;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_datePickerChanged:(id)a3;
- (void)_hideInlineDateControls;
- (void)_pickNextReasonableTime;
- (void)_refreshDatePicker;
- (void)_resetClassicStartString:(BOOL)a3 endString:(BOOL)a4;
- (void)_resetStartString:(BOOL)a3 endString:(BOOL)a4;
- (void)_setAllDay:(BOOL)a3;
- (void)_setEndDate:(id)a3;
- (void)_setEndTimeZone:(id)a3;
- (void)_setStartDate:(id)a3;
- (void)_setStartTimeZone:(id)a3;
- (void)_showInlineControls:(int64_t)a3 forSubitem:(int64_t)a4 includingInlineDatePicker:(BOOL)a5;
- (void)_updateClassicDateCellColors;
- (void)_updateClassicDateCellTimeWidths;
- (void)_updateDatePicker:(id)a3 animated:(BOOL)a4;
- (void)_validateTimezones;
- (void)adjustDatePickerInterval:(id)a3;
- (void)dateChanged:(id)a3 forSubitem:(int64_t)a4;
- (void)dateTimeCell:(id)a3 dateChanged:(id)a4;
- (void)dateTimeCellBeganEditing:(id)a3;
- (void)dateTimeCellDateTapped:(id)a3;
- (void)dateTimeCellEndedEditing:(id)a3;
- (void)dateTimeCellTimeTapped:(id)a3;
- (void)dealloc;
- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)editor:(id)a3 didStartEditingItem:(id)a4;
- (void)endInlineEditing;
- (void)refreshFromCalendarItemAndStore;
- (void)setEventDateEditItemDelegate:(id)a3;
- (void)setPendingProposedTime:(id)a3;
- (void)setProposedTime:(BOOL)a3;
- (void)setShowsAllDay:(BOOL)a3;
- (void)setupPickerConstraintsForCell:(id)a3 datePicker:(id)a4;
- (void)shortenCell:(id)a3;
- (void)timeZoneViewController:(id)a3 didSelectTimeZone:(id)a4;
- (void)timeZoneViewControllerDidCancel:(id)a3;
- (void)updateStartDateToDate:(id)a3;
@end

@implementation EKEventDateEditItem

- (EKEventDateEditItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventDateEditItem;
  v2 = [(EKEventDateEditItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_selectedSubitem = 5;
    v2->_targetedSubitemForTimezone = 5;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)EKEventDateEditItem;
  [(EKEventDateEditItem *)&v4 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)EKEventDateEditItem;
  uint64_t v4 = [(EKEventDateEditItem *)&v10 description];
  v5 = (void *)v4;
  modernStartDateCell = self->_modernStartDateCell;
  if (!modernStartDateCell) {
    modernStartDateCell = self->_classicStartDateCell;
  }
  modernEndDateCell = self->_modernEndDateCell;
  if (!modernEndDateCell) {
    modernEndDateCell = self->_classicEndDateCell;
  }
  v8 = [v3 stringWithFormat:@"%@\n startDateCell:%@\n endDateCell:%@", v4, modernStartDateCell, modernEndDateCell];

  return (NSString *)v8;
}

- (BOOL)usesClassicUI
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (void)refreshFromCalendarItemAndStore
{
  v21.receiver = self;
  v21.super_class = (Class)EKEventDateEditItem;
  [(EKCalendarItemEditItem *)&v21 refreshFromCalendarItemAndStore];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  uint64_t v4 = [WeakRetained startTimeZone];
  if ([v4 isUTC])
  {
    v5 = objc_loadWeakRetained((id *)&self->super.super._store);
    objc_super v6 = [v5 timeZone];
    [(EKEventDateEditItem *)self _setStartTimeZone:v6];
  }
  else
  {
    v5 = [WeakRetained startTimeZone];
    [(EKEventDateEditItem *)self _setStartTimeZone:v5];
  }

  v7 = [WeakRetained endTimeZone];
  if (v7)
  {
    v8 = [WeakRetained endTimeZone];
    if ([v8 isUTC])
    {
      [(EKEventDateEditItem *)self _setEndTimeZone:self->_startTimeZone];
    }
    else
    {
      v9 = [WeakRetained endTimeZone];
      [(EKEventDateEditItem *)self _setEndTimeZone:v9];
    }
  }
  else
  {
    [(EKEventDateEditItem *)self _setEndTimeZone:self->_startTimeZone];
  }

  objc_super v10 = [WeakRetained startDate];
  v11 = [WeakRetained endDateUnadjustedForLegacyClients];
  pendingProposedTime = self->_pendingProposedTime;
  if (pendingProposedTime)
  {
    v13 = pendingProposedTime;
LABEL_12:
    v14 = v13;

    [WeakRetained duration];
    uint64_t v15 = -[NSDate dateByAddingTimeInterval:](v14, "dateByAddingTimeInterval:");
    objc_super v10 = v14;

    v11 = (void *)v15;
    goto LABEL_13;
  }
  if ([(EKEventDateEditItem *)self proposedTime])
  {
    v20 = [WeakRetained proposedStartDate];

    if (v20)
    {
      v13 = [WeakRetained proposedStartDate];
      goto LABEL_12;
    }
  }
LABEL_13:
  v16 = [(EKEventDateEditItem *)self _calendarForEventComponents:1];
  v17 = [v16 components:254 fromDate:v10];
  [(EKEventDateEditItem *)self _setStartDate:v17];

  v18 = [(EKEventDateEditItem *)self _calendarForEventComponents:0];
  v19 = [v18 components:254 fromDate:v11];
  [(EKEventDateEditItem *)self _setEndDate:v19];

  -[EKEventDateEditItem _setAllDay:](self, "_setAllDay:", [WeakRetained isAllDay]);
  self->_needsTargetedReload = 1;
  [(EKEventDateEditItem *)self _adjustStartAndEndComponentsForEventIfNeeded:WeakRetained];
  [(EKEventDateEditItem *)self _refreshDatePicker];
}

- (void)updateStartDateToDate:(id)a3
{
  objc_storeStrong((id *)&self->_pendingProposedTime, a3);
  id v5 = a3;
  self->_selectedSubitem = 1;
  id v7 = [(EKEventDateEditItem *)self _calendarForEventComponents:1];
  objc_super v6 = [v7 components:254 fromDate:v5];

  [(EKEventDateEditItem *)self _setStartDate:v6];
}

- (void)_refreshDatePicker
{
  [(EKEventDateEditItem *)self _resetStartString:1 endString:1];
  [(EKEventDateEditItem *)self _updateDatePicker:0 animated:0];
  [(EKEventDateEditItem *)self _updateClassicDateCellTimeWidths];

  [(EKEventDateEditItem *)self _updateClassicDateCellTimeWidths];
}

- (void)_adjustStartAndEndComponentsForEventIfNeeded:(id)a3
{
  if ([a3 isAllDay])
  {
    [(NSDateComponents *)self->_startComponents setSecond:0];
    [(NSDateComponents *)self->_startComponents setMinute:0];
    [(NSDateComponents *)self->_startComponents setHour:0];
    [(NSDateComponents *)self->_endComponents setHour:23];
    [(NSDateComponents *)self->_endComponents setSecond:59];
    endComponents = self->_endComponents;
    [(NSDateComponents *)endComponents setMinute:59];
  }
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  return 1;
}

- (BOOL)configureForCalendarConstraints:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventEditItem *)self event];
  startComponents = [v5 occurrenceDate];
  if (startComponents) {
    goto LABEL_2;
  }
  v9 = [v4 source];
  objc_super v10 = [v9 constraints];
  int v11 = [v10 futureStartDateLimitedToOccurrenceCacheBounds];

  if (!v11) {
    goto LABEL_4;
  }
  v12 = [(NSDateComponents *)self->_startComponents calendar];
  id v5 = [v12 dateFromComponents:self->_startComponents];

  [v5 timeIntervalSinceReferenceDate];
  if ((CUIKCheckEventStartDateAgainstOccurrenceCacheBounds() & 1) == 0)
  {
    CUIKTodayComponents();
    v13 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
    startComponents = self->_startComponents;
    self->_startComponents = v13;
LABEL_2:
  }
LABEL_4:
  BOOL v7 = [(EKEventDateEditItem *)self canBeConfiguredForCalendarConstraints:v4];

  return v7;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  if (self->_needsTargetedReload) {
    return 1;
  }
  else {
    return 2;
  }
}

- (unint64_t)onSaveEditItemsToRefresh
{
  v3 = [(EKEventEditItem *)self event];
  id v4 = [v3 calendar];
  id v5 = [v4 source];
  objc_super v6 = [v5 constraints];
  if ([v6 supportsAvailabilityRequests])
  {
    BOOL v7 = [(EKEventEditItem *)self event];
    int v8 = [v7 hasAttendees];

    if (v8) {
      unint64_t v9 = 22;
    }
    else {
      unint64_t v9 = 18;
    }
  }
  else
  {
    unint64_t v9 = 18;
  }

  return v9;
}

- (BOOL)isInline
{
  return 1;
}

- (int64_t)_rowForSubitem:(int64_t)a3
{
  BOOL showsAllDay = self->_showsAllDay;
  int64_t result = a3 - !self->_showsAllDay;
  int64_t selectedSubitem = self->_selectedSubitem;
  if (selectedSubitem != 5)
  {
    if (a3 == 3)
    {
      BOOL v7 = !showsAllDay;
      uint64_t v8 = 1;
      if (!v7) {
        uint64_t v8 = 2;
      }
      return self->_showingInlineDatePicker + selectedSubitem + v8 - 1;
    }
    else if (a3 == 4)
    {
      return selectedSubitem + showsAllDay;
    }
    else if (selectedSubitem < a3)
    {
      result += self->_showingInlineDatePicker + 1;
    }
  }
  return result;
}

- (int64_t)_subitemForRow:(int64_t)a3
{
  if (self->_showsAllDay) {
    int64_t v4 = a3;
  }
  else {
    int64_t v4 = a3 + 1;
  }
  if (v4 == self->_selectedSubitem + 1)
  {
    if (self->_showingInlineDatePicker || ![(EKEventDateEditItem *)self _shouldShowTimeZone]) {
      return 4;
    }
    return 3;
  }
  if ([(EKEventDateEditItem *)self _shouldShowTimeZone]
    && v4 == self->_selectedSubitem + 2
    && self->_showingInlineDatePicker)
  {
    return 3;
  }
  if ((unint64_t)v4 > 4) {
    return 5;
  }
  if (v4 > self->_selectedSubitem)
  {
    BOOL v5 = [(EKEventDateEditItem *)self _shouldShowTimeZone];
    uint64_t v6 = -2;
    if (!v5) {
      uint64_t v6 = -1;
    }
    v4 += v6;
  }
  return v4;
}

- (unint64_t)numberOfSubitems
{
  if (self->_showsAllDay) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 2;
  }
  uint64_t v4 = v3 + [(EKEventDateEditItem *)self _shouldShowTimeZone];
  if ((unint64_t)(self->_selectedSubitem - 1) <= 1) {
    v4 += self->_showingInlineDatePicker;
  }
  return v4 - [(EKEventDateEditItem *)self proposedTime];
}

- (id)_modernStartDateCell
{
  modernStartDateCell = self->_modernStartDateCell;
  if (!modernStartDateCell)
  {
    uint64_t v4 = [[EKDateTimeCell alloc] initWithStyle:0 reuseIdentifier:0];
    BOOL v5 = self->_modernStartDateCell;
    self->_modernStartDateCell = v4;

    [(EKDateTimeCell *)self->_modernStartDateCell setDateTimeDelegate:self];
    uint64_t v6 = self->_modernStartDateCell;
    BOOL v7 = EventKitUIBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"Starts" value:&stru_1F0CC2140 table:0];
    [(EKDateTimeCell *)v6 setTitle:v8];

    modernStartDateCell = self->_modernStartDateCell;
  }

  return modernStartDateCell;
}

- (id)_modernEndDateCell
{
  modernEndDateCell = self->_modernEndDateCell;
  if (!modernEndDateCell)
  {
    uint64_t v4 = [[EKDateTimeCell alloc] initWithStyle:0 reuseIdentifier:0];
    BOOL v5 = self->_modernEndDateCell;
    self->_modernEndDateCell = v4;

    [(EKDateTimeCell *)self->_modernEndDateCell setDateTimeDelegate:self];
    uint64_t v6 = self->_modernEndDateCell;
    BOOL v7 = EventKitUIBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"Ends" value:&stru_1F0CC2140 table:0];
    [(EKDateTimeCell *)v6 setTitle:v8];

    modernEndDateCell = self->_modernEndDateCell;
  }

  return modernEndDateCell;
}

- (id)_classicStartDateCell
{
  if (!self->_classicStartDateCell)
  {
    BOOL v3 = EKUIUsesLargeTextLayout(0);
    uint64_t v4 = [PreferencesTwoPartValueCell alloc];
    if (v3)
    {
      BOOL v5 = [(EKUITableViewCell *)v4 initWithStyle:3 reuseIdentifier:0];
      classicStartDateCell = self->_classicStartDateCell;
      self->_classicStartDateCell = v5;

      BOOL v7 = EventKitUIBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"Starts" value:&stru_1F0CC2140 table:0];
      unint64_t v9 = [(PreferencesTwoPartValueCell *)self->_classicStartDateCell textLabel];
      [v9 setText:v8];

      uint64_t v10 = *MEMORY[0x1E4FB2950];
      int v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
      v12 = [(PreferencesTwoPartValueCell *)self->_classicStartDateCell detailTextLabel];
      [v12 setFont:v11];

      v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v10];
      v14 = [(PreferencesTwoPartValueCell *)self->_classicStartDateCell largePart2TextLabel];
      [v14 setFont:v13];
    }
    else
    {
      uint64_t v15 = [(EKUITableViewCell *)v4 initWithStyle:0 reuseIdentifier:0];
      v16 = self->_classicStartDateCell;
      self->_classicStartDateCell = v15;

      v17 = EventKitUIBundle();
      v18 = [v17 localizedStringForKey:@"Starts" value:&stru_1F0CC2140 table:0];
      v19 = [(PreferencesTwoPartValueCell *)self->_classicStartDateCell textLabel];
      [v19 setText:v18];

      v20 = [(PreferencesTwoPartValueCell *)self->_classicStartDateCell textLabel];
      objc_super v21 = [v20 font];
      v22 = [(PreferencesTwoPartValueCell *)self->_classicStartDateCell twoPartTextLabel];
      [v22 setFont:v21];

      [(PreferencesTwoPartValueCell *)self->_classicStartDateCell setShortener:self];
    }
  }
  v23 = self->_classicStartDateCell;

  return v23;
}

- (id)_classicEndDateCell
{
  if (!self->_classicEndDateCell)
  {
    BOOL v3 = EKUIUsesLargeTextLayout(0);
    uint64_t v4 = [PreferencesTwoPartValueCell alloc];
    if (v3)
    {
      BOOL v5 = [(EKUITableViewCell *)v4 initWithStyle:3 reuseIdentifier:0];
      classicEndDateCell = self->_classicEndDateCell;
      self->_classicEndDateCell = v5;

      BOOL v7 = EventKitUIBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"Ends" value:&stru_1F0CC2140 table:0];
      unint64_t v9 = [(PreferencesTwoPartValueCell *)self->_classicEndDateCell textLabel];
      [v9 setText:v8];

      uint64_t v10 = *MEMORY[0x1E4FB2950];
      int v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
      v12 = [(PreferencesTwoPartValueCell *)self->_classicEndDateCell detailTextLabel];
      [v12 setFont:v11];

      v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v10];
      v14 = [(PreferencesTwoPartValueCell *)self->_classicEndDateCell largePart2TextLabel];
      [v14 setFont:v13];
    }
    else
    {
      uint64_t v15 = [(EKUITableViewCell *)v4 initWithStyle:0 reuseIdentifier:0];
      v16 = self->_classicEndDateCell;
      self->_classicEndDateCell = v15;

      v17 = EventKitUIBundle();
      v18 = [v17 localizedStringForKey:@"Ends" value:&stru_1F0CC2140 table:0];
      v19 = [(PreferencesTwoPartValueCell *)self->_classicEndDateCell textLabel];
      [v19 setText:v18];

      v20 = [(PreferencesTwoPartValueCell *)self->_classicEndDateCell textLabel];
      objc_super v21 = [v20 font];
      v22 = [(PreferencesTwoPartValueCell *)self->_classicEndDateCell twoPartTextLabel];
      [v22 setFont:v21];

      [(PreferencesTwoPartValueCell *)self->_classicEndDateCell setShortener:self];
    }
  }
  v23 = self->_classicEndDateCell;

  return v23;
}

- (id)_allDayCell
{
  allDayCell = self->_allDayCell;
  if (!allDayCell)
  {
    uint64_t v4 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    BOOL v5 = self->_allDayCell;
    self->_allDayCell = &v4->super;

    id v6 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    [v6 addTarget:self action:sel__allDayChanged_ forControlEvents:4096];
    [(UITableViewCell *)self->_allDayCell setAccessoryView:v6];
    BOOL v7 = EventKitUIBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"All-day" value:&stru_1F0CC2140 table:0];
    unint64_t v9 = [(UITableViewCell *)self->_allDayCell textLabel];
    [v9 setText:v8];

    allDayCell = self->_allDayCell;
  }

  return allDayCell;
}

- (id)_startTimeZoneCell
{
  startTimeZoneCell = self->_startTimeZoneCell;
  if (!startTimeZoneCell)
  {
    uint64_t v4 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    BOOL v5 = self->_startTimeZoneCell;
    self->_startTimeZoneCell = &v4->super;

    id v6 = [(id)objc_opt_class() _timeZoneLocalizedString];
    BOOL v7 = [(UITableViewCell *)self->_startTimeZoneCell textLabel];
    [v7 setText:v6];

    [(UITableViewCell *)self->_startTimeZoneCell setAccessoryType:1];
    startTimeZoneCell = self->_startTimeZoneCell;
  }

  return startTimeZoneCell;
}

- (id)_endTimeZoneCell
{
  endTimeZoneCell = self->_endTimeZoneCell;
  if (!endTimeZoneCell)
  {
    uint64_t v4 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    BOOL v5 = self->_endTimeZoneCell;
    self->_endTimeZoneCell = &v4->super;

    id v6 = [(id)objc_opt_class() _timeZoneLocalizedString];
    BOOL v7 = [(UITableViewCell *)self->_endTimeZoneCell textLabel];
    [v7 setText:v6];

    [(UITableViewCell *)self->_endTimeZoneCell setAccessoryType:1];
    endTimeZoneCell = self->_endTimeZoneCell;
  }

  return endTimeZoneCell;
}

+ (id)_timeZoneLocalizedString
{
  v2 = EventKitUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"Time Zone" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)_newDatePicker
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB16B0]);
  if (EKUICatalyst()) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 3;
  }
  [v3 setPreferredDatePickerStyle:v4];
  [v3 setMinuteInterval:5];
  [v3 setRoundsToMinuteInterval:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  [v5 setFirstWeekday:CUIKOneIndexedWeekStart()];
  [v3 setCalendar:v5];
  [v3 addTarget:self action:sel__datePickerChanged_ forControlEvents:4096];
  [v3 addTarget:self action:sel__datePickerEndedEditing_ forControlEvents:0x40000];

  return v3;
}

- (void)adjustDatePickerInterval:(id)a3
{
  id v3 = a3;
  id v7 = [v3 date];
  uint64_t v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v5 = [v4 component:64 fromDate:v7];

  if (0xCCCCCCCCCCCCCCCDLL * v5 + 0x1999999999999999 >= 0x3333333333333333) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 5;
  }
  [v3 setMinuteInterval:v6];
}

- (id)_startDatePickerCell
{
  startDatePickerCell = self->_startDatePickerCell;
  if (!startDatePickerCell)
  {
    uint64_t v4 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    uint64_t v5 = self->_startDatePickerCell;
    self->_startDatePickerCell = &v4->super;

    uint64_t v6 = [(EKEventDateEditItem *)self _newDatePicker];
    startDatePicker = self->_startDatePicker;
    self->_startDatePicker = v6;

    uint64_t v8 = [(UITableViewCell *)self->_startDatePickerCell contentView];
    [v8 addSubview:self->_startDatePicker];

    if (self->_allDay) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 4272;
    }
    [(UIDatePicker *)self->_startDatePicker setDatePickerMode:v9];
    [(EKEventDateEditItem *)self setupPickerConstraintsForCell:self->_startDatePickerCell datePicker:self->_startDatePicker];
    startDatePickerCell = self->_startDatePickerCell;
  }

  return startDatePickerCell;
}

- (id)_endDatePickerCell
{
  endDatePickerCell = self->_endDatePickerCell;
  if (!endDatePickerCell)
  {
    uint64_t v4 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    uint64_t v5 = self->_endDatePickerCell;
    self->_endDatePickerCell = &v4->super;

    uint64_t v6 = [(EKEventDateEditItem *)self _newDatePicker];
    endDatePicker = self->_endDatePicker;
    self->_endDatePicker = v6;

    uint64_t v8 = [(UITableViewCell *)self->_endDatePickerCell contentView];
    [v8 addSubview:self->_endDatePicker];

    if (self->_allDay) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 4272;
    }
    [(UIDatePicker *)self->_endDatePicker setDatePickerMode:v9];
    [(EKEventDateEditItem *)self setupPickerConstraintsForCell:self->_endDatePickerCell datePicker:self->_endDatePicker];
    endDatePickerCell = self->_endDatePickerCell;
  }

  return endDatePickerCell;
}

- (void)setupPickerConstraintsForCell:(id)a3 datePicker:(id)a4
{
  id v19 = (id)MEMORY[0x1E4F1CA48];
  uint64_t v5 = (void *)MEMORY[0x1E4F28DC8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 contentView];
  uint64_t v9 = [v5 constraintWithItem:v6 attribute:5 relatedBy:0 toItem:v8 attribute:5 multiplier:1.0 constant:0.0];
  uint64_t v10 = (void *)MEMORY[0x1E4F28DC8];
  int v11 = [v7 contentView];
  v12 = [v10 constraintWithItem:v6 attribute:6 relatedBy:0 toItem:v11 attribute:6 multiplier:1.0 constant:0.0];
  v13 = (void *)MEMORY[0x1E4F28DC8];
  v14 = [v7 contentView];
  uint64_t v15 = [v13 constraintWithItem:v6 attribute:4 relatedBy:0 toItem:v14 attribute:4 multiplier:1.0 constant:0.0];
  v16 = (void *)MEMORY[0x1E4F28DC8];
  v17 = [v7 contentView];

  v18 = [v16 constraintWithItem:v6 attribute:3 relatedBy:0 toItem:v17 attribute:3 multiplier:1.0 constant:0.0];

  objc_msgSend(v19, "arrayWithObjects:", v9, v12, v15, v18, 0);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1E4F28DC8] activateConstraints:v20];
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  switch(-[EKEventDateEditItem _subitemForRow:](self, "_subitemForRow:"))
  {
    case 0:
      uint64_t v5 = [(EKEventDateEditItem *)self _allDayCell];
      id v6 = [v5 accessoryView];
      [v6 setOn:self->_allDay];
      goto LABEL_27;
    case 1:
      if ([(EKEventDateEditItem *)self usesClassicUI]) {
        [(EKEventDateEditItem *)self _classicStartDateCell];
      }
      else {
        [(EKEventDateEditItem *)self _modernStartDateCell];
      }
      goto LABEL_5;
    case 2:
      if ([(EKEventDateEditItem *)self usesClassicUI]) {
        [(EKEventDateEditItem *)self _classicEndDateCell];
      }
      else {
        [(EKEventDateEditItem *)self _modernEndDateCell];
      }
      uint64_t v7 = LABEL_5:;
      uint64_t v5 = (void *)v7;
      goto LABEL_28;
    case 3:
      if (self->_selectedSubitem == 1) {
        [(EKEventDateEditItem *)self _startTimeZoneCell];
      }
      else {
      uint64_t v5 = [(EKEventDateEditItem *)self _endTimeZoneCell];
      }
      if (self->_selectedSubitem == 1) {
        uint64_t v8 = &OBJC_IVAR___EKEventDateEditItem__startTimeZone;
      }
      else {
        uint64_t v8 = &OBJC_IVAR___EKEventDateEditItem__endTimeZone;
      }
      uint64_t v9 = [(EKEventDateEditItem *)self _timeZoneDescription:*(Class *)((char *)&self->super.super.super.isa + *v8)];
      uint64_t v10 = [v5 detailTextLabel];
      [v10 setText:v9];

      goto LABEL_28;
    case 4:
      if (self->_selectedSubitem == 1) {
        [(EKEventDateEditItem *)self _startDatePickerCell];
      }
      else {
      uint64_t v5 = [(EKEventDateEditItem *)self _endDatePickerCell];
      }
      int v11 = [v5 superview];

      if (!v11)
      {
        if (self->_selectedSubitem == 1) {
          v12 = &OBJC_IVAR___EKEventDateEditItem__startDatePicker;
        }
        else {
          v12 = &OBJC_IVAR___EKEventDateEditItem__endDatePicker;
        }
        id v6 = *(id *)((char *)&self->super.super.super.isa + *v12);
        [(EKEventDateEditItem *)self _updateDatePicker:v6 animated:0];
        [(EKEventDateEditItem *)self adjustDatePickerInterval:v6];
LABEL_27:
      }
      goto LABEL_28;
    case 5:
      NSLog(&cfstr_ThisShouldNeve.isa, 5, a3);
      goto LABEL_13;
    default:
LABEL_13:
      uint64_t v5 = 0;
LABEL_28:
      return v5;
  }
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  int64_t v7 = -[EKEventDateEditItem _subitemForRow:](self, "_subitemForRow:");
  if (v7 == 4)
  {
    uint64_t v8 = [(EKEventDateEditItem *)self cellForSubitemAtIndex:a3];
    if (v8 == self->_startDatePickerCell) {
      uint64_t v9 = &OBJC_IVAR___EKEventDateEditItem__startDatePicker;
    }
    else {
      uint64_t v9 = &OBJC_IVAR___EKEventDateEditItem__endDatePicker;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v9) intrinsicContentSize];
    double v11 = v10;
  }
  else
  {
    if ((unint64_t)(v7 - 1) <= 1)
    {
      v12 = [(EKEventDateEditItem *)self cellForSubitemAtIndex:a3];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v12 usingMultiLineLayout])
      {
        [(id)objc_opt_class() scaledHeightOfSystemTableViewCell];
        double v11 = v14;

        return v11;
      }
    }
    v16.receiver = self;
    v16.super_class = (Class)EKEventDateEditItem;
    [(EKCalendarItemEditItem *)&v16 defaultCellHeightForSubitemAtIndex:a3 forWidth:a4];
    return v13;
  }
  return v11;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  int64_t v5 = [(EKEventDateEditItem *)self _subitemForRow:a4];
  if ((unint64_t)(v5 - 1) >= 2) {
    return v5 == 3;
  }

  return [(EKEventDateEditItem *)self usesClassicUI];
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)EKEventDateEditItem;
  -[EKCalendarItemEditItem editor:didSelectSubitem:](&v13, sel_editor_didSelectSubitem_, a3);
  int64_t v6 = [(EKEventDateEditItem *)self _subitemForRow:a4];
  if ((![(EKEventDateEditItem *)self usesClassicUI]
     || ![(EKEventDateEditItem *)self handleClassicSubitemSelection:v6])
    && v6 == 3)
  {
    self->_pushingTZController = 1;
    int64_t v7 = [[EKTimeZoneViewController alloc] initWithChooserStyle:0];
    uint64_t v8 = v7;
    if (self->_selectedSubitem == 1) {
      uint64_t v9 = &OBJC_IVAR___EKEventDateEditItem__startTimeZone;
    }
    else {
      uint64_t v9 = &OBJC_IVAR___EKEventDateEditItem__endTimeZone;
    }
    [(EKTimeZoneViewController *)v7 setTimeZone:*(Class *)((char *)&self->super.super.super.isa + *v9)];
    [(EKTimeZoneViewController *)v8 setDelegate:self];
    double v10 = [(EKCalendarItemEditItem *)self delegate];
    double v11 = [v10 viewControllerForEditItem:self];

    v12 = [v11 navigationController];
    [v12 pushViewController:v8 animated:1];
  }
  [(EKEventDateEditItem *)self _resetStartString:1 endString:1];
  [(EKEventDateEditItem *)self _updateClassicDateCellColors];
}

- (BOOL)handleClassicSubitemSelection:(int64_t)a3
{
  int64_t selectedSubitem = self->_selectedSubitem;
  if (selectedSubitem == a3)
  {
    [(EKEventDateEditItem *)self _hideInlineDateControls];
  }
  else if (a3 <= 2)
  {
    int64_t v6 = [MEMORY[0x1E4F28E60] indexSet];
    int64_t v7 = [MEMORY[0x1E4F28E60] indexSet];
    if (selectedSubitem <= 2)
    {
      objc_msgSend(v6, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 4));
      if ([(EKEventDateEditItem *)self _shouldShowTimeZone]) {
        objc_msgSend(v6, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 3));
      }
    }
    self->_int64_t selectedSubitem = a3;
    self->_showingInlineDatePicker = 1;
    objc_msgSend(v7, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", self->_selectedSubitem) + 1);
    if ([(EKEventDateEditItem *)self _shouldShowTimeZone]) {
      objc_msgSend(v7, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", self->_selectedSubitem) + 2);
    }
    if ([v6 count] || objc_msgSend(v7, "count"))
    {
      uint64_t v8 = [(EKCalendarItemEditItem *)self delegate];
      [v8 editItem:self wantsRowInsertions:v7 rowDeletions:v6];

      int64_t v9 = [(EKEventDateEditItem *)self _rowForSubitem:1];
      int64_t v10 = [(EKEventDateEditItem *)self _rowForSubitem:2] + 2 * (self->_selectedSubitem == 2);
      double v11 = [MEMORY[0x1E4F28E60] indexSet];
      [v11 addIndex:v9];
      [v11 addIndex:v10];
      v12 = [(EKCalendarItemEditItem *)self delegate];
      [v12 editItem:self wantsRowsScrolledToVisible:v11];
    }
  }
  return a3 < 3;
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return [(EKEventDateEditItem *)self _subitemForRow:a3] == 3;
}

- (void)editor:(id)a3 didStartEditingItem:(id)a4
{
  int64_t v6 = (EKEventDateEditItem *)a4;
  v7.receiver = self;
  v7.super_class = (Class)EKEventDateEditItem;
  [(EKCalendarItemEditItem *)&v7 editor:a3 didStartEditingItem:v6];
  if (v6 != self && [(EKEventDateEditItem *)v6 isInline]) {
    [(EKEventDateEditItem *)self _hideInlineDateControls];
  }
}

- (void)endInlineEditing
{
  if (!self->_pushingTZController) {
    [(EKEventDateEditItem *)self _hideInlineDateControls];
  }
}

- (id)_calendarForEventComponents:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int64_t v6 = [(EKEventEditItem *)self event];
  if (([v6 isFloating] & 1) != 0 || self->_allDay)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._store);
    uint64_t v8 = [WeakRetained timeZone];
    [v5 setTimeZone:v8];
  }
  else
  {
    int64_t v9 = &OBJC_IVAR___EKEventDateEditItem__endTimeZone;
    if (v3) {
      int64_t v9 = &OBJC_IVAR___EKEventDateEditItem__startTimeZone;
    }
    [v5 setTimeZone:*(Class *)((char *)&self->super.super.super.isa + *v9)];
  }

  return v5;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  int64_t v5 = [(EKEventEditItem *)self event];
  int64_t v6 = v5;
  if (self->_showsAllDay)
  {
    int v7 = [v5 isAllDay];
    int allDay = self->_allDay;
    if (allDay == v7)
    {
      int v9 = 0;
    }
    else
    {
      [v6 setAllDay:allDay != 0];
      int v9 = 1;
    }
  }
  else
  {
    int v9 = 0;
  }
  if (!self->_allDay)
  {
    int64_t v10 = [v6 startTimeZone];
    if (v10 || self->_startTimeZone)
    {
      BOOL v3 = [v6 startTimeZone];
      if (([v3 isEqual:self->_startTimeZone] & 1) == 0)
      {

LABEL_18:
        [v6 setStartTimeZone:self->_startTimeZone];
        [v6 setEndTimeZone:self->_endTimeZone];
        int v9 = 1;
        goto LABEL_19;
      }
      char v11 = 1;
    }
    else
    {
      char v11 = 0;
    }
    v12 = [v6 endTimeZone];
    if (v12 || self->_endTimeZone)
    {
      objc_super v13 = [v6 endTimeZone];
      char v14 = [v13 isEqual:self->_endTimeZone];

      if (v11) {
      if ((v14 & 1) == 0)
      }
        goto LABEL_18;
    }
    else
    {
      if (v11) {
    }
      }
  }
LABEL_19:
  uint64_t v15 = [(EKEventDateEditItem *)self _calendarForEventComponents:1];
  objc_super v16 = [(EKEventDateEditItem *)self _calendarForEventComponents:0];
  v17 = [v15 dateFromComponents:self->_startComponents];
  v18 = [v16 dateFromComponents:self->_endComponents];
  id v19 = [v6 startDate];
  if ([v19 isEqualToDate:v17])
  {
    id v20 = [v6 endDateUnadjustedForLegacyClients];
    char v21 = [v20 isEqualToDate:v18];

    if (v21)
    {
      if (!v9) {
        goto LABEL_28;
      }
      goto LABEL_25;
    }
  }
  else
  {
  }
  [v6 setStartDate:v17];
  [v6 setEndDateUnadjustedForLegacyClients:v18];
LABEL_25:
  v22 = [v6 suggestionInfo];

  if (v22) {
    [MEMORY[0x1E4F57840] trackPseudoEventDateChanged];
  }
  [(EKCalendarItemEditItem *)self notifySubitemDidSave:0];
  self->_needsTargetedReload = 1;
LABEL_28:

  return 1;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  [(EKDateTimeCell *)self->_modernStartDateCell contentSizeCategoryChanged];
  [(EKDateTimeCell *)self->_modernEndDateCell contentSizeCategoryChanged];
  classicStartDateCell = self->_classicStartDateCell;
  self->_classicStartDateCell = 0;

  classicEndDateCell = self->_classicEndDateCell;
  self->_classicEndDateCell = 0;

  allDayCell = self->_allDayCell;
  self->_allDayCell = 0;

  startTimeZoneCell = self->_startTimeZoneCell;
  self->_startTimeZoneCell = 0;

  endTimeZoneCell = self->_endTimeZoneCell;
  self->_endTimeZoneCell = 0;

  [(EKEventDateEditItem *)self _refreshDatePicker];
}

- (void)_updateClassicDateCellTimeWidths
{
  if ([(EKEventDateEditItem *)self usesClassicUI])
  {
    id v13 = [(EKEventDateEditItem *)self _classicStartDateCell];
    BOOL v3 = [v13 twoPartTextLabel];
    [v3 rightmostDisplayedPartWidth];
    double v5 = v4;

    int64_t v6 = [(EKEventDateEditItem *)self _classicEndDateCell];
    int v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 twoPartTextLabel];
      [v8 rightmostDisplayedPartWidth];
      double v10 = v9;

      if (v10 > v5) {
        double v5 = v10;
      }
    }
    char v11 = [v13 twoPartTextLabel];
    [v11 setMinimumPart2Width:v5];

    v12 = [v7 twoPartTextLabel];
    [v12 setMinimumPart2Width:v5];
  }
}

- (void)_updateClassicDateCellColors
{
  if ([(EKEventDateEditItem *)self usesClassicUI])
  {
    id v20 = [(EKEventDateEditItem *)self _classicStartDateCell];
    BOOL v3 = [(EKEventDateEditItem *)self _classicEndDateCell];
    double v4 = [MEMORY[0x1E4FB1618] labelColor];
    double v5 = CalendarAppTintColor();
    BOOL v6 = EKUIUsesLargeTextLayout(0);
    if (self->_selectedSubitem == 1) {
      int v7 = v5;
    }
    else {
      int v7 = v4;
    }
    if (v6)
    {
      uint64_t v8 = [v20 detailTextLabel];
      [v8 setTextColor:v7];

      if (self->_selectedSubitem == 1) {
        double v9 = v5;
      }
      else {
        double v9 = v4;
      }
      double v10 = [v20 largePart2TextLabel];
      [v10 setTextColor:v9];

      if (self->_selectedSubitem == 2) {
        char v11 = v5;
      }
      else {
        char v11 = v4;
      }
      v12 = [v3 detailTextLabel];
      [v12 setTextColor:v11];

      if (self->_selectedSubitem == 2) {
        id v13 = v5;
      }
      else {
        id v13 = v4;
      }
      char v14 = [v3 largePart2TextLabel];
      [v14 setTextColor:v13];

      objc_msgSend(v3, "setStrikeThroughLargeDetailTextLabel:", -[EKEventDateEditItem _endDateIsBeforeStartDate](self, "_endDateIsBeforeStartDate"));
      objc_msgSend(v3, "setStrikeThroughLargePart2TextLabel:", -[EKEventDateEditItem _endDateIsBeforeStartDate](self, "_endDateIsBeforeStartDate"));
    }
    else
    {
      uint64_t v15 = [v20 twoPartTextLabel];
      [v15 setTextColor:v7];

      if (self->_selectedSubitem == 2) {
        objc_super v16 = v5;
      }
      else {
        objc_super v16 = v4;
      }
      v17 = [v3 twoPartTextLabel];
      [v17 setTextColor:v16];

      v18 = [v3 twoPartTextLabel];
      objc_msgSend(v18, "setStrikethroughPart1:", -[EKEventDateEditItem _endDateIsBeforeStartDate](self, "_endDateIsBeforeStartDate"));

      id v19 = [v3 twoPartTextLabel];
      objc_msgSend(v19, "setStrikethroughPart2:", -[EKEventDateEditItem _endDateIsBeforeStartDate](self, "_endDateIsBeforeStartDate"));
    }
  }
}

- (void)shortenCell:(id)a3
{
  char v14 = (PreferencesTwoPartValueCell *)a3;
  if (self->_shorteningStatus != 2)
  {
    double v4 = _CalendarForFormattingStrings();
    double v5 = v14;
    if (self->_classicStartDateCell == v14
      && ([(PreferencesTwoPartValueCell *)v14 twoPartTextLabel],
          BOOL v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 hasTwoParts],
          v6,
          double v5 = v14,
          v7))
    {
      uint64_t v8 = [(PreferencesTwoPartValueCell *)v14 twoPartTextLabel];
      uint64_t v9 = 48;
    }
    else
    {
      if (self->_classicEndDateCell != v5) {
        goto LABEL_9;
      }
      double v10 = [(PreferencesTwoPartValueCell *)v14 twoPartTextLabel];
      int v11 = [v10 hasTwoParts];

      if (!v11) {
        goto LABEL_9;
      }
      uint64_t v8 = [(PreferencesTwoPartValueCell *)v14 twoPartTextLabel];
      uint64_t v9 = 56;
    }
    v12 = [v4 dateFromComponents:*(Class *)((char *)&self->super.super.super.isa + v9)];
    id v13 = CUIKShortStringForDateWithMonthAndYear();
    [v8 setTextPart1:v13];

LABEL_9:
  }
}

- (void)timeZoneViewController:(id)a3 didSelectTimeZone:(id)a4
{
  id v5 = a4;
  self->_pushingTZController = 0;
  int64_t targetedSubitemForTimezone = self->_targetedSubitemForTimezone;
  if (targetedSubitemForTimezone == 5) {
    int64_t targetedSubitemForTimezone = self->_selectedSubitem;
  }
  id v12 = v5;
  if (targetedSubitemForTimezone == 1)
  {
    if ([(NSTimeZone *)self->_startTimeZone isEqualToTimeZone:self->_endTimeZone]) {
      [(EKEventDateEditItem *)self _setEndTimeZone:v12];
    }
    [(EKEventDateEditItem *)self _setStartTimeZone:v12];
  }
  else
  {
    [(EKEventDateEditItem *)self _setEndTimeZone:v5];
  }
  [(EKEventDateEditItem *)self saveAndDismissWithForce:1];
  int v7 = [(EKCalendarItemEditItem *)self delegate];
  [v7 editItem:self wantsDoneButtonDisabled:0];

  [(EKCalendarItemEditItem *)self notifySubitemDidSave:[(EKEventDateEditItem *)self _rowForSubitem:3]];
  uint64_t v8 = [(EKCalendarItemEditItem *)self delegate];
  uint64_t v9 = [v8 viewControllerForEditItem:self];

  double v10 = [v9 navigationController];
  id v11 = (id)[v10 popViewControllerAnimated:1];

  self->_int64_t targetedSubitemForTimezone = 5;
}

- (void)timeZoneViewControllerDidCancel:(id)a3
{
  self->_pushingTZController = 0;
  self->_int64_t targetedSubitemForTimezone = 5;
  if (self->_selectedSubitem == 1) {
    BOOL v3 = &OBJC_IVAR___EKEventDateEditItem__startTimeZone;
  }
  else {
    BOOL v3 = &OBJC_IVAR___EKEventDateEditItem__endTimeZone;
  }
  [a3 setTimeZone:*(Class *)((char *)&self->super.super.super.isa + *v3)];
}

- (void)_setStartDate:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_startComponents] & 1) == 0)
  {
    double v4 = (NSDateComponents *)[v6 copy];
    startComponents = self->_startComponents;
    self->_startComponents = v4;

    [(NSDateComponents *)self->_startComponents setTimeZone:0];
    [(EKEventDateEditItem *)self _resetStartString:1 endString:self->_endTimeWasMessedUp];
    [(EKEventDateEditItem *)self _updateClassicDateCellColors];
    [(EKEventDateEditItem *)self _updateClassicDateCellTimeWidths];
    if (self->_selectedSubitem == 1 && !self->_changingDate) {
      [(EKEventDateEditItem *)self _updateDatePicker:0 animated:0];
    }
  }
}

- (void)_setEndDate:(id)a3
{
  id v9 = a3;
  char v4 = [v9 isEqual:self->_endComponents];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    id v6 = (NSDateComponents *)[v9 copy];
    endComponents = self->_endComponents;
    self->_endComponents = v6;

    [(NSDateComponents *)self->_endComponents setTimeZone:0];
    if (!self->_allDay)
    {
      BOOL v8 = ![(NSDateComponents *)self->_endComponents hour]
        && ![(NSDateComponents *)self->_endComponents minute]
        && [(NSDateComponents *)self->_endComponents second] == 0;
      self->_timedEventEndedAtMidnight = v8;
    }
    [(EKEventDateEditItem *)self _resetStartString:0 endString:1];
    if (self->_selectedSubitem == 2 && !self->_changingDate) {
      [(EKEventDateEditItem *)self _updateDatePicker:0 animated:0];
    }
    [(EKEventDateEditItem *)self _updateClassicDateCellColors];
    [(EKEventDateEditItem *)self _updateClassicDateCellTimeWidths];
    id v5 = v9;
  }
}

- (void)_setAllDay:(BOOL)a3
{
  if (self->_allDay != a3)
  {
    self->_int allDay = a3;
    if (self->_showsAllDay)
    {
      char v4 = [(EKEventDateEditItem *)self _allDayCell];
      id v5 = [v4 accessoryView];
      [v5 setOn:self->_allDay];
      if (!self->_allDay)
      {
        id v6 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
        [(EKEventDateEditItem *)self _setStartTimeZone:v6];

        int v7 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
        [(EKEventDateEditItem *)self _setEndTimeZone:v7];

        if (![(NSDateComponents *)self->_startComponents hour]
          && ![(NSDateComponents *)self->_startComponents minute]
          && ![(NSDateComponents *)self->_startComponents second]
          && [(NSDateComponents *)self->_endComponents hour] == 23
          && [(NSDateComponents *)self->_endComponents minute] == 59
          && [(NSDateComponents *)self->_endComponents second] == 59)
        {
          [(EKEventDateEditItem *)self _pickNextReasonableTime];
        }
      }

      *(_DWORD *)&a3 = self->_allDay;
    }
    if (a3 && (unint64_t)(self->_selectedSubitem - 1) <= 1) {
      self->_currentPickerMode = 1;
    }
    [(EKEventDateEditItem *)self _adjustEndDateIfNeededAfterTogglingAllDay];
    [(EKEventDateEditItem *)self _resetStartString:1 endString:1];
    [(EKEventDateEditItem *)self _updateDatePicker:0 animated:1];
    [(EKEventDateEditItem *)self _updateClassicDateCellColors];
    [(EKEventDateEditItem *)self _updateClassicDateCellTimeWidths];
  }
}

- (void)_adjustEndDateIfNeededAfterTogglingAllDay
{
  if (self->_timedEventEndedAtMidnight)
  {
    BOOL allDay = self->_allDay;
    endComponents = self->_endComponents;
    uint64_t v4 = [(NSDateComponents *)endComponents day];
    if (allDay) {
      uint64_t v5 = v4 - 1;
    }
    else {
      uint64_t v5 = v4 + 1;
    }
    [(NSDateComponents *)endComponents setDay:v5];
  }
}

- (void)_validateTimezones
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  BOOL v3 = (void *)CalCopyTimeZone();
  if (([(NSTimeZone *)self->_startTimeZone isUTC] & 1) == 0)
  {
    uint64_t v4 = [WeakRetained startDate];
    char v5 = CUIKTimezonesDivergeAtDate();

    if (v5) {
      goto LABEL_5;
    }
  }
  if (([(NSTimeZone *)self->_endTimeZone isUTC] & 1) != 0
    || ([WeakRetained endDateUnadjustedForLegacyClients],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = CUIKTimezonesDivergeAtDate(),
        v6,
        (v7 & 1) == 0))
  {
    BOOL v8 = 0;
  }
  else
  {
LABEL_5:
    BOOL v8 = 1;
  }
  self->_showTimeZones = v8;
}

- (void)_setStartTimeZone:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToTimeZone:self->_startTimeZone] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_startTimeZone, a3);
    [(EKEventDateEditItem *)self _validateTimezones];
    [(EKEventDateEditItem *)self _resetStartString:1 endString:1];
  }
}

- (void)_setEndTimeZone:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToTimeZone:self->_endTimeZone] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_endTimeZone, a3);
    [(EKEventDateEditItem *)self _validateTimezones];
    [(EKEventDateEditItem *)self _resetStartString:1 endString:1];
  }
}

- (void)dateTimeCellDateTapped:(id)a3
{
  if (self->_modernStartDateCell == a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(EKEventDateEditItem *)self _showInlineControls:1 forSubitem:v3 includingInlineDatePicker:1];
}

- (void)dateTimeCellTimeTapped:(id)a3
{
  if (self->_modernStartDateCell == a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(EKEventDateEditItem *)self _showInlineControls:0 forSubitem:v3 includingInlineDatePicker:1];
}

- (void)dateTimeCell:(id)a3 dateChanged:(id)a4
{
  if (self->_modernStartDateCell == a3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  [(EKEventDateEditItem *)self dateChanged:a4 forSubitem:v5];
}

- (void)dateTimeCellBeganEditing:(id)a3
{
  if (self->_modernStartDateCell == a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(EKEventDateEditItem *)self _showInlineControls:0 forSubitem:v3 includingInlineDatePicker:0];
}

- (void)dateTimeCellEndedEditing:(id)a3
{
  if (!self->_modifyingVisibleControls)
  {
    int64_t selectedSubitem = self->_selectedSubitem;
    [(EKEventDateEditItem *)self _hideInlineDateControls];
    if (self->_pushingTZController) {
      self->_int64_t targetedSubitemForTimezone = selectedSubitem;
    }
  }
}

- (void)_showInlineControls:(int64_t)a3 forSubitem:(int64_t)a4 includingInlineDatePicker:(BOOL)a5
{
  int v5 = a5;
  if (*(_OWORD *)&self->_selectedSubitem == __PAIR128__(a3, a4))
  {
    [(EKEventDateEditItem *)self _hideInlineDateControls];
    return;
  }
  BOOL v9 = [(EKEventDateEditItem *)self _shouldShowTimeZone];
  int showingInlineDatePicker = self->_showingInlineDatePicker;
  self->_currentPickerMode = a3;
  uint64_t v33 = 211;
  self->_modifyingVisibleControls = 1;
  int64_t selectedSubitem = self->_selectedSubitem;
  if (selectedSubitem == a4)
  {
    self->_int showingInlineDatePicker = v5;
    [(EKEventDateEditItem *)self _updateDatePicker:0 animated:0];
    [(EKEventDateEditItem *)self _resetStartString:a4 == 1 endString:a4 == 2];
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    if (v9 != [(EKEventDateEditItem *)self _shouldShowTimeZone])
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 3));
      if (v9) {
        uint64_t v12 = v14;
      }
      else {
        uint64_t v12 = 0;
      }
      if (v9) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v14;
      }
    }
    if (showingInlineDatePicker != v5)
    {
      v18 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", a4) + 1);
      id v19 = v18;
      if (showingInlineDatePicker)
      {
        if (v12)
        {
          id v20 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndexSet:v12];
          [v20 addIndexes:v19];

          uint64_t v12 = (uint64_t)v20;
        }
        else
        {
          uint64_t v12 = v18;
        }
      }
      else if (v13)
      {
        v31 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndexSet:v13];
        [v31 addIndexes:v19];

        uint64_t v13 = (uint64_t)v31;
      }
      else
      {
        uint64_t v13 = v18;
      }
    }
    v32 = (void *)MEMORY[0x1E4FB1EB0];
    if (v13 | v12)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke;
      v36[3] = &unk_1E6087548;
      v36[4] = self;
      id v37 = (id)v13;
      id v38 = (id)v12;
      [v32 performWithoutAnimation:v36];
    }
    else
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke_2;
      v35[3] = &unk_1E6087570;
      v35[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v35];
    }
    self->_modifyingVisibleControls = 0;

    return;
  }
  uint64_t v15 = [MEMORY[0x1E4F28E60] indexSet];
  objc_super v16 = [MEMORY[0x1E4F28E60] indexSet];
  if (selectedSubitem <= 2)
  {
    if (showingInlineDatePicker) {
      objc_msgSend(v15, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 4));
    }
    if (v9) {
      objc_msgSend(v15, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 3));
    }
  }
  if (selectedSubitem == 1)
  {
    v17 = &OBJC_IVAR___EKEventDateEditItem__modernStartDateCell;
    goto LABEL_27;
  }
  if (selectedSubitem == 2)
  {
    v17 = &OBJC_IVAR___EKEventDateEditItem__modernEndDateCell;
LABEL_27:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v17), "resetDatePickerSelection", 211);
  }
  self->_int64_t selectedSubitem = a4;
  self->_int showingInlineDatePicker = v5;
  int64_t v21 = -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", self->_selectedSubitem, v33);
  int64_t v22 = v21 + 1;
  if (self->_showingInlineDatePicker)
  {
    int64_t v23 = v21;
    [v16 addIndex:v22];
    int64_t v22 = v23 + 2;
  }
  if ([(EKEventDateEditItem *)self _shouldShowTimeZone]) {
    [v16 addIndex:v22];
  }
  if ([v15 count] || objc_msgSend(v16, "count"))
  {
    v24 = [(EKCalendarItemEditItem *)self delegate];
    [v24 editItem:self wantsRowInsertions:v16 rowDeletions:v15];

    int64_t v25 = [(EKEventDateEditItem *)self _rowForSubitem:1];
    int64_t v26 = [(EKEventDateEditItem *)self _rowForSubitem:2] + 2 * (self->_selectedSubitem == 2);
    v27 = [MEMORY[0x1E4F28E60] indexSet];
    [v27 addIndex:v25];
    [v27 addIndex:v26];
    v28 = [(EKCalendarItemEditItem *)self delegate];
    LOBYTE(v26) = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0 && v5)
    {
      dispatch_time_t v29 = dispatch_time(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke_3;
      block[3] = &unk_1E6087570;
      block[4] = self;
      dispatch_after(v29, MEMORY[0x1E4F14428], block);
    }
    v30 = [(EKCalendarItemEditItem *)self delegate];
    [v30 editItem:self wantsRowsScrolledToVisible:v27];
  }
  self->_modifyingVisibleControls = 0;
  [(EKEventDateEditItem *)self _resetStartString:1 endString:1];
}

void __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 editItem:*(void *)(a1 + 32) wantsRowInsertions:*(void *)(a1 + 40) rowDeletions:*(void *)(a1 + 48)];
}

uint64_t __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyRequiresHeightChange];
}

void __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 editItemWantsFirstResponderResigned:*(void *)(a1 + 32)];
}

- (void)_hideInlineDateControls
{
  if (self->_selectedSubitem == 5) {
    return;
  }
  if (![(EKEventDateEditItem *)self usesClassicUI])
  {
    int64_t selectedSubitem = self->_selectedSubitem;
    if (selectedSubitem == 1)
    {
      uint64_t v4 = &OBJC_IVAR___EKEventDateEditItem__modernStartDateCell;
      goto LABEL_7;
    }
    if (selectedSubitem == 2)
    {
      uint64_t v4 = &OBJC_IVAR___EKEventDateEditItem__modernEndDateCell;
LABEL_7:
      [*(id *)((char *)&self->super.super.super.isa + *v4) resetDatePickerSelection];
    }
  }
  int v5 = [MEMORY[0x1E4F28E60] indexSet];
  id v7 = v5;
  if (self->_showingInlineDatePicker) {
    objc_msgSend(v5, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 4));
  }
  if ([(EKEventDateEditItem *)self _shouldShowTimeZone]) {
    objc_msgSend(v7, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 3));
  }
  self->_int64_t selectedSubitem = 5;
  self->_int showingInlineDatePicker = 0;
  if ([v7 count])
  {
    id v6 = [(EKCalendarItemEditItem *)self delegate];
    [v6 editItem:self wantsRowInsertions:0 rowDeletions:v7];
  }
  [(EKEventDateEditItem *)self _updateClassicDateCellColors];
  [(EKEventDateEditItem *)self _resetStartString:1 endString:1];
  [(EKCalendarItemEditItem *)self notifyDidEndEditing];
}

- (void)_pickNextReasonableTime
{
  uint64_t v3 = CUIKNowComponentsSystemTime();
  id v11 = [(EKEventDateEditItem *)self _dateInSystemCalendarFromComponents:v3];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setHour:1];
  int v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = [v5 dateByAddingComponents:v4 toDate:v11 options:0];

  id v7 = [(EKEventDateEditItem *)self _dateComponentsInSystemCalendarFromDate:v6];
  -[NSDateComponents setHour:](self->_startComponents, "setHour:", [v7 hour]);

  [(NSDateComponents *)self->_startComponents setMinute:0];
  [(NSDateComponents *)self->_startComponents setSecond:0];
  BOOL v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  BOOL v9 = [v8 dateByAddingComponents:v4 toDate:v6 options:0];

  double v10 = [(EKEventDateEditItem *)self _dateComponentsInSystemCalendarFromDate:v9];
  -[NSDateComponents setHour:](self->_endComponents, "setHour:", [v10 hour]);

  [(NSDateComponents *)self->_endComponents setMinute:0];
  [(NSDateComponents *)self->_endComponents setSecond:0];
}

- (void)_resetClassicStartString:(BOOL)a3 endString:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 && self->_startComponents)
  {
    id v6 = [(EKEventDateEditItem *)self _classicStartDateCell];
    if (v6)
    {
      if (self->_showTimeZones) {
        startTimeZone = self->_startTimeZone;
      }
      else {
        startTimeZone = 0;
      }
      double v10 = startTimeZone;
      startComponents = self->_startComponents;
      BOOL allDay = self->_allDay;
      char v13 = self->_shorteningStatus != 0;
      id v31 = 0;
      id v32 = 0;
      _StringValuePartsForDateComponents(startComponents, 0, v10, allDay, 0, v13, &v32, &v31);
      id v14 = v32;
      id v15 = v31;
      if (EKUIUsesLargeTextLayout(0))
      {
        objc_super v16 = [v6 detailTextLabel];
        [v16 setText:v14];

        v17 = [v6 largePart2TextLabel];
        [v17 setText:v15];
      }
      else
      {
        v17 = [v6 twoPartTextLabel];
        [v17 setTextPart1:v14 part2:v15];
      }

      [v6 setNeedsLayout];
      if (!v4) {
        goto LABEL_17;
      }
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = 0;
  }
  if (!v4)
  {
LABEL_17:
    BOOL v8 = v6;
    goto LABEL_23;
  }
LABEL_8:
  if (!self->_endComponents) {
    goto LABEL_17;
  }
  BOOL v8 = [(EKEventDateEditItem *)self _classicEndDateCell];

  if (v8)
  {
    if (self->_showTimeZones) {
      endTimeZone = self->_endTimeZone;
    }
    else {
      endTimeZone = 0;
    }
    v18 = endTimeZone;
    id v19 = (NSDateComponents *)[(NSDateComponents *)self->_startComponents copy];
    endComponents = self->_endComponents;
    BOOL v21 = self->_allDay;
    char v22 = self->_shorteningStatus != 0;
    id v29 = 0;
    id v30 = 0;
    _StringValuePartsForDateComponents(endComponents, v19, v18, v21, 0, v22, &v30, &v29);
    id v23 = v30;
    id v24 = v29;
    int64_t v25 = self->_startComponents;
    self->_startComponents = v19;
    int64_t v26 = v19;

    if (EKUIUsesLargeTextLayout(0))
    {
      v27 = [v8 detailTextLabel];
      [v27 setText:v23];

      v28 = [v8 largePart2TextLabel];
      [v28 setText:v24];
    }
    else
    {
      v28 = [v8 twoPartTextLabel];
      [v28 setTextPart1:v23 part2:v24];
    }

    [v8 setNeedsLayout];
  }
LABEL_23:
}

- (void)_resetStartString:(BOOL)a3 endString:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(EKEventDateEditItem *)self usesClassicUI])
  {
    [(EKEventDateEditItem *)self _resetClassicStartString:v5 endString:v4];
    return;
  }
  if (!v5 || !self->_startComponents)
  {
    BOOL v8 = 0;
LABEL_11:
    if (!v4) {
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  id v7 = [(EKEventDateEditItem *)self _modernStartDateCell];
  BOOL v8 = v7;
  if (!v7) {
    goto LABEL_11;
  }
  if (self->_showTimeZones) {
    startTimeZone = self->_startTimeZone;
  }
  else {
    startTimeZone = 0;
  }
  [v7 updateWithDate:self->_startComponents timeZone:startTimeZone allDay:self->_allDay needsStrikethrough:0];
  [v8 setNeedsLayout];
  if (!v4) {
    goto LABEL_18;
  }
LABEL_12:
  if (self->_endComponents)
  {
    id v16 = [(EKEventDateEditItem *)self _modernEndDateCell];

    double v10 = v16;
    if (v16)
    {
      id v11 = (NSDateComponents *)[(NSDateComponents *)self->_startComponents copy];
      startComponents = self->_startComponents;
      self->_startComponents = v11;
      char v13 = v11;

      BOOL v14 = [(EKEventDateEditItem *)self _endDateIsBeforeStartDate];
      if (self->_showTimeZones) {
        endTimeZone = self->_endTimeZone;
      }
      else {
        endTimeZone = 0;
      }
      [v16 updateWithDate:self->_endComponents timeZone:endTimeZone allDay:self->_allDay needsStrikethrough:v14];

      [v16 setNeedsLayout];
      double v10 = v16;
    }
    goto LABEL_21;
  }
LABEL_18:
  double v10 = v8;
LABEL_21:
}

- (BOOL)_endDateIsBeforeStartDate
{
  if (!self->_startComponents || !self->_endComponents) {
    return 0;
  }
  if (self->_allDay)
  {
    uint64_t v3 = (void *)[(NSDateComponents *)self->_startComponents copy];
    [v3 setHour:0x7FFFFFFFFFFFFFFFLL];
    [v3 setMinute:0x7FFFFFFFFFFFFFFFLL];
    [v3 setSecond:0x7FFFFFFFFFFFFFFFLL];
    BOOL v4 = (void *)[(NSDateComponents *)self->_endComponents copy];
    [v4 setHour:0x7FFFFFFFFFFFFFFFLL];
    [v4 setMinute:0x7FFFFFFFFFFFFFFFLL];
    [v4 setSecond:0x7FFFFFFFFFFFFFFFLL];
    BOOL v5 = [(EKEventDateEditItem *)self _dateInSystemCalendarFromComponents:v3];
    id v6 = [(EKEventDateEditItem *)self _dateInSystemCalendarFromComponents:v4];
  }
  else
  {
    BOOL v5 = -[EKEventDateEditItem _dateFromComponents:timeZone:](self, "_dateFromComponents:timeZone:");
    if (self->_showTimeZones) {
      endTimeZone = self->_endTimeZone;
    }
    else {
      endTimeZone = 0;
    }
    id v6 = [(EKEventDateEditItem *)self _dateFromComponents:self->_endComponents timeZone:endTimeZone];
  }
  BOOL v7 = [v6 compare:v5] == -1;

  return v7;
}

- (void)_updateDatePicker:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v26 = (UIDatePicker *)a3;
  int64_t currentPickerMode = self->_currentPickerMode;
  BOOL v16 = ![(EKEventDateEditItem *)self usesClassicUI];
  uint64_t v7 = 4272;
  if (v16) {
    uint64_t v7 = currentPickerMode;
  }
  if (v7) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 1;
  }
  if (self->_allDay) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v7;
  }
  if (v26)
  {
    [(UIDatePicker *)v26 setPreferredDatePickerStyle:v8];
    endDatePicker = v26;
  }
  else
  {
    [(UIDatePicker *)self->_startDatePicker setPreferredDatePickerStyle:v8];
    [(UIDatePicker *)self->_endDatePicker setPreferredDatePickerStyle:v8];
    [(UIDatePicker *)self->_startDatePicker setDatePickerMode:v9];
    endDatePicker = self->_endDatePicker;
  }
  [(UIDatePicker *)endDatePicker setDatePickerMode:v9];
  if (self->_selectedSubitem != 1)
  {
    BOOL v12 = (unint64_t)(self->_selectedSubitem - 1) < 2;
    goto LABEL_19;
  }
  if (self->_startComponents && self->_endComponents)
  {
    self->_endTimeWasMessedUp = [(EKEventDateEditItem *)self _endDateIsBeforeStartDate];
    int64_t selectedSubitem = self->_selectedSubitem;
    BOOL v12 = (unint64_t)(selectedSubitem - 1) < 2;
    if (selectedSubitem == 1) {
      goto LABEL_21;
    }
LABEL_19:
    char v13 = &OBJC_IVAR___EKEventDateEditItem__endComponents;
    goto LABEL_22;
  }
  BOOL v12 = 1;
LABEL_21:
  char v13 = &OBJC_IVAR___EKEventDateEditItem__startComponents;
LABEL_22:
  id v14 = *(id *)((char *)&self->super.super.super.isa + *v13);
  id v15 = v14;
  BOOL v16 = !v12 || v14 == 0;
  if (!v16)
  {
    if (self->_selectedSubitem == 1) {
      v17 = &OBJC_IVAR___EKEventDateEditItem__startDatePicker;
    }
    else {
      v17 = &OBJC_IVAR___EKEventDateEditItem__endDatePicker;
    }
    id v18 = *(id *)((char *)&self->super.super.super.isa + *v17);
    id v19 = [(EKEventDateEditItem *)self _dateInSystemCalendarFromComponents:v15];
    [v18 setDate:v19 animated:v4];
    if (self->_selectedSubitem == 1) {
      id v20 = &OBJC_IVAR___EKEventDateEditItem__modernStartDateCell;
    }
    else {
      id v20 = &OBJC_IVAR___EKEventDateEditItem__modernEndDateCell;
    }
    id v21 = *(id *)((char *)&self->super.super.super.isa + *v20);
    if (self->_selectedSubitem == 1) {
      char v22 = &OBJC_IVAR___EKEventDateEditItem__startTimeZone;
    }
    else {
      char v22 = &OBJC_IVAR___EKEventDateEditItem__endTimeZone;
    }
    id v23 = *(id *)((char *)&self->super.super.super.isa + *v22);
    BOOL v24 = self->_selectedSubitem == 2
       && [(EKEventDateEditItem *)self _endDateIsBeforeStartDate];
    if (self->_showTimeZones) {
      id v25 = v23;
    }
    else {
      id v25 = 0;
    }
    [v21 updateWithDate:v15 timeZone:v25 allDay:self->_allDay needsStrikethrough:v24];
  }
}

- (void)_datePickerChanged:(id)a3
{
  BOOL v4 = (UIDatePicker *)a3;
  id v7 = [(UIDatePicker *)v4 date];
  startDatePicker = self->_startDatePicker;

  if (startDatePicker == v4) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [(EKEventDateEditItem *)self dateChanged:v7 forSubitem:v6];
}

- (void)dateChanged:(id)a3 forSubitem:(int64_t)a4
{
  id v17 = a3;
  self->_changingDate = 1;
  uint64_t v6 = [(EKCalendarItemEditItem *)self delegate];
  [v6 editItem:self wantsDoneButtonDisabled:0];

  id v7 = [(EKEventDateEditItem *)self _dateComponentsInSystemCalendarFromDate:v17];
  if (a4 == 2)
  {
    [(EKEventDateEditItem *)self _setEndDate:v7];
  }
  else if (a4 == 1)
  {
    uint64_t v8 = (void *)[(NSDateComponents *)self->_startComponents copy];
    [(EKEventDateEditItem *)self _setStartDate:v7];
    if (!self->_endTimeWasMessedUp)
    {
      uint64_t v9 = [(EKEventDateEditItem *)self _dateInSystemCalendarFromComponents:self->_endComponents];
      double v10 = [(EKEventDateEditItem *)self _dateInSystemCalendarFromComponents:v8];
      [v9 timeIntervalSinceDate:v10];
      id v11 = objc_msgSend(v17, "dateByAddingTimeInterval:");
      BOOL v12 = [(EKEventDateEditItem *)self _dateComponentsInSystemCalendarFromDate:v11];
      [(EKEventDateEditItem *)self _setEndDate:v12];
    }
  }
  self->_changingDate = 0;
  char v13 = [(EKEventDateEditItem *)self eventDateEditItemDelegate];

  if (v13)
  {
    id v14 = [(EKEventDateEditItem *)self _calendarForEventComponents:1];
    id v15 = [(EKEventDateEditItem *)self eventDateEditItemDelegate];
    BOOL v16 = [v14 dateFromComponents:self->_startComponents];
    [v15 dateChangedTo:v16];
  }
  [(EKCalendarItemEditItem *)self notifyDidEndEditing];
}

- (void)_allDayChanged:(id)a3
{
  self->_changingDate = 1;
  -[EKEventDateEditItem _setAllDay:](self, "_setAllDay:", [a3 isOn]);
  self->_needsTargetedReload = 0;
  self->_changingDate = 0;
  [(EKCalendarItemEditItem *)self notifyDidStartEditing];

  [(EKCalendarItemEditItem *)self notifyDidEndEditing];
}

- (id)_timeZoneDescription:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [a3 cityName];
  }
  else
  {
    BOOL v4 = EventKitUIBundle();
    uint64_t v3 = [v4 localizedStringForKey:@"Floating" value:&stru_1F0CC2140 table:0];
  }

  return v3;
}

- (id)_dateInSystemCalendarFromComponents:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  BOOL v5 = [v3 currentCalendar];
  uint64_t v6 = [v5 dateFromComponents:v4];

  return v6;
}

- (id)_dateFromComponents:(id)a3 timeZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v8 = (void *)[v7 copy];

  if (v6) {
    [v8 setTimeZone:v6];
  }
  uint64_t v9 = [v8 dateFromComponents:v5];

  return v9;
}

- (id)_dateComponentsInSystemCalendarFromDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [v5 components:254 fromDate:v4];

  return v6;
}

- (BOOL)_shouldShowTimeZone
{
  return !self->_allDay
      && !self->_proposedTime
      && (unint64_t)(self->_selectedSubitem - 1) <= 1
      && self->_currentPickerMode == 0;
}

- (BOOL)showsAllDay
{
  return self->_showsAllDay;
}

- (void)setShowsAllDay:(BOOL)a3
{
  self->_BOOL showsAllDay = a3;
}

- (BOOL)proposedTime
{
  return self->_proposedTime;
}

- (void)setProposedTime:(BOOL)a3
{
  self->_proposedTime = a3;
}

- (NSDate)pendingProposedTime
{
  return self->_pendingProposedTime;
}

- (void)setPendingProposedTime:(id)a3
{
}

- (EKEventDateEditItemDelegate)eventDateEditItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDateEditItemDelegate);

  return (EKEventDateEditItemDelegate *)WeakRetained;
}

- (void)setEventDateEditItemDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventDateEditItemDelegate);
  objc_storeStrong((id *)&self->_pendingProposedTime, 0);
  objc_storeStrong((id *)&self->_endPickerConstraints, 0);
  objc_storeStrong((id *)&self->_startPickerConstraints, 0);
  objc_storeStrong((id *)&self->_endDatePicker, 0);
  objc_storeStrong((id *)&self->_startDatePicker, 0);
  objc_storeStrong((id *)&self->_endDatePickerCell, 0);
  objc_storeStrong((id *)&self->_startDatePickerCell, 0);
  objc_storeStrong((id *)&self->_endTimeZoneCell, 0);
  objc_storeStrong((id *)&self->_startTimeZoneCell, 0);
  objc_storeStrong((id *)&self->_allDayCell, 0);
  objc_storeStrong((id *)&self->_classicEndDateCell, 0);
  objc_storeStrong((id *)&self->_classicStartDateCell, 0);
  objc_storeStrong((id *)&self->_modernEndDateCell, 0);
  objc_storeStrong((id *)&self->_modernStartDateCell, 0);
  objc_storeStrong((id *)&self->_endTimeZone, 0);
  objc_storeStrong((id *)&self->_startTimeZone, 0);
  objc_storeStrong((id *)&self->_endComponents, 0);

  objc_storeStrong((id *)&self->_startComponents, 0);
}

@end