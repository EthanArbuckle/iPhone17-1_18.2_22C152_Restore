@interface ATXStableContactRepresentationDatastore
- (ATXStableContactRepresentationDatastore)initWithContactStore:(id)a3;
- (ATXStableContactRepresentationDatastore)initWithStableContactRepresentationDatabase:(id)a3 contactStore:(id)a4;
- (id)cnContactForCnContactId:(id)a3 rawIdentifier:(id)a4;
- (id)cnContactIdWithStableContactIdentifier:(id)a3;
- (id)refreshCnContactIdsGivenContactEntities:(id)a3;
- (id)stableContactIdentifierWithCnContactId:(id)a3;
- (id)stableContactRepresentationForCnContactId:(id)a3 rawIdentifier:(id)a4;
- (id)stableContactRepresentationForStableContactIdentifier:(id)a3;
- (id)updateAndGetStableContactIdentifier:(id)a3 rawIdentifier:(id)a4;
- (void)insertCnContactIdToStableContactIdentifierWithCnContactId:(id)a3 stableContactIdentifier:(id)a4;
@end

@implementation ATXStableContactRepresentationDatastore

- (ATXStableContactRepresentationDatastore)initWithContactStore:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(ATXStableContactRepresentationDatastore *)self initWithStableContactRepresentationDatabase:v5 contactStore:v4];

  return v6;
}

- (ATXStableContactRepresentationDatastore)initWithStableContactRepresentationDatabase:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXStableContactRepresentationDatastore;
  v9 = [(ATXStableContactRepresentationDatastore *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stableContactRepresentationDatabase, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
  }

  return v10;
}

- (id)cnContactForCnContactId:(id)a3 rawIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F1AEE0];
  uint64_t v15 = *MEMORY[0x1E4F1AE08];
  uint64_t v16 = v7;
  uint64_t v17 = *MEMORY[0x1E4F1ADC8];
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a3;
  v10 = [v8 arrayWithObjects:&v15 count:3];
  id v11 = objc_alloc(MEMORY[0x1E4F89C68]);
  objc_super v12 = objc_msgSend(v11, "initWithContactStore:keysToFetch:", self->_contactStore, v10, v15, v16, v17, v18);
  v13 = [v12 contactWithIdentifier:v9];

  if (v6 && !v13)
  {
    v13 = [v12 resolveContactIfPossibleFromContactIdentifierString:v6 pickFirstOfMultiple:1];
  }

  return v13;
}

- (id)updateAndGetStableContactIdentifier:(id)a3 rawIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ATXStableContactRepresentationDatastore *)self stableContactIdentifierWithCnContactId:v6];
  if (!v8)
  {
    id v11 = [(ATXStableContactRepresentationDatastore *)self cnContactForCnContactId:v6 rawIdentifier:v7];
    objc_super v12 = v11;
    if (!v11)
    {
      id v9 = 0;
LABEL_15:
      if (v9) {
        v22 = v9;
      }
      else {
        v22 = v6;
      }
      id v10 = v22;

      goto LABEL_19;
    }
    v13 = [v11 phoneNumbers];
    v14 = objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_60);

    uint64_t v15 = [v12 emailAddresses];
    uint64_t v16 = objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_137);

    if (v14 && [v14 count])
    {
      uint64_t v17 = &__block_literal_global_140_0;
      uint64_t v18 = v14;
    }
    else
    {
      if (!v16 || ![v16 count]) {
        goto LABEL_13;
      }
      uint64_t v17 = &__block_literal_global_142;
      uint64_t v18 = v16;
    }
    v19 = [v18 sortedArrayUsingComparator:v17];
    v20 = [v19 firstObject];
    uint64_t v21 = [v20 hash];

    if (v21)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", v21);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      [(ATXStableContactRepresentationDatastore *)self insertCnContactIdToStableContactIdentifierWithCnContactId:v6 stableContactIdentifier:v9];
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    id v9 = 0;
    goto LABEL_14;
  }
  id v9 = v8;
  id v10 = v9;
LABEL_19:

  return v10;
}

id __93__ATXStableContactRepresentationDatastore_updateAndGetStableContactIdentifier_rawIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 value];
  id v4 = [v3 stringValue];
  if ([v4 length])
  {
    v5 = [v2 value];
    id v6 = [v5 stringValue];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id __93__ATXStableContactRepresentationDatastore_updateAndGetStableContactIdentifier_rawIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 value];
  if ([v3 length])
  {
    id v4 = [v2 value];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __93__ATXStableContactRepresentationDatastore_updateAndGetStableContactIdentifier_rawIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __93__ATXStableContactRepresentationDatastore_updateAndGetStableContactIdentifier_rawIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)insertCnContactIdToStableContactIdentifierWithCnContactId:(id)a3 stableContactIdentifier:(id)a4
{
}

- (id)cnContactIdWithStableContactIdentifier:(id)a3
{
  return [(ATXStableContactRepresentationDatabase *)self->_stableContactRepresentationDatabase cnContactId:a3];
}

- (id)stableContactIdentifierWithCnContactId:(id)a3
{
  return [(ATXStableContactRepresentationDatabase *)self->_stableContactRepresentationDatabase stableContactIdentifier:a3];
}

- (id)stableContactRepresentationForCnContactId:(id)a3 rawIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(ATXStableContactRepresentationDatastore *)self updateAndGetStableContactIdentifier:v6 rawIdentifier:v7];
    id v9 = [[ATXStableContactRepresentation alloc] initWithStableContactIdentifier:v8 cnContactId:v6 rawIdentifier:v7];
  }
  else
  {
    id v10 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v12 = 0;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "cnContactId provided is nil", v12, 2u);
    }

    id v9 = 0;
  }

  return v9;
}

- (id)stableContactRepresentationForStableContactIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(ATXStableContactRepresentationDatastore *)self cnContactIdWithStableContactIdentifier:v4];
    id v6 = [[ATXStableContactRepresentation alloc] initWithStableContactIdentifier:v4 cnContactId:v5 rawIdentifier:0];
  }
  else
  {
    id v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "stableContactIdentifier provided is nil", v9, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)refreshCnContactIdsGivenContactEntities:(id)a3
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  contactStore = self->_contactStore;
  id v7 = objc_alloc(MEMORY[0x1E4F1B908]);
  uint64_t v8 = *MEMORY[0x1E4F1AEE0];
  v35[0] = *MEMORY[0x1E4F1AE08];
  v35[1] = v8;
  v35[2] = *MEMORY[0x1E4F1ADC8];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  id v10 = (void *)[v7 initWithKeysToFetch:v9];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __83__ATXStableContactRepresentationDatastore_refreshCnContactIdsGivenContactEntities___block_invoke;
  v26[3] = &unk_1E68AE580;
  v26[4] = self;
  id v11 = v4;
  id v27 = v11;
  id v12 = v5;
  id v28 = v12;
  [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v10 error:0 usingBlock:v26];

  uint64_t v13 = [v11 count];
  uint64_t v14 = [v12 count];
  uint64_t v15 = __atxlog_handle_notification_management();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v13 == v14)
  {
    if (v16)
    {
      uint64_t v17 = [v12 count];
      *(_DWORD *)buf = 136315394;
      v30 = "-[ATXStableContactRepresentationDatastore refreshCnContactIdsGivenContactEntities:]";
      __int16 v31 = 2048;
      uint64_t v32 = v17;
      uint64_t v18 = "%s: returning number of contactEntitesSeen = %lu";
      v19 = v15;
      uint32_t v20 = 22;
LABEL_6:
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }
  else if (v16)
  {
    uint64_t v21 = [v11 count];
    uint64_t v22 = [v12 count];
    *(_DWORD *)buf = 136315650;
    v30 = "-[ATXStableContactRepresentationDatastore refreshCnContactIdsGivenContactEntities:]";
    __int16 v31 = 2048;
    uint64_t v32 = v21;
    __int16 v33 = 2048;
    uint64_t v34 = v22;
    uint64_t v18 = "%s: received %ld contact entities, but only found %ld associated contacts";
    v19 = v15;
    uint32_t v20 = 32;
    goto LABEL_6;
  }

  v23 = v28;
  id v24 = v12;

  return v24;
}

void __83__ATXStableContactRepresentationDatastore_refreshCnContactIdsGivenContactEntities___block_invoke(uint64_t a1, void *a2)
{
  id v20 = a2;
  v3 = (void *)MEMORY[0x1D25F6CC0]();
  id v4 = *(void **)(a1 + 32);
  v5 = [v20 identifier];
  id v6 = [v4 stableContactIdentifierWithCnContactId:v5];

  if (v6) {
    goto LABEL_13;
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v20 identifier];
  id v9 = [v20 phoneNumbers];
  id v10 = [v9 firstObject];
  id v11 = [v10 label];
  if (v11)
  {
    id v12 = [v7 stableContactRepresentationForCnContactId:v8 rawIdentifier:v11];
  }
  else
  {
    uint64_t v13 = [v20 emailAddresses];
    uint64_t v14 = [v13 firstObject];
    uint64_t v15 = [v14 label];
    id v12 = [v7 stableContactRepresentationForCnContactId:v8 rawIdentifier:v15];
  }
  id v6 = [v12 stableContactIdentifier];

  if (v6)
  {
LABEL_13:
    BOOL v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];

    if (v16)
    {
      uint64_t v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
      uint64_t v18 = [v20 identifier];
      [v17 setCnContactId:v18];

      v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
      [*(id *)(a1 + 48) setObject:v19 forKeyedSubscript:v6];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_stableContactRepresentationDatabase, 0);
}

@end