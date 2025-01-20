@interface EKCalendarItemAlarmEditItem
- (BOOL)_alarmsMatchCalendarItem;
- (BOOL)_calendarItemHasLeaveNowAlarm;
- (BOOL)configureForCalendarConstraints:(id)a3;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (EKAlarmsViewModel)alarmsViewModel;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)footerTitle;
- (unint64_t)numberOfSubitems;
- (void)_updateAlarms;
- (void)refreshFromCalendarItemAndStore;
- (void)setAlarmsViewModel:(id)a3;
- (void)setCalendarItem:(id)a3 store:(id)a4;
- (void)ttlLocationStatusChanged:(id)a3;
@end

@implementation EKCalendarItemAlarmEditItem

- (void)setCalendarItem:(id)a3 store:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKCalendarItemAlarmEditItem;
  [(EKCalendarItemEditItem *)&v12 setCalendarItem:v6 store:a4];
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8 = [(EKCalendarItemAlarmEditItem *)self alarmsViewModel];
  [v7 removeObserver:self name:@"EKAlarmsViewModelTTLLocationStatusChangedNotification" object:v8];

  if (v6)
  {
    v9 = [[EKAlarmsViewModel alloc] initWithCalendarItem:v6];
    [(EKCalendarItemAlarmEditItem *)self setAlarmsViewModel:v9];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v11 = [(EKCalendarItemAlarmEditItem *)self alarmsViewModel];
    [v10 addObserver:self selector:sel_ttlLocationStatusChanged_ name:@"EKAlarmsViewModelTTLLocationStatusChangedNotification" object:v11];
  }
  else
  {
    [(EKCalendarItemAlarmEditItem *)self setAlarmsViewModel:0];
  }
  [(EKCalendarItemAlarmEditItem *)self _updateAlarms];
}

- (unint64_t)numberOfSubitems
{
  v3 = [(EKCalendarItemEditItem *)self calendarItem];
  v4 = [v3 calendar];
  v5 = [v4 source];
  id v6 = [v5 constraints];
  int v7 = [v6 maxAlarmsAllowed];

  NSUInteger v8 = [(NSArray *)self->_alarms count];
  uint64_t v9 = 1;
  if (self->_hasLeaveNowAlarm) {
    uint64_t v9 = 2;
  }
  unint64_t v10 = v9 + v8;
  if (v7 == -1) {
    int v11 = 2;
  }
  else {
    int v11 = v7;
  }
  if (v10 >= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }

  return v12;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_alarms count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_alarms objectAtIndexedSubscript:a3];
  }
  id v6 = [[EKUIPopupTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  int v7 = v6;
  if (v5)
  {
    NSUInteger v8 = [(EKCalendarItemAlarmEditItem *)self alarmsViewModel];
    -[EKUIPopupTableViewCell setTitleStrikethrough:](v7, "setTitleStrikethrough:", [v8 isAlarmEffectivelyDisabled:v5]);
  }
  else
  {
    [(EKUIPopupTableViewCell *)v6 setTitleStrikethrough:0];
  }
  uint64_t v9 = [(EKCalendarItemAlarmEditItem *)self alarmsViewModel];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__EKCalendarItemAlarmEditItem_cellForSubitemAtIndex___block_invoke;
  v14[3] = &unk_1E608A550;
  v14[4] = self;
  v14[5] = a3;
  unint64_t v10 = [v9 menuForAlarmAtIndex:a3 actionHandler:v14];
  [(EKUIPopupTableViewCell *)v7 setPopupMenu:v10];

  int v11 = +[EKAlarmsViewModel labelTextForIndex:a3];
  unint64_t v12 = [(EKUIPopupTableViewCell *)v7 textLabel];
  [v12 setText:v11];

  return v7;
}

void __53__EKCalendarItemAlarmEditItem_cellForSubitemAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) alarmsViewModel];

  if (v7)
  {
    NSUInteger v8 = [*(id *)(a1 + 32) alarmsViewModel];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__EKCalendarItemAlarmEditItem_cellForSubitemAtIndex___block_invoke_2;
    v11[3] = &unk_1E6088570;
    uint64_t v9 = *(void *)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    [v8 updatedUIAlarmFromUIAlarm:v5 toUIAlarm:v6 atIndex:v9 completion:v11];
  }
  else
  {
    unint64_t v10 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[EKCalendarItemAlarmEditItem cellForSubitemAtIndex:]_block_invoke";
      _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_ERROR, "Error: %s: 'alarmsViewModel' should not be nil", buf, 0xCu);
    }
  }
}

uint64_t __53__EKCalendarItemAlarmEditItem_cellForSubitemAtIndex___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) _updateAlarms];
    [*(id *)(v2 + 32) notifySubitemDidSave:0];
    v3 = *(void **)(v2 + 32);
    return [v3 editItemViewController:0 didCompleteWithAction:2];
  }
  return result;
}

- (id)footerTitle
{
  v3 = [(EKCalendarItemEditItem *)self calendarItem];
  v4 = [v3 calendar];
  int v5 = [v4 isIgnoringEventAlerts];

  if (v5)
  {
    id v6 = [(EKCalendarItemEditItem *)self calendarItem];
    int v7 = [v6 calendar];
    NSUInteger v8 = CUIKDisplayedTitleForCalendar();

    uint64_t v9 = EventKitUIBundle();
    unint64_t v10 = [v9 localizedStringForKey:@"Event Alerts" value:&stru_1F0CC2140 table:0];

    int v11 = NSString;
    unint64_t v12 = EventKitUIBundle();
    v13 = [v12 localizedStringForKey:@"Alerts for this calendar are disabled.\nTo allow this alert to fire, enable ‘%@’ in the calendar settings for ‘%@’.", &stru_1F0CC2140, 0 value table];
    uint64_t v14 = objc_msgSend(v11, "localizedStringWithFormat:", v13, v10, v8);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)EKCalendarItemAlarmEditItem;
    uint64_t v14 = [(EKCalendarItemEditItem *)&v16 footerTitle];
  }

  return v14;
}

- (BOOL)configureForCalendarConstraints:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EKCalendarItemAlarmEditItem *)self _updateAlarms];
  int v5 = [(EKCalendarItemEditItem *)self calendarItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v23 = self;
    int v7 = [(EKCalendarItemEditItem *)self calendarItem];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    NSUInteger v8 = [v7 alarms];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (!v9) {
      goto LABEL_15;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v13 isAbsolute])
        {
          uint64_t v14 = [v13 absoluteDate];
          v15 = [v7 startDate];
          uint64_t v16 = [v14 compare:v15];

          if (v16 != 1) {
            continue;
          }
        }
        else
        {
          [v13 relativeOffset];
          if (v17 <= 0.0) {
            continue;
          }
        }
        v18 = [v4 source];
        v19 = [v18 constraints];
        char v20 = [v19 supportsAlarmsTriggeringAfterStartDate];

        if ((v20 & 1) == 0) {
          [v7 removeAlarm:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (!v10)
      {
LABEL_15:

        self = v23;
        break;
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)EKCalendarItemAlarmEditItem;
  BOOL v21 = [(EKCalendarItemEditItem *)&v24 configureForCalendarConstraints:v4];

  return v21;
}

- (BOOL)_calendarItemHasLeaveNowAlarm
{
  v3 = [(EKCalendarItemEditItem *)self calendarItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  int v5 = [(EKCalendarItemEditItem *)self calendarItem];
  if ([v5 eligibleForTravelAdvisories]) {
    char v6 = [v5 travelAdvisoryBehaviorIsEffectivelyEnabled];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)_updateAlarms
{
  v3 = [(EKCalendarItemAlarmEditItem *)self alarmsViewModel];
  [v3 setNeedsUpdate];

  id v4 = [(EKCalendarItemAlarmEditItem *)self alarmsViewModel];
  int v5 = [v4 uiAlarms];

  alarms = self->_alarms;
  self->_alarms = v5;
}

- (void)refreshFromCalendarItemAndStore
{
  v3.receiver = self;
  v3.super_class = (Class)EKCalendarItemAlarmEditItem;
  [(EKCalendarItemEditItem *)&v3 refreshFromCalendarItemAndStore];
  [(EKCalendarItemAlarmEditItem *)self _updateAlarms];
}

- (void)ttlLocationStatusChanged:(id)a3
{
  id v4 = [(EKCalendarItemEditItem *)self delegate];
  uint64_t v5 = [v4 rowNumberForEditItem:self];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__EKCalendarItemAlarmEditItem_ttlLocationStatusChanged___block_invoke;
  v6[3] = &unk_1E6087E70;
  v6[4] = self;
  v6[5] = v5;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
}

void __56__EKCalendarItemAlarmEditItem_ttlLocationStatusChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) numberOfSubitems];
  if (v2)
  {
    uint64_t v3 = v2;
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForRow:i + *(void *)(a1 + 40) inSection:0];
      char v6 = [*(id *)(a1 + 32) delegate];
      [v6 editItem:*(void *)(a1 + 32) wantsRowReload:v5];
    }
  }
}

- (BOOL)_alarmsMatchCalendarItem
{
  uint64_t v3 = [(EKCalendarItemEditItem *)self calendarItem];
  BOOL v4 = [(EKCalendarItemAlarmEditItem *)self _calendarItemHasLeaveNowAlarm];
  if (self->_hasLeaveNowAlarm == v4
    && (BOOL v5 = v4,
        [v3 alarms],
        char v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        [(NSArray *)self->_alarms count] == v7 + v5))
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 1;
    NSUInteger v8 = [(EKCalendarItemEditItem *)self calendarItem];
    uint64_t v9 = [v8 alarms];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__EKCalendarItemAlarmEditItem__alarmsMatchCalendarItem__block_invoke;
    v12[3] = &unk_1E608A578;
    v12[4] = self;
    v12[5] = &v13;
    [v9 enumerateObjectsUsingBlock:v12];

    BOOL v10 = *((unsigned char *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __55__EKCalendarItemAlarmEditItem__alarmsMatchCalendarItem__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 56);
  id v8 = a2;
  uint64_t v9 = [v7 objectAtIndexedSubscript:a3];
  BOOL v10 = [v9 alarm];
  char v11 = [v8 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  BOOL v4 = [(EKCalendarItemAlarmEditItem *)self _alarmsMatchCalendarItem];
  if (!v4) {
    [(EKCalendarItemAlarmEditItem *)self _updateAlarms];
  }
  return !v4;
}

- (EKAlarmsViewModel)alarmsViewModel
{
  return self->_alarmsViewModel;
}

- (void)setAlarmsViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmsViewModel, 0);

  objc_storeStrong((id *)&self->_alarms, 0);
}

@end