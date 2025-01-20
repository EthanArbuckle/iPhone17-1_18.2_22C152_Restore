@interface HUScheduleDateEditorItemModuleController
- (Class)cellClassForItem:(id)a3;
- (id)_editorItemModule;
- (unint64_t)didSelectItem:(id)a3;
- (void)dateAndTimePickerCell:(id)a3 didSelectDate:(id)a4;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUScheduleDateEditorItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUScheduleDateEditorItemModuleController *)self _editorItemModule];
  v6 = [v5 startTodayDateItem];
  if ([v4 isEqual:v6]) {
    goto LABEL_4;
  }
  v7 = [v5 endNeverDateItem];
  if ([v4 isEqual:v7])
  {

LABEL_4:
    goto LABEL_5;
  }
  v10 = [v5 specificDateItem];
  char v11 = [v4 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    v12 = [v5 datePickerItem];
    [v4 isEqual:v12];
  }
LABEL_5:
  v8 = objc_opt_class();

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUScheduleDateEditorItemModuleController;
  [(HUItemModuleController *)&v15 setupCell:v6 forItem:a4];
  v7 = [(HUScheduleDateEditorItemModuleController *)self _editorItemModule];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v8 = v6;
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    [v10 toggleTimePickerOptionVisibility:0];
    [v10 setHideTitleLabel:1];
    char v11 = [v7 existingDate];
    v12 = [MEMORY[0x1E4F1C9C8] distantFuture];
    if ([v11 isEqualToDate:v12])
    {
      v13 = [MEMORY[0x1E4F1C9C8] date];
      v14 = objc_msgSend(v13, "hf_endOfDay");
    }
    else
    {
      v14 = [v7 existingDate];
    }

    [v10 setDateAndTimePickerDate:v14];
    [v7 setEditedDate:v14];
    [v10 setDelegate:self];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HUScheduleDateEditorItemModuleController;
  [(HUItemModuleController *)&v23 updateCell:v8 forItem:v9 animated:v5];
  id v10 = [(HUScheduleDateEditorItemModuleController *)self _editorItemModule];
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
    goto LABEL_13;
  }
  v14 = [v10 startTodayDateItem];
  if (([v9 isEqual:v14] & 1) == 0)
  {
    objc_super v15 = [v10 endNeverDateItem];
    if (![v9 isEqual:v15])
    {
      v21 = [v10 specificDateItem];
      char v22 = [v9 isEqual:v21];

      if ((v22 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  v16 = [v9 latestResults];
  v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
  if ([v17 BOOLValue]) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = 0;
  }
  [v13 setAccessoryType:v18];

  [v13 setDisabled:0];
  v19 = [v9 latestResults];
  v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
  [v13 setAccessibilityIdentifier:v20];

LABEL_13:
}

- (unint64_t)didSelectItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    int v16 = 138412802;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v7;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User selected item [%@]", (uint8_t *)&v16, 0x20u);
  }
  id v8 = [(HUScheduleDateEditorItemModuleController *)self _editorItemModule];
  id v9 = [v8 startTodayDateItem];
  int v10 = [v5 isEqual:v9];

  if (v10)
  {
    [v8 updateToTodayDateOption];
  }
  else
  {
    id v11 = [v8 endNeverDateItem];
    int v12 = [v5 isEqual:v11];

    if (v12)
    {
      [v8 updateToNeverDateOption];
    }
    else
    {
      id v13 = [v8 specificDateItem];
      int v14 = [v5 isEqual:v13];

      if (v14) {
        [v8 updateToSpecificDateOption];
      }
    }
  }

  return 0;
}

- (void)dateAndTimePickerCell:(id)a3 didSelectDate:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v10 = 138412802;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ User selected date [%@] from calendar picker.", (uint8_t *)&v10, 0x20u);
  }
  id v9 = [(HUScheduleDateEditorItemModuleController *)self _editorItemModule];
  [v9 setEditedDate:v6];
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