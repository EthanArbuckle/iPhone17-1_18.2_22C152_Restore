@interface ATXSenderImportanceUtils
+ (id)_contactFromName:(id)a3 contactStore:(id)a4;
+ (id)contactFromHandle:(id)a3 contactStore:(id)a4;
@end

@implementation ATXSenderImportanceUtils

+ (id)contactFromHandle:(id)a3 contactStore:(id)a4
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 contactIdentifier];

  if (v8)
  {
    v9 = [[ATXStableContactRepresentationDatastore alloc] initWithContactStore:v7];
    v10 = [v6 contactIdentifier];
    v11 = [v6 handle];
    uint64_t v12 = [(ATXStableContactRepresentationDatastore *)v9 cnContactForCnContactId:v10 rawIdentifier:v11];
LABEL_5:
    v17 = (void *)v12;

LABEL_6:
    goto LABEL_7;
  }
  v13 = [v6 handle];

  if (v13)
  {
    v14 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    uint64_t v15 = *MEMORY[0x1E4F1AFA8];
    v20[0] = v14;
    v20[1] = v15;
    uint64_t v16 = *MEMORY[0x1E4F1ADC8];
    v20[2] = *MEMORY[0x1E4F1AEE0];
    v20[3] = v16;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F89C68]) initWithContactStore:v7 keysToFetch:v9];
    v11 = [v6 handle];
    uint64_t v12 = [v10 resolveContactIfPossibleFromContactIdentifierString:v11 pickFirstOfMultiple:1];
    goto LABEL_5;
  }
  v19 = [v6 name];

  if (v19)
  {
    v9 = [v6 name];
    v17 = [a1 _contactFromName:v9 contactStore:v7];
    goto LABEL_6;
  }
  v17 = 0;
LABEL_7:

  return v17;
}

+ (id)_contactFromName:(id)a3 contactStore:(id)a4
{
  v24[7] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1B910];
  id v7 = a4;
  v8 = [v6 descriptorForRequiredKeysForStyle:0];
  v24[0] = v8;
  v9 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1000];
  uint64_t v10 = *MEMORY[0x1E4F1AE08];
  v24[1] = v9;
  v24[2] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1AEE0];
  v24[3] = *MEMORY[0x1E4F1AFA8];
  v24[4] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1ADC8];
  v24[5] = *MEMORY[0x1E4F1AE60];
  v24[6] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:7];

  v14 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v5];
  id v21 = 0;
  uint64_t v15 = [v7 unifiedContactsMatchingPredicate:v14 keysToFetch:v13 error:&v21];

  id v16 = v21;
  if (v16)
  {
    v17 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[ATXSenderImportanceUtils _contactFromName:contactStore:]((uint64_t)v14, (uint64_t)v16, v17);
    }

    v18 = 0;
  }
  else
  {
    if (![v15 count])
    {
      v19 = __atxlog_handle_notification_categorization();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v5;
        _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_INFO, "No contact matches found for the given name: %@", buf, 0xCu);
      }
    }
    v18 = [v15 firstObject];
  }

  return v18;
}

+ (void)_contactFromName:(os_log_t)log contactStore:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Error when fetching contact for predicate %@: %@", (uint8_t *)&v3, 0x16u);
}

@end