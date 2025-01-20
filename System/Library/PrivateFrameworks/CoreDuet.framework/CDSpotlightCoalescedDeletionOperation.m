@interface CDSpotlightCoalescedDeletionOperation
@end

@implementation CDSpotlightCoalescedDeletionOperation

void __93___CDSpotlightCoalescedDeletionOperation_enumerateDeletionPredicatesAndCompletionsWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = [a3 allObjects];
  +[_DKQuery predicateForSpotlightEventsWithItemIdentifiers:bundleID:]((uint64_t)_DKQuery, v6, v5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  v9 = v8;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __93___CDSpotlightCoalescedDeletionOperation_enumerateDeletionPredicatesAndCompletionsWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = [a3 allDomains];
  v7 = [v6 allObjects];
  +[_DKQuery predicateForSpotlightEventsWithDomainIdentifiers:bundleID:]((uint64_t)_DKQuery, v7, v5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v5];

  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  id v10 = v9;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end