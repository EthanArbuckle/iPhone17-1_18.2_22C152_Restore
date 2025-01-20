@interface AAUIInheritanceShareAccessKeyOptionsViewController
- (AAUIInheritanceSetupFlowDelegate)flowDelegate;
- (AAUIInheritanceShareAccessKeyOptionsViewController)initWithBeneficiaryName:(id)a3 handle:(id)a4;
- (id)_configurationForShareType:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setupTableView;
- (void)setFlowDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation AAUIInheritanceShareAccessKeyOptionsViewController

- (AAUIInheritanceShareAccessKeyOptionsViewController)initWithBeneficiaryName:(id)a3 handle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[AAUIOBInheritanceShareAccessKeyOptionsViewModel alloc] initWithBeneficiaryName:v7 handle:v6];

  viewModel = self->_viewModel;
  self->_viewModel = v8;

  v10 = [(AAOBInheritanceShareAccessKeyOptionsModel *)self->_viewModel defaultSharingOptions];
  options = self->_options;
  self->_options = v10;

  v12 = self->_viewModel;
  v14.receiver = self;
  v14.super_class = (Class)AAUIInheritanceShareAccessKeyOptionsViewController;
  return [(AAUIOBTableWelcomeController *)&v14 initWithViewModel:v12];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIInheritanceShareAccessKeyOptionsViewController;
  [(AAUIOBTableWelcomeController *)&v7 viewDidLoad];
  [(AAUIInheritanceShareAccessKeyOptionsViewController *)self _setupTableView];
  objc_initWeak(&location, self);
  viewModel = self->_viewModel;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__AAUIInheritanceShareAccessKeyOptionsViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_263F93B98;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  [(AAOBInheritanceShareAccessKeyOptionsModel *)viewModel availableSharingOptionsWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __65__AAUIInheritanceShareAccessKeyOptionsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 1280);
  *(void *)(v4 + 1280) = v3;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__AAUIInheritanceShareAccessKeyOptionsViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_263F92AB8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v7);
}

void __65__AAUIInheritanceShareAccessKeyOptionsViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained tableView];
  [v1 reloadData];
}

- (void)_setupTableView
{
  uint64_t v3 = [(OBTableWelcomeController *)self tableView];
  [v3 setDelegate:self];

  id v4 = [(OBTableWelcomeController *)self tableView];
  [v4 setDataSource:self];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_options count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"InheritanceShareOptionCell"];
  if (!v7) {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"InheritanceShareOptionCell"];
  }
  v8 = -[NSArray objectAtIndex:](self->_options, "objectAtIndex:", [v6 section]);
  uint64_t v9 = (int)[v8 intValue];

  v10 = [(AAUIInheritanceShareAccessKeyOptionsViewController *)self _configurationForShareType:v9];
  [v7 setContentConfiguration:v10];
  [v7 setAccessoryType:1];
  v11 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [v7 setBackgroundColor:v11];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:");
  id v6 = [(AAUIInheritanceShareAccessKeyOptionsViewController *)self flowDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(AAUIInheritanceShareAccessKeyOptionsViewController *)self flowDelegate];
    uint64_t v9 = -[NSArray objectAtIndex:](self->_options, "objectAtIndex:", [v10 section]);
    objc_msgSend(v8, "inheritanceDidSelectSharingOption:", objc_msgSend(v9, "integerValue"));
  }
}

- (id)_configurationForShareType:(unint64_t)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F82918] cellConfiguration];
  uint64_t v6 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835F0] weight:*MEMORY[0x263F81800]];
  id v7 = objc_alloc(MEMORY[0x263F086A0]);
  v8 = [(AAOBInheritanceShareAccessKeyOptionsModel *)self->_viewModel titleForShareAccessKeyType:a3];
  uint64_t v26 = *MEMORY[0x263F814F0];
  uint64_t v9 = v26;
  v27[0] = v6;
  v23 = (void *)v6;
  id v10 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v11 = (void *)[v7 initWithString:v8 attributes:v10];

  [v5 setAttributedText:v11];
  v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  id v13 = objc_alloc(MEMORY[0x263F086A0]);
  objc_super v14 = [(AAOBInheritanceShareAccessKeyOptionsModel *)self->_viewModel detailTextForShareAccessKeyType:a3];
  v24[0] = *MEMORY[0x263F81500];
  v15 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v24[1] = v9;
  v25[0] = v15;
  v25[1] = v12;
  v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  v17 = (void *)[v13 initWithString:v14 attributes:v16];

  [v5 setSecondaryAttributedText:v17];
  if (a3 == 1)
  {
    v20 = [MEMORY[0x263F827E8] systemImageNamed:@"printer.fill.and.paper.fill"];
    [v5 setImage:v20];
    v18 = v23;
  }
  else
  {
    v18 = v23;
    if (a3) {
      goto LABEL_6;
    }
    v19 = (void *)MEMORY[0x263F827E8];
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v19 imageNamed:@"beneficiary_message" inBundle:v20];
    [v5 setImage:v21];
  }
LABEL_6:

  return v5;
}

- (AAUIInheritanceSetupFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  return (AAUIInheritanceSetupFlowDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end