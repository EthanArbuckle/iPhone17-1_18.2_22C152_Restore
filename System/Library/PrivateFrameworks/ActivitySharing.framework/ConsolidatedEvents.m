@interface ConsolidatedEvents
@end

@implementation ConsolidatedEvents

void ___ConsolidatedEvents_block_invoke(uint64_t a1, void *a2, unsigned __int16 a3)
{
  id v5 = a2;
  v6 = [ASRelationshipEvent alloc];
  uint64_t v7 = [v5 type];
  v8 = [v5 timestamp];

  v12 = [(ASRelationshipEvent *)v6 initWithType:v7 anchor:a3 timestamp:v8];
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) arrayByAddingObject:v12];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

@end