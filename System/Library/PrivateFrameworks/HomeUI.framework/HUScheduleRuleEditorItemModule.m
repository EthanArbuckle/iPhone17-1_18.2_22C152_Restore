@interface HUScheduleRuleEditorItemModule
- (BOOL)showAsInlineModule;
- (BOOL)updateScheduleRuleEndDate:(id)a3;
- (BOOL)updateScheduleRuleEndTime:(id)a3;
- (BOOL)updateScheduleRuleRecurrences:(id)a3;
- (BOOL)updateScheduleRuleStartDate:(id)a3;
- (BOOL)updateScheduleRuleStartTime:(id)a3;
- (HFItem)allDayItem;
- (HFItem)editEndDatePeriodItem;
- (HFItem)editRecurrenceItem;
- (HFItem)editStartDatePeriodItem;
- (HFItem)editTimeOfDayItem;
- (HFItem)removeRuleItem;
- (HFItemProvider)staticItemProvider;
- (HFScheduleBuilder)scheduleBuilder;
- (HFScheduleRule)editedScheduleRule;
- (HFScheduleRule)existingScheduleRule;
- (HUScheduleRuleEditorItemModule)initWithItemUpdater:(id)a3;
- (HUScheduleRuleEditorItemModule)initWithItemUpdater:(id)a3 scheduleType:(unint64_t)a4 scheduleRule:(id)a5 scheduleBuilder:(id)a6;
- (NSDateComponents)editedEndTime;
- (NSDateComponents)editedStartTime;
- (id)_datePeriodFormatter;
- (id)_localizedNaturalLanguageStringForRecurrence;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (unint64_t)scheduleType;
- (void)_buildItemProviders;
- (void)setAllDayItem:(id)a3;
- (void)setEditEndDatePeriodItem:(id)a3;
- (void)setEditRecurrenceItem:(id)a3;
- (void)setEditStartDatePeriodItem:(id)a3;
- (void)setEditTimeOfDayItem:(id)a3;
- (void)setEditedEndTime:(id)a3;
- (void)setEditedScheduleRule:(id)a3;
- (void)setEditedStartTime:(id)a3;
- (void)setExistingScheduleRule:(id)a3;
- (void)setRemoveRuleItem:(id)a3;
- (void)setScheduleBuilder:(id)a3;
- (void)setScheduleType:(unint64_t)a3;
- (void)setShowAsInlineModule:(BOOL)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)updateAllDayToggle:(BOOL)a3;
- (void)updateScheduleBuilder:(id)a3;
@end

@implementation HUScheduleRuleEditorItemModule

- (HUScheduleRuleEditorItemModule)initWithItemUpdater:(id)a3 scheduleType:(unint64_t)a4 scheduleRule:(id)a5 scheduleBuilder:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HUScheduleRuleEditorItemModule.m", 42, @"Invalid parameter not satisfying: %@", @"itemUpdater" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"HUScheduleRuleEditorItemModule.m", 43, @"Invalid parameter not satisfying: %@", @"scheduleBuilder" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)HUScheduleRuleEditorItemModule;
  v15 = [(HFItemModule *)&v26 initWithItemUpdater:v11];
  v16 = v15;
  if (v15)
  {
    v15->_scheduleType = a4;
    uint64_t v17 = [v12 copy];
    existingScheduleRule = v16->_existingScheduleRule;
    v16->_existingScheduleRule = (HFScheduleRule *)v17;

    if (v12)
    {
      v19 = (void *)[v12 copy];
    }
    else
    {
      v19 = [MEMORY[0x1E4F694B0] defaultRuleForType:a4];
    }
    v20 = v19;
    objc_storeStrong((id *)&v16->_editedScheduleRule, v19);

    uint64_t v21 = [v14 copy];
    scheduleBuilder = v16->_scheduleBuilder;
    v16->_scheduleBuilder = (HFScheduleBuilder *)v21;

    v16->_showAsInlineModule = 0;
    [(HUScheduleRuleEditorItemModule *)v16 _buildItemProviders];
  }

  return v16;
}

- (HUScheduleRuleEditorItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_scheduleType_scheduleRule_scheduleBuilder_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUScheduleRuleEditorItemModule.m", 59, @"%s is unavailable; use %@ instead",
    "-[HUScheduleRuleEditorItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUScheduleRuleEditorItemModule *)self staticItemProvider];
  v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUScheduleRuleEditorSpecificDatesRuleSectionIdentifier"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = [(HUScheduleRuleEditorItemModule *)self editStartDatePeriodItem];
  v8 = [(HUScheduleRuleEditorItemModule *)self editEndDatePeriodItem];
  v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
  int v10 = [v4 intersectsSet:v9];

  if (v10)
  {
    id v11 = objc_opt_new();
    id v12 = [(HUScheduleRuleEditorItemModule *)self editStartDatePeriodItem];
    objc_msgSend(v11, "na_safeAddObject:", v12);

    id v13 = [(HUScheduleRuleEditorItemModule *)self editEndDatePeriodItem];
    objc_msgSend(v11, "na_safeAddObject:", v13);

    if ([(HUScheduleRuleEditorItemModule *)self showAsInlineModule])
    {
      v14 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_Dates_Title", @"HUScheduleRuleEditor_Dates_Title", 1);
      [v5 setHeaderTitle:v14];
    }
    [v5 setItems:v11];
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUScheduleRuleEditorCustomScheduleRuleSectionIdentifier"];
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = [(HUScheduleRuleEditorItemModule *)self allDayItem];
  v18 = [(HUScheduleRuleEditorItemModule *)self editTimeOfDayItem];
  v19 = [(HUScheduleRuleEditorItemModule *)self editRecurrenceItem];
  v20 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, 0);
  int v21 = [v4 intersectsSet:v20];

  if (v21)
  {
    v22 = objc_opt_new();
    v23 = [(HUScheduleRuleEditorItemModule *)self allDayItem];
    objc_msgSend(v22, "na_safeAddObject:", v23);

    v24 = [(HUScheduleRuleEditorItemModule *)self editTimeOfDayItem];
    objc_msgSend(v22, "na_safeAddObject:", v24);

    v25 = [(HUScheduleRuleEditorItemModule *)self editRecurrenceItem];
    objc_msgSend(v22, "na_safeAddObject:", v25);

    if ([(HUScheduleRuleEditorItemModule *)self showAsInlineModule])
    {
      objc_super v26 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_Times_Title", @"HUScheduleRuleEditor_Times_Title", 1);
      [v15 setHeaderTitle:v26];
    }
    [v15 setItems:v22];
  }
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUScheduleRuleEditorRemoveRuleSectionIdentifier"];
  v28 = [(HUScheduleRuleEditorItemModule *)self removeRuleItem];
  int v29 = [v4 containsObject:v28];

  if (v29)
  {
    v30 = [(HUScheduleRuleEditorItemModule *)self removeRuleItem];
    v37[0] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    [v27 setItems:v31];
  }
  v32 = (void *)MEMORY[0x1E4F69220];
  v36[0] = v5;
  v36[1] = v15;
  v36[2] = v27;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  v34 = [v32 filterSections:v33 toDisplayedItems:v4];

  return v34;
}

- (void)_buildItemProviders
{
  objc_initWeak(location, self);
  v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke;
  v38[3] = &unk_1E6384FD0;
  objc_copyWeak(&v39, location);
  v5 = (void *)[v4 initWithResultsBlock:v38];
  [(HUScheduleRuleEditorItemModule *)self setEditStartDatePeriodItem:v5];

  v6 = [(HUScheduleRuleEditorItemModule *)self editStartDatePeriodItem];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F695C0]);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_2;
  void v36[3] = &unk_1E6384FD0;
  objc_copyWeak(&v37, location);
  v8 = (void *)[v7 initWithResultsBlock:v36];
  [(HUScheduleRuleEditorItemModule *)self setEditEndDatePeriodItem:v8];

  v9 = [(HUScheduleRuleEditorItemModule *)self editEndDatePeriodItem];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_3;
  v34[3] = &unk_1E6384FD0;
  objc_copyWeak(&v35, location);
  id v11 = (void *)[v10 initWithResultsBlock:v34];
  [(HUScheduleRuleEditorItemModule *)self setAllDayItem:v11];

  id v12 = [(HUScheduleRuleEditorItemModule *)self allDayItem];
  [v3 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F695C0]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_4;
  v32[3] = &unk_1E6384FD0;
  objc_copyWeak(&v33, location);
  v14 = (void *)[v13 initWithResultsBlock:v32];
  [(HUScheduleRuleEditorItemModule *)self setEditTimeOfDayItem:v14];

  v15 = [(HUScheduleRuleEditorItemModule *)self editTimeOfDayItem];
  [v3 addObject:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F695C0]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_5;
  v30[3] = &unk_1E6384FD0;
  objc_copyWeak(&v31, location);
  uint64_t v17 = (void *)[v16 initWithResultsBlock:v30];
  [(HUScheduleRuleEditorItemModule *)self setEditRecurrenceItem:v17];

  v18 = [(HUScheduleRuleEditorItemModule *)self editRecurrenceItem];
  [v3 addObject:v18];

  id v19 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_6;
  v28 = &unk_1E6384FD0;
  objc_copyWeak(&v29, location);
  v20 = (void *)[v19 initWithResultsBlock:&v25];
  -[HUScheduleRuleEditorItemModule setRemoveRuleItem:](self, "setRemoveRuleItem:", v20, v25, v26, v27, v28);

  int v21 = [(HUScheduleRuleEditorItemModule *)self removeRuleItem];
  [v3 addObject:v21];

  id v22 = objc_alloc(MEMORY[0x1E4F695C8]);
  v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  v24 = (void *)[v22 initWithItems:v23];
  [(HUScheduleRuleEditorItemModule *)self setStaticItemProvider:v24];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);

  objc_destroyWeak(location);
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained scheduleType];
  BOOL v3 = v2 != 1;
  if (v2 == 1)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hf_sharedCalendar");
    v6 = [WeakRetained editedScheduleRule];
    id v7 = [v6 yearDayRule];
    v8 = [v7 validFrom];
    int v9 = [v5 isDateInToday:v8];

    if (v9)
    {
      HFLocalizedString();
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = [WeakRetained _datePeriodFormatter];
      id v11 = [WeakRetained editedScheduleRule];
      id v12 = [v11 yearDayRule];
      id v13 = [v12 validFrom];
      id v4 = [v10 stringFromDate:v13];
    }
  }
  else
  {
    id v4 = &stru_1F18F92B8;
  }
  if ([WeakRetained showAsInlineModule])
  {
    v14 = [WeakRetained scheduleBuilder];
    v15 = [v14 rules];
    unint64_t v16 = [v15 count];

    BOOL v3 = v2 != 1 || v16 > 1;
  }
  v18 = (void *)MEMORY[0x1E4F7A0D8];
  v26[0] = *MEMORY[0x1E4F68AB8];
  id v19 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_StartTime_Title", @"HUScheduleRuleEditor_StartTime_Title", 1);
  uint64_t v20 = *MEMORY[0x1E4F68928];
  v27[0] = v19;
  v27[1] = @"Home.ScheduleRule.Editor.Starts";
  uint64_t v21 = *MEMORY[0x1E4F68B10];
  v26[1] = v20;
  v26[2] = v21;
  id v22 = [NSNumber numberWithInt:v3];
  v26[3] = *MEMORY[0x1E4F68980];
  v27[2] = v22;
  v27[3] = v4;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v24 = [v18 futureWithResult:v23];

  return v24;
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_2(uint64_t a1)
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained scheduleType];
  BOOL v3 = v2 != 1;
  if (v2 == 1)
  {
    v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v6 = [WeakRetained editedScheduleRule];
    id v7 = [v6 yearDayRule];
    v8 = [v7 validUntil];
    int v9 = [v5 isEqualToDate:v8];

    if (v9)
    {
      HFLocalizedString();
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = [WeakRetained _datePeriodFormatter];
      id v11 = [WeakRetained editedScheduleRule];
      id v12 = [v11 yearDayRule];
      id v13 = [v12 validUntil];
      id v4 = [v10 stringFromDate:v13];
    }
  }
  else
  {
    id v4 = &stru_1F18F92B8;
  }
  if ([WeakRetained showAsInlineModule])
  {
    v14 = [WeakRetained scheduleBuilder];
    v15 = [v14 rules];
    unint64_t v16 = [v15 count];

    BOOL v3 = v2 != 1 || v16 > 1;
  }
  v18 = (void *)MEMORY[0x1E4F7A0D8];
  v26[0] = *MEMORY[0x1E4F68AB8];
  id v19 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_EndTime_Title", @"HUScheduleRuleEditor_EndTime_Title", 1);
  uint64_t v20 = *MEMORY[0x1E4F68928];
  v27[0] = v19;
  v27[1] = @"Home.ScheduleRule.Editor.Ends";
  uint64_t v21 = *MEMORY[0x1E4F68B10];
  v26[1] = v20;
  v26[2] = v21;
  id v22 = [NSNumber numberWithInt:v3];
  v26[3] = *MEMORY[0x1E4F68980];
  v27[2] = v22;
  v27[3] = v4;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v24 = [v18 futureWithResult:v23];

  return v24;
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_3(uint64_t a1)
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained showAsInlineModule])
  {
    uint64_t v2 = [WeakRetained scheduleBuilder];
    BOOL v3 = [v2 rules];
    BOOL v4 = (unint64_t)[v3 count] > 1;
  }
  else
  {
    BOOL v4 = 0;
  }
  v5 = (void *)MEMORY[0x1E4F7A0D8];
  v18[0] = *MEMORY[0x1E4F68AB8];
  v6 = HFLocalizedString();
  v19[0] = v6;
  v18[1] = *MEMORY[0x1E4F68B10];
  id v7 = NSNumber;
  BOOL v8 = v4 || [WeakRetained scheduleType] != 2;
  int v9 = [v7 numberWithInt:v8];
  uint64_t v10 = *MEMORY[0x1E4F68928];
  v19[1] = v9;
  v19[2] = @"Home.ScheduleRule.Editor.AllDay";
  uint64_t v11 = *MEMORY[0x1E4F68BC0];
  v18[2] = v10;
  v18[3] = v11;
  id v12 = NSNumber;
  id v13 = [WeakRetained editedScheduleRule];
  [v13 isAllDayWeekDayRule];
  v14 = [v12 numberWithInteger:HFPrimaryStateFromBOOL()];
  v19[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  unint64_t v16 = [v5 futureWithResult:v15];

  return v16;
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_4(uint64_t a1)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained showAsInlineModule])
  {
    uint64_t v2 = [WeakRetained scheduleBuilder];
    BOOL v3 = [v2 rules];
    uint64_t v4 = (unint64_t)[v3 count] > 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = (void *)MEMORY[0x1E4F7A0D8];
  v16[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v6 = 1;
  id v7 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_Between", @"HUScheduleRuleEditor_Between", 1);
  uint64_t v8 = *MEMORY[0x1E4F68928];
  v17[0] = v7;
  v17[1] = @"Home.ScheduleRule.Editor.Between";
  uint64_t v9 = *MEMORY[0x1E4F68B10];
  v16[1] = v8;
  v16[2] = v9;
  uint64_t v10 = NSNumber;
  if ((v4 & 1) != 0 || [WeakRetained scheduleType] != 2)
  {
    int v11 = 0;
  }
  else
  {
    uint64_t v4 = [WeakRetained editedScheduleRule];
    uint64_t v6 = [(id)v4 isAllDayWeekDayRule];
    int v11 = 1;
  }
  id v12 = [v10 numberWithInt:v6];
  v17[2] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  v14 = [v5 futureWithResult:v13];

  if (v11) {

  }
  return v14;
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_5(uint64_t a1)
{
  void v17[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained showAsInlineModule])
  {
    uint64_t v2 = [WeakRetained scheduleBuilder];
    BOOL v3 = [v2 rules];
    BOOL v4 = (unint64_t)[v3 count] > 1;
  }
  else
  {
    BOOL v4 = 0;
  }
  v5 = (void *)MEMORY[0x1E4F7A0D8];
  v16[0] = *MEMORY[0x1E4F68AB8];
  BOOL v6 = 1;
  id v7 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_Repeat", @"HUScheduleRuleEditor_Repeat", 1);
  uint64_t v8 = *MEMORY[0x1E4F68928];
  v17[0] = v7;
  v17[1] = @"Home.ScheduleRule.Editor.Repeat";
  uint64_t v9 = *MEMORY[0x1E4F68B10];
  v16[1] = v8;
  v16[2] = v9;
  uint64_t v10 = NSNumber;
  if (!v4) {
    BOOL v6 = [WeakRetained scheduleType] != 2;
  }
  int v11 = [v10 numberWithInt:v6];
  v17[2] = v11;
  void v16[3] = *MEMORY[0x1E4F68980];
  id v12 = [WeakRetained _localizedNaturalLanguageStringForRecurrence];
  v17[3] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v14 = [v5 futureWithResult:v13];

  return v14;
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_6(uint64_t a1)
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained scheduleBuilder];
  BOOL v4 = [v3 rules];
  uint64_t v5 = [v4 count];
  BOOL v6 = [WeakRetained scheduleBuilder];
  uint64_t v7 = [v6 minNumberOfRules];

  uint64_t v8 = (void *)MEMORY[0x1E4F7A0D8];
  v21[0] = *MEMORY[0x1E4F68AB8];
  if ([WeakRetained scheduleType] == 2) {
    uint64_t v9 = @"HUScheduleRuleEditor_RemoveTimes";
  }
  else {
    uint64_t v9 = @"HUScheduleRuleEditor_RemoveDates";
  }
  uint64_t v10 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
  uint64_t v11 = *MEMORY[0x1E4F68928];
  v22[0] = v10;
  v22[1] = @"Home.ScheduleRule.Editor.RemoveTimesOrDates";
  uint64_t v12 = *MEMORY[0x1E4F68B10];
  v21[1] = v11;
  v21[2] = v12;
  id v13 = NSNumber;
  char v14 = [WeakRetained showAsInlineModule];
  if (v14)
  {
    uint64_t v15 = 1;
  }
  else
  {
    v1 = [WeakRetained existingScheduleRule];
    if (v1) {
      BOOL v16 = v5 == v7;
    }
    else {
      BOOL v16 = 1;
    }
    uint64_t v15 = v16;
  }
  uint64_t v17 = [v13 numberWithInt:v15];
  v22[2] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  id v19 = [v8 futureWithResult:v18];

  if ((v14 & 1) == 0) {

  }
  return v19;
}

- (id)_localizedNaturalLanguageStringForRecurrence
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
  char v5 = [v4 isWeekDayRule];

  if (v5)
  {
    BOOL v6 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
    uint64_t v7 = [v6 weekDayRule];
    [v7 daysOfTheWeek];
    uint64_t v8 = HMDaysOfTheWeekToDateComponents();

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F2EB90], "hf_recurrenceNaturalLanguageStringWithRecurrences:", v8);
    uint64_t v10 = (void *)v9;
    uint64_t v11 = &stru_1F18F92B8;
    if (v9) {
      uint64_t v11 = (__CFString *)v9;
    }
    uint64_t v12 = v11;
  }
  else
  {
    id v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      char v14 = NSStringFromSelector(a2);
      int v16 = 138412546;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      id v19 = v14;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ Not a weekDayRule. Unabled to determine natural language string for recurrence.", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v12 = &stru_1F18F92B8;
  }

  return v12;
}

- (void)updateScheduleBuilder:(id)a3
{
  id v5 = a3;
  [(HUScheduleRuleEditorItemModule *)self setScheduleBuilder:v5];
  -[HUScheduleRuleEditorItemModule setScheduleType:](self, "setScheduleType:", [v5 estimatedScheduleType]);
  BOOL v6 = [v5 rules];

  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = [v7 firstObject];
  [(HUScheduleRuleEditorItemModule *)self setEditedScheduleRule:v8];

  uint64_t v9 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
  uint64_t v10 = (void *)[v9 copy];
  [(HUScheduleRuleEditorItemModule *)self setExistingScheduleRule:v10];

  [(HUScheduleRuleEditorItemModule *)self setEditedStartTime:0];
  [(HUScheduleRuleEditorItemModule *)self setEditedEndTime:0];
  uint64_t v11 = (void *)MEMORY[0x1E4F69230];
  uint64_t v12 = [(HUScheduleRuleEditorItemModule *)self itemProviders];
  id v15 = [v11 requestToReloadItemProviders:v12 senderSelector:a2];

  id v13 = [(HFItemModule *)self itemUpdater];
  id v14 = (id)[v13 performItemUpdateRequest:v15];
}

- (BOOL)updateScheduleRuleStartDate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
    uint64_t v9 = [v8 yearDayRule];
    uint64_t v10 = [v9 validFrom];
    int v23 = 138413058;
    v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    v28 = v10;
    __int16 v29 = 2112;
    id v30 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Requesting to update start date from %@ to %@", (uint8_t *)&v23, 0x2Au);
  }
  id v11 = objc_alloc(MEMORY[0x1E4F2EBE8]);
  uint64_t v12 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
  id v13 = [v12 yearDayRule];
  id v14 = [v13 validUntil];
  id v15 = (void *)[v11 initWithValidFrom:v5 validUntil:v14];

  int v16 = (void *)[objc_alloc(MEMORY[0x1E4F694B0]) initWithYearDayRule:v15];
  [(HUScheduleRuleEditorItemModule *)self setEditedScheduleRule:v16];
  uint64_t v17 = (void *)MEMORY[0x1E4F69230];
  __int16 v18 = [(HUScheduleRuleEditorItemModule *)self itemProviders];
  id v19 = [v17 requestToReloadItemProviders:v18 senderSelector:a2];

  uint64_t v20 = [(HFItemModule *)self itemUpdater];
  id v21 = (id)[v20 performItemUpdateRequest:v19];

  return 1;
}

- (BOOL)updateScheduleRuleEndDate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
    uint64_t v9 = [v8 yearDayRule];
    uint64_t v10 = [v9 validUntil];
    int v23 = 138413058;
    v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    v28 = v10;
    __int16 v29 = 2112;
    id v30 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Requesting to update end date from %@ to %@", (uint8_t *)&v23, 0x2Au);
  }
  id v11 = objc_alloc(MEMORY[0x1E4F2EBE8]);
  uint64_t v12 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
  id v13 = [v12 yearDayRule];
  id v14 = [v13 validFrom];
  id v15 = (void *)[v11 initWithValidFrom:v14 validUntil:v5];

  int v16 = (void *)[objc_alloc(MEMORY[0x1E4F694B0]) initWithYearDayRule:v15];
  [(HUScheduleRuleEditorItemModule *)self setEditedScheduleRule:v16];
  uint64_t v17 = (void *)MEMORY[0x1E4F69230];
  __int16 v18 = [(HUScheduleRuleEditorItemModule *)self itemProviders];
  id v19 = [v17 requestToReloadItemProviders:v18 senderSelector:a2];

  uint64_t v20 = [(HFItemModule *)self itemUpdater];
  id v21 = (id)[v20 performItemUpdateRequest:v19];

  return 1;
}

- (BOOL)updateScheduleRuleStartTime:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
    uint64_t v9 = [v8 weekDayRule];
    uint64_t v10 = [v9 startTime];
    int v12 = 138413058;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Requesting to update start time from %@ to %@", (uint8_t *)&v12, 0x2Au);
  }
  [(HUScheduleRuleEditorItemModule *)self setEditedStartTime:v5];

  return 1;
}

- (BOOL)updateScheduleRuleEndTime:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
    uint64_t v9 = [v8 weekDayRule];
    uint64_t v10 = [v9 endTime];
    int v12 = 138413058;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Requesting to update end time from %@ to %@", (uint8_t *)&v12, 0x2Au);
  }
  [(HUScheduleRuleEditorItemModule *)self setEditedEndTime:v5];

  return 1;
}

- (BOOL)updateScheduleRuleRecurrences:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = v5;
  if (v5 && (objc_msgSend(v5, "hmf_isEmpty") & 1) == 0)
  {
    uint64_t v8 = HMDaysOfTheWeekFromDateComponents();
    uint64_t v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = NSStringFromSelector(a2);
      id v11 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
      int v12 = [v11 weekDayRule];
      [v12 daysOfTheWeek];
      id v13 = HMDaysOfTheWeekToString();
      __int16 v14 = HMDaysOfTheWeekToString();
      *(_DWORD *)buf = 138413314;
      v32 = self;
      __int16 v33 = 2112;
      v34 = v10;
      __int16 v35 = 2112;
      v36 = v13;
      __int16 v37 = 2112;
      v38 = v14;
      __int16 v39 = 1024;
      int v40 = 0;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating schedule days of the week from %@ to %@ | validatedWeekDays = %{BOOL}d", buf, 0x30u);
    }
    id v15 = objc_alloc(MEMORY[0x1E4F2EBD0]);
    __int16 v16 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
    uint64_t v17 = [v16 weekDayRule];
    __int16 v18 = [v17 startTime];
    id v19 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
    uint64_t v20 = [v19 weekDayRule];
    [v20 endTime];
    id v21 = v30 = a2;
    id v22 = (void *)[v15 initWithStartTime:v18 endTime:v21 daysOfTheWeek:v8];

    int v23 = (void *)[objc_alloc(MEMORY[0x1E4F694B0]) initWithWeekDayRule:v22];
    [(HUScheduleRuleEditorItemModule *)self setEditedScheduleRule:v23];
    v24 = (void *)MEMORY[0x1E4F69230];
    __int16 v25 = [(HUScheduleRuleEditorItemModule *)self itemProviders];
    uint64_t v26 = [v24 requestToReloadItemProviders:v25 senderSelector:v30];

    __int16 v27 = [(HFItemModule *)self itemUpdater];
    id v28 = (id)[v27 performItemUpdateRequest:v26];

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)updateAllDayToggle:(BOOL)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hf_componentsWithHour:minute:", 0, 0);
    BOOL v6 = (void *)MEMORY[0x1E4F1C9D8];
    uint64_t v7 = 23;
    uint64_t v8 = 59;
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hf_componentsWithHour:minute:", 9, 0);
    BOOL v6 = (void *)MEMORY[0x1E4F1C9D8];
    uint64_t v7 = 17;
    uint64_t v8 = 0;
  }
  uint64_t v9 = objc_msgSend(v6, "hf_componentsWithHour:minute:", v7, v8);
  [(HUScheduleRuleEditorItemModule *)self updateScheduleRuleStartTime:v5];
  [(HUScheduleRuleEditorItemModule *)self updateScheduleRuleEndTime:v9];
  id v10 = objc_alloc(MEMORY[0x1E4F2EBD0]);
  id v11 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
  int v12 = [v11 weekDayRule];
  id v13 = objc_msgSend(v10, "initWithStartTime:endTime:daysOfTheWeek:", v5, v9, objc_msgSend(v12, "daysOfTheWeek"));

  __int16 v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = NSStringFromSelector(a2);
    int v25 = 138412802;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2112;
    SEL v30 = v13;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ New weekDay schedule rule will be %@", (uint8_t *)&v25, 0x20u);
  }
  __int16 v16 = (void *)[objc_alloc(MEMORY[0x1E4F694B0]) initWithWeekDayRule:v13];
  uint64_t v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = NSStringFromSelector(a2);
    id v19 = [(HUScheduleRuleEditorItemModule *)self editedScheduleRule];
    int v25 = 138413058;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    id v28 = v18;
    __int16 v29 = 2112;
    SEL v30 = v19;
    __int16 v31 = 2112;
    v32 = v16;
    _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating from schedule rule %@ to %@", (uint8_t *)&v25, 0x2Au);
  }
  [(HUScheduleRuleEditorItemModule *)self setEditedScheduleRule:v16];
  uint64_t v20 = (void *)MEMORY[0x1E4F69230];
  id v21 = [(HUScheduleRuleEditorItemModule *)self itemProviders];
  id v22 = [v20 requestToReloadItemProviders:v21 senderSelector:a2];

  int v23 = [(HFItemModule *)self itemUpdater];
  id v24 = (id)[v23 performItemUpdateRequest:v22];
}

- (id)_datePeriodFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateStyle:2];
  [v2 setTimeStyle:0];

  return v2;
}

- (unint64_t)scheduleType
{
  return self->_scheduleType;
}

- (void)setScheduleType:(unint64_t)a3
{
  self->_scheduleType = a3;
}

- (HFScheduleBuilder)scheduleBuilder
{
  return self->_scheduleBuilder;
}

- (void)setScheduleBuilder:(id)a3
{
}

- (HFScheduleRule)existingScheduleRule
{
  return self->_existingScheduleRule;
}

- (void)setExistingScheduleRule:(id)a3
{
}

- (HFScheduleRule)editedScheduleRule
{
  return self->_editedScheduleRule;
}

- (void)setEditedScheduleRule:(id)a3
{
}

- (NSDateComponents)editedStartTime
{
  return self->_editedStartTime;
}

- (void)setEditedStartTime:(id)a3
{
}

- (NSDateComponents)editedEndTime
{
  return self->_editedEndTime;
}

- (void)setEditedEndTime:(id)a3
{
}

- (HFItem)editStartDatePeriodItem
{
  return self->_editStartDatePeriodItem;
}

- (void)setEditStartDatePeriodItem:(id)a3
{
}

- (HFItem)editEndDatePeriodItem
{
  return self->_editEndDatePeriodItem;
}

- (void)setEditEndDatePeriodItem:(id)a3
{
}

- (HFItem)allDayItem
{
  return self->_allDayItem;
}

- (void)setAllDayItem:(id)a3
{
}

- (HFItem)editTimeOfDayItem
{
  return self->_editTimeOfDayItem;
}

- (void)setEditTimeOfDayItem:(id)a3
{
}

- (HFItem)editRecurrenceItem
{
  return self->_editRecurrenceItem;
}

- (void)setEditRecurrenceItem:(id)a3
{
}

- (HFItem)removeRuleItem
{
  return self->_removeRuleItem;
}

- (void)setRemoveRuleItem:(id)a3
{
}

- (BOOL)showAsInlineModule
{
  return self->_showAsInlineModule;
}

- (void)setShowAsInlineModule:(BOOL)a3
{
  self->_showAsInlineModule = a3;
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_removeRuleItem, 0);
  objc_storeStrong((id *)&self->_editRecurrenceItem, 0);
  objc_storeStrong((id *)&self->_editTimeOfDayItem, 0);
  objc_storeStrong((id *)&self->_allDayItem, 0);
  objc_storeStrong((id *)&self->_editEndDatePeriodItem, 0);
  objc_storeStrong((id *)&self->_editStartDatePeriodItem, 0);
  objc_storeStrong((id *)&self->_editedEndTime, 0);
  objc_storeStrong((id *)&self->_editedStartTime, 0);
  objc_storeStrong((id *)&self->_editedScheduleRule, 0);
  objc_storeStrong((id *)&self->_existingScheduleRule, 0);

  objc_storeStrong((id *)&self->_scheduleBuilder, 0);
}

@end