@interface HUScheduleRuleEditorItemModuleController
- (BOOL)_validateEndDateAfterNowDate:(id)a3;
- (BOOL)_validateEndDateAfterStartDate:(id)a3 startDate:(id)a4;
- (BOOL)_validateRecurrences:(id)a3;
- (BOOL)_validateStartDateBeforeEndDate:(id)a3 endDate:(id)a4;
- (Class)cellClassForItem:(id)a3;
- (HUScheduleRuleEditorItemModuleControllerDelegate)delegate;
- (id)_editorItemModule;
- (unint64_t)didSelectItem:(id)a3;
- (void)_presentAlertWithError:(int64_t)a3;
- (void)didUpdateDate:(id)a3 date:(id)a4 editorContext:(unint64_t)a5;
- (void)didUpdateRecurrences:(id)a3 recurrences:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)timePickerCell:(id)a3 didSelectEndTime:(id)a4;
- (void)timePickerCell:(id)a3 didSelectStartTime:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUScheduleRuleEditorItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUScheduleRuleEditorItemModuleController *)self _editorItemModule];
  v6 = [v5 editStartDatePeriodItem];
  if ([v4 isEqual:v6]) {
    goto LABEL_4;
  }
  v7 = [v5 editEndDatePeriodItem];
  if ([v4 isEqual:v7])
  {

LABEL_4:
    goto LABEL_5;
  }
  v10 = [v5 editRecurrenceItem];
  char v11 = [v4 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    v12 = [v5 allDayItem];
    char v13 = [v4 isEqual:v12];

    if ((v13 & 1) == 0)
    {
      v14 = [v5 editTimeOfDayItem];
      char v15 = [v4 isEqual:v14];

      if ((v15 & 1) == 0)
      {
        v16 = [v5 removeRuleItem];
        [v4 isEqual:v16];
      }
    }
  }
LABEL_5:
  v8 = objc_opt_class();

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HUScheduleRuleEditorItemModuleController;
  [(HUItemModuleController *)&v26 setupCell:v6 forItem:v7];
  v8 = [(HUScheduleRuleEditorItemModuleController *)self _editorItemModule];
  objc_opt_class();
  id v9 = v6;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  v12 = [v8 editTimeOfDayItem];
  int v13 = [v7 isEqual:v12];

  if (v13 && v11)
  {
    v14 = [v8 editedStartTime];
    char v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      v17 = [v8 editedScheduleRule];
      v18 = [v17 weekDayRule];
      id v16 = [v18 startTime];
    }
    v19 = [v8 editedEndTime];
    v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      v22 = [v8 editedScheduleRule];
      v23 = [v22 weekDayRule];
      id v21 = [v23 endTime];
    }
    [v11 setStartTimeComponents:v16];
    [v11 setEndTimeComponents:v21];
    v24 = [v7 latestResults];
    v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [v11 setTitle:v25];

    [v11 setDelegate:self];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)HUScheduleRuleEditorItemModuleController;
  [(HUItemModuleController *)&v34 updateCell:v8 forItem:v9 animated:v5];
  v10 = [(HUScheduleRuleEditorItemModuleController *)self _editorItemModule];
  objc_opt_class();
  id v11 = v8;
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (!v13) {
    goto LABEL_10;
  }
  v14 = [v10 editStartDatePeriodItem];
  if ([v9 isEqual:v14]) {
    goto LABEL_8;
  }
  char v15 = [v10 editEndDatePeriodItem];
  if ([v9 isEqual:v15])
  {

LABEL_8:
LABEL_9:
    [v13 setAccessoryView:0];
    [v13 setHideIcon:1];
    [v13 setAccessoryType:1];
    [v13 setDisabled:0];
    id v16 = [v9 latestResults];
    v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v13 setAccessibilityIdentifier:v17];

    goto LABEL_10;
  }
  v32 = [v10 editRecurrenceItem];
  char v33 = [v9 isEqual:v32];

  if (v33) {
    goto LABEL_9;
  }
LABEL_10:
  objc_opt_class();
  id v18 = v11;
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  if (v20)
  {
    id v21 = [v10 removeRuleItem];
    int v22 = [v9 isEqual:v21];

    if (v22)
    {
      [v20 setDestructive:1];
      v23 = [v9 latestResults];
      v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v20 setAccessibilityIdentifier:v24];
    }
  }
  objc_opt_class();
  id v25 = v18;
  if (objc_opt_isKindOfClass()) {
    objc_super v26 = v25;
  }
  else {
    objc_super v26 = 0;
  }
  id v27 = v26;

  if (v27)
  {
    v28 = [v10 allDayItem];
    int v29 = [v9 isEqual:v28];

    if (v29)
    {
      [v27 setDelegate:self];
      v30 = [v9 latestResults];
      v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v27 setAccessibilityIdentifier:v31];
    }
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v37 = 138412802;
    v38 = self;
    __int16 v39 = 2112;
    v40 = v7;
    __int16 v41 = 2112;
    id v42 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User selected item [%@]", (uint8_t *)&v37, 0x20u);
  }
  id v8 = [(HUScheduleRuleEditorItemModuleController *)self _editorItemModule];
  id v9 = [v8 editStartDatePeriodItem];
  int v10 = [v5 isEqual:v9];

  if (v10)
  {
    id v11 = [v8 editedScheduleRule];
    v12 = [v11 yearDayRule];
    id v13 = [v12 validFrom];

    v14 = [[HUScheduleDateEditorViewController alloc] initWithDate:v13 editorContext:0 delegate:self];
    char v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = NSStringFromSelector(a2);
      v17 = [v8 editedScheduleRule];
      int v37 = 138413058;
      v38 = self;
      __int16 v39 = 2112;
      v40 = v16;
      __int16 v41 = 2112;
      id v42 = v13;
      __int16 v43 = 2112;
      v44 = v17;
      id v18 = "%@:%@ Preparing to show schedule rule date editor with initial start date [%@] from schedule rule [%@].";
LABEL_12:
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v37, 0x2Au);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v19 = [v8 editEndDatePeriodItem];
  int v20 = [v5 isEqual:v19];

  if (v20)
  {
    id v21 = [v8 editedScheduleRule];
    int v22 = [v21 yearDayRule];
    id v13 = [v22 validUntil];

    v14 = [[HUScheduleDateEditorViewController alloc] initWithDate:v13 editorContext:1 delegate:self];
    char v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = NSStringFromSelector(a2);
      v17 = [v8 editedScheduleRule];
      int v37 = 138413058;
      v38 = self;
      __int16 v39 = 2112;
      v40 = v16;
      __int16 v41 = 2112;
      id v42 = v13;
      __int16 v43 = 2112;
      v44 = v17;
      id v18 = "%@:%@ Preparing to show schedule rule date editor with initial end date [%@] from schedule rule [%@].";
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  v23 = [v8 editRecurrenceItem];
  int v24 = [v5 isEqual:v23];

  if (v24)
  {
    id v25 = [v8 editedScheduleRule];
    objc_super v26 = [v25 weekDayRule];
    [v26 daysOfTheWeek];

    id v13 = HMDaysOfTheWeekToDateComponents();
    v14 = [[HUScheduleRecurrenceEditorViewController alloc] initWithRecurrences:v13 delegate:self];
    char v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = NSStringFromSelector(a2);
      v17 = [v8 editedScheduleRule];
      int v37 = 138413058;
      v38 = self;
      __int16 v39 = 2112;
      v40 = v16;
      __int16 v41 = 2112;
      id v42 = v13;
      __int16 v43 = 2112;
      v44 = v17;
      id v18 = "%@:%@ Preparing to show schedule rule recurrence editor with initial recurrences [%@] from schedule rule [%@].";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v32 = [v8 removeRuleItem];
  int v33 = [v5 isEqual:v32];

  if (v33)
  {
    objc_super v34 = HFLogForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = NSStringFromSelector(a2);
      v36 = [v8 existingScheduleRule];
      int v37 = 138412802;
      v38 = self;
      __int16 v39 = 2112;
      v40 = v35;
      __int16 v41 = 2112;
      id v42 = v36;
      _os_log_impl(&dword_1BE345000, v34, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to remove schedule rule [%@].", (uint8_t *)&v37, 0x20u);
    }
    id v13 = [(HUScheduleRuleEditorItemModuleController *)self delegate];
    char v15 = [v8 existingScheduleRule];
    [v13 scheduleRuleEditorModuleController:self didRequestRuleRemoval:v15];
    v14 = 0;
    goto LABEL_13;
  }
  v14 = 0;
LABEL_14:
  objc_opt_class();
  id v27 = [(HUItemModuleController *)self host];
  if (objc_opt_isKindOfClass()) {
    v28 = v27;
  }
  else {
    v28 = 0;
  }
  id v29 = v28;

  if (v29 && v14)
  {
    v30 = [v29 navigationController];
    [v30 pushViewController:v14 animated:1];
  }
  return 0;
}

- (void)didUpdateRecurrences:(id)a3 recurrences:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v10 = 138412802;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Did update recurrences to [%@].", (uint8_t *)&v10, 0x20u);
  }
  id v9 = [(HUScheduleRuleEditorItemModuleController *)self _editorItemModule];
  if ([v9 scheduleType] == 2
    && [(HUScheduleRuleEditorItemModuleController *)self _validateRecurrences:v6])
  {
    [v9 updateScheduleRuleRecurrences:v6];
  }
}

- (void)didUpdateDate:(id)a3 date:(id)a4 editorContext:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = NSStringFromSelector(a2);
    int v17 = 138412802;
    id v18 = self;
    __int16 v19 = 2112;
    int v20 = v10;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Did update date to [%@].", (uint8_t *)&v17, 0x20u);
  }
  id v11 = [(HUScheduleRuleEditorItemModuleController *)self _editorItemModule];
  if ([v11 scheduleType] == 1)
  {
    if (a5 == 1)
    {
      if ([(HUScheduleRuleEditorItemModuleController *)self _validateEndDateAfterNowDate:v8])
      {
        id v15 = [v11 editedScheduleRule];
        uint64_t v16 = [v15 yearDayRule];
        __int16 v14 = [v16 validFrom];

        if ([(HUScheduleRuleEditorItemModuleController *)self _validateEndDateAfterStartDate:v8 startDate:v14])
        {
          [v11 updateScheduleRuleEndDate:v8];
        }
        goto LABEL_11;
      }
    }
    else if (!a5)
    {
      __int16 v12 = [v11 editedScheduleRule];
      id v13 = [v12 yearDayRule];
      __int16 v14 = [v13 validUntil];

      if ([(HUScheduleRuleEditorItemModuleController *)self _validateStartDateBeforeEndDate:v8 endDate:v14])
      {
        [v11 updateScheduleRuleStartDate:v8];
      }
LABEL_11:
    }
  }
}

- (BOOL)_validateRecurrences:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5 && !objc_msgSend(v5, "hmf_isEmpty"))
  {
    BOOL v8 = 1;
  }
  else
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = NSStringFromSelector(a2);
      int v11 = 138412802;
      __int16 v12 = self;
      __int16 v13 = 2112;
      __int16 v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "%@:%@ Selected recurrences [%@] are nil/empty. Cannot update schedule rules.", (uint8_t *)&v11, 0x20u);
    }
    [(HUScheduleRuleEditorItemModuleController *)self _presentAlertWithError:98];
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_validateStartDateBeforeEndDate:(id)a3 endDate:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [v7 compare:v8];
  if ((v9 & 0x8000000000000000) == 0)
  {
    int v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = NSStringFromSelector(a2);
      int v14 = 138413058;
      __int16 v15 = self;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "%@:%@ Invalid schedule rule. Start date [%@] is not before end date [%@].", (uint8_t *)&v14, 0x2Au);
    }
    [(HUScheduleRuleEditorItemModuleController *)self _presentAlertWithError:99];
  }

  return v9 >> 63;
}

- (BOOL)_validateEndDateAfterStartDate:(id)a3 startDate:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [v8 compare:v7];
  if ((v9 & 0x8000000000000000) == 0)
  {
    int v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = NSStringFromSelector(a2);
      int v14 = 138413058;
      __int16 v15 = self;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "%@:%@ Invalid schedule rule. End date [%@] is not after start date [%@].", (uint8_t *)&v14, 0x2Au);
    }
    [(HUScheduleRuleEditorItemModuleController *)self _presentAlertWithError:100];
  }

  return v9 >> 63;
}

- (BOOL)_validateEndDateAfterNowDate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v7 = [v6 compare:v5];
  if ((v7 & 0x8000000000000000) == 0)
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = NSStringFromSelector(a2);
      int v12 = 138413058;
      __int16 v13 = self;
      __int16 v14 = 2112;
      __int16 v15 = v10;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "%@:%@ Invalid schedule rule. End date [%@] is not after current date [%@].", (uint8_t *)&v12, 0x2Au);
    }
    [(HUScheduleRuleEditorItemModuleController *)self _presentAlertWithError:101];
  }

  return v7 >> 63;
}

- (void)_presentAlertWithError:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F69110] sharedHandler];
  id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", a3);
  [v5 handleError:v4 operationType:*MEMORY[0x1E4F687D8] options:0 retryBlock:0 cancelBlock:0];
}

- (id)_editorItemModule
{
  objc_opt_class();
  v3 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    unint64_t v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v4;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: User tapped switchCell to: %{BOOL}d", (uint8_t *)&v8, 0x12u);
  }

  unint64_t v7 = [(HUScheduleRuleEditorItemModuleController *)self _editorItemModule];
  [v7 updateAllDayToggle:v4];
}

- (void)timePickerCell:(id)a3 didSelectStartTime:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    int v10 = 138412802;
    BOOL v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Start time changed to to [%@].", (uint8_t *)&v10, 0x20u);
  }
  unint64_t v9 = [(HUScheduleRuleEditorItemModuleController *)self _editorItemModule];
  [v9 updateScheduleRuleStartTime:v6];
}

- (void)timePickerCell:(id)a3 didSelectEndTime:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    int v10 = 138412802;
    BOOL v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ End time changed to to [%@].", (uint8_t *)&v10, 0x20u);
  }
  unint64_t v9 = [(HUScheduleRuleEditorItemModuleController *)self _editorItemModule];
  [v9 updateScheduleRuleEndTime:v6];
}

- (HUScheduleRuleEditorItemModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUScheduleRuleEditorItemModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end