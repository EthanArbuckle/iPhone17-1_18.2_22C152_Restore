@interface DSShareLocationController
- (CNContact)selectedContact;
- (CNContactPickerViewController)contactsViewController;
- (DSNavigationDelegate)delegate;
- (DSShareLocationController)init;
- (FMFSession)fmfSession;
- (NSArray)locationSharingTypeNames;
- (id)bestDefaultContactProperty;
- (id)endDateFromNowForOfferTimespan:(int64_t)a3;
- (id)fmfHandleFromContactProperty:(id)a3;
- (id)fmfHandlesFromContact:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)selectedLocationSharingType;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)manageBoldButton;
- (void)pickContact;
- (void)presentSharingFailedAlert;
- (void)setContactsViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFmfSession:(id)a3;
- (void)setLocationSharingTypeNames:(id)a3;
- (void)setSelectedContact:(id)a3;
- (void)setSelectedLocationSharingType:(int64_t)a3;
- (void)shareLocation;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DSShareLocationController

- (DSShareLocationController)init
{
  v21[3] = *MEMORY[0x263EF8340];
  v3 = DSUILocStringForKey(@"SHARE_LOCATION");
  v4 = DSUILocStringForKey(@"SHARE_LOCATION_DETAIL");
  v5 = [MEMORY[0x263F827E8] systemImageNamed:@"findmy"];
  v20.receiver = self;
  v20.super_class = (Class)DSShareLocationController;
  v6 = [(DSTableWelcomeController *)&v20 initWithTitle:v3 detailText:v4 icon:v5 adoptTableViewScrollView:0 shouldShowSearchBar:0];

  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.DigitalSeparation", "DSShareLocationController");
    v8 = (void *)DSLog;
    DSLog = (uint64_t)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F3BA80]) initWithDelegate:0];
    fmfSession = v6->_fmfSession;
    v6->_fmfSession = (FMFSession *)v9;

    v6->_selectedLocationSharingType = 3;
    v11 = DSUILocStringForKey(@"SHARE_ONE_HOUR");
    v21[0] = v11;
    v12 = DSUILocStringForKey(@"SHARE_EOD");
    v21[1] = v12;
    v13 = DSUILocStringForKey(@"SHARE_INDEFINITELY");
    v21[2] = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
    locationSharingTypeNames = v6->_locationSharingTypeNames;
    v6->_locationSharingTypeNames = (NSArray *)v14;

    v16 = (CNContactPickerViewController *)objc_alloc_init(MEMORY[0x263EFEBE0]);
    contactsViewController = v6->_contactsViewController;
    v6->_contactsViewController = v16;

    [(CNContactPickerViewController *)v6->_contactsViewController setDelegate:v6];
    v18 = [(OBTableWelcomeController *)v6 tableView];
    [v18 setMultipleTouchEnabled:0];
  }
  return v6;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)DSShareLocationController;
  [(DSTableWelcomeController *)&v8 viewDidLoad];
  v3 = DSUILocStringForKey(@"SHARE_LOCATION");
  v4 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:self selector:sel_shareLocation];
  [(DSTableWelcomeController *)self setBoldButton:v4];

  [(DSShareLocationController *)self manageBoldButton];
  v5 = DSUILocStringForKey(@"NOT_NOW");
  v6 = [(DSShareLocationController *)self delegate];
  os_log_t v7 = +[DSUIUtilities setUpLinkButtonForController:self title:v5 target:v6 selector:sel_pushNextPane];
  [(DSTableWelcomeController *)self setLinkButton:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = [(OBTableWelcomeController *)self tableView];
  [v3 reloadData];
}

- (void)manageBoldButton
{
  if ([(DSShareLocationController *)self selectedLocationSharingType] == 3)
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [(DSShareLocationController *)self selectedContact];
    BOOL v3 = v4 != 0;
  }
  id v5 = [(DSTableWelcomeController *)self boldButton];
  [v5 setEnabled:v3];
}

- (void)shareLocation
{
  BOOL v3 = [(DSTableWelcomeController *)self boldButton];
  [v3 showsBusyIndicator];

  v4 = [(DSShareLocationController *)self fmfSession];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__DSShareLocationController_shareLocation__block_invoke;
  v5[3] = &unk_264C6E820;
  v5[4] = self;
  [v4 iCloudAccountNameWithCompletion:v5];
}

void __42__DSShareLocationController_shareLocation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length])
  {
    v4 = [MEMORY[0x263F3BA60] handleWithId:v3];
  }
  else
  {
    id v5 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235BFC000, v5, OS_LOG_TYPE_INFO, "Error getting callerID.", buf, 2u);
    }
    v4 = 0;
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "endDateFromNowForOfferTimespan:", objc_msgSend(*(id *)(a1 + 32), "selectedLocationSharingType"));
  os_log_t v7 = (void *)MEMORY[0x263EFFA08];
  objc_super v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v8 bestDefaultContactProperty];
  v10 = [v8 fmfHandleFromContactProperty:v9];
  v11 = [v7 setWithObject:v10];

  v12 = [*(id *)(a1 + 32) fmfSession];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__DSShareLocationController_shareLocation__block_invoke_321;
  v13[3] = &unk_264C6E7F8;
  v13[4] = *(void *)(a1 + 32);
  [v12 sendFriendshipOfferToHandles:v11 groupId:0 callerId:v4 endDate:v6 completion:v13];
}

void __42__DSShareLocationController_shareLocation__block_invoke_321(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_log_t v7 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_ERROR)) {
      __42__DSShareLocationController_shareLocation__block_invoke_321_cold_1((uint64_t)v6, v7);
    }
    objc_super v8 = v11;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    uint64_t v9 = __42__DSShareLocationController_shareLocation__block_invoke_322;
  }
  else
  {
    objc_super v8 = v10;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    uint64_t v9 = __42__DSShareLocationController_shareLocation__block_invoke_2;
  }
  v8[2] = v9;
  v8[3] = &unk_264C6E7D0;
  v8[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __42__DSShareLocationController_shareLocation__block_invoke_322(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) boldButton];
  [v2 hidesBusyIndicator];

  id v3 = *(void **)(a1 + 32);
  return [v3 presentSharingFailedAlert];
}

void __42__DSShareLocationController_shareLocation__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) boldButton];
  [v2 hidesBusyIndicator];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 pushNextPane];
}

- (void)presentSharingFailedAlert
{
  id v3 = DSUILocStringForKey(@"LOCATION_SHARING_FAILED_TITLE");
  v4 = DSUILocStringForKey(@"LOCATION_SHARING_FAILED");
  v5[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__DSShareLocationController_presentSharingFailedAlert__block_invoke;
  v6[3] = &unk_264C6E848;
  v6[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__DSShareLocationController_presentSharingFailedAlert__block_invoke_2;
  v5[3] = &unk_264C6E848;
  [(DSTableWelcomeController *)self presentErrorAlertWithTitle:v3 message:v4 continueHandler:v6 tryAgainHandler:v5];
}

void __54__DSShareLocationController_presentSharingFailedAlert__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 pushNextPane];
}

void __54__DSShareLocationController_presentSharingFailedAlert__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectedContact:0];
  [*(id *)(a1 + 32) manageBoldButton];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 3;
  }
  else {
    return 1;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F82C80]);
  os_log_t v7 = [MEMORY[0x263F825C8] tertiarySystemFillColor];
  [v6 setBackgroundColor:v7];

  uint64_t v8 = [v5 section];
  if (v8 == 1)
  {
    v17 = [(DSShareLocationController *)self locationSharingTypeNames];
    v18 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v19 = [v6 textLabel];
    [v19 setText:v18];

    [v6 setSelectionStyle:0];
    uint64_t v20 = [v5 row];
    if (v20 == [(DSShareLocationController *)self selectedLocationSharingType]) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = 0;
    }
  }
  else
  {
    if (v8) {
      goto LABEL_11;
    }
    uint64_t v9 = [(DSShareLocationController *)self selectedContact];

    if (v9)
    {
      v10 = NSString;
      v11 = DSUILocStringForKey(@"SHARE_CONTACT");
      v12 = (void *)MEMORY[0x263EFEA20];
      v13 = [(DSShareLocationController *)self selectedContact];
      uint64_t v14 = [v12 stringFromContact:v13 style:0];
      v15 = [v10 stringWithFormat:@"%@ %@", v11, v14];
      v16 = [v6 textLabel];
      [v16 setText:v15];
    }
    else
    {
      v11 = DSUILocStringForKey(@"SHARE_CONTACT");
      v13 = [v6 textLabel];
      [v13 setText:v11];
    }

    uint64_t v21 = 1;
  }
  [v6 setAccessoryType:v21];
LABEL_11:

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = a3;
  if (!a4)
  {
    id v6 = @"SHARE_LOCATION_CONTACT_FOOTER";
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    id v6 = @"SHARE_LOCATION_TYPE_FOOTER";
LABEL_5:
    DSUILocStringForKey(v6);
    os_log_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  os_log_t v7 = &stru_26E9097D0;
LABEL_7:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a4;
  uint64_t v5 = [v7 section];
  if (v5 == 1)
  {
    -[DSShareLocationController setSelectedLocationSharingType:](self, "setSelectedLocationSharingType:", [v7 row]);
    [(DSShareLocationController *)self manageBoldButton];
    id v6 = [(OBTableWelcomeController *)self tableView];
    [v6 reloadData];
  }
  else if (!v5)
  {
    [(DSShareLocationController *)self pickContact];
  }
}

- (void)pickContact
{
  v19[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"];
  uint64_t v5 = [v3 arrayWithObject:v4];

  id v6 = objc_msgSend(MEMORY[0x263EFEA58], "ds_meContactIdentifier");
  if (v6)
  {
    id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K != %@", *MEMORY[0x263EFDFE0], v6];
    [v5 addObject:v7];
  }
  uint64_t v8 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v5];
  uint64_t v9 = [(DSShareLocationController *)self contactsViewController];
  [v9 setPredicateForEnablingContact:v8];

  v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"];
  v11 = [(DSShareLocationController *)self contactsViewController];
  [v11 setPredicateForSelectionOfContact:v10];

  v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"(property == 'emailAddresses') OR (property == 'phoneNumbers')"];
  v13 = [(DSShareLocationController *)self contactsViewController];
  [v13 setPredicateForSelectionOfProperty:v12];

  uint64_t v14 = *MEMORY[0x263EFE070];
  v19[0] = *MEMORY[0x263EFDF80];
  v19[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v16 = [(DSShareLocationController *)self contactsViewController];
  [v16 setDisplayedPropertyKeys:v15];

  v17 = [(DSShareLocationController *)self navigationController];
  v18 = [(DSShareLocationController *)self contactsViewController];
  [v17 presentViewController:v18 animated:1 completion:0];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  objc_storeStrong((id *)&self->_selectedContact, a4);
  [(DSShareLocationController *)self manageBoldButton];
  [(DSShareLocationController *)self dismissViewControllerAnimated:1 completion:0];
  id v5 = [(OBTableWelcomeController *)self tableView];
  [v5 reloadData];
}

- (id)bestDefaultContactProperty
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v4 = [(DSShareLocationController *)self selectedContact];
  id v5 = [v4 phoneNumbers];

  id v6 = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    uint64_t v10 = *MEMORY[0x263EFE070];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x263EFEA30];
        uint64_t v14 = [(DSShareLocationController *)self selectedContact];
        v15 = [v12 identifier];
        v16 = [v13 contactPropertyWithContact:v14 propertyKey:v10 identifier:v15];

        [v3 addObject:v16];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v17 = [(DSShareLocationController *)self selectedContact];
  v18 = [v17 emailAddresses];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    uint64_t v22 = *MEMORY[0x263EFDF80];
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        v25 = (void *)MEMORY[0x263EFEA30];
        v26 = [(DSShareLocationController *)self selectedContact];
        v27 = [v24 identifier];
        v28 = [v25 contactPropertyWithContact:v26 propertyKey:v22 identifier:v27];

        [v3 addObject:v28];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v20);
  }

  v29 = [MEMORY[0x263F336B0] bestPropertyComparator];
  [v3 sortUsingComparator:v29];

  v30 = [v3 firstObject];

  return v30;
}

- (id)fmfHandlesFromContact:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = [v3 emailAddresses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v34 + 1) + 8 * i) value];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v7);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v11 = [v3 phoneNumbers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v30 + 1) + 8 * j) value];
        v17 = [v16 unformattedInternationalStringValue];
        [v4 addObject:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v13);
  }

  v18 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v4;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = objc_msgSend(MEMORY[0x263F3BA60], "handleWithId:", *(void *)(*((void *)&v26 + 1) + 8 * k), (void)v26);
        [v18 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }

  return v18;
}

- (id)fmfHandleFromContactProperty:(id)a3
{
  id v3 = a3;
  v4 = [v3 key];
  int v5 = [v4 isEqualToString:*MEMORY[0x263EFE070]];

  if (v5)
  {
    uint64_t v6 = [v3 value];
    uint64_t v7 = [v6 unformattedInternationalStringValue];
  }
  else
  {
    uint64_t v8 = [v3 key];
    int v9 = [v8 isEqualToString:*MEMORY[0x263EFDF80]];

    if (v9)
    {
      uint64_t v7 = [v3 value];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  uint64_t v10 = [MEMORY[0x263F3BA60] handleWithId:v7];

  return v10;
}

- (id)endDateFromNowForOfferTimespan:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v3 = [MEMORY[0x263EFF8F0] currentCalendar];
      v4 = [MEMORY[0x263EFF910] date];
      int v5 = [v3 nextDateAfterDate:v4 matchingUnit:32 value:4 options:1024];
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:3600.0];
  }
  return v5;
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactPickerViewController)contactsViewController
{
  return self->_contactsViewController;
}

- (void)setContactsViewController:(id)a3
{
}

- (NSArray)locationSharingTypeNames
{
  return self->_locationSharingTypeNames;
}

- (void)setLocationSharingTypeNames:(id)a3
{
}

- (CNContact)selectedContact
{
  return self->_selectedContact;
}

- (void)setSelectedContact:(id)a3
{
}

- (int64_t)selectedLocationSharingType
{
  return self->_selectedLocationSharingType;
}

- (void)setSelectedLocationSharingType:(int64_t)a3
{
  self->_selectedLocationSharingType = a3;
}

- (FMFSession)fmfSession
{
  return self->_fmfSession;
}

- (void)setFmfSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmfSession, 0);
  objc_storeStrong((id *)&self->_selectedContact, 0);
  objc_storeStrong((id *)&self->_locationSharingTypeNames, 0);
  objc_storeStrong((id *)&self->_contactsViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __42__DSShareLocationController_shareLocation__block_invoke_321_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "Error offering location. Error - %@", (uint8_t *)&v2, 0xCu);
}

@end