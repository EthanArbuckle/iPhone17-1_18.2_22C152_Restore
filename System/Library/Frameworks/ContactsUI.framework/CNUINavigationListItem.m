@interface CNUINavigationListItem
+ (id)bisectionTopLevelListItems:(id)a3;
+ (id)faceTimeNavigationListItemsForUserActionListModel:(id)a3;
+ (id)filterNavigationListItemsForUserActionListModel:(id)a3 forBundleIdentifier:(id)a4;
+ (id)itemForActionItem:(id)a3 usePropertyLabel:(BOOL)a4;
+ (id)localizedLabelForActionItem:(id)a3 usePropertyLabel:(BOOL)a4;
+ (id)navigationListItemForContactProperty:(id)a3;
+ (id)navigationListItemsForUserActionListModel:(id)a3 displayDefaultAppsSectionedMenus:(BOOL)a4 displayNonDefaultAppsMenuTitle:(BOOL)a5;
+ (id)parentListItemTitleForUserAction:(id)a3 displayNonDefaultAppsMenuTitle:(BOOL)a4;
- (BOOL)shouldDisplayInline;
- (CNUINavigationListItem)defaultItem;
- (CNUINavigationListItem)init;
- (CNUINavigationListItem)initWithTitle:(id)a3;
- (CNUINavigationListItem)initWithTitle:(id)a3 image:(id)a4;
- (CNUINavigationListItem)parent;
- (CNUINavigationListItemContent)content;
- (NSArray)items;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)image;
- (void)setContent:(id)a3;
- (void)setDefaultItem:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setItems:(id)a3;
- (void)setParent:(id)a3;
- (void)setShouldDisplayInline:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CNUINavigationListItem

+ (id)itemForActionItem:(id)a3 usePropertyLabel:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 localizedLabelForActionItem:v6 usePropertyLabel:v4];
  v8 = [[CNUINavigationListItem alloc] initWithTitle:v7];
  v9 = [v6 targetHandle];
  [(CNUINavigationListItem *)v8 setSubtitle:v9];

  [(CNUINavigationListItem *)v8 setContent:v6];

  return v8;
}

+ (id)bisectionTopLevelListItems:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    BOOL v4 = [v3 firstObject];
    [v4 setShouldDisplayInline:1];
    if ((unint64_t)[v3 count] <= 1)
    {
      v13[0] = v4;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    }
    else
    {
      v5 = objc_alloc_init(CNUINavigationListItem);
      id v6 = objc_msgSend(v3, "_cn_takeLast:", objc_msgSend(v3, "count") - 1);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __74__CNUINavigationListItem_CNUIUserActionModel__bisectionTopLevelListItems___block_invoke;
      v10[3] = &unk_1E5499018;
      v11 = v5;
      v7 = v5;
      objc_msgSend(v6, "_cn_each:", v10);
      [(CNUINavigationListItem *)v7 setItems:v6];
      [(CNUINavigationListItem *)v7 setShouldDisplayInline:1];
      v12[0] = v4;
      v12[1] = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

uint64_t __74__CNUINavigationListItem_CNUIUserActionModel__bisectionTopLevelListItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setParent:*(void *)(a1 + 32)];
}

+ (id)parentListItemTitleForUserAction:(id)a3 displayNonDefaultAppsMenuTitle:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 type];
  if ([v6 isEqualToString:*MEMORY[0x1E4F1AD20]])
  {
    v7 = [v5 bundleIdentifier];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F1AD00]];

    if (v8)
    {
      v9 = CNContactsUIBundle();
      v10 = [v9 localizedStringForKey:@"PHONE_ACTION_FACETIME_AUDIO" value:&stru_1ED8AC728 table:@"Localized"];

      goto LABEL_13;
    }
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F1AD38]])
  {
    v11 = &stru_1ED8AC728;
    v12 = @"Mail";
LABEL_8:
    if (v4) {
      v11 = v12;
    }
    v13 = v11;
    goto LABEL_12;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F1AD50]])
  {
    v11 = &stru_1ED8AC728;
    v12 = @"Pay";
    goto LABEL_8;
  }
  v13 = [v5 applicationName];
LABEL_12:
  v10 = v13;
LABEL_13:

  return v10;
}

+ (id)navigationListItemsForUserActionListModel:(id)a3 displayDefaultAppsSectionedMenus:(BOOL)a4 displayNonDefaultAppsMenuTitle:(BOOL)a5
{
  BOOL v5 = a4;
  v54[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = [MEMORY[0x1E4F1CA48] array];
  v45 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = [v7 actions];
  v10 = [v7 defaultAction];

  v42 = v7;
  BOOL v41 = v5;
  if (v10)
  {
    uint64_t v11 = [v7 defaultAction];
    v12 = (void *)v11;
    if (v5)
    {
      v13 = [a1 itemForActionItem:v11 usePropertyLabel:0];
      [v8 addObject:v13];

LABEL_5:
      BOOL v14 = 1;
      goto LABEL_8;
    }
    v54[0] = v11;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    uint64_t v16 = [v15 arrayByAddingObjectsFromArray:v9];

    v9 = (void *)v16;
  }
  else if (v5)
  {
    goto LABEL_5;
  }
  v17 = objc_msgSend(v9, "_cn_map:", &__block_literal_global_31785);
  v18 = objc_msgSend(v17, "_cn_distinctObjects");

  BOOL v14 = [v18 count] != 1;
LABEL_8:
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v9;
  uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v48;
    do
    {
      uint64_t v22 = 0;
      uint64_t v44 = v20;
      do
      {
        if (*(void *)v48 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v47 + 1) + 8 * v22);
        v24 = [a1 itemForActionItem:v23 usePropertyLabel:1];
        v25 = [v23 bundleIdentifier];
        if (!v25)
        {
          v29 = CNUILogContactCard();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v52 = v23;
            _os_log_error_impl(&dword_18B625000, v29, OS_LOG_TYPE_ERROR, "[CNUINavigationListItem+CNUIUserActionModel] Item has nil bundleIdentifier, cannot group it. Falling back to ungrouped action item for: %{public}@", buf, 0xCu);
          }

LABEL_21:
          [v8 addObject:v24];
          goto LABEL_25;
        }
        if (!v14) {
          goto LABEL_21;
        }
        uint64_t v26 = v21;
        v27 = [v45 objectForKeyedSubscript:v25];
        if (!v27)
        {
          if (a5)
          {
            BOOL v28 = 1;
          }
          else
          {
            v30 = [v42 defaultAction];
            BOOL v28 = v30 != 0;
          }
          v31 = [a1 parentListItemTitleForUserAction:v23 displayNonDefaultAppsMenuTitle:v28];
          v27 = [[CNUINavigationListItem alloc] initWithTitle:v31];
          [(CNUINavigationListItem *)v27 setIdentifier:v25];
          [(CNUINavigationListItem *)v27 setItems:MEMORY[0x1E4F1CBF0]];
          [v8 addObject:v27];
          [v45 setObject:v27 forKeyedSubscript:v25];
        }
        [v24 setParent:v27];
        v32 = [(CNUINavigationListItem *)v27 items];
        [v32 arrayByAddingObject:v24];
        id v33 = a1;
        BOOL v34 = v14;
        v36 = v35 = v8;
        [(CNUINavigationListItem *)v27 setItems:v36];

        int v8 = v35;
        BOOL v14 = v34;
        a1 = v33;

        uint64_t v21 = v26;
        uint64_t v20 = v44;
LABEL_25:

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v20);
  }

  if (v41
    && (([v42 hasDefaultApp] & 1) != 0
     || ([v42 defaultAction], v37 = objc_claimAutoreleasedReturnValue(), v37, v37)))
  {
    v38 = [a1 bisectionTopLevelListItems:v8];
    v39 = (void *)[v38 copy];
  }
  else
  {
    v39 = (void *)[v8 copy];
  }

  return v39;
}

__CFString *__153__CNUINavigationListItem_CNUIUserActionModel__navigationListItemsForUserActionListModel_displayDefaultAppsSectionedMenus_displayNonDefaultAppsMenuTitle___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 bundleIdentifier];
  id v3 = v2;
  if (!v2) {
    v2 = &stru_1ED8AC728;
  }
  BOOL v4 = v2;

  return v4;
}

+ (id)filterNavigationListItemsForUserActionListModel:(id)a3 forBundleIdentifier:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [v6 actions];
  v10 = [v6 defaultAction];

  if (v10)
  {
    uint64_t v11 = [v6 defaultAction];
    v29[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    uint64_t v13 = [v12 arrayByAddingObjectsFromArray:v9];

    v9 = (void *)v13;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend(v19, "bundleIdentifier", (void)v24);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        if (v20 == v7)
        {
          uint64_t v21 = [a1 itemForActionItem:v19 usePropertyLabel:1];
          [v8 addObject:v21];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  uint64_t v22 = (void *)[v8 copy];

  return v22;
}

+ (id)faceTimeNavigationListItemsForUserActionListModel:(id)a3
{
  return (id)[a1 filterNavigationListItemsForUserActionListModel:a3 forBundleIdentifier:*MEMORY[0x1E4F1AD00]];
}

+ (id)localizedLabelForActionItem:(id)a3 usePropertyLabel:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = [v5 contactProperty];
    int v8 = [v7 label];
  }
  else
  {
    int v8 = [v5 label];
  }
  v9 = (void *)MEMORY[0x1E4F1BA20];
  v10 = [v6 contactProperty];
  uint64_t v11 = [v10 key];
  v12 = [v9 localizedDisplayStringForLabel:v8 propertyName:v11];

  uint64_t v13 = [v6 type];
  LODWORD(v11) = [v13 isEqualToString:*MEMORY[0x1E4F1AD68]];

  if (!v11)
  {
    uint64_t v17 = [v6 type];
    int v18 = [v17 isEqualToString:*MEMORY[0x1E4F1AD60]];

    if (!v18) {
      goto LABEL_15;
    }
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
      id v14 = CNContactsUIBundle();
      uint64_t v15 = v14;
      uint64_t v16 = @"TTY_NO_LABEL";
      goto LABEL_10;
    }
    id v20 = NSString;
    uint64_t v21 = CNContactsUIBundle();
    uint64_t v15 = v21;
    uint64_t v22 = @"TTY_LABEL_SUFFIX";
LABEL_13:
    uint64_t v23 = [v21 localizedStringForKey:v22 value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v19 = objc_msgSend(v20, "stringWithFormat:", v23, v12);

    v12 = (void *)v23;
    goto LABEL_14;
  }
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    id v20 = NSString;
    uint64_t v21 = CNContactsUIBundle();
    uint64_t v15 = v21;
    uint64_t v22 = @"TTYRELAY_LABEL_SUFFIX";
    goto LABEL_13;
  }
  id v14 = CNContactsUIBundle();
  uint64_t v15 = v14;
  uint64_t v16 = @"TTYRELAY_NO_LABEL";
LABEL_10:
  uint64_t v19 = [v14 localizedStringForKey:v16 value:&stru_1ED8AC728 table:@"Localized"];
LABEL_14:

  v12 = (void *)v19;
LABEL_15:

  return v12;
}

+ (id)navigationListItemForContactProperty:(id)a3
{
  id v5 = a3;
  id v6 = [CNUINavigationListItem alloc];
  id v7 = (void *)MEMORY[0x1E4F1BA20];
  uint64_t v8 = [v5 label];
  v9 = [v5 key];
  v10 = [v7 localizedDisplayStringForLabel:v8 propertyName:v9];
  uint64_t v11 = [(CNUINavigationListItem *)v6 initWithTitle:v10];

  v12 = [v5 value];
  objc_opt_class();
  LOBYTE(v8) = objc_opt_isKindOfClass();

  if (v8)
  {
    uint64_t v13 = [v5 value];
  }
  else
  {
    id v14 = [v5 key];
    int v15 = [v14 isEqualToString:*MEMORY[0x1E4F1AEE0]];

    if (v15)
    {
      uint64_t v16 = [v5 value];
      uint64_t v13 = [v16 formattedStringValue];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"CNUINavigationListItem+CNContactProperty.m", 28, @"Value is not a string, not supported" object file lineNumber description];
  }
  [(CNUINavigationListItem *)v11 setSubtitle:v13];
  [(CNUINavigationListItem *)v11 setContent:v5];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_defaultItem);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_parent);

  objc_storeStrong((id *)&self->_content, 0);
}

- (void)setShouldDisplayInline:(BOOL)a3
{
  self->_shouldDisplayInline = a3;
}

- (BOOL)shouldDisplayInline
{
  return self->_shouldDisplayInline;
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setDefaultItem:(id)a3
{
}

- (CNUINavigationListItem)defaultItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultItem);

  return (CNUINavigationListItem *)WeakRetained;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setParent:(id)a3
{
}

- (CNUINavigationListItem)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (CNUINavigationListItem *)WeakRetained;
}

- (void)setContent:(id)a3
{
}

- (CNUINavigationListItemContent)content
{
  return self->_content;
}

- (CNUINavigationListItem)initWithTitle:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNUINavigationListItem;
  uint64_t v8 = [(CNUINavigationListItem *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_image, a4);
    items = v9->_items;
    v9->_items = 0;

    uint64_t v11 = [v6 copy];
    title = v9->_title;
    v9->_title = (NSString *)v11;

    subtitle = v9->_subtitle;
    v9->_subtitle = 0;
  }
  return v9;
}

- (CNUINavigationListItem)initWithTitle:(id)a3
{
  return [(CNUINavigationListItem *)self initWithTitle:a3 image:0];
}

- (CNUINavigationListItem)init
{
  return [(CNUINavigationListItem *)self initWithTitle:&stru_1ED8AC728];
}

@end