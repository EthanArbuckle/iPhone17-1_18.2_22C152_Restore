@interface HUScheduleDateEditorItemModule
- (BOOL)isNeverOptionSelected;
- (BOOL)isSpecificDateOptionSelected;
- (BOOL)isTodayOptionSelected;
- (HFItem)datePickerItem;
- (HFItem)endNeverDateItem;
- (HFItem)specificDateItem;
- (HFItem)startTodayDateItem;
- (HFItemProvider)staticItemProvider;
- (HUScheduleDateEditorItemModule)initWithItemUpdater:(id)a3;
- (HUScheduleDateEditorItemModule)initWithItemUpdater:(id)a3 date:(id)a4 editorContext:(unint64_t)a5;
- (NSDate)editedDate;
- (NSDate)existingDate;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (unint64_t)editorContext;
- (void)_buildItemProviders;
- (void)_configureSelectedOptions;
- (void)setDatePickerItem:(id)a3;
- (void)setEditedDate:(id)a3;
- (void)setEndNeverDateItem:(id)a3;
- (void)setIsNeverOptionSelected:(BOOL)a3;
- (void)setIsSpecificDateOptionSelected:(BOOL)a3;
- (void)setIsTodayOptionSelected:(BOOL)a3;
- (void)setSpecificDateItem:(id)a3;
- (void)setStartTodayDateItem:(id)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)updateToNeverDateOption;
- (void)updateToSpecificDateOption;
- (void)updateToTodayDateOption;
@end

@implementation HUScheduleDateEditorItemModule

- (HUScheduleDateEditorItemModule)initWithItemUpdater:(id)a3 date:(id)a4 editorContext:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HUScheduleDateEditorItemModule.m", 32, @"Invalid parameter not satisfying: %@", @"itemUpdater" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HUScheduleDateEditorItemModule.m", 33, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)HUScheduleDateEditorItemModule;
  v12 = [(HFItemModule *)&v17 initWithItemUpdater:v9];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_existingDate, a4);
    objc_storeStrong((id *)&v13->_editedDate, a4);
    v13->_editorContext = a5;
    [(HUScheduleDateEditorItemModule *)v13 _buildItemProviders];
  }

  return v13;
}

- (HUScheduleDateEditorItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_date_editorContext_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUScheduleDateEditorItemModule.m", 47, @"%s is unavailable; use %@ instead",
    "-[HUScheduleDateEditorItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUScheduleDateEditorItemModule *)self staticItemProvider];
  v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithIdentifier:@"HUScheduleDateEditorDateSectionIdentifier"];
  v7 = objc_opt_new();
  v8 = [(HUScheduleDateEditorItemModule *)self startTodayDateItem];
  objc_msgSend(v7, "na_safeAddObject:", v8);

  id v9 = [(HUScheduleDateEditorItemModule *)self endNeverDateItem];
  objc_msgSend(v7, "na_safeAddObject:", v9);

  id v10 = [(HUScheduleDateEditorItemModule *)self specificDateItem];
  objc_msgSend(v7, "na_safeAddObject:", v10);

  v11 = [(HUScheduleDateEditorItemModule *)self datePickerItem];
  objc_msgSend(v7, "na_safeAddObject:", v11);

  [v6 setItems:v7];
  v12 = (void *)MEMORY[0x1E4F69220];
  v16[0] = v6;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v14 = [v12 filterSections:v13 toDisplayedItems:v5];

  return v14;
}

- (void)_buildItemProviders
{
  objc_initWeak(&location, self);
  v3 = objc_opt_new();
  [(HUScheduleDateEditorItemModule *)self _configureSelectedOptions];
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke;
  v25[3] = &unk_1E6384FD0;
  objc_copyWeak(&v26, &location);
  id v5 = (void *)[v4 initWithResultsBlock:v25];
  [(HUScheduleDateEditorItemModule *)self setStartTodayDateItem:v5];

  v6 = [(HUScheduleDateEditorItemModule *)self startTodayDateItem];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F695C0]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_2;
  v23[3] = &unk_1E6384FD0;
  objc_copyWeak(&v24, &location);
  v8 = (void *)[v7 initWithResultsBlock:v23];
  [(HUScheduleDateEditorItemModule *)self setEndNeverDateItem:v8];

  id v9 = [(HUScheduleDateEditorItemModule *)self endNeverDateItem];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_3;
  v21[3] = &unk_1E6384FD0;
  objc_copyWeak(&v22, &location);
  v11 = (void *)[v10 initWithResultsBlock:v21];
  [(HUScheduleDateEditorItemModule *)self setSpecificDateItem:v11];

  v12 = [(HUScheduleDateEditorItemModule *)self specificDateItem];
  [v3 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F695C0]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_4;
  v19[3] = &unk_1E6384FD0;
  objc_copyWeak(&v20, &location);
  v14 = (void *)[v13 initWithResultsBlock:v19];
  [(HUScheduleDateEditorItemModule *)self setDatePickerItem:v14];

  v15 = [(HUScheduleDateEditorItemModule *)self datePickerItem];
  [v3 addObject:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F695C8]);
  objc_super v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  v18 = (void *)[v16 initWithItems:v17];
  [(HUScheduleDateEditorItemModule *)self setStaticItemProvider:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&location);
}

id __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v11[0] = *MEMORY[0x1E4F68AB8];
  v3 = HFLocalizedString();
  uint64_t v4 = *MEMORY[0x1E4F68928];
  v12[0] = v3;
  v12[1] = @"Home.ScheduleRule.Editor.Today";
  uint64_t v5 = *MEMORY[0x1E4F68B40];
  v11[1] = v4;
  v11[2] = v5;
  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "isTodayOptionSelected"));
  v12[2] = v6;
  v11[3] = *MEMORY[0x1E4F68B10];
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(WeakRetained, "editorContext") != 0);
  v12[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  id v9 = [v2 futureWithResult:v8];

  return v9;
}

id __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_2(uint64_t a1)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v11[0] = *MEMORY[0x1E4F68AB8];
  v3 = HFLocalizedString();
  uint64_t v4 = *MEMORY[0x1E4F68928];
  v12[0] = v3;
  v12[1] = @"Home.ScheduleRule.Editor.Never";
  uint64_t v5 = *MEMORY[0x1E4F68B40];
  v11[1] = v4;
  v11[2] = v5;
  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "isNeverOptionSelected"));
  v12[2] = v6;
  v11[3] = *MEMORY[0x1E4F68B10];
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(WeakRetained, "editorContext") != 1);
  v12[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  id v9 = [v2 futureWithResult:v8];

  return v9;
}

id __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_3(uint64_t a1)
{
  void v11[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v10[0] = *MEMORY[0x1E4F68AB8];
  v3 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_OnDate", @"HUScheduleRuleEditor_OnDate", 1);
  uint64_t v4 = *MEMORY[0x1E4F68928];
  v11[0] = v3;
  v11[1] = @"Home.ScheduleRule.Editor.OnDate";
  uint64_t v5 = *MEMORY[0x1E4F68B40];
  v10[1] = v4;
  v10[2] = v5;
  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "isSpecificDateOptionSelected"));
  v10[3] = *MEMORY[0x1E4F68B10];
  v11[2] = v6;
  v11[3] = MEMORY[0x1E4F1CC28];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  v8 = [v2 futureWithResult:v7];

  return v8;
}

id __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_4(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v9 = *MEMORY[0x1E4F68B10];
  v3 = NSNumber;
  if ([WeakRetained isTodayOptionSelected]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [WeakRetained isNeverOptionSelected];
  }
  uint64_t v5 = [v3 numberWithInt:v4];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v2 futureWithResult:v6];

  return v7;
}

- (void)updateToTodayDateOption
{
  [(HUScheduleDateEditorItemModule *)self setIsTodayOptionSelected:1];
  [(HUScheduleDateEditorItemModule *)self setIsSpecificDateOptionSelected:[(HUScheduleDateEditorItemModule *)self isTodayOptionSelected] ^ 1];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = objc_msgSend(v4, "hf_startOfDay");
  [(HUScheduleDateEditorItemModule *)self setEditedDate:v5];

  id v10 = [(HFItemModule *)self itemUpdater];
  v6 = (void *)MEMORY[0x1E4F69230];
  id v7 = [(HUScheduleDateEditorItemModule *)self itemProviders];
  v8 = [v6 requestToReloadItemProviders:v7 senderSelector:a2];
  id v9 = (id)[v10 performItemUpdateRequest:v8];
}

- (void)updateToNeverDateOption
{
  [(HUScheduleDateEditorItemModule *)self setIsNeverOptionSelected:1];
  [(HUScheduleDateEditorItemModule *)self setIsSpecificDateOptionSelected:[(HUScheduleDateEditorItemModule *)self isNeverOptionSelected] ^ 1];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [(HUScheduleDateEditorItemModule *)self setEditedDate:v4];

  id v9 = [(HFItemModule *)self itemUpdater];
  uint64_t v5 = (void *)MEMORY[0x1E4F69230];
  v6 = [(HUScheduleDateEditorItemModule *)self itemProviders];
  id v7 = [v5 requestToReloadItemProviders:v6 senderSelector:a2];
  id v8 = (id)[v9 performItemUpdateRequest:v7];
}

- (void)updateToSpecificDateOption
{
  if ([(HUScheduleDateEditorItemModule *)self editorContext])
  {
    if ([(HUScheduleDateEditorItemModule *)self editorContext] != 1) {
      goto LABEL_6;
    }
    [(HUScheduleDateEditorItemModule *)self setIsNeverOptionSelected:0];
    BOOL v4 = [(HUScheduleDateEditorItemModule *)self isNeverOptionSelected];
  }
  else
  {
    [(HUScheduleDateEditorItemModule *)self setIsTodayOptionSelected:0];
    BOOL v4 = [(HUScheduleDateEditorItemModule *)self isTodayOptionSelected];
  }
  [(HUScheduleDateEditorItemModule *)self setIsSpecificDateOptionSelected:!v4];
LABEL_6:
  id v9 = [(HFItemModule *)self itemUpdater];
  uint64_t v5 = (void *)MEMORY[0x1E4F69230];
  v6 = [(HUScheduleDateEditorItemModule *)self itemProviders];
  id v7 = [v5 requestToReloadItemProviders:v6 senderSelector:a2];
  id v8 = (id)[v9 performItemUpdateRequest:v7];
}

- (void)_configureSelectedOptions
{
  if ([(HUScheduleDateEditorItemModule *)self editorContext])
  {
    if ([(HUScheduleDateEditorItemModule *)self editorContext] != 1) {
      return;
    }
    v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
    BOOL v4 = [(HUScheduleDateEditorItemModule *)self existingDate];
    uint64_t v5 = [v3 isEqualToDate:v4];

    [(HUScheduleDateEditorItemModule *)self setIsNeverOptionSelected:v5];
    BOOL v6 = [(HUScheduleDateEditorItemModule *)self isNeverOptionSelected];
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hf_sharedCalendar");
    id v8 = [(HUScheduleDateEditorItemModule *)self existingDate];
    uint64_t v9 = [v7 isDateInToday:v8];

    [(HUScheduleDateEditorItemModule *)self setIsTodayOptionSelected:v9];
    BOOL v6 = [(HUScheduleDateEditorItemModule *)self isTodayOptionSelected];
  }

  [(HUScheduleDateEditorItemModule *)self setIsSpecificDateOptionSelected:!v6];
}

- (NSDate)existingDate
{
  return self->_existingDate;
}

- (NSDate)editedDate
{
  return self->_editedDate;
}

- (void)setEditedDate:(id)a3
{
}

- (HFItem)startTodayDateItem
{
  return self->_startTodayDateItem;
}

- (void)setStartTodayDateItem:(id)a3
{
}

- (HFItem)endNeverDateItem
{
  return self->_endNeverDateItem;
}

- (void)setEndNeverDateItem:(id)a3
{
}

- (HFItem)specificDateItem
{
  return self->_specificDateItem;
}

- (void)setSpecificDateItem:(id)a3
{
}

- (HFItem)datePickerItem
{
  return self->_datePickerItem;
}

- (void)setDatePickerItem:(id)a3
{
}

- (unint64_t)editorContext
{
  return self->_editorContext;
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (BOOL)isTodayOptionSelected
{
  return self->_isTodayOptionSelected;
}

- (void)setIsTodayOptionSelected:(BOOL)a3
{
  self->_isTodayOptionSelected = a3;
}

- (BOOL)isNeverOptionSelected
{
  return self->_isNeverOptionSelected;
}

- (void)setIsNeverOptionSelected:(BOOL)a3
{
  self->_isNeverOptionSelected = a3;
}

- (BOOL)isSpecificDateOptionSelected
{
  return self->_isSpecificDateOptionSelected;
}

- (void)setIsSpecificDateOptionSelected:(BOOL)a3
{
  self->_isSpecificDateOptionSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_datePickerItem, 0);
  objc_storeStrong((id *)&self->_specificDateItem, 0);
  objc_storeStrong((id *)&self->_endNeverDateItem, 0);
  objc_storeStrong((id *)&self->_startTodayDateItem, 0);
  objc_storeStrong((id *)&self->_editedDate, 0);

  objc_storeStrong((id *)&self->_existingDate, 0);
}

@end