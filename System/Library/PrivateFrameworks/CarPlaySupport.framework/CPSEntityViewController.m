@interface CPSEntityViewController
- (BOOL)entityContentViewController:(id)a3 didPressButton:(id)a4 forEntity:(id)a5;
- (BOOL)entityContentViewController:(id)a3 didPressButton:(id)a4 forPOI:(id)a5;
- (BOOL)entityContentViewController:(id)a3 didSelectPointOfInterestWithIdentifier:(id)a4;
- (BOOL)entityContentViewController:(id)a3 regionDidChange:(id *)a4;
- (CPEntity)entity;
- (CPSBaseEntityContentViewController)contentViewController;
- (CPSEntityResourceProvider)resourceProvider;
- (CPSEntityViewController)initWithEntityTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5;
- (NSMapTable)buttonMap;
- (id)entityTemplate;
- (id)entityTemplateDelegate;
- (void)_viewDidLoad;
- (void)setButtonMap:(id)a3;
- (void)setResourceProvider:(id)a3;
- (void)setupViewControllers;
- (void)trailingBarButtonPressed:(id)a3;
- (void)updateEntityTemplate:(id)a3 withProxyDelegate:(id)a4;
@end

@implementation CPSEntityViewController

- (CPSEntityViewController)initWithEntityTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  v5 = v28;
  v28 = 0;
  v24.receiver = v5;
  v24.super_class = (Class)CPSEntityViewController;
  v23 = [(CPSBaseTemplateViewController *)&v24 initWithTemplate:location[0] templateDelegate:v26 templateEnvironment:v25];
  v28 = v23;
  objc_storeStrong((id *)&v28, v23);
  if (v23)
  {
    v6 = (CPEntity *)(id)[location[0] entity];
    entity = v28->_entity;
    v28->_entity = v6;

    v8 = (NSMapTable *)(id)objc_msgSend(MEMORY[0x263F08968], "mapTableWithKeyOptions:valueOptions:", 517);
    buttonMap = v28->_buttonMap;
    v28->_buttonMap = v8;

    v10 = [CPSEntityResourceProvider alloc];
    uint64_t v11 = [(CPSEntityResourceProvider *)v10 initWithTemplateEnvironment:v25 entityTemplate:location[0] templateDelegate:v26 actionDelegate:v28];
    resourceProvider = v28->_resourceProvider;
    v28->_resourceProvider = (CPSEntityResourceProvider *)v11;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [CPSContactEntityViewController alloc];
      uint64_t v14 = [(CPSContactEntityViewController *)v13 initWithEntity:v28->_entity resourceProvider:v28->_resourceProvider];
      contentViewController = v28->_contentViewController;
      v28->_contentViewController = (CPSBaseEntityContentViewController *)v14;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [CPSPointsOfInterestEntityViewController alloc];
        uint64_t v17 = [(CPSPointsOfInterestEntityViewController *)v16 initWithEntity:v28->_entity resourceProvider:v28->_resourceProvider];
        v18 = v28->_contentViewController;
        v28->_contentViewController = (CPSBaseEntityContentViewController *)v17;
      }
    }
  }
  v20 = v28;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v28, 0);
  return v20;
}

- (id)entityTemplate
{
  v3 = objc_opt_class();
  v4 = [(CPSBaseTemplateViewController *)self associatedTemplate];
  id v5 = CPSSafeCast_16(v3, v4);

  return v5;
}

- (id)entityTemplateDelegate
{
  v3 = [(CPSBaseTemplateViewController *)self templateDelegate];
  id v4 = CPSSafeProtocolCast_2(&unk_26DF78650, v3);

  return v4;
}

- (void)_viewDidLoad
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSEntityViewController;
  [(CPSBaseTemplateViewController *)&v2 _viewDidLoad];
  [(CPSEntityViewController *)v4 setupViewControllers];
}

- (void)setupViewControllers
{
  v73[4] = *MEMORY[0x263EF8340];
  v71 = self;
  SEL v70 = a2;
  id v59 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  id v58 = (id)[(CPSEntityViewController *)v71 view];
  [v58 setBackgroundColor:v59];

  v61 = [(CPSEntityViewController *)v71 contentViewController];
  id v60 = (id)[(CPSBaseEntityContentViewController *)v61 view];
  [v60 setTranslatesAutoresizingMaskIntoConstraints:0];

  v62 = [(CPSEntityViewController *)v71 contentViewController];
  [(CPSBaseEntityContentViewController *)v62 willMoveToParentViewController:v71];

  v63 = [(CPSEntityViewController *)v71 contentViewController];
  -[CPSEntityViewController addChildViewController:](v71, "addChildViewController:");

  id v66 = (id)[(CPSEntityViewController *)v71 view];
  v65 = [(CPSEntityViewController *)v71 contentViewController];
  id v64 = (id)[(CPSBaseEntityContentViewController *)v65 view];
  objc_msgSend(v66, "addSubview:");

  v67 = [(CPSEntityViewController *)v71 contentViewController];
  [(CPSBaseEntityContentViewController *)v67 didMoveToParentViewController:v71];

  *(_DWORD *)&v69[8] = 0;
  v68 = [(CPSEntityViewController *)v71 contentViewController];
  *(void *)v69 = [(CPSBaseEntityContentViewController *)v68 shouldAppearInUnsafeArea];

  if (v69[0])
  {
    v57 = [(CPSEntityViewController *)v71 contentViewController];
    id v56 = (id)[(CPSBaseEntityContentViewController *)v57 view];
    id v55 = (id)[v56 topAnchor];
    id v54 = (id)[(CPSEntityViewController *)v71 view];
    id v53 = (id)[v54 topAnchor];
    id v52 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
    v73[0] = v52;
    v51 = [(CPSEntityViewController *)v71 contentViewController];
    id v50 = (id)[(CPSBaseEntityContentViewController *)v51 view];
    id v49 = (id)[v50 bottomAnchor];
    id v48 = (id)[(CPSEntityViewController *)v71 view];
    id v47 = (id)[v48 bottomAnchor];
    id v46 = (id)objc_msgSend(v49, "constraintEqualToAnchor:");
    v73[1] = v46;
    v45 = [(CPSEntityViewController *)v71 contentViewController];
    id v44 = (id)[(CPSBaseEntityContentViewController *)v45 view];
    id v43 = (id)[v44 leftAnchor];
    id v42 = (id)[(CPSEntityViewController *)v71 view];
    id v41 = (id)[v42 leftAnchor];
    id v40 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
    v73[2] = v40;
    v39 = [(CPSEntityViewController *)v71 contentViewController];
    id v38 = (id)[(CPSBaseEntityContentViewController *)v39 view];
    id v37 = (id)[v38 rightAnchor];
    id v36 = (id)[(CPSEntityViewController *)v71 view];
    id v35 = (id)[v36 rightAnchor];
    id v34 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
    v73[3] = v34;
    id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:4];
    SEL v3 = *(void **)&v69[4];
    *(void *)&v69[4] = v2;
  }
  else
  {
    v33 = [(CPSEntityViewController *)v71 contentViewController];
    id v32 = (id)[(CPSBaseEntityContentViewController *)v33 view];
    id v31 = (id)[v32 topAnchor];
    id v30 = (id)[(CPSEntityViewController *)v71 view];
    id v29 = (id)[v30 safeAreaLayoutGuide];
    id v28 = (id)[v29 topAnchor];
    id v27 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
    v72[0] = v27;
    id v26 = [(CPSEntityViewController *)v71 contentViewController];
    id v25 = (id)[(CPSBaseEntityContentViewController *)v26 view];
    id v24 = (id)[v25 bottomAnchor];
    id v23 = (id)[(CPSEntityViewController *)v71 view];
    id v22 = (id)[v23 safeAreaLayoutGuide];
    id v21 = (id)[v22 bottomAnchor];
    id v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v72[1] = v20;
    v19 = [(CPSEntityViewController *)v71 contentViewController];
    id v18 = (id)[(CPSBaseEntityContentViewController *)v19 view];
    id v17 = (id)[v18 leftAnchor];
    id v16 = (id)[(CPSEntityViewController *)v71 view];
    id v15 = (id)[v16 safeAreaLayoutGuide];
    id v14 = (id)[v15 leftAnchor];
    id v13 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v72[2] = v13;
    v12 = [(CPSEntityViewController *)v71 contentViewController];
    id v11 = (id)[(CPSBaseEntityContentViewController *)v12 view];
    id v10 = (id)[v11 rightAnchor];
    id v9 = (id)[(CPSEntityViewController *)v71 view];
    id v8 = (id)[v9 safeAreaLayoutGuide];
    id v7 = (id)[v8 rightAnchor];
    id v6 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
    v72[3] = v6;
    id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:4];
    id v5 = *(void **)&v69[4];
    *(void *)&v69[4] = v4;
  }
  [MEMORY[0x263F08938] activateConstraints:*(void *)&v69[4]];
  objc_storeStrong((id *)&v69[4], 0);
}

- (void)trailingBarButtonPressed:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [(CPSEntityViewController *)v11 buttonMap];
  id v9 = [(NSMapTable *)v6 objectForKey:location[0]];

  id v8 = (id)[v9 identifier];
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v12, (uint64_t)v11, (uint64_t)v8);
    _os_log_debug_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEBUG, "%@: entity button selected with UUID: %@", v12, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v4 = [(CPSBaseTemplateViewController *)v11 templateDelegate];
  char v5 = [(CPTemplateDelegate *)v4 conformsToProtocol:&unk_26DF72840];

  if (v5)
  {
    SEL v3 = [(CPSBaseTemplateViewController *)v11 templateDelegate];
    [(CPTemplateDelegate *)v3 handleActionForControlIdentifier:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)entityContentViewController:(id)a3 didPressButton:(id)a4 forEntity:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  id v28 = 0;
  objc_storeStrong(&v28, a5);
  id v27 = (id)[v29 identifier];
  id v26 = CarPlaySupportGeneralLogging();
  os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v33, (uint64_t)v31, (uint64_t)v27);
    _os_log_debug_impl(&dword_22B689000, (os_log_t)v26, v25, "%@: entity button selected with UUID: %@", v33, 0x16u);
  }
  objc_storeStrong(&v26, 0);
  objc_opt_class();
  char v23 = 0;
  char v21 = 0;
  char isKindOfClass = 0;
  if (objc_opt_isKindOfClass())
  {
    id v24 = (id)[v29 entityButton];
    char v23 = 1;
    objc_opt_class();
    char isKindOfClass = 0;
    if (objc_opt_isKindOfClass())
    {
      id v22 = [(CPSEntityViewController *)v31 entity];
      char v21 = 1;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  if (v21) {

  }
  if (v23) {
  if (isKindOfClass)
  }
  {
    id v20 = (id)[v29 entityButton];
    v19 = [(CPSEntityViewController *)v31 entity];
    id v9 = (void *)MEMORY[0x263F6C760];
    uint64_t v13 = [(CPSBaseTemplateViewController *)v31 templateEnvironment];
    v12 = [(CPSTemplateEnvironment *)v13 bundleIdentifier];
    id v11 = (id)[(CPEntity *)v19 name];
    id v10 = (id)[v20 phoneOrEmail];
    id v18 = (id)objc_msgSend(v9, "messageComposeNewThreadDirectActionWithAppBundleId:fullName:phoneOrEmailAddress:", v12, v11);

    id v14 = [(CPSBaseTemplateViewController *)v31 viewControllerDelegate];
    [(CPSTemplateViewControllerDelegate *)v14 templateViewController:v31 shouldActivateSiriWithDirectActionContext:v18];

    char v32 = 1;
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v19, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    id v7 = [(CPSBaseTemplateViewController *)v31 templateDelegate];
    char v8 = [(CPTemplateDelegate *)v7 conformsToProtocol:&unk_26DF72840];

    if (v8)
    {
      id v6 = [(CPSBaseTemplateViewController *)v31 templateDelegate];
      [(CPTemplateDelegate *)v6 handleActionForControlIdentifier:v27];
    }
    char v32 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v32 & 1;
}

- (BOOL)entityContentViewController:(id)a3 regionDidChange:(id *)a4
{
  double v14 = v4;
  double v15 = v5;
  double v16 = v6;
  double v17 = v7;
  uint64_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = [(CPSEntityViewController *)v13 entityTemplateDelegate];
  char v11 = [v10 conformsToProtocol:&unk_26DF78650];

  if (v11)
  {
    id v9 = [(CPSEntityViewController *)v13 entityTemplateDelegate];
    objc_msgSend(v9, "handleMapRegionDidChange:", v14, v15, v16, v17);
  }
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)entityContentViewController:(id)a3 didSelectPointOfInterestWithIdentifier:(id)a4
{
  char v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v7 = [(CPSEntityViewController *)v11 entityTemplateDelegate];
  char v8 = [v7 conformsToProtocol:&unk_26DF78650];

  if (v8)
  {
    id v5 = [(CPSEntityViewController *)v11 entityTemplateDelegate];
    [v5 handleDidSelectPointOfInterestWithIdentifier:v9];
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)entityContentViewController:(id)a3 didPressButton:(id)a4 forPOI:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  id v12 = (id)[v14 identifier];
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v17, (uint64_t)v16, (uint64_t)v12);
    _os_log_debug_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEBUG, "%@: POI button selected with UUID: %@", v17, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v7 = [(CPSBaseTemplateViewController *)v16 templateDelegate];
  char v8 = [(CPTemplateDelegate *)v7 conformsToProtocol:&unk_26DF72840];

  if (v8)
  {
    double v6 = [(CPSBaseTemplateViewController *)v16 templateDelegate];
    [(CPTemplateDelegate *)v6 handleActionForControlIdentifier:v12];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)updateEntityTemplate:(id)a3 withProxyDelegate:(id)a4
{
  double v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __66__CPSEntityViewController_updateEntityTemplate_withProxyDelegate___block_invoke;
  id v10 = &unk_2648A4AD0;
  char v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __66__CPSEntityViewController_updateEntityTemplate_withProxyDelegate___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) resourceProvider];
  [v1 updateEntityTemplate:*(void *)(a1 + 40) withProxyDelegate:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) setAssociatedTemplate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setTemplateDelegate:*(void *)(a1 + 48)];
  id v4 = (id)[*(id *)(a1 + 32) contentViewController];
  id v3 = (id)[*(id *)(a1 + 40) entity];
  objc_msgSend(v4, "updateWithEntity:");
}

- (CPEntity)entity
{
  return self->_entity;
}

- (CPSBaseEntityContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (NSMapTable)buttonMap
{
  return self->_buttonMap;
}

- (void)setButtonMap:(id)a3
{
}

- (CPSEntityResourceProvider)resourceProvider
{
  return self->_resourceProvider;
}

- (void)setResourceProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end