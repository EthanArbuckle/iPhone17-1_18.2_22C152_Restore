@interface CNReputationContactsAdapter
- (CNContactStore)contactStore;
- (CNReputationContactsAdapter)init;
- (CNReputationContactsAdapter)initWithContactStore:(id)a3;
- (CNReputationContactsAdapter)initWithContactStore:(id)a3 schedulerProvider:(id)a4;
- (CNScheduler)storeScheduler;
- (CNSchedulerProvider)schedulerProvider;
- (id)contactsForEmailAddress:(id)a3;
- (id)contactsForPhoneNumber:(id)a3;
- (id)contactsForPredicate:(id)a3 keys:(id)a4;
@end

@implementation CNReputationContactsAdapter

- (CNReputationContactsAdapter)init
{
  v3 = objc_alloc_init(CNContactStore);
  v4 = [(CNReputationContactsAdapter *)self initWithContactStore:v3];

  return v4;
}

- (CNReputationContactsAdapter)initWithContactStore:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F5A4F0];
  id v5 = a3;
  v6 = [v4 providerWithBackgroundConcurrencyLimit:4];
  v7 = [(CNReputationContactsAdapter *)self initWithContactStore:v5 schedulerProvider:v6];

  return v7;
}

- (CNReputationContactsAdapter)initWithContactStore:(id)a3 schedulerProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNReputationContactsAdapter;
  v9 = [(CNReputationContactsAdapter *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_schedulerProvider, a4);
    uint64_t v11 = [v8 newSerialSchedulerWithName:@"com.apple.contacts.reputation.contacts-store-scheduler"];
    storeScheduler = v10->_storeScheduler;
    v10->_storeScheduler = (CNScheduler *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)contactsForEmailAddress:(id)a3
{
  v4 = (*(void (**)(void))(*MEMORY[0x1E4F5A1D8] + 16))();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__CNReputationContactsAdapter_contactsForEmailAddress___block_invoke;
  v9[3] = &unk_1E56B84D0;
  v9[4] = self;
  id v5 = objc_msgSend(v4, "_cn_map:", v9);
  v6 = [MEMORY[0x1E4F5A408] join:v5];
  id v7 = [v6 flatMap:&__block_literal_global_102];

  return v7;
}

id __55__CNReputationContactsAdapter_contactsForEmailAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = +[CNContact predicateForContactsMatchingEmailAddress:a2];
  v4 = *(void **)(a1 + 32);
  v8[0] = @"emailAddresses";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = [v4 contactsForPredicate:v3 keys:v5];

  return v6;
}

id __55__CNReputationContactsAdapter_contactsForEmailAddress___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F5A408];
  v3 = objc_msgSend(a2, "_cn_flatten");
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)contactsForPhoneNumber:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v4 = +[CNPhoneNumber phoneNumberWithStringValue:a3];
  id v5 = +[CNContact predicateForContactsMatchingPhoneNumber:v4];

  v9[0] = @"phoneNumbers";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = [(CNReputationContactsAdapter *)self contactsForPredicate:v5 keys:v6];

  return v7;
}

- (id)contactsForPredicate:(id)a3 keys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F5A408];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__CNReputationContactsAdapter_contactsForPredicate_keys___block_invoke;
  v14[3] = &unk_1E56B84F8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [(CNReputationContactsAdapter *)self storeScheduler];
  v12 = [v8 futureWithBlock:v14 scheduler:v11];

  return v12;
}

id __57__CNReputationContactsAdapter_contactsForPredicate_keys___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) contactStore];
  id v5 = [v4 unifiedContactsMatchingPredicate:*(void *)(a1 + 40) keysToFetch:*(void *)(a1 + 48) error:a2];

  return v5;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNScheduler)storeScheduler
{
  return self->_storeScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeScheduler, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end