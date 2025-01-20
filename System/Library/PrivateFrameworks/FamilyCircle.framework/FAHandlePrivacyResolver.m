@interface FAHandlePrivacyResolver
+ (id)getFamilyCircle;
+ (id)privacySafeInvitees:(id)a3;
+ (void)getFamilyCircle;
@end

@implementation FAHandlePrivacyResolver

+ (id)getFamilyCircle
{
  v2 = objc_alloc_init(FAFetchFamilyCircleRequest);
  [(FAFetchFamilyCircleRequest *)v2 setCachePolicy:0];
  id v7 = 0;
  v3 = [(FAFetchFamilyCircleRequest *)v2 fetchFamilyCircleWithError:&v7];
  id v4 = v7;
  if (v4)
  {
    v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[FAHandlePrivacyResolver getFamilyCircle];
    }
  }
  return v3;
}

+ (id)privacySafeInvitees:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:v3];
  int v6 = [v5 count];
  if (v6 >= 1)
  {
    unint64_t v7 = v6 + 1;
    do
    {
      v8 = [v5 objectAtIndex:(v7 - 2)];
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v8];
      v10 = v9;
      if (!v9
        || ([v9 fullyQualifiedDigits],
            v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            !v11))
      {
        [v4 addObject:v8];
        [v5 removeObjectAtIndex:(v7 - 2)];
      }

      --v7;
    }
    while (v7 > 1);
  }
  if ([v5 count])
  {
    v12 = +[FAHandlePrivacyResolver getFamilyCircle];
    if (v12)
    {
      v26 = v5;
      id v27 = v3;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v13 = v5;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            v19 = objc_msgSend(v12, "memberForPhoneNumber:", v18, v26, v27);
            v20 = v19;
            if (v19)
            {
              v21 = [v19 appleID];

              if (v21)
              {
                v22 = [v20 appleID];
                [v4 addObject:v22];

                v23 = _FALogSystem();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  v24 = [v20 appleID];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v33 = v18;
                  __int16 v34 = 2112;
                  v35 = v24;
                  _os_log_impl(&dword_1D252C000, v23, OS_LOG_TYPE_DEFAULT, "Replaced %@ with %@ in invitee list", buf, 0x16u);
                }
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v15);
      }

      v5 = v26;
      id v3 = v27;
    }
  }
  return v4;
}

+ (void)getFamilyCircle
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D252C000, a2, OS_LOG_TYPE_ERROR, "FAFetchFamilyCircleRequest failed %@", (uint8_t *)&v2, 0xCu);
}

@end