@interface HUHomePodAlarmItemModuleController
- (BOOL)_shouldAllowCellSelection;
- (BOOL)allowsCellSelection;
- (Class)cellClassForItem:(id)a3;
- (HUHomePodAlarmItemModuleController)initWithModule:(id)a3;
- (HUHomePodAlarmItemModuleControllerDelegate)delegate;
- (NSMapTable)cellToItemMap;
- (unint64_t)didSelectItem:(id)a3;
- (void)_significantTimeChange:(id)a3;
- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUHomePodAlarmItemModuleController

- (HUHomePodAlarmItemModuleController)initWithModule:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUHomePodAlarmItemModuleController;
  v3 = [(HUItemModuleController *)&v8 initWithModule:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    cellToItemMap = v3->_cellToItemMap;
    v3->_cellToItemMap = (NSMapTable *)v4;

    v3->_allowsCellSelection = [(HUHomePodAlarmItemModuleController *)v3 _shouldAllowCellSelection];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__significantTimeChange_ name:*MEMORY[0x1E4F436B0] object:0];
  }
  return v3;
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUHomePodAlarmItemModuleController;
  [(HUItemModuleController *)&v10 setupCell:v6 forItem:a4];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    objc_super v8 = v7;
  }
  else {
    objc_super v8 = 0;
  }
  id v9 = v8;

  if (v9 && ![(HUHomePodAlarmItemModuleController *)self allowsCellSelection])
  {
    [v9 setAccessoryType:0];
    [v9 setDisabled:1];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v11 = a3;
  id v9 = [(HUHomePodAlarmItemModuleController *)self cellToItemMap];
  [v9 setObject:v8 forKey:v11];

  objc_super v10 = [v8 alarm];

  [v11 refreshUI:v10 roomName:0 animated:v5];
  [v11 setDelegate:self];
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HUHomePodAlarmItemModuleController *)self delegate];

  if (v5)
  {
    id v6 = [(HUHomePodAlarmItemModuleController *)self delegate];
    [v6 alarmItemModuleController:self didSelectAlarmItem:v4];
  }
  return 0;
}

- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(HUHomePodAlarmItemModuleController *)self cellToItemMap];
  id v13 = [v7 objectForKey:v6];

  id v8 = [v13 alarm];
  id v9 = (void *)[v8 mutableCopy];
  [v9 setEnabled:v4];
  objc_super v10 = [(HUItemModuleController *)self module];
  id v11 = [v10 mobileTimerAdapterForAlarmItem:v13];
  id v12 = (id)[v11 updateAlarm:v9];
}

- (BOOL)_shouldAllowCellSelection
{
  v2 = [MEMORY[0x1E4F69138] sharedInstance];
  if ([v2 hostProcess] == 100)
  {
  }
  else
  {
    v3 = [MEMORY[0x1E4F69138] sharedInstance];
    uint64_t v4 = [v3 hostProcess];

    if (v4 != 3) {
      return 1;
    }
  }
  BOOL v5 = (void *)MEMORY[0x1E4F69758];

  return [v5 isDeviceUnlocked];
}

- (void)_significantTimeChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HUHomePodAlarmItemModuleController *)self cellToItemMap];
  BOOL v5 = [v4 keyEnumerator];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        id v12 = [(HUHomePodAlarmItemModuleController *)self cellToItemMap];
        id v13 = [v12 objectForKey:v11];

        if (v13)
        {
          v14 = [v13 alarm];
          [v11 refreshUI:v14 roomName:0 animated:0];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (HUHomePodAlarmItemModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUHomePodAlarmItemModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowsCellSelection
{
  return self->_allowsCellSelection;
}

- (NSMapTable)cellToItemMap
{
  return self->_cellToItemMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellToItemMap, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end