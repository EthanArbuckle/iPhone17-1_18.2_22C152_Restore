@interface ATXContactsDataSource
- (ATXContactsDataSource)initWithDevice:(id)a3;
- (void)_contactsWithPredicate:(id)a3 callback:(id)a4;
- (void)contactsWithEmail:(id)a3 callback:(id)a4;
- (void)contactsWithIdentifiers:(id)a3 callback:(id)a4;
- (void)contactsWithName:(id)a3 callback:(id)a4;
- (void)contactsWithPhone:(id)a3 callback:(id)a4;
@end

@implementation ATXContactsDataSource

- (ATXContactsDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXContactsDataSource;
  v6 = [(ATXContactsDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)contactsWithIdentifiers:(id)a3 callback:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1B8F8];
  id v7 = a4;
  id v8 = [v6 predicateForContactsWithIdentifiers:a3];
  [(ATXContactsDataSource *)self _contactsWithPredicate:v8 callback:v7];
}

- (void)contactsWithName:(id)a3 callback:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1B8F8];
  id v7 = a4;
  id v8 = [v6 predicateForContactsMatchingName:a3];
  [(ATXContactsDataSource *)self _contactsWithPredicate:v8 callback:v7];
}

- (void)contactsWithEmail:(id)a3 callback:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1B8F8];
  id v7 = a4;
  id v8 = [v6 predicateForContactsMatchingEmailAddress:a3];
  [(ATXContactsDataSource *)self _contactsWithPredicate:v8 callback:v7];
}

- (void)contactsWithPhone:(id)a3 callback:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1BA70];
  id v7 = a4;
  id v8 = a3;
  id v10 = (id)[[v6 alloc] initWithStringValue:v8];

  objc_super v9 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v10];
  [(ATXContactsDataSource *)self _contactsWithPredicate:v9 callback:v7];
}

- (void)_contactsWithPredicate:(id)a3 callback:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if (ATXHeuristicCanLearnFromApp(&unk_1F2727380))
  {
    id v8 = [(ATXHeuristicDevice *)self->_device contactsForPredicate:v6];
    if (v8)
    {
      objc_super v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = -[ATXHeuristicDevice dictContactForCNContact:](self->_device, "dictContactForCNContact:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
            if (v15) {
              [v9 addObject:v15];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }

      v7[2](v7, v9, 0);
    }
    else
    {
      v16 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ATXContactsDataSource _contactsWithPredicate:callback:](v16);
      }

      v7[2](v7, 0, 0);
    }
  }
  else
  {
    v7[2](v7, (void *)MEMORY[0x1E4F1CBF0], 0);
  }
}

- (void).cxx_destruct
{
}

- (void)_contactsWithPredicate:(os_log_t)log callback:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1D0F43000, log, OS_LOG_TYPE_ERROR, "Error in contacts fetch: %@", (uint8_t *)&v1, 0xCu);
}

@end