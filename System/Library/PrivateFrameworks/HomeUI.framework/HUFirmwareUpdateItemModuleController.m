@interface HUFirmwareUpdateItemModuleController
- (BOOL)canSelectItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUExpandableTextViewCellDelegate)expandableTextViewCellDelegate;
- (HUFirmwareUpdateItemModuleController)initWithModule:(id)a3 expandableTextViewCellDelegate:(id)a4;
- (NSMapTable)expandedStateByItems;
- (void)lockupView:(id)a3 downloadControlTapped:(id)a4;
- (void)lockupView:(id)a3 expandableTextViewDidExpand:(id)a4;
- (void)setExpandableTextViewCellDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUFirmwareUpdateItemModuleController

- (HUFirmwareUpdateItemModuleController)initWithModule:(id)a3 expandableTextViewCellDelegate:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUFirmwareUpdateItemModuleController;
  v7 = [(HUItemModuleController *)&v11 initWithModule:a3];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    expandedStateByItems = v7->_expandedStateByItems;
    v7->_expandedStateByItems = (NSMapTable *)v8;

    objc_storeWeak((id *)&v7->_expandableTextViewCellDelegate, v6);
  }

  return v7;
}

- (Class)cellClassForItem:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 sourceItem],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v8 = objc_opt_class();
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HUFirmwareUpdateItemModuleController.m", 46, @"Unknown item %@", v5 object file lineNumber description];

    uint64_t v8 = 0;
  }

  return (Class)v8;
}

- (BOOL)canSelectItem:(id)a3
{
  return 0;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HUFirmwareUpdateItemModuleController;
  [(HUItemModuleController *)&v19 setupCell:v6 forItem:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v9 = [(HUFirmwareUpdateItemModuleController *)self expandedStateByItems];
    v10 = [v9 objectForKey:v7];
    uint64_t v11 = [v10 BOOLValue];

    v12 = [v8 lockupView];
    v13 = [v12 descriptionExpandableTextView];
    [v13 setDelegate:0];

    v14 = [v8 lockupView];
    v15 = [v14 descriptionExpandableTextView];
    [v15 setExpanded:v11];

    v16 = [v8 lockupView];
    v17 = [v8 lockupView];

    v18 = [v17 descriptionExpandableTextView];
    [v18 setDelegate:v16];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUFirmwareUpdateItemModuleController;
  [(HUItemModuleController *)&v16 updateCell:v8 forItem:v9 animated:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v9 sourceItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_opt_class();
      id v12 = v8;
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      id v14 = v13;

      v15 = [v14 lockupView];

      [v15 setDelegate:self];
    }
  }
}

- (void)lockupView:(id)a3 downloadControlTapped:(id)a4
{
  v4 = [a3 item];
  id v11 = [v4 latestResults];

  if (v11)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F68EE8]);
    id v6 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    id v7 = [v11 objectForKeyedSubscript:@"HFResultApplicationBundleIdentifier"];
    id v8 = [v11 objectForKeyedSubscript:@"HFResultApplicationStoreURL"];
    id v9 = (void *)[v5 initWithName:v6 bundleID:v7 payloadURL:0 storeURL:v8];

    id v10 = (id)[MEMORY[0x1E4F68EE8] handleRequest:v9];
  }
}

- (void)lockupView:(id)a3 expandableTextViewDidExpand:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUFirmwareUpdateItemModuleController *)self expandedStateByItems];
  id v9 = [v7 item];

  [v8 setObject:MEMORY[0x1E4F1CC38] forKey:v9];
  id v10 = [(HUFirmwareUpdateItemModuleController *)self expandableTextViewCellDelegate];
  [v10 expandableTextViewCellStateDidChange:v6];
}

- (HUExpandableTextViewCellDelegate)expandableTextViewCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableTextViewCellDelegate);

  return (HUExpandableTextViewCellDelegate *)WeakRetained;
}

- (void)setExpandableTextViewCellDelegate:(id)a3
{
}

- (NSMapTable)expandedStateByItems
{
  return self->_expandedStateByItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedStateByItems, 0);

  objc_destroyWeak((id *)&self->_expandableTextViewCellDelegate);
}

@end