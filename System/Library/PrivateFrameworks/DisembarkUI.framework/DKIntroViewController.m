@interface DKIntroViewController
- (BOOL)isBasebandDead;
- (BOOL)preventOpeningSafari;
- (DKIntroViewController)init;
- (DKNotableUserData)notableUserData;
- (id)_createNotableUserDataCardForAccounts:(id)a3;
- (id)_createNotableUserDataCardForAppsAndData:(int64_t)a3;
- (id)_createNotableUserDataCardForCellularPlans:(id)a3;
- (id)_createNotableUserDataCardForFindMy:(BOOL)a3;
- (id)_createNotableUserDataCardForWallet:(id)a3;
- (id)beginEraseBlock;
- (id)confirmErase;
- (id)eraseLaterBlock;
- (id)fetchRestoreState;
- (id)hasInternetConnectivity;
- (id)localPaymentCards;
- (void)_addNotableUserDataItemsView;
- (void)_continueTapped:(id)a3;
- (void)_notNowTapped:(id)a3;
- (void)_presentBasebandDeadWarning:(id)a3;
- (void)_presentLocalDataWarning:(id)a3;
- (void)_presentLocalPaymentCardConfirmation:(id)a3;
- (void)_presentRestoreWarning:(id)a3;
- (void)setBeginEraseBlock:(id)a3;
- (void)setConfirmErase:(id)a3;
- (void)setEraseLaterBlock:(id)a3;
- (void)setFetchRestoreState:(id)a3;
- (void)setHasInternetConnectivity:(id)a3;
- (void)setIsBasebandDead:(BOOL)a3;
- (void)setNotableUserData:(id)a3;
- (void)setPreventOpeningSafari:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DKIntroViewController

- (DKIntroViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"INTRO_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"INTRO_DETAIL" value:&stru_26EAA9F58 table:@"Localizable"];

  v9.receiver = self;
  v9.super_class = (Class)DKIntroViewController;
  v7 = [(DKIntroViewController *)&v9 initWithTitle:v4 detailText:v6 icon:0 contentLayout:2];

  return v7;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)DKIntroViewController;
  [(OBBaseWelcomeController *)&v19 viewDidLoad];
  v3 = [(DKIntroViewController *)self notableUserData];
  v4 = [v3 accounts];
  if ([v4 count])
  {

LABEL_4:
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"INTRO_DETAIL_WITH_APPLE_ACCOUNT" value:&stru_26EAA9F58 table:@"Localizable"];

    objc_super v9 = [(DKIntroViewController *)self headerView];
    [v9 setDetailText:v8];

    goto LABEL_5;
  }
  v5 = [(DKIntroViewController *)self notableUserData];
  int v6 = [v5 findMyEnabled];

  if (v6) {
    goto LABEL_4;
  }
LABEL_5:
  v10 = [(OBBaseWelcomeController *)self navigationItem];
  [v10 setHidesBackButton:1];

  [(DKIntroViewController *)self _addNotableUserDataItemsView];
  v11 = [MEMORY[0x263F5B898] boldButton];
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"CONTINUE" value:&stru_26EAA9F58 table:@"Localizable"];
  [v11 setTitle:v13 forState:0];

  [v11 addTarget:self action:sel__continueTapped_ forControlEvents:64];
  v14 = [(DKIntroViewController *)self buttonTray];
  [v14 addButton:v11];

  v15 = [MEMORY[0x263F5B8D0] linkButton];
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"NOT_NOW" value:&stru_26EAA9F58 table:@"Localizable"];
  [v15 setTitle:v17 forState:0];

  [v15 addTarget:self action:sel__notNowTapped_ forControlEvents:64];
  v18 = [(DKIntroViewController *)self buttonTray];
  [v18 addButton:v15];
}

- (void)_addNotableUserDataItemsView
{
  v37[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F1C9B8]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setAxis:1];
  [v4 setSpacing:10.0];
  v5 = [(DKIntroViewController *)self notableUserData];
  int v6 = -[DKIntroViewController _createNotableUserDataCardForAppsAndData:](self, "_createNotableUserDataCardForAppsAndData:", [v5 dataSize]);
  [v4 addArrangedSubview:v6];

  v7 = [(DKIntroViewController *)self notableUserData];
  v8 = [v7 accounts];
  objc_super v9 = [(DKIntroViewController *)self _createNotableUserDataCardForAccounts:v8];
  [v4 addArrangedSubview:v9];

  v10 = [(DKIntroViewController *)self notableUserData];
  v11 = -[DKIntroViewController _createNotableUserDataCardForFindMy:](self, "_createNotableUserDataCardForFindMy:", [v10 findMyEnabled]);
  [v4 addArrangedSubview:v11];

  v12 = [(DKIntroViewController *)self notableUserData];
  v13 = [v12 walletData];
  v14 = [(DKIntroViewController *)self _createNotableUserDataCardForWallet:v13];
  [v4 addArrangedSubview:v14];

  v15 = [(DKIntroViewController *)self notableUserData];
  v16 = [v15 cellularPlans];
  v17 = [(DKIntroViewController *)self _createNotableUserDataCardForCellularPlans:v16];
  [v4 addArrangedSubview:v17];

  v18 = [(DKIntroViewController *)self contentView];
  [v18 addSubview:v4];

  objc_super v19 = [(DKIntroViewController *)self contentView];
  v36 = [(DKIntroViewController *)self contentView];
  v35 = [v36 topAnchor];
  v34 = [v4 topAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v37[0] = v33;
  v32 = [(DKIntroViewController *)self contentView];
  v31 = [v32 leadingAnchor];
  v30 = [v4 leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v37[1] = v29;
  v28 = [(DKIntroViewController *)self contentView];
  v20 = [v28 trailingAnchor];
  v21 = [v4 trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v37[2] = v22;
  v23 = [(DKIntroViewController *)self contentView];
  v24 = [v23 bottomAnchor];
  v25 = [v4 bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v37[3] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
  [v19 addConstraints:v27];
}

- (id)_createNotableUserDataCardForAccounts:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [v3 firstObject];
    v32 = [v4 profilePicture];

    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v38 + 1) + 8 * i) username];
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v8);
    }

    v12 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v5];
    v13 = [DKNotableUserDataCardView alloc];
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"APPLE_ACCOUNT" value:&stru_26EAA9F58 table:@"Localizable"];
    v16 = [(DKNotableUserDataCardView *)v13 initWithTitle:v15 subtitle:v12 icon:v32];

    if ((unint64_t)[v6 count] >= 2)
    {
      v30 = v12;
      id v31 = v3;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      obuint64_t j = v6;
      uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            id v22 = objc_alloc(MEMORY[0x263F1C6D0]);
            v23 = [v21 profilePicture];
            v24 = (void *)[v22 initWithImage:v23];

            v25 = [DKNotableUserDataCardCell alloc];
            v26 = [v21 name];
            v27 = [v21 username];
            v28 = [(DKNotableUserDataCardCell *)v25 initWithTitle:v26 subtitle:v27 accessoryView:v24];

            [(DKNotableUserDataCardView *)v16 addCardCell:v28];
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v18);
      }

      v12 = v30;
      id v3 = v31;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_createNotableUserDataCardForFindMy:(BOOL)a3
{
  if (a3)
  {
    id v3 = [DKNotableUserDataCardView alloc];
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"FIND_MY" value:&stru_26EAA9F58 table:@"Localizable"];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"ACTIVATION_LOCK" value:&stru_26EAA9F58 table:@"Localizable"];
    uint64_t v8 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"findmy"];
    uint64_t v9 = [(DKNotableUserDataCardView *)v3 initWithTitle:v5 subtitle:v7 icon:v8];

    v10 = [DKNotableUserDataCardCell alloc];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"FIND_MY_DESCRIPTION" value:&stru_26EAA9F58 table:@"Localizable"];
    v13 = [(DKNotableUserDataCardCell *)v10 initWithTitle:0 subtitle:v12 accessoryView:0];

    [(DKNotableUserDataCardView *)v9 addCardCell:v13];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)_createNotableUserDataCardForWallet:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 walletCards];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = NSString;
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"WALLET_ITEMS" value:&stru_26EAA9F58 table:@"Localizable"];
    uint64_t v9 = [v3 walletCards];
    uint64_t v10 = objc_msgSend(v6, "localizedStringWithFormat:", v8, objc_msgSend(v9, "count"));

    v11 = [DKNotableUserDataWalletCardView alloc];
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"APPLE_WALLET" value:&stru_26EAA9F58 table:@"Localizable"];
    v14 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"wallet"];
    v32 = (void *)v10;
    v15 = [(DKNotableUserDataWalletCardView *)v11 initWithTitle:v13 subtitle:v10 icon:v14];

    v16 = [v3 paymentProvisioningContext];
    [v16 setDelegate:v15];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obuint64_t j = [v3 walletCards];
    uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v22 = objc_alloc(MEMORY[0x263F1C6D0]);
          v23 = [v3 passSnapshotForCredential:v21];
          v24 = (void *)[v22 initWithImage:v23];

          [v24 setContentMode:1];
          [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
          v25 = [DKNotableUserDataWalletCardCell alloc];
          [v21 title];
          v27 = id v26 = v3;
          v28 = [v21 subtitle];
          v29 = [(DKNotableUserDataWalletCardCell *)v25 initWithTitle:v27 subtitle:v28 accessoryView:v24];

          id v3 = v26;
          v30 = [v21 uniqueIdentifier];
          [(DKNotableUserDataWalletCardCell *)v29 setUniqueIdentifier:v30];

          [(DKNotableUserDataWalletCardView *)v15 addCardCell:v29];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v18);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_createNotableUserDataCardForCellularPlans:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    id v50 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v47 = v3;
    obuint64_t j = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    v48 = v4;
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v52;
      int v8 = 1;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v52 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if ([v10 isTransferred]
            || ([v10 phoneNumber],
                v11 = objc_claimAutoreleasedReturnValue(),
                uint64_t v12 = [v11 length],
                v11,
                !v12))
          {
            v14 = [v10 carrierName];
            [v50 addObject:v14];
          }
          else
          {
            v13 = NSString;
            v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v15 = [v14 localizedStringForKey:@"CELLULAR_PLAN_CARRIER_WITH_PHONE_NUMBER" value:&stru_26EAA9F58 table:@"Localizable"];
            v16 = [v10 carrierName];
            uint64_t v17 = [v10 phoneNumber];
            uint64_t v18 = objc_msgSend(v13, "stringWithFormat:", v15, v16, v17);
            [v50 addObject:v18];

            id v4 = v48;
          }

          uint64_t v19 = [v10 carrierName];
          [v4 addObject:v19];

          v8 &= [v10 isTransferred];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v6);
    }
    else
    {
      int v8 = 1;
    }

    v21 = (void *)MEMORY[0x263F08950];
    id v22 = [v4 allObjects];
    v23 = [v22 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
    v24 = (void *)[v23 mutableCopy];
    v46 = [v21 localizedStringByJoiningStrings:v24];

    v25 = (void *)MEMORY[0x263F08950];
    id v26 = [v50 allObjects];
    v27 = [v26 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
    v28 = (void *)[v27 mutableCopy];
    v29 = [v25 localizedStringByJoiningStrings:v28];

    uint64_t v30 = [obj count];
    id v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v32 = v31;
    if (v30 == 1)
    {
      v33 = [v31 localizedStringForKey:@"CELLULAR_PLAN" value:&stru_26EAA9F58 table:@"Localizable"];

      long long v34 = @"CELLULAR_PLAN_DESCRIPTION_SINGULAR";
      long long v35 = @"CELLULAR_PLAN_TRANSFER_DESCRIPTION_SINGULAR";
    }
    else
    {
      v33 = [v31 localizedStringForKey:@"CELLULAR_PLANS" value:&stru_26EAA9F58 table:@"Localizable"];

      long long v34 = @"CELLULAR_PLAN_DESCRIPTION_PLURAL";
      long long v35 = @"CELLULAR_PLAN_TRANSFER_DESCRIPTION_PLURAL";
    }
    if (v8) {
      long long v34 = v35;
    }
    id v3 = v47;
    long long v36 = v34;
    long long v37 = NSString;
    long long v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v39 = [v38 localizedStringForKey:v36 value:&stru_26EAA9F58 table:@"Localizable"];
    if (v8) {
      objc_msgSend(v37, "stringWithFormat:", v39, v46, v45);
    }
    else {
    long long v40 = objc_msgSend(v37, "stringWithFormat:", v39, v29, v46);
    }

    long long v41 = [DKNotableUserDataCardView alloc];
    v42 = [MEMORY[0x263F1C6B0] systemImageNamed:@"antenna.radiowaves.left.and.right"];
    v20 = [(DKNotableUserDataCardView *)v41 initWithTitle:v33 subtitle:&stru_26EAA9F58 icon:v42];

    v43 = [[DKNotableUserDataCardCell alloc] initWithTitle:0 subtitle:v40 accessoryView:0];
    [(DKNotableUserDataCardView *)v20 addCardCell:v43];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_createNotableUserDataCardForAppsAndData:(int64_t)a3
{
  id v3 = NSLocalizedFileSizeDescription();
  id v4 = [DKNotableUserDataCardView alloc];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"APPS_AND_DATA" value:&stru_26EAA9F58 table:@"Localizable"];
  uint64_t v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"internaldrive"];
  int v8 = [(DKNotableUserDataCardView *)v4 initWithTitle:v6 subtitle:v3 icon:v7];

  return v8;
}

- (void)_presentLocalDataWarning:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DKIntroViewController *)self fetchRestoreState];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__DKIntroViewController__presentLocalDataWarning___block_invoke;
  v8[3] = &unk_264CF0E68;
  v8[4] = self;
  id v9 = v4;
  uint64_t v6 = (void (*)(void *, void *))v5[2];
  id v7 = v4;
  v6(v5, v8);
}

uint64_t __50__DKIntroViewController__presentLocalDataWarning___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _presentRestoreWarning:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_presentRestoreWarning:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v18 = [v5 localizedStringForKey:@"RESTORE_IN_PROGRESS_ALERT_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];

  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"RESTORE_IN_PROGRESS_ALERT_MESSAGE" value:&stru_26EAA9F58 table:@"Localizable"];

  int v8 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v18 message:v7 preferredStyle:1];
  id v9 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"ERASE_ANYWAY" value:&stru_26EAA9F58 table:@"Localizable"];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __48__DKIntroViewController__presentRestoreWarning___block_invoke;
  v19[3] = &unk_264CF0C48;
  id v20 = v4;
  id v12 = v4;
  v13 = [v9 actionWithTitle:v11 style:2 handler:v19];
  [v8 addAction:v13];

  v14 = (void *)MEMORY[0x263F1C3F0];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
  uint64_t v17 = [v14 actionWithTitle:v16 style:1 handler:0];
  [v8 addAction:v17];

  [(DKIntroViewController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __48__DKIntroViewController__presentRestoreWarning___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentBasebandDeadWarning:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(DKIntroViewController *)self isBasebandDead])
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"TELEPHONY_BASEBAND_DEAD_ALERT_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];

    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v8 = [v7 localizedStringForKey:@"TELEPHONY_BASEBAND_DEAD_ALERT_MESSAGE" value:&stru_26EAA9F58 table:@"Localizable"];

    if ([(DKIntroViewController *)self preventOpeningSafari])
    {
      id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v10 = [v9 localizedStringForKey:@"TELEPHONY_BASEBAND_DEAD_WEB_LINK" value:&stru_26EAA9F58 table:@"Localizable"];
      uint64_t v11 = [v8 stringByAppendingFormat:@"\n\n%@", v10];

      int v8 = (void *)v11;
    }
    id v12 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v6 message:v8 preferredStyle:1];
    if (![(DKIntroViewController *)self preventOpeningSafari])
    {
      v13 = (void *)MEMORY[0x263F1C3F0];
      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"LEARN_MORE" value:&stru_26EAA9F58 table:@"Localizable"];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __53__DKIntroViewController__presentBasebandDeadWarning___block_invoke;
      v27[3] = &unk_264CF0AE8;
      v27[4] = self;
      v16 = [v13 actionWithTitle:v15 style:0 handler:v27];
      [v12 addAction:v16];
    }
    uint64_t v17 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v19 = [v18 localizedStringForKey:@"ERASE_ANYWAY" value:&stru_26EAA9F58 table:@"Localizable"];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __53__DKIntroViewController__presentBasebandDeadWarning___block_invoke_2;
    v25[3] = &unk_264CF0C48;
    id v26 = v4;
    id v20 = [v17 actionWithTitle:v19 style:2 handler:v25];
    [v12 addAction:v20];

    v21 = (void *)MEMORY[0x263F1C3F0];
    id v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
    v24 = [v21 actionWithTitle:v23 style:1 handler:0];
    [v12 addAction:v24];

    [(DKIntroViewController *)self presentViewController:v12 animated:1 completion:0];
  }
  else
  {
    v4[2](v4);
  }
}

void __53__DKIntroViewController__presentBasebandDeadWarning___block_invoke()
{
  id v4 = [MEMORY[0x263F1C408] sharedApplication];
  v0 = NSURL;
  v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v2 = [v1 localizedStringForKey:@"TELEPHONY_BASEBAND_DEAD_HTTPS_WEB_LINK" value:&stru_26EAA9F58 table:@"Localizable"];
  id v3 = [v0 URLWithString:v2];
  [v4 openURL:v3 options:MEMORY[0x263EFFA78] completionHandler:0];
}

uint64_t __53__DKIntroViewController__presentBasebandDeadWarning___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)localPaymentCards
{
  v2 = [(DKIntroViewController *)self notableUserData];
  id v3 = [v2 walletData];
  id v4 = [v3 localPaymentCards];

  return v4;
}

- (void)_presentLocalPaymentCardConfirmation:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(DKIntroViewController *)self localPaymentCards];
  if (![v5 count])
  {

    goto LABEL_7;
  }
  uint64_t v6 = [(DKIntroViewController *)self hasInternetConnectivity];
  int v7 = v6[2]();

  if (v7)
  {
LABEL_7:
    v4[2](v4);
    goto LABEL_8;
  }
  int v8 = NSString;
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"ERASE_LOCAL_PAYMENT_CARDS_OFFLINE_TITLE_SINGLE" value:&stru_26EAA9F58 table:@"Localizable"];
  uint64_t v11 = [(DKIntroViewController *)self localPaymentCards];
  id v12 = [v11 firstObject];
  v13 = [v12 title];
  v14 = objc_msgSend(v8, "stringWithFormat:", v10, v13);

  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"ERASE_LOCAL_PAYMENT_CARDS_OFFLINE_MESSAGE_SINGLE" value:&stru_26EAA9F58 table:@"Localizable"];

  uint64_t v17 = [(DKIntroViewController *)self localPaymentCards];
  unint64_t v18 = [v17 count];

  if (v18 >= 2)
  {
    uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v20 = [v19 localizedStringForKey:@"ERASE_LOCAL_PAYMENT_CARDS_OFFLINE_TITLE_MULTIPLE" value:&stru_26EAA9F58 table:@"Localizable"];

    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v22 = [v21 localizedStringForKey:@"ERASE_LOCAL_PAYMENT_CARDS_OFFLINE_MESSAGE_MULTIPLE" value:&stru_26EAA9F58 table:@"Localizable"];

    v14 = (void *)v20;
    v16 = (void *)v22;
  }
  v23 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v14 message:v16 preferredStyle:1];
  v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"ERASE_CONFIRMATION_ALERT_BUTTON" value:&stru_26EAA9F58 table:@"Localizable"];

  id v26 = (void *)MEMORY[0x263F1C3F0];
  v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
  v29 = [v26 actionWithTitle:v28 style:0 handler:0];
  [v23 addAction:v29];

  uint64_t v30 = (void *)MEMORY[0x263F1C3F0];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __62__DKIntroViewController__presentLocalPaymentCardConfirmation___block_invoke;
  v32[3] = &unk_264CF0C48;
  v33 = v4;
  id v31 = [v30 actionWithTitle:v25 style:2 handler:v32];
  [v23 addAction:v31];

  [(DKIntroViewController *)self presentViewController:v23 animated:1 completion:0];
LABEL_8:
}

uint64_t __62__DKIntroViewController__presentLocalPaymentCardConfirmation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_continueTapped:(id)a3
{
  id v4 = [(DKIntroViewController *)self confirmErase];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__DKIntroViewController__continueTapped___block_invoke;
  v5[3] = &unk_264CF0A98;
  v5[4] = self;
  ((void (**)(void, void *))v4)[2](v4, v5);
}

uint64_t __41__DKIntroViewController__continueTapped___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__DKIntroViewController__continueTapped___block_invoke_2;
  v3[3] = &unk_264CF0EB8;
  v3[4] = v1;
  return [v1 _presentLocalDataWarning:v3];
}

uint64_t __41__DKIntroViewController__continueTapped___block_invoke_2(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__DKIntroViewController__continueTapped___block_invoke_3;
  v4[3] = &unk_264CF0E90;
  v4[4] = v2;
  char v5 = a2;
  return [v2 _presentLocalPaymentCardConfirmation:v4];
}

uint64_t __41__DKIntroViewController__continueTapped___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__DKIntroViewController__continueTapped___block_invoke_4;
  v3[3] = &unk_264CF0E90;
  v3[4] = v1;
  char v4 = *(unsigned char *)(a1 + 40);
  return [v1 _presentBasebandDeadWarning:v3];
}

void __41__DKIntroViewController__continueTapped___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) beginEraseBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) beginEraseBlock];
    v3[2](v3, *(unsigned __int8 *)(a1 + 40));
  }
}

- (void)_notNowTapped:(id)a3
{
  char v4 = [(DKIntroViewController *)self eraseLaterBlock];

  if (v4)
  {
    char v5 = [(DKIntroViewController *)self eraseLaterBlock];
    v5[2]();
  }
}

- (id)confirmErase
{
  return self->_confirmErase;
}

- (void)setConfirmErase:(id)a3
{
}

- (id)beginEraseBlock
{
  return self->_beginEraseBlock;
}

- (void)setBeginEraseBlock:(id)a3
{
}

- (id)eraseLaterBlock
{
  return self->_eraseLaterBlock;
}

- (void)setEraseLaterBlock:(id)a3
{
}

- (id)hasInternetConnectivity
{
  return self->_hasInternetConnectivity;
}

- (void)setHasInternetConnectivity:(id)a3
{
}

- (BOOL)isBasebandDead
{
  return self->_isBasebandDead;
}

- (void)setIsBasebandDead:(BOOL)a3
{
  self->_isBasebandDead = a3;
}

- (DKNotableUserData)notableUserData
{
  return self->_notableUserData;
}

- (void)setNotableUserData:(id)a3
{
}

- (id)fetchRestoreState
{
  return self->_fetchRestoreState;
}

- (void)setFetchRestoreState:(id)a3
{
}

- (BOOL)preventOpeningSafari
{
  return self->_preventOpeningSafari;
}

- (void)setPreventOpeningSafari:(BOOL)a3
{
  self->_preventOpeningSafaruint64_t i = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchRestoreState, 0);
  objc_storeStrong((id *)&self->_notableUserData, 0);
  objc_storeStrong(&self->_hasInternetConnectivity, 0);
  objc_storeStrong(&self->_eraseLaterBlock, 0);
  objc_storeStrong(&self->_beginEraseBlock, 0);
  objc_storeStrong(&self->_confirmErase, 0);
}

@end