@interface HKBridgeSetupEmergencyContactsController
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (HKBridgeSetupEmergencyContactsController)initWithConfiguration:(id)a3;
- (_HKBridgeSetupConfiguration)configuration;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addEmergencyContactToData:(id)a3;
- (void)_presentEmergencyContactPicker;
- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4;
- (void)emergencyContactFlowDidCancel:(id)a3;
- (void)emergencyContactRelationshipPicker:(id)a3 didChooseRelationshipNamed:(id)a4;
- (void)emergencyContactRelationshipPickerDidCancel:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateTableViewHeight;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HKBridgeSetupEmergencyContactsController

- (HKBridgeSetupEmergencyContactsController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v42 = +[NSBundle bundleForClass:objc_opt_class()];
  v40 = [v42 localizedStringForKey:@"TINKER_EMERGENCY_CONTACTS_TITLE_%@" value:&stru_C4E8 table:@"Localizable-tinker"];
  v41 = [v4 familyMember];
  v39 = [v41 firstName];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, v39);
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"TINKER_EMERGENCY_CONTACTS_DETAIL_%@_%@" value:&stru_C4E8 table:@"Localizable-tinker"];
  v8 = [v4 familyMember];
  v9 = [v8 firstName];
  v10 = [v4 familyMember];
  v11 = [v10 firstName];
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9, v11);
  v43.receiver = self;
  v43.super_class = (Class)HKBridgeSetupEmergencyContactsController;
  v13 = [(HKBridgeSetupEmergencyContactsController *)&v43 initWithTitle:v5 detailText:v12 icon:0 adoptTableViewScrollView:0];

  if (v13)
  {
    v14 = (_HKBridgeSetupConfiguration *)[v4 copy];
    configuration = v13->_configuration;
    v13->_configuration = v14;

    uint64_t v16 = [(_HKBridgeSetupConfiguration *)v13->_configuration healthStore];
    healthStore = v13->_healthStore;
    v13->_healthStore = (HKHealthStore *)v16;

    uint64_t v18 = [(_HKBridgeSetupConfiguration *)v13->_configuration medicalIDStore];
    medicalIDStore = v13->_medicalIDStore;
    v13->_medicalIDStore = (HKMedicalIDStore *)v18;

    v20 = (_HKMedicalIDData *)objc_alloc_init((Class)_HKMedicalIDData);
    medicalIDData = v13->_medicalIDData;
    v13->_medicalIDData = v20;

    v13->_tableViewHeight = 0.0;
    id v22 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(HKBridgeSetupEmergencyContactsController *)v13 setTableView:v22];

    v23 = [(HKBridgeSetupEmergencyContactsController *)v13 tableView];
    [v23 setDataSource:v13];

    v24 = [(HKBridgeSetupEmergencyContactsController *)v13 tableView];
    [v24 setDelegate:v13];

    v25 = [(HKBridgeSetupEmergencyContactsController *)v13 tableView];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

    v26 = +[UIColor clearColor];
    v27 = [(HKBridgeSetupEmergencyContactsController *)v13 tableView];
    [v27 setBackgroundColor:v26];

    id v28 = objc_alloc_init((Class)UIView);
    v29 = [(HKBridgeSetupEmergencyContactsController *)v13 tableView];
    [v29 setTableHeaderView:v28];

    id v30 = objc_alloc_init((Class)UIView);
    v31 = [(HKBridgeSetupEmergencyContactsController *)v13 tableView];
    [v31 setTableFooterView:v30];

    v32 = [(HKBridgeSetupEmergencyContactsController *)v13 tableView];
    v33 = [v32 heightAnchor];
    v34 = [(HKBridgeSetupEmergencyContactsController *)v13 tableView];
    [v34 contentSize];
    uint64_t v36 = [v33 constraintEqualToConstant:v35];
    tableHeightAnchor = v13->_tableHeightAnchor;
    v13->_tableHeightAnchor = (NSLayoutConstraint *)v36;

    [(NSLayoutConstraint *)v13->_tableHeightAnchor setActive:1];
  }

  return v13;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HKBridgeSetupEmergencyContactsController;
  [(HKBridgeSetupEmergencyContactsController *)&v8 viewDidLoad];
  [(_HKMedicalIDData *)self->_medicalIDData updateEmergencyContactsAutopopulateForSecondaryProfileIfEmpty:1];
  v3 = +[OBBoldTrayButton boldButton];
  id v4 = BPSPillSelectedColor();
  [v3 setTintColor:v4];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"HEALTH_SUGGESTED_BUTTON_CONTINUE" value:&stru_C4E8 table:@"Localizable-tinker"];
  [v3 setTitle:v6 forState:0];

  [v3 addTarget:self action:"suggestedButtonPressed:" forControlEvents:64];
  v7 = [(HKBridgeSetupEmergencyContactsController *)self buttonTray];
  [v7 addButton:v3];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(HKBridgeSetupEmergencyContactsController *)self tableView];
  [v3 contentSize];
  double v5 = v4;
  double tableViewHeight = self->_tableViewHeight;

  if (v5 != tableViewHeight) {
    [(HKBridgeSetupEmergencyContactsController *)self updateTableViewHeight];
  }
  v7.receiver = self;
  v7.super_class = (Class)HKBridgeSetupEmergencyContactsController;
  [(HKBridgeSetupEmergencyContactsController *)&v7 viewDidLayoutSubviews];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
  double v5 = (char *)[v4 count] + 1;

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 row];
  v9 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
  id v10 = [v9 count];

  if (v8 == v10)
  {
    v11 = [v7 dequeueReusableCellWithIdentifier:@"HKBridgeSetupAddContactTableViewCellIdentifier"];

    if (!v11) {
      v11 = [[HKBridgeSetupAddContactCell alloc] initWithStyle:0 reuseIdentifier:@"HKBridgeSetupAddContactTableViewCellIdentifier"];
    }
  }
  else
  {
    v11 = [v7 dequeueReusableCellWithIdentifier:@"HKBridgeSetupContactTableViewCellIdentifier"];

    if (!v11) {
      v11 = [[HKBridgeSetupContactCell alloc] initWithStyle:1 reuseIdentifier:@"HKBridgeSetupContactTableViewCellIdentifier"];
    }
    v12 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
    v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    v14 = [v13 name];
    v15 = [(HKBridgeSetupAddContactCell *)v11 textLabel];
    [v15 setText:v14];

    uint64_t v16 = [v13 phoneNumber];
    v17 = [(HKBridgeSetupAddContactCell *)v11 detailTextLabel];
    [v17 setText:v16];
  }

  return v11;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(a4, "row", a3);
  id v6 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
  id v7 = [v6 count];

  if (v5 == v7)
  {
    [(HKBridgeSetupEmergencyContactsController *)self _presentEmergencyContactPicker];
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(a4, "row", a3);
  id v6 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
  int64_t v7 = v5 != [v6 count];

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4 == 1)
  {
    id v11 = [v9 row];
    v12 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
    id v13 = [v12 count];

    if (v11 != v13)
    {
      v14 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
      v15 = +[NSMutableArray arrayWithArray:v14];

      objc_msgSend(v15, "removeObjectAtIndex:", objc_msgSend(v10, "row"));
      [(_HKMedicalIDData *)self->_medicalIDData setEmergencyContacts:v15];
      [v8 beginUpdates];
      v17 = v10;
      uint64_t v16 = +[NSArray arrayWithObjects:&v17 count:1];
      [v8 deleteRowsAtIndexPaths:v16 withRowAnimation:0];

      [v8 endUpdates];
    }
  }
}

- (void)suggestedButtonPressed:(id)a3
{
  [(HKMedicalIDStore *)self->_medicalIDStore updateMedicalIDData:self->_medicalIDData completion:0];
  id v4 = [(HKBridgeSetupEmergencyContactsController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (void)emergencyContactRelationshipPicker:(id)a3 didChooseRelationshipNamed:(id)a4
{
  [(_HKEmergencyContact *)self->_selectedContact setRelationship:a4];
  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

  id v6 = [(HKBridgeSetupEmergencyContactsController *)self presentedViewController];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)emergencyContactRelationshipPickerDidCancel:(id)a3
{
  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

  id v5 = [(HKBridgeSetupEmergencyContactsController *)self presentedViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4
{
  [(HKBridgeSetupEmergencyContactsController *)self _addEmergencyContactToData:a4];
  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;
}

- (void)emergencyContactFlowDidCancel:(id)a3
{
  self->_selectedContact = 0;
  _objc_release_x1();
}

- (void)updateTableViewHeight
{
  v3 = [(HKBridgeSetupEmergencyContactsController *)self view];
  [v3 layoutIfNeeded];

  id v4 = [(HKBridgeSetupEmergencyContactsController *)self tableView];
  [v4 contentSize];
  self->_double tableViewHeight = v5;

  double tableViewHeight = self->_tableViewHeight;
  tableHeightAnchor = self->_tableHeightAnchor;

  [(NSLayoutConstraint *)tableHeightAnchor setConstant:tableViewHeight];
}

- (void)_presentEmergencyContactPicker
{
  v3 = (HKMedicalIDEmergencyContactFlow *)[objc_alloc((Class)HKMedicalIDEmergencyContactFlow) initWithPresentingViewController:self forMedicalIDData:self->_medicalIDData];
  contactPicker = self->_contactPicker;
  self->_contactPicker = v3;

  [(HKMedicalIDEmergencyContactFlow *)self->_contactPicker setIsSecondaryProfile:1];
  [(HKMedicalIDEmergencyContactFlow *)self->_contactPicker setDelegate:self];
  double v5 = self->_contactPicker;

  [(HKMedicalIDEmergencyContactFlow *)v5 presentEmergencyContactFlow];
}

- (void)_addEmergencyContactToData:(id)a3
{
  id v4 = a3;
  double v5 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
  if (v5)
  {
    id v6 = v5;
    int64_t v7 = [v5 arrayByAddingObject:v4];
  }
  else
  {
    id v9 = v4;
    int64_t v7 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  [(_HKMedicalIDData *)self->_medicalIDData setEmergencyContacts:v7];
  [(HKMedicalIDStore *)self->_medicalIDStore updateMedicalIDData:self->_medicalIDData completion:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5360;
  block[3] = &unk_C410;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (_HKBridgeSetupConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->miniFlowDelegate);
  objc_storeStrong((id *)&self->_selectedContact, 0);
  objc_storeStrong((id *)&self->_contactPicker, 0);
  objc_storeStrong((id *)&self->_tableHeightAnchor, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_medicalIDData, 0);
}

@end