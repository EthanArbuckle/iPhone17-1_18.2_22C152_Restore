@interface IMContactUtilities
+ (id)getContactFullNameAndOrganizationNameForHandleID:(id)a3;
+ (id)getContactGivenNameAndBirthdayForHandleID:(id)a3;
+ (id)getContactPropertiesForHandleID:(id)a3 withKeys:(id)a4;
@end

@implementation IMContactUtilities

+ (id)getContactGivenNameAndBirthdayForHandleID:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6 = +[IMContactStore validateAndCleanupID:v4];
    v7 = +[IMContactStore sharedInstance];
    uint64_t v8 = *MEMORY[0x1E4F1AD90];
    uint64_t v9 = *MEMORY[0x1E4F1ADF0];
    v28[0] = *MEMORY[0x1E4F1AD90];
    v28[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v11 = [v7 fetchCNContactForHandleID:v6 withKeys:v10];

    uint64_t v27 = v9;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    LODWORD(v10) = [v11 areKeysAvailable:v12];

    if (v10)
    {
      v13 = [v11 givenName];

      if (v13)
      {
        v14 = [v11 givenName];
        [v5 setObject:v14 forKey:v9];
      }
    }
    uint64_t v26 = v8;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    int v16 = [v11 areKeysAvailable:v15];

    if (v16)
    {
      v17 = [v11 birthday];

      if (v17)
      {
        v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        v19 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
        [v18 setTimeZone:v19];

        id v20 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
        v21 = [v11 birthday];
        objc_msgSend(v20, "setDay:", objc_msgSend(v21, "day"));

        v22 = [v11 birthday];
        objc_msgSend(v20, "setMonth:", objc_msgSend(v22, "month"));

        v23 = [v11 birthday];
        objc_msgSend(v20, "setYear:", objc_msgSend(v23, "year"));

        v24 = [v18 dateFromComponents:v20];
        [v5 setObject:v24 forKey:v8];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)getContactFullNameAndOrganizationNameForHandleID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1ADE0];
  uint64_t v9 = *MEMORY[0x1E4F1ADF0];
  uint64_t v10 = v3;
  uint64_t v11 = *MEMORY[0x1E4F1AED8];
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:3];
  v7 = +[IMContactUtilities getContactPropertiesForHandleID:withKeys:](IMContactUtilities, "getContactPropertiesForHandleID:withKeys:", v5, v6, v9, v10, v11, v12);

  return v7;
}

+ (id)getContactPropertiesForHandleID:(id)a3 withKeys:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 length])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = +[IMContactStore validateAndCleanupID:v5];
    uint64_t v9 = +[IMContactStore sharedInstance];
    v19 = (void *)v8;
    uint64_t v10 = [v9 fetchCNContactForHandleID:v8 withKeys:v6];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          if ([v10 isKeyAvailable:v16])
          {
            v17 = [v10 valueForKey:v16];
            if (v17) {
              [v7 setObject:v17 forKey:v16];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end