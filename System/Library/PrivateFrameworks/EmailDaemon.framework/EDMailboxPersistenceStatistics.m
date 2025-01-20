@interface EDMailboxPersistenceStatistics
- (EDMailboxPersistenceStatistics)initWithMessagesInLargestMailbox:(int64_t)a3 messagesInSecondLargestMailbox:(int64_t)a4 messagesPerMailbox:(id)a5 mailboxesPerAccount:(id)a6 messagesPerAccount:(id)a7 accountTypePerAccount:(id)a8 messagesPerInbox:(id)a9 accountPerInbox:(id)a10;
- (NSDictionary)accountPerInbox;
- (NSDictionary)accountTypePerAccount;
- (NSDictionary)mailboxesPerAccount;
- (NSDictionary)messagesPerAccount;
- (NSDictionary)messagesPerInbox;
- (NSDictionary)messagesPerMailbox;
- (NSString)debugDescription;
- (NSString)redactedDescription;
- (int64_t)messagesInLargestMailbox;
- (int64_t)messagesInSecondLargestMailbox;
@end

@implementation EDMailboxPersistenceStatistics

- (EDMailboxPersistenceStatistics)initWithMessagesInLargestMailbox:(int64_t)a3 messagesInSecondLargestMailbox:(int64_t)a4 messagesPerMailbox:(id)a5 mailboxesPerAccount:(id)a6 messagesPerAccount:(id)a7 accountTypePerAccount:(id)a8 messagesPerInbox:(id)a9 accountPerInbox:(id)a10
{
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v16 = a9;
  id v17 = a10;
  v26.receiver = self;
  v26.super_class = (Class)EDMailboxPersistenceStatistics;
  v18 = [(EDMailboxPersistenceStatistics *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountTypePerAccount, a8);
    v19->_messagesInLargestMailbox = a3;
    v19->_messagesInSecondLargestMailbox = a4;
    objc_storeStrong((id *)&v19->_messagesPerMailbox, a5);
    objc_storeStrong((id *)&v19->_mailboxesPerAccount, a6);
    objc_storeStrong((id *)&v19->_messagesPerAccount, a7);
    objc_storeStrong((id *)&v19->_messagesPerInbox, a9);
    objc_storeStrong((id *)&v19->_accountPerInbox, a10);
  }

  return v19;
}

- (NSString)debugDescription
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[EDMailboxPersistenceStatistics messagesInLargestMailbox](self, "messagesInLargestMailbox"));
  [v3 appendFormat:@"Largest mailbox: %@ messages\n", v4];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[EDMailboxPersistenceStatistics messagesInSecondLargestMailbox](self, "messagesInSecondLargestMailbox"));
  [v3 appendFormat:@"Second Largest mailbox: %@ messages\n", v5];

  [v3 appendFormat:@"Mailboxes per account:\n"];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v6 = [(EDMailboxPersistenceStatistics *)self mailboxesPerAccount];
  v7 = [v6 keysSortedByValueUsingComparator:&__block_literal_global_34];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        v12 = [(EDMailboxPersistenceStatistics *)self mailboxesPerAccount];
        v13 = [v12 objectForKeyedSubscript:v11];
        [v3 appendFormat:@"\t%@: %lu\n", v11, objc_msgSend(v13, "count")];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v8);
  }

  [v3 appendFormat:@"Messages per account:\n"];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v14 = [(EDMailboxPersistenceStatistics *)self messagesPerAccount];
  v15 = [v14 keysSortedByValueUsingComparator:&__block_literal_global_17];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v50 + 1) + 8 * j);
        v20 = [(EDMailboxPersistenceStatistics *)self messagesPerAccount];
        v21 = [v20 objectForKeyedSubscript:v19];
        [v3 appendFormat:@"\t%@: %@\n", v19, v21];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v16);
  }

  [v3 appendFormat:@"Messages per inbox:\n"];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v22 = [(EDMailboxPersistenceStatistics *)self messagesPerInbox];
  id v23 = [v22 keysSortedByValueUsingComparator:&__block_literal_global_25];

  uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v59 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = *(void *)(*((void *)&v46 + 1) + 8 * k);
        v28 = [(EDMailboxPersistenceStatistics *)self messagesPerInbox];
        v29 = [v28 objectForKeyedSubscript:v27];
        [v3 appendFormat:@"\t%@: %@\n", v27, v29];
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v59 count:16];
    }
    while (v24);
  }

  [v3 appendFormat:@"Messages per mailbox:\n"];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v30 = [(EDMailboxPersistenceStatistics *)self messagesPerMailbox];
  obuint64_t j = [v30 keysSortedByValueUsingComparator:&__block_literal_global_30];

  uint64_t v31 = [obj countByEnumeratingWithState:&v42 objects:v58 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v43;
LABEL_24:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v43 != v32) {
        objc_enumerationMutation(obj);
      }
      uint64_t v34 = *(void *)(*((void *)&v42 + 1) + 8 * v33);
      v35 = [(EDMailboxPersistenceStatistics *)self messagesPerMailbox];
      v36 = [v35 objectForKeyedSubscript:v34];
      BOOL v37 = [v36 integerValue] > 0;

      if (!v37) {
        break;
      }
      v38 = [(EDMailboxPersistenceStatistics *)self messagesPerMailbox];
      v39 = [v38 objectForKeyedSubscript:v34];
      [v3 appendFormat:@"\t%@: %@\n", v34, v39];

      if (v31 == ++v33)
      {
        uint64_t v31 = [obj countByEnumeratingWithState:&v42 objects:v58 count:16];
        if (v31) {
          goto LABEL_24;
        }
        break;
      }
    }
  }

  return (NSString *)v3;
}

uint64_t __50__EDMailboxPersistenceStatistics_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  uint64_t v8 = [v6 compare:v7];

  return v8;
}

uint64_t __50__EDMailboxPersistenceStatistics_debugDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __50__EDMailboxPersistenceStatistics_debugDescription__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __50__EDMailboxPersistenceStatistics_debugDescription__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (NSString)redactedDescription
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v44 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v44, "appendFormat:", @"Largest mailbox: %ld messages\n", objc_msgSend(MEMORY[0x1E4F60E00], "roundedInteger:", -[EDMailboxPersistenceStatistics messagesInLargestMailbox](self, "messagesInLargestMailbox")));
  objc_msgSend(v44, "appendFormat:", @"Second Largest mailbox: %ld messages\n", objc_msgSend(MEMORY[0x1E4F60E00], "roundedInteger:", -[EDMailboxPersistenceStatistics messagesInSecondLargestMailbox](self, "messagesInSecondLargestMailbox")));
  [v44 appendFormat:@"Mailboxes per account:\n"];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v3 = [(EDMailboxPersistenceStatistics *)self mailboxesPerAccount];
  id v4 = [v3 keysSortedByValueUsingComparator:&__block_literal_global_39];

  id v5 = v4;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v58 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E4F60E00];
        uint64_t v11 = [(EDMailboxPersistenceStatistics *)self mailboxesPerAccount];
        v12 = [v11 objectForKeyedSubscript:v9];
        [v44 appendFormat:@"\t%@: %ld\n", v9, objc_msgSend(v10, "roundedInteger:", objc_msgSend(v12, "count"))];
      }
      id v4 = v5;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v6);
  }

  [v44 appendFormat:@"Messages per account:\n"];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v13 = [(EDMailboxPersistenceStatistics *)self messagesPerAccount];
  obuint64_t j = [v13 keysSortedByValueUsingComparator:&__block_literal_global_44];

  uint64_t v14 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v54 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        v18 = (void *)MEMORY[0x1E4F60E00];
        uint64_t v19 = [(EDMailboxPersistenceStatistics *)self messagesPerAccount];
        v20 = [v19 objectForKeyedSubscript:v17];
        [v44 appendFormat:@"\t%@: %ld\n", v17, objc_msgSend(v18, "roundedInteger:", objc_msgSend(v20, "integerValue"))];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v14);
  }

  [v44 appendFormat:@"Messages per inbox:\n"];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v21 = [(EDMailboxPersistenceStatistics *)self messagesPerInbox];
  id obja = [v21 keysSortedByValueUsingComparator:&__block_literal_global_46_0];

  uint64_t v22 = [obja countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v50 != v23) {
          objc_enumerationMutation(obja);
        }
        uint64_t v25 = *(void *)(*((void *)&v49 + 1) + 8 * k);
        objc_super v26 = (void *)MEMORY[0x1E4F60E00];
        uint64_t v27 = [(EDMailboxPersistenceStatistics *)self messagesPerInbox];
        v28 = [v27 objectForKeyedSubscript:v25];
        [v44 appendFormat:@"\t%@: %ld\n", v25, objc_msgSend(v26, "roundedInteger:", objc_msgSend(v28, "integerValue"))];
      }
      uint64_t v22 = [obja countByEnumeratingWithState:&v49 objects:v62 count:16];
    }
    while (v22);
  }

  [v44 appendFormat:@"Messages per mailbox:\n"];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v29 = [(EDMailboxPersistenceStatistics *)self messagesPerMailbox];
  v30 = [v29 keysSortedByValueUsingComparator:&__block_literal_global_48];

  uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v46;
LABEL_24:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v46 != v32) {
        objc_enumerationMutation(v30);
      }
      uint64_t v34 = *(void *)(*((void *)&v45 + 1) + 8 * v33);
      v35 = [(EDMailboxPersistenceStatistics *)self messagesPerMailbox];
      v36 = [v35 objectForKeyedSubscript:v34];
      BOOL v37 = [v36 integerValue] > 0;

      if (!v37) {
        break;
      }
      v38 = (void *)MEMORY[0x1E4F60E00];
      v39 = [(EDMailboxPersistenceStatistics *)self messagesPerMailbox];
      v40 = [v39 objectForKeyedSubscript:v34];
      [v44 appendFormat:@"\t%@: %ld\n", v34, objc_msgSend(v38, "roundedInteger:", objc_msgSend(v40, "integerValue"))];

      if (v31 == ++v33)
      {
        uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v61 count:16];
        if (v31) {
          goto LABEL_24;
        }
        break;
      }
    }
  }

  return (NSString *)v44;
}

uint64_t __53__EDMailboxPersistenceStatistics_redactedDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  uint64_t v8 = [v6 compare:v7];

  return v8;
}

uint64_t __53__EDMailboxPersistenceStatistics_redactedDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __53__EDMailboxPersistenceStatistics_redactedDescription__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __53__EDMailboxPersistenceStatistics_redactedDescription__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (NSDictionary)accountTypePerAccount
{
  return self->_accountTypePerAccount;
}

- (NSDictionary)accountPerInbox
{
  return self->_accountPerInbox;
}

- (int64_t)messagesInLargestMailbox
{
  return self->_messagesInLargestMailbox;
}

- (int64_t)messagesInSecondLargestMailbox
{
  return self->_messagesInSecondLargestMailbox;
}

- (NSDictionary)messagesPerMailbox
{
  return self->_messagesPerMailbox;
}

- (NSDictionary)mailboxesPerAccount
{
  return self->_mailboxesPerAccount;
}

- (NSDictionary)messagesPerAccount
{
  return self->_messagesPerAccount;
}

- (NSDictionary)messagesPerInbox
{
  return self->_messagesPerInbox;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesPerInbox, 0);
  objc_storeStrong((id *)&self->_messagesPerAccount, 0);
  objc_storeStrong((id *)&self->_mailboxesPerAccount, 0);
  objc_storeStrong((id *)&self->_messagesPerMailbox, 0);
  objc_storeStrong((id *)&self->_accountPerInbox, 0);

  objc_storeStrong((id *)&self->_accountTypePerAccount, 0);
}

@end