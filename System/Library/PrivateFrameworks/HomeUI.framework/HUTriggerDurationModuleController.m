@interface HUTriggerDurationModuleController
- (Class)cellClassForItem:(id)a3;
- (HUTriggerDurationModuleControllerDelegate)delegate;
- (id)_durationEventBuilder;
- (unint64_t)didSelectItem:(id)a3;
- (void)durationPicker:(id)a3 didSelectDuration:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUTriggerDurationModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 durationSummaryItem];

  if (v6 != v4)
  {
    v7 = [(HUItemModuleController *)self module];
    [v7 durationPickerItem];
  }
  v8 = (objc_class *)(id)objc_opt_class();

  return v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUTriggerDurationModuleController;
  [(HUItemModuleController *)&v21 setupCell:v6 forItem:v7];
  v8 = [(HUItemModuleController *)self module];
  v9 = [v8 durationSummaryItem];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    objc_opt_class();
    id v11 = v6;
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    [v13 setHideIcon:1];
    [v13 setValueColorFollowsTintColor:1];
    goto LABEL_15;
  }
  v14 = [(HUItemModuleController *)self module];
  id v15 = [v14 durationPickerItem];

  if (v15 == v7)
  {
    uint64_t v16 = objc_opt_class();
    id v17 = v6;
    if (v17)
    {
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      id v13 = v17;
      if (v18) {
        goto LABEL_14;
      }
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v19 handleFailureInFunction:v20, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v16, objc_opt_class() file lineNumber description];
    }
    id v13 = 0;
LABEL_14:

    [v13 setDelegate:self];
LABEL_15:
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v21 = a3;
  id v7 = a4;
  v8 = [(HUItemModuleController *)self module];
  v9 = [v8 durationPickerItem];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    id v12 = v21;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
      v14 = v12;
      if (v13) {
        goto LABEL_9;
      }
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v15 handleFailureInFunction:v16, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v11, objc_opt_class() file lineNumber description];
    }
    v14 = 0;
LABEL_9:

    id v17 = [(HUTriggerDurationModuleController *)self _durationEventBuilder];
    v18 = v17;
    if (v17)
    {
      v19 = NSNumber;
      [v17 duration];
      v20 = objc_msgSend(v19, "numberWithDouble:");
      [v14 setCurrentDuration:v20];
    }
    else
    {
      [v14 setCurrentDuration:0];
    }
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 durationSummaryItem];

  if (v6 == v4)
  {
    id v7 = [(HUItemModuleController *)self module];
    int v8 = [v7 durationPickerShown];
    char v9 = v8;
    uint64_t v10 = v8 ^ 1u;

    uint64_t v11 = [(HUItemModuleController *)self module];
    [v11 setDurationPickerShown:v10];

    if ((v9 & 1) == 0)
    {
      id v12 = [(HUTriggerDurationModuleController *)self delegate];
      id v13 = [(HUItemModuleController *)self module];
      v14 = [v13 durationPickerItem];
      [v12 durationModuleController:self requestsScrollToItem:v14];
    }
  }
  return 0;
}

- (void)durationPicker:(id)a3 didSelectDuration:(id)a4
{
  id v10 = a4;
  if (v10)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F69100]);
    [v10 doubleValue];
    objc_msgSend(v5, "setDuration:");
    id v6 = [(HUItemModuleController *)self module];
    id v7 = [v6 triggerBuilder];
    [v7 setEndEvent:v5];
  }
  else
  {
    id v5 = [(HUItemModuleController *)self module];
    id v6 = [v5 triggerBuilder];
    [v6 removeAllEndEventBuilders];
  }

  int v8 = [(HUItemModuleController *)self module];
  char v9 = [v8 itemManager];
  [v9 triggerBuilderDidChange];
}

- (id)_durationEventBuilder
{
  v2 = [(HUItemModuleController *)self module];
  v3 = [v2 triggerBuilder];
  id v4 = [v3 designatedDurationEventBuilder];

  return v4;
}

- (HUTriggerDurationModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerDurationModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end