@interface HUScheduleRecurrenceEditorItemModule
- (BOOL)isDailyRecurrenceOptionSelected;
- (BOOL)isWeeklyRecurrenceOptionSelected;
- (HFItem)dailyOptionItem;
- (HFItem)daysOfWeekPickerItem;
- (HFItem)weeklyOptionItem;
- (HFItemProvider)staticItemProvider;
- (HUScheduleRecurrenceEditorItemModule)initWithItemUpdater:(id)a3;
- (HUScheduleRecurrenceEditorItemModule)initWithItemUpdater:(id)a3 recurrences:(id)a4;
- (NSArray)editedRecurrences;
- (NSArray)initialRecurrences;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)_buildItemProviders;
- (void)setDailyOptionItem:(id)a3;
- (void)setDaysOfWeekPickerItem:(id)a3;
- (void)setEditedRecurrences:(id)a3;
- (void)setInitialRecurrences:(id)a3;
- (void)setIsDailyRecurrenceOptionSelected:(BOOL)a3;
- (void)setIsWeeklyRecurrenceOptionSelected:(BOOL)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setWeeklyOptionItem:(id)a3;
- (void)updateToDailyRecurrenceOption;
- (void)updateToWeeklyRecurrenceOption;
@end

@implementation HUScheduleRecurrenceEditorItemModule

- (HUScheduleRecurrenceEditorItemModule)initWithItemUpdater:(id)a3 recurrences:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HUScheduleRecurrenceEditorItemModule.m", 28, @"Invalid parameter not satisfying: %@", @"itemUpdater" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"HUScheduleRecurrenceEditorItemModule.m", 29, @"Invalid parameter not satisfying: %@", @"recurrences" object file lineNumber description];

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)HUScheduleRecurrenceEditorItemModule;
  v10 = [(HFItemModule *)&v15 initWithItemUpdater:v7];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_initialRecurrences, a4);
    objc_storeStrong((id *)&v11->_editedRecurrences, a4);
    [(HUScheduleRecurrenceEditorItemModule *)v11 _buildItemProviders];
  }

  return v11;
}

- (HUScheduleRecurrenceEditorItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_recurrences_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUScheduleRecurrenceEditorItemModule.m", 42, @"%s is unavailable; use %@ instead",
    "-[HUScheduleRecurrenceEditorItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUScheduleRecurrenceEditorItemModule *)self staticItemProvider];
  v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithIdentifier:@"HUScheduleRecurrenceEditorOptionSectionIdentifier"];
  id v7 = objc_opt_new();
  id v8 = [(HUScheduleRecurrenceEditorItemModule *)self dailyOptionItem];
  [v7 addObject:v8];

  v9 = [(HUScheduleRecurrenceEditorItemModule *)self weeklyOptionItem];
  [v7 addObject:v9];

  [v6 setItems:v7];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUScheduleRecurrenceEditorPickerSectionIdentifier"];
  v11 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_DaysOfWeekPicker_HeaderTitle", @"HUScheduleRuleEditor_DaysOfWeekPicker_HeaderTitle", 1);
  [v10 setHeaderTitle:v11];

  v12 = [(HUScheduleRecurrenceEditorItemModule *)self daysOfWeekPickerItem];
  v19[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v10 setItems:v13];

  v14 = (void *)MEMORY[0x1E4F69220];
  v18[0] = v6;
  v18[1] = v10;
  objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v16 = [v14 filterSections:v15 toDisplayedItems:v5];

  return v16;
}

- (void)_buildItemProviders
{
  v3 = objc_opt_new();
  v4 = [(HUScheduleRecurrenceEditorItemModule *)self initialRecurrences];
  -[HUScheduleRecurrenceEditorItemModule setIsDailyRecurrenceOptionSelected:](self, "setIsDailyRecurrenceOptionSelected:", [v4 count] == 7);

  [(HUScheduleRecurrenceEditorItemModule *)self setIsWeeklyRecurrenceOptionSelected:[(HUScheduleRecurrenceEditorItemModule *)self isDailyRecurrenceOptionSelected] ^ 1];
  id v5 = objc_alloc(MEMORY[0x1E4F695C0]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke;
  v19[3] = &unk_1E6385000;
  v19[4] = self;
  v6 = (void *)[v5 initWithResultsBlock:v19];
  [(HUScheduleRecurrenceEditorItemModule *)self setDailyOptionItem:v6];

  id v7 = [(HUScheduleRecurrenceEditorItemModule *)self dailyOptionItem];
  [v3 addObject:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F695C0]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke_2;
  v18[3] = &unk_1E6385000;
  v18[4] = self;
  v9 = (void *)[v8 initWithResultsBlock:v18];
  [(HUScheduleRecurrenceEditorItemModule *)self setWeeklyOptionItem:v9];

  v10 = [(HUScheduleRecurrenceEditorItemModule *)self weeklyOptionItem];
  [v3 addObject:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F695C0]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke_3;
  v17[3] = &unk_1E6385000;
  v17[4] = self;
  v12 = (void *)[v11 initWithResultsBlock:v17];
  [(HUScheduleRecurrenceEditorItemModule *)self setDaysOfWeekPickerItem:v12];

  v13 = [(HUScheduleRecurrenceEditorItemModule *)self daysOfWeekPickerItem];
  [v3 addObject:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F695C8]);
  objc_super v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  v16 = (void *)[v14 initWithItems:v15];
  [(HUScheduleRecurrenceEditorItemModule *)self setStaticItemProvider:v16];
}

id __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v10[0] = *MEMORY[0x1E4F68AB8];
  v3 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_Repeat_Daily", @"HUScheduleRuleEditor_Repeat_Daily", 1);
  uint64_t v4 = *MEMORY[0x1E4F68928];
  v11[0] = v3;
  v11[1] = @"Home.Schedule.Recurrence.Everyday";
  uint64_t v5 = *MEMORY[0x1E4F68B10];
  v10[1] = v4;
  v10[2] = v5;
  v11[2] = MEMORY[0x1E4F1CC28];
  v10[3] = *MEMORY[0x1E4F68B40];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDailyRecurrenceOptionSelected"));
  v11[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v8 = [v2 futureWithResult:v7];

  return v8;
}

id __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke_2(uint64_t a1)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v10[0] = *MEMORY[0x1E4F68AB8];
  v3 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_Repeat_Weekly", @"HUScheduleRuleEditor_Repeat_Weekly", 1);
  uint64_t v4 = *MEMORY[0x1E4F68928];
  v11[0] = v3;
  v11[1] = @"Home.Schedule.Recurrence.EveryWeek";
  uint64_t v5 = *MEMORY[0x1E4F68B10];
  v10[1] = v4;
  v10[2] = v5;
  v11[2] = MEMORY[0x1E4F1CC28];
  v10[3] = *MEMORY[0x1E4F68B40];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isWeeklyRecurrenceOptionSelected"));
  v11[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v8 = [v2 futureWithResult:v7];

  return v8;
}

id __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke_3(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v6 = *MEMORY[0x1E4F68B10];
  v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDailyRecurrenceOptionSelected"));
  v7[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v4 = [v1 futureWithResult:v3];

  return v4;
}

- (void)updateToDailyRecurrenceOption
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v12 = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    objc_super v15 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating to daily recurrence option", (uint8_t *)&v12, 0x16u);
  }
  [(HUScheduleRecurrenceEditorItemModule *)self setIsDailyRecurrenceOptionSelected:1];
  [(HUScheduleRecurrenceEditorItemModule *)self setIsWeeklyRecurrenceOptionSelected:[(HUScheduleRecurrenceEditorItemModule *)self isDailyRecurrenceOptionSelected] ^ 1];
  uint64_t v6 = HMDaysOfTheWeekToDateComponents();
  [(HUScheduleRecurrenceEditorItemModule *)self setEditedRecurrences:v6];

  id v7 = [(HFItemModule *)self itemUpdater];
  id v8 = (void *)MEMORY[0x1E4F69230];
  v9 = [(HUScheduleRecurrenceEditorItemModule *)self itemProviders];
  v10 = [v8 requestToReloadItemProviders:v9 senderSelector:a2];
  id v11 = (id)[v7 performItemUpdateRequest:v10];
}

- (void)updateToWeeklyRecurrenceOption
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v11 = 138412546;
    int v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating to weekly recurrence option", (uint8_t *)&v11, 0x16u);
  }
  [(HUScheduleRecurrenceEditorItemModule *)self setIsDailyRecurrenceOptionSelected:0];
  [(HUScheduleRecurrenceEditorItemModule *)self setIsWeeklyRecurrenceOptionSelected:[(HUScheduleRecurrenceEditorItemModule *)self isDailyRecurrenceOptionSelected] ^ 1];
  uint64_t v6 = [(HFItemModule *)self itemUpdater];
  id v7 = (void *)MEMORY[0x1E4F69230];
  id v8 = [(HUScheduleRecurrenceEditorItemModule *)self itemProviders];
  v9 = [v7 requestToReloadItemProviders:v8 senderSelector:a2];
  id v10 = (id)[v6 performItemUpdateRequest:v9];
}

- (NSArray)initialRecurrences
{
  return self->_initialRecurrences;
}

- (void)setInitialRecurrences:(id)a3
{
}

- (NSArray)editedRecurrences
{
  return self->_editedRecurrences;
}

- (void)setEditedRecurrences:(id)a3
{
}

- (HFItem)dailyOptionItem
{
  return self->_dailyOptionItem;
}

- (void)setDailyOptionItem:(id)a3
{
}

- (HFItem)weeklyOptionItem
{
  return self->_weeklyOptionItem;
}

- (void)setWeeklyOptionItem:(id)a3
{
}

- (HFItem)daysOfWeekPickerItem
{
  return self->_daysOfWeekPickerItem;
}

- (void)setDaysOfWeekPickerItem:(id)a3
{
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (BOOL)isDailyRecurrenceOptionSelected
{
  return self->_isDailyRecurrenceOptionSelected;
}

- (void)setIsDailyRecurrenceOptionSelected:(BOOL)a3
{
  self->_isDailyRecurrenceOptionSelected = a3;
}

- (BOOL)isWeeklyRecurrenceOptionSelected
{
  return self->_isWeeklyRecurrenceOptionSelected;
}

- (void)setIsWeeklyRecurrenceOptionSelected:(BOOL)a3
{
  self->_isWeeklyRecurrenceOptionSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_daysOfWeekPickerItem, 0);
  objc_storeStrong((id *)&self->_weeklyOptionItem, 0);
  objc_storeStrong((id *)&self->_dailyOptionItem, 0);
  objc_storeStrong((id *)&self->_editedRecurrences, 0);

  objc_storeStrong((id *)&self->_initialRecurrences, 0);
}

@end