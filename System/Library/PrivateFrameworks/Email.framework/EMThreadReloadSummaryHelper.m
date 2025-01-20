@interface EMThreadReloadSummaryHelper
- (id)summariesToReloadForChanges:(id)a3 mailboxScope:(id)a4;
@end

@implementation EMThreadReloadSummaryHelper

- (id)summariesToReloadForChanges:(id)a3 mailboxScope:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__EMThreadReloadSummaryHelper_summariesToReloadForChanges_mailboxScope___block_invoke;
  v13[3] = &unk_1E63E3DA0;
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v13];
  v10 = v15;
  id v11 = v9;

  return v11;
}

void __72__EMThreadReloadSummaryHelper_summariesToReloadForChanges_mailboxScope___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  v4 = [v9 displayMessageItemID];
  if (v4)
  {
    id v5 = [v9 summary];
    id v6 = [MEMORY[0x1E4F1CA98] null];

    if (v5 == v6)
    {
      v7 = [v9 displayMessageItemID];
      id v8 = [[EMMessageObjectID alloc] initWithCollectionItemID:v7 mailboxScope:*(void *)(a1 + 32)];
      if (v8) {
        [*(id *)(a1 + 40) addObject:v8];
      }
    }
  }
}

@end