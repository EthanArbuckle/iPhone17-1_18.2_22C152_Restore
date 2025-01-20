@interface EKCalendarItemRecurrenceEditItem
+ (id)_neverLocalizedString;
- (BOOL)_validateRecurrenceType:(id)a3;
- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (EKCalendarItemRecurrenceEditItem)init;
- (id)_newDatePicker;
- (id)bestInitialEndDate;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)endRepeatPopupMenu;
- (id)minRecurrenceEndDate;
- (id)recurrenceDate;
- (id)recurrenceRuleFromRepeatType:(int64_t)a3;
- (id)recurrenceTimeZone;
- (id)repeatPopupMenu;
- (id)stringForDate:(id)a3;
- (unint64_t)indexForSubitem:(unint64_t)a3;
- (unint64_t)numberOfSubitems;
- (unint64_t)onSaveEditItemsToRefresh;
- (unint64_t)subitemAtIndex:(unint64_t)a3;
- (void)_datePickerChanged:(id)a3;
- (void)_updateMinRecurrenceEndDate;
- (void)dateTimeCellDateTapped:(id)a3;
- (void)dealloc;
- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)presentCustomRecurrenceVC;
- (void)refreshFromCalendarItemAndStore;
- (void)saveNewRepeatEndDate:(id)a3;
@end

@implementation EKCalendarItemRecurrenceEditItem

- (EKCalendarItemRecurrenceEditItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)EKCalendarItemRecurrenceEditItem;
  v2 = [(EKCalendarItemRecurrenceEditItem *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__contentSizeCategoryChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)EKCalendarItemRecurrenceEditItem;
  [(EKCalendarItemRecurrenceEditItem *)&v4 dealloc];
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  objc_super v4 = [a3 source];
  objc_super v5 = [v4 constraints];
  int v6 = [v5 maxRecurrencesAllowed];

  if (!v6) {
    return 0;
  }
  v7 = [(EKCalendarItemEditItem *)self calendarItem];
  if ([v7 isOrWasPartOfRecurringSeries])
  {
    char v8 = 1;
  }
  else
  {
    v9 = [(EKCalendarItemEditItem *)self calendarItem];
    char v8 = [v9 allowsRecurrenceModifications];
  }
  return v8;
}

- (void)refreshFromCalendarItemAndStore
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)EKCalendarItemRecurrenceEditItem;
  [(EKCalendarItemEditItem *)&v33 refreshFromCalendarItemAndStore];
  p_repeatType = &self->_repeatType;
  self->_repeatType = 0;
  p_repeatEnd = &self->_repeatEnd;
  repeatEnd = self->_repeatEnd;
  self->_repeatEnd = 0;

  customRepeatDescription = self->_customRepeatDescription;
  self->_customRepeatDescription = 0;

  uint64_t v7 = [(EKCalendarItemRecurrenceEditItem *)self recurrenceDate];
  v29 = [(EKCalendarItemRecurrenceEditItem *)self recurrenceTimeZone];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._calendarItem);
  v9 = [WeakRetained singleRecurrenceRule];
  if (v9)
  {
    id v26 = objc_loadWeakRetained((id *)&self->super._calendarItem);
    v25 = [v26 singleRecurrenceRule];
    v34[0] = v25;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  }
  else
  {
    v10 = 0;
  }
  id v11 = objc_loadWeakRetained((id *)&self->super._calendarItem);
  char v12 = [v11 isFloating];
  if (v12)
  {
    v13 = 0;
  }
  else
  {
    id v2 = objc_loadWeakRetained((id *)&self->super._store);
    v13 = [v2 timeZone];
  }
  uint64_t v32 = 0;
  v27 = (void *)v7;
  CUIKGetTypeAndEndDateForRecurrenceRules();
  id v14 = 0;
  if ((v12 & 1) == 0)
  {
  }
  if (v9)
  {
  }
  v15 = [(EKCalendarItemEditItem *)self calendarItem];
  if ([v15 isFloating])
  {
    id v16 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
  }
  else
  {
    id v16 = v29;
  }
  v17 = v16;

  v18 = (void *)CalCopySystemTimeZone();
  if (([v18 isEquivalentTo:v17] & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F57838] calendarDateWithDate:v14 timeZone:v17];
    v20 = [v19 calendarDateInTimeZone:v18];

    uint64_t v21 = [v20 date];

    id v14 = (id)v21;
  }
  objc_storeStrong((id *)&self->_repeatEnd, v14);
  [(EKCalendarItemRecurrenceEditItem *)self _updateMinRecurrenceEndDate];
  if (self->_originalRepeatType != *p_repeatType)
  {
    self->_originalRepeatType = *p_repeatType;
    v22 = [(EKCalendarItemEditItem *)self delegate];
    [v22 editItemWantsFooterTitlesToReload:self];
  }
  objc_storeStrong((id *)&self->_originalRepeatEnd, *p_repeatEnd);
  v23 = [(EKCalendarItemRecurrenceEditItem *)self minRecurrenceEndDate];
  if ([(NSDate *)*p_repeatEnd compare:v23] == NSOrderedAscending)
  {
    dispatch_time_t v24 = dispatch_time(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__EKCalendarItemRecurrenceEditItem_refreshFromCalendarItemAndStore__block_invoke;
    block[3] = &unk_1E6087D68;
    block[4] = self;
    id v31 = v23;
    dispatch_after(v24, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __67__EKCalendarItemRecurrenceEditItem_refreshFromCalendarItemAndStore__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveNewRepeatEndDate:*(void *)(a1 + 40)];
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  if (self->_repeatType == self->_originalRepeatType)
  {
    repeatEnd = self->_repeatEnd;
    if (repeatEnd == self->_originalRepeatEnd || -[NSDate isEqualToDate:](repeatEnd, "isEqualToDate:")) {
      return 0;
    }
  }
  int v6 = [(EKCalendarItemEditItem *)self calendarItem];
  if ([v6 isOrWasPartOfRecurringSeries])
  {
    uint64_t v7 = [v6 singleRecurrenceRule];
  }
  else
  {
    uint64_t v7 = 0;
  }
  char v8 = self->_repeatEnd;
  if (v8)
  {
    v9 = [v7 recurrenceEnd];
    v10 = [v9 endDate];

    if (v8 != v10)
    {
      id v11 = [MEMORY[0x1E4F255E0] recurrenceEndWithEndDate:self->_repeatEnd];
      [v7 setRecurrenceEnd:v11];
    }
  }
  else
  {
    [v7 setRecurrenceEnd:0];
  }

  return 1;
}

- (unint64_t)subitemAtIndex:(unint64_t)a3
{
  if (a3) {
    BOOL v3 = self->_repeatType == 6;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return a3;
  }
  else {
    return a3 + 1;
  }
}

- (unint64_t)indexForSubitem:(unint64_t)a3
{
  if (a3) {
    BOOL v3 = self->_repeatType == 6;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = !v3;
  return a3 - v4;
}

- (unint64_t)numberOfSubitems
{
  int64_t repeatType = self->_repeatType;
  if (repeatType)
  {
    uint64_t v3 = 2;
    if (self->_repeatEnd) {
      uint64_t v3 = 3;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  if (repeatType == 6) {
    uint64_t v4 = v3 + 1;
  }
  else {
    uint64_t v4 = v3;
  }
  return v4 + self->_showingDatePicker;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  switch([(EKCalendarItemRecurrenceEditItem *)self subitemAtIndex:a3])
  {
    case 0uLL:
      if (!self->_repeatCell)
      {
        uint64_t v4 = [[EKUIPopupTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
        repeatCell = self->_repeatCell;
        self->_repeatCell = v4;

        int v6 = EventKitUIBundle();
        uint64_t v7 = [v6 localizedStringForKey:@"Repeat" value:&stru_1F0CC2140 table:0];
        char v8 = [(EKUIPopupTableViewCell *)self->_repeatCell textLabel];
        [v8 setText:v7];
      }
      v9 = [(EKCalendarItemRecurrenceEditItem *)self repeatPopupMenu];
      [(EKUIPopupTableViewCell *)self->_repeatCell setPopupMenu:v9];

      v10 = self->_repeatCell;
      goto LABEL_24;
    case 1uLL:
      customCell = self->_customCell;
      if (!customCell)
      {
        v13 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
        id v14 = self->_customCell;
        self->_customCell = v13;

        v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
        id v16 = [(UITableViewCell *)self->_customCell textLabel];
        [v16 setFont:v15];

        v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        v18 = [(UITableViewCell *)self->_customCell textLabel];
        [v18 setTextColor:v17];

        [(UITableViewCell *)self->_customCell setAccessoryType:1];
        v19 = [(UITableViewCell *)self->_customCell textLabel];
        [v19 setNumberOfLines:0];

        customCell = self->_customCell;
      }
      id v11 = customCell;
      v20 = [(EKCalendarItemEditItem *)self calendarItem];
      uint64_t v21 = [v20 recurrenceRules];
      v22 = [v21 firstObject];
      v23 = v22;
      if (v22)
      {
        id v24 = v22;
      }
      else
      {
        v35 = [(EKCalendarItemEditItem *)self calendarItem];
        id v24 = [v35 singleRecurrenceRule];
      }
      v36 = [(EKCalendarItemEditItem *)self calendarItem];
      v37 = [v36 startDateForRecurrence];
      v38 = [(EKCalendarItemEditItem *)self calendarItem];
      v39 = [v38 eventStore];
      v40 = [v39 timeZone];
      CUIKStringForRecurrenceRule();
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v42 = NSString;
      v43 = EventKitUIBundle();
      v44 = [v43 localizedStringForKey:@"Repeats %@" value:&stru_1F0CC2140 table:0];
      if (v41) {
        v45 = v41;
      }
      else {
        v45 = &stru_1F0CC2140;
      }
      v46 = objc_msgSend(v42, "localizedStringWithFormat:", v44, v45);
      v47 = [(EKUIPopupTableViewCell *)v11 textLabel];
      [v47 setText:v46];

      goto LABEL_21;
    case 2uLL:
      id v11 = [[EKUIPopupTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
      v25 = EventKitUIBundle();
      id v26 = [v25 localizedStringForKey:@"End Repeat" value:&stru_1F0CC2140 table:0];
      v27 = [(EKUIPopupTableViewCell *)v11 textLabel];
      [v27 setText:v26];

      v28 = [(EKCalendarItemRecurrenceEditItem *)self endRepeatPopupMenu];
      [(EKUIPopupTableViewCell *)v11 setPopupMenu:v28];

      break;
    case 3uLL:
      if (!self->_endDateCell)
      {
        v29 = [[EKDateTimeCell alloc] initWithStyle:0 reuseIdentifier:0];
        endDateCell = self->_endDateCell;
        self->_endDateCell = v29;

        [(EKDateTimeCell *)self->_endDateCell setDateTimeDelegate:self];
        id v31 = self->_endDateCell;
        uint64_t v32 = EventKitUIBundle();
        objc_super v33 = [v32 localizedStringForKey:@"End Date" value:&stru_1F0CC2140 table:0];
        [(EKDateTimeCell *)v31 setTitle:v33];
      }
      v34 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      id v24 = [v34 components:254 fromDate:self->_repeatEnd];

      [(EKDateTimeCell *)self->_endDateCell updateWithDate:v24 timeZone:0 allDay:1 needsStrikethrough:0];
      id v11 = self->_endDateCell;
LABEL_21:

      break;
    case 4uLL:
      if (!self->_endDatePickerCell)
      {
        v48 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
        endDatePickerCell = self->_endDatePickerCell;
        self->_endDatePickerCell = v48;

        v50 = [(EKCalendarItemRecurrenceEditItem *)self _newDatePicker];
        endDatePicker = self->_endDatePicker;
        self->_endDatePicker = v50;

        v52 = [(EKUITableViewCell *)self->_endDatePickerCell contentView];
        [v52 addSubview:self->_endDatePicker];

        v70 = (void *)MEMORY[0x1E4F1CA48];
        v53 = (void *)MEMORY[0x1E4F28DC8];
        v54 = self->_endDatePicker;
        v71 = [(EKUITableViewCell *)self->_endDatePickerCell contentView];
        v55 = [v53 constraintWithItem:v54 attribute:5 relatedBy:0 toItem:v71 attribute:5 multiplier:1.0 constant:0.0];
        v56 = (void *)MEMORY[0x1E4F28DC8];
        v57 = self->_endDatePicker;
        v69 = [(EKUITableViewCell *)self->_endDatePickerCell contentView];
        v58 = [v56 constraintWithItem:v57 attribute:6 relatedBy:0 toItem:v69 attribute:6 multiplier:1.0 constant:0.0];
        v59 = (void *)MEMORY[0x1E4F28DC8];
        v60 = self->_endDatePicker;
        v61 = [(EKUITableViewCell *)self->_endDatePickerCell contentView];
        v62 = [v59 constraintWithItem:v60 attribute:4 relatedBy:0 toItem:v61 attribute:4 multiplier:1.0 constant:0.0];
        v63 = (void *)MEMORY[0x1E4F28DC8];
        v64 = self->_endDatePicker;
        v65 = [(EKUITableViewCell *)self->_endDatePickerCell contentView];
        v66 = [v63 constraintWithItem:v64 attribute:3 relatedBy:0 toItem:v65 attribute:3 multiplier:1.0 constant:0.0];
        v67 = objc_msgSend(v70, "arrayWithObjects:", v55, v58, v62, v66, 0);

        [MEMORY[0x1E4F28DC8] activateConstraints:v67];
      }
      [(UIDatePicker *)self->_endDatePicker setDate:self->_repeatEnd];
      [(EKCalendarItemRecurrenceEditItem *)self _updateMinRecurrenceEndDate];
      v10 = (EKUIPopupTableViewCell *)self->_endDatePickerCell;
LABEL_24:
      id v11 = v10;
      break;
    default:
      id v11 = 0;
      break;
  }

  return v11;
}

- (id)repeatPopupMenu
{
  id v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB13F0];
    objc_super v5 = CUIKStringForRepeatTypeDetail();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__EKCalendarItemRecurrenceEditItem_repeatPopupMenu__block_invoke;
    v18[3] = &unk_1E608AF40;
    objc_copyWeak(v19, &location);
    v19[1] = v3;
    int v6 = [v4 actionWithTitle:v5 image:0 identifier:0 handler:v18];

    if (v3 == (char *)self->_repeatType) {
      [v6 setState:1];
    }
    [v15 addObject:v6];

    objc_destroyWeak(v19);
    ++v3;
  }
  while (v3 != (char *)6);
  CalAddInlineMenuItemArrayToArray(v14, (const char *)v15);
  uint64_t v7 = EventKitUIBundle();
  char v8 = [v7 localizedStringForKey:@"Custom" value:&stru_1F0CC2140 table:0];

  v9 = (void *)MEMORY[0x1E4FB13F0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__EKCalendarItemRecurrenceEditItem_repeatPopupMenu__block_invoke_2;
  v16[3] = &unk_1E6088B78;
  objc_copyWeak(&v17, &location);
  v10 = [v9 actionWithTitle:v8 image:0 identifier:0 handler:v16];
  id v11 = v10;
  if (self->_repeatType == 6) {
    [v10 setState:1];
  }
  [v14 addObject:v11];
  char v12 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v12;
}

void __51__EKCalendarItemRecurrenceEditItem_repeatPopupMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained recurrenceRuleFromRepeatType:*(void *)(a1 + 40)];
  if ([WeakRetained _validateRecurrenceType:v2])
  {
    WeakRetained[128] = 0;
    [WeakRetained notifySubitemDidSave:0];
  }
}

void __51__EKCalendarItemRecurrenceEditItem_repeatPopupMenu__block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained[6] != 6)
  {
    WeakRetained[6] = 6;
    uint64_t v3 = [WeakRetained calendarItem];
    uint64_t v4 = (void *)MEMORY[0x1E4F255F8];
    objc_super v5 = [v2 calendarItem];
    int v6 = [v5 singleRecurrenceRule];
    uint64_t v7 = [v6 recurrenceEnd];
    char v8 = [v4 recurrenceRuleWithType:0 interval:1 end:v7];
    v10[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v3 setRecurrenceRules:v9];

    [v2 notifySubitemDidSave:0];
  }
  [v2 performSelector:sel_presentCustomRecurrenceVC withObject:0 afterDelay:0.1];
}

- (id)endRepeatPopupMenu
{
  v20[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v4 = [(id)objc_opt_class() _neverLocalizedString];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__EKCalendarItemRecurrenceEditItem_endRepeatPopupMenu__block_invoke;
  v17[3] = &unk_1E6088B78;
  objc_copyWeak(&v18, &location);
  objc_super v5 = [v3 actionWithTitle:v4 image:0 identifier:0 handler:v17];

  int v6 = EventKitUIBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"On Date" value:&stru_1F0CC2140 table:0];

  char v8 = (void *)MEMORY[0x1E4FB13F0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__EKCalendarItemRecurrenceEditItem_endRepeatPopupMenu__block_invoke_2;
  v15[3] = &unk_1E6088218;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  v9 = [v8 actionWithTitle:v7 image:0 identifier:0 handler:v15];
  v10 = v9;
  if (!self->_repeatEnd) {
    v9 = v5;
  }
  [v9 setState:1];
  id v11 = (void *)MEMORY[0x1E4FB1970];
  v20[0] = v5;
  v20[1] = v10;
  char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v13 = [v11 menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v13;
}

void __54__EKCalendarItemRecurrenceEditItem_endRepeatPopupMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[128] = 0;
  [WeakRetained saveNewRepeatEndDate:0];
}

void __54__EKCalendarItemRecurrenceEditItem_endRepeatPopupMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  WeakRetained[128] = 0;
  id v2 = [*(id *)(a1 + 32) bestInitialEndDate];
  [WeakRetained saveNewRepeatEndDate:v2];
}

- (id)_newDatePicker
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB16B0]);
  [v3 setPreferredDatePickerStyle:3];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setDatePickerMode:1];
  uint64_t v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  [v4 setFirstWeekday:CUIKOneIndexedWeekStart()];
  [v3 setCalendar:v4];
  [v3 addTarget:self action:sel__datePickerChanged_ forControlEvents:4096];

  return v3;
}

+ (id)_neverLocalizedString
{
  id v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Never" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)recurrenceRuleFromRepeatType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 6)
    {
      id v3 = 0;
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x1E4F255F8]);
      uint64_t v7 = CUIKRecurrenceFrequencyForRepeatType();
      id v3 = (void *)[v6 initRecurrenceWithFrequency:v7 interval:CUIKIntervalForRepeatType() end:0];
    }
  }
  else
  {
    objc_super v5 = [(EKCalendarItemEditItem *)self calendarItem];
    if ([v5 isMainOccurrence])
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [v5 singleRecurrenceRule];
      char v8 = [v5 endDate];
      [(EKCalendarItemRecurrenceEditItem *)self saveNewRepeatEndDate:v8];
    }
  }

  return v3;
}

- (void)_datePickerChanged:(id)a3
{
  id v4 = [a3 date];
  [(EKCalendarItemRecurrenceEditItem *)self saveNewRepeatEndDate:v4];
}

- (void)saveNewRepeatEndDate:(id)a3
{
  id v20 = a3;
  objc_storeStrong((id *)&self->_repeatEnd, a3);
  objc_super v5 = [(EKCalendarItemEditItem *)self calendarItem];
  if ([v5 isOrWasPartOfRecurringSeries])
  {
    id v6 = [v5 singleRecurrenceRule];
  }
  else
  {
    id v6 = 0;
  }
  if (!self->_repeatEnd)
  {
    [v6 setRecurrenceEnd:0];
    goto LABEL_16;
  }
  if (([v5 isAllDay] & 1) == 0)
  {
    uint64_t v7 = [(EKCalendarItemEditItem *)self calendarItem];
    if ([v7 isFloating]) {
      [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
    }
    else {
    char v8 = [(EKCalendarItemRecurrenceEditItem *)self recurrenceTimeZone];
    }

    v9 = (void *)CalCopySystemTimeZone();
    v10 = [MEMORY[0x1E4F57838] calendarDateWithDate:v20 timeZone:v9];
    id v11 = [v10 calendarDateInTimeZone:v8];

    uint64_t v12 = [v11 date];

    id v20 = (id)v12;
  }
  v13 = [v6 recurrenceEnd];
  uint64_t v14 = [v13 endDate];
  if (!v14)
  {

    goto LABEL_15;
  }
  v15 = (void *)v14;
  id v16 = [v6 recurrenceEnd];
  id v17 = [v16 endDate];
  char v18 = [v20 isEqualToDate:v17];

  if ((v18 & 1) == 0)
  {
LABEL_15:
    v19 = [MEMORY[0x1E4F255E0] recurrenceEndWithEndDate:v20];
    [v6 setRecurrenceEnd:v19];
  }
LABEL_16:
  [(EKCalendarItemRecurrenceEditItem *)self _updateMinRecurrenceEndDate];
  [(EKCalendarItemEditItem *)self notifySubitemDidSave:0];
}

- (void)_updateMinRecurrenceEndDate
{
  id v3 = [(EKCalendarItemRecurrenceEditItem *)self minRecurrenceEndDate];
  [(UIDatePicker *)self->_endDatePicker setMinimumDate:v3];
}

- (BOOL)_validateRecurrenceType:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v45[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [(EKCalendarItemRecurrenceEditItem *)self recurrenceDate];
  char v8 = [(EKCalendarItemRecurrenceEditItem *)self recurrenceTimeZone];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._calendarItem);
  if ([WeakRetained isFloating])
  {
    p_int64_t repeatType = &self->_repeatType;
    CUIKGetTypeAndEndDateForRecurrenceRules();
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)&self->super._store);
    uint64_t v12 = [v11 timeZone];
    p_int64_t repeatType = &self->_repeatType;
    CUIKGetTypeAndEndDateForRecurrenceRules();
  }
  if (v5) {

  }
  if (*p_repeatType)
  {
    if (*p_repeatType != 6)
    {
      v22 = [(EKCalendarItemEditItem *)self calendarItem];
      v15 = [v22 calendar];

      if (v15)
      {
        id v17 = [(EKCalendarItemEditItem *)self calendarItem];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_18:

          goto LABEL_19;
        }
        v23 = [v15 source];
        id v24 = [v23 constraints];
        int v25 = [v24 eventDurationConstrainedToRecurrenceInterval];

        if (v25)
        {
          id v17 = [(EKCalendarItemEditItem *)self calendarItem];
          id v26 = objc_loadWeakRetained((id *)&self->super._store);
          [v26 timeZone];

          v27 = [v17 startDate];
          [v27 timeIntervalSinceReferenceDate];

          v28 = [v17 endDateUnadjustedForLegacyClients];
          [v28 timeIntervalSinceReferenceDate];
          double v30 = v29;

          long long v42 = 0u;
          long long v43 = 0u;
          CUIKRecurrenceFrequencyForRepeatType();
          CUIKIntervalForRepeatType();
          CUIKGregorianUnitsForRecurrenceTypeAndInterval();
          long long v40 = 0u;
          long long v41 = 0u;
          CalAbsoluteTimeAddGregorianUnits();
          if (v31 < v30)
          {
            char v18 = [(EKCalendarItemEditItem *)self delegate];
            v19 = [v18 viewControllerForEditItem:self];
            id v20 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:7];
            uint64_t v21 = [(EKCalendarItemEditItem *)self delegate];
            v38 = [v21 defaultAlertTitleForEditItem:self];
            PresentValidationAlertWithDefaultTitle(v19, v20, v38);

            goto LABEL_30;
          }
          goto LABEL_18;
        }
      }
LABEL_19:

      goto LABEL_20;
    }
    v13 = [(EKCalendarItemEditItem *)self calendarItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v15 = [(EKCalendarItemEditItem *)self calendarItem];
      id v39 = 0;
      char v16 = [v15 validateRecurrenceRule:v5 error:&v39];
      id v17 = v39;
      if ((v16 & 1) == 0)
      {
        char v18 = [(EKCalendarItemEditItem *)self delegate];
        v19 = [v18 viewControllerForEditItem:self];
        id v20 = [(EKCalendarItemEditItem *)self delegate];
        uint64_t v21 = [v20 defaultAlertTitleForEditItem:self];
        PresentValidationAlertWithDefaultTitle(v19, v17, v21);
LABEL_30:

        BOOL v33 = 0;
        p_originalRepeatType = &self->_originalRepeatType;
LABEL_27:
        int64_t *p_repeatType = *p_originalRepeatType;
        goto LABEL_28;
      }
      goto LABEL_18;
    }
  }
LABEL_20:
  uint64_t v32 = &self->_originalRepeatType;
  if (*p_repeatType == 6 || *p_repeatType != *v32)
  {
    if (v5)
    {
      v44 = v5;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      v35 = [(EKCalendarItemEditItem *)self calendarItem];
      [v35 setRecurrenceRules:v34];
    }
    else
    {
      v34 = [(EKCalendarItemEditItem *)self calendarItem];
      [v34 setRecurrenceRules:0];
    }

    BOOL v33 = 1;
    p_originalRepeatType = p_repeatType;
    p_int64_t repeatType = v32;
    goto LABEL_27;
  }
  BOOL v33 = 1;
LABEL_28:

  return v33;
}

- (void)presentCustomRecurrenceVC
{
  id v3 = [(EKCalendarItemEditItem *)self calendarItem];
  id v4 = [v3 eventStore];
  objc_super v5 = [v4 timeZone];

  id v6 = [(EKCalendarItemEditItem *)self calendarItem];
  if ([v6 isOrWasPartOfRecurringSeries])
  {
    uint64_t v7 = [(EKCalendarItemEditItem *)self calendarItem];
    char v8 = [v7 singleRecurrenceRule];
  }
  else
  {
    char v8 = 0;
  }

  v9 = [EKUICustomRecurrenceViewController alloc];
  v10 = [(EKCalendarItemEditItem *)self calendarItem];
  id v11 = [v10 startDateForRecurrence];
  uint64_t v12 = [(EKUICustomRecurrenceViewController *)v9 initWithStartDate:v11 timeZone:v5 clearBackground:0];

  [(EKUICustomRecurrenceViewController *)v12 setRecurrenceRule:v8];
  v13 = [(EKCalendarItemEditItem *)self calendarItem];
  uint64_t v14 = [v13 calendar];
  v15 = [v14 source];
  char v16 = [v15 constraints];

  -[EKUICustomRecurrenceViewController setProhibitsMultipleDaysInMonthlyRecurrence:](v12, "setProhibitsMultipleDaysInMonthlyRecurrence:", [v16 prohibitsMultipleDaysInMonthlyRecurrence]);
  -[EKUICustomRecurrenceViewController setProhibitsMultipleMonthsInYearlyRecurrence:](v12, "setProhibitsMultipleMonthsInYearlyRecurrence:", [v16 prohibitsMultipleMonthsInYearlyRecurrence]);
  -[EKUICustomRecurrenceViewController setProhibitsYearlyRecurrenceInterval:](v12, "setProhibitsYearlyRecurrenceInterval:", [v16 prohibitsYearlyRecurrenceInterval]);
  objc_initWeak(&location, self);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __61__EKCalendarItemRecurrenceEditItem_presentCustomRecurrenceVC__block_invoke;
  id v24 = &unk_1E608AF68;
  objc_copyWeak(&v25, &location);
  [(EKUICustomRecurrenceViewController *)v12 setCompletionBlock:&v21];
  -[EKUICustomRecurrenceViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 7, v21, v22, v23, v24);
  id v17 = [(EKUICustomRecurrenceViewController *)v12 popoverPresentationController];
  char v18 = v17;
  customCell = (EKUIPopupTableViewCell *)self->_customCell;
  if (!customCell) {
    customCell = self->_repeatCell;
  }
  [v17 setSourceView:customCell];
  [v18 setPermittedArrowDirections:12];
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(0) || EKUIUseLargeFormatPhoneUI())
  {
    id v20 = [(EKCalendarItemEditItem *)self delegate];
    [v20 editItem:self wantsViewControllerPushed:v12];
  }
  else
  {
    id v20 = [(EKCalendarItemEditItem *)self delegate];
    [v20 editItem:self wantsViewControllerPresented:v12];
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __61__EKCalendarItemRecurrenceEditItem_presentCustomRecurrenceVC__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = [WeakRetained _validateRecurrenceType:v3];

  if (v2)
  {
    WeakRetained[128] = 0;
    [WeakRetained notifySubitemDidSave:0];
  }
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  if ([(EKCalendarItemRecurrenceEditItem *)self subitemAtIndex:a4] == 1)
  {
    [(EKCalendarItemRecurrenceEditItem *)self presentCustomRecurrenceVC];
  }
}

- (id)bestInitialEndDate
{
  id v3 = [(EKCalendarItemRecurrenceEditItem *)self minRecurrenceEndDate];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_super v5 = v4;
  switch(self->_repeatType)
  {
    case 0:
    case 2:
    case 6:
      uint64_t v6 = 1;
      goto LABEL_8;
    case 1:
      [v4 setDay:7];
      break;
    case 3:
      uint64_t v6 = 2;
LABEL_8:
      [v4 setMonth:v6];
      break;
    case 4:
      uint64_t v7 = 1;
      goto LABEL_6;
    case 5:
      uint64_t v7 = 5;
LABEL_6:
      [v4 setYear:v7];
      break;
    default:
      break;
  }
  char v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v8 dateByAddingComponents:v5 toDate:v3 options:0];

  return v9;
}

- (unint64_t)onSaveEditItemsToRefresh
{
  return 1;
}

- (void)dateTimeCellDateTapped:(id)a3
{
  self->_showingDatePicker ^= 1u;
  [(EKCalendarItemRecurrenceEditItem *)self _updateMinRecurrenceEndDate];
  objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", -[EKCalendarItemRecurrenceEditItem indexForSubitem:](self, "indexForSubitem:", 4));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(EKCalendarItemEditItem *)self delegate];
  if (self->_showingDatePicker) {
    id v5 = v7;
  }
  else {
    id v5 = 0;
  }
  if (self->_showingDatePicker) {
    id v6 = 0;
  }
  else {
    id v6 = v7;
  }
  [v4 editItem:self wantsRowInsertions:v5 rowDeletions:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDatePicker, 0);
  objc_storeStrong((id *)&self->_endDatePickerCell, 0);
  objc_storeStrong((id *)&self->_endDateCell, 0);
  objc_storeStrong((id *)&self->_customCell, 0);
  objc_storeStrong((id *)&self->_repeatCell, 0);
  objc_storeStrong((id *)&self->_customRepeatDescription, 0);
  objc_storeStrong((id *)&self->_originalRepeatEnd, 0);

  objc_storeStrong((id *)&self->_repeatEnd, 0);
}

- (id)recurrenceDate
{
  return 0;
}

- (id)recurrenceTimeZone
{
  return 0;
}

- (id)stringForDate:(id)a3
{
  return 0;
}

- (id)minRecurrenceEndDate
{
  return 0;
}

@end