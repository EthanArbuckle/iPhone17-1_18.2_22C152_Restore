@interface CNPropertyGroupItem
+ (CNPropertyGroupItem)propertyGroupItemWithLabel:(id)a3 group:(id)a4 contact:(id)a5;
+ (CNPropertyGroupItem)propertyGroupItemWithLabel:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6;
+ (CNPropertyGroupItem)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5;
+ (CNPropertyGroupItem)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6;
+ (Class)classForProperty:(id)a3;
+ (id)emptyValueForLabel:(id)a3;
+ (id)newPropertyGroupItemForProperty:(id)a3;
+ (void)deleteCoreRecentsEntriesMatchingProperty:(id)a3 recentsManager:(id)a4;
- (BOOL)allowsEmail;
- (BOOL)allowsIMessage;
- (BOOL)allowsPhone;
- (BOOL)allowsTTY;
- (BOOL)canRemove;
- (BOOL)canReorder;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToItem:(id)a3;
- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4;
- (BOOL)isFavorite;
- (BOOL)isFavoriteOfActionType:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)isReadonly;
- (BOOL)isSuggested;
- (BOOL)isValidIdentifier:(id)a3;
- (BOOL)isValidValue:(id)a3;
- (BOOL)modified;
- (BOOL)shouldCreateNewMeContactToSaveChangesTo;
- (BOOL)shouldDisableLabelButton;
- (BOOL)showValueWithLabelStyle;
- (BOOL)supportsLabel;
- (CNCardPropertyGroup)group;
- (CNContact)contact;
- (CNContactProperty)contactProperty;
- (CNContactStore)contactStore;
- (CNLabeledValue)labeledValue;
- (CNLabeledValue)originalLabeledValue;
- (CNMutableContact)mutableContact;
- (CNPropertyGroupItem)init;
- (CNPropertyGroupItem)initWithGroup:(id)a3;
- (CNPropertyGroupItem)initWithLabel:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6;
- (CNPropertyGroupItem)initWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6;
- (CNPropertyGroupItemDelegate)delegate;
- (CNUIContactsEnvironment)environment;
- (NSArray)extendedLabels;
- (NSArray)promotedExtendedLabels;
- (NSArray)standardLabels;
- (NSString)displayLabel;
- (NSString)displayValue;
- (NSString)placeholderString;
- (NSString)property;
- (NSURL)defaultActionURL;
- (id)bestLabel:(id)a3;
- (id)bestValue:(id)a3;
- (id)contactViewCache;
- (id)description;
- (id)displayStringForValue:(id)a3;
- (id)labeledValueToCurateFromSuggestion;
- (id)normalizedValue;
- (id)replacementForInvalidValue:(id)a3;
- (id)updateWithLabel:(id)a3 value:(id)a4;
- (id)valueForDisplayString:(id)a3;
- (int)anyContactLegacyIdentifier;
- (int)labeledValueMultiValueIdentifierForChosenSourceContact;
- (unint64_t)policyFlags;
- (void)_removeSuggestion;
- (void)confirmSuggestion;
- (void)mergeItem:(id)a3;
- (void)saveChangesImmediately:(BOOL)a3;
- (void)setAllowsEmail:(BOOL)a3;
- (void)setAllowsIMessage:(BOOL)a3;
- (void)setAllowsPhone:(BOOL)a3;
- (void)setAllowsTTY:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLabeledValue:(id)a3;
- (void)setOriginalLabeledValue:(id)a3;
- (void)setPolicyFlags:(unint64_t)a3;
- (void)setProperty:(id)a3;
- (void)updateLabeledValueWithLabel:(id)a3;
- (void)updateLabeledValueWithValue:(id)a3;
@end

@implementation CNPropertyGroupItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_originalLabeledValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_destroyWeak((id *)&self->_group);

  objc_storeStrong((id *)&self->_labeledValue, 0);
}

- (void)setPolicyFlags:(unint64_t)a3
{
  self->_policyFlags = a3;
}

- (unint64_t)policyFlags
{
  return self->_policyFlags;
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void)setOriginalLabeledValue:(id)a3
{
}

- (CNLabeledValue)originalLabeledValue
{
  return self->_originalLabeledValue;
}

- (void)setAllowsEmail:(BOOL)a3
{
  self->_allowsEmail = a3;
}

- (BOOL)allowsEmail
{
  return self->_allowsEmail;
}

- (void)setAllowsTTY:(BOOL)a3
{
  self->_allowsTTY = a3;
}

- (BOOL)allowsTTY
{
  return self->_allowsTTY;
}

- (void)setAllowsPhone:(BOOL)a3
{
  self->_allowsPhone = a3;
}

- (BOOL)allowsPhone
{
  return self->_allowsPhone;
}

- (void)setAllowsIMessage:(BOOL)a3
{
  self->_allowsIMessage = a3;
}

- (BOOL)allowsIMessage
{
  return self->_allowsIMessage;
}

- (void)setDelegate:(id)a3
{
}

- (CNPropertyGroupItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPropertyGroupItemDelegate *)WeakRetained;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setProperty:(id)a3
{
}

- (NSString)property
{
  return self->_property;
}

- (CNCardPropertyGroup)group
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_group);

  return (CNCardPropertyGroup *)WeakRetained;
}

- (void)setLabeledValue:(id)a3
{
}

- (CNLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (BOOL)shouldCreateNewMeContactToSaveChangesTo
{
  if (![(CNPropertyGroupItem *)self modified]) {
    return 0;
  }
  v3 = [(CNPropertyGroupItem *)self mutableContact];
  if ([v3 isSuggestedMe])
  {
    uint64_t v4 = *MEMORY[0x1E4F5A258];
    v5 = [(CNPropertyGroupItem *)self mutableContact];
    v6 = [v5 linkedContacts];
    char v7 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)saveChangesImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if ([(CNPropertyGroupItem *)self modified])
  {
    v5 = [(CNPropertyGroupItem *)self mutableContact];
    if (v5)
    {
      v6 = [(CNPropertyGroupItem *)self labeledValue];
      char v7 = [v6 identifier];
      v8 = [(CNPropertyGroupItem *)self contactViewCache];
      v9 = [v8 policyForContact:v5];

      if (([v9 isReadonly] & 1) == 0)
      {
        v10 = [v6 value];
        BOOL v11 = [(CNPropertyGroupItem *)self isValidValue:v10];

        v12 = [(CNPropertyGroupItem *)self property];
        LODWORD(v10) = +[CNContactView isMultiValueProperty:v12];

        if (v10)
        {
          BOOL v60 = v11;
          BOOL v61 = v3;
          v65 = v6;
          v67 = v9;
          v13 = [(CNPropertyGroupItem *)self property];
          v62 = v5;
          uint64_t v14 = [v5 valueForKey:v13];

          v63 = (void *)v14;
          [MEMORY[0x1E4F1CA48] arrayWithArray:v14];
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = [v15 countByEnumeratingWithState:&v69 objects:v78 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = 0;
            uint64_t v19 = *(void *)v70;
            while (2)
            {
              uint64_t v20 = 0;
              uint64_t v64 = v18 + v17;
              do
              {
                if (*(void *)v70 != v19) {
                  objc_enumerationMutation(v15);
                }
                v21 = *(void **)(*((void *)&v69 + 1) + 8 * v20);
                v22 = [v21 identifier];
                if ([v22 isEqualToString:v7])
                {
                  v23 = [v21 identifier];
                  BOOL v24 = [(CNPropertyGroupItem *)self isValidIdentifier:v23];

                  if (v24)
                  {
                    if (v60)
                    {
                      v6 = v65;
                      [v15 setObject:v65 atIndexedSubscript:v18 + v20];

                      v5 = v62;
                    }
                    else
                    {
                      [v15 removeObjectAtIndex:v18 + v20];

                      v31 = [(CNPropertyGroupItem *)self environment];
                      v32 = [v31 recentsManager];

                      v33 = (void *)MEMORY[0x1E4F1B970];
                      v34 = [(CNPropertyGroupItem *)self contact];
                      v35 = [(CNPropertyGroupItem *)self property];
                      v36 = [(CNPropertyGroupItem *)self originalLabeledValue];
                      v37 = [v36 identifier];
                      v38 = [v33 contactPropertyWithContactNoCopy:v34 propertyKey:v35 identifier:v37];

                      [(id)objc_opt_class() deleteCoreRecentsEntriesMatchingProperty:v38 recentsManager:v32];
                      v5 = v62;
                      v6 = v65;
                    }
                    BOOL v3 = v61;
                    goto LABEL_29;
                  }
                }
                else
                {
                }
                ++v20;
              }
              while (v17 != v20);
              uint64_t v17 = [v15 countByEnumeratingWithState:&v69 objects:v78 count:16];
              uint64_t v18 = v64;
              if (v17) {
                continue;
              }
              break;
            }
          }

          v5 = v62;
          v6 = v65;
          BOOL v3 = v61;
          if (v60) {
            [v15 addObject:v65];
          }
LABEL_29:
          v39 = CNUILogContactCard();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = [(CNPropertyGroupItem *)self property];
            *(_DWORD *)buf = 138543618;
            id v75 = v40;
            __int16 v76 = 2050;
            v77 = v5;
            _os_log_impl(&dword_18B625000, v39, OS_LOG_TYPE_DEFAULT, "[CNPropertyGroupItem] updating contact value (multivalue) for property %{public}@, contact %{public}p", buf, 0x16u);
          }
          v41 = [(CNPropertyGroupItem *)self property];
          [v5 setValue:v15 forKey:v41];

          v9 = v67;
          v28 = v63;
        }
        else
        {
          v25 = CNUILogContactCard();
          BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            if (v26)
            {
              v27 = [(CNPropertyGroupItem *)self property];
              *(_DWORD *)buf = 138543618;
              id v75 = v27;
              __int16 v76 = 2050;
              v77 = v5;
              _os_log_impl(&dword_18B625000, v25, OS_LOG_TYPE_DEFAULT, "[CNPropertyGroupItem] updating contact value for property %{public}@, contact %{public}p", buf, 0x16u);
            }
            v28 = [v6 value];
            v29 = [(CNPropertyGroupItem *)self property];
            [v5 setValue:v28 forKey:v29];
          }
          else
          {
            if (v26)
            {
              v30 = [(CNPropertyGroupItem *)self property];
              *(_DWORD *)buf = 138543618;
              id v75 = v30;
              __int16 v76 = 2050;
              v77 = v5;
              _os_log_impl(&dword_18B625000, v25, OS_LOG_TYPE_DEFAULT, "[CNPropertyGroupItem] updating contact value for property %{public}@, contact %{public}p to nil", buf, 0x16u);
            }
            v28 = [(CNPropertyGroupItem *)self property];
            [v5 setValue:0 forKey:v28];
          }
        }
      }
      v42 = [(CNPropertyGroupItem *)self contactViewCache];
      v43 = [v42 contactStore];

      if (v3 && v43)
      {
        if ([(CNPropertyGroupItem *)self shouldCreateNewMeContactToSaveChangesTo])
        {
          v66 = v6;
          v68 = v9;
          v44 = [(CNPropertyGroupItem *)self contact];
          v45 = +[CNDonatedMeCardPersistenceHelper defaultKeysForValuesToPersist];
          id v46 = +[CNDonatedMeCardPersistenceHelper mutableCopyOfContact:v44 byCopyingValuesForKeysOnly:v45];

          v47 = CNUILogContactCard();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134349056;
            id v75 = v46;
            _os_log_impl(&dword_18B625000, v47, OS_LOG_TYPE_DEFAULT, "[CNPropertyGroupItem] creating new me contact %{public}p", buf, 0xCu);
          }

          v48 = [(CNPropertyGroupItem *)self property];
          char v49 = [v48 isEqualToString:*MEMORY[0x1E4F1AED0]];
          v50 = [(CNPropertyGroupItem *)self labeledValue];
          v51 = v50;
          if (v49)
          {
            [v50 value];
          }
          else
          {
            v73 = v50;
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
          v56 = };

          v57 = [MEMORY[0x1E4F1B898] contactPropertiesByKey];
          v58 = [(CNPropertyGroupItem *)self property];
          v59 = [v57 objectForKeyedSubscript:v58];
          [v59 setCNValue:v56 onContact:v46];

          +[CNDonatedMeCardPersistenceHelper createNewMeContact:v46 inStore:v43];
          v6 = v66;
          v9 = v68;
        }
        else
        {
          v52 = CNUILogContactCard();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134349056;
            id v75 = v5;
            _os_log_impl(&dword_18B625000, v52, OS_LOG_TYPE_DEFAULT, "[CNPropertyGroupItem] saving contact %{public}p", buf, 0xCu);
          }

          v53 = [(CNPropertyGroupItem *)self delegate];
          char v54 = objc_opt_respondsToSelector();

          if (v54)
          {
            id v46 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
            v55 = [(CNPropertyGroupItem *)self delegate];
            objc_msgSend(v46, "setIgnoresGuardianRestrictions:", objc_msgSend(v55, "propertyItemCanIgnoreGuardianRestrictions"));
          }
          else
          {
            id v46 = 0;
          }
          [v5 saveContactInStore:v43 group:0 container:0 request:v46];
        }
      }
    }
  }
}

- (void)confirmSuggestion
{
  id v3 = [(CNPropertyGroupItem *)self labeledValueToCurateFromSuggestion];
  [(CNPropertyGroupItem *)self _removeSuggestion];
  [(CNPropertyGroupItem *)self setLabeledValue:v3];
  [(CNPropertyGroupItem *)self saveChangesImmediately:1];
}

- (id)labeledValueToCurateFromSuggestion
{
  id v3 = (void *)MEMORY[0x1E4F1BA20];
  uint64_t v4 = [(CNPropertyGroupItem *)self labeledValue];
  v5 = [v4 label];
  v6 = [(CNPropertyGroupItem *)self labeledValue];
  char v7 = [v6 value];
  v8 = [v3 labeledValueWithLabel:v5 value:v7];

  return v8;
}

- (void)_removeSuggestion
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(CNPropertyGroupItem *)self labeledValue];
  v5 = [v4 label];
  v6 = [v3 emptyValueForLabel:v5];
  [(CNPropertyGroupItem *)self updateLabeledValueWithValue:v6];

  [(CNPropertyGroupItem *)self saveChangesImmediately:0];
}

- (BOOL)isSuggested
{
  v2 = [(CNPropertyGroupItem *)self labeledValue];
  char v3 = [v2 isSuggested];

  return v3;
}

- (BOOL)modified
{
  v5 = [(CNPropertyGroupItem *)self labeledValue];
  if (v5
    || ([(CNPropertyGroupItem *)self originalLabeledValue],
        (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v3 = [(CNPropertyGroupItem *)self labeledValue];
    v6 = [(CNPropertyGroupItem *)self originalLabeledValue];
    int v7 = [v3 isEqual:v6];

    if (v5)
    {

      if (!v7) {
        return v7 ^ 1;
      }
    }
    else
    {

      if ((v7 & 1) == 0)
      {
        LOBYTE(v7) = 0;
        return v7 ^ 1;
      }
    }
  }
  v8 = [(CNPropertyGroupItem *)self property];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1AEE0]];

  if (v9)
  {
    v10 = [(CNPropertyGroupItem *)self labeledValue];
    BOOL v11 = [v10 value];

    v12 = [(CNPropertyGroupItem *)self originalLabeledValue];
    v13 = [v12 value];

    uint64_t v14 = [v11 stringValue];
    if (v14 || ([v13 stringValue], (char v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v15 = [v11 stringValue];
      uint64_t v16 = [v13 stringValue];
      LOBYTE(v7) = [v15 isEqual:v16];

      if (v14)
      {
LABEL_16:

        return v7 ^ 1;
      }
    }
    else
    {
      LOBYTE(v7) = 1;
    }

    goto LABEL_16;
  }
  LOBYTE(v7) = 1;
  return v7 ^ 1;
}

- (BOOL)isValidIdentifier:(id)a3
{
  if (a3) {
    return 1;
  }
  uint64_t v4 = [(CNPropertyGroupItem *)self property];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F1ADA0]];

  return v5;
}

- (void)updateLabeledValueWithLabel:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(CNPropertyGroupItem *)self labeledValue];
  id v5 = [v4 label];

  if (v5 != v9)
  {
    v6 = [(CNPropertyGroupItem *)self labeledValue];
    int v7 = [v6 value];
    v8 = [(CNPropertyGroupItem *)self updateWithLabel:v9 value:v7];
    [(CNPropertyGroupItem *)self setLabeledValue:v8];
  }
}

- (void)updateLabeledValueWithValue:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(CNPropertyGroupItem *)self labeledValue];
  id v5 = [v4 value];

  v6 = v13;
  if (v5 != v13)
  {
    int v7 = [(CNPropertyGroupItem *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(CNPropertyGroupItem *)self delegate];
      [v9 propertyItem:self willChangeValue:v13];
    }
    v10 = [(CNPropertyGroupItem *)self labeledValue];
    BOOL v11 = [v10 label];
    v12 = [(CNPropertyGroupItem *)self updateWithLabel:v11 value:v13];
    [(CNPropertyGroupItem *)self setLabeledValue:v12];

    v6 = v13;
  }
}

- (id)updateWithLabel:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(CNPropertyGroupItem *)self labeledValue];

  if (v8)
  {
    id v9 = [(CNPropertyGroupItem *)self labeledValue];
    v10 = [v9 labeledValueBySettingLabel:v6 value:v7];
  }
  else
  {
    v10 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v6 value:v7];
  }
  [(CNPropertyGroupItem *)self setLabeledValue:v10];

  return v10;
}

- (void)mergeItem:(id)a3
{
  id v16 = a3;
  if (!-[CNPropertyGroupItem isEquivalentToItem:whenEditing:](self, "isEquivalentToItem:whenEditing:")
    && ![(CNPropertyGroupItem *)self isEquivalentToItem:v16 whenEditing:1])
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"CNPropertyGroupItem.m" lineNumber:476 description:@"These two items can’t be merged"];
  }
  id v5 = [(CNPropertyGroupItem *)self bestValue:v16];
  id v6 = [(CNPropertyGroupItem *)self bestLabel:v16];
  id v7 = [(CNPropertyGroupItem *)self labeledValue];
  char v8 = [v7 identifier];

  if (v5)
  {
    id v9 = [v16 labeledValue];
    v10 = [v9 value];

    if (v5 == v10)
    {
      BOOL v11 = [v16 contact];
      [(CNPropertyGroupItem *)self setContact:v11];

      v12 = [v16 labeledValue];
      uint64_t v13 = [v12 identifier];

      char v8 = (void *)v13;
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F1BA20] entryWithIdentifier:v8 label:v6 value:v5];
  [(CNPropertyGroupItem *)self setLabeledValue:v14];
}

- (id)bestLabel:(id)a3
{
  uint64_t v4 = (CNPropertyGroupItem *)a3;
  id v5 = [(CNPropertyGroupItem *)self labeledValue];
  id v6 = [v5 label];
  if (v6)
  {
  }
  else
  {
    id v7 = [(CNPropertyGroupItem *)v4 labeledValue];
    char v8 = [v7 label];

    id v9 = v4;
    if (v8) {
      goto LABEL_7;
    }
  }
  v10 = (void *)*MEMORY[0x1E4F1B700];
  BOOL v11 = [(CNPropertyGroupItem *)self labeledValue];
  v12 = [v11 label];
  uint64_t v13 = [v10 compare:v12 options:1];

  if (v13) {
    id v9 = self;
  }
  else {
    id v9 = v4;
  }
LABEL_7:
  uint64_t v14 = [(CNPropertyGroupItem *)v9 labeledValue];
  id v15 = [v14 label];

  return v15;
}

- (id)bestValue:(id)a3
{
  uint64_t v4 = (CNPropertyGroupItem *)a3;
  id v5 = [(CNPropertyGroupItem *)self labeledValue];
  uint64_t v6 = [v5 value];
  if (v6)
  {
    id v7 = (void *)v6;
    char v8 = [(CNPropertyGroupItem *)v4 labeledValue];
    id v9 = [v8 value];

    if (!v9) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  v10 = [(CNPropertyGroupItem *)v4 labeledValue];
  uint64_t v11 = [v10 value];
  if (!v11)
  {

    goto LABEL_9;
  }
  v12 = (void *)v11;
  uint64_t v13 = [(CNPropertyGroupItem *)self labeledValue];
  uint64_t v14 = [v13 value];

  id v15 = v4;
  if (v14) {
LABEL_9:
  }
    id v15 = self;
  id v16 = [(CNPropertyGroupItem *)v15 labeledValue];
  uint64_t v17 = [v16 value];

  return v17;
}

- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = (!v4 || !-[CNPropertyGroupItem isReadonly](self, "isReadonly") && ([v6 isReadonly] & 1) == 0)
    && [(CNPropertyGroupItem *)self isEquivalentToItem:v6];

  return v7;
}

- (BOOL)isEquivalentToItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyGroupItem *)self contact];
  id v6 = [v4 contact];
  if (v5 == v6)
  {
    char v9 = 0;
  }
  else
  {
    BOOL v7 = [(CNPropertyGroupItem *)self normalizedValue];
    char v8 = [v4 normalizedValue];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)canReorder
{
  return 0;
}

- (NSURL)defaultActionURL
{
  return 0;
}

- (BOOL)isFavoriteOfActionType:(id)a3 bundleIdentifier:(id)a4
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  int v9 = [v8 areFavoritesAvailable];

  if (!v9) {
    goto LABEL_4;
  }
  uint64_t v10 = *MEMORY[0x1E4F1AEE0];
  v24[0] = *MEMORY[0x1E4F1ADC8];
  v24[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1AE60];
  v24[2] = *MEMORY[0x1E4F1AF78];
  v24[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  uint64_t v13 = [(CNPropertyGroupItem *)self property];
  int v14 = [v12 containsObject:v13];

  if (v14)
  {
    id v15 = [(CNPropertyGroupItem *)self environment];
    id v16 = [v15 inProcessFavorites];

    uint64_t v17 = [(CNPropertyGroupItem *)self contact];
    uint64_t v18 = [(CNPropertyGroupItem *)self property];
    uint64_t v19 = [(CNPropertyGroupItem *)self labeledValue];
    uint64_t v20 = [v19 identifier];
    v21 = [v16 entriesForContact:v17 propertyKey:v18 labeledValueIdentifier:v20 actionType:v6 bundleIdentifier:v7];
    BOOL v22 = [v21 count] != 0;
  }
  else
  {
LABEL_4:
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)isFavorite
{
  return [(CNPropertyGroupItem *)self isFavoriteOfActionType:0 bundleIdentifier:0];
}

- (BOOL)canRemove
{
  return ![(CNPropertyGroupItem *)self isReadonly];
}

- (BOOL)showValueWithLabelStyle
{
  return 0;
}

- (BOOL)shouldDisableLabelButton
{
  return 0;
}

- (BOOL)supportsLabel
{
  return 1;
}

- (BOOL)isReadonly
{
  if (![(CNPropertyGroupItem *)self policyFlags])
  {
    char v3 = [(CNPropertyGroupItem *)self group];
    id v4 = [v3 policyForItem:self];

    if ([v4 isReadonly]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    [(CNPropertyGroupItem *)self setPolicyFlags:v5];
  }
  return ([(CNPropertyGroupItem *)self policyFlags] >> 1) & 1;
}

- (BOOL)isEmpty
{
  v2 = [(CNPropertyGroupItem *)self labeledValue];
  char v3 = [v2 value];
  BOOL v4 = v3 == 0;

  return v4;
}

- (id)replacementForInvalidValue:(id)a3
{
  BOOL v4 = objc_opt_class();
  uint64_t v5 = [(CNPropertyGroupItem *)self labeledValue];
  id v6 = [v5 label];
  id v7 = [v4 emptyValueForLabel:v6];

  return v7;
}

- (BOOL)isValidValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(CNPropertyGroupItem *)self labeledValue];
  id v7 = [v6 label];
  char v8 = [v5 emptyValueForLabel:v7];

  if (v4)
  {
    int v9 = [(CNPropertyGroupItem *)self displayStringForValue:v4];
    if ([v9 length]) {
      int v10 = [v4 isEqual:v8] ^ 1;
    }
    else {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)valueForDisplayString:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)displayStringForValue:(id)a3
{
  return (id)[a3 description];
}

- (NSArray)promotedExtendedLabels
{
  id v3 = [(CNPropertyGroupItem *)self group];
  id v4 = [v3 labelsForItem:self options:3];

  return (NSArray *)v4;
}

- (NSArray)extendedLabels
{
  id v3 = [(CNPropertyGroupItem *)self group];
  id v4 = [v3 labelsForItem:self options:1];

  return (NSArray *)v4;
}

- (NSArray)standardLabels
{
  id v3 = [(CNPropertyGroupItem *)self group];
  id v4 = [v3 labelsForItem:self options:0];

  return (NSArray *)v4;
}

- (NSString)placeholderString
{
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = [(CNPropertyGroupItem *)self property];
  id v4 = [v2 localizedStringForKey:v3];

  return (NSString *)v4;
}

- (NSString)displayLabel
{
  id v3 = (void *)MEMORY[0x1E4F1BA20];
  id v4 = [(CNPropertyGroupItem *)self labeledValue];
  uint64_t v5 = [v4 label];
  id v6 = [(CNPropertyGroupItem *)self property];
  id v7 = [v3 localizedDisplayStringForLabel:v5 propertyName:v6];

  return (NSString *)v7;
}

- (NSString)displayValue
{
  id v3 = [(CNPropertyGroupItem *)self labeledValue];
  id v4 = [v3 value];
  uint64_t v5 = [(CNPropertyGroupItem *)self displayStringForValue:v4];

  return (NSString *)v5;
}

- (id)normalizedValue
{
  v2 = [(CNPropertyGroupItem *)self labeledValue];
  id v3 = [v2 value];

  return v3;
}

- (id)contactViewCache
{
  id v3 = [(CNPropertyGroupItem *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(CNPropertyGroupItem *)self delegate];
    id v6 = [v5 contactViewCache];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (CNMutableContact)mutableContact
{
  id v3 = [(CNPropertyGroupItem *)self contact];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(CNPropertyGroupItem *)self contact];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (CNMutableContact *)v5;
}

- (int)labeledValueMultiValueIdentifierForChosenSourceContact
{
  v2 = [(CNPropertyGroupItem *)self contactProperty];
  int v3 = [v2 multiValueIdentifier];

  return v3;
}

- (int)anyContactLegacyIdentifier
{
  v2 = [(CNPropertyGroupItem *)self contactProperty];
  int v3 = [v2 sourceContact];
  int v4 = [v3 iOSLegacyIdentifier];

  return v4;
}

- (CNContactProperty)contactProperty
{
  int v3 = (void *)MEMORY[0x1E4F1B970];
  int v4 = [(CNPropertyGroupItem *)self contact];
  uint64_t v5 = [(CNPropertyGroupItem *)self property];
  id v6 = [(CNPropertyGroupItem *)self labeledValue];
  id v7 = [v6 identifier];
  char v8 = [v3 contactPropertyWithContactNoCopy:v4 propertyKey:v5 identifier:v7];

  return (CNContactProperty *)v8;
}

- (id)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CNPropertyGroupItem *)self property];
  id v6 = [(CNPropertyGroupItem *)self labeledValue];
  id v7 = [v6 label];
  char v8 = [(CNPropertyGroupItem *)self labeledValue];
  int v9 = [v8 value];
  BOOL v10 = [(CNPropertyGroupItem *)self isReadonly];
  uint64_t v11 = &stru_1ED8AC728;
  if (v10) {
    uint64_t v11 = @", RO";
  }
  v12 = [v3 stringWithFormat:@"<%@ %p> [%@] %@: %@ (contact%@)", v4, self, v5, v7, v9, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CNPropertyGroupItem *)self labeledValue];
    id v7 = [v5 labeledValue];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (CNPropertyGroupItem)initWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(CNPropertyGroupItem *)self initWithGroup:v13];
  if (v16)
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2 object:v16 file:@"CNPropertyGroupItem.m" lineNumber:124 description:0];
      }
    }
    objc_storeStrong((id *)&v16->_labeledValue, a3);
    uint64_t v17 = [v13 property];
    uint64_t v18 = (void *)*MEMORY[0x1E4F1AD88];

    labeledValue = v16->_labeledValue;
    if (v17 == v18) {
      uint64_t v20 = (CNLabeledValue *)[(CNLabeledValue *)labeledValue copy];
    }
    else {
      uint64_t v20 = labeledValue;
    }
    originalLabeledValue = v16->_originalLabeledValue;
    v16->_originalLabeledValue = v20;

    objc_storeStrong((id *)&v16->_contact, a5);
    objc_storeStrong((id *)&v16->_environment, a6);
  }

  return v16;
}

- (CNPropertyGroupItem)initWithLabel:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(id)objc_opt_class() initialValueForLabel:v10 group:v11];
  id v15 = [v11 property];
  int v16 = [v15 isEqualToString:@"birthdays"];

  if (v16) {
    [MEMORY[0x1E4F1BA20] entryWithIdentifier:v10 label:v10 value:v14];
  }
  else {
  uint64_t v17 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v10 value:v14];
  }
  uint64_t v18 = [(CNPropertyGroupItem *)self initWithLabeledValue:v17 group:v11 contact:v13 environment:v12];

  if (v18)
  {
    uint64_t v19 = [(id)objc_opt_class() emptyValueForLabel:v10];
    originalLabeledValue = v18->_originalLabeledValue;
    v18->_originalLabeledValue = (CNLabeledValue *)v19;
  }
  return v18;
}

- (CNPropertyGroupItem)initWithGroup:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPropertyGroupItem;
  id v5 = [(CNPropertyGroupItem *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_group, v4);
    uint64_t v7 = [v4 property];
    property = v6->_property;
    v6->_property = (NSString *)v7;
  }
  return v6;
}

- (CNPropertyGroupItem)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CNPropertyGroupItem.m" lineNumber:89 description:@"Use the factory method to create instances of this class."];

  return 0;
}

+ (void)deleteCoreRecentsEntriesMatchingProperty:(id)a3 recentsManager:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v13[0] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  char v8 = [v6 arrayWithObjects:v13 count:1];
  int v9 = [v5 recentContactsMatchingContactProperties:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__CNPropertyGroupItem_deleteCoreRecentsEntriesMatchingProperty_recentsManager___block_invoke;
  v11[3] = &unk_1E5499068;
  id v12 = v5;
  id v10 = v5;
  [v9 addSuccessBlock:v11];
}

uint64_t __79__CNPropertyGroupItem_deleteCoreRecentsEntriesMatchingProperty_recentsManager___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeRecents:a2 completionHandler:0];
}

+ (id)newPropertyGroupItemForProperty:(id)a3
{
  int v3 = (objc_class *)[a1 classForProperty:a3];

  return [v3 alloc];
}

+ (Class)classForProperty:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F1AEE0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADC8]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADB0]] & 1) == 0
    && ([v3 isEqualToString:@"birthdays"] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AE60]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF10]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF78]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AFB0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADA0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF90]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF50]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AED0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF18]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADC0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AD88]] & 1) == 0)
  {
    [v3 isEqualToString:*MEMORY[0x1E4F1AF70]];
  }
  id v4 = (objc_class *)self;

  return v4;
}

+ (CNPropertyGroupItem)propertyGroupItemWithLabel:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v12 property];
  id v15 = objc_msgSend((id)objc_msgSend(a1, "newPropertyGroupItemForProperty:", v14), "initWithLabel:group:contact:environment:", v13, v12, v11, v10);

  return (CNPropertyGroupItem *)v15;
}

+ (CNPropertyGroupItem)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v12 property];
  id v15 = objc_msgSend((id)objc_msgSend(a1, "newPropertyGroupItemForProperty:", v14), "initWithLabeledValue:group:contact:environment:", v13, v12, v11, v10);

  return (CNPropertyGroupItem *)v15;
}

+ (CNPropertyGroupItem)propertyGroupItemWithLabel:(id)a3 group:(id)a4 contact:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[CNUIContactsEnvironment currentEnvironment];
  id v12 = [a1 propertyGroupItemWithLabel:v10 group:v9 contact:v8 environment:v11];

  return (CNPropertyGroupItem *)v12;
}

+ (CNPropertyGroupItem)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[CNUIContactsEnvironment currentEnvironment];
  id v12 = [a1 propertyGroupItemWithLabeledValue:v10 group:v9 contact:v8 environment:v11];

  return (CNPropertyGroupItem *)v12;
}

+ (id)emptyValueForLabel:(id)a3
{
  return &stru_1ED8AC728;
}

@end