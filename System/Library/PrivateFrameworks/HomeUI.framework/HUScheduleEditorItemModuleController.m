@interface HUScheduleEditorItemModuleController
- (BOOL)_validateEndDateAfterNowDate:(id)a3;
- (BOOL)_validateEndDateAfterStartDate:(id)a3 startDate:(id)a4;
- (BOOL)_validateRecurrences:(id)a3;
- (BOOL)_validateStartDateBeforeEndDate:(id)a3 endDate:(id)a4;
- (BOOL)_validateStartTimeBeforeEndTime:(id)a3 endTime:(id)a4;
- (BOOL)saveCustomScheduleStartAndEndTimes;
- (Class)cellClassForItem:(id)a3;
- (id)_editorItemModule;
- (unint64_t)didSelectItem:(id)a3;
- (void)_presentAlertWithError:(int64_t)a3;
- (void)_presentErrorAlertWithTitle:(id)a3 message:(id)a4;
- (void)didUpdateDate:(id)a3 date:(id)a4 editorContext:(unint64_t)a5;
- (void)didUpdateRecurrences:(id)a3 recurrences:(id)a4;
- (void)didUpdateScheduleBuilder:(id)a3 scheduleBuilder:(id)a4;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)timePickerCell:(id)a3 didSelectEndTime:(id)a4;
- (void)timePickerCell:(id)a3 didSelectStartTime:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUScheduleEditorItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUScheduleEditorItemModuleController *)self _editorItemModule];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || ([v5 addScheduleRuleItem],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v4 isEqual:v8],
        v8,
        v9))
  {
    v6 = objc_opt_class();
    goto LABEL_4;
  }
  v10 = [v5 ruleEditorItemModule];
  v11 = [v10 editStartDatePeriodItem];
  if (([v4 isEqual:v11] & 1) == 0)
  {
    v12 = [v10 editEndDatePeriodItem];
    if (![v4 isEqual:v12])
    {
      v13 = [v10 editRecurrenceItem];
      char v14 = [v4 isEqual:v13];

      if ((v14 & 1) == 0)
      {
        v15 = [v10 allDayItem];
        char v16 = [v4 isEqual:v15];

        if ((v16 & 1) == 0)
        {
          v17 = [v10 editTimeOfDayItem];
          char v18 = [v4 isEqual:v17];

          if ((v18 & 1) == 0)
          {
            v19 = [v10 removeRuleItem];
            [v4 isEqual:v19];
          }
        }
      }
      goto LABEL_12;
    }
  }
LABEL_12:
  v6 = objc_opt_class();

LABEL_4:

  return (Class)v6;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HUScheduleEditorItemModuleController;
  [(HUItemModuleController *)&v31 setupCell:v6 forItem:v7];
  v8 = [(HUScheduleEditorItemModuleController *)self _editorItemModule];
  int v9 = [v8 ruleEditorItemModule];
  objc_opt_class();
  id v10 = v6;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  v13 = [v9 editTimeOfDayItem];
  int v14 = [v7 isEqual:v13];

  if (v14 && v12)
  {
    v15 = [v9 editedStartTime];
    char v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      char v18 = [v9 editedScheduleRule];
      v19 = [v18 weekDayRule];
      uint64_t v20 = [v19 startTime];

      id v17 = (id)v20;
    }

    v21 = [v9 editedEndTime];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      [v9 editedScheduleRule];
      v24 = id v30 = v17;
      v25 = [v24 weekDayRule];
      id v23 = [v25 endTime];

      id v17 = v30;
    }

    [v12 setStartTimeComponents:v17];
    [v12 setEndTimeComponents:v23];
    v26 = [v7 latestResults];
    v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [v12 setTitle:v27];

    v28 = [v7 latestResults];
    v29 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v12 setAccessibilityIdentifier:v29];

    [v12 setDelegate:self];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v47.receiver = self;
  v47.super_class = (Class)HUScheduleEditorItemModuleController;
  [(HUItemModuleController *)&v47 updateCell:v8 forItem:v9 animated:v5];
  id v10 = [(HUScheduleEditorItemModuleController *)self _editorItemModule];
  objc_opt_class();
  id v11 = v8;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  int v14 = (void *)MEMORY[0x1E4F68928];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [v9 latestResults];
      char v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
      if ([v16 BOOLValue]) {
        uint64_t v17 = 3;
      }
      else {
        uint64_t v17 = 0;
      }
      [v13 setAccessoryType:v17];

      [v13 setDisabled:0];
      char v18 = [v9 latestResults];
      v19 = [v18 objectForKeyedSubscript:*v14];
      [v13 setAccessibilityIdentifier:v19];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 setAccessoryType:1];
      [v13 setDisabled:0];
      uint64_t v20 = [v9 latestResults];
      v21 = [v20 objectForKeyedSubscript:*v14];
      [v13 setAccessibilityIdentifier:v21];
    }
  }
  v46 = v10;
  v22 = [v10 ruleEditorItemModule];
  objc_opt_class();
  id v23 = v11;
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  if (v25)
  {
    v26 = [v22 editStartDatePeriodItem];
    if ([v9 isEqual:v26])
    {
LABEL_19:

LABEL_20:
      [v25 setAccessoryView:0];
      [v25 setHideIcon:1];
      [v25 setAccessoryType:1];
      [v25 setDisabled:0];
      v28 = [v9 latestResults];
      v29 = [v28 objectForKeyedSubscript:*v14];
      [v13 setAccessibilityIdentifier:v29];

      goto LABEL_21;
    }
    v27 = [v22 editEndDatePeriodItem];
    if ([v9 isEqual:v27])
    {

      goto LABEL_19;
    }
    v44 = [v22 editRecurrenceItem];
    char v45 = [v9 isEqual:v44];

    int v14 = (void *)MEMORY[0x1E4F68928];
    if (v45) {
      goto LABEL_20;
    }
  }
LABEL_21:
  objc_opt_class();
  id v30 = v23;
  if (objc_opt_isKindOfClass()) {
    objc_super v31 = v30;
  }
  else {
    objc_super v31 = 0;
  }
  id v32 = v31;

  if (v32)
  {
    v33 = [v22 removeRuleItem];
    int v34 = [v9 isEqual:v33];

    if (v34)
    {
      [v32 setDestructive:1];
      v35 = [v9 latestResults];
      v36 = [v35 objectForKeyedSubscript:*v14];
      [v32 setAccessibilityIdentifier:v36];
    }
  }
  objc_opt_class();
  id v37 = v30;
  if (objc_opt_isKindOfClass()) {
    v38 = v37;
  }
  else {
    v38 = 0;
  }
  id v39 = v38;

  if (v39)
  {
    v40 = [v22 allDayItem];
    int v41 = [v9 isEqual:v40];

    if (v41)
    {
      [v39 setDelegate:self];
      v42 = [v9 latestResults];
      v43 = [v42 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v39 setAccessibilityIdentifier:v43];
    }
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v71 = self;
    __int16 v72 = 2112;
    v73 = v7;
    __int16 v74 = 2112;
    v75 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User selected item [%@]", buf, 0x20u);
  }
  id v8 = [(HUScheduleEditorItemModuleController *)self _editorItemModule];
  id v9 = [v8 ruleEditorItemModule];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 updateSelectedScheduleType:v5];
    p_super = HFLogForCategory();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromSelector(a2);
      id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "selectedScheduleType"));
      *(_DWORD *)buf = 138412802;
      v71 = self;
      __int16 v72 = 2112;
      v73 = v11;
      __int16 v74 = 2112;
      v75 = v12;
      _os_log_impl(&dword_1BE345000, p_super, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating selected schedule type to [%@].", buf, 0x20u);
    }
LABEL_15:
    v24 = 0;
LABEL_37:

    p_super = &v24->super.super.super.super.super.super;
    goto LABEL_38;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v13 = v5;
    if (objc_opt_isKindOfClass()) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    p_super = v14;

    uint64_t v15 = [v8 selectedScheduleType];
    char v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = NSStringFromSelector(a2);
      [p_super rule];
      v69 = a2;
      v19 = char v18 = v9;
      uint64_t v20 = [NSNumber numberWithUnsignedInteger:v15];
      *(_DWORD *)buf = 138413058;
      v71 = self;
      __int16 v72 = 2112;
      v73 = v17;
      __int16 v74 = 2112;
      v75 = v19;
      __int16 v76 = 2112;
      v77 = v20;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ User is attempting to view existing schedule rule [%@] for selected schedule type [%@].", buf, 0x2Au);

      id v9 = v18;
      a2 = v69;
    }
    if ((unint64_t)(v15 - 1) > 1) {
      goto LABEL_15;
    }
    v21 = [v8 updatedScheduleBuilder];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = [v8 originalScheduleBuilder];
    }
    v38 = v23;

    v46 = HFLogForCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v47 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v71 = self;
      __int16 v72 = 2112;
      v73 = v47;
      __int16 v74 = 2112;
      v75 = v38;
      _os_log_impl(&dword_1BE345000, v46, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to show schedule rule editor for schedule builder [%@].", buf, 0x20u);
    }
    v48 = [HUScheduleRuleEditorViewController alloc];
    v49 = [p_super rule];
    v24 = [(HUScheduleRuleEditorViewController *)v48 initWithScheduleType:v15 scheduleRule:v49 scheduleBuilder:v38 delegate:self];

LABEL_36:
    goto LABEL_37;
  }
  id v25 = [v8 addScheduleRuleItem];
  int v26 = [v5 isEqual:v25];

  if (!v26)
  {
    int v34 = [v9 editStartDatePeriodItem];
    int v35 = [v5 isEqual:v34];

    if (v35)
    {
      v36 = [v9 editedScheduleRule];
      id v37 = [v36 yearDayRule];
      p_super = [v37 validFrom];

      v24 = [[HUScheduleDateEditorViewController alloc] initWithDate:p_super editorContext:0 delegate:self];
      v38 = HFLogForCategory();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      id v39 = NSStringFromSelector(a2);
      v40 = [v9 editedScheduleRule];
      *(_DWORD *)buf = 138413058;
      v71 = self;
      __int16 v72 = 2112;
      v73 = v39;
      __int16 v74 = 2112;
      v75 = p_super;
      __int16 v76 = 2112;
      v77 = v40;
      int v41 = "%@:%@ Preparing to show schedule rule date editor with initial start date [%@] from schedule rule [%@].";
    }
    else
    {
      v42 = [v9 editEndDatePeriodItem];
      int v43 = [v5 isEqual:v42];

      if (v43)
      {
        v44 = [v9 editedScheduleRule];
        char v45 = [v44 yearDayRule];
        p_super = [v45 validUntil];

        v24 = [[HUScheduleDateEditorViewController alloc] initWithDate:p_super editorContext:1 delegate:self];
        v38 = HFLogForCategory();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        id v39 = NSStringFromSelector(a2);
        v40 = [v9 editedScheduleRule];
        *(_DWORD *)buf = 138413058;
        v71 = self;
        __int16 v72 = 2112;
        v73 = v39;
        __int16 v74 = 2112;
        v75 = p_super;
        __int16 v76 = 2112;
        v77 = v40;
        int v41 = "%@:%@ Preparing to show schedule rule date editor with initial end date [%@] from schedule rule [%@].";
      }
      else
      {
        v50 = [v9 editRecurrenceItem];
        int v51 = [v5 isEqual:v50];

        if (!v51) {
          goto LABEL_50;
        }
        v52 = [v9 editedScheduleRule];
        v53 = [v52 weekDayRule];
        [v53 daysOfTheWeek];

        p_super = HMDaysOfTheWeekToDateComponents();
        v24 = [[HUScheduleRecurrenceEditorViewController alloc] initWithRecurrences:p_super delegate:self];
        v38 = HFLogForCategory();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        id v39 = NSStringFromSelector(a2);
        v40 = [v9 editedScheduleRule];
        *(_DWORD *)buf = 138413058;
        v71 = self;
        __int16 v72 = 2112;
        v73 = v39;
        __int16 v74 = 2112;
        v75 = p_super;
        __int16 v76 = 2112;
        v77 = v40;
        int v41 = "%@:%@ Preparing to show schedule rule recurrence editor with initial recurrences [%@] from schedule rule [%@].";
      }
    }
    _os_log_impl(&dword_1BE345000, v38, OS_LOG_TYPE_DEFAULT, v41, buf, 0x2Au);

    goto LABEL_36;
  }
  uint64_t v27 = [v8 selectedScheduleType];
  v28 = HFLogForCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = NSStringFromSelector(a2);
    id v30 = [NSNumber numberWithUnsignedInteger:v27];
    *(_DWORD *)buf = 138412802;
    v71 = self;
    __int16 v72 = 2112;
    v73 = v29;
    __int16 v74 = 2112;
    v75 = v30;
    _os_log_impl(&dword_1BE345000, v28, OS_LOG_TYPE_DEFAULT, "%@:%@ User is attempting to add schedule rule for selected schedule type [%@].", buf, 0x20u);
  }
  if ((unint64_t)(v27 - 1) <= 1)
  {
    objc_super v31 = [v8 updatedScheduleBuilder];
    id v32 = v31;
    if (v31)
    {
      v33 = v31;
    }
    else
    {
      v33 = [v8 originalScheduleBuilder];
    }
    p_super = v33;

    v62 = HFLogForCategory();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v71 = self;
      __int16 v72 = 2112;
      v73 = v63;
      __int16 v74 = 2112;
      v75 = p_super;
      _os_log_impl(&dword_1BE345000, v62, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to show schedule rule editor for schedule builder [%@].", buf, 0x20u);
    }
    v64 = [p_super rules];
    unint64_t v65 = [v64 count];
    unint64_t v66 = [p_super maxNumberOfRules];

    if (v65 >= v66)
    {
      v67 = HFLogForCategory();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v68 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v71 = self;
        __int16 v72 = 2112;
        v73 = v68;
        _os_log_error_impl(&dword_1BE345000, v67, OS_LOG_TYPE_ERROR, "%@:%@ Unsupported action. Max number of rules reached. Cannot add any more rules.", buf, 0x16u);
      }
      v54 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_UnsupportedAction_Title", @"HUScheduleRuleEditor_UnsupportedAction_Title", 1);
      v59 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_UnsupportedAction_MaxDateTimePeriodsReached_Message", @"HUScheduleRuleEditor_UnsupportedAction_MaxDateTimePeriodsReached_Message", 1);
      [(HUScheduleEditorItemModuleController *)self _presentErrorAlertWithTitle:v54 message:v59];
      goto LABEL_47;
    }
    v24 = [[HUScheduleRuleEditorViewController alloc] initWithScheduleType:v27 scheduleRule:0 scheduleBuilder:p_super delegate:self];
    goto LABEL_37;
  }
LABEL_50:
  p_super = 0;
LABEL_38:
  objc_opt_class();
  v54 = [(HUItemModuleController *)self host];
  if (objc_opt_isKindOfClass()) {
    v55 = v54;
  }
  else {
    v55 = 0;
  }
  id v56 = v55;

  if (v56 && p_super)
  {
    v57 = [v8 addScheduleRuleItem];
    int v58 = [v5 isEqual:v57];

    if (v58)
    {
      if (![(HUScheduleEditorItemModuleController *)self saveCustomScheduleStartAndEndTimes])
      {
LABEL_48:
        id v56 = v54;
        goto LABEL_49;
      }
      v59 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:p_super];
      [v59 setModalPresentationStyle:2];
      id v60 = (id)objc_msgSend(v56, "hu_presentPreloadableViewController:animated:", v59, 1);
    }
    else
    {
      v59 = [v56 navigationController];
      [v59 pushViewController:p_super animated:1];
    }
LABEL_47:

    goto LABEL_48;
  }
LABEL_49:

  return 0;
}

- (void)didUpdateRecurrences:(id)a3 recurrences:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v17 = 138412802;
    char v18 = self;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Did update recurrences to [%@].", (uint8_t *)&v17, 0x20u);
  }
  id v9 = [(HUScheduleEditorItemModuleController *)self _editorItemModule];
  id v10 = [v9 ruleEditorItemModule];
  if ([v10 scheduleType] == 2
    && [(HUScheduleEditorItemModuleController *)self _validateRecurrences:v6])
  {
    [v10 updateScheduleRuleRecurrences:v6];
    id v11 = objc_alloc(MEMORY[0x1E4F694A0]);
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    id v13 = [v10 editedScheduleRule];
    int v14 = [v12 setWithObject:v13];
    uint64_t v15 = (void *)[v11 initWithScheduleRules:v14];

    char v16 = [MEMORY[0x1E4F694A8] scheduleBuilderFromSchedule:v15];
    [v9 updateScheduleBuilder:v16];
  }
}

- (void)didUpdateDate:(id)a3 date:(id)a4 editorContext:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(a2);
    int v23 = 138412802;
    v24 = self;
    __int16 v25 = 2112;
    int v26 = v10;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Did update date to [%@].", (uint8_t *)&v23, 0x20u);
  }
  id v11 = [(HUScheduleEditorItemModuleController *)self _editorItemModule];
  id v12 = [v11 ruleEditorItemModule];
  if ([v12 scheduleType] == 1)
  {
    if (a5 != 1)
    {
      if (a5)
      {
LABEL_12:
        id v18 = objc_alloc(MEMORY[0x1E4F694A0]);
        __int16 v19 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v20 = [v12 editedScheduleRule];
        __int16 v21 = [v19 setWithObject:v20];
        uint64_t v15 = (void *)[v18 initWithScheduleRules:v21];

        id v22 = [MEMORY[0x1E4F694A8] scheduleBuilderFromSchedule:v15];
        [v11 updateScheduleBuilder:v22];

        goto LABEL_13;
      }
      id v13 = [v12 editedScheduleRule];
      int v14 = [v13 yearDayRule];
      uint64_t v15 = [v14 validUntil];

      if ([(HUScheduleEditorItemModuleController *)self _validateStartDateBeforeEndDate:v8 endDate:v15])
      {
        [v12 updateScheduleRuleStartDate:v8];
      }
LABEL_11:

      goto LABEL_12;
    }
    if ([(HUScheduleEditorItemModuleController *)self _validateEndDateAfterNowDate:v8])
    {
      char v16 = [v12 editedScheduleRule];
      int v17 = [v16 yearDayRule];
      uint64_t v15 = [v17 validFrom];

      if (![(HUScheduleEditorItemModuleController *)self _validateEndDateAfterStartDate:v8 startDate:v15])
      {
LABEL_13:

        goto LABEL_14;
      }
      [v12 updateScheduleRuleEndDate:v8];
      goto LABEL_11;
    }
  }
LABEL_14:
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
      id v10 = NSStringFromSelector(a2);
      int v11 = 138412802;
      id v12 = self;
      __int16 v13 = 2112;
      int v14 = v10;
      __int16 v15 = 2112;
      char v16 = v6;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "%@:%@ Selected recurrences [%@] are nil/empty. Cannot update schedule rules.", (uint8_t *)&v11, 0x20u);
    }
    [(HUScheduleEditorItemModuleController *)self _presentAlertWithError:98];
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
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(a2);
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
    [(HUScheduleEditorItemModuleController *)self _presentAlertWithError:99];
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
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(a2);
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
    [(HUScheduleEditorItemModuleController *)self _presentAlertWithError:100];
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
      id v10 = NSStringFromSelector(a2);
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
    [(HUScheduleEditorItemModuleController *)self _presentAlertWithError:101];
  }

  return v7 >> 63;
}

- (BOOL)saveCustomScheduleStartAndEndTimes
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = [(HUScheduleEditorItemModuleController *)self _editorItemModule];
  id v5 = [v4 updatedScheduleBuilder];
  id v6 = [v5 rules];
  unint64_t v7 = [v6 count];

  if (v7 <= 1)
  {
    unint64_t v9 = [v4 ruleEditorItemModule];
    id v10 = [v9 existingScheduleRule];
    int v11 = [v9 editedScheduleRule];
    if (!v11)
    {
      BOOL v8 = 1;
LABEL_27:

      goto LABEL_28;
    }
    int v12 = v11;
    if ([v11 isWeekDayRule])
    {
      __int16 v13 = [v9 editedStartTime];
      if (v13)
      {
        __int16 v14 = [v9 editedStartTime];
      }
      else
      {
        __int16 v16 = [v12 weekDayRule];
        __int16 v14 = [v16 startTime];
      }
      id v17 = [v9 editedEndTime];
      if (v17)
      {
        __int16 v18 = [v9 editedEndTime];
      }
      else
      {
        id v19 = [v12 weekDayRule];
        __int16 v18 = [v19 endTime];
      }
      if (![(HUScheduleEditorItemModuleController *)self _validateStartTimeBeforeEndTime:v14 endTime:v18])
      {

        BOOL v8 = 0;
        __int16 v15 = v12;
LABEL_26:

        goto LABEL_27;
      }
      id v20 = objc_alloc(MEMORY[0x1E4F2EBD0]);
      id v21 = [v12 weekDayRule];
      int v35 = v18;
      uint64_t v22 = objc_msgSend(v20, "initWithStartTime:endTime:daysOfTheWeek:", v14, v18, objc_msgSend(v21, "daysOfTheWeek"));

      int v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v37 = self;
        __int16 v38 = 2112;
        id v39 = v24;
        __int16 v40 = 2112;
        int v41 = v22;
        _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ New weekDay schedule rule will be %@", buf, 0x20u);
      }
      __int16 v15 = (void *)[objc_alloc(MEMORY[0x1E4F694B0]) initWithWeekDayRule:v22];
      __int16 v25 = HFLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v26 = int v34 = v14;
        *(_DWORD *)buf = 138413058;
        id v37 = self;
        __int16 v38 = 2112;
        id v39 = v26;
        __int16 v40 = 2112;
        int v41 = v12;
        __int16 v42 = 2112;
        int v43 = v15;
        _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating from schedule rule %@ to %@", buf, 0x2Au);

        __int16 v14 = v34;
      }
    }
    else
    {
      __int16 v15 = v12;
    }
    __int16 v27 = [v9 scheduleBuilder];
    if (v10 && v15)
    {
      id v28 = HFLogForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        id v37 = self;
        __int16 v38 = 2112;
        id v39 = v29;
        __int16 v40 = 2112;
        int v41 = v10;
        __int16 v42 = 2112;
        int v43 = v15;
        _os_log_impl(&dword_1BE345000, v28, OS_LOG_TYPE_DEFAULT, "%@:%@ Replacing existing schedule rule [%@] with edited schedule rule [%@]", buf, 0x2Au);
      }
      id v30 = (void *)MEMORY[0x1E4F1CA80];
      objc_super v31 = [v27 rules];
      id v32 = [v30 setWithSet:v31];

      [v32 removeObject:v10];
      [v32 addObject:v15];
      [v27 setRules:v32];
    }
    [v4 updateScheduleBuilder:v27];

    BOOL v8 = 1;
    goto LABEL_26;
  }
  BOOL v8 = 1;
LABEL_28:

  return v8;
}

- (BOOL)_validateStartTimeBeforeEndTime:(id)a3 endTime:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hf_sharedCalendar");
  id v10 = [v9 dateFromComponents:v7];
  int v11 = [v9 dateFromComponents:v8];
  unint64_t v12 = [v10 compare:v11];

  if ((v12 & 0x8000000000000000) == 0)
  {
    __int16 v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = NSStringFromSelector(a2);
      int v17 = 138413058;
      __int16 v18 = self;
      __int16 v19 = 2112;
      id v20 = v15;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "%@:%@ Invalid schedule rule. Start time [%@] is not before end time [%@].", (uint8_t *)&v17, 0x2Au);
    }
    [(HUScheduleEditorItemModuleController *)self _presentAlertWithError:102];
  }

  return v12 >> 63;
}

- (void)didUpdateScheduleBuilder:(id)a3 scheduleBuilder:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v10 = 138412802;
    int v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Requesting to update schedule builder to %@", (uint8_t *)&v10, 0x20u);
  }
  unint64_t v9 = [(HUScheduleEditorItemModuleController *)self _editorItemModule];
  [v9 updateScheduleBuilder:v6];
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = self;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: User tapped switchCell to: %{BOOL}d", (uint8_t *)&v19, 0x12u);
  }

  id v8 = [(HUScheduleEditorItemModuleController *)self _editorItemModule];
  unint64_t v9 = [v8 ruleEditorItemModule];
  int v10 = [v6 item];

  int v11 = [v9 allDayItem];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    [v9 updateAllDayToggle:v4];
    id v13 = objc_alloc(MEMORY[0x1E4F694A0]);
    __int16 v14 = (void *)MEMORY[0x1E4F1CAD0];
    id v15 = [v9 editedScheduleRule];
    uint64_t v16 = [v14 setWithObject:v15];
    int v17 = (void *)[v13 initWithScheduleRules:v16];

    __int16 v18 = [MEMORY[0x1E4F694A8] scheduleBuilderFromSchedule:v17];
    [v8 updateScheduleBuilder:v18];
  }
}

- (void)timePickerCell:(id)a3 didSelectStartTime:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v11 = 138412802;
    int v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Start time changed to to [%@].", (uint8_t *)&v11, 0x20u);
  }
  unint64_t v9 = [(HUScheduleEditorItemModuleController *)self _editorItemModule];
  int v10 = [v9 ruleEditorItemModule];
  [v10 updateScheduleRuleStartTime:v6];
}

- (void)timePickerCell:(id)a3 didSelectEndTime:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v11 = 138412802;
    int v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ End time changed to to [%@].", (uint8_t *)&v11, 0x20u);
  }
  unint64_t v9 = [(HUScheduleEditorItemModuleController *)self _editorItemModule];
  int v10 = [v9 ruleEditorItemModule];
  [v10 updateScheduleRuleEndTime:v6];
}

- (void)_presentErrorAlertWithTitle:(id)a3 message:(id)a4
{
  id v11 = [MEMORY[0x1E4F42728] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v5 = (void *)MEMORY[0x1E4F42720];
  id v6 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  id v7 = [v5 actionWithTitle:v6 style:0 handler:&__block_literal_global_217];
  [v11 addAction:v7];

  id v8 = +[HUViewControllerPresentationRequest requestWithViewController:v11];
  [v8 setPreferredPresentationType:0];
  unint64_t v9 = [(HUItemModuleController *)self host];
  id v10 = (id)[v9 moduleController:self presentViewControllerForRequest:v8];
}

void __76__HUScheduleEditorItemModuleController__presentErrorAlertWithTitle_message___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[HUScheduleEditorItemModuleController _presentErrorAlertWithTitle:message:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped OK button from the alert popup", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_presentAlertWithError:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F69110] sharedHandler];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", a3);
  [v5 handleError:v4 operationType:*MEMORY[0x1E4F687D8] options:0 retryBlock:0 cancelBlock:0];
}

- (id)_editorItemModule
{
  objc_opt_class();
  uint64_t v3 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  return v5;
}

@end