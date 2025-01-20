@interface IMAccountController(CKAdditions)
- (id)__ck_bestAccountForAddress:()CKAdditions;
- (id)__ck_bestAccountForAddresses:()CKAdditions;
- (id)__ck_bestAccountForAddresses:()CKAdditions withFallbackService:;
- (id)__ck_defaultAccountForService:()CKAdditions;
- (id)fallbackServiceForAddresses:()CKAdditions;
@end

@implementation IMAccountController(CKAdditions)

- (id)__ck_defaultAccountForService:()CKAdditions
{
  id v3 = a3;
  if (CKIsRunningUITests())
  {
    v4 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    v5 = [v4 simulatedChats];
    v6 = [v5 firstObject];

    v7 = [v6 account];
  }
  else
  {
    v7 = IMPreferredAccountForService();
  }

  return v7;
}

- (id)__ck_bestAccountForAddresses:()CKAdditions
{
  id v4 = a3;
  v5 = [a1 fallbackServiceForAddresses:v4];
  v6 = objc_msgSend(a1, "__ck_bestAccountForAddresses:withFallbackService:", v4, v5);

  return v6;
}

- (id)fallbackServiceForAddresses:()CKAdditions
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v3 objectAtIndexedSubscript:0];
      int v6 = objc_msgSend(v5, "__im_isChatBot");

      if (v6)
      {
        uint64_t v7 = [MEMORY[0x1E4F6BDC0] rcsService];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v7 = [MEMORY[0x1E4F6BDC0] iMessageService];
LABEL_7:
  v8 = (void *)v7;

  return v8;
}

- (id)__ck_bestAccountForAddresses:()CKAdditions withFallbackService:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (CKIsRunningUITests())
  {
    id v28 = v7;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v8 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    v9 = [v8 simulatedChats];

    id obj = v9;
    uint64_t v31 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v31)
    {
      uint64_t v30 = *(void *)v37;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        id v11 = v6;
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        v13 = [MEMORY[0x1E4F1CA48] array];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v14 = [v12 participants];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = [*(id *)(*((void *)&v32 + 1) + 8 * i) ID];
              v20 = IMStripFormattingFromAddress();
              [v13 addObject:v20];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v16);
        }

        id v6 = v11;
        if ([v13 isEqualToArray:v11]) {
          break;
        }

        if (++v10 == v31)
        {
          uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
          if (v31) {
            goto LABEL_4;
          }
          goto LABEL_17;
        }
      }
      v21 = [v12 account];

      id v7 = v28;
      if (v21) {
        goto LABEL_24;
      }
    }
    else
    {
LABEL_17:

      id v7 = v28;
    }
    v22 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    v23 = [v22 simulatedChats];
    v24 = [v23 firstObject];

    v21 = [v24 account];
  }
  else
  {
    v21 = IMPreferredSendingAccountForAddressesWantsGroupWithFallbackService();
    if ([v21 _isUsableForSending]) {
      goto LABEL_24;
    }
    v24 = [MEMORY[0x1E4F6BDC0] smsService];
    if (v24)
    {
      v25 = [a1 accountsForService:v24];
      uint64_t v26 = objc_msgSend(v25, "__imFirstObject");

      v21 = (void *)v26;
    }
  }

LABEL_24:

  return v21;
}

- (id)__ck_bestAccountForAddress:()CKAdditions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v11[0] = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:v11 count:1];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1C978];
    id v5 = 0;
    uint64_t v6 = [v7 array];
  }
  v8 = (void *)v6;

  v9 = objc_msgSend(a1, "__ck_bestAccountForAddresses:", v8);

  return v9;
}

@end