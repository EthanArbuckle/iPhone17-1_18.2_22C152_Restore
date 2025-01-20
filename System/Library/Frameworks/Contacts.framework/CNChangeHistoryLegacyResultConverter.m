@interface CNChangeHistoryLegacyResultConverter
+ (id)contactEventForChange:(void *)a3 factory:;
+ (id)os_log;
- (CNChangeHistoryEventFactory)factory;
- (CNChangeHistoryLegacyResultConverter)initWithContactStore:(id)a3 additionalContactKeyDescriptors:(id)a4;
- (CNContactStore)contactStore;
- (NSArray)additionalContactKeyDescriptors;
- (id)coalesceGroupEvents:(id)a1;
- (id)eventsFromResult:(id)a3;
- (id)groupEventsFromLegacyResult:(void *)a1;
- (id)keysToFetch;
- (void)contactEventsFromLegacyResult:(void *)a1;
@end

@implementation CNChangeHistoryLegacyResultConverter

+ (id)os_log
{
  self;
  if (os_log_cn_once_token_0_5 != -1) {
    dispatch_once(&os_log_cn_once_token_0_5, &__block_literal_global_32);
  }
  v0 = (void *)os_log_cn_once_object_0_5;

  return v0;
}

uint64_t __46__CNChangeHistoryLegacyResultConverter_os_log__block_invoke()
{
  os_log_cn_once_object_0_5 = (uint64_t)os_log_create("com.apple.contacts", "fetching");

  return MEMORY[0x1F41817F8]();
}

- (CNChangeHistoryLegacyResultConverter)initWithContactStore:(id)a3 additionalContactKeyDescriptors:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNChangeHistoryLegacyResultConverter;
  v9 = [(CNChangeHistoryLegacyResultConverter *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    if (v8) {
      v11 = v8;
    }
    else {
      v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v10->_additionalContactKeyDescriptors, v11);
    v12 = objc_alloc_init(CNChangeHistoryEventFactory);
    factory = v10->_factory;
    v10->_factory = v12;

    v14 = v10;
  }

  return v10;
}

- (id)eventsFromResult:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = -[CNChangeHistoryLegacyResultConverter contactEventsFromLegacyResult:]((void **)&self->super.isa, v4);
  if ([v5 isSuccess])
  {
    v6 = -[CNChangeHistoryLegacyResultConverter groupEventsFromLegacyResult:](self, v4);
    if ([v6 isSuccess])
    {
      id v7 = [v5 value];
      v17[0] = v7;
      id v8 = [v6 value];
      v17[1] = v8;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      v10 = objc_msgSend(v9, "_cn_flatten");

      uint64_t v11 = [MEMORY[0x1E4F5A4E0] successWithValue:v10];
    }
    else
    {
      objc_opt_class();
      v14 = +[CNChangeHistoryLegacyResultConverter os_log]();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CNChangeHistoryLegacyResultConverter eventsFromResult:](v6);
      }

      v15 = (void *)MEMORY[0x1E4F5A4E0];
      v10 = [v6 error];
      uint64_t v11 = [v15 failureWithError:v10];
    }
    id v13 = (id)v11;
  }
  else
  {
    objc_opt_class();
    v12 = +[CNChangeHistoryLegacyResultConverter os_log]();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CNChangeHistoryLegacyResultConverter eventsFromResult:](v5);
    }

    id v13 = v5;
  }

  return v13;
}

- (void)contactEventsFromLegacyResult:(void *)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = -[CNChangeHistoryLegacyResultConverter keysToFetch](a1);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = [a1 contactStore];
    id v18 = v3;
    id v7 = [v3 contactChangesEnumeratorWithKeysToFetch:v4 contactStore:v6];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = +[CNChangeHistoryLegacyResultConverter contactEventForChange:factory:]((uint64_t)CNChangeHistoryLegacyResultConverter, *(void **)(*((void *)&v19 + 1) + 8 * i), a1[3]);
          if (![v13 isSuccess])
          {
            v15 = (void *)MEMORY[0x1E4F5A4E0];
            objc_super v16 = [v13 error];
            a1 = [v15 failureWithError:v16];

            goto LABEL_12;
          }
          v14 = [v13 value];
          [v5 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    a1 = [MEMORY[0x1E4F5A4E0] successWithValue:v5];
LABEL_12:

    id v3 = v18;
  }

  return a1;
}

- (id)groupEventsFromLegacyResult:(void *)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v28 = v3;
  if (a1)
  {
    id v4 = v3;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = objc_msgSend(a1, "contactStore", v28);
    id v7 = [v4 groupChangesEnumeratorWithContactStore:v6];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (!v8) {
      goto LABEL_19;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        unint64_t v13 = [v12 changeType];
        if (v13 <= 5)
        {
          if (((1 << v13) & 9) != 0)
          {
            v17 = (void *)a1[3];
            v15 = [v12 group];
            uint64_t v16 = [v17 addGroupEventWithGroup:v15 containerIdentifier:0];
LABEL_12:
            id v18 = (void *)v16;
          }
          else
          {
            if (((1 << v13) & 0x12) != 0)
            {
              v14 = (void *)a1[3];
              v15 = [v12 group];
              uint64_t v16 = [v14 updateGroupEventWithGroup:v15];
              goto LABEL_12;
            }
            long long v19 = (void *)a1[3];
            v15 = [v12 groupIdentifier];
            [v12 externalURI];
            id v20 = v5;
            v22 = long long v21 = a1;
            v23 = [v12 externalModificationTag];
            id v18 = [v19 deleteGroupEventWithGroupIdentifier:v15 externalURI:v22 externalModificationTag:v23];

            a1 = v21;
            id v5 = v20;
          }

          goto LABEL_15;
        }
        id v18 = 0;
LABEL_15:
        objc_msgSend(v5, "_cn_addNonNilObject:", v18);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v9 = v24;
      if (!v24)
      {
LABEL_19:

        v25 = -[CNChangeHistoryLegacyResultConverter coalesceGroupEvents:](a1, v5);
        v26 = [MEMORY[0x1E4F5A4E0] successWithValue:v25];

        goto LABEL_20;
      }
    }
  }
  v26 = 0;
LABEL_20:

  return v26;
}

- (id)keysToFetch
{
  id v1 = a1;
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = *MEMORY[0x1E4F5A258];
    id v3 = [a1 additionalContactKeyDescriptors];
    LODWORD(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

    if (v2)
    {
      v8[0] = @"identifier";
      id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    }
    else
    {
      id v4 = objc_msgSend(v1, "additionalContactKeyDescriptors", @"identifier");
      v7[1] = v4;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
      objc_msgSend(v5, "_cn_flatten");
      id v1 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v1;
}

+ (id)contactEventForChange:(void *)a3 factory:
{
  id v4 = a2;
  id v5 = a3;
  self;
  switch([v4 changeType])
  {
    case 0:
    case 3:
      v6 = [v4 contact];
      uint64_t v7 = [v5 addContactEventWithContact:v6 containerIdentifier:0];
      goto LABEL_10;
    case 1:
    case 4:
      v6 = [v4 contact];
      uint64_t v8 = [v4 imagesChanged];
      uint64_t v9 = objc_msgSend(v5, "updateContactEventWithContact:imagesChanged:", v6, objc_msgSend(v8, "BOOLValue"));
      goto LABEL_12;
    case 2:
    case 5:
      v6 = [v4 contactIdentifier];
      uint64_t v7 = [v5 deleteContactEventWithContactIdentifier:v6];
      goto LABEL_10;
    case 6:
      v6 = [v4 contact];
      uint64_t v8 = [v4 linkToPersonUUID];
      uint64_t v11 = +[CNContact contactWithIdentifierOnly:v8];
      v12 = [v4 personLinkUUID];
      unint64_t v13 = +[CNContact contactWithIdentifierOnly:v12];
      uint64_t v10 = [v5 linkContactsEventWithFromContact:v6 toContact:v11 unifiedContact:v13];

      goto LABEL_13;
    case 7:
      v6 = [v4 contact];
      uint64_t v7 = [v5 unlinkContactEventWithContact:v6];
      goto LABEL_10;
    case 8:
      v6 = [v4 contact];
      uint64_t v7 = [v5 preferredContactForNameEventWithPreferredContact:v6 unifiedContact:0];
      goto LABEL_10;
    case 9:
      v6 = [v4 contact];
      uint64_t v7 = [v5 preferredContactForImageEventWithPreferredContact:v6 unifiedContact:0];
LABEL_10:
      uint64_t v10 = (void *)v7;
      goto LABEL_14;
    case 10:
      uint64_t v14 = *MEMORY[0x1E4F5A1F8];
      v6 = [v4 contactIdentifier];
      uint64_t v8 = (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v6);
      uint64_t v9 = [v5 differentMeCardEventWithContactIdentifier:v8];
LABEL_12:
      uint64_t v10 = (void *)v9;
LABEL_13:

LABEL_14:
      break;
    default:
      uint64_t v10 = 0;
      break;
  }
  v15 = [MEMORY[0x1E4F5A4E0] successWithValue:v10];

  return v15;
}

- (id)coalesceGroupEvents:(id)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1) {
    a1 = v3;
  }

  return a1;
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)additionalContactKeyDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (CNChangeHistoryEventFactory)factory
{
  return (CNChangeHistoryEventFactory *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_additionalContactKeyDescriptors, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)eventsFromResult:(void *)a1 .cold.1(void *a1)
{
  id v1 = [a1 error];
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "Could not fetch groups for change history delta sync: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)eventsFromResult:(void *)a1 .cold.2(void *a1)
{
  id v1 = [a1 error];
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "Could not fetch contacts for change history delta sync: %{public}@", v4, v5, v6, v7, 2u);
}

@end