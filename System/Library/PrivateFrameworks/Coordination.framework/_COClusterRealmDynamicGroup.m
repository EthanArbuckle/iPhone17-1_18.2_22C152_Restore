@interface _COClusterRealmDynamicGroup
+ (id)realmForCurrent;
- (id)_identifierForGroupResult:(id)a3;
@end

@implementation _COClusterRealmDynamicGroup

+ (id)realmForCurrent
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F54720] predicateForCurrentDevice];
  v8[0] = v2;
  v3 = [MEMORY[0x263F54710] predicateForCurrentDevice];
  v8[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  v5 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v4];
  id v6 = [[_COClusterRealmDynamicGroup alloc] _initWithPredicate:v5];

  return v6;
}

- (id)_identifierForGroupResult:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v4)
  {
    id v6 = 0;
    v7 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  v7 = 0;
  uint64_t v8 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v3);
      }
      v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = v6;
        id v6 = v10;
        v12 = v7;
      }
      else
      {
        objc_opt_class();
        v11 = v7;
        v12 = v10;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
      }
      id v13 = v10;

      v7 = v12;
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v5);
LABEL_14:
  _os_feature_enabled_impl();
  if (v6)
  {
    v14 = [v6 HomeKitMediaSystemIdentifier];
    v15 = [v14 UUIDString];

    v16 = @"pair";
    if (v15) {
      goto LABEL_20;
    }
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  if (v7)
  {
    v17 = [v7 HomeKitAccesoryIdentifier];
    v15 = [v17 UUIDString];

    v16 = @"solo";
  }
LABEL_20:
  v18 = (void *)[(__CFString *)v16 length];
  if (v18)
  {
    [v15 length];
    v18 = [NSString stringWithFormat:@"%@-%@", v16, v15];
  }
  id v19 = v18;

  return v19;
}

@end