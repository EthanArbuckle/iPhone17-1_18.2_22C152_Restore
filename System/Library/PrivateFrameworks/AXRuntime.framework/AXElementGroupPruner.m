@interface AXElementGroupPruner
- (id)_prunedGroupable:(id)a3;
- (id)pruneRootGroup:(id)a3;
@end

@implementation AXElementGroupPruner

- (id)_prunedGroupable:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 isGroup];
  id v6 = v4;
  v7 = v6;
  v8 = v6;
  if (v5)
  {
    if ([v6 count] == 1)
    {
      v9 = [v7 firstChild];
      if ([v9 isGroup])
      {
        uint64_t v10 = [v9 groupTraits];
        uint64_t v11 = [v7 groupTraits];
        uint64_t v12 = [v9 userDefinedScanningBehaviorTraits];
        uint64_t v13 = [v7 userDefinedScanningBehaviorTraits];
        v8 = [(AXElementGroupPruner *)self _prunedGroupable:v9];
        if ([v8 isGroup])
        {
          uint64_t v14 = v11 | v10;
          v15 = [v9 label];
          [v8 setLabel:v15];

          v16 = [v9 identifier];
          [v8 setIdentifier:v16];

          [v8 setGroupTraits:v14];
          [v8 setUserDefinedScanningBehaviorTraits:v13 | v12];
        }
      }
      else
      {
        v8 = [(AXElementGroupPruner *)self _prunedGroupable:v9];
      }
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v17 = v7;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v27 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = -[AXElementGroupPruner _prunedGroupable:](self, "_prunedGroupable:", *(void *)(*((void *)&v26 + 1) + 8 * i), (void)v26);
            if (v22) {
              [v9 addObject:v22];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v19);
      }

      v23 = [v17 label];
      v8 = +[AXElementGroup groupWithElements:v9 label:v23];

      objc_msgSend(v8, "setGroupTraits:", objc_msgSend(v17, "groupTraits"));
      objc_msgSend(v8, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v17, "userDefinedScanningBehaviorTraits"));
      v24 = [v17 identifier];
      [v8 setIdentifier:v24];
    }
  }

  return v8;
}

- (id)pruneRootGroup:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 elementCommunity];
  id v6 = [(AXElementGroupPruner *)self _prunedGroupable:v4];
  if ([v6 isGroup])
  {
    id v7 = v6;
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    v10[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = +[AXElementGroup groupWithElements:v8];
  }
  id v4 = v7;
LABEL_6:
  [v4 setElementCommunity:v5];

  return v4;
}

@end