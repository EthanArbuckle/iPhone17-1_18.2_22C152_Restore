@interface CNMailToGroup
+ (id)bestGuessEmailAddressForAddresses:(id)a3 sendingAddressDomain:(id)a4 alreadyDuetRanked:(BOOL)a5;
+ (id)bestGuessEmailAddressForContact:(id)a3;
+ (id)bestGuessEmailAddressForContact:(id)a3 sendingAddressDomain:(id)a4;
+ (id)descriptorForRequiredKeys;
+ (id)os_log;
+ (id)queryForEmailAddresses:(id)a3;
- (BOOL)allContactsHaveEmailAddress:(id)a3;
- (CNContactFormatter)contactFormatter;
- (CNMailToGroup)init;
- (id)bestGuessEmailAddressForContact:(id)a3;
- (id)mailUrlForContacts:(id)a3;
- (id)mailUrlForContacts:(id)a3 needsEmailAddresses:(BOOL)a4;
- (id)mailUrlForMailingAddresses:(id)a3;
- (id)mailUrlWithEmailAddressesForContacts:(id)a3;
- (id)mailingAddressForContact:(id)a3;
- (id)mailingAddressWithEmailForContact:(id)a3;
- (id)santizeMailingAddress:(id)a3;
- (void)setContactFormatter:(id)a3;
@end

@implementation CNMailToGroup

+ (id)os_log
{
  if (os_log_cn_once_token_1_3 != -1) {
    dispatch_once(&os_log_cn_once_token_1_3, &__block_literal_global_116);
  }
  v2 = (void *)os_log_cn_once_object_1_3;

  return v2;
}

uint64_t __23__CNMailToGroup_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "CNMailToGroup");
  uint64_t v1 = os_log_cn_once_object_1_3;
  os_log_cn_once_object_1_3 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)descriptorForRequiredKeys
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v3 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v8[0] = v3;
  v8[1] = @"emailAddresses";
  v8[2] = @"phoneNumbers";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  v5 = [a1 description];
  v6 = +[CNContact descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

- (CNMailToGroup)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNMailToGroup;
  v2 = [(CNMailToGroup *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(CNContactFormatter);
    contactFormatter = v2->_contactFormatter;
    v2->_contactFormatter = v3;

    [(CNContactFormatter *)v2->_contactFormatter setStyle:0];
    v5 = v2;
  }

  return v2;
}

- (id)mailUrlForContacts:(id)a3
{
  return [(CNMailToGroup *)self mailUrlForContacts:a3 needsEmailAddresses:0];
}

- (id)mailUrlWithEmailAddressesForContacts:(id)a3
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__CNMailToGroup_mailUrlWithEmailAddressesForContacts___block_invoke;
  v7[3] = &unk_1E56B48C0;
  v7[4] = self;
  v4 = objc_msgSend(a3, "_cn_compactMap:", v7);
  v5 = [(CNMailToGroup *)self mailUrlForMailingAddresses:v4];

  return v5;
}

uint64_t __54__CNMailToGroup_mailUrlWithEmailAddressesForContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) mailingAddressWithEmailForContact:a2];
}

- (id)mailUrlForContacts:(id)a3 needsEmailAddresses:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && ![(CNMailToGroup *)self allContactsHaveEmailAddress:v6])
  {
    v8 = 0;
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__CNMailToGroup_mailUrlForContacts_needsEmailAddresses___block_invoke;
    v10[3] = &unk_1E56B48C0;
    v10[4] = self;
    objc_super v7 = objc_msgSend(v6, "_cn_compactMap:", v10);
    v8 = [(CNMailToGroup *)self mailUrlForMailingAddresses:v7];
  }

  return v8;
}

uint64_t __56__CNMailToGroup_mailUrlForContacts_needsEmailAddresses___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) mailingAddressForContact:a2];
}

- (id)mailUrlForMailingAddresses:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    BOOL v4 = [MEMORY[0x1E4F28E78] stringWithString:@"mailto:"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__CNMailToGroup_mailUrlForMailingAddresses___block_invoke;
    v10[3] = &unk_1E56B5340;
    id v11 = v4;
    v5 = v4;
    [v3 enumerateObjectsUsingBlock:v10];
    id v6 = [v5 _cn_stringByAddingPercentEscapesToEntireURL];
    objc_super v7 = [MEMORY[0x1E4F29088] componentsWithString:v6];
    v8 = [v7 URL];
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CNMailToGroup mailUrlForMailingAddresses:](v5);
    }
    v8 = 0;
  }

  return v8;
}

void __44__CNMailToGroup_mailUrlForMailingAddresses___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@","];
  }
  [*(id *)(a1 + 32) appendString:v5];
}

- (BOOL)allContactsHaveEmailAddress:(id)a3
{
  return objc_msgSend(a3, "_cn_any:", &__block_literal_global_15) ^ 1;
}

uint64_t __45__CNMailToGroup_allContactsHaveEmailAddress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *MEMORY[0x1E4F5A258];
  id v3 = [a2 emailAddresses];
  BOOL v4 = +[CNLabeledValue Value];
  id v5 = objc_msgSend(v3, "_cn_map:", v4);
  id v6 = objc_msgSend(v5, "_cn_filter:", *MEMORY[0x1E4F5A2A0]);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v6);

  return v7;
}

- (id)bestGuessEmailAddressForContact:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(id)objc_opt_class() bestGuessEmailAddressForContact:v3];

  return v4;
}

- (id)mailingAddressWithEmailForContact:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNMailToGroup *)self bestGuessEmailAddressForContact:v4];
  uint64_t v6 = *MEMORY[0x1E4F5A2A0];
  if ((*(uint64_t (**)(void, void *))(*MEMORY[0x1E4F5A2A0] + 16))(*MEMORY[0x1E4F5A2A0], v5))
  {
    id v7 = v5;
    v8 = [(CNMailToGroup *)self contactFormatter];
    v9 = [v8 stringFromContact:v4];

    if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v9))
    {
      uint64_t v10 = [NSString stringWithFormat:@"%@ <%@>", v9, v7];

      id v7 = (id)v10;
    }
    id v11 = [(CNMailToGroup *)self santizeMailingAddress:v7];
  }
  else
  {
    v12 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_INFO, "Contact has no e-mail so will not be included: %@", buf, 0xCu);
    }

    id v11 = 0;
  }

  return v11;
}

- (id)mailingAddressForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNMailToGroup *)self contactFormatter];
  uint64_t v6 = [v5 stringFromContact:v4];

  id v7 = [(CNMailToGroup *)self bestGuessEmailAddressForContact:v4];
  v8 = [v4 phoneNumbers];
  v9 = [v8 firstObject];
  uint64_t v10 = [v9 value];

  uint64_t v11 = *MEMORY[0x1E4F5A2A0];
  v12 = (uint64_t (**)(uint64_t, void *))(*MEMORY[0x1E4F5A2A0] + 16);
  int v13 = (*v12)(*MEMORY[0x1E4F5A2A0], v6);
  int v14 = (*v12)(v11, v7);
  if ((v13 & 1) == 0 && (v14 & 1) == 0 && !v10)
  {
    id v15 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CNMailToGroup mailingAddressForContact:]((uint64_t)v4, v15);
    }

    goto LABEL_7;
  }
  if ((v13 & v14) == 1)
  {
    id v17 = [NSString stringWithFormat:@"%@ <%@>", v6, v7];
LABEL_12:
    v18 = v17;
    uint64_t v19 = [(CNMailToGroup *)self santizeMailingAddress:v17];
LABEL_13:
    uint64_t v16 = (void *)v19;

    goto LABEL_14;
  }
  if (v14)
  {
    id v17 = v7;
    goto LABEL_12;
  }
  if (v10) {
    int v21 = v13;
  }
  else {
    int v21 = 0;
  }
  if (v21 == 1)
  {
    v22 = NSString;
    v18 = [v10 digits];
    uint64_t v19 = [v22 stringWithFormat:@"%@ <%@>", v6, v18];
    goto LABEL_13;
  }
  if (v13)
  {
    id v23 = v6;
  }
  else
  {
    if (!v10)
    {
LABEL_7:
      uint64_t v16 = 0;
      goto LABEL_14;
    }
    id v23 = [v10 digits];
  }
  uint64_t v16 = v23;
LABEL_14:

  return v16;
}

- (id)santizeMailingAddress:(id)a3
{
  id v3 = a3;
  id v4 = [(objc_class *)getECEmailAddressClass_0() emailAddressWithString:v3];
  id v5 = [v4 emailAddressValue];
  uint64_t v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = [v5 stringValue];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v9 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CNMailToGroup santizeMailingAddress:]((uint64_t)v3, v9);
    }
  }

  return v7;
}

+ (id)bestGuessEmailAddressForContact:(id)a3
{
  return (id)[a1 bestGuessEmailAddressForContact:a3 sendingAddressDomain:0];
}

+ (id)bestGuessEmailAddressForContact:(id)a3 sendingAddressDomain:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 emailAddresses];
  id v7 = +[CNLabeledValue Value];
  id v8 = objc_msgSend(v6, "_cn_map:", v7);
  v9 = objc_msgSend(v8, "_cn_filter:", *MEMORY[0x1E4F5A2A0]);

  uint64_t v10 = [(id)objc_opt_class() bestGuessEmailAddressForAddresses:v9 sendingAddressDomain:v5 alreadyDuetRanked:0];

  return v10;
}

+ (id)bestGuessEmailAddressForAddresses:(id)a3 sendingAddressDomain:(id)a4 alreadyDuetRanked:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = [(id)objc_opt_class() queryForEmailAddresses:v7];
  if (v9)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    uint64_t v10 = (void *)getCRRecentContactsLibraryClass_softClass_0;
    uint64_t v27 = getCRRecentContactsLibraryClass_softClass_0;
    if (!getCRRecentContactsLibraryClass_softClass_0)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __getCRRecentContactsLibraryClass_block_invoke_0;
      v23[3] = &unk_1E56B45C0;
      v23[4] = &v24;
      __getCRRecentContactsLibraryClass_block_invoke_0((uint64_t)v23);
      uint64_t v10 = (void *)v25[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v24, 8);
    v12 = [v11 defaultInstance];
    int v13 = [v12 _recentContactsWithQuery:v9];
    uint64_t v22 = 0;
    int v14 = [v13 result:&v22];

    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))()) {
      goto LABEL_5;
    }
    if (v5)
    {
      id v17 = [v7 firstObject];
      id v16 = 0;
    }
    else
    {
      v18 = [v14 firstObject];
      id v16 = [v18 address];

      id v17 = v16;
      if (!v16)
      {
LABEL_5:

        goto LABEL_6;
      }
    }

    goto LABEL_13;
  }
LABEL_6:
  if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))()) {
    goto LABEL_8;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__CNMailToGroup_bestGuessEmailAddressForAddresses_sendingAddressDomain_alreadyDuetRanked___block_invoke;
  v20[3] = &unk_1E56B4F68;
  id v21 = v8;
  id v15 = objc_msgSend(v7, "_cn_firstObjectPassingTest:", v20);

  id v16 = v15;
  id v17 = v16;
  if (!v16)
  {
LABEL_8:
    id v16 = [v7 firstObject];
    id v17 = v16;
  }
LABEL_13:

  return v17;
}

uint64_t __90__CNMailToGroup_bestGuessEmailAddressForAddresses_sendingAddressDomain_alreadyDuetRanked___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasSuffix:*(void *)(a1 + 32)];
}

+ (id)queryForEmailAddresses:(id)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v3 = objc_alloc_init((Class)getCRSearchQueryClass());
  id CRSearchPredicateClass = getCRSearchPredicateClass();
  id v5 = getCRSearchPredicateClass();
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v6 = (id *)getCRRecentContactKeyKindSymbolLoc_ptr;
  uint64_t v32 = getCRRecentContactKeyKindSymbolLoc_ptr;
  if (!getCRRecentContactKeyKindSymbolLoc_ptr)
  {
    id v7 = (void *)CoreRecentsLibrary_0();
    v30[3] = (uint64_t)dlsym(v7, "CRRecentContactKeyKind");
    getCRRecentContactKeyKindSymbolLoc_ptr = v30[3];
    uint64_t v6 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v6) {
    goto LABEL_16;
  }
  id v8 = *v6;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  v9 = (id *)getCRAddressKindEmailSymbolLoc_ptr;
  uint64_t v32 = getCRAddressKindEmailSymbolLoc_ptr;
  if (!getCRAddressKindEmailSymbolLoc_ptr)
  {
    uint64_t v10 = (void *)CoreRecentsLibrary_0();
    v30[3] = (uint64_t)dlsym(v10, "CRAddressKindEmail");
    getCRAddressKindEmailSymbolLoc_ptr = v30[3];
    v9 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v9) {
    goto LABEL_16;
  }
  id v11 = *v9;
  id v34 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  int v13 = [v5 predicateForKey:v8 inCollection:v12];
  v35[0] = v13;
  id v14 = getCRSearchPredicateClass();
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  id v15 = (id *)getCRRecentContactKeyAddressSymbolLoc_ptr_0;
  uint64_t v32 = getCRRecentContactKeyAddressSymbolLoc_ptr_0;
  if (!getCRRecentContactKeyAddressSymbolLoc_ptr_0)
  {
    id v16 = (void *)CoreRecentsLibrary_0();
    v30[3] = (uint64_t)dlsym(v16, "CRRecentContactKeyAddress");
    getCRRecentContactKeyAddressSymbolLoc_ptr_0 = v30[3];
    id v15 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v15) {
    goto LABEL_16;
  }
  id v17 = *v15;
  v18 = [v14 predicateForKey:v17 inCollection:v28];
  v35[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v20 = [CRSearchPredicateClass predicateSatisfyingAllSubpredicates:v19];
  [v3 setSearchPredicate:v20];

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  id v21 = (id *)getCRRecentsDomainMailSymbolLoc_ptr_0;
  uint64_t v32 = getCRRecentsDomainMailSymbolLoc_ptr_0;
  if (!getCRRecentsDomainMailSymbolLoc_ptr_0)
  {
    uint64_t v22 = (void *)CoreRecentsLibrary_0();
    v30[3] = (uint64_t)dlsym(v22, "CRRecentsDomainMail");
    getCRRecentsDomainMailSymbolLoc_ptr_0 = v30[3];
    id v21 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v21)
  {
LABEL_16:
    -[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:]();
    __break(1u);
  }
  id v33 = *v21;
  id v23 = (void *)MEMORY[0x1E4F1C978];
  id v24 = v33;
  v25 = [v23 arrayWithObjects:&v33 count:1];

  [v3 setDomains:v25];
  uint64_t v26 = [getCRSearchQueryClass() frecencyComparator];
  [v3 setComparator:v26];

  return v3;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)mailUrlForMailingAddresses:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Failed to create mail URL", v1, 2u);
}

- (void)mailingAddressForContact:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Failed to create mailing address for contact: %@", (uint8_t *)&v2, 0xCu);
}

- (void)santizeMailingAddress:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Failed to sanitize mailing address: %@", (uint8_t *)&v2, 0xCu);
}

@end