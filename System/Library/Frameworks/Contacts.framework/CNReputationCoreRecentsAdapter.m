@interface CNReputationCoreRecentsAdapter
- (CNReputationCoreRecentsAdapter)init;
- (CNReputationCoreRecentsAdapter)initWithRecentContactsLibrary:(id)a3;
- (CRRecentContactsLibrary)library;
- (id)recentContactsForHandle:(id)a3;
@end

@implementation CNReputationCoreRecentsAdapter

- (CNReputationCoreRecentsAdapter)init
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v3 = (void *)getCRRecentContactsLibraryClass_softClass;
  uint64_t v12 = getCRRecentContactsLibraryClass_softClass;
  if (!getCRRecentContactsLibraryClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getCRRecentContactsLibraryClass_block_invoke;
    v8[3] = &unk_1E56B45C0;
    v8[4] = &v9;
    __getCRRecentContactsLibraryClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  v5 = [v4 defaultInstance];
  v6 = [(CNReputationCoreRecentsAdapter *)self initWithRecentContactsLibrary:v5];

  return v6;
}

- (CNReputationCoreRecentsAdapter)initWithRecentContactsLibrary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNReputationCoreRecentsAdapter;
  v6 = [(CNReputationCoreRecentsAdapter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    v8 = v7;
  }

  return v7;
}

- (id)recentContactsForHandle:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  id v5 = (void *)getCRSearchQueryClass_softClass;
  uint64_t v45 = getCRSearchQueryClass_softClass;
  if (!getCRSearchQueryClass_softClass)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getCRSearchQueryClass_block_invoke;
    v40 = &unk_1E56B45C0;
    v41 = &v42;
    __getCRSearchQueryClass_block_invoke((uint64_t)&v37);
    id v5 = (void *)v43[3];
  }
  v6 = v5;
  _Block_object_dispose(&v42, 8);
  id v7 = objc_alloc_init(v6);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v8 = (void *)getCRSearchPredicateClass_softClass;
  uint64_t v45 = getCRSearchPredicateClass_softClass;
  if (!getCRSearchPredicateClass_softClass)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getCRSearchPredicateClass_block_invoke;
    v40 = &unk_1E56B45C0;
    v41 = &v42;
    __getCRSearchPredicateClass_block_invoke((uint64_t)&v37);
    v8 = (void *)v43[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v42, 8);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  objc_super v10 = (id *)getCRRecentContactKeyAddressSymbolLoc_ptr;
  uint64_t v45 = getCRRecentContactKeyAddressSymbolLoc_ptr;
  if (!getCRRecentContactKeyAddressSymbolLoc_ptr)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getCRRecentContactKeyAddressSymbolLoc_block_invoke;
    v40 = &unk_1E56B45C0;
    v41 = &v42;
    uint64_t v11 = (void *)CoreRecentsLibrary();
    uint64_t v12 = dlsym(v11, "CRRecentContactKeyAddress");
    *(void *)(v41[1] + 24) = v12;
    getCRRecentContactKeyAddressSymbolLoc_ptr = *(void *)(v41[1] + 24);
    objc_super v10 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v13 = *MEMORY[0x1E4F5A1D8];
  v14 = *(void (**)(uint64_t, id))(*MEMORY[0x1E4F5A1D8] + 16);
  id v15 = *v10;
  v16 = v14(v13, v4);
  v17 = [v9 predicateForKey:v15 inCollection:v16];

  [v7 setSearchPredicate:v17];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  v18 = (id *)getCRRecentsDomainCalendarSymbolLoc_ptr;
  uint64_t v45 = getCRRecentsDomainCalendarSymbolLoc_ptr;
  if (!getCRRecentsDomainCalendarSymbolLoc_ptr)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getCRRecentsDomainCalendarSymbolLoc_block_invoke;
    v40 = &unk_1E56B45C0;
    v41 = &v42;
    v19 = (void *)CoreRecentsLibrary();
    v20 = dlsym(v19, "CRRecentsDomainCalendar");
    *(void *)(v41[1] + 24) = v20;
    getCRRecentsDomainCalendarSymbolLoc_ptr = *(void *)(v41[1] + 24);
    v18 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v18) {
    goto LABEL_20;
  }
  id v21 = *v18;
  v46[0] = v21;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  v22 = (id *)getCRRecentsDomainMailSymbolLoc_ptr;
  uint64_t v45 = getCRRecentsDomainMailSymbolLoc_ptr;
  if (!getCRRecentsDomainMailSymbolLoc_ptr)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getCRRecentsDomainMailSymbolLoc_block_invoke;
    v40 = &unk_1E56B45C0;
    v41 = &v42;
    v23 = (void *)CoreRecentsLibrary();
    v24 = dlsym(v23, "CRRecentsDomainMail");
    *(void *)(v41[1] + 24) = v24;
    getCRRecentsDomainMailSymbolLoc_ptr = *(void *)(v41[1] + 24);
    v22 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v22) {
    goto LABEL_20;
  }
  id v25 = *v22;
  v46[1] = v25;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  v26 = (id *)getCRRecentsDomainMessagesSymbolLoc_ptr;
  uint64_t v45 = getCRRecentsDomainMessagesSymbolLoc_ptr;
  if (!getCRRecentsDomainMessagesSymbolLoc_ptr)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getCRRecentsDomainMessagesSymbolLoc_block_invoke;
    v40 = &unk_1E56B45C0;
    v41 = &v42;
    v27 = (void *)CoreRecentsLibrary();
    v28 = dlsym(v27, "CRRecentsDomainMessages");
    *(void *)(v41[1] + 24) = v28;
    getCRRecentsDomainMessagesSymbolLoc_ptr = *(void *)(v41[1] + 24);
    v26 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v26)
  {
LABEL_20:
    -[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:]();
    __break(1u);
  }
  id v47 = *v26;
  v29 = (void *)MEMORY[0x1E4F1C978];
  id v30 = v47;
  v31 = [v29 arrayWithObjects:v46 count:3];

  [v7 setDomains:v31];
  id v32 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  v33 = [(CNReputationCoreRecentsAdapter *)self library];
  v34 = [v32 completionHandlerAdapterWithDefaultValue:MEMORY[0x1E4F1CBF0]];
  [v33 performRecentsSearch:v7 queue:0 completion:v34];

  v35 = [v32 future];

  return v35;
}

- (CRRecentContactsLibrary)library
{
  return self->_library;
}

- (void).cxx_destruct
{
}

@end