@interface CNCardPropertyGroup
+ (id)groupForProperty:(id)a3 contact:(id)a4 store:(id)a5 policy:(id)a6 linkedPolicies:(id)a7;
- (BOOL)_arrayContainsMaxAllowedItems:(id)a3;
- (BOOL)_shouldShowGroupWhenEditing:(BOOL)a3;
- (BOOL)addEditingItem;
- (BOOL)addEditingItem:(id)a3;
- (BOOL)allowsAdding;
- (BOOL)allowsDisplayModePickerActions;
- (BOOL)canAddEditingItem;
- (BOOL)hasReorderedItems;
- (BOOL)isAdded;
- (BOOL)isFixedValue;
- (BOOL)isMultiLine;
- (BOOL)isMultiValue;
- (BOOL)isRequired;
- (BOOL)labelsAreUnique;
- (BOOL)modified;
- (BOOL)moveEditingItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (BOOL)showActionsWhenEmpty;
- (CNCardPropertyGroup)initWithProperty:(id)a3 contact:(id)a4 store:(id)a5 policy:(id)a6 linkedPolicies:(id)a7;
- (CNContactStore)contactStore;
- (CNPolicy)policy;
- (Class)propertyGroupItemClass;
- (NSArray)deletedItems;
- (NSArray)editingItems;
- (NSArray)propertyItems;
- (NSDictionary)linkedPolicies;
- (NSString)property;
- (id)_availableLabelsInLabels:(id)a3 forItem:(id)a4 withValueSelector:(SEL)a5 usedLabelsCount:(int64_t *)a6;
- (id)_itemToBeMergedWith:(id)a3 fromItems:(id)a4 forEditing:(BOOL)a5;
- (id)_loadPropertyItems;
- (id)_mergeItems:(id)a3 forEditing:(BOOL)a4;
- (id)_nextAvailableInstantMessageService;
- (id)_nextAvailableLabel;
- (id)_nextAvailableLabelInLabels:(id)a3 withValueSelector:(SEL)a4;
- (id)_nextAvailableSocialService;
- (id)description;
- (id)displayItems;
- (id)itemsUsingLabel:(id)a3;
- (id)labelsForItem:(id)a3 options:(unint64_t)a4;
- (id)labelsInUseByGroup;
- (id)lastEditingItem;
- (id)nextAvailableLabel;
- (id)policyForItem:(id)a3;
- (int64_t)valueEditingItemsCount;
- (void)_updateNameValuesForItems:(id)a3;
- (void)reloadDataPreservingChanges:(BOOL)a3;
- (void)removeEditingItem:(id)a3;
- (void)saveChanges;
- (void)saveChangesForItems:(id)a3;
- (void)setAllowsDisplayModePickerActions:(BOOL)a3;
- (void)setDeletedItems:(id)a3;
- (void)setEditingItems:(id)a3;
- (void)setHasReorderedItems:(BOOL)a3;
- (void)setIsAdded:(BOOL)a3;
- (void)setShowActionsWhenEmpty:(BOOL)a3;
@end

@implementation CNCardPropertyGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedItems, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_linkedPolicies, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_originalEditingItems, 0);
  objc_storeStrong((id *)&self->_editingItems, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);

  objc_storeStrong((id *)&self->_propertyItems, 0);
}

- (void)setHasReorderedItems:(BOOL)a3
{
  self->_hasReorderedItems = a3;
}

- (BOOL)hasReorderedItems
{
  return self->_hasReorderedItems;
}

- (void)setDeletedItems:(id)a3
{
}

- (NSArray)deletedItems
{
  return self->_deletedItems;
}

- (void)setIsAdded:(BOOL)a3
{
  self->_isAdded = a3;
}

- (BOOL)isAdded
{
  return self->_isAdded;
}

- (void)setAllowsDisplayModePickerActions:(BOOL)a3
{
  self->_allowsDisplayModePickerActions = a3;
}

- (BOOL)allowsDisplayModePickerActions
{
  return self->_allowsDisplayModePickerActions;
}

- (void)setShowActionsWhenEmpty:(BOOL)a3
{
  self->_showActionsWhenEmpty = a3;
}

- (BOOL)showActionsWhenEmpty
{
  return self->_showActionsWhenEmpty;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSDictionary)linkedPolicies
{
  return self->_linkedPolicies;
}

- (CNPolicy)policy
{
  return self->_policy;
}

- (NSArray)propertyItems
{
  return self->_propertyItems;
}

- (NSString)property
{
  return self->_property;
}

- (id)_nextAvailableSocialService
{
  v3 = +[CNSocialProfileServicePickerController defaultServices];
  if ([v3 count])
  {
    v4 = [(CNCardPropertyGroup *)self _nextAvailableLabelInLabels:v3 withValueSelector:sel_service];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_nextAvailableInstantMessageService
{
  v3 = [(CNCardPropertyGroup *)self policy];
  v4 = [v3 supportedLabelsForContactProperty:*MEMORY[0x1E4F1AF78]];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = +[CNInstantMessagePickerController defaultServices];
    v7 = [(CNCardGroup *)self contact];
    int v8 = [v7 supportsInstantMessageService];

    if (v8)
    {
      v5 = [(CNCardPropertyGroup *)self _nextAvailableLabelInLabels:v6 withValueSelector:sel_service];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)_nextAvailableLabel
{
  v3 = [(CNCardPropertyGroup *)self labelsForItem:0 options:0];
  if ([v3 count])
  {
    v4 = [(CNCardPropertyGroup *)self _nextAvailableLabelInLabels:v3 withValueSelector:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_nextAvailableLabelInLabels:(id)a3 withValueSelector:(SEL)a4
{
  id v6 = a3;
  unint64_t v13 = 0;
  v7 = [(CNCardPropertyGroup *)self _availableLabelsInLabels:v6 forItem:0 withValueSelector:a4 usedLabelsCount:&v13];
  if ([v7 count])
  {
    int v8 = v7;
    unint64_t v9 = 0;
  }
  else
  {
    if ([v6 count])
    {
      unint64_t v10 = v13;
      unint64_t v9 = v10 % [v6 count];
    }
    else
    {
      unint64_t v9 = 0;
    }
    int v8 = v6;
  }
  v11 = [v8 objectAtIndexedSubscript:v9];

  return v11;
}

- (id)_availableLabelsInLabels:(id)a3 forItem:(id)a4 withValueSelector:(SEL)a5 usedLabelsCount:(int64_t *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v35 = a4;
  unint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v31 = self;
  unint64_t v10 = [(CNCardPropertyGroup *)self editingItems];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v40 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = [v15 labeledValue];
          v17 = [v16 value];

          if (a5)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              v22 = [MEMORY[0x1E4F28B00] currentHandler];
              [v22 handleFailureInMethod:a2 object:v31 file:@"CNCardPropertyGroup.m" lineNumber:600 description:@"A valueSelector has been specified but the value doesn’t support it."];
            }
            v18 = ((void (*)(void *, SEL))[v17 methodForSelector:a5])(v17, a5);
            if (v18) {
              [v9 addObject:v18];
            }
LABEL_15:
          }
          else if (v15 != v35)
          {
            v19 = [v15 labeledValue];
            v20 = [v19 label];

            if (v20)
            {
              v18 = [v15 labeledValue];
              v21 = [v18 label];
              [v9 addObject:v21];

              goto LABEL_15;
            }
          }

          continue;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v12);
  }

  v23 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v24 = v33;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        if (([v9 containsObject:v29] & 1) == 0) {
          [v23 addObject:v29];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v26);
  }

  if (a6) {
    *a6 = [v9 count];
  }

  return v23;
}

- (id)itemsUsingLabel:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(CNCardPropertyGroup *)self editingItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v11 labeledValue];
          uint64_t v13 = [v12 label];

          if ([v13 isEqualToString:v4]) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)labelsInUseByGroup
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CNCardPropertyGroup *)self editingItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4F5A2A0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 labeledValue];
          uint64_t v12 = [v11 label];

          if ((*(unsigned int (**)(uint64_t, void *))(v8 + 16))(v8, v12)) {
            [v3 addObject:v12];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)labelsForItem:(id)a3 options:(unint64_t)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(CNCardPropertyGroup *)self property];
  int v8 = [v7 isEqualToString:@"birthdays"];

  uint64_t v9 = [(CNCardPropertyGroup *)self policy];
  unint64_t v10 = v9;
  if (v8)
  {
    unint64_t v11 = objc_msgSend(v9, "_cnui_maximumNumberOfValuesForProperty:", @"birthdays");

    if (v11 < 2)
    {
      v34 = @"_systemCalendar";
      long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    }
    else
    {
      v35[0] = @"_systemCalendar";
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
      uint64_t v13 = (void *)MEMORY[0x1E4F70FE8];
      long long v14 = [MEMORY[0x1E4F1CA20] currentLocale];
      long long v15 = [v14 localeIdentifier];
      long long v16 = [v13 lunarCalendarsForLocaleID:v15];
      long long v17 = [v12 arrayByAddingObjectsFromArray:v16];
    }
  }
  else
  {
    long long v18 = [(CNCardPropertyGroup *)self property];
    long long v17 = [v10 supportedLabelsForContactProperty:v18];

    if (!v17)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F1B980];
      uint64_t v20 = [(CNCardPropertyGroup *)self property];
      long long v17 = [v19 standardLabelsForPropertyWithKey:v20 options:a4];
    }
  }
  uint64_t v32 = 0;
  if ([(CNCardPropertyGroup *)self labelsAreUnique])
  {
    v21 = [(CNCardPropertyGroup *)self _availableLabelsInLabels:v17 forItem:v6 withValueSelector:0 usedLabelsCount:&v32];

    v22 = [(CNCardPropertyGroup *)self property];
    int v23 = [v22 isEqualToString:@"birthdays"];

    if (v23)
    {
      if (v32 >= 1
        && (unint64_t)[v21 count] >= 2
        && ([v21 objectAtIndexedSubscript:0],
            id v24 = objc_claimAutoreleasedReturnValue(),
            int v25 = [v24 isEqualToString:@"_systemCalendar"],
            v24,
            v25))
      {
        id v33 = @"_systemCalendar";
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        v21 = uint64_t v26 = v21;
      }
      else
      {
        uint64_t v27 = (void *)MEMORY[0x1E4F70FE8];
        v28 = [MEMORY[0x1E4F1CA20] currentLocale];
        uint64_t v29 = [v28 localeIdentifier];
        uint64_t v26 = [v27 preferredLunarCalendarForLocaleID:v29];

        if (v26
          && [v21 containsObject:@"_systemCalendar"]
          && ([v21 containsObject:@"_systemCalendar"] & 1) == 0
          && (unint64_t)[v21 count] >= 2)
        {
          v30 = (void *)[v21 mutableCopy];
          [v30 removeObject:@"_systemCalendar"];
          [v30 insertObject:@"_systemCalendar" atIndex:0];

          v21 = v30;
        }
      }
    }
    long long v17 = v21;
  }

  return v17;
}

- (void)saveChangesForItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CNCardPropertyGroup *)self _updateNameValuesForItems:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        unint64_t v11 = objc_opt_class();
        if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class(), (void)v13))
        {
          id v12 = v10;
          if ([v12 modified]) {
            [v12 saveChangesImmediately:0];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (id)policyForItem:(id)a3
{
  id v4 = [a3 contactProperty];
  id v5 = [v4 sourceContact];
  uint64_t v6 = [v5 identifier];

  uint64_t v7 = [(CNCardPropertyGroup *)self policy];
  uint64_t v8 = [(CNCardGroup *)self contact];
  uint64_t v9 = [v8 identifier];
  char v10 = [v6 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    unint64_t v11 = [(CNCardPropertyGroup *)self linkedPolicies];
    uint64_t v12 = [v11 objectForKey:v6];

    uint64_t v7 = (void *)v12;
  }

  return v7;
}

- (void)_updateNameValuesForItems:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[CNContactView nameProperties];
  uint64_t v6 = [(CNCardPropertyGroup *)self property];
  int v7 = [v5 containsObject:v6];

  if (!v7) {
    goto LABEL_25;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (!v9)
  {
LABEL_12:
    long long v16 = v8;
    goto LABEL_24;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v30;
LABEL_4:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v30 != v11) {
      objc_enumerationMutation(v8);
    }
    long long v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
    long long v14 = objc_opt_class();
    if (![v14 isSubclassOfClass:objc_opt_class()]) {
      goto LABEL_10;
    }
    id v15 = v13;
    if ([v15 modified]) {
      break;
    }

LABEL_10:
    if (v10 == ++v12)
    {
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v10) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  long long v17 = [v15 labeledValue];
  long long v16 = [v17 value];

  if (!v16) {
    goto LABEL_25;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        int v23 = *(void **)(*((void *)&v25 + 1) + 8 * v22);
        id v24 = objc_opt_class();
        if (objc_msgSend(v24, "isSubclassOfClass:", objc_opt_class(), (void)v25)) {
          [v23 updateLabeledValueWithValue:v16];
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

LABEL_24:
LABEL_25:
}

- (BOOL)_arrayContainsMaxAllowedItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  uint64_t v6 = [v4 lastObject];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  unint64_t v8 = v5 - (isKindOfClass & 1);
  if ([(CNCardPropertyGroup *)self isFixedValue]
    || ![(CNCardPropertyGroup *)self isMultiValue])
  {
    return v5 != (isKindOfClass & 1);
  }
  uint64_t v9 = [(CNCardPropertyGroup *)self policy];
  uint64_t v10 = [(CNCardPropertyGroup *)self property];
  BOOL v11 = v8 >= objc_msgSend(v9, "_cnui_maximumNumberOfValuesForProperty:", v10);

  return v11;
}

- (BOOL)canAddEditingItem
{
  return ![(CNCardPropertyGroup *)self _arrayContainsMaxAllowedItems:self->_editingItems];
}

- (BOOL)labelsAreUnique
{
  v2 = [(CNCardPropertyGroup *)self property];
  char v3 = [v2 isEqualToString:@"birthdays"];

  return v3;
}

- (BOOL)isRequired
{
  char v3 = +[CNContactView requiredNameProperties];
  id v4 = [(CNCardPropertyGroup *)self property];
  if ([v3 containsObject:v4])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(CNCardPropertyGroup *)self property];
    char v5 = [v6 isEqualToString:*MEMORY[0x1E4F1AED0]];
  }
  return v5;
}

- (BOOL)_shouldShowGroupWhenEditing:(BOOL)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    int v7 = [(CNCardPropertyGroup *)self property];
    if ([v7 isEqualToString:*MEMORY[0x1E4F1ADA0]])
    {
    }
    else
    {
      unint64_t v8 = [(CNCardPropertyGroup *)self property];
      int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1AF90]];

      if (!v9)
      {
        uint64_t v21 = [(CNCardPropertyGroup *)self property];
        int v22 = [v21 isEqualToString:*MEMORY[0x1E4F1AED0]];

        if (v22)
        {
          int v23 = [(CNCardGroup *)self contact];
          int v24 = [v23 isUnknown];

          if (v24)
          {
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v25 = [(CNCardPropertyGroup *)self propertyItems];
            uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v34;
              while (2)
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v34 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  long long v30 = [*(id *)(*((void *)&v33 + 1) + 8 * i) labeledValue];
                  long long v31 = [v30 value];
                  uint64_t v32 = [v31 length];

                  if (v32)
                  {

                    goto LABEL_33;
                  }
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
                if (v27) {
                  continue;
                }
                break;
              }
            }

            LOBYTE(v11) = 0;
            return v11;
          }
        }
        goto LABEL_33;
      }
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v10 = [(CNCardPropertyGroup *)self propertyItems];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v38;
      while (2)
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = [*(id *)(*((void *)&v37 + 1) + 8 * j) labeledValue];
          id v15 = [v14 value];

          if (v15)
          {
            LOBYTE(v11) = 1;
            goto LABEL_18;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    return v11;
  }
  id v4 = [(CNCardGroup *)self contact];
  int v5 = [v4 isSuggested];

  if (v5)
  {
    uint64_t v6 = [(CNCardPropertyGroup *)self property];
    if ([v6 isEqualToString:*MEMORY[0x1E4F1ADA0]])
    {

LABEL_20:
      id v18 = [(CNCardGroup *)self contact];
      char v19 = [v18 isSuggestedMe];

      return v19;
    }
    long long v16 = [(CNCardPropertyGroup *)self property];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F1AF90]];

    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_33:
  LOBYTE(v11) = 1;
  return v11;
}

- (id)_itemToBeMergedWith:(id)a3 fromItems:(id)a4 forEditing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = a4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isEquivalentToItem:whenEditing:", v7, v5, (void)v16))
        {
          id v14 = v13;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)_mergeItems:(id)a3 forEditing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNCardPropertyGroup *)self _shouldShowGroupWhenEditing:v4])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v21 = v6;
    obuint64_t j = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (!(objc_msgSend(MEMORY[0x1E4F1B8F8], "suggestionsShownInEditMode", v21) | !v4))
          {
            if ([v12 isSuggested])
            {
              long long v13 = [(CNCardGroup *)self contact];
              int v14 = [v13 isSuggested];

              if (!v14) {
                continue;
              }
            }
          }
          if (v4)
          {
            if ([v12 isSuggested])
            {
              id v15 = [(CNCardGroup *)self contact];
              char v16 = [v15 isSuggestedMe];

              if (v16) {
                continue;
              }
            }
          }
          long long v17 = [(CNCardPropertyGroup *)self _itemToBeMergedWith:v12 fromItems:v7 forEditing:v4];
          long long v18 = v17;
          if (v17) {
            BOOL v19 = v17 == v12;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19) {
            [v7 addObject:v12];
          }
          else {
            [v17 mergeItem:v12];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    id v6 = v21;
  }

  return v7;
}

- (id)_loadPropertyItems
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(CNCardGroup *)self contact];
  BOOL v5 = [(CNCardPropertyGroup *)self property];
  id v6 = [v4 valueForKey:v5];

  id v7 = [(CNCardPropertyGroup *)self property];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F1AD88]];

  if (v6
    || [(CNCardPropertyGroup *)self isRequired]
    || ([(CNCardPropertyGroup *)self isAdded] | v8) == 1)
  {
    uint64_t v9 = [(CNCardPropertyGroup *)self propertyGroupItemClass];
    if ([(CNCardPropertyGroup *)self isMultiValue])
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v6 = v6;
      uint64_t v10 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v6);
            }
            int v14 = -[objc_class propertyGroupItemWithLabeledValue:group:contact:](v9, "propertyGroupItemWithLabeledValue:group:contact:", *(void *)(*((void *)&v18 + 1) + 8 * i), self, v4, (void)v18);
            objc_msgSend(v3, "_cn_addNonNilObject:", v14);
          }
          uint64_t v11 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }
    }
    else
    {
      if (!v6)
      {
        id v6 = [(objc_class *)v9 emptyValueForLabel:0];
      }
      id v15 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v6];
      char v16 = [(objc_class *)v9 propertyGroupItemWithLabeledValue:v15 group:self contact:v4];
      [v3 addObject:v16];
    }
  }

  return v3;
}

- (Class)propertyGroupItemClass
{
  v2 = [(CNCardPropertyGroup *)self property];
  char v3 = +[CNPropertyGroupItem classForProperty:v2];

  return (Class)v3;
}

- (void)setEditingItems:(id)a3
{
  BOOL v5 = (NSArray *)a3;
  if (self->_editingItems != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_editingItems, a3);
    BOOL v5 = v6;
  }
}

- (NSArray)editingItems
{
  editingItems = self->_editingItems;
  if (!editingItems)
  {
    BOOL v4 = [(CNCardPropertyGroup *)self _mergeItems:self->_propertyItems forEditing:1];
    BOOL v5 = self->_editingItems;
    self->_editingItems = v4;

    if ([(CNCardPropertyGroup *)self canAddEditingItem])
    {
      id v6 = [CNPropertyPlaceholderItem alloc];
      id v7 = [(CNCardPropertyGroup *)self property];
      int v8 = [(CNPropertyPlaceholderItem *)v6 initWithProperty:v7];

      uint64_t v9 = [(NSArray *)self->_editingItems arrayByAddingObject:v8];
      uint64_t v10 = self->_editingItems;
      self->_editingItems = v9;
    }
    editingItems = self->_editingItems;
    if (!self->_originalEditingItems)
    {
      uint64_t v11 = (NSArray *)[(NSArray *)editingItems copy];
      originalEditingItems = self->_originalEditingItems;
      self->_originalEditingItems = v11;

      editingItems = self->_editingItems;
    }
  }

  return editingItems;
}

- (id)displayItems
{
  displayItems = self->_displayItems;
  if (!displayItems)
  {
    BOOL v4 = [(CNCardPropertyGroup *)self _mergeItems:self->_propertyItems forEditing:0];
    if ([v4 count] || -[CNCardPropertyGroup showActionsWhenEmpty](self, "showActionsWhenEmpty"))
    {
      BOOL v5 = [(CNCardGroup *)self actionItems];
      id v6 = [v4 arrayByAddingObjectsFromArray:v5];
      id v7 = self->_displayItems;
      self->_displayItems = v6;
    }
    displayItems = self->_displayItems;
  }

  return displayItems;
}

- (void)saveChanges
{
  char v3 = [(CNCardPropertyGroup *)self deletedItems];
  [(CNCardPropertyGroup *)self saveChangesForItems:v3];

  BOOL v4 = [(CNCardPropertyGroup *)self editingItems];
  [(CNCardPropertyGroup *)self saveChangesForItems:v4];

  [(CNCardPropertyGroup *)self setDeletedItems:0];
  originalEditingItems = self->_originalEditingItems;
  self->_originalEditingItems = 0;
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  displayItems = self->_displayItems;
  self->_displayItems = 0;

  if (!a3)
  {
    editingItems = self->_editingItems;
    self->_editingItems = 0;

    deletedItems = self->_deletedItems;
    self->_deletedItems = 0;
  }
  int v8 = [(CNCardPropertyGroup *)self _loadPropertyItems];
  propertyItems = self->_propertyItems;
  self->_propertyItems = v8;
}

- (int64_t)valueEditingItemsCount
{
  char v3 = [(CNCardPropertyGroup *)self editingItems];
  uint64_t v4 = [v3 count];

  BOOL v5 = [(CNCardPropertyGroup *)self editingItems];
  id v6 = [v5 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return v4 - (isKindOfClass & 1);
}

- (id)lastEditingItem
{
  v2 = [(CNCardPropertyGroup *)self editingItems];
  char v3 = objc_msgSend(v2, "_cn_reversed");
  uint64_t v4 = objc_msgSend(v3, "_cn_firstObjectPassingTest:", &__block_literal_global_3511);

  return v4;
}

BOOL __38__CNCardPropertyGroup_lastEditingItem__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)moveEditingItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  if ([(CNCardPropertyGroup *)self valueEditingItemsCount] <= a3
    || [(CNCardPropertyGroup *)self valueEditingItemsCount] <= a4)
  {
    return 0;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  int v8 = [(CNCardPropertyGroup *)self editingItems];
  uint64_t v9 = (void *)[v7 initWithArray:v8];

  uint64_t v10 = [v9 objectAtIndex:a3];
  [v9 removeObjectAtIndex:a3];
  [v9 insertObject:v10 atIndex:a4];
  [(CNCardPropertyGroup *)self setEditingItems:v9];
  BOOL v11 = 1;
  [(CNCardPropertyGroup *)self setHasReorderedItems:1];

  return v11;
}

- (void)removeEditingItem:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(NSArray *)self->_editingItems containsObject:v4])
    {
      BOOL v5 = (void *)[(NSArray *)self->_editingItems mutableCopy];
      [v5 removeObjectIdenticalTo:v4];
      id v6 = (NSArray *)[v5 copy];
      editingItems = self->_editingItems;
      self->_editingItems = v6;

      if ([(CNCardPropertyGroup *)self canAddEditingItem])
      {
        int v8 = [v5 lastObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v10 = [CNPropertyPlaceholderItem alloc];
          BOOL v11 = [(CNCardPropertyGroup *)self property];
          uint64_t v12 = [(CNPropertyPlaceholderItem *)v10 initWithProperty:v11];

          long long v13 = [(NSArray *)self->_editingItems arrayByAddingObject:v12];
          int v14 = self->_editingItems;
          self->_editingItems = v13;
        }
      }
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = self->_originalEditingItems;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
LABEL_9:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v33 + 1) + 8 * v19);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v21 = objc_msgSend(v20, "labeledValue", (void)v33);
          int v22 = [v4 labeledValue];
          char v23 = [v21 isEqualIgnoringIdentifiers:v22];

          if (v23) {
            break;
          }
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v17) {
            goto LABEL_9;
          }
          goto LABEL_16;
        }
      }

      uint64_t v28 = objc_opt_class();
      long long v29 = [v4 labeledValue];
      long long v30 = [v29 label];
      long long v31 = [v28 emptyValueForLabel:v30];
      [v4 updateLabeledValueWithValue:v31];

      uint64_t v32 = [(CNCardPropertyGroup *)self deletedItems];

      if (v32)
      {
        long long v25 = [(CNCardPropertyGroup *)self deletedItems];
        long long v26 = [v25 arrayByAddingObject:v4];
        [(CNCardPropertyGroup *)self setDeletedItems:v26];
        goto LABEL_19;
      }
      long long v25 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];
      [(CNCardPropertyGroup *)self setDeletedItems:v25];
    }
    else
    {
LABEL_16:

      long long v24 = objc_opt_class();
      long long v25 = [v4 labeledValue];
      long long v26 = [v25 label];
      uint64_t v27 = [v24 emptyValueForLabel:v26];
      [v4 updateLabeledValueWithValue:v27];

LABEL_19:
    }
  }
}

- (BOOL)addEditingItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNCardPropertyGroup *)self canAddEditingItem];
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = [(CNCardPropertyGroup *)self editingItems];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    [(CNCardPropertyGroup *)self setIsAdded:1];
    [(CNCardPropertyGroup *)self reloadDataPreservingChanges:0];
    goto LABEL_11;
  }
  int v8 = [(CNCardPropertyGroup *)self editingItems];
  uint64_t v9 = (void *)[v8 mutableCopy];

  if (v9)
  {
    if (v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  if (!v4)
  {
LABEL_5:
    uint64_t v10 = [(CNCardPropertyGroup *)self propertyGroupItemClass];
    BOOL v11 = [(CNCardPropertyGroup *)self nextAvailableLabel];
    uint64_t v12 = [(CNCardGroup *)self contact];
    id v4 = [(objc_class *)v10 propertyGroupItemWithLabel:v11 group:self contact:v12];
  }
LABEL_6:
  long long v13 = [(CNCardPropertyGroup *)self editingItems];
  objc_msgSend(v9, "insertObject:atIndex:", v4, objc_msgSend(v13, "count") - 1);

  if ([(CNCardPropertyGroup *)self _arrayContainsMaxAllowedItems:v9])
  {
    int v14 = [v9 lastObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [v9 removeLastObject];
    }
  }
  [(CNCardPropertyGroup *)self setEditingItems:v9];

LABEL_11:
  return v5;
}

- (BOOL)addEditingItem
{
  return [(CNCardPropertyGroup *)self addEditingItem:0];
}

- (id)nextAvailableLabel
{
  char v3 = [(CNCardPropertyGroup *)self property];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F1AF78]];

  if (v4)
  {
    BOOL v5 = [(CNCardPropertyGroup *)self _nextAvailableSocialService];
  }
  else
  {
    id v6 = [(CNCardPropertyGroup *)self property];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F1AE60]];

    if (v7) {
      [(CNCardPropertyGroup *)self _nextAvailableInstantMessageService];
    }
    else {
    BOOL v5 = [(CNCardPropertyGroup *)self _nextAvailableLabel];
    }
  }

  return v5;
}

- (BOOL)modified
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v3 = [(CNCardPropertyGroup *)self deletedItems];
  uint64_t v4 = [v3 count];

  if (v4 || [(CNCardPropertyGroup *)self hasReorderedItems])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    int v7 = [(CNCardPropertyGroup *)self editingItems];
    uint64_t v5 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && ([v10 modified])
          {
            LOBYTE(v5) = 1;
            goto LABEL_16;
          }
        }
        uint64_t v5 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  return v5;
}

- (BOOL)isMultiLine
{
  char v3 = [(CNCardPropertyGroup *)self property];
  if ([v3 isEqualToString:*MEMORY[0x1E4F1AF10]])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(CNCardPropertyGroup *)self property];
    char v4 = [v5 isEqualToString:*MEMORY[0x1E4F1AED0]];
  }
  return v4;
}

- (BOOL)isFixedValue
{
  id v2 = [(CNCardPropertyGroup *)self property];
  BOOL v3 = +[CNContactView isFixedValueProperty:v2];

  return v3;
}

- (BOOL)isMultiValue
{
  id v2 = [(CNCardPropertyGroup *)self property];
  BOOL v3 = +[CNContactView isMultiValueProperty:v2];

  return v3;
}

- (BOOL)allowsAdding
{
  BOOL v3 = [(CNCardPropertyGroup *)self displayItems];
  if ([v3 count] && !-[CNCardPropertyGroup isMultiValue](self, "isMultiValue")) {
    LOBYTE(v4) = 0;
  }
  else {
    BOOL v4 = ![(CNCardPropertyGroup *)self isFixedValue];
  }

  return v4;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CNCardPropertyGroup *)self property];
  id v6 = [(CNCardPropertyGroup *)self displayItems];
  uint64_t v7 = [v6 count];
  uint64_t v8 = [(CNCardPropertyGroup *)self editingItems];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [(CNCardGroup *)self actions];
  long long v11 = [v3 stringWithFormat:@"<%@ %p> [%@]: %d/%d items, %d actions", v4, self, v5, v7, v9, objc_msgSend(v10, "count")];

  return v11;
}

- (CNCardPropertyGroup)initWithProperty:(id)a3 contact:(id)a4 store:(id)a5 policy:(id)a6 linkedPolicies:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CNCardPropertyGroup;
  uint64_t v17 = [(CNCardGroup *)&v22 initWithContact:a4];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_property, a3);
    uint64_t v19 = [(CNCardPropertyGroup *)v18 _loadPropertyItems];
    propertyItems = v18->_propertyItems;
    v18->_propertyItems = (NSArray *)v19;

    objc_storeStrong((id *)&v18->_policy, a6);
    objc_storeStrong((id *)&v18->_contactStore, a5);
    objc_storeStrong((id *)&v18->_linkedPolicies, a7);
    v18->_allowsDisplayModePickerActions = 1;
    v18->_hasReorderedItems = 0;
    [(CNCardPropertyGroup *)v18 setShowActionsWhenEmpty:0];
  }

  return v18;
}

+ (id)groupForProperty:(id)a3 contact:(id)a4 store:(id)a5 policy:(id)a6 linkedPolicies:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = (void *)[objc_alloc((Class)a1) initWithProperty:v16 contact:v15 store:v14 policy:v13 linkedPolicies:v12];

  return v17;
}

@end