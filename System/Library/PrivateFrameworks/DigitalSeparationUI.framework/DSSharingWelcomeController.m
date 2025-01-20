@interface DSSharingWelcomeController
- (DSNavigationDelegate)delegate;
- (DSPlatterTableView)cell;
- (DSSharingWelcomeController)init;
- (void)_presentDTOCell;
- (void)setCell:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DSSharingWelcomeController

- (DSSharingWelcomeController)init
{
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] systemBlueColor];
  v5 = [v3 configurationWithHierarchicalColor:v4];

  v6 = DSUILocStringForKey(@"SHARING_ACTIVITY");
  v7 = DSUILocStringForKey(@"SHARING_WELCOME_DETAIL");
  v8 = [MEMORY[0x263F827E8] systemImageNamed:@"person.2.badge.gearshape.fill" withConfiguration:v5];
  v11.receiver = self;
  v11.super_class = (Class)DSSharingWelcomeController;
  v9 = [(DSSharingWelcomeController *)&v11 initWithTitle:v6 detailText:v7 icon:v8];

  return v9;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)DSSharingWelcomeController;
  [(DSOBWelcomeController *)&v15 viewDidLoad];
  v3 = DSUILocStringForKey(@"CONTINUE");
  v4 = [(DSSharingWelcomeController *)self delegate];
  id v5 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:v4 selector:sel_pushNextPane];

  v6 = DSUILocStringForKey(@"PEOPLE_AND_INFORMATION");
  v7 = DSUILocStringForKey(@"SHARING_PERMISSIONS_DETAIL");
  v8 = [MEMORY[0x263F827E8] systemImageNamed:@"1.circle.fill"];
  [(DSSharingWelcomeController *)self addBulletedListItemWithTitle:v6 description:v7 image:v8];

  v9 = DSUILocStringForKey(@"PRIVACY_PERMISSIONS");
  v10 = DSUILocStringForKey(@"PRIVACY_PERMISSIONS_DETAIL");
  objc_super v11 = [MEMORY[0x263F827E8] systemImageNamed:@"2.circle.fill"];
  [(DSSharingWelcomeController *)self addBulletedListItemWithTitle:v9 description:v10 image:v11];

  v12 = DSUILocStringForKey(@"SECURE_PHYSICAL_ACCESS");
  v13 = DSUILocStringForKey(@"SECURE_PHYSICAL_ACCESS_DETAIL");
  v14 = [MEMORY[0x263F827E8] systemImageNamed:@"3.circle.fill"];
  [(DSSharingWelcomeController *)self addBulletedListItemWithTitle:v12 description:v13 image:v14];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)DSSharingWelcomeController;
  [(DSSharingWelcomeController *)&v5 viewWillLayoutSubviews];
  if ([MEMORY[0x263F3A390] shouldShowBioRatchetFlow])
  {
    v3 = [MEMORY[0x263F10488] sharedInstance];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __52__DSSharingWelcomeController_viewWillLayoutSubviews__block_invoke;
    v4[3] = &unk_264C6E870;
    v4[4] = self;
    [v3 stateWithCompletion:v4];
  }
}

void __52__DSSharingWelcomeController_viewWillLayoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 && (![v5 rawValue] || objc_msgSend(v5, "rawValue") == 1))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__DSSharingWelcomeController_viewWillLayoutSubviews__block_invoke_2;
    block[3] = &unk_264C6E7D0;
    block[4] = *(void *)(a1 + 32);
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __52__DSSharingWelcomeController_viewWillLayoutSubviews__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentDTOCell];
}

- (void)_presentDTOCell
{
  v3 = [(DSSharingWelcomeController *)self cell];

  if (!v3)
  {
    v4 = +[DSPlatterTableView cellWithPresentingViewController:self];
    [(DSSharingWelcomeController *)self setCell:v4];

    id v5 = [(DSSharingWelcomeController *)self scrollView];
    [v5 addSubview:self->_cell];
  }
  id v6 = [(DSSharingWelcomeController *)self cell];

  if (v6)
  {
    v7 = [(DSSharingWelcomeController *)self contentView];
    v8 = [v7 topAnchor];
    v9 = [(DSSharingWelcomeController *)self cell];
    v10 = [v9 bottomAnchor];
    objc_super v11 = [v8 constraintEqualToAnchor:v10 constant:16.0];
    [v11 setActive:1];

    v12 = [(DSSharingWelcomeController *)self cell];
    v13 = [v12 topAnchor];
    v14 = [(DSSharingWelcomeController *)self headerView];
    objc_super v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15 constant:16.0];
    [v16 setActive:1];

    v17 = [(DSSharingWelcomeController *)self cell];
    v18 = [v17 leadingAnchor];
    v19 = [(DSSharingWelcomeController *)self headerView];
    v20 = [v19 leadingAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    v22 = [(DSSharingWelcomeController *)self cell];
    v23 = [v22 widthAnchor];
    v24 = [(DSSharingWelcomeController *)self headerView];
    v25 = [v24 widthAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    id v30 = [(DSSharingWelcomeController *)self cell];
    v27 = [v30 heightAnchor];
    v28 = [(DSSharingWelcomeController *)self cell];
    [v28 preferredHeight];
    v29 = objc_msgSend(v27, "constraintEqualToConstant:");
    [v29 setActive:1];
  }
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DSPlatterTableView)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end