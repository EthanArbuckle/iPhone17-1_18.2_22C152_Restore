@interface CNContact(CallHistory)
- (id)handlesIncluding:()CallHistory;
@end

@implementation CNContact(CallHistory)

- (id)handlesIncluding:()CallHistory
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * i));
        objc_msgSend(v4, "addObjectsFromArray:", v10, (void)v13);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];
  return v11;
}

@end