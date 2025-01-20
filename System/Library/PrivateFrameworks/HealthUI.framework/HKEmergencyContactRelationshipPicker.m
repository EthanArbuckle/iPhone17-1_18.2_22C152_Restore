@interface HKEmergencyContactRelationshipPicker
- (HKEmergencyContactRelationshipPicker)init;
- (HKEmergencyContactRelationshipPickerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HKEmergencyContactRelationshipPicker

- (HKEmergencyContactRelationshipPicker)init
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)HKEmergencyContactRelationshipPicker;
  v2 = [(HKTableViewController *)&v41 init];
  if (v2)
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2050000000;
    v3 = (void *)getCNLabeledValueClass_softClass;
    uint64_t v46 = getCNLabeledValueClass_softClass;
    if (!getCNLabeledValueClass_softClass)
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __getCNLabeledValueClass_block_invoke;
      v42[3] = &unk_1E6D514F8;
      v42[4] = &v43;
      __getCNLabeledValueClass_block_invoke((uint64_t)v42);
      v3 = (void *)v44[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v43, 8);
    v5 = [v4 builtinLabelsForProperty:*MEMORY[0x1E4F1AF50]];
    v6 = (void *)[v5 mutableCopy];

    v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v8 = [v7 localizedStringForKey:@"relationship_roommate" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [v6 addObject:v8];

    v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v10 = [v9 localizedStringForKey:@"relationship_doctor" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [v6 addObject:v10];

    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v12 = [v11 localizedStringForKey:@"relationship_emergency" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [v6 addObject:v12];

    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = [v13 localizedStringForKey:@"relationship_family_member" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    [v6 addObject:v14];

    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v16 = [v15 localizedStringForKey:@"relationship_teacher" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    [v6 addObject:v16];

    v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v18 = [v17 localizedStringForKey:@"relationship_caretaker" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    [v6 addObject:v18];

    v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v20 = [v19 localizedStringForKey:@"relationship_guardian" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    [v6 addObject:v20];

    v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v22 = [v21 localizedStringForKey:@"relationship_social_worker" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    [v6 addObject:v22];

    v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v24 = [v23 localizedStringForKey:@"relationship_school" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    [v6 addObject:v24];

    v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v26 = [v25 localizedStringForKey:@"relationship_daycare" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    [v6 addObject:v26];

    v27 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v28 = v6;
    uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v38;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v28);
          }
          v32 = objc_msgSend(v4, "localizedStringForLabel:", *(void *)(*((void *)&v37 + 1) + 8 * v31), (void)v37);
          [(NSArray *)v27 addObject:v32];

          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v29);
    }

    tokens = v2->_tokens;
    v2->_tokens = v28;
    v34 = v28;

    labels = v2->_labels;
    v2->_labels = v27;
  }
  return v2;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HKEmergencyContactRelationshipPicker;
  [(HKTableViewController *)&v8 viewDidLoad];
  v3 = [(HKEmergencyContactRelationshipPicker *)self tableView];
  [v3 setEstimatedRowHeight:44.0];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelTapped_];
  v5 = [(HKEmergencyContactRelationshipPicker *)self navigationItem];
  [v5 setLeftBarButtonItem:v4];

  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"emergency_contact_relationship" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKEmergencyContactRelationshipPicker *)self setTitle:v7];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_labels count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"reuseIdentifier"];
  }
  objc_super v8 = -[NSArray objectAtIndexedSubscript:](self->_labels, "objectAtIndexedSubscript:", [v6 row]);
  v9 = [v7 textLabel];
  [v9 setText:v8];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  tokens = self->_tokens;
  uint64_t v8 = [v6 row];

  v9 = [(NSArray *)tokens objectAtIndexedSubscript:v8];
  [WeakRetained emergencyContactRelationshipPicker:self didChooseRelationshipNamed:v9];
}

- (void)_cancelTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained emergencyContactRelationshipPickerDidCancel:self];
}

- (HKEmergencyContactRelationshipPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKEmergencyContactRelationshipPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end