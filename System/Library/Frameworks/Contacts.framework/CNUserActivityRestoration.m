@interface CNUserActivityRestoration
+ (id)contactBestMatchingPayload:(id)a3 additionalKeysToFetch:(id)a4 contactStore:(id)a5 error:(id *)a6;
+ (id)contactsForServerUUIDs:(id)a3 additionalKeysToFetch:(id)a4 contactStore:(id)a5 error:(id *)a6;
+ (id)contactsGivenPayload:(id)a3 keysToFetch:(id)a4 contactStore:(id)a5 error:(id *)a6;
+ (id)contactsToCreateGivenPayload:(id)a3 error:(id *)a4;
+ (id)os_log;
+ (id)searchQueryGivenPayload:(id)a3;
@end

@implementation CNUserActivityRestoration

+ (id)os_log
{
  if (os_log_cn_once_token_0_12 != -1) {
    dispatch_once(&os_log_cn_once_token_0_12, &__block_literal_global_5_2);
  }
  v2 = (void *)os_log_cn_once_object_0_12;

  return v2;
}

uint64_t __35__CNUserActivityRestoration_os_log__block_invoke()
{
  os_log_cn_once_object_0_12 = (uint64_t)os_log_create("com.apple.contacts", "userActivityRestoration");

  return MEMORY[0x1F41817F8]();
}

+ (id)searchQueryGivenPayload:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"search-query"];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }
  else {
    v5 = &stru_1EE052B80;
  }

  return v5;
}

+ (id)contactsToCreateGivenPayload:(id)a3 error:(id *)a4
{
  v5 = [a3 objectForKeyedSubscript:@"vcard"];
  v6 = +[CNContactVCardSerialization contactsWithData:v5 error:a4];

  return v6;
}

+ (id)contactsGivenPayload:(id)a3 keysToFetch:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v10 objectForKeyedSubscript:@"carddav-uuids"];
  id v23 = 0;
  v14 = [a1 contactsForServerUUIDs:v13 additionalKeysToFetch:v11 contactStore:v12 error:&v23];
  id v15 = v23;
  if (v15)
  {
    id v16 = v15;
    v17 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[CNUserActivityRestoration contactsGivenPayload:keysToFetch:contactStore:error:]((uint64_t)v13, (uint64_t)v16, v17);
    }

    id v18 = 0;
    if (a6) {
      *a6 = v16;
    }
  }
  else if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    id v22 = 0;
    v19 = [a1 contactBestMatchingPayload:v10 additionalKeysToFetch:v11 contactStore:v12 error:&v22];
    id v16 = v22;
    if (v16)
    {
      v20 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[CNUserActivityRestoration contactsGivenPayload:keysToFetch:contactStore:error:]((uint64_t)v16, v20);
      }

      id v18 = 0;
      if (a6) {
        *a6 = v16;
      }
    }
    else if (v19)
    {
      v24[0] = v19;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    }
    else
    {
      id v18 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v18 = v14;
    id v16 = 0;
  }

  return v18;
}

+ (id)contactsForServerUUIDs:(id)a3 additionalKeysToFetch:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if ([a3 count])
  {
    v18[0] = @"identifier";
    v18[1] = @"externalUUID";
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v19[0] = v11;
    v19[1] = v9;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v13 = objc_msgSend(v12, "_cn_flatten");

    v14 = [[CNContactFetchRequest alloc] initWithKeysToFetch:v13];
    [(CNContactFetchRequest *)v14 setUnifyResults:0];
    id v15 = [v10 executeFetchRequest:v14 error:a6];
    id v16 = [v15 value];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)contactBestMatchingPayload:(id)a3 additionalKeysToFetch:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  return 0;
}

+ (void)contactsGivenPayload:(uint64_t)a1 keysToFetch:(NSObject *)a2 contactStore:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Error fetching best matching contact: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)contactsGivenPayload:(os_log_t)log keysToFetch:contactStore:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Error fetching contacts for serverUUIDs:%{public}@ : %@", (uint8_t *)&v3, 0x16u);
}

@end