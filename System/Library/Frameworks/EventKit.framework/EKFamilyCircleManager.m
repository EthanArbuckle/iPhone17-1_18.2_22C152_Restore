@interface EKFamilyCircleManager
+ (BOOL)isFamilyCalendar:(id)a3 givenFamilySharees:(id)a4;
+ (BOOL)isFamilyCalendarGivenCalendarSharees:(id)a3 familySharees:(id)a4 isPrimaryAppleAccount:(BOOL)a5;
+ (void)isFamilyCalendar:(id)a3 completion:(id)a4;
+ (void)requestFamilyShareesWithCompletion:(id)a3;
@end

@implementation EKFamilyCircleManager

+ (void)requestFamilyShareesWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F61858]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__EKFamilyCircleManager_requestFamilyShareesWithCompletion___block_invoke;
  v6[3] = &unk_1E5B98438;
  id v7 = v3;
  id v5 = v3;
  [v4 startRequestWithCompletionHandler:v6];
}

void __60__EKFamilyCircleManager_requestFamilyShareesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v23 = a3;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [v4 members];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v12 = [v11 fullName];
        v13 = [v11 appleID];
        v14 = +[EKSharee shareeWithName:v12 emailAddress:v13];

        v15 = [v11 firstName];
        [v14 setFirstName:v15];

        v16 = [v11 lastName];
        [v14 setLastName:v16];

        v17 = [v11 appleIDAliases];
        [v14 setFamilyEmailAddressAliases:v17];

        if ([v11 isMe])
        {
          id v18 = v14;

          v8 = v18;
        }
        else
        {
          [v24 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__EKFamilyCircleManager_requestFamilyShareesWithCompletion___block_invoke_2;
  block[3] = &unk_1E5B98410;
  id v19 = *(id *)(a1 + 32);
  id v27 = v8;
  id v28 = v19;
  id v26 = v24;
  id v20 = v8;
  id v21 = v24;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__EKFamilyCircleManager_requestFamilyShareesWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)isFamilyCalendar:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 source];
  char v9 = [v8 isPrimaryAppleAccount];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__EKFamilyCircleManager_isFamilyCalendar_completion___block_invoke;
    v10[3] = &unk_1E5B98460;
    id v11 = v6;
    id v13 = a1;
    id v12 = v7;
    [a1 requestFamilyShareesWithCompletion:v10];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __53__EKFamilyCircleManager_isFamilyCalendar_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 sharees];
  [*(id *)(a1 + 48) isFamilyCalendarGivenCalendarSharees:v5 familySharees:v4 isPrimaryAppleAccount:1];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)isFamilyCalendar:(id)a3 givenFamilySharees:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 sharees];
  char v9 = [v7 source];

  LOBYTE(v7) = objc_msgSend(a1, "isFamilyCalendarGivenCalendarSharees:familySharees:isPrimaryAppleAccount:", v8, v6, objc_msgSend(v9, "isPrimaryAppleAccount"));
  return (char)v7;
}

+ (BOOL)isFamilyCalendarGivenCalendarSharees:(id)a3 familySharees:(id)a4 isPrimaryAppleAccount:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v5)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v15 = v8;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v24;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v24 != v18) {
                  objc_enumerationMutation(v15);
                }
                if ([v14 isEqualToSharee:*(void *)(*((void *)&v23 + 1) + 8 * j)])
                {

                  BOOL v20 = 1;
                  goto LABEL_21;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          uint64_t v12 = v22;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
        BOOL v20 = 0;
      }
      while (v11);
    }
    else
    {
      BOOL v20 = 0;
    }
LABEL_21:
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

@end