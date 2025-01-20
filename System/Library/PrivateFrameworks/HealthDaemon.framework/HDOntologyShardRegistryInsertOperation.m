@interface HDOntologyShardRegistryInsertOperation
@end

@implementation HDOntologyShardRegistryInsertOperation

uint64_t __80___HDOntologyShardRegistryInsertOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = *(id *)(*(void *)(a1 + 32) + 16);
  id v6 = a2;
  v7 = self;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!objc_msgSend(v7, "insertEntry:transaction:error:", *(void *)(*((void *)&v15 + 1) + 8 * v12), v6, a3, (void)v15))
        {
          uint64_t v13 = 0;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1;
LABEL_11:

  return v13;
}

@end