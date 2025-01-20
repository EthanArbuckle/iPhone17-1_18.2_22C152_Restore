@interface CNDonatedMeCardPersistenceHelper
+ (BOOL)createNewMeContact:(id)a3 inStore:(id)a4;
+ (id)defaultKeysForValuesToPersist;
+ (id)mutableCopyOfContact:(id)a3 byCopyingModificationsAndValuesForKeysOnly:(id)a4;
+ (id)mutableCopyOfContact:(id)a3 byCopyingValuesForKeysOnly:(id)a4;
+ (id)propertyGroupItemLog;
@end

@implementation CNDonatedMeCardPersistenceHelper

+ (id)propertyGroupItemLog
{
  if (propertyGroupItemLog_cn_once_token_4 != -1) {
    dispatch_once(&propertyGroupItemLog_cn_once_token_4, &__block_literal_global_11);
  }
  v2 = (void *)propertyGroupItemLog_cn_once_object_4;

  return v2;
}

void __56__CNDonatedMeCardPersistenceHelper_propertyGroupItemLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "contacts-ui");
  v1 = (void *)propertyGroupItemLog_cn_once_object_4;
  propertyGroupItemLog_cn_once_object_4 = (uint64_t)v0;
}

+ (id)defaultKeysForValuesToPersist
{
  if (defaultKeysForValuesToPersist_cn_once_token_3 != -1) {
    dispatch_once(&defaultKeysForValuesToPersist_cn_once_token_3, &__block_literal_global_8);
  }
  v2 = (void *)defaultKeysForValuesToPersist_cn_once_object_3;

  return v2;
}

void __65__CNDonatedMeCardPersistenceHelper_defaultKeysForValuesToPersist__block_invoke()
{
  v11[19] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1AE28];
  v11[0] = *MEMORY[0x1E4F1AFA8];
  v11[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1AF98];
  v11[2] = *MEMORY[0x1E4F1ADA8];
  v11[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AEB0];
  v11[4] = *MEMORY[0x1E4F1AE20];
  v11[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AEA0];
  v11[6] = *MEMORY[0x1E4F1ADF0];
  v11[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AEB8];
  v11[8] = *MEMORY[0x1E4F1ADE0];
  v11[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AEC0];
  v11[10] = *MEMORY[0x1E4F1AF30];
  v11[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1ADB8];
  v11[12] = *MEMORY[0x1E4F1AED8];
  v11[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AEF8];
  v11[14] = *MEMORY[0x1E4F1AE78];
  v11[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1AEF0];
  v11[16] = *MEMORY[0x1E4F1AF00];
  v11[17] = v8;
  v11[18] = *MEMORY[0x1E4F1AF08];
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:19];
  v10 = (void *)defaultKeysForValuesToPersist_cn_once_object_3;
  defaultKeysForValuesToPersist_cn_once_object_3 = v9;
}

+ (BOOL)createNewMeContact:(id)a3 inStore:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 saveContactInStore:v7 group:0 container:0])
  {
    id v12 = 0;
    char v8 = [v7 setMeContact:v6 error:&v12];
    uint64_t v9 = v12;
    if (v9)
    {
      v10 = [a1 propertyGroupItemLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v14 = v9;
        _os_log_impl(&dword_18B625000, v10, OS_LOG_TYPE_DEFAULT, "could not set new me contact: %{private}@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v9 = [a1 propertyGroupItemLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEFAULT, "could not save new me contact", buf, 2u);
    }
    char v8 = 0;
  }

  return v8;
}

+ (id)mutableCopyOfContact:(id)a3 byCopyingModificationsAndValuesForKeysOnly:(id)a4
{
  id v6 = a3;
  id v7 = (void *)[a1 mutableCopyOfContact:v6 byCopyingValuesForKeysOnly:a4];
  char v8 = [v6 diffToSnapshotAndReturnError:0];

  uint64_t v9 = *MEMORY[0x1E4F5A258];
  v10 = [v8 updates];
  LOBYTE(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  if (v9)
  {
    id v11 = v7;
  }
  else
  {
    id v12 = [v8 contactByApplyingUpdatesToContact:v7];
    id v11 = (id)[v12 mutableCopy];
  }
  return v11;
}

+ (id)mutableCopyOfContact:(id)a3 byCopyingValuesForKeysOnly:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__CNDonatedMeCardPersistenceHelper_mutableCopyOfContact_byCopyingValuesForKeysOnly___block_invoke;
  v23[3] = &unk_1E549A598;
  id v6 = v5;
  id v24 = v6;
  id v7 = objc_msgSend(a4, "_cn_filter:", v23);
  char v8 = objc_msgSend(v7, "_cn_map:", &__block_literal_global_5128);
  uint64_t v9 = objc_msgSend(v8, "_cn_filter:", &__block_literal_global_4_5129);

  id v10 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "CNValueForContact:", v6, (void)v19);
        [v16 setCNValue:v17 onContact:v10];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v13);
  }

  return v10;
}

uint64_t __84__CNDonatedMeCardPersistenceHelper_mutableCopyOfContact_byCopyingValuesForKeysOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isKeyAvailable:a2];
}

uint64_t __84__CNDonatedMeCardPersistenceHelper_mutableCopyOfContact_byCopyingValuesForKeysOnly___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isWritable];
}

id __84__CNDonatedMeCardPersistenceHelper_mutableCopyOfContact_byCopyingValuesForKeysOnly___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1B898];
  id v3 = a2;
  uint64_t v4 = [v2 contactPropertiesByKey];
  id v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

@end