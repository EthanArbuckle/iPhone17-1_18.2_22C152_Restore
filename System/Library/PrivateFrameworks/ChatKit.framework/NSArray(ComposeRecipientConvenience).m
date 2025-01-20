@interface NSArray(ComposeRecipientConvenience)
- (id)composeRecipientAddresses;
- (id)composeRecipientHandles;
- (id)composeRecipientNormalizedAddresses;
@end

@implementation NSArray(ComposeRecipientConvenience)

- (id)composeRecipientHandles
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v3 = [a1 composeRecipientAddresses];
  v4 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  v16 = (void *)v3;
  v5 = objc_msgSend(v4, "__ck_bestAccountForAddresses:", v3);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 handle];
          if (v12) {
            goto LABEL_13;
          }
        }
        else
        {
          v13 = [v11 rawAddress];
          if (v13)
          {
            v14 = IMStripFormattingFromAddress();
            v12 = [v5 imHandleWithID:v14];
          }
          else
          {
            v12 = 0;
          }

          if (v12) {
LABEL_13:
          }
            [v2 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v2;
}

- (id)composeRecipientAddresses
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = a1;
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          uint64_t v8 = [v7 children];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v17;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v17 != v11) {
                  objc_enumerationMutation(v8);
                }
                v13 = [*(id *)(*((void *)&v16 + 1) + 8 * j) rawAddress];
                if (v13) {
                  [v2 addObject:v13];
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v10);
          }
        }
        else
        {
          uint64_t v8 = [v7 rawAddress];
          if (v8) {
            [v2 addObject:v8];
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)composeRecipientNormalizedAddresses
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v3 = (const void *)MEMORY[0x192FB9A40](1);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = objc_msgSend(v9, "address", (void)v17);
          if (v10)
          {
            if ([v9 isPhone])
            {
              uint64_t v11 = CFPhoneNumberCreate();
              if (v11)
              {
                v12 = (const void *)v11;
                uint64_t v13 = CFPhoneNumberCopyUnformattedInternationalRepresentation();
                v14 = (void *)v13;
                if (v13) {
                  v15 = (void *)v13;
                }
                else {
                  v15 = v10;
                }
                [v2 addObject:v15];
                CFRelease(v12);
              }
            }
            else
            {
              [v2 addObject:v10];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  if (v3) {
    CFRelease(v3);
  }

  return v2;
}

@end