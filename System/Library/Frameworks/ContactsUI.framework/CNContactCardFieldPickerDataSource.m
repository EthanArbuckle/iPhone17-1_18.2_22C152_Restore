@interface CNContactCardFieldPickerDataSource
+ (BOOL)canSharePronounsForContacts:(id)a3;
+ (BOOL)isSharingMeContactForContacts:(id)a3;
+ (id)shareableNamePropertiesForContact:(id)a3;
- (BOOL)hasPhotoForContact:(id)a3;
- (BOOL)isFieldHidden:(id)a3;
- (CNContactCardFieldPickerDataSource)initWithContact:(id)a3;
- (CNContactCardFieldPickerDataSource)initWithContacts:(id)a3;
- (CNContactCardFieldPickerDataSource)initWithContacts:(id)a3 hiddenProperties:(id)a4;
- (NSArray)contacts;
- (NSArray)hiddenProperties;
- (NSArray)sections;
- (id)_loadSectionsForContacts;
- (id)firstContactContainingPhoto;
- (id)groupItemForIndexPath:(id)a3;
- (id)itemsForKey:(id)a3 forContact:(id)a4;
- (id)itemsForKey:(id)a3 forContacts:(id)a4;
- (id)keyForIndexPath:(id)a3;
- (id)shareableCardProperties;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)totalItemCount;
- (void)setContacts:(id)a3;
- (void)setHiddenProperties:(id)a3;
@end

@implementation CNContactCardFieldPickerDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenProperties, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)setHiddenProperties:(id)a3
{
}

- (NSArray)hiddenProperties
{
  return self->_hiddenProperties;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (id)shareableCardProperties
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = *MEMORY[0x1E4F1ADC8];
  v18[0] = *MEMORY[0x1E4F1AEE0];
  v18[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v3 addObjectsFromArray:v5];

  v6 = objc_opt_class();
  v7 = [(CNContactCardFieldPickerDataSource *)self contacts];
  LODWORD(v6) = [v6 canSharePronounsForContacts:v7];

  if (v6) {
    [v3 addObject:*MEMORY[0x1E4F1AD88]];
  }
  uint64_t v8 = *MEMORY[0x1E4F1AF10];
  v17[0] = *MEMORY[0x1E4F1AFB0];
  v17[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1ADB0];
  v17[2] = @"birthdays";
  v17[3] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  [v3 addObjectsFromArray:v10];

  v11 = objc_opt_class();
  v12 = [(CNContactCardFieldPickerDataSource *)self contacts];
  LODWORD(v11) = [v11 isSharingMeContactForContacts:v12];

  if (v11) {
    [v3 addObject:*MEMORY[0x1E4F1AF50]];
  }
  uint64_t v13 = *MEMORY[0x1E4F1AE60];
  v16[0] = *MEMORY[0x1E4F1AF78];
  v16[1] = v13;
  v16[2] = *MEMORY[0x1E4F1AED0];
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  [v3 addObjectsFromArray:v14];

  return v3;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v6 = [(CNContactCardFieldPickerDataSource *)self contacts];
  unint64_t v7 = [v6 count];

  if (v7 >= 2)
  {
    uint64_t v9 = [(CNContactCardFieldPickerDataSource *)self sections];
    v10 = [v9 objectAtIndexedSubscript:a4];

    uint64_t v8 = [v10 displayTitle];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(CNContactCardFieldPickerDataSource *)self sections];
  v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  v11 = [v10 items];
  v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));

  uint64_t v13 = [(CNContactCardFieldPickerDataSource *)self sections];
  uint64_t v14 = [v8 section];

  v15 = [v13 objectAtIndexedSubscript:v14];
  v16 = [v15 sectionType];
  LODWORD(v11) = [v16 isEqualToString:@"contactCardFieldPickerPhotoSection"];

  if (v11
    && ([(CNContactCardFieldPickerDataSource *)self contacts],
        v17 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = [v17 count],
        v17,
        v18 == 1))
  {
    id v19 = [v7 dequeueReusableCellWithIdentifier:@"contactCardFieldPickerPhotoCell"];
  }
  else
  {
    id v19 = [v7 dequeueReusableCellWithIdentifier:@"contactCardFieldPickerCell"];
    v20 = [(CNContactCardFieldPickerDataSource *)self contacts];
    objc_msgSend(v19, "setDisplaysValue:", objc_msgSend(v20, "count") == 1);

    [v19 setItem:v12];
  }
  if (!v19)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"CNContactCardFieldPickerDataSource.m" lineNumber:266 description:@"Cell is nil"];
  }
  [v19 setSelectionStyle:0];
  v21 = [MEMORY[0x1E4FB1618] clearColor];
  v22 = [v19 textLabel];
  [v22 setBackgroundColor:v21];

  return v19;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(CNContactCardFieldPickerDataSource *)self sections];
  v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 items];
  int64_t v8 = [v7 count];

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(CNContactCardFieldPickerDataSource *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)totalItemCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(CNContactCardFieldPickerDataSource *)self sections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        int64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) items];
        v5 += [v8 count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)firstContactContainingPhoto
{
  uint64_t v3 = [(CNContactCardFieldPickerDataSource *)self contacts];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__CNContactCardFieldPickerDataSource_firstContactContainingPhoto__block_invoke;
  v6[3] = &unk_1E549C040;
  v6[4] = self;
  uint64_t v4 = objc_msgSend(v3, "_cn_firstObjectPassingTest:", v6);

  return v4;
}

uint64_t __65__CNContactCardFieldPickerDataSource_firstContactContainingPhoto__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasPhotoForContact:a2];
}

- (BOOL)hasPhotoForContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 thumbnailImageData];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else if ([v3 isKeyAvailable:*MEMORY[0x1E4F1AE28]])
  {
    uint64_t v6 = [v3 imageData];
    BOOL v5 = v6 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)groupItemForIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNContactCardFieldPickerDataSource *)self sections];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

  id v7 = [v6 items];
  uint64_t v8 = [v4 row];

  uint64_t v9 = [v7 objectAtIndexedSubscript:v8];
  long long v10 = [v9 groupItem];

  return v10;
}

- (id)keyForIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNContactCardFieldPickerDataSource *)self sections];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

  id v7 = [v6 sectionType];
  int v8 = [v7 isEqualToString:@"contactCardFieldPickerPhotoSection"];

  if (v8)
  {
    id v9 = (id)*MEMORY[0x1E4F1AE28];
  }
  else
  {
    long long v10 = [v6 items];
    long long v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    long long v12 = [v11 groupItem];
    id v9 = [v12 property];
  }

  return v9;
}

- (id)itemsForKey:(id)a3 forContact:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:*MEMORY[0x1E4F1AE28]])
  {
    if ([(CNContactCardFieldPickerDataSource *)self hasPhotoForContact:v7])
    {
      v31 = +[CNContactCardFieldItem photoItem];
      v39[0] = v31;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    }
    else
    {
      id v8 = (id)MEMORY[0x1E4F1CBF0];
    }
    goto LABEL_22;
  }
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = +[CNCardPropertyGroup groupForProperty:v6 contact:v7 store:0 policy:0 linkedPolicies:0];
  long long v10 = [v7 valueForKey:v6];
  if (+[CNContactView isMultiValueProperty:v6])
  {
    v29 = v10;
    id v30 = v6;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      uint64_t v14 = *MEMORY[0x1E4F5A2A0];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = v9;
          v17 = v9;
          id v18 = v7;
          id v19 = +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:group:contact:](CNPropertyGroupItem, "propertyGroupItemWithLabeledValue:group:contact:", *(void *)(*((void *)&v34 + 1) + 8 * i), v17, v7, v29, v30);
          v20 = [v19 displayValue];
          int v21 = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v20);

          if (v21)
          {
            v22 = [[CNContactCardFieldItem alloc] initWithGroupItem:v19];
            [v32 addObject:v22];
          }
          id v7 = v18;
          id v9 = v16;
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v12);
    }

    long long v10 = v29;
    id v6 = v30;
    goto LABEL_18;
  }
  v23 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v10];
  v24 = +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:v23 group:v9 contact:v7];
  uint64_t v25 = *MEMORY[0x1E4F5A2A0];
  v26 = [v24 displayValue];
  LODWORD(v25) = (*(uint64_t (**)(uint64_t, void *))(v25 + 16))(v25, v26);

  if (v25)
  {
    v27 = [[CNContactCardFieldItem alloc] initWithGroupItem:v24];
    [v32 addObject:v27];

LABEL_18:
    id v8 = v32;
    goto LABEL_20;
  }

  id v8 = (id)MEMORY[0x1E4F1CBF0];
LABEL_20:

LABEL_22:

  return v8;
}

- (id)itemsForKey:(id)a3 forContacts:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __62__CNContactCardFieldPickerDataSource_itemsForKey_forContacts___block_invoke;
  v34[3] = &unk_1E5497650;
  v34[4] = self;
  id v8 = v6;
  id v35 = v8;
  id v9 = objc_msgSend(v7, "_cn_flatMap:", v34);
  long long v10 = [(CNContactCardFieldPickerDataSource *)self contacts];
  unint64_t v11 = [v10 count];

  if (v11 > 1)
  {
    id v28 = v8;
    id v29 = v7;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v27 = v9;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      id v12 = (id)MEMORY[0x1E4F1CBF0];
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v20 = [v19 groupItem];
          int v21 = [v20 displayLabel];
          char v22 = [v13 containsObject:v21];

          if ((v22 & 1) == 0)
          {
            uint64_t v23 = [v12 arrayByAddingObject:v19];

            v24 = [v19 groupItem];
            uint64_t v25 = [v24 displayLabel];
            [v13 addObject:v25];

            id v12 = (id)v23;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v16);
    }
    else
    {
      id v12 = (id)MEMORY[0x1E4F1CBF0];
    }

    id v8 = v28;
    id v7 = v29;
    id v9 = v27;
  }
  else
  {
    id v12 = v9;
  }

  return v12;
}

uint64_t __62__CNContactCardFieldPickerDataSource_itemsForKey_forContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) itemsForKey:*(void *)(a1 + 40) forContact:a2];
}

- (id)_loadSectionsForContacts
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![(CNContactCardFieldPickerDataSource *)self isFieldHidden:*MEMORY[0x1E4F1AE28]])
  {
    id v3 = [(CNContactCardFieldPickerDataSource *)self contacts];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __62__CNContactCardFieldPickerDataSource__loadSectionsForContacts__block_invoke;
    v48[3] = &unk_1E549C040;
    v48[4] = self;
    int v4 = objc_msgSend(v3, "_cn_any:", v48);

    if (v4)
    {
      BOOL v5 = [CNContactCardFieldSection alloc];
      id v6 = +[CNContactCardFieldItem photoItem];
      v51[0] = v6;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      id v8 = [(CNContactCardFieldSection *)v5 initWithSectionType:@"contactCardFieldPickerPhotoSection" items:v7];

      [v39 addObject:v8];
    }
  }
  id v9 = [(CNContactCardFieldPickerDataSource *)self contacts];
  unint64_t v10 = [v9 count];

  if (v10 <= 1)
  {
    id v12 = [(CNContactCardFieldPickerDataSource *)self contacts];
    id v11 = [v12 firstObject];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
  }
  v38 = v11;
  id v13 = +[CNContactCardFieldPickerDataSource shareableNamePropertiesForContact:v11];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        if (![(CNContactCardFieldPickerDataSource *)self isFieldHidden:v20])
        {
          int v21 = [(CNContactCardFieldPickerDataSource *)self contacts];
          char v22 = [(CNContactCardFieldPickerDataSource *)self itemsForKey:v20 forContacts:v21];
          [v14 addObjectsFromArray:v22];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v17);
  }
  id v36 = v15;

  if ([v14 count])
  {
    uint64_t v23 = [[CNContactCardFieldSection alloc] initWithSectionType:@"contactCardFieldPickerNameSection", v14, v15 items];
    [v39 addObject:v23];
  }
  v24 = [(CNContactCardFieldPickerDataSource *)self shareableCardProperties];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v40 + 1) + 8 * j);
        long long v30 = [(CNContactCardFieldPickerDataSource *)self contacts];
        long long v31 = [(CNContactCardFieldPickerDataSource *)self itemsForKey:v29 forContacts:v30];

        if ([v31 count])
        {
          long long v32 = [CNContactCardFieldSection alloc];
          long long v33 = [MEMORY[0x1E4F1B8F8] localizedStringForKey:v29];
          long long v34 = [(CNContactCardFieldSection *)v32 initWithSectionType:v29 items:v31 displayTitle:v33];

          [v39 addObject:v34];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v26);
  }

  return v39;
}

uint64_t __62__CNContactCardFieldPickerDataSource__loadSectionsForContacts__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasPhotoForContact:a2];
}

- (BOOL)isFieldHidden:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNContactCardFieldPickerDataSource *)self hiddenProperties];

  if (v5)
  {
    id v6 = [(CNContactCardFieldPickerDataSource *)self hiddenProperties];
    char v7 = objc_msgSend(v6, "_cn_containsObject:", v4);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (CNContactCardFieldPickerDataSource)initWithContacts:(id)a3 hiddenProperties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNContactCardFieldPickerDataSource;
  id v9 = [(CNContactCardFieldPickerDataSource *)&v15 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contacts, a3);
    objc_storeStrong((id *)&v10->_hiddenProperties, a4);
    uint64_t v11 = [(CNContactCardFieldPickerDataSource *)v10 _loadSections];
    sections = v10->_sections;
    v10->_sections = (NSArray *)v11;

    id v13 = v10;
  }

  return v10;
}

- (CNContactCardFieldPickerDataSource)initWithContacts:(id)a3
{
  return [(CNContactCardFieldPickerDataSource *)self initWithContacts:a3 hiddenProperties:0];
}

- (CNContactCardFieldPickerDataSource)initWithContact:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[CNContactCardFieldPickerDataSource initWithContacts:](self, "initWithContacts:", v6, v9, v10);
  return v7;
}

+ (BOOL)isSharingMeContactForContacts:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
    id v5 = [v3 firstObject];
    char v6 = [v4 isMeContact:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)canSharePronounsForContacts:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  char v6 = [v5 featureFlags];
  int v7 = [v6 isFeatureEnabled:12];

  if (v7) {
    char v8 = [a1 isSharingMeContactForContacts:v4];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

+ (id)shareableNamePropertiesForContact:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1B910];
  if (v3)
  {
    uint64_t v5 = [MEMORY[0x1E4F1B910] nameOrderForContact:v3];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
    uint64_t v5 = [v4 nameOrderForContact:v6];
  }
  if (v5 == 1)
  {
    if (shareableNamePropertiesForContact__cn_once_token_1 != -1) {
      dispatch_once(&shareableNamePropertiesForContact__cn_once_token_1, &__block_literal_global_11840);
    }
    int v7 = &shareableNamePropertiesForContact__cn_once_object_1;
  }
  else
  {
    if (shareableNamePropertiesForContact__cn_once_token_2 != -1) {
      dispatch_once(&shareableNamePropertiesForContact__cn_once_token_2, &__block_literal_global_87);
    }
    int v7 = &shareableNamePropertiesForContact__cn_once_object_2;
  }
  id v8 = (id)*v7;

  return v8;
}

void __72__CNContactCardFieldPickerDataSource_shareableNamePropertiesForContact___block_invoke_2()
{
  v10[14] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADE0];
  v10[0] = *MEMORY[0x1E4F1AEB0];
  v10[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1AF30];
  v10[2] = *MEMORY[0x1E4F1AEF0];
  v10[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AEF8];
  v10[4] = *MEMORY[0x1E4F1ADF0];
  v10[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AF00];
  v10[6] = *MEMORY[0x1E4F1AEA0];
  v10[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AEC0];
  v10[8] = *MEMORY[0x1E4F1AEB8];
  v10[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1ADB8];
  v10[10] = *MEMORY[0x1E4F1AE78];
  v10[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AF08];
  v10[12] = *MEMORY[0x1E4F1AED8];
  v10[13] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:14];
  uint64_t v8 = [v7 copy];
  id v9 = (void *)shareableNamePropertiesForContact__cn_once_object_2;
  shareableNamePropertiesForContact__cn_once_object_2 = v8;
}

void __72__CNContactCardFieldPickerDataSource_shareableNamePropertiesForContact___block_invoke()
{
  v10[14] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADF0];
  v10[0] = *MEMORY[0x1E4F1AEB0];
  v10[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1AEA0];
  v10[2] = *MEMORY[0x1E4F1AEF8];
  v10[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADE0];
  v10[4] = *MEMORY[0x1E4F1AF00];
  v10[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AF30];
  v10[6] = *MEMORY[0x1E4F1AEF0];
  v10[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AEC0];
  v10[8] = *MEMORY[0x1E4F1AEB8];
  v10[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1ADB8];
  v10[10] = *MEMORY[0x1E4F1AE78];
  v10[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AF08];
  v10[12] = *MEMORY[0x1E4F1AED8];
  v10[13] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:14];
  uint64_t v8 = [v7 copy];
  id v9 = (void *)shareableNamePropertiesForContact__cn_once_object_1;
  shareableNamePropertiesForContact__cn_once_object_1 = v8;
}

@end