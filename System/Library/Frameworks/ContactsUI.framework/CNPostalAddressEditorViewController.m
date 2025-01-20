@interface CNPostalAddressEditorViewController
+ (id)cellIdentifierForClass:(Class)a3;
+ (id)cellIdentifierForEditingProperty:(id)a3;
- (CNPostalAddressEditorViewController)initWithContact:(id)a3 propertyKey:(id)a4 editNames:(BOOL)a5;
- (double)tableViewSpacingForExtraSeparators:(id)a3;
- (id)contactViewCache;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_rebuildPropertyGroupItems:(BOOL)a3;
- (void)_startEditingFirstCell;
- (void)cancel:(id)a3;
- (void)done:(id)a3;
- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewLabel:(id)a5;
- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewValue:(id)a5;
- (void)propertyCellDidChangeLayout:(id)a3;
- (void)registerContactCellClass:(Class)a3;
- (void)sender:(id)a3 dismissViewController:(id)a4;
- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (void)sender:(id)a3 presentViewController:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)validateContents;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CNPostalAddressEditorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyGroup, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_propertyKey, 0);

  objc_storeStrong((id *)&self->_propertyItems, 0);
}

- (id)contactViewCache
{
  return 0;
}

- (void)propertyCellDidChangeLayout:(id)a3
{
  id v6 = a3;
  v4 = [(CNPostalAddressEditorViewController *)self tableView];
  v5 = [v4 indexPathForCell:v6];
  if (v5)
  {
    [v6 setValue:MEMORY[0x1E4F1CC38] forKey:@"needsHeightCalculation"];
    [v4 _heightForRowAtIndexPath:v5];
    objc_msgSend(v4, "_setHeight:forRowAtIndexPath:", v5);
  }
}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewValue:(id)a5
{
  id v9 = a3;
  id v8 = a4;
  [v8 updateLabeledValueWithValue:a5];
  [(CNPostalAddressEditorViewController *)self validateContents];
  if (objc_opt_respondsToSelector()) {
    [v9 updateWithPropertyItem:v8];
  }
}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewLabel:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  [v7 updateLabeledValueWithLabel:a5];
  [v8 updateWithPropertyItem:v7];
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__CNPostalAddressEditorViewController_sender_dismissViewController_completionHandler___block_invoke;
  v8[3] = &unk_1E549B8A0;
  id v9 = v6;
  id v7 = v6;
  [a4 dismissViewControllerAnimated:1 completion:v8];
}

uint64_t __86__CNPostalAddressEditorViewController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v11 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v11;
    id v6 = [(CNPostalAddressEditorViewController *)self navigationController];
    id v7 = [v6 navigationBar];
    id v8 = [v7 tintColor];

    id v9 = [v5 navigationBar];
    [v9 setTintColor:v8];

    v10 = [v5 view];

    [v10 setTintColor:v8];
  }
  [(CNPostalAddressEditorViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = -[NSMutableArray objectAtIndex:](self->_propertyItems, "objectAtIndex:", [a4 indexAtPosition:1]);
  id v6 = [v5 property];
  id v7 = [(id)objc_opt_class() cellIdentifierForEditingProperty:v6];
  id v8 = [(CNPostalAddressEditorViewController *)self tableView];
  id v9 = [v8 dequeueReusableCellWithIdentifier:v7];

  [v9 setCardGroupItem:v5];
  uint64_t v10 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  [v9 separatorInset];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if ([v6 isEqualToString:*MEMORY[0x1E4F1AF10]]
    || ([v6 isEqualToString:*MEMORY[0x1E4F1ADC8]] & 1) != 0
    || [v6 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    [v9 setPresentingDelegate:self];
    [v9 setDelegate:self];
    [v9 setLabelWidth:110.0];
    v17 = [v9 labelButton];
    [v17 titleEdgeInsets];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    if (v10 == 1) {
      double v25 = 20.0;
    }
    else {
      double v21 = 20.0;
    }
    v26 = [v9 labelButton];
    objc_msgSend(v26, "setTitleEdgeInsets:", v19, v21, v23, v25);
  }
  else
  {
    objc_msgSend(v9, "setSeparatorInset:", v12, 154.0, v14, v16);
  }

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSMutableArray *)self->_propertyItems count];
}

- (void)registerContactCellClass:(Class)a3
{
  id v6 = [(id)objc_opt_class() cellIdentifierForClass:a3];
  id v5 = [(CNPostalAddressEditorViewController *)self tableView];
  [v5 registerClass:a3 forCellReuseIdentifier:v6];
}

- (void)_startEditingFirstCell
{
  v2 = [(CNPostalAddressEditorViewController *)self tableView];
  v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v5 = [v2 cellForRowAtIndexPath:v3];

  v4 = [v5 firstResponderItem];
  [v4 becomeFirstResponder];
}

- (void)validateContents
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1ADC8];
  if ([(NSString *)self->_propertyKey isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v4 = self->_propertyItems;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      char v7 = 0;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          double v11 = [v10 property];
          if ([v11 isEqualToString:v3])
          {
            double v12 = [v10 displayValue];
            uint64_t v13 = [v12 length];

            if (v13) {
              char v7 = 1;
            }
          }
          else
          {
          }
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v6);
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F1AEE0];
    if (![(NSString *)self->_propertyKey isEqualToString:*MEMORY[0x1E4F1AEE0]])
    {
      BOOL v23 = [(NSString *)self->_propertyKey isEqualToString:*MEMORY[0x1E4F1AF10]];
      goto LABEL_30;
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v4 = self->_propertyItems;
    uint64_t v15 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      char v7 = 0;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v4);
          }
          double v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          double v20 = objc_msgSend(v19, "property", (void)v26);
          if ([v20 isEqualToString:v14])
          {
            double v21 = [v19 displayValue];
            uint64_t v22 = [v21 length];

            if (v22) {
              char v7 = 1;
            }
          }
          else
          {
          }
        }
        uint64_t v16 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v16);
      goto LABEL_28;
    }
  }
  char v7 = 0;
LABEL_28:

  BOOL v23 = v7 & 1;
LABEL_30:
  double v24 = [(CNPostalAddressEditorViewController *)self navigationItem];
  double v25 = [v24 rightBarButtonItem];
  [v25 setEnabled:v23];
}

- (void)done:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = [(CNPostalAddressEditorViewController *)self navigationController];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_propertyItems;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "saveChangesImmediately:", 0, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [v4 doneWithContact:self->_contact propertyKey:self->_propertyKey];
}

- (void)cancel:(id)a3
{
  id v4 = [(CNPostalAddressEditorViewController *)self navigationController];
  uint64_t v3 = [v4 addressEditorDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 postalAddressEditorDidCancel:v4];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNPostalAddressEditorViewController;
  [(CNPostalAddressEditorViewController *)&v4 viewDidAppear:a3];
  [(CNPostalAddressEditorViewController *)self _startEditingFirstCell];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CNPostalAddressEditorViewController;
  [(CNPostalAddressEditorViewController *)&v6 viewDidLoad];
  [(CNPostalAddressEditorViewController *)self registerContactCellClass:objc_opt_class()];
  [(CNPostalAddressEditorViewController *)self registerContactCellClass:objc_opt_class()];
  [(CNPostalAddressEditorViewController *)self registerContactCellClass:objc_opt_class()];
  uint64_t v3 = [(CNPostalAddressEditorViewController *)self navigationItem];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
  [v3 setLeftBarButtonItem:v4];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
  if (![(NSString *)self->_propertyKey isEqualToString:*MEMORY[0x1E4F1ADE0]]) {
    [v5 setEnabled:0];
  }
  [v3 setRightBarButtonItem:v5];
}

- (void)_rebuildPropertyGroupItems:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  propertyItems = self->_propertyItems;
  self->_propertyItems = v5;

  if (v3)
  {
    uint64_t v7 = objc_alloc_init(ABPostalNameGroupItem);
    [(ABPostalNameGroupItem *)v7 setContact:self->_contact];
    uint64_t v8 = [(CNMutableContact *)self->_contact givenName];
    [(ABPostalNameGroupItem *)v7 setValue:v8];

    [(ABPostalNameGroupItem *)v7 setProperty:*MEMORY[0x1E4F1ADF0]];
    uint64_t v9 = (void *)MEMORY[0x1E4F1B8F8];
    uint64_t v10 = [(ABPostalNameGroupItem *)v7 property];
    long long v11 = [v9 localizedStringForKey:v10];
    [(ABPostalNameGroupItem *)v7 setPlaceholder:v11];

    [(ABPostalNameGroupItem *)v7 setSetter:sel_setGivenName_];
    long long v12 = objc_alloc_init(ABPostalNameGroupItem);
    [(ABPostalNameGroupItem *)v12 setContact:self->_contact];
    long long v13 = [(CNMutableContact *)self->_contact familyName];
    [(ABPostalNameGroupItem *)v12 setValue:v13];

    [(ABPostalNameGroupItem *)v12 setProperty:*MEMORY[0x1E4F1ADE0]];
    long long v14 = (void *)MEMORY[0x1E4F1B8F8];
    uint64_t v15 = [(ABPostalNameGroupItem *)v12 property];
    uint64_t v16 = [v14 localizedStringForKey:v15];
    [(ABPostalNameGroupItem *)v12 setPlaceholder:v16];

    [(ABPostalNameGroupItem *)v12 setSetter:sel_setFamilyName_];
    uint64_t v17 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
    uint64_t v18 = [v17 displayNameOrder];

    if (v18 == 1) {
      double v19 = v7;
    }
    else {
      double v19 = v12;
    }
    if (v18 == 1) {
      double v20 = v12;
    }
    else {
      double v20 = v7;
    }
    [(NSMutableArray *)self->_propertyItems addObject:v19];
    [(NSMutableArray *)self->_propertyItems addObject:v20];
  }
  uint64_t v21 = *MEMORY[0x1E4F1AF10];
  if ([(NSString *)self->_propertyKey isEqualToString:*MEMORY[0x1E4F1AF10]])
  {
    p_contact = &self->_contact;
    contact = self->_contact;
    double v24 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
    double v25 = +[CNCardPropertyGroup groupForProperty:v21 contact:contact store:0 policy:v24 linkedPolicies:0];
    p_propertyGroup = &self->_propertyGroup;
    propertyGroup = self->_propertyGroup;
    self->_propertyGroup = v25;

    long long v28 = [(CNMutableContact *)self->_contact postalAddresses];
    id v46 = [v28 lastObject];

    uint64_t v29 = (uint64_t)v46;
    if (!v46)
    {
      long long v30 = (void *)MEMORY[0x1E4F1BA20];
      id v31 = objc_alloc_init(MEMORY[0x1E4F1BA80]);
LABEL_12:
      long long v32 = v31;
      id v47 = [v30 labeledValueWithLabel:0 value:v31];

      uint64_t v29 = (uint64_t)v47;
    }
  }
  else
  {
    uint64_t v33 = *MEMORY[0x1E4F1ADC8];
    if ([(NSString *)self->_propertyKey isEqualToString:*MEMORY[0x1E4F1ADC8]])
    {
      p_contact = &self->_contact;
      v34 = self->_contact;
      v35 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
      uint64_t v36 = +[CNCardPropertyGroup groupForProperty:v33 contact:v34 store:0 policy:v35 linkedPolicies:0];
      p_propertyGroup = &self->_propertyGroup;
      v37 = self->_propertyGroup;
      self->_propertyGroup = v36;

      v38 = [(CNMutableContact *)self->_contact emailAddresses];
      id v48 = [v38 lastObject];

      uint64_t v29 = (uint64_t)v48;
      if (!v48)
      {
        uint64_t v29 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:&stru_1ED8AC728];
      }
      goto LABEL_18;
    }
    uint64_t v39 = *MEMORY[0x1E4F1AEE0];
    if (![(NSString *)self->_propertyKey isEqualToString:*MEMORY[0x1E4F1AEE0]]) {
      return;
    }
    p_contact = &self->_contact;
    v40 = self->_contact;
    v41 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
    v42 = +[CNCardPropertyGroup groupForProperty:v39 contact:v40 store:0 policy:v41 linkedPolicies:0];
    p_propertyGroup = &self->_propertyGroup;
    v43 = self->_propertyGroup;
    self->_propertyGroup = v42;

    v44 = [(CNMutableContact *)self->_contact phoneNumbers];
    id v49 = [v44 lastObject];

    uint64_t v29 = (uint64_t)v49;
    if (!v49)
    {
      long long v30 = (void *)MEMORY[0x1E4F1BA20];
      id v31 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:&stru_1ED8AC728];
      goto LABEL_12;
    }
  }
LABEL_18:
  id v50 = (id)v29;
  v45 = +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:v29 group:*p_propertyGroup contact:*p_contact];
  [(NSMutableArray *)self->_propertyItems addObject:v45];
}

- (double)tableViewSpacingForExtraSeparators:(id)a3
{
  return 3.40282347e38;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNPostalAddressEditorViewController;
  [(CNPostalAddressEditorViewController *)&v7 viewWillAppear:a3];
  objc_super v4 = [(CNPostalAddressEditorViewController *)self view];
  objc_msgSend(v4, "_cnui_applyContactStyle");

  uint64_t v5 = [(CNPostalAddressEditorViewController *)self navigationController];
  objc_super v6 = [v5 navigationBar];
  objc_msgSend(v6, "_cnui_applyContactStyle");
}

- (CNPostalAddressEditorViewController)initWithContact:(id)a3 propertyKey:(id)a4 editNames:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNPostalAddressEditorViewController;
  uint64_t v10 = [(CNPostalAddressEditorViewController *)&v18 initWithStyle:0];
  long long v11 = v10;
  if (v10)
  {
    if (v8)
    {
      v10->_editingExistingContact = 1;
      long long v12 = (CNMutableContact *)[v8 mutableCopy];
    }
    else
    {
      long long v12 = (CNMutableContact *)objc_alloc_init(MEMORY[0x1E4F1BA40]);
    }
    contact = v11->_contact;
    v11->_contact = v12;

    uint64_t v14 = [v9 copy];
    propertyKey = v11->_propertyKey;
    v11->_propertyKey = (NSString *)v14;

    v11->_editNames = v5;
    [(CNPostalAddressEditorViewController *)v11 _rebuildPropertyGroupItems:v5];
    uint64_t v16 = [(CNPostalAddressEditorViewController *)v11 navigationItem];
    [v16 setLargeTitleDisplayMode:2];
  }
  return v11;
}

+ (id)cellIdentifierForClass:(Class)a3
{
  BOOL v3 = NSString;
  Name = class_getName(a3);

  return (id)[v3 stringWithCString:Name encoding:1];
}

+ (id)cellIdentifierForEditingProperty:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F1AF10]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADC8]] & 1) == 0)
  {
    [v3 isEqualToString:*MEMORY[0x1E4F1AEE0]];
  }
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(id)objc_opt_class() cellIdentifierForClass:v4];

  return v5;
}

@end