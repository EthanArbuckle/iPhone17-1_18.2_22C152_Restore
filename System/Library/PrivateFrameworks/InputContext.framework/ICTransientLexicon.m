@interface ICTransientLexicon
@end

@implementation ICTransientLexicon

void __42___ICTransientLexicon_addEntity_forEntry___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:");
  if (!v5)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:*(int *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v5 forKey:v7];
  }
  v6 = [NSNumber numberWithUnsignedInt:a3];
  [v5 addObject:v6];
}

void __42___ICTransientLexicon_sortKeyEquivalents___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  -[_ICTransientLexicon _mutableNamedEntitiesForLXEntry:](*(void **)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v3 allObjects];
  [v1 addObjectsFromArray:v2];
}

void __49___ICTransientLexicon_TestingSupport__getEntries__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)LXEntryCopyString();
  [v1 addObject:v2];
}

@end