@interface FPUIAuthenticationVolumeMountViewController
- (BOOL)_canMoveToNextStep;
- (FPUIAuthenticationVolumeMountViewController)initWithVolumes:(id)a3 mountedVolumeIdentifiers:(id)a4;
- (id)defaultRightBarButtonItem;
- (id)tableCellCheckmarkImageDisabled;
- (void)_done:(id)a3;
- (void)selectedVolumesIndexesDidChange;
- (void)setupTableViewSections;
- (void)viewDidLoad;
@end

@implementation FPUIAuthenticationVolumeMountViewController

- (FPUIAuthenticationVolumeMountViewController)initWithVolumes:(id)a3 mountedVolumeIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FPUIAuthenticationVolumeMountViewController;
  v8 = [(FPUIAuthenticationTableViewController *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    allVolumeRepresentations = v8->_allVolumeRepresentations;
    v8->_allVolumeRepresentations = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    mountedVolumeIdentifiers = v8->_mountedVolumeIdentifiers;
    v8->_mountedVolumeIdentifiers = (NSArray *)v11;

    uint64_t v13 = objc_opt_new();
    selectedVolumesIndexes = v8->_selectedVolumesIndexes;
    v8->_selectedVolumesIndexes = (NSMutableIndexSet *)v13;
  }
  return v8;
}

- (id)defaultRightBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  uint64_t v11 = FPUILoc(@"DONE_NAV_BAR_BUTTON_TITLE", v4, v5, v6, v7, v8, v9, v10, v14);
  v12 = (void *)[v3 initWithTitle:v11 style:2 target:self action:sel__done_];

  return v12;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)FPUIAuthenticationVolumeMountViewController;
  [(FPUIAuthenticationTableViewController *)&v3 viewDidLoad];
  [(FPUIAuthenticationTableViewController *)self setCanTransitionToNextStep:[(FPUIAuthenticationVolumeMountViewController *)self _canMoveToNextStep]];
}

- (void)_done:(id)a3
{
  [(FPUIAuthenticationTableViewController *)self setNavBarActivityIndicatorHidden:0];
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  selectedVolumesIndexes = self->_selectedVolumesIndexes;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __53__FPUIAuthenticationVolumeMountViewController__done___block_invoke;
  uint64_t v11 = &unk_264C6CCE8;
  v12 = self;
  id v13 = v4;
  id v6 = v4;
  [(NSMutableIndexSet *)selectedVolumesIndexes enumerateIndexesUsingBlock:&v8];
  -[FPUIAuthenticationTableViewController setTransitioning:](self, "setTransitioning:", 1, v8, v9, v10, v11, v12);
  uint64_t v7 = [(FPUIAuthenticationTableViewController *)self authenticationDelegate];
  [v7 connectionFlowDelegate:self didPickVolumeMountIdentifiers:v6];
}

void __53__FPUIAuthenticationVolumeMountViewController__done___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1056) objectAtIndexedSubscript:a2];
  objc_super v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v5 identifier];
  [v3 addObject:v4];
}

- (void)setupTableViewSections
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  uint64_t v11 = FPUILoc(@"SELECT_VOLUMES_TO_MOUNT", v4, v5, v6, v7, v8, v9, v10, v3);
  [v20 setHeaderTitle:v11];

  [v20 setHeaderHeight:*MEMORY[0x263F1D600]];
  v22 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_allVolumeRepresentations;
  uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    uint64_t v14 = MEMORY[0x263EF8330];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * v15);
        v17 = objc_opt_new();
        v26[0] = v14;
        v26[1] = 3221225472;
        v26[2] = __69__FPUIAuthenticationVolumeMountViewController_setupTableViewSections__block_invoke;
        v26[3] = &unk_264C6CD10;
        v26[4] = v16;
        v26[5] = self;
        [v17 setCellCustomizationHandler:v26];
        objc_initWeak(&location, self);
        v23[0] = v14;
        v23[1] = 3221225472;
        v23[2] = __69__FPUIAuthenticationVolumeMountViewController_setupTableViewSections__block_invoke_2;
        v23[3] = &unk_264C6CD38;
        objc_copyWeak(&v24, &location);
        v23[4] = self;
        [v17 setSelectionHandler:v23];
        [v22 addObject:v17];
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);

        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v12);
  }

  v33 = v20;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  [(FPUIAuthenticationTableViewController *)self setSectionDescriptors:v18];

  v31 = &unk_26E908B38;
  v32 = v22;
  v19 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  [(FPUIAuthenticationTableViewController *)self setRowDescriptors:v19];
}

void __69__FPUIAuthenticationVolumeMountViewController_setupTableViewSections__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) displayName];
  uint64_t v7 = [v15 textLabel];
  [v7 setText:v6];

  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 1064);
  uint64_t v9 = [*(id *)(a1 + 32) identifier];
  uint64_t v10 = [v8 containsObject:v9] ^ 1;

  uint64_t v11 = [v15 textLabel];
  [v11 setEnabled:v10];

  [v15 setUserInteractionEnabled:v10];
  if ((v10 & 1) == 0)
  {
    [v15 setAccessoryType:3];
    id v12 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v13 = [*(id *)(a1 + 40) tableCellCheckmarkImageDisabled];
    uint64_t v14 = (void *)[v12 initWithImage:v13];
    [v15 setAccessoryView:v14];
  }
  if (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1072), "containsIndex:", objc_msgSend(v5, "row"))) {
    [v15 setAccessoryType:3];
  }
}

void __69__FPUIAuthenticationVolumeMountViewController_setupTableViewSections__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained tableView];
  id v12 = [v6 cellForRowAtIndexPath:v4];

  uint64_t v7 = [v4 row];
  int v8 = [*(id *)(*(void *)(a1 + 32) + 1072) containsIndex:v7];
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 1072);
  if (v8)
  {
    [v9 removeIndex:v7];
    uint64_t v10 = 0;
  }
  else
  {
    [v9 addIndex:v7];
    uint64_t v10 = 3;
  }
  [v12 setAccessoryType:v10];
  id v11 = objc_loadWeakRetained(v3);
  [v11 selectedVolumesIndexesDidChange];
}

- (id)tableCellCheckmarkImageDisabled
{
  v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
  if (!tableCellCheckmarkImageDisabled_sTintedImage)
  {
    uint64_t v3 = [MEMORY[0x263F1C6B0] kitImageNamed:@"UIPreferencesBlueCheck.png"];
    id v4 = [MEMORY[0x263F1C550] colorWithRed:0.698039216 green:0.698039216 blue:0.698039216 alpha:1.0];
    uint64_t v5 = [v3 _flatImageWithColor:v4];
    uint64_t v6 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
    tableCellCheckmarkImageDisabled_sTintedImage = v5;

    v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
  }

  return v2;
}

- (void)selectedVolumesIndexesDidChange
{
  BOOL v3 = [(FPUIAuthenticationVolumeMountViewController *)self _canMoveToNextStep];

  [(FPUIAuthenticationTableViewController *)self setCanTransitionToNextStep:v3];
}

- (BOOL)_canMoveToNextStep
{
  return [(NSMutableIndexSet *)self->_selectedVolumesIndexes count] != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedVolumesIndexes, 0);
  objc_storeStrong((id *)&self->_mountedVolumeIdentifiers, 0);

  objc_storeStrong((id *)&self->_allVolumeRepresentations, 0);
}

@end