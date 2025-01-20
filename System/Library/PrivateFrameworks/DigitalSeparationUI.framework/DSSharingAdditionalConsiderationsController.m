@interface DSSharingAdditionalConsiderationsController
- (DSNavigationDelegate)delegate;
- (DSSharingAdditionalConsiderationsController)init;
- (void)back;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation DSSharingAdditionalConsiderationsController

- (DSSharingAdditionalConsiderationsController)init
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F82818];
  v3 = [MEMORY[0x263F825C8] systemBlueColor];
  v26 = [v2 configurationWithHierarchicalColor:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F3A380]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v6 = [v4 sources];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)MEMORY[0x263F3A378];
        v12 = [*(id *)(*((void *)&v28 + 1) + 8 * v10) name];
        v13 = [v11 sourceDescriptorForSource:v12];
        v14 = [v13 localizedAppName];

        [v5 addObject:v14];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  v15 = (void *)MEMORY[0x263F08950];
  v16 = [v5 allObjects];
  v17 = [v15 localizedStringByJoiningStrings:v16];

  v18 = NSString;
  v19 = DSUILocStringForKey(@"ADDITIONAL_CONSIDERATIONS_DETAIL");
  v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v17);

  v21 = DSUILocStringForKey(@"ADDITIONAL_CONSIDERATIONS");
  v22 = [MEMORY[0x263F827E8] systemImageNamed:@"checklist" withConfiguration:v26];
  v27.receiver = self;
  v27.super_class = (Class)DSSharingAdditionalConsiderationsController;
  v23 = [(DSSharingAdditionalConsiderationsController *)&v27 initWithTitle:v21 detailText:v20 icon:v22];

  return v23;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)DSSharingAdditionalConsiderationsController;
  [(DSOBWelcomeController *)&v8 viewDidLoad];
  v3 = DSUILocStringForKey(@"CONTINUE");
  id v4 = [(DSSharingAdditionalConsiderationsController *)self delegate];
  id v5 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:v4 selector:sel_pushNextPane];

  v6 = DSUILocStringForKey(@"REVIEW_MORE_PEOPLE");
  id v7 = +[DSUIUtilities setUpLinkButtonForController:self title:v6 target:self selector:sel_back];
}

- (void)back
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v2 = [(DSSharingAdditionalConsiderationsController *)self navigationController];
  v3 = [v2 viewControllers];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = objc_opt_class();
        v12 = objc_msgSend(v9, "arrayWithObjects:", v10, v11, objc_opt_class(), 0);
        if (([v12 containsObject:objc_opt_class()] & 1) == 0) {
          [v17 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  v13 = [(DSSharingAdditionalConsiderationsController *)self navigationController];
  [v13 setViewControllers:v17];

  v14 = [(DSSharingAdditionalConsiderationsController *)self navigationController];
  id v15 = (id)[v14 popViewControllerAnimated:1];
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end