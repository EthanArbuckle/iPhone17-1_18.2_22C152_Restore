@interface _CDSpotlightCoalescedDeletionOperation
- (BOOL)addDeletion:(id)a3;
- (_CDSpotlightCoalescedDeletionOperation)init;
- (_CDSpotlightCoalescedDeletionOperation)initWithBundleIdToIdentifiers:(id)a3 bundleIdToCompletionBlocks:(id)a4 bundleIdToDomainIdentifiers:(id)a5 bundleIdToDomainCompletionBlocks:(id)a6;
- (id)description;
- (void)enumerateDeletionPredicatesAndCompletionsWithBlock:(id)a3;
@end

@implementation _CDSpotlightCoalescedDeletionOperation

- (_CDSpotlightCoalescedDeletionOperation)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(_CDSpotlightCoalescedDeletionOperation *)self initWithBundleIdToIdentifiers:v3 bundleIdToCompletionBlocks:v4 bundleIdToDomainIdentifiers:v5 bundleIdToDomainCompletionBlocks:v6];

  return v7;
}

- (_CDSpotlightCoalescedDeletionOperation)initWithBundleIdToIdentifiers:(id)a3 bundleIdToCompletionBlocks:(id)a4 bundleIdToDomainIdentifiers:(id)a5 bundleIdToDomainCompletionBlocks:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_CDSpotlightCoalescedDeletionOperation;
  v15 = [(_CDSpotlightCoalescedDeletionOperation *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleIdToItemIdentifiers, a3);
    objc_storeStrong((id *)&v16->_bundleIdToItemCompletionBlocks, a4);
    objc_storeStrong((id *)&v16->_bundleIdToDomainIdentifiers, a5);
    objc_storeStrong((id *)&v16->_bundleIdToDomainCompletionBlocks, a6);
    uint64_t v17 = os_transaction_create();
    transaction = v16->_transaction;
    v16->_transaction = (OS_os_transaction *)v17;
  }
  return v16;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    v6 = self->_bundleIdToItemIdentifiers;
    bundleIdToDomainIdentifiers = self->_bundleIdToDomainIdentifiers;
  }
  else
  {
    v6 = 0;
    bundleIdToDomainIdentifiers = 0;
  }
  v8 = (void *)[v3 initWithFormat:@"%@ - itemIdentifierIds: %@, domainIdentifierIds: %@", v5, v6, bundleIdToDomainIdentifiers];

  return v8;
}

- (BOOL)addDeletion:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4) {
    v4 = (void *)v4[1];
  }
  if ([v4 isEqualToString:@"identifiers"])
  {
    if (v5) {
      uint64_t v6 = v5[2];
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = [(NSMutableDictionary *)self->_bundleIdToItemIdentifiers objectForKeyedSubscript:v6];

    if (!v7)
    {
      v8 = objc_opt_new();
      if (v5) {
        uint64_t v9 = v5[2];
      }
      else {
        uint64_t v9 = 0;
      }
      [(NSMutableDictionary *)self->_bundleIdToItemIdentifiers setObject:v8 forKeyedSubscript:v9];
    }
    if (v5) {
      uint64_t v10 = v5[2];
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = [(NSMutableDictionary *)self->_bundleIdToItemCompletionBlocks objectForKeyedSubscript:v10];

    if (!v11)
    {
      id v12 = objc_opt_new();
      if (v5) {
        uint64_t v13 = v5[2];
      }
      else {
        uint64_t v13 = 0;
      }
      [(NSMutableDictionary *)self->_bundleIdToItemCompletionBlocks setObject:v12 forKeyedSubscript:v13];
    }
    if (v5) {
      uint64_t v14 = v5[2];
    }
    else {
      uint64_t v14 = 0;
    }
    v15 = [(NSMutableDictionary *)self->_bundleIdToItemIdentifiers objectForKeyedSubscript:v14];
    unint64_t v16 = [v15 count];
    if (v5) {
      uint64_t v17 = v5[3];
    }
    else {
      uint64_t v17 = 0;
    }
    [v15 unionSet:v17];
    char v18 = [v15 count] > v16;
    if (!v5 || !v5[5]) {
      goto LABEL_24;
    }
    bundleIdToItemCompletionBlocks = self->_bundleIdToItemCompletionBlocks;
    goto LABEL_23;
  }
  if (v5) {
    v23 = (void *)v5[1];
  }
  else {
    v23 = 0;
  }
  if (![v23 isEqualToString:@"domainIdentifiers"])
  {
    char v18 = 0;
    goto LABEL_48;
  }
  if (v5) {
    uint64_t v24 = v5[2];
  }
  else {
    uint64_t v24 = 0;
  }
  v25 = [(NSMutableDictionary *)self->_bundleIdToDomainIdentifiers objectForKeyedSubscript:v24];

  if (!v25)
  {
    v26 = objc_opt_new();
    if (v5) {
      uint64_t v27 = v5[2];
    }
    else {
      uint64_t v27 = 0;
    }
    [(NSMutableDictionary *)self->_bundleIdToDomainIdentifiers setObject:v26 forKeyedSubscript:v27];
  }
  if (v5) {
    uint64_t v28 = v5[2];
  }
  else {
    uint64_t v28 = 0;
  }
  v29 = [(NSMutableDictionary *)self->_bundleIdToItemCompletionBlocks objectForKeyedSubscript:v28];

  if (!v29)
  {
    v30 = objc_opt_new();
    if (v5) {
      uint64_t v31 = v5[2];
    }
    else {
      uint64_t v31 = 0;
    }
    [(NSMutableDictionary *)self->_bundleIdToItemCompletionBlocks setObject:v30 forKeyedSubscript:v31];
  }
  if (v5) {
    uint64_t v32 = v5[2];
  }
  else {
    uint64_t v32 = 0;
  }
  v33 = [(NSMutableDictionary *)self->_bundleIdToDomainIdentifiers objectForKeyedSubscript:v32];
  v15 = v33;
  if (v5) {
    uint64_t v34 = v5[4];
  }
  else {
    uint64_t v34 = 0;
  }
  char v18 = [v33 addDomainsFromSet:v34];
  if (v5 && v5[5])
  {
    bundleIdToItemCompletionBlocks = self->_bundleIdToDomainCompletionBlocks;
LABEL_23:
    id v20 = (id)v5[2];
    v21 = [(NSMutableDictionary *)bundleIdToItemCompletionBlocks objectForKeyedSubscript:v20];
    v22 = (void *)MEMORY[0x192FB31A0](v5[5]);
    [v21 addObject:v22];
  }
LABEL_24:

LABEL_48:
  return v18;
}

- (void)enumerateDeletionPredicatesAndCompletionsWithBlock:(id)a3
{
  id v4 = a3;
  bundleIdToItemIdentifiers = self->_bundleIdToItemIdentifiers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93___CDSpotlightCoalescedDeletionOperation_enumerateDeletionPredicatesAndCompletionsWithBlock___block_invoke;
  v11[3] = &unk_1E560F078;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  [(NSMutableDictionary *)bundleIdToItemIdentifiers enumerateKeysAndObjectsUsingBlock:v11];
  bundleIdToDomainIdentifiers = self->_bundleIdToDomainIdentifiers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93___CDSpotlightCoalescedDeletionOperation_enumerateDeletionPredicatesAndCompletionsWithBlock___block_invoke_2;
  v9[3] = &unk_1E560F0A0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(NSMutableDictionary *)bundleIdToDomainIdentifiers enumerateKeysAndObjectsUsingBlock:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_bundleIdToDomainCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_bundleIdToDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleIdToItemCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_bundleIdToItemIdentifiers, 0);
}

@end