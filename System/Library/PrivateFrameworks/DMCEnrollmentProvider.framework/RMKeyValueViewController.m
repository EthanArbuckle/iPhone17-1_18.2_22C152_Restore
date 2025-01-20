@interface RMKeyValueViewController
- (RMUIKeyValueViewModel)viewModel;
- (id)_keyValueDetailValue:(id)a3;
- (id)_specifiersForKeyValues;
- (id)specifiers;
- (void)_processUserInfoDictionary;
- (void)setViewModel:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RMKeyValueViewController

- (void)viewDidLoad
{
  [(RMKeyValueViewController *)self _processUserInfoDictionary];
  v5.receiver = self;
  v5.super_class = (Class)RMKeyValueViewController;
  [(RMKeyValueViewController *)&v5 viewDidLoad];
  v3 = [(RMKeyValueViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0];

  v4 = [(RMKeyValueViewController *)self navigationItem];
  [v4 setRightBarButtonItem:0];
}

- (void)_processUserInfoDictionary
{
  id v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  v3 = [v4 objectForKeyedSubscript:@"RMConfigurationViewModelKey"];
  [(RMKeyValueViewController *)self setViewModel:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RMKeyValueViewController;
  [(RMKeyValueViewController *)&v4 viewWillAppear:a3];
  if (([(RMKeyValueViewController *)self isMovingToParentViewController] & 1) == 0) {
    [(RMKeyValueViewController *)self reloadSpecifiers];
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = [(RMKeyValueViewController *)self _specifiersForKeyValues];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_specifiersForKeyValues
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  objc_super v4 = [(RMKeyValueViewController *)self viewModel];
  objc_super v5 = [v4 detailViewModels];
  v6 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = [(RMKeyValueViewController *)self viewModel];
  v8 = [v7 detailViewModels];

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x263F5FC40];
        v15 = [v13 title];
        v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:sel__keyValueDetailValue_ detail:0 cell:4 edit:0];

        [v16 setUserInfo:v13];
        [v6 addObject:v16];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v6;
}

- (id)_keyValueDetailValue:(id)a3
{
  id v3 = [a3 userInfo];
  objc_super v4 = [v3 value];

  return v4;
}

- (RMUIKeyValueViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end