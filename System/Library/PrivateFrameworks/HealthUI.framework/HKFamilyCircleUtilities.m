@interface HKFamilyCircleUtilities
+ (void)fetchFamilyContacts:(id)a3;
@end

@implementation HKFamilyCircleUtilities

+ (void)fetchFamilyContacts:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] == 3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F61858]);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__HKFamilyCircleUtilities_fetchFamilyContacts___block_invoke;
    v5[3] = &unk_1E6D56C30;
    id v6 = v3;
    [v4 startRequestWithCompletionHandler:v5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 110, @"Unauthorized for Contact's access.");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v3 + 2))(v3, 0, v4);
  }
}

void __47__HKFamilyCircleUtilities_fetchFamilyContacts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v5 = objc_msgSend(v3, "members", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (([v10 isMe] & 1) == 0)
          {
            v11 = [v10 contact];

            if (v11)
            {
              v12 = [v10 contact];
              v13 = [v10 contact];
              v14 = [v13 identifier];
              [v4 setObject:v12 forKeyedSubscript:v14];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    uint64_t v15 = *(void *)(a1 + 32);
    v16 = [v4 allValues];
    (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v16, 0);
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 32);
    v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 2000, @"Unable to start the family circle request.");
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);
  }
}

@end