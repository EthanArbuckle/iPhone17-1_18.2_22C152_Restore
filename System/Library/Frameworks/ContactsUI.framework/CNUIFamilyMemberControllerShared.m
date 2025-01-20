@interface CNUIFamilyMemberControllerShared
+ (id)actionTitleAddNewContactForFamilyMember:(id)a3;
+ (id)actionTitleChooseFromContactsForFamilyMember:(id)a3;
+ (id)addContactsOptionsSheetForFamilyMember:(id)a3 delegate:(id)a4;
+ (id)addContactsToWhitelistOptionsSheetForFamilyMember:(id)a3 offerChooseFromFamilyMemberContactsOption:(BOOL)a4 delegate:(id)a5;
+ (id)contactMatchingFamilyMemberContactItem:(id)a3 fetchedFromContactStore:(id)a4 schedulerProvider:(id)a5;
+ (id)contactViewControllerForContact:(id)a3 fromStore:(id)a4;
+ (id)formattedNameOfFamilyMember:(id)a3;
+ (int64_t)contactsUIFetchStatusFromContactsUICoreFetchStatus:(int64_t)a3;
@end

@implementation CNUIFamilyMemberControllerShared

+ (int64_t)contactsUIFetchStatusFromContactsUICoreFetchStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_18B9C3888[a3 - 1];
  }
}

+ (id)actionTitleChooseFromContactsForFamilyMember:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend(a1, "formattedNameOfFamilyMember:");
    v4 = v3;
    if (v3 && [v3 length])
    {
      v5 = NSString;
      v6 = CNContactsUIBundle();
      v7 = [v6 localizedStringForKey:@"CHOOSE_FROM_YOUR_CHILD" value:&stru_1ED8AC728 table:@"Localized"];
      v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4);
    }
    else
    {
      v6 = CNContactsUIBundle();
      v8 = [v6 localizedStringForKey:@"CHOOSE_FROM_MY_CHILDS_CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];
    }
  }
  else
  {
    v4 = CNContactsUIBundle();
    v8 = [v4 localizedStringForKey:@"CHOOSE_FROM_MY_CHILDS_CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];
  }

  return v8;
}

+ (id)actionTitleAddNewContactForFamilyMember:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend(a1, "formattedNameOfFamilyMember:");
    v4 = v3;
    if (v3 && [v3 length])
    {
      v5 = NSString;
      v6 = CNContactsUIBundle();
      v7 = [v6 localizedStringForKey:@"ADD_NEW_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
      v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4);
    }
    else
    {
      v6 = CNContactsUIBundle();
      v8 = [v6 localizedStringForKey:@"ADD_NEW_CONTACT_FOR_MY_CHILD" value:&stru_1ED8AC728 table:@"Localized"];
    }
  }
  else
  {
    v4 = CNContactsUIBundle();
    v8 = [v4 localizedStringForKey:@"ADD_NEW_LOCAL_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
  }

  return v8;
}

+ (id)addContactsToWhitelistOptionsSheetForFamilyMember:(id)a3 offerChooseFromFamilyMemberContactsOption:(BOOL)a4 delegate:(id)a5
{
  BOOL v34 = a4;
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4FB1418];
  id v9 = a3;
  v10 = [v8 alertControllerWithTitle:0 message:0 preferredStyle:0];
  v11 = (void *)MEMORY[0x1E4FB1410];
  v12 = CNContactsUIBundle();
  v13 = [v12 localizedStringForKey:@"CHOOSE_FROM_MY_CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke;
  v46[3] = &unk_1E549BC48;
  id v14 = v7;
  id v47 = v14;
  id v15 = v10;
  id v48 = v15;
  v35 = [v11 actionWithTitle:v13 style:0 handler:v46];

  uint64_t v16 = [a1 actionTitleChooseFromContactsForFamilyMember:v9];
  v17 = (void *)MEMORY[0x1E4FB1410];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_2;
  v43[3] = &unk_1E549BC48;
  id v18 = v14;
  id v44 = v18;
  id v19 = v15;
  id v45 = v19;
  v36 = (void *)v16;
  v20 = [v17 actionWithTitle:v16 style:0 handler:v43];
  v21 = [a1 actionTitleAddNewContactForFamilyMember:v9];

  v22 = (void *)MEMORY[0x1E4FB1410];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_3;
  v40[3] = &unk_1E549BC48;
  id v23 = v18;
  id v41 = v23;
  id v24 = v19;
  id v42 = v24;
  v25 = [v22 actionWithTitle:v21 style:0 handler:v40];
  v26 = (void *)MEMORY[0x1E4FB1410];
  v27 = CNContactsUIBundle();
  v28 = [v27 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_4;
  v37[3] = &unk_1E549BC48;
  id v38 = v23;
  id v29 = v24;
  id v39 = v29;
  id v30 = v23;
  v31 = [v26 actionWithTitle:v28 style:1 handler:v37];

  [v29 addAction:v35];
  if (v9 && v34) {
    [v29 addAction:v20];
  }
  [v29 addAction:v25];
  [v29 addAction:v31];
  id v32 = v29;

  return v32;
}

uint64_t __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addContactsToWhitelistOptionsSheetDidSelectAddFromMainContacts:*(void *)(a1 + 40)];
}

uint64_t __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addContactsToWhitelistOptionsSheetDidSelectAddFromFamilyMemberContacts:*(void *)(a1 + 40)];
}

uint64_t __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) addContactsToWhitelistOptionsSheetDidSelectAddNewContact:*(void *)(a1 + 40)];
}

uint64_t __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) addContactsToWhitelistOptionsSheetDidCancel:*(void *)(a1 + 40)];
}

+ (id)addContactsOptionsSheetForFamilyMember:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4FB1418];
  id v8 = a3;
  id v9 = [v7 alertControllerWithTitle:0 message:0 preferredStyle:0];
  v10 = (void *)MEMORY[0x1E4FB1410];
  v11 = CNContactsUIBundle();
  v12 = [v11 localizedStringForKey:@"CHOOSE_FROM_MY_CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke;
  v35[3] = &unk_1E549BC48;
  id v13 = v6;
  id v36 = v13;
  id v14 = v9;
  id v37 = v14;
  id v15 = [v10 actionWithTitle:v12 style:0 handler:v35];

  uint64_t v16 = [a1 actionTitleAddNewContactForFamilyMember:v8];

  v17 = (void *)MEMORY[0x1E4FB1410];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke_2;
  v32[3] = &unk_1E549BC48;
  id v18 = v13;
  id v33 = v18;
  id v19 = v14;
  id v34 = v19;
  v20 = [v17 actionWithTitle:v16 style:0 handler:v32];
  v21 = (void *)MEMORY[0x1E4FB1410];
  v22 = CNContactsUIBundle();
  id v23 = [v22 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke_3;
  v29[3] = &unk_1E549BC48;
  id v30 = v18;
  id v24 = v19;
  id v31 = v24;
  id v25 = v18;
  v26 = [v21 actionWithTitle:v23 style:1 handler:v29];

  [v24 addAction:v15];
  [v24 addAction:v20];
  [v24 addAction:v26];
  id v27 = v24;

  return v27;
}

uint64_t __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addContactsOptionsSheetViewControllerDidSelectAddFromLocalContacts:*(void *)(a1 + 40)];
}

uint64_t __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addContactsOptionsSheetViewControllerDidSelectAddNewContact:*(void *)(a1 + 40)];
}

uint64_t __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) addContactsOptionsSheetViewControllerDidCancel:*(void *)(a1 + 40)];
}

+ (id)contactMatchingFamilyMemberContactItem:(id)a3 fetchedFromContactStore:(id)a4 schedulerProvider:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F5A408];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  id v17 = v8;
  id v18 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = a5;
  id v13 = objc_msgSend(v12, "backgroundScheduler", v16, 3221225472, __117__CNUIFamilyMemberControllerShared_contactMatchingFamilyMemberContactItem_fetchedFromContactStore_schedulerProvider___block_invoke, &unk_1E549A7A8);
  id v14 = [v9 futureWithBlock:&v16 scheduler:v13 schedulerProvider:v12];

  return v14;
}

id __117__CNUIFamilyMemberControllerShared_contactMatchingFamilyMemberContactItem_fetchedFromContactStore_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  v4 = [*(id *)(a1 + 40) contactIdentifier];
  v5 = +[CNContactViewController descriptorForRequiredKeys];
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v11 = 0;
  id v7 = [v3 unifiedContactWithIdentifier:v4 keysToFetch:v6 error:&v11];
  id v8 = v11;

  if (v7)
  {
    id v9 = v7;
  }
  else if (a2)
  {
    *a2 = v8;
  }

  return v7;
}

+ (id)contactViewControllerForContact:(id)a3 fromStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CNContactViewController viewControllerForContact:v6];
  [v7 setActions:127];
  [v7 setIgnoresParentalRestrictions:1];
  id v8 = [MEMORY[0x1E4F5A668] propertyKeysContainingSenstiveData];
  [v7 setProhibitedPropertyKeys:v8];

  [v7 setContactStore:v5];
  [v7 setDisplayMode:2];
  [v7 setContact:v6];

  return v7;
}

+ (id)formattedNameOfFamilyMember:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1BA40];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 firstName];
  [v5 setGivenName:v6];

  id v7 = [v4 lastName];

  [v5 setFamilyName:v7];
  id v8 = [MEMORY[0x1E4F1B910] stringFromContact:v5 style:1000];

  return v8;
}

@end