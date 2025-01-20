@interface HUScheduleRecurrenceEditorItemModuleController
- (Class)cellClassForItem:(id)a3;
- (id)_editorItemModule;
- (unint64_t)didSelectItem:(id)a3;
- (void)dayOfWeekPickerCell:(id)a3 didChangeSelectedRecurrences:(id)a4;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUScheduleRecurrenceEditorItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUScheduleRecurrenceEditorItemModuleController *)self _editorItemModule];
  v6 = [v5 dailyOptionItem];
  if ([v4 isEqual:v6])
  {
  }
  else
  {
    v7 = [v5 weeklyOptionItem];
    char v8 = [v4 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      v9 = [v5 daysOfWeekPickerItem];
      [v4 isEqual:v9];
    }
  }
  v10 = objc_opt_class();

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUScheduleRecurrenceEditorItemModuleController;
  [(HUItemModuleController *)&v14 setupCell:v6 forItem:a4];
  v7 = [(HUScheduleRecurrenceEditorItemModuleController *)self _editorItemModule];
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v12 = [v7 initialRecurrences];
    v13 = [v11 setWithArray:v12];
    [v10 setSelectedRecurrences:v13];

    [v10 setDelegate:self];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUScheduleRecurrenceEditorItemModuleController;
  [(HUItemModuleController *)&v22 updateCell:v8 forItem:v9 animated:v5];
  id v10 = [(HUScheduleRecurrenceEditorItemModuleController *)self _editorItemModule];
  objc_opt_class();
  id v11 = v8;
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    objc_super v14 = [v10 dailyOptionItem];
    if ([v9 isEqual:v14])
    {
    }
    else
    {
      v15 = [v10 weeklyOptionItem];
      int v16 = [v9 isEqual:v15];

      if (!v16) {
        goto LABEL_12;
      }
    }
    v17 = [v9 latestResults];
    v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
    if ([v18 BOOLValue]) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = 0;
    }
    [v13 setAccessoryType:v19];

    [v13 setDisabled:0];
    v20 = [v9 latestResults];
    v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v13 setAccessibilityIdentifier:v21];
  }
LABEL_12:
}

- (unint64_t)didSelectItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    int v14 = 138412802;
    v15 = self;
    __int16 v16 = 2112;
    v17 = v7;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User selected item [%@]", (uint8_t *)&v14, 0x20u);
  }
  id v8 = [(HUScheduleRecurrenceEditorItemModuleController *)self _editorItemModule];
  id v9 = [v8 dailyOptionItem];
  int v10 = [v5 isEqual:v9];

  if (v10)
  {
    [v8 updateToDailyRecurrenceOption];
  }
  else
  {
    id v11 = [v8 weeklyOptionItem];
    int v12 = [v5 isEqual:v11];

    if (v12) {
      [v8 updateToWeeklyRecurrenceOption];
    }
  }

  return 0;
}

- (void)dayOfWeekPickerCell:(id)a3 didChangeSelectedRecurrences:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(HUScheduleRecurrenceEditorItemModuleController *)self _editorItemModule];
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(a2);
    int v10 = [v7 editedRecurrences];
    int v12 = 138413058;
    id v13 = self;
    __int16 v14 = 2112;
    v15 = v9;
    __int16 v16 = 2112;
    v17 = v10;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ User changed selected recurrences from [%@] to [%@]", (uint8_t *)&v12, 0x2Au);
  }
  id v11 = [v6 allObjects];
  [v7 setEditedRecurrences:v11];
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

@end