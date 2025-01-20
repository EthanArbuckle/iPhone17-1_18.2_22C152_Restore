@interface AXElementGroupingKeyboardExtrasConsolidationPass
- (BOOL)shouldTransformGroup:(id)a3 forGrouper:(id)a4;
- (id)transformGroup:(id)a3 forGrouper:(id)a4;
@end

@implementation AXElementGroupingKeyboardExtrasConsolidationPass

- (BOOL)shouldTransformGroup:(id)a3 forGrouper:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 isKeyboardContainer]) {
    goto LABEL_15;
  }
  v5 = [v4 firstObject];
  if (([v5 isGroup] & 1) == 0)
  {

    goto LABEL_15;
  }
  v6 = [v4 firstObject];
  int v7 = [v6 canBeReplacedByChildren];

  if (!v7) {
    goto LABEL_16;
  }
  if ((unint64_t)[v4 count] < 2)
  {
LABEL_15:
    LOBYTE(v7) = 0;
    goto LABEL_16;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  LOBYTE(v7) = 1;
  v8 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count", 0) - 1);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    int v7 = 0;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v7 |= [*(id *)(*((void *)&v14 + 1) + 8 * i) isGroup];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
    LOBYTE(v7) = v7 ^ 1;
  }

LABEL_16:
  return v7 & 1;
}

- (id)transformGroup:(id)a3 forGrouper:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isKeyboardContainer] & 1) == 0 || (unint64_t)objc_msgSend(v4, "count") <= 1) {
    goto LABEL_21;
  }
  v5 = [v4 firstObject];
  if (([v5 isGroup] & 1) == 0)
  {

    goto LABEL_21;
  }
  v6 = [v4 firstObject];
  char v7 = [v6 canBeReplacedByChildren];

  if ((v7 & 1) == 0)
  {
LABEL_21:
    id v20 = v4;
    goto LABEL_22;
  }
  v8 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = [v4 firstObject];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 addObject:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v14 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count", 0) - 1);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        [v8 addObject:*(void *)(*((void *)&v23 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  uint64_t v19 = [v4 label];
  id v20 = +[AXElementGroup groupWithElements:v8 label:v19];

  objc_msgSend(v20, "setGroupTraits:", objc_msgSend(v4, "groupTraits"));
  objc_msgSend(v20, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v4, "userDefinedScanningBehaviorTraits"));
  v21 = [v4 identifier];
  [v20 setIdentifier:v21];

LABEL_22:
  return v20;
}

@end