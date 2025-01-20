@interface CPSGridTemplateViewController
- (BOOL)_wantsNowPlayingButton;
- (CPGridTemplate)gridTemplate;
- (CPSGridTemplateCollectionView)gridView;
- (CPSGridTemplateViewController)initWithGridTemplate:(id)a3 interfaceDelegate:(id)a4 templateEnvironment:(id)a5;
- (id)_buttonForIdentifier:(id)a3;
- (id)_prepareCPSGridButtonsForButtons:(id)a3;
- (void)_viewDidLoad;
- (void)didSelectButton:(id)a3;
- (void)reloadTemplate:(id)a3;
- (void)setControl:(id)a3 enabled:(BOOL)a4;
- (void)setGridView:(id)a3;
@end

@implementation CPSGridTemplateViewController

- (CPSGridTemplateViewController)initWithGridTemplate:(id)a3 interfaceDelegate:(id)a4 templateEnvironment:(id)a5
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  v5 = v17;
  v17 = 0;
  v13.receiver = v5;
  v13.super_class = (Class)CPSGridTemplateViewController;
  v12 = [(CPSBaseTemplateViewController *)&v13 initWithTemplate:location[0] templateDelegate:v15 templateEnvironment:v14];
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    v9 = [(CPSGridTemplateViewController *)v17 gridTemplate];
    v8 = [(CPGridTemplate *)v9 title];
    -[CPSGridTemplateViewController setTitle:](v17, "setTitle:");
  }
  v7 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v7;
}

- (CPGridTemplate)gridTemplate
{
  v3 = objc_opt_class();
  v4 = [(CPSBaseTemplateViewController *)self associatedTemplate];
  id v5 = CPSSafeCast_13(v3, v4);

  return (CPGridTemplate *)v5;
}

- (BOOL)_wantsNowPlayingButton
{
  return 1;
}

- (void)_viewDidLoad
{
  v35[4] = *MEMORY[0x263EF8340];
  v34 = self;
  SEL v33 = a2;
  v32.receiver = self;
  v32.super_class = (Class)CPSGridTemplateViewController;
  [(CPSBaseTemplateViewController *)&v32 _viewDidLoad];
  id v31 = (id)[(CPSGridTemplateViewController *)v34 view];
  id v7 = (id)[(CPSGridTemplateViewController *)v34 view];
  id v6 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  objc_msgSend(v7, "setBackgroundColor:");

  v8 = v34;
  v10 = [(CPSGridTemplateViewController *)v34 gridTemplate];
  v9 = [(CPGridTemplate *)v10 gridButtons];
  id v30 = -[CPSGridTemplateViewController _prepareCPSGridButtonsForButtons:](v8, "_prepareCPSGridButtonsForButtons:");

  v11 = [CPSGridTemplateCollectionView alloc];
  [v31 frame];
  v28[1] = v2;
  v28[2] = v3;
  v28[3] = v4;
  v28[4] = v5;
  v29 = -[CPSGridTemplateCollectionView initWithFrame:gridButtons:](v11, "initWithFrame:gridButtons:", v30, *(double *)&v2, *(double *)&v3, *(double *)&v4, *(double *)&v5);
  [(CPSGridTemplateCollectionView *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v31 addSubview:v29];
  [(CPSGridTemplateViewController *)v34 setGridView:v29];
  id v27 = (id)[v31 safeAreaLayoutGuide];
  id v26 = (id)[v27 topAnchor];
  id v25 = (id)[(CPSGridTemplateCollectionView *)v29 topAnchor];
  id v24 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
  v35[0] = v24;
  id v23 = (id)[v31 safeAreaLayoutGuide];
  id v22 = (id)[v23 bottomAnchor];
  id v21 = (id)[(CPSGridTemplateCollectionView *)v29 bottomAnchor];
  id v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
  v35[1] = v20;
  id v19 = (id)[v31 safeAreaLayoutGuide];
  id v18 = (id)[v19 leadingAnchor];
  id v17 = (id)[(CPSGridTemplateCollectionView *)v29 leadingAnchor];
  id v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
  v35[2] = v16;
  id v15 = (id)[v31 safeAreaLayoutGuide];
  id v14 = (id)[v15 trailingAnchor];
  id v13 = (id)[(CPSGridTemplateCollectionView *)v29 trailingAnchor];
  id v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
  v35[3] = v12;
  v28[0] = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];

  [MEMORY[0x263F08938] activateConstraints:v28[0]];
  objc_storeStrong(v28, 0);
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
}

- (id)_buttonForIdentifier:(id)a3
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v13 = 0;
  id v14 = &v13;
  int v15 = 838860800;
  int v16 = 48;
  id v17 = __Block_byref_object_copy__2;
  id v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  id v6 = [(CPSGridTemplateViewController *)v21 gridView];
  id v5 = [(CPSGridTemplateCollectionView *)v6 gridButtons];
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  v10 = __54__CPSGridTemplateViewController__buttonForIdentifier___block_invoke;
  v11 = &unk_2648A4E48;
  v12[0] = location[0];
  v12[1] = &v13;
  [(NSArray *)v5 enumerateObjectsUsingBlock:&v7];

  id v4 = (id)v14[5];
  objc_storeStrong(v12, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);

  return v4;
}

void __54__CPSGridTemplateViewController__buttonForIdentifier___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = (id)[location[0] identifier];
  char v7 = [v6 isEqual:a1[4]];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), location[0]);
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_prepareCPSGridButtonsForButtons:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = (id)objc_opt_new();
  id v5 = [(CPSGridTemplateViewController *)v11 gridTemplate];
  id v4 = [(CPGridTemplate *)v5 gridButtons];
  char v7 = v11;
  id v8 = v9;
  -[NSArray enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:");

  id v6 = v9;
  objc_storeStrong(&v8, 0);
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v6;
}

void __66__CPSGridTemplateViewController__prepareCPSGridButtonsForButtons___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[3] = a3;
  v9[2] = a4;
  v9[1] = a1;
  if ((unint64_t)a3 < *MEMORY[0x263EFC988])
  {
    id v4 = location[0];
    id v5 = (id)[a1[4] templateDelegate];
    v9[0] = +[CPSGridButton buttonWithGridButton:templateDelegate:](CPSGridButton, "buttonWithGridButton:templateDelegate:", v4);

    [v9[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9[0] setDelegate:a1[4]];
    [a1[5] addObject:v9[0]];
    objc_storeStrong(v9, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setControl:(id)a3 enabled:(BOOL)a4
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v15 = a4;
  v14.receiver = v17;
  v14.super_class = (Class)CPSGridTemplateViewController;
  [(CPSBaseTemplateViewController *)&v14 setControl:location[0] enabled:a4];
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __52__CPSGridTemplateViewController_setControl_enabled___block_invoke;
  v10 = &unk_2648A4828;
  v11 = v17;
  id v12 = location[0];
  BOOL v13 = v15;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSGridTemplateViewController_setControl_enabled___block_invoke(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)[*(id *)(a1 + 32) _buttonForIdentifier:*(void *)(a1 + 40)];
  [v2[0] setEnabled:*(unsigned char *)(a1 + 48) & 1];
  objc_storeStrong(v2, 0);
}

- (void)reloadTemplate:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __48__CPSGridTemplateViewController_reloadTemplate___block_invoke;
  int v8 = &unk_2648A3990;
  id v9 = location[0];
  v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __48__CPSGridTemplateViewController_reloadTemplate___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v9, *(void *)(a1 + 32));
    _os_log_impl(&dword_22B689000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "Received update for grid template %@", v9, 0xCu);
  }
  objc_storeStrong(location, 0);
  [*(id *)(a1 + 40) _updateTemplate:*(void *)(a1 + 32)];
  id v1 = (id)[*(id *)(a1 + 32) title];
  objc_msgSend(*(id *)(a1 + 40), "setTitle:");

  v2 = *(void **)(a1 + 40);
  id v6 = (id)[v2 gridTemplate];
  id v5 = (id)[v6 gridButtons];
  id v4 = (id)objc_msgSend(v2, "_prepareCPSGridButtonsForButtons:");
  id v3 = (id)[*(id *)(a1 + 40) gridView];
  [v3 setGridButtons:v4];
}

- (void)didSelectButton:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[location[0] identifier];
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)v9, (uint64_t)v7);
    _os_log_debug_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEBUG, "%@: button selected with UUID: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v4 = [(CPSBaseTemplateViewController *)v9 templateDelegate];
  char v5 = [(CPTemplateDelegate *)v4 conformsToProtocol:&unk_26DF72840];

  if (v5)
  {
    id v3 = [(CPSBaseTemplateViewController *)v9 templateDelegate];
    [(CPTemplateDelegate *)v3 handleActionForControlIdentifier:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (CPSGridTemplateCollectionView)gridView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);

  return (CPSGridTemplateCollectionView *)WeakRetained;
}

- (void)setGridView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end