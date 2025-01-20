@interface EMMailboxRepository(MailUI)
- (id)mui_inboxExternalURLsFromMailboxes:()MailUI;
@end

@implementation EMMailboxRepository(MailUI)

- (id)mui_inboxExternalURLsFromMailboxes:()MailUI
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend(v3, "ef_all:", &__block_literal_global_1))
  {
    v4 = [MEMORY[0x1E4F60D70] futureWithResult:v3];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v18 = v3;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v11, "type", v18) == 7)
          {
            if ([v11 isSmartMailbox])
            {
              id v12 = v11;
              if ([v12 smartMailboxType] == 8)
              {
                v13 = objc_msgSend(a1, "mailboxObjectIDsForMailboxType:", objc_msgSend(v12, "type"));
                v14 = [v13 allObjects];
                v15 = [a1 mailboxesForObjectIDs:v14];

                [v5 addObjectsFromArray:v15];
              }
            }
            else
            {
              id v12 = [MEMORY[0x1E4F60D70] futureWithResult:v11];
              [v5 addObject:v12];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    v4 = [MEMORY[0x1E4F60D70] combine:v5];

    id v3 = v18;
  }
  v16 = objc_msgSend(v4, "then:", &__block_literal_global_4, v18);

  return v16;
}

@end