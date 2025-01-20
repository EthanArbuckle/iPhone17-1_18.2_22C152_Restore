@interface CPSPointsOfInterestEntityViewController
- (BOOL)shouldAppearInUnsafeArea;
- (CPSPointsOfInterestEntityViewController)initWithEntity:(id)a3 resourceProvider:(id)a4;
- (CPSPointsOfInterestMapViewController)mapViewController;
- (void)didUpdateEntity:(id)a3;
- (void)setupViewControllers;
- (void)viewDidLoad;
@end

@implementation CPSPointsOfInterestEntityViewController

- (CPSPointsOfInterestEntityViewController)initWithEntity:(id)a3 resourceProvider:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  v4 = v15;
  v15 = 0;
  v12.receiver = v4;
  v12.super_class = (Class)CPSPointsOfInterestEntityViewController;
  v11 = [(CPSBaseEntityContentViewController *)&v12 initWithEntity:location[0] resourceProvider:v13];
  v15 = v11;
  objc_storeStrong((id *)&v15, v11);
  if (v11)
  {
    v5 = [CPSPointsOfInterestMapViewController alloc];
    uint64_t v6 = [(CPSPointsOfInterestMapViewController *)v5 initWithEntity:location[0] resourceProvider:v13];
    mapViewController = v15->_mapViewController;
    v15->_mapViewController = (CPSPointsOfInterestMapViewController *)v6;
  }
  v9 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v9;
}

- (void)didUpdateEntity:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPointsOfInterestEntityViewController;
  [(CPSBaseEntityContentViewController *)&v3 didUpdateEntity:location[0]];
  [(CPSBaseEntityContentViewController *)v5->_mapViewController updateWithEntity:location[0]];
  objc_storeStrong(location, 0);
}

- (BOOL)shouldAppearInUnsafeArea
{
  return 1;
}

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointsOfInterestEntityViewController;
  [(CPSPointsOfInterestEntityViewController *)&v2 viewDidLoad];
  [(CPSPointsOfInterestEntityViewController *)v4 setupViewControllers];
}

- (void)setupViewControllers
{
  v46[1] = *MEMORY[0x263EF8340];
  v43 = self;
  v42[1] = (id)a2;
  id v34 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  id v33 = (id)[(CPSPointsOfInterestEntityViewController *)v43 view];
  [v33 setBackgroundColor:v34];

  v35 = [(CPSPointsOfInterestEntityViewController *)v43 mapViewController];
  v46[0] = v35;
  v42[0] = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];

  memset(__b, 0, sizeof(__b));
  id obj = v42[0];
  uint64_t v37 = [obj countByEnumeratingWithState:__b objects:v45 count:16];
  if (v37)
  {
    uint64_t v30 = *(void *)__b[2];
    uint64_t v31 = 0;
    unint64_t v32 = v37;
    while (1)
    {
      uint64_t v29 = v31;
      if (*(void *)__b[2] != v30) {
        objc_enumerationMutation(obj);
      }
      id v41 = *(id *)(__b[1] + 8 * v31);
      [v41 willMoveToParentViewController:v43];
      [(CPSPointsOfInterestEntityViewController *)v43 addChildViewController:v41];
      id v26 = (id)[v41 view];
      [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v28 = (id)[(CPSPointsOfInterestEntityViewController *)v43 view];
      id v27 = (id)[v41 view];
      objc_msgSend(v28, "addSubview:");

      [v41 didMoveToParentViewController:v43];
      ++v31;
      if (v29 + 1 >= v32)
      {
        uint64_t v31 = 0;
        unint64_t v32 = [obj countByEnumeratingWithState:__b objects:v45 count:16];
        if (!v32) {
          break;
        }
      }
    }
  }

  id v39 = (id)objc_opt_new();
  v25 = [(CPSPointsOfInterestEntityViewController *)v43 mapViewController];
  id v24 = (id)[(CPSPointsOfInterestMapViewController *)v25 view];
  id v23 = (id)[v24 topAnchor];
  id v22 = (id)[(CPSPointsOfInterestEntityViewController *)v43 view];
  id v21 = (id)[v22 topAnchor];
  id v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
  v44[0] = v20;
  v19 = [(CPSPointsOfInterestEntityViewController *)v43 mapViewController];
  id v18 = (id)[(CPSPointsOfInterestMapViewController *)v19 view];
  id v17 = (id)[v18 bottomAnchor];
  id v16 = (id)[(CPSPointsOfInterestEntityViewController *)v43 view];
  id v15 = (id)[v16 bottomAnchor];
  id v14 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  v44[1] = v14;
  id v13 = [(CPSPointsOfInterestEntityViewController *)v43 mapViewController];
  id v12 = (id)[(CPSPointsOfInterestMapViewController *)v13 view];
  id v11 = (id)[v12 leadingAnchor];
  id v10 = (id)[(CPSPointsOfInterestEntityViewController *)v43 view];
  id v9 = (id)[v10 leadingAnchor];
  id v8 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
  v44[2] = v8;
  v7 = [(CPSPointsOfInterestEntityViewController *)v43 mapViewController];
  id v6 = (id)[(CPSPointsOfInterestMapViewController *)v7 view];
  id v5 = (id)[v6 trailingAnchor];
  id v4 = (id)[(CPSPointsOfInterestEntityViewController *)v43 view];
  id v3 = (id)[v4 trailingAnchor];
  id v2 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");
  v44[3] = v2;
  id v38 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];

  [v39 addObjectsFromArray:v38];
  [MEMORY[0x263F08938] activateConstraints:v39];
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(v42, 0);
}

- (CPSPointsOfInterestMapViewController)mapViewController
{
  return self->_mapViewController;
}

- (void).cxx_destruct
{
}

@end