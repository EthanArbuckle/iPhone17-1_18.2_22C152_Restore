@interface CNContactPickerServiceViewController
- (BOOL)shouldRecordPrivateAccessToAggregator;
- (CNContactPickerServiceViewController)init;
- (id)_filteredContact:(id)a3 withKeys:(id)a4;
- (id)_filteredProperty:(id)a3;
- (void)_logPrivacyAccountingAccessEvent;
- (void)_logPrivateAccessEventForContactPickerUsage;
- (void)pickerDidCancel;
- (void)pickerDidCompleteWithNewContact:(id)a3;
- (void)pickerDidSelectAddNewContact;
- (void)pickerDidSelectContact:(id)a3 property:(id)a4;
- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CNContactPickerServiceViewController

- (void)_logPrivacyAccountingAccessEvent
{
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [(CNContactPickerServiceViewController *)self extensionContext];
  v3 = v2;
  if (v2)
  {
    [v2 _extensionHostAuditToken];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }

  v6[0] = v7;
  v6[1] = v8;
  v4 = [MEMORY[0x1E4F5A340] auditToken:v6];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F5A4D8]) initWithAuditToken:v4 assumedIdentity:0];
  [v5 logContactPickerAccessEvent];
}

- (void)_logPrivateAccessEventForContactPickerUsage
{
  v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:9];

  if (v5)
  {
    if ([(CNContactPickerServiceViewController *)self shouldRecordPrivateAccessToAggregator])
    {
      v6 = [(CNContactPickerContentViewController *)self managedConfiguration];
      long long v7 = [v6 clientBundleIdentifier];

      if (v7)
      {
        id v9 = [(CNContactPickerContentViewController *)self managedConfiguration];
        long long v8 = [v9 clientBundleIdentifier];
        +[CNPrivateAccessAggregator recordAccessForBundleIdentifier:v8];
      }
    }
  }
}

- (BOOL)shouldRecordPrivateAccessToAggregator
{
  uint64_t v3 = +[CNUIContactsEnvironment currentEnvironment];
  v4 = [(id)v3 authorizationContext];

  LOBYTE(v3) = [v4 isFullAccessGranted];
  int v5 = [(CNContactPickerContentViewController *)self managedConfiguration];
  v6 = [v5 clientBundleIdentifier];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 186, 5, @"%@ is %@ for full access:", v7, v8, v9, v10, (uint64_t)v6);

  return v3 ^ 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactPickerServiceViewController;
  [(CNContactPickerServiceViewController *)&v4 viewDidAppear:a3];
  [(CNContactPickerServiceViewController *)self _logPrivateAccessEventForContactPickerUsage];
}

- (void)pickerDidCancel
{
  id v2 = [(CNContactPickerServiceViewController *)self extensionContext];
  [v2 pickerDidCancel];
}

- (void)pickerDidCompleteWithNewContact:(id)a3
{
  id v8 = a3;
  objc_super v4 = v8;
  if (![(CNContactPickerContentViewController *)self clientHasContactsAccess])
  {
    if (v8)
    {
      int v5 = [(CNContactPickerContentViewController *)self displayedPropertyKeys];

      objc_super v4 = v8;
      if (v5)
      {
        v6 = [(CNContactPickerContentViewController *)self displayedPropertyKeys];
        objc_super v4 = [(CNContactPickerServiceViewController *)self _filteredContact:v8 withKeys:v6];
      }
    }
    else
    {
      objc_super v4 = 0;
    }
  }
  [(CNContactPickerServiceViewController *)self _logPrivacyAccountingAccessEvent];
  uint64_t v7 = [(CNContactPickerServiceViewController *)self extensionContext];
  [v7 pickerDidCompleteWithNewContact:v4];
}

- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = v9;
  v11 = v8;
  if ([(CNContactPickerContentViewController *)self clientHasContactsAccess]) {
    goto LABEL_23;
  }
  if (v8)
  {
    v12 = [(CNContactPickerContentViewController *)self displayedPropertyKeys];

    v11 = v8;
    if (v12)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v33;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v33 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * v17);
            v19 = [(CNContactPickerContentViewController *)self displayedPropertyKeys];
            v20 = [(CNContactPickerServiceViewController *)self _filteredContact:v18 withKeys:v19];

            [v11 addObject:v20];
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v15);
      }
    }
    if (v9) {
      goto LABEL_13;
    }
LABEL_22:
    uint64_t v10 = 0;
    goto LABEL_23;
  }
  v11 = 0;
  if (!v9) {
    goto LABEL_22;
  }
LABEL_13:
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v21 = v9;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = -[CNContactPickerServiceViewController _filteredProperty:](self, "_filteredProperty:", *(void *)(*((void *)&v28 + 1) + 8 * v25), (void)v28);
        [v10 addObject:v26];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v23);
  }

LABEL_23:
  [(CNContactPickerServiceViewController *)self _logPrivacyAccountingAccessEvent];
  v27 = [(CNContactPickerServiceViewController *)self extensionContext];
  [v27 pickerDidSelectContacts:v11 properties:v10];
}

- (void)pickerDidSelectContact:(id)a3 property:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v14 = v6;
  id v8 = v7;
  id v9 = v14;
  uint64_t v10 = v8;
  if (![(CNContactPickerContentViewController *)self clientHasContactsAccess])
  {
    if (v14)
    {
      v11 = [(CNContactPickerContentViewController *)self displayedPropertyKeys];

      id v9 = v14;
      if (v11)
      {
        v12 = [(CNContactPickerContentViewController *)self displayedPropertyKeys];
        id v9 = [(CNContactPickerServiceViewController *)self _filteredContact:v14 withKeys:v12];
      }
      if (v8) {
        goto LABEL_6;
      }
    }
    else
    {
      id v9 = 0;
      if (v8)
      {
LABEL_6:
        uint64_t v10 = [(CNContactPickerServiceViewController *)self _filteredProperty:v8];

        goto LABEL_9;
      }
    }
    uint64_t v10 = 0;
  }
LABEL_9:
  [(CNContactPickerServiceViewController *)self _logPrivacyAccountingAccessEvent];
  id v13 = [(CNContactPickerServiceViewController *)self extensionContext];
  [v13 pickerDidSelectContact:v9 property:v10];
}

- (void)pickerDidSelectAddNewContact
{
  [(CNContactPickerServiceViewController *)self _logPrivacyAccountingAccessEvent];
  id v3 = [(CNContactPickerServiceViewController *)self extensionContext];
  [v3 pickerDidSelectAddNewContact];
}

- (id)_filteredProperty:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 contact];
  id v6 = [v4 key];
  v14[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v8 = [(CNContactPickerServiceViewController *)self _filteredContact:v5 withKeys:v7];

  id v9 = (void *)MEMORY[0x1E4F1B970];
  uint64_t v10 = [v4 key];
  v11 = [v4 identifier];

  v12 = [v9 contactPropertyWithContact:v8 propertyKey:v10 identifier:v11];

  return v12;
}

- (id)_filteredContact:(id)a3 withKeys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_filteredContact_withKeys__cn_once_token_1 != -1) {
    dispatch_once(&_filteredContact_withKeys__cn_once_token_1, &__block_literal_global_24615);
  }
  id v7 = (id)_filteredContact_withKeys__cn_once_object_1;
  id v8 = v7;
  if ([v6 count])
  {
    id v8 = [v7 arrayByAddingObjectsFromArray:v6];
  }
  id v9 = (void *)[v5 copyWithPropertyKeys:v8];

  return v9;
}

void __66__CNContactPickerServiceViewController__filteredContact_withKeys___block_invoke()
{
  v15[26] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADF0];
  v15[0] = *MEMORY[0x1E4F1AEB0];
  v15[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1ADE0];
  v15[2] = *MEMORY[0x1E4F1AEA0];
  v15[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AEB8];
  v15[4] = *MEMORY[0x1E4F1AF30];
  v15[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AEF8];
  v15[6] = *MEMORY[0x1E4F1AEC0];
  v15[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AEF0];
  v15[8] = *MEMORY[0x1E4F1AF00];
  v15[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AED8];
  v15[10] = *MEMORY[0x1E4F1ADD0];
  v15[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1ADB8];
  v15[12] = *MEMORY[0x1E4F1AF08];
  v15[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AF28];
  v15[14] = *MEMORY[0x1E4F1AE78];
  v15[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1AE28];
  v15[16] = *MEMORY[0x1E4F1AF20];
  v15[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1AE20];
  v15[18] = *MEMORY[0x1E4F1AF98];
  v15[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F1AE88];
  v15[20] = *MEMORY[0x1E4F1AFA8];
  v15[21] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1ADE8];
  v15[22] = *MEMORY[0x1E4F1ADA8];
  v15[23] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1AF38];
  v15[24] = *MEMORY[0x1E4F1AF40];
  v15[25] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:26];
  id v14 = (void *)_filteredContact_withKeys__cn_once_object_1;
  _filteredContact_withKeys__cn_once_object_1 = v13;
}

- (CNContactPickerServiceViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactPickerServiceViewController;
  uint64_t v2 = [(CNContactPickerContentViewController *)&v4 init];
  [(CNContactPickerContentViewController *)v2 setDelegate:v2];
  return v2;
}

@end