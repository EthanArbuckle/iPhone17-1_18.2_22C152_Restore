@interface WFContactContentItemChangeTransaction
- (CNMutableContact)mutableContact;
- (NSArray)groupChangeRequest;
- (WFContactContentItemChangeTransaction)initWithContentItem:(id)a3;
- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4;
- (void)setGroupChangeRequest:(id)a3;
- (void)updateEmailAddresses:(id)a3;
- (void)updatePhoneNumbers:(id)a3;
- (void)updateStreetAddresses:(id)a3;
- (void)updateURLs:(id)a3;
@end

@implementation WFContactContentItemChangeTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupChangeRequest, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);
}

- (void)setGroupChangeRequest:(id)a3
{
}

- (NSArray)groupChangeRequest
{
  return self->_groupChangeRequest;
}

- (CNMutableContact)mutableContact
{
  return self->_mutableContact;
}

- (void)updateURLs:(id)a3
{
  id v4 = a3;
  v5 = [(WFContentItemChangeTransaction *)self mode];
  int v6 = [v5 isEqualToString:@"Append"];

  if (v6)
  {
    v7 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    v8 = [v7 urlAddresses];
    v9 = objc_msgSend(v4, "if_map:", &__block_literal_global_220);
    v10 = [v8 arrayByAddingObjectsFromArray:v9];
    v11 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v11 setUrlAddresses:v10];

LABEL_8:
    goto LABEL_9;
  }
  v12 = [(WFContentItemChangeTransaction *)self mode];
  int v13 = [v12 isEqualToString:@"Remove"];

  if (v13)
  {
    v14 = (void *)MEMORY[0x263EFFA08];
    v15 = [v4 valueForKey:@"absoluteString"];
    v16 = [v14 setWithArray:v15];

    v17 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    v18 = [v17 urlAddresses];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __52__WFContactContentItemChangeTransaction_updateURLs___block_invoke;
    v26[3] = &unk_2642885E8;
    id v27 = v16;
    id v19 = v16;
    v20 = objc_msgSend(v18, "if_objectsPassingTest:", v26);
    v21 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v21 setUrlAddresses:v20];
  }
  else
  {
    v22 = [(WFContentItemChangeTransaction *)self mode];
    int v23 = [v22 isEqualToString:@"RemoveAll"];

    if (!v23)
    {
      v7 = objc_msgSend(v4, "if_map:", &__block_literal_global_220);
      v25 = [(WFContactContentItemChangeTransaction *)self mutableContact];
      [v25 setUrlAddresses:v7];

      goto LABEL_8;
    }
    v24 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v24 setUrlAddresses:MEMORY[0x263EFFA68]];
  }
LABEL_9:
}

uint64_t __52__WFContactContentItemChangeTransaction_updateURLs___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 value];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)updateStreetAddresses:(id)a3
{
  id v4 = a3;
  v5 = [(WFContentItemChangeTransaction *)self mode];
  int v6 = [v5 isEqualToString:@"Append"];

  if (v6)
  {
    v7 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    v8 = [v7 postalAddresses];
    v9 = objc_msgSend(v4, "if_map:", &__block_literal_global_217);
    v10 = [v8 arrayByAddingObjectsFromArray:v9];
    v11 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v11 setPostalAddresses:v10];

LABEL_8:
    goto LABEL_9;
  }
  v12 = [(WFContentItemChangeTransaction *)self mode];
  int v13 = [v12 isEqualToString:@"Remove"];

  if (v13)
  {
    v14 = (void *)MEMORY[0x263EFFA08];
    v15 = [v4 valueForKey:@"postalAddress"];
    v16 = [v14 setWithArray:v15];

    v17 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    v18 = [v17 postalAddresses];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __63__WFContactContentItemChangeTransaction_updateStreetAddresses___block_invoke;
    v26[3] = &unk_2642885E8;
    id v27 = v16;
    id v19 = v16;
    v20 = objc_msgSend(v18, "if_objectsPassingTest:", v26);
    v21 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v21 setPostalAddresses:v20];
  }
  else
  {
    v22 = [(WFContentItemChangeTransaction *)self mode];
    int v23 = [v22 isEqualToString:@"RemoveAll"];

    if (!v23)
    {
      v7 = objc_msgSend(v4, "if_map:", &__block_literal_global_217);
      v25 = [(WFContactContentItemChangeTransaction *)self mutableContact];
      [v25 setPostalAddresses:v7];

      goto LABEL_8;
    }
    v24 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v24 setPostalAddresses:MEMORY[0x263EFFA68]];
  }
LABEL_9:
}

uint64_t __63__WFContactContentItemChangeTransaction_updateStreetAddresses___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 value];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)updateEmailAddresses:(id)a3
{
  id v4 = a3;
  v5 = [(WFContentItemChangeTransaction *)self mode];
  int v6 = [v5 isEqualToString:@"Append"];

  if (v6)
  {
    v7 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    v8 = [v7 emailAddresses];
    v9 = objc_msgSend(v4, "if_map:", &__block_literal_global_214);
    v10 = [v8 arrayByAddingObjectsFromArray:v9];
    v11 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v11 setEmailAddresses:v10];

LABEL_8:
    goto LABEL_9;
  }
  v12 = [(WFContentItemChangeTransaction *)self mode];
  int v13 = [v12 isEqualToString:@"Remove"];

  if (v13)
  {
    v14 = (void *)MEMORY[0x263EFFA08];
    v15 = [v4 valueForKey:@"address"];
    v16 = [v14 setWithArray:v15];

    v17 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    v18 = [v17 emailAddresses];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __62__WFContactContentItemChangeTransaction_updateEmailAddresses___block_invoke;
    v26[3] = &unk_2642885E8;
    id v27 = v16;
    id v19 = v16;
    v20 = objc_msgSend(v18, "if_objectsPassingTest:", v26);
    v21 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v21 setEmailAddresses:v20];
  }
  else
  {
    v22 = [(WFContentItemChangeTransaction *)self mode];
    int v23 = [v22 isEqualToString:@"RemoveAll"];

    if (!v23)
    {
      v7 = objc_msgSend(v4, "if_map:", &__block_literal_global_214);
      v25 = [(WFContactContentItemChangeTransaction *)self mutableContact];
      [v25 setEmailAddresses:v7];

      goto LABEL_8;
    }
    v24 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v24 setEmailAddresses:MEMORY[0x263EFFA68]];
  }
LABEL_9:
}

uint64_t __62__WFContactContentItemChangeTransaction_updateEmailAddresses___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 value];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)updatePhoneNumbers:(id)a3
{
  id v4 = a3;
  v5 = [(WFContentItemChangeTransaction *)self mode];
  int v6 = [v5 isEqualToString:@"Append"];

  if (v6)
  {
    v7 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    v8 = [v7 phoneNumbers];
    v9 = objc_msgSend(v4, "if_map:", &__block_literal_global_13688);
    v10 = [v8 arrayByAddingObjectsFromArray:v9];
    v11 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v11 setPhoneNumbers:v10];

LABEL_8:
    goto LABEL_9;
  }
  v12 = [(WFContentItemChangeTransaction *)self mode];
  int v13 = [v12 isEqualToString:@"Remove"];

  if (v13)
  {
    v14 = (void *)MEMORY[0x263EFFA08];
    v15 = [v4 valueForKey:@"normalizedPhoneNumber"];
    v16 = [v14 setWithArray:v15];

    v17 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    v18 = [v17 phoneNumbers];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __60__WFContactContentItemChangeTransaction_updatePhoneNumbers___block_invoke;
    v26[3] = &unk_2642885E8;
    id v27 = v16;
    id v19 = v16;
    v20 = objc_msgSend(v18, "if_objectsPassingTest:", v26);
    v21 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v21 setPhoneNumbers:v20];
  }
  else
  {
    v22 = [(WFContentItemChangeTransaction *)self mode];
    int v23 = [v22 isEqualToString:@"RemoveAll"];

    if (!v23)
    {
      v7 = objc_msgSend(v4, "if_map:", &__block_literal_global_13688);
      v25 = [(WFContactContentItemChangeTransaction *)self mutableContact];
      [v25 setPhoneNumbers:v7];

      goto LABEL_8;
    }
    v24 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    [v24 setPhoneNumbers:MEMORY[0x263EFFA68]];
  }
LABEL_9:
}

uint64_t __60__WFContactContentItemChangeTransaction_updatePhoneNumbers___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 value];
  id v4 = [v3 unformattedInternationalStringValue];
  uint64_t v5 = [v2 containsObject:v4] ^ 1;

  return v5;
}

- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  v7 = (void *)getCNSaveRequestClass_softClass_13698;
  uint64_t v49 = getCNSaveRequestClass_softClass_13698;
  if (!getCNSaveRequestClass_softClass_13698)
  {
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __getCNSaveRequestClass_block_invoke_13699;
    v45[3] = &unk_26428AC60;
    v45[4] = &v46;
    __getCNSaveRequestClass_block_invoke_13699((uint64_t)v45);
    v7 = (void *)v47[3];
  }
  id v36 = v6;
  v8 = v7;
  _Block_object_dispose(&v46, 8);
  id v9 = objc_alloc_init(v8);
  id v38 = objc_alloc_init((Class)getCNContactStoreClass_13700());
  v10 = [(WFContactContentItemChangeTransaction *)self mutableContact];
  if (v4) {
    [v9 addContact:v10 toContainerWithIdentifier:0];
  }
  else {
    [v9 updateContact:v10];
  }

  v11 = [(WFContactContentItemChangeTransaction *)self groupChangeRequest];

  if (v11)
  {
    v12 = +[WFCNContactGroup allContactGroups];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v42;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v42 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = *(void **)(*((void *)&v41 + 1) + 8 * v15);
          v17 = [(WFContentItemChangeTransaction *)self contentItem];
          v18 = [v17 contact];
          int v19 = [v16 containsContact:v18];

          if (v19)
          {
            v20 = [(WFContactContentItemChangeTransaction *)self mutableContact];
            v21 = [v16 group];
            [v9 removeMember:v20 fromGroup:v21];
          }
          v22 = [(WFContactContentItemChangeTransaction *)self groupChangeRequest];
          int v23 = [v16 name];
          int v24 = [v22 containsObject:v23];

          if (v24)
          {
            v25 = [(WFContactContentItemChangeTransaction *)self mutableContact];
            v26 = [v16 group];
            [v9 addMember:v25 toGroup:v26];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v13);
    }
  }
  id v40 = 0;
  char v27 = objc_msgSend(v38, "executeSaveRequest:error:", v9, &v40, v36);
  id v28 = v40;
  if (v27)
  {
    v29 = +[WFCNContact requiredKeysToFetch];
    v30 = [(WFContactContentItemChangeTransaction *)self mutableContact];
    v31 = [v30 identifier];
    id v39 = v28;
    v32 = [v38 unifiedContactWithIdentifier:v31 keysToFetch:v29 error:&v39];
    id v33 = v39;

    if (v32)
    {
      v34 = +[WFCNContact contactWithCNContact:v32];
      v35 = +[WFContentItem itemWithObject:v34];
      ((void (**)(void, void *, void))v37)[2](v37, v35, 0);
    }
    else
    {
      ((void (*)(void))v37[2])();
    }

    id v28 = v33;
  }
  else
  {
    ((void (**)(void, void, id))v37)[2](v37, 0, v28);
  }
}

- (WFContactContentItemChangeTransaction)initWithContentItem:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFContactContentItemChangeTransaction;
  uint64_t v5 = [(WFContentItemChangeTransaction *)&v17 initWithContentItem:v4];
  if (v5)
  {
    id v6 = [v4 contact];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v7 = objc_alloc_init((Class)getCNContactStoreClass_13700());
      v8 = [v6 contactIdentifier];
      id v9 = +[WFCNContact requiredKeysToFetch];
      id v16 = 0;
      v10 = [v7 unifiedContactWithIdentifier:v8 keysToFetch:v9 error:&v16];
      id v11 = v16;

      if (v10)
      {
        uint64_t v12 = [v10 mutableCopy];
        mutableContact = v5->_mutableContact;
        v5->_mutableContact = (CNMutableContact *)v12;

        uint64_t v14 = v5;
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

@end