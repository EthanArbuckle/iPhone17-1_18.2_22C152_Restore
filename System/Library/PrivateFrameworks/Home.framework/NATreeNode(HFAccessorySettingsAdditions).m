@interface NATreeNode(HFAccessorySettingsAdditions)
- (id)hf_nodeWithKeyPath:()HFAccessorySettingsAdditions;
- (id)hf_sortedAccessorySettingsChildren;
@end

@implementation NATreeNode(HFAccessorySettingsAdditions)

- (id)hf_sortedAccessorySettingsChildren
{
  v1 = [a1 childNodes];
  v2 = [v1 allObjects];
  v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_284];

  return v3;
}

- (id)hf_nodeWithKeyPath:()HFAccessorySettingsAdditions
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"HFAccessorySettingsEntity.m", 424, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];
  }
  v6 = [a1 representedObject];
  v7 = [v6 keyPath];
  int v8 = [v7 isEqualToString:v5];

  if (v8)
  {
    id v9 = a1;
  }
  else
  {
    v25 = v6;
    v10 = [v5 componentsSeparatedByString:@"."];
    id v9 = a1;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v14 = 0;
      uint64_t v15 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v11);
          }
          if (!v9)
          {

            goto LABEL_20;
          }
          v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v17 isEqualToString:@"root"])
          {
            v18 = @"root";
            v19 = v14;
            v14 = v18;
          }
          else
          {
            v20 = [(__CFString *)v14 stringByAppendingFormat:@".%@", v17];

            v21 = [v9 childNodes];
            v26[0] = MEMORY[0x263EF8330];
            v26[1] = 3221225472;
            v26[2] = __63__NATreeNode_HFAccessorySettingsAdditions__hf_nodeWithKeyPath___block_invoke;
            v26[3] = &unk_26409BAE0;
            v14 = v20;
            v27 = v14;
            uint64_t v22 = objc_msgSend(v21, "na_firstObjectPassingTest:", v26);

            v19 = v27;
            id v9 = (id)v22;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      v14 = 0;
    }

    id v9 = v9;
LABEL_20:

    v6 = v25;
  }

  return v9;
}

@end