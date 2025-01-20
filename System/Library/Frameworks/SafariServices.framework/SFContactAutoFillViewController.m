@interface SFContactAutoFillViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)canDrillInCellAtIndexPath:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (SFContactAutoFillViewController)initWithMatches:(id)a3 contact:(id)a4;
- (SFContactAutoFillViewControllerFiller)autoFiller;
- (id)_valueForProperty:(id)a3 identifier:(id)a4;
- (id)matchesForProperty:(id)a3;
- (id)properties;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)valuesFromPropertyMatches:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancel:(id)a3;
- (void)autoFill:(id)a3;
- (void)setAutoFiller:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SFContactAutoFillViewController

- (SFContactAutoFillViewController)initWithMatches:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFContactAutoFillViewController;
  v8 = [(SFContactAutoFillViewController *)&v13 initWithStyle:0];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    matches = v8->_matches;
    v8->_matches = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_contact, a4);
    v11 = v8;
  }

  return v8;
}

- (id)_valueForProperty:(id)a3 identifier:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4FB6EF0] contactKeyForString:v6];
  if ([v6 isEqualToString:*MEMORY[0x1E4F99020]])
  {
    uint64_t v9 = [MEMORY[0x1E4F1B910] stringFromContact:self->_contact style:0];
    goto LABEL_53;
  }
  if ([v8 isEqualToString:*MEMORY[0x1E4F1AF10]])
  {
    [(CNContact *)self->_contact postalAddresses];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v65 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v59;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v16 = [v15 identifier];
          char v17 = [v16 isEqualToString:v7];

          if (v17)
          {
            v21 = (void *)MEMORY[0x1E4F1BA88];
            v22 = [v15 value];
            uint64_t v23 = [v21 stringFromPostalAddress:v22 style:0];
            goto LABEL_16;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:v65 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    goto LABEL_49;
  }
  if ([v8 isEqualToString:*MEMORY[0x1E4F1AD90]])
  {
    id v10 = [(CNContact *)self->_contact birthday];
    v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v19 = [v18 dateFromComponents:v10];
    id v20 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v20 setLocalizedDateFormatFromTemplate:@"dMy"];
    uint64_t v9 = [v20 stringFromDate:v19];

LABEL_18:
    goto LABEL_53;
  }
  if ([v8 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    [(CNContact *)self->_contact phoneNumbers];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v10 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v55;
      while (2)
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v55 != v26) {
            objc_enumerationMutation(v10);
          }
          v28 = *(void **)(*((void *)&v54 + 1) + 8 * j);
          v29 = [v28 identifier];
          char v30 = [v29 isEqualToString:v7];

          if (v30)
          {
            v22 = [v28 value];
            uint64_t v23 = [v22 stringValue];
LABEL_16:
            uint64_t v9 = (void *)v23;

            goto LABEL_17;
          }
        }
        uint64_t v25 = [v10 countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
    goto LABEL_49;
  }
  if ([v8 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    [(CNContact *)self->_contact emailAddresses];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v10 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v51;
LABEL_32:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v51 != v33) {
          objc_enumerationMutation(v10);
        }
        v35 = *(void **)(*((void *)&v50 + 1) + 8 * v34);
        v36 = [v35 identifier];
        char v37 = [v36 isEqualToString:v7];

        if (v37) {
          break;
        }
        if (v32 == ++v34)
        {
          uint64_t v32 = [v10 countByEnumeratingWithState:&v50 objects:v63 count:16];
          if (v32) {
            goto LABEL_32;
          }
          goto LABEL_49;
        }
      }
LABEL_56:
      uint64_t v9 = [v35 value];
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_49;
  }
  if ([v8 isEqualToString:*MEMORY[0x1E4F1AFB0]])
  {
    [(CNContact *)self->_contact urlAddresses];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = [v10 countByEnumeratingWithState:&v46 objects:v62 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v47;
LABEL_43:
      uint64_t v41 = 0;
      while (1)
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(v10);
        }
        v35 = *(void **)(*((void *)&v46 + 1) + 8 * v41);
        v42 = objc_msgSend(v35, "identifier", (void)v46);
        char v43 = [v42 isEqualToString:v7];

        if (v43) {
          goto LABEL_56;
        }
        if (v39 == ++v41)
        {
          uint64_t v39 = [v10 countByEnumeratingWithState:&v46 objects:v62 count:16];
          if (v39) {
            goto LABEL_43;
          }
          break;
        }
      }
    }
LABEL_49:
  }
  v44 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
    -[SFContactAutoFillViewController _valueForProperty:identifier:]((uint64_t)v6, v44);
  }
  uint64_t v9 = 0;
LABEL_53:

  return v9;
}

- (id)properties
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  propertyValues = self->_propertyValues;
  if (!propertyValues)
  {
    uint64_t v27 = 1040;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v5 = self->_matches;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "property", v27);
          char v12 = [v4 containsObject:v11];

          if ((v12 & 1) == 0)
          {
            uint64_t v13 = [v10 property];
            [v4 addObject:v13];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v7);
    }

    v14 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = v4;
    uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          id v20 = -[SFContactAutoFillViewController matchesForProperty:](self, "matchesForProperty:", v19, v27);
          v21 = [(SFContactAutoFillViewController *)self valuesFromPropertyMatches:v20];
          v22 = [SFContactAutoFillPropertyValues alloc];
          uint64_t v23 = [MEMORY[0x1E4FB6EF0] contactKeyForString:v19];
          uint64_t v24 = [(SFContactAutoFillPropertyValues *)v22 initWithValues:v21 property:v23];
          [v14 addObject:v24];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v16);
    }

    uint64_t v25 = *(Class *)((char *)&self->super.super.super.super.isa + v27);
    *(Class *)((char *)&self->super.super.super.super.isa + v27) = (Class)v14;

    propertyValues = *(NSArray **)((char *)&self->super.super.super.super.isa + v27);
  }

  return propertyValues;
}

- (id)matchesForProperty:(id)a3
{
  id v4 = a3;
  matches = self->_matches;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SFContactAutoFillViewController_matchesForProperty___block_invoke;
  v9[3] = &unk_1E5C75C30;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSArray *)matches safari_filterObjectsUsingBlock:v9];

  return v7;
}

uint64_t __54__SFContactAutoFillViewController_matchesForProperty___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 property];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)valuesFromPropertyMatches:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        char v12 = [v11 identifier];
        uint64_t v13 = [v12 length];

        if (!v13)
        {
          uint64_t v25 = [SFContactAutoFillValue alloc];
          char v37 = v11;
          uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
          uint64_t v27 = [MEMORY[0x1E4FB6EF0] valueStringForMatch:v11];
          v28 = [(SFContactAutoFillValue *)v25 initWithMatches:v26 displayValue:v27 label:0];

          long long v36 = v28;
          uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];

          id v23 = v6;
          goto LABEL_13;
        }
        v14 = [v11 identifier];
        uint64_t v15 = [v5 objectForKey:v14];

        if (!v15)
        {
          uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v17 = [v11 identifier];
          [v5 setObject:v16 forKey:v17];
        }
        v18 = [v11 identifier];
        uint64_t v19 = [v5 objectForKey:v18];
        [v19 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v20 = [MEMORY[0x1E4F1CA48] array];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __61__SFContactAutoFillViewController_valuesFromPropertyMatches___block_invoke;
  v30[3] = &unk_1E5C75C58;
  v30[4] = self;
  id v21 = v20;
  id v31 = v21;
  [v5 enumerateKeysAndObjectsUsingBlock:v30];
  v22 = v31;
  id v23 = v21;

  uint64_t v24 = v23;
LABEL_13:

  return v24;
}

void __61__SFContactAutoFillViewController_valuesFromPropertyMatches___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [SFContactAutoFillValue alloc];
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v5 firstObject];
  id v10 = [v9 property];
  uint64_t v11 = [v8 _valueForProperty:v10 identifier:v6];

  char v12 = (void *)MEMORY[0x1E4F1BA20];
  uint64_t v13 = [v5 firstObject];
  v14 = [v13 label];
  uint64_t v15 = [v12 localizedStringForLabel:v14];
  uint64_t v16 = [(SFContactAutoFillValue *)v7 initWithMatches:v5 displayValue:v11 label:v15];

  [*(id *)(a1 + 40) addObject:v16];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)SFContactAutoFillViewController;
  [(SFContactAutoFillViewController *)&v12 viewDidLoad];
  v3 = [(SFContactAutoFillViewController *)self navigationItem];
  id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v5 = _WBSLocalizedString();
  id v6 = (void *)[v4 initWithTitle:v5 style:0 target:self action:sel__cancel_];
  [v3 setLeftBarButtonItem:v6];

  id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v8 = _WBSLocalizedString();
  uint64_t v9 = (void *)[v7 initWithTitle:v8 style:2 target:self action:sel_autoFill_];
  [v3 setRightBarButtonItem:v9];

  id v10 = [(SFContactAutoFillViewController *)self tableView];
  [v10 registerClass:objc_opt_class() forCellReuseIdentifier:@"cell"];
  id v11 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v10 setTableFooterView:v11];

  [v10 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v10 setEstimatedRowHeight:100.0];
  objc_msgSend(v10, "setSeparatorInset:", 0.0, 14.0 * 2.0 + 22.0, 0.0, 0.0);
}

- (void)_cancel:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFiller);
  [WeakRetained dismissCustomAutoFill];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFContactAutoFillViewController;
  [(SFContactAutoFillViewController *)&v5 viewWillAppear:a3];
  id v4 = [(SFContactAutoFillViewController *)self tableView];
  [v4 reloadData];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)autoFill:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  objc_super v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(SFContactAutoFillViewController *)self properties];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v16 + 1) + 8 * v10) selectedValue];
        int v12 = [v11 selected];
        uint64_t v13 = [v11 matches];
        if (v12) {
          v14 = v4;
        }
        else {
          v14 = v5;
        }
        [v14 addObjectsFromArray:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFiller);
  [WeakRetained performAutoFillWithMatchSelections:v4 doNotFill:v5 contact:self->_contact];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [(SFContactAutoFillViewController *)self properties];
  uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  uint64_t v9 = [v8 values];
  unint64_t v10 = [v9 count];

  if (v10 >= 2)
  {
    id v11 = [[SFContactAutoFillDetailViewController alloc] initWithPropertyValues:v8];
    int v12 = [(SFContactAutoFillViewController *)self navigationController];
    [v12 pushViewController:v11 animated:1];

    [v13 deselectRowAtIndexPath:v6 animated:0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(SFContactAutoFillViewController *)self properties];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"cell" forIndexPath:v6];
  uint64_t v8 = [(SFContactAutoFillViewController *)self properties];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  LODWORD(self) = [(SFContactAutoFillViewController *)self canDrillInCellAtIndexPath:v6];
  [v7 setAccessoryType:self];
  if (self) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  [v7 setSelectionStyle:v10];
  [v7 setUsesDetailAppearance:0];
  id v11 = [v9 selectedValue];
  int v12 = [v9 property];
  [v7 setValue:v11 property:v12];

  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return [(SFContactAutoFillViewController *)self canDrillInCellAtIndexPath:a4];
}

- (BOOL)canDrillInCellAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SFContactAutoFillViewController *)self properties];
  uint64_t v6 = [v4 row];

  uint64_t v7 = [v5 objectAtIndexedSubscript:v6];

  uint64_t v8 = [v7 values];
  LOBYTE(v6) = (unint64_t)[v8 count] > 1;

  return v6;
}

- (SFContactAutoFillViewControllerFiller)autoFiller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFiller);

  return (SFContactAutoFillViewControllerFiller *)WeakRetained;
}

- (void)setAutoFiller:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_autoFiller);
  objc_storeStrong((id *)&self->_propertyValues, 0);
  objc_storeStrong((id *)&self->_matches, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)_valueForProperty:(uint64_t)a1 identifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Failed to find display value for %{public}@ property in contact card", (uint8_t *)&v2, 0xCu);
}

@end