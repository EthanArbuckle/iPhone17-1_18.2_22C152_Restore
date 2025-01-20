@interface EDMessageQueryEvaluator
+ (OS_os_log)log;
- (EDMessagePersistence)messagePersistence;
- (EDMessageQueryEvaluator)initWithQuery:(id)a3 messagePersistence:(id)a4;
- (EMMailboxScope)mailboxScope;
- (EMQuery)messageQuery;
- (NSPredicate)filterPredicate;
- (id)filterMessages:(id)a3 unmatchedMessages:(id *)a4;
- (id)transformAndFilterMessages:(id)a3;
- (id)transformAndFilterMessages:(id)a3 includeDeleted:(BOOL)a4;
- (id)transformMessages:(id)a3;
- (id)transformMessages:(id)a3 includeDeleted:(BOOL)a4;
- (void)setFilterPredicate:(id)a3;
@end

@implementation EDMessageQueryEvaluator

- (EDMessageQueryEvaluator)initWithQuery:(id)a3 messagePersistence:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)EDMessageQueryEvaluator;
  v9 = [(EDMessageQueryEvaluator *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageQuery, a3);
    objc_storeStrong((id *)&v10->_messagePersistence, a4);
    v11 = (void *)MEMORY[0x1E4F60390];
    v12 = [(EMQuery *)v10->_messageQuery predicate];
    v13 = [(EDMessagePersistence *)v10->_messagePersistence mailboxPersistence];
    uint64_t v14 = [v11 mailboxScopeForPredicate:v12 withMailboxTypeResolver:v13];
    mailboxScope = v10->_mailboxScope;
    v10->_mailboxScope = (EMMailboxScope *)v14;

    v16 = (void *)MEMORY[0x1E4F60390];
    v17 = [v7 predicate];
    uint64_t v18 = [v16 predicateStrippingSpotlightOnlyTerms:v17];
    filterPredicate = v10->_filterPredicate;
    v10->_filterPredicate = (NSPredicate *)v18;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_messageQuery, 0);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__EDMessageQueryEvaluator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_56 != -1) {
    dispatch_once(&log_onceToken_56, block);
  }
  v2 = (void *)log_log_56;

  return (OS_os_log *)v2;
}

void __30__EDMessageQueryEvaluator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_56;
  log_log_56 = (uint64_t)v1;
}

- (id)transformAndFilterMessages:(id)a3
{
  id v3 = [(EDMessageQueryEvaluator *)self transformAndFilterMessages:a3 includeDeleted:0];

  return v3;
}

- (id)transformAndFilterMessages:(id)a3 includeDeleted:(BOOL)a4
{
  v5 = [(EDMessageQueryEvaluator *)self transformMessages:a3 includeDeleted:a4];
  v6 = [(EDMessageQueryEvaluator *)self filterMessages:v5 unmatchedMessages:0];

  return v6;
}

- (id)transformMessages:(id)a3
{
  id v3 = [(EDMessageQueryEvaluator *)self transformMessages:a3 includeDeleted:0];

  return v3;
}

- (id)transformMessages:(id)a3 includeDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(EDMessageQueryEvaluator *)self messagePersistence];
  id v8 = [(EDMessageQueryEvaluator *)self mailboxScope];
  v9 = [v7 messagesForPersistedMessages:v6 mailboxScope:v8];

  if (v4)
  {
    id v10 = v9;
  }
  else
  {
    objc_msgSend(v9, "ef_filter:", &__block_literal_global_47);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

uint64_t __60__EDMessageQueryEvaluator_transformMessages_includeDeleted___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 flags];
  uint64_t v3 = [v2 deleted] ^ 1;

  return v3;
}

- (id)filterMessages:(id)a3 unmatchedMessages:(id *)a4
{
  v18[8] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(EDMessageQueryEvaluator *)self messageQuery];
  id v8 = [v7 predicate];

  v9 = [(EDMessageQueryEvaluator *)self messageQuery];
  id v10 = [v9 sortDescriptors];

  if (a4)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__EDMessageQueryEvaluator_filterMessages_unmatchedMessages___block_invoke;
    v18[3] = &unk_1E6BFF8B8;
    v18[4] = self;
    v11 = objc_msgSend(v6, "ef_partition:", v18);
    v12 = [v11 second];
    *a4 = [v12 sortedArrayUsingDescriptors:v10];

    v13 = [v11 first];
    uint64_t v14 = [v13 sortedArrayUsingDescriptors:v10];
  }
  else
  {
    v15 = [(EDMessageQueryEvaluator *)self filterPredicate];
    v16 = [v6 filteredArrayUsingPredicate:v15];
    uint64_t v14 = [v16 sortedArrayUsingDescriptors:v10];
  }

  return v14;
}

uint64_t __60__EDMessageQueryEvaluator_filterMessages_unmatchedMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) filterPredicate];
  uint64_t v5 = [v4 evaluateWithObject:v3];

  return v5;
}

- (EMQuery)messageQuery
{
  return self->_messageQuery;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
}

- (void)filterMessages:(uint8_t *)buf unmatchedMessages:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1DB39C000, log, OS_LOG_TYPE_FAULT, "Exception occured: %{public}@\nSymbols:\n%{public}@", buf, 0x16u);
}

@end