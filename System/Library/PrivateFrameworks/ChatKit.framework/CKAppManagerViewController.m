@interface CKAppManagerViewController
- (BOOL)_hasPluginsToHideOrDelete;
- (BOOL)_pluginIsHidden:(id)a3;
- (BOOL)_pluginIsStandaloneApp:(id)a3;
- (BOOL)_pluginIsSystemApp:(id)a3;
- (BOOL)allowEnablingDisabledApps;
- (BOOL)hasAppStore;
- (BOOL)isManagingStickers;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)togglePluginAtIndex:(unint64_t)a3 enabled:(BOOL)a4;
- (CKAppManagerViewControllerDelegate)delegate;
- (NSArray)appContainedPlugins;
- (NSArray)deletableIMessageApps;
- (NSArray)plugins;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)balloonPluginManager;
- (id)getStickersOnAppStoreTableViewCell;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)appCell:(id)a3 wasToggledOn:(BOOL)a4;
- (void)doneButtonTapped:(id)a3;
- (void)reloadPluginsImmediately;
- (void)setAppContainedPlugins:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeletableIMessageApps:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIsManagingStickers:(BOOL)a3;
- (void)setPlugins:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)updateEditDoneButton;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKAppManagerViewController

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKAppManagerViewController;
  [(CKAppManagerViewController *)&v5 viewDidLayoutSubviews];
  tableView = self->_tableView;
  v4 = [(CKAppManagerViewController *)self view];
  [v4 bounds];
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)CKAppManagerViewController;
  [(CKAppManagerViewController *)&v22 viewDidLoad];
  v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"MANAGE_STICKER_APPS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKAppManagerViewController *)self setTitle:v4];

  objc_super v5 = [(CKAppManagerViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonTapped_];
  dismissButton = self->_dismissButton;
  self->_dismissButton = v14;

  v16 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42E98]), "initWithFrame:style:", 2, v7, v9, v11, v13);
  tableView = self->_tableView;
  self->_tableView = v16;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setCellLayoutMarginsFollowReadableWidth:1];
  id v18 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(UITableView *)self->_tableView setTableFooterView:v18];

  [(UITableView *)self->_tableView _setAllowsReorderingWhenNotEditing:1];
  [v5 addSubview:self->_tableView];
  v19 = self->_tableView;
  uint64_t v20 = objc_opt_class();
  v21 = +[CKAppManagerAppTableViewCell reuseIdentifier];
  [(UITableView *)v19 registerClass:v20 forCellReuseIdentifier:v21];

  [(UITableView *)self->_tableView registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"AppManagerSectionHeaderReuseIdentifier"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"AppManagerSectionFooterReuseIdentifier"];
  [(CKAppManagerViewController *)self setDefinesPresentationContext:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKAppManagerViewController;
  [(CKAppManagerViewController *)&v4 viewWillAppear:a3];
  [(CKAppManagerViewController *)self updateEditDoneButton];
  [(CKAppManagerViewController *)self reloadPluginsImmediately];
  [(UITableView *)self->_tableView reloadData];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKAppManagerViewController;
  [(CKAppManagerViewController *)&v4 viewDidDisappear:a3];
  [(CKAppManagerViewController *)self setEditing:0];
  [(CKAppManagerViewController *)self reloadPluginsImmediately];
  [(UITableView *)self->_tableView reloadData];
}

- (void)doneButtonTapped:(id)a3
{
  id v4 = [(CKAppManagerViewController *)self delegate];
  [v4 appManagerViewControllerDidFinish:self];
}

- (void)updateEditDoneButton
{
  if ([(CKAppManagerViewController *)self isEditing]) {
    dismissButton = 0;
  }
  else {
    dismissButton = self->_dismissButton;
  }
  id v4 = [(CKAppManagerViewController *)self navigationItem];
  [v4 setRightBarButtonItem:dismissButton];

  objc_super v5 = [(CKAppManagerViewController *)self editButtonItem];
  double v6 = [(CKAppManagerViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v5];

  id v7 = [(CKAppManagerViewController *)self editButtonItem];
  objc_msgSend(v7, "setEnabled:", -[CKAppManagerViewController _hasPluginsToHideOrDelete](self, "_hasPluginsToHideOrDelete"));
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CKAppManagerViewController *)self isEditing] != a3)
  {
    v16.receiver = self;
    v16.super_class = (Class)CKAppManagerViewController;
    [(CKAppManagerViewController *)&v16 setEditing:v5 animated:v4];
    [(UITableView *)self->_tableView setEditing:v5 animated:1];
    if (v5) {
      dismissButton = 0;
    }
    else {
      dismissButton = self->_dismissButton;
    }
    double v8 = [(CKAppManagerViewController *)self navigationItem];
    [v8 setRightBarButtonItem:dismissButton];

    [(UITableView *)self->_tableView beginUpdates];
    BOOL v9 = [(CKAppManagerViewController *)self hasAppStore];
    tableView = self->_tableView;
    if (v9)
    {
      double v11 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, 2);
      [(UITableView *)tableView reloadSections:v11 withRowAnimation:100];
    }
    else
    {
      double v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
      [(UITableView *)tableView reloadSections:v12 withRowAnimation:0];

      double v13 = self->_tableView;
      double v11 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
      if (v5) {
        [(UITableView *)v13 insertSections:v11 withRowAnimation:0];
      }
      else {
        [(UITableView *)v13 deleteSections:v11 withRowAnimation:0];
      }
    }

    [(UITableView *)self->_tableView endUpdates];
    v14 = [(UITableView *)self->_tableView indexPathsForVisibleRows];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__CKAppManagerViewController_setEditing_animated___block_invoke;
    v15[3] = &unk_1E5628DE0;
    v15[4] = self;
    [v14 enumerateObjectsUsingBlock:v15];

    [(UITableView *)self->_tableView _setAllowsReorderingWhenNotEditing:[(CKAppManagerViewController *)self isEditing] ^ 1];
  }
}

void __50__CKAppManagerViewController_setEditing_animated___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "cellForRowAtIndexPath:");
  if (([*(id *)(a1 + 32) isEditing] & 1) != 0 || objc_msgSend(v5, "section")) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) tableView:*(void *)(*(void *)(a1 + 32) + 976) canMoveRowAtIndexPath:v5];
  }
  [v3 setShowsReorderControl:v4];
}

- (id)balloonPluginManager
{
  return +[CKBalloonPluginManager sharedInstance];
}

- (NSArray)plugins
{
  plugins = self->_plugins;
  if (!plugins)
  {
    uint64_t v4 = [(CKAppManagerViewController *)self balloonPluginManager];
    id v5 = [v4 orderedCombinedStickerApps];
    double v6 = (NSArray *)[v5 mutableCopy];

    [(NSArray *)v6 removeLastObject];
    id v7 = self->_plugins;
    self->_plugins = v6;

    plugins = self->_plugins;
  }

  return plugins;
}

- (NSArray)deletableIMessageApps
{
  deletableIMessageApps = self->_deletableIMessageApps;
  if (!deletableIMessageApps)
  {
    uint64_t v4 = [(CKAppManagerViewController *)self balloonPluginManager];
    id v5 = [v4 allOrderedCombinedStickerApps];
    double v6 = (void *)[v5 mutableCopy];

    [v6 removeLastObject];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__CKAppManagerViewController_deletableIMessageApps__block_invoke;
    v10[3] = &unk_1E5625720;
    v10[4] = self;
    objc_msgSend(v6, "__imArrayByFilteringWithBlock:", v10);
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    double v8 = self->_deletableIMessageApps;
    self->_deletableIMessageApps = v7;

    deletableIMessageApps = self->_deletableIMessageApps;
  }

  return deletableIMessageApps;
}

uint64_t __51__CKAppManagerViewController_deletableIMessageApps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _pluginIsStandaloneApp:v3]) {
    uint64_t v4 = [*(id *)(a1 + 32) _pluginIsSystemApp:v3] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (NSArray)appContainedPlugins
{
  appContainedPlugins = self->_appContainedPlugins;
  if (!appContainedPlugins)
  {
    uint64_t v4 = [(CKAppManagerViewController *)self balloonPluginManager];
    id v5 = [v4 allOrderedCombinedStickerApps];
    double v6 = (void *)[v5 mutableCopy];

    [v6 removeLastObject];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__CKAppManagerViewController_appContainedPlugins__block_invoke;
    v11[3] = &unk_1E5625720;
    v11[4] = self;
    id v7 = objc_msgSend(v6, "__imArrayByFilteringWithBlock:", v11);
    double v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_178];
    BOOL v9 = self->_appContainedPlugins;
    self->_appContainedPlugins = v8;

    appContainedPlugins = self->_appContainedPlugins;
  }

  return appContainedPlugins;
}

uint64_t __49__CKAppManagerViewController_appContainedPlugins__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _pluginIsStandaloneApp:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) _pluginIsSystemApp:v3] ^ 1;
  }

  return v4;
}

uint64_t __49__CKAppManagerViewController_appContainedPlugins__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 browserDisplayName];
  double v6 = [v4 browserDisplayName];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)_pluginIsStandaloneApp:(id)a3
{
  return [a3 isLaunchProhibited];
}

- (BOOL)_pluginIsHidden:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAppManagerViewController *)self balloonPluginManager];
  char v6 = [v5 isPluginHiddenFromSendMenuAndStickers:v4];

  return v6;
}

- (BOOL)_pluginIsSystemApp:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAppManagerViewController *)self balloonPluginManager];
  char v6 = [v5 isPluginSystemApp:v4];

  return v6;
}

- (BOOL)_hasPluginsToHideOrDelete
{
  return [(NSArray *)self->_deletableIMessageApps count]
      || [(NSArray *)self->_appContainedPlugins count] != 0;
}

- (BOOL)hasAppStore
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  int v4 = [v3 applicationIsInstalled:@"com.apple.AppStore"];

  if (!v4) {
    return 0;
  }
  id v5 = [(CKAppManagerViewController *)self balloonPluginManager];
  char v6 = [v5 isAppStoreEnabled];

  uint64_t v7 = [(CKAppManagerViewController *)self balloonPluginManager];
  double v8 = [v7 pluginForIdentifier:@"com.apple.appstore.MessagesProvider"];

  if (v8) {
    return v6;
  }
  else {
    return 0;
  }
}

- (void)reloadPluginsImmediately
{
  [(CKAppManagerViewController *)self setPlugins:0];
  [(CKAppManagerViewController *)self setDeletableIMessageApps:0];
  [(CKAppManagerViewController *)self setAppContainedPlugins:0];
  [(CKAppManagerViewController *)self plugins];

  [(CKAppManagerViewController *)self deletableIMessageApps];
  [(CKAppManagerViewController *)self appContainedPlugins];

  [(CKAppManagerViewController *)self updateEditDoneButton];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6 && [v6 row] != 0x7FFFFFFFFFFFFFFFLL) {
    [v12 deselectRowAtIndexPath:v7 animated:1];
  }
  if ((-[CKAppManagerViewController isEditing](self, "isEditing") & 1) == 0 && [v7 section] == 1)
  {
    double v8 = IMBalloonExtensionIDWithSuffix();
    BOOL v9 = [(CKAppManagerViewController *)self balloonPluginManager];
    double v10 = [v9 pluginForExtensionIdentifier:v8];

    if (v10)
    {
      double v11 = [(CKAppManagerViewController *)self delegate];
      [v11 browserAppManagerDidSelectPlugin:v10];
    }
  }
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int v6 = [(CKAppManagerViewController *)self isEditing];
  uint64_t v7 = [v5 section];
  if (v6)
  {
    if (!v7)
    {
      unint64_t v10 = [v5 row];
      double v11 = [(CKAppManagerViewController *)self deletableIMessageApps];
      unint64_t v12 = [v11 count];

      if (v10 >= v12) {
        goto LABEL_5;
      }
      uint64_t v13 = [(CKAppManagerViewController *)self deletableIMessageApps];
      v14 = objc_msgSend((id)v13, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

      objc_opt_class();
      LOBYTE(v13) = objc_opt_isKindOfClass();

      if ((v13 & 1) == 0) {
        goto LABEL_5;
      }
    }
    uint64_t v7 = [v5 section];
  }
  if (v7 != 1)
  {
    BOOL v8 = 1;
    goto LABEL_7;
  }
LABEL_5:
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (-[CKAppManagerViewController isEditing](self, "isEditing") && ![v5 section])
  {
    int v6 = 0;
  }
  else
  {
    int v6 = [MEMORY[0x1E4F42E68] configurationWithActions:MEMORY[0x1E4F1CBF0]];
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(CKAppManagerViewController *)self isEditing])
  {
    uint64_t v10 = [v9 section];
    if (a4 == 1 && !v10)
    {
      double v11 = [(CKAppManagerViewController *)self deletableIMessageApps];
      unint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));

      uint64_t v13 = [v12 identifier];
      id location = 0;
      objc_initWeak(&location, self);
      v14 = [(CKAppManagerViewController *)self balloonPluginManager];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __77__CKAppManagerViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
      v16[3] = &unk_1E5629AB0;
      objc_copyWeak(&v21, &location);
      id v15 = v14;
      id v17 = v15;
      id v18 = v8;
      id v19 = v9;
      uint64_t v20 = self;
      [v15 deleteAppWithIdentifier:v13 completion:v16];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __77__CKAppManagerViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (a2)
    {
      [*(id *)(a1 + 32) refreshPlugins];
      [*(id *)(a1 + 32) saveWithNotification:1];
      [*(id *)(a1 + 32) saveCombinedAppsWithNotification:1];
      [WeakRetained reloadPluginsImmediately];
      id v5 = *(void **)(a1 + 40);
      v7[0] = *(void *)(a1 + 48);
      int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      [v5 deleteRowsAtIndexPaths:v6 withRowAnimation:100];

      if (([*(id *)(a1 + 56) _hasPluginsToHideOrDelete] & 1) == 0) {
        [*(id *)(a1 + 56) setEditing:0 animated:1];
      }
    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(CKAppManagerViewController *)self isEditing]) {
    return 2;
  }
  if ([(CKAppManagerViewController *)self hasAppStore]) {
    return 2;
  }
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (![(CKAppManagerViewController *)self isEditing])
  {
    if (a4 == 1) {
      return [(CKAppManagerViewController *)self hasAppStore];
    }
    if (!a4)
    {
      uint64_t v6 = 1008;
      goto LABEL_10;
    }
    return 0;
  }
  if (a4 == 1)
  {
    uint64_t v6 = 1024;
    goto LABEL_10;
  }
  if (a4) {
    return 0;
  }
  uint64_t v6 = 1016;
LABEL_10:
  id v8 = *(Class *)((char *)&self->super.super.super.isa + v6);

  return [v8 count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CKAppManagerViewController *)self isEditing];
  uint64_t v9 = [v7 section];
  if (v8)
  {
    if (v9 == 1)
    {
      id v15 = +[CKAppManagerAppTableViewCell reuseIdentifier];
      double v11 = [v6 dequeueReusableCellWithIdentifier:v15];

      uint64_t v12 = 1024;
    }
    else
    {
      if (v9)
      {
        v14 = 0;
        double v11 = 0;
        goto LABEL_11;
      }
      uint64_t v10 = +[CKAppManagerAppTableViewCell reuseIdentifier];
      double v11 = [v6 dequeueReusableCellWithIdentifier:v10];

      uint64_t v12 = 1016;
    }
    v14 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v12), "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    [v11 updateCellWithPluginInfo:v14];
    [v11 setDelegate:self];
LABEL_11:
    objc_msgSend(v11, "setToggleVisible:editable:isOn:", objc_msgSend(v7, "section") == 1, 1, -[CKAppManagerViewController _pluginIsHidden:](self, "_pluginIsHidden:", v14) ^ 1);
LABEL_15:
    id v16 = v11;

    goto LABEL_16;
  }
  if (v9 != 1)
  {
    if (v9)
    {
      v14 = 0;
      double v11 = 0;
    }
    else
    {
      uint64_t v13 = +[CKAppManagerAppTableViewCell reuseIdentifier];
      double v11 = [v6 dequeueReusableCellWithIdentifier:v13];

      v14 = -[NSArray objectAtIndexedSubscript:](self->_plugins, "objectAtIndexedSubscript:", [v7 row]);
      [v11 updateCellWithPluginInfo:v14];
      [v11 setDelegate:self];
    }
    goto LABEL_15;
  }
  if ([(CKAppManagerViewController *)self hasAppStore])
  {
    id v16 = [(CKAppManagerViewController *)self getStickersOnAppStoreTableViewCell];
  }
  else
  {
    id v16 = 0;
  }
LABEL_16:

  return v16;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  uint64_t v4 = [(CKAppManagerViewController *)self tableView:a3 numberOfRowsInSection:a4];
  double result = *MEMORY[0x1E4F43D18];
  if (v4 <= 0) {
    return 0.0;
  }
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  uint64_t v4 = [(CKAppManagerViewController *)self tableView:a3 numberOfRowsInSection:a4];
  double result = *MEMORY[0x1E4F43D18];
  if (v4 <= 0) {
    return 0.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(CKAppManagerViewController *)self tableView:v6 numberOfRowsInSection:a4] < 1) {
    goto LABEL_7;
  }
  if ([(CKAppManagerViewController *)self isEditing])
  {
    id v7 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"AppManagerSectionHeaderReuseIdentifier"];
    if (a4 == 1)
    {
      int v8 = CKFrameworkBundle();
      uint64_t v9 = v8;
      uint64_t v10 = @"APPS_WITH_STICKER_APPS_SECTION_HEADER";
    }
    else
    {
      if (a4) {
        goto LABEL_12;
      }
      int v8 = CKFrameworkBundle();
      uint64_t v9 = v8;
      uint64_t v10 = @"STICKERS_ONLY_APPS_SECTION_HEADER";
    }
    double v11 = [v8 localizedStringForKey:v10 value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v12 = [v11 localizedUppercaseString];
    uint64_t v13 = [v7 textLabel];
    [v13 setText:v12];

    goto LABEL_11;
  }
  if (a4)
  {
LABEL_7:
    id v7 = 0;
    goto LABEL_12;
  }
  id v7 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"AppManagerSectionHeaderReuseIdentifier"];
  uint64_t v9 = CKFrameworkBundle();
  double v11 = [v9 localizedStringForKey:@"STICKER_APPS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v12 = [v7 textLabel];
  [v12 setText:v11];
LABEL_11:

LABEL_12:

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(CKAppManagerViewController *)self isEditing];
  int v8 = 0;
  if (a4 == 1 && v7)
  {
    if ([(CKAppManagerViewController *)self tableView:v6 numberOfRowsInSection:1] < 1)
    {
      int v8 = 0;
    }
    else
    {
      int v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"AppManagerSectionFooterReuseIdentifier"];
      uint64_t v9 = CKFrameworkBundle();
      uint64_t v10 = [v9 localizedStringForKey:@"APPS_WITH_STICKER_APPS_SECTION_FOOTER" value:&stru_1EDE4CA38 table:@"ChatKit"];
      double v11 = [v8 textLabel];
      [v11 setText:v10];
    }
  }

  return v8;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = (-[CKAppManagerViewController isEditing](self, "isEditing") & 1) == 0 && [v5 section] == 0;

  return v6;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  if (([(CKAppManagerViewController *)self isEditing] & 1) == 0
    && ![v14 section]
    && ![v7 section])
  {
    unint64_t v8 = [v14 row];
    uint64_t v9 = [(CKAppManagerViewController *)self plugins];
    unint64_t v10 = [v9 count];

    if (v8 < v10)
    {
      double v11 = [(CKAppManagerViewController *)self plugins];
      uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v14, "row"));

      uint64_t v13 = [(CKAppManagerViewController *)self balloonPluginManager];
      [v13 updateIndexPath:v7 forCombinedStickerApp:v12];

      [(CKAppManagerViewController *)self reloadPluginsImmediately];
    }
  }
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v8 section])
  {
    objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[CKAppManagerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v7, 0)- 1, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v8;
  }
  unint64_t v10 = v9;

  return v10;
}

- (id)getStickersOnAppStoreTableViewCell
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:0 reuseIdentifier:0];
  id v3 = [v2 defaultContentConfiguration];
  uint64_t v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"GET_STICKER_APPS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v3 setText:v5];

  BOOL v6 = [MEMORY[0x1E4F428B8] linkColor];
  id v7 = [v3 textProperties];
  [v7 setColor:v6];

  [v2 setContentConfiguration:v3];

  return v2;
}

- (void)appCell:(id)a3 wasToggledOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(UITableView *)self->_tableView indexPathForCell:a3];
  if (-[CKAppManagerViewController isEditing](self, "isEditing") && [v6 section] == 1) {
    -[CKAppManagerViewController togglePluginAtIndex:enabled:](self, "togglePluginAtIndex:enabled:", [v6 row], v4);
  }
}

- (BOOL)allowEnablingDisabledApps
{
  v2 = [(CKAppManagerViewController *)self balloonPluginManager];
  char v3 = [v2 isAppInstallationEnabled];

  return v3;
}

- (BOOL)togglePluginAtIndex:(unint64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(CKAppManagerViewController *)self appContainedPlugins];
  unint64_t v8 = [v7 count];

  BOOL v9 = v8 > a3;
  if (v8 <= a3)
  {
    if (_IMWillLog())
    {
      double v11 = [(CKAppManagerViewController *)self plugins];
      [v11 count];
      _IMAlwaysLog();
      goto LABEL_8;
    }
    return 0;
  }
  if (v4 && ![(CKAppManagerViewController *)self allowEnablingDisabledApps]) {
    return 0;
  }
  unint64_t v10 = [(CKAppManagerViewController *)self appContainedPlugins];
  double v11 = [v10 objectAtIndexedSubscript:a3];

  uint64_t v12 = [(CKAppManagerViewController *)self balloonPluginManager];
  [v12 setPlugin:v11 hiddenInSendMenuAndStickers:v4];
  [(CKAppManagerViewController *)self reloadPluginsImmediately];
  [v12 saveCombinedAppsWithNotification:1];

LABEL_8:
  return v9;
}

- (BOOL)isManagingStickers
{
  return self->_isManagingStickers;
}

- (void)setIsManagingStickers:(BOOL)a3
{
  self->_isManagingStickers = a3;
}

- (CKAppManagerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAppManagerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setPlugins:(id)a3
{
}

- (void)setDeletableIMessageApps:(id)a3
{
}

- (void)setAppContainedPlugins:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContainedPlugins, 0);
  objc_storeStrong((id *)&self->_deletableIMessageApps, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dismissButton, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end