@interface HUUserAccessItem
@end

@implementation HUUserAccessItem

id __49___HUUserAccessItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F692F0]) initWithResults:v3];
  v5 = v4;
  if (*(void *)(a1 + 32))
  {
    v6 = [v4 results];
    v7 = (void *)[v6 mutableCopy];

    [v7 addEntriesFromDictionary:*(void *)(a1 + 32)];
    [v5 setResults:v7];
  }
  uint64_t v8 = *MEMORY[0x1E4F68908];
  v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68908]];
  v10 = (void *)[v9 mutableCopy];
  v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  v13 = v12;

  v14 = [*(id *)(a1 + 40) user];
  [v13 addObject:v14];

  [v5 setObject:v13 forKeyedSubscript:v8];
  uint64_t v15 = *MEMORY[0x1E4F68900];
  v16 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68900]];
  v17 = (void *)[v16 mutableCopy];
  v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  v20 = v19;

  [v20 addObject:objc_opt_class()];
  [v5 setObject:v20 forKeyedSubscript:v15];
  v21 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v21;
}

@end