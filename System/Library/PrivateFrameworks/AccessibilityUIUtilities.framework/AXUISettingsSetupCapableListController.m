@interface AXUISettingsSetupCapableListController
- (AXUISettingsSetupCapableListController)init;
- (AXUISettingsSetupCapableListController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)inSetup;
- (id)createWelcomeControllerWithAXSettingsController:(id)a3 title:(id)a4;
- (void)dealloc;
- (void)filterBuddy:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reload;
- (void)setAllSpecifiersUnsearchable:(id)a3;
- (void)setInSetup:(BOOL)a3;
- (void)setupLongTitleSpecifiers:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AXUISettingsSetupCapableListController

- (AXUISettingsSetupCapableListController)init
{
  v4.receiver = self;
  v4.super_class = (Class)AXUISettingsSetupCapableListController;
  v2 = [(AXUISettingsSetupCapableListController *)&v4 init];
  if (v2) {
    [(AXUISettingsSetupCapableListController *)v2 setInSetup:AXProcessIsSetup()];
  }
  return v2;
}

- (void)dealloc
{
  AXUISettingsCleanUpWelcomeControllerTableViewObservations(self);
  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsSetupCapableListController;
  [(AXUISettingsSetupCapableListController *)&v3 dealloc];
}

- (AXUISettingsSetupCapableListController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AXUISettingsSetupCapableListController;
  objc_super v4 = [(AXUISettingsSetupCapableListController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4) {
    [(AXUISettingsSetupCapableListController *)v4 setInSetup:AXProcessIsSetup()];
  }
  return v4;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)AXUISettingsSetupCapableListController;
  [(AXUISettingsSetupCapableListController *)&v10 viewDidLoad];
  if (self->_inSetup)
  {
    objc_super v3 = sharedBFFStyle();
    objc_super v4 = [v3 backgroundColor];
    v5 = [(AXUISettingsSetupCapableListController *)self view];
    [v5 setBackgroundColor:v4];

    objc_super v6 = sharedBFFStyle();
    v7 = [v6 backgroundColor];
    [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]) setBackgroundColor:v7];

    v8 = [(AXUISettingsSetupCapableListController *)self view];
    v9 = [v8 layer];
    [v9 setMasksToBounds:1];

    [(AXUISettingsSetupCapableListController *)self setExtendedLayoutIncludesOpaqueBars:1];
    [(AXUISettingsSetupCapableListController *)self setEdgesForExtendedLayout:1];
  }
}

- (void)reload
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = *MEMORY[0x1E4F93068];
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setObject:v8 forKeyedSubscript:v7];
      }
      while (v5 != v9);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)AXUISettingsSetupCapableListController;
  [(AXUISettingsSetupCapableListController *)&v10 reload];
}

- (void)filterBuddy:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(AXUISettingsSetupCapableListController *)self inSetup])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v12 = objc_msgSend(v11, "propertyForKey:", @"inBuddySetup", (void)v14);
          char v13 = [v12 BOOLValue];

          if ((v13 & 1) == 0) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [v6 removeObjectsInArray:v5];
  }
}

- (void)setAllSpecifiersUnsearchable:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    uint64_t v7 = *MEMORY[0x1E4F931F8];
    uint64_t v8 = MEMORY[0x1E4F1CC28];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setProperty:v8 forKey:v7];
      }
      while (v5 != v9);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)setupLongTitleSpecifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    uint64_t v7 = *MEMORY[0x1E4F930A8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 cellType] != 6
          || ([v9 objectForKeyedSubscript:v7],
              long long v10 = objc_claimAutoreleasedReturnValue(),
              v10,
              v10))
        {
          if ([v9 cellType] != 2
            && [v9 cellType] != 1
            && [v9 cellType] != 4)
          {
            continue;
          }
          long long v11 = [v9 objectForKeyedSubscript:v7];

          if (v11) {
            continue;
          }
        }
        [v9 setProperty:objc_opt_class() forKey:v7];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (id)createWelcomeControllerWithAXSettingsController:(id)a3 title:(id)a4
{
  return AXUISettingsCreateWelcomeController(self, a3, a4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((AXUISettingsHandleWelcomeControllerTableViewUpdate(self, v10, v11) & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)AXUISettingsSetupCapableListController;
    [(AXUISettingsSetupCapableListController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AXUISettingsSetupCapableListController *)self indexForIndexPath:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v8;
    if (([(AXUISettingsSetupCapableListController *)self isShowingSetupController] & 1) == 0)
    {
      if ([(AXUISettingsSetupCapableListController *)self inSetup])
      {
        id v10 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]) objectAtIndex:v9];
        if (*(void *)&v10[*MEMORY[0x1E4F92F28]] != 2)
        {
          id v11 = 0;
LABEL_22:

          goto LABEL_12;
        }
        id v11 = [(AXUISettingsSetupCapableListController *)self selectSpecifier:v10];
        if (!v11)
        {
LABEL_19:
          if ([v10 controllerLoadAction])
          {
            v22 = [v6 indexPathForSelectedRow];
            [v6 deselectRowAtIndexPath:v22 animated:1];
            goto LABEL_21;
          }
          goto LABEL_22;
        }
        uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
        objc_super v13 = v11;
        if (v11 != (void *)v12)
        {
          long long v14 = (void *)v12;
          long long v15 = [(AXUISettingsSetupCapableListController *)self navigationController];
          long long v16 = [v15 topViewController];
          if (v16 == self)
          {
            char v20 = [v11 conformsToProtocol:&unk_1F1F6D738];

            if (v20) {
              goto LABEL_19;
            }
            goto LABEL_16;
          }
          uint64_t v17 = v16;
          v24 = [(AXUISettingsSetupCapableListController *)self navigationController];
          v18 = [v24 topViewController];
          uint64_t v19 = [v18 childViewControllers];
          if ([v19 containsObject:self])
          {
            char v23 = [v11 conformsToProtocol:&unk_1F1F6D738];

            if (v23) {
              goto LABEL_19;
            }
LABEL_16:
            v21 = [v10 name];
            v22 = [(AXUISettingsSetupCapableListController *)self createWelcomeControllerWithAXSettingsController:v11 title:v21];

            [(AXUISettingsSetupCapableListController *)self showController:v22];
LABEL_21:

            goto LABEL_13;
          }

          objc_super v13 = v14;
        }

        goto LABEL_19;
      }
    }
  }
  id v11 = 0;
LABEL_12:
  v25.receiver = self;
  v25.super_class = (Class)AXUISettingsSetupCapableListController;
  [(AXUISettingsSetupCapableListController *)&v25 tableView:v6 didSelectRowAtIndexPath:v7];
LABEL_13:
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![v6 conformsToProtocol:&unk_1F1F6D738]
    || (id v7 = v6,
        objc_msgSend(v7, "setSetupMode:", -[AXUISettingsSetupCapableListController inSetup](self, "inSetup")),
        char v8 = [v7 presentWithController:self],
        v7,
        (v8 & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)AXUISettingsSetupCapableListController;
    [(AXUISettingsSetupCapableListController *)&v9 showController:v6 animate:v4];
  }
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)AXUISettingsSetupCapableListController;
  [(AXUISettingsSetupCapableListController *)&v12 viewDidLayoutSubviews];
  if ([(AXUISettingsSetupCapableListController *)self inSetup])
  {
    id v3 = [(AXUISettingsSetupCapableListController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]), "setFrame:", v5, v7, v9, v11);
    AXPerformSafeBlock();
  }
}

uint64_t __63__AXUISettingsSetupCapableListController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSectionContentInsetWithAnimation:0];
}

- (BOOL)inSetup
{
  return self->_inSetup;
}

- (void)setInSetup:(BOOL)a3
{
  self->_inSetup = a3;
}

@end