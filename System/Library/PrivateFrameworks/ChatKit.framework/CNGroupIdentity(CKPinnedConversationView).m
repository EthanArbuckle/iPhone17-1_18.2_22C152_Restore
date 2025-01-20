@interface CNGroupIdentity(CKPinnedConversationView)
- (id)ck_contactInstancesMatchingContacts:()CKPinnedConversationView;
@end

@implementation CNGroupIdentity(CKPinnedConversationView)

- (id)ck_contactInstancesMatchingContacts:()CKPinnedConversationView
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v20 = [a1 contacts];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v11 = v20;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              if (objc_msgSend(v16, "_im_isEqualToContact:", v10)) {
                [v5 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  v17 = (void *)[v5 copy];

  return v17;
}

@end