@interface INSendMessageIntentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axIsRecipientSelectedInClarity:(id)a3;
- (void)setRecipients:(id)a3;
@end

@implementation INSendMessageIntentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"INSendMessageIntent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setRecipients:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19 = (void *)[v4 mutableCopy];
  v5 = objc_opt_new();
  int v6 = [v5 isClarityBoardEnabled];

  if (v6)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v4;
    obuint64_t j = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "siriMatches", v18);
          if ([v11 count])
          {
            long long v25 = 0u;
            long long v26 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            id v12 = v11;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v24;
              while (2)
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v24 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  v17 = [*(id *)(*((void *)&v23 + 1) + 8 * j) contactIdentifier];
                  if ([v17 length]
                    && [(INSendMessageIntentAccessibility *)self _axIsRecipientSelectedInClarity:v17])
                  {

                    goto LABEL_19;
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }

            [v19 removeObject:v10];
          }
LABEL_19:
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }

    id v4 = v18;
  }
  v22.receiver = self;
  v22.super_class = (Class)INSendMessageIntentAccessibility;
  -[INSendMessageIntentAccessibility setRecipients:](&v22, sel_setRecipients_, v19, v18);
}

- (BOOL)_axIsRecipientSelectedInClarity:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFEA98] sharedInstance];
  v5 = [v4 entries];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "contactProperty", (void)v14);
        v11 = [(id)v10 contact];
        id v12 = [v11 identifier];

        LOBYTE(v10) = [v12 isEqualToString:v3];
        if (v10)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

@end