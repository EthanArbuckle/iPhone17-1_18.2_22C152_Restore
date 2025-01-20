@interface AXMLTabButtonGroup
- (id)textLabel;
- (id)topmost;
@end

@implementation AXMLTabButtonGroup

- (id)topmost
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(AXMMLElementGroup *)self subfeatures];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v5)
        {
          [*(id *)(*((void *)&v12 + 1) + 8 * i) frame];
          double MinY = CGRectGetMinY(v19);
          [v5 frame];
          if (MinY >= CGRectGetMinY(v20)) {
            continue;
          }
        }
        id v10 = v8;

        v5 = v10;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)textLabel
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [(AXMMLElementGroup *)self subfeatures];
  uint64_t v44 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v44)
  {
    v41 = &stru_1F0E72D10;
    v42 = &stru_1F0E72D10;
    goto LABEL_28;
  }
  uint64_t v2 = *(void *)v46;
  unint64_t v3 = 0x1E4F1C000uLL;
  v41 = &stru_1F0E72D10;
  v42 = &stru_1F0E72D10;
  uint64_t v40 = *(void *)v46;
  do
  {
    for (uint64_t i = 0; i != v44; ++i)
    {
      if (*(void *)v46 != v2) {
        objc_enumerationMutation(obj);
      }
      v5 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      uint64_t v6 = [v5 feature];
      v7 = [v6 value];
      v8 = [*(id *)(v3 + 2712) null];
      if ([v7 isEqual:v8]) {
        goto LABEL_14;
      }
      v9 = [v5 feature];
      id v10 = [v9 value];
      if (![v10 length])
      {

        goto LABEL_14;
      }
      v11 = [v5 feature];
      if ([v11 uiClass] == 11)
      {

LABEL_13:
        uint64_t v6 = [v5 feature];
        v7 = [v6 value];
        v8 = v42;
        __AXMStringForVariables(v42, v15, v16, v17, v18, v19, v20, v21, v7);
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      long long v12 = [v5 feature];
      uint64_t v13 = [v12 uiClass];

      uint64_t v2 = v40;
      BOOL v14 = v13 == 17;
      unint64_t v3 = 0x1E4F1C000uLL;
      if (v14) {
        goto LABEL_13;
      }
LABEL_15:
      v22 = [v5 feature];
      v23 = [v22 value];
      v24 = [*(id *)(v3 + 2712) null];
      if ([v23 isEqual:v24]) {
        goto LABEL_23;
      }
      v25 = [v5 feature];
      v26 = [v25 value];
      if (![v26 length])
      {

        goto LABEL_23;
      }
      v27 = [v5 feature];
      if ([v27 uiClass] == 5)
      {

LABEL_22:
        v22 = [v5 feature];
        v23 = [v22 value];
        v24 = v41;
        __AXMStringForVariables(v41, v30, v31, v32, v33, v34, v35, v36, v23);
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:

        continue;
      }
      v28 = [v5 feature];
      uint64_t v29 = [v28 uiClass];

      uint64_t v2 = v40;
      BOOL v14 = v29 == 16;
      unint64_t v3 = 0x1E4F1C000;
      if (v14) {
        goto LABEL_22;
      }
    }
    uint64_t v44 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  }
  while (v44);
LABEL_28:

  if ([(__CFString *)v42 length]) {
    v37 = v42;
  }
  else {
    v37 = v41;
  }
  v38 = v37;

  return v38;
}

@end