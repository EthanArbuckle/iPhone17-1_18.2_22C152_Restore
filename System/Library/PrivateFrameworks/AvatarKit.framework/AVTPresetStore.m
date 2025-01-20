@interface AVTPresetStore
- (AVTPresetStore)init;
- (BOOL)hasUnresolvedDependenciesForCategory:(int64_t)a3;
- (char)setPreset:(uint64_t)a3 forCategory:;
- (id)presetForCategory:(id *)a1;
- (id)resolvedPresetForCategory:(id *)a1;
- (unint64_t)solveDependencies;
- (void)registerDependenciesForPreset:(id)a3 previouslyRegisteredPresets:(id)a4;
- (void)solveDependencies;
- (void)solveDependenciesForCategory:(int64_t)a3;
@end

@implementation AVTPresetStore

- (AVTPresetStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)AVTPresetStore;
  v2 = [(AVTPresetStore *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = 0;
    unresolvedDependencies = v2->_unresolvedDependencies;
    do
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v7 = unresolvedDependencies[v4];
      unresolvedDependencies[v4] = v6;

      ++v4;
    }
    while (v4 != 40);
  }
  return v3;
}

- (id)presetForCategory:(id *)a1
{
  if (a1)
  {
    a1 = (id *)a1[a2 + 1];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (char)setPreset:(uint64_t)a3 forCategory:
{
  id v6 = a2;
  if (a1)
  {
    v7 = &a1[8 * a3];
    id v9 = (id)*((void *)v7 + 1);
    v8 = (id *)(v7 + 8);
    if (v9 == v6)
    {
      a1 = 0;
    }
    else
    {
      objc_storeStrong(v8, a2);
      a1 = (char *)[a1 solveDependencies];
    }
  }

  return a1;
}

- (id)resolvedPresetForCategory:(id *)a1
{
  if (a1)
  {
    a1 = (id *)a1[a2 + 41];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (BOOL)hasUnresolvedDependenciesForCategory:(int64_t)a3
{
  return [(NSMutableArray *)self->_unresolvedDependencies[a3] count] != 0;
}

- (void)registerDependenciesForPreset:(id)a3 previouslyRegisteredPresets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 containsObject:v6] & 1) == 0)
  {
    [v7 addObject:v6];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __76__AVTPresetStore_registerDependenciesForPreset_previouslyRegisteredPresets___block_invoke;
    v13[3] = &unk_26401F1C0;
    v13[4] = self;
    id v8 = v6;
    id v14 = v8;
    id v9 = v7;
    id v15 = v9;
    [v8 enumeratePresetDependencies:v13];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __76__AVTPresetStore_registerDependenciesForPreset_previouslyRegisteredPresets___block_invoke_2;
    v10[3] = &unk_26401F1E8;
    v10[4] = self;
    id v11 = v8;
    id v12 = v9;
    [v11 enumeratePresetSpecificPresetDependencies:v10];
  }
}

void __76__AVTPresetStore_registerDependenciesForPreset_previouslyRegisteredPresets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *(id *)(*(void *)(a1 + 32) + 8 * a2 + 648);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (AVTPresetStoreDependency *)v6;
  uint64_t v8 = [(AVTPresetStoreDependency *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "overridePreset", (void)v15);
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v5)
        {
          [v12 addConditionOnPreset:*(void *)(a1 + 40)];
          id v14 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [(AVTPresetStoreDependency *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = [[AVTPresetStoreDependency alloc] initWithOverridePreset:v5 conditionedOnPreset:*(void *)(a1 + 40)];
  [(AVTPresetStoreDependency *)v7 addObject:v14];
  ++*(void *)(*(void *)(a1 + 32) + 968);
  [*(id *)(a1 + 32) registerDependenciesForPreset:v5 previouslyRegisteredPresets:*(void *)(a1 + 48)];
LABEL_11:
}

void __76__AVTPresetStore_registerDependenciesForPreset_previouslyRegisteredPresets___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = *(id *)(*(void *)(a1 + 32) + 8 * a2 + 648);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = (AVTPresetStoreDependency *)v9;
  uint64_t v11 = [(AVTPresetStoreDependency *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "overridePreset", (void)v18);
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16 == v8)
        {
          [v15 addConditionOnPreset:*(void *)(a1 + 40) forSpecificPresetIdentifier:v7];
          long long v17 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [(AVTPresetStoreDependency *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v17 = [[AVTPresetStoreDependency alloc] initWithOverridePreset:v8 conditionedOnPreset:*(void *)(a1 + 40) forSpecificPresetIdentifier:v7];
  [(AVTPresetStoreDependency *)v10 addObject:v17];
  ++*(void *)(*(void *)(a1 + 32) + 968);
  [*(id *)(a1 + 32) registerDependenciesForPreset:v8 previouslyRegisteredPresets:*(void *)(a1 + 48)];
LABEL_11:
}

- (unint64_t)solveDependencies
{
  uint64_t v3 = 0;
  uint64_t v20 = *MEMORY[0x263EF8340];
  memset(v19, 0, sizeof(v19));
  resolvedPresets = self->_resolvedPresets;
  self->_unresolvedDependencyCount = 0;
  do
  {
    objc_storeStrong((id *)((char *)v19 + v3 * 8), self->_resolvedPresets[v3]);
    objc_storeStrong((id *)&self->_resolvedPresets[v3], self->_presets[v3]);
    [(NSMutableArray *)self->_unresolvedDependencies[v3++] removeAllObjects];
  }
  while (v3 != 40);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  for (uint64_t i = 8; i != 328; i += 8)
  {
    uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + i);
    if (v7) {
      [(AVTPresetStore *)self registerDependenciesForPreset:v7 previouslyRegisteredPresets:v5];
    }
  }
  uint64_t v8 = 0;
  while (self->_unresolvedDependencyCount)
  {
    for (uint64_t j = 0; j != 40; ++j)
      [(AVTPresetStore *)self solveDependenciesForCategory:j];
    if (++v8 == 5)
    {
      uint64_t v10 = avt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AVTPresetStore solveDependencies](v10);
      }

      break;
    }
  }
  unint64_t v11 = 0;
  int64x2_t v12 = (int64x2_t)xmmword_20B88FD90;
  int8x16_t v13 = 0uLL;
  uint64x2_t v14 = (uint64x2_t)vdupq_n_s64(1uLL);
  int64x2_t v15 = vdupq_n_s64(2uLL);
  do
  {
    int8x16_t v13 = vorrq_s8(vbicq_s8((int8x16_t)vshlq_u64(v14, (uint64x2_t)v12), (int8x16_t)vceqq_s64((int64x2_t)v19[v11 / 2], *(int64x2_t *)&resolvedPresets[v11])), v13);
    int64x2_t v12 = vaddq_s64(v12, v15);
    v11 += 2;
  }
  while (v11 != 40);
  int8x16_t v18 = v13;

  for (uint64_t k = 312; k != -8; k -= 8)
  return (unint64_t)vorr_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL));
}

- (void)solveDependenciesForCategory:(int64_t)a3
{
  int64_t v3 = a3;
  uint64_t v4 = self;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v5 = self->_unresolvedDependencies[a3];
  if (![(NSMutableArray *)v5 count]) {
    goto LABEL_69;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v6 = v5;
  v49 = v5;
  uint64_t v54 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v66 objects:v72 count:16];
  uint64_t v7 = 0;
  if (!v54)
  {
    v47 = 0;
    v48 = 0;
    goto LABEL_57;
  }
  v47 = 0;
  v48 = 0;
  v52 = v4;
  uint64_t v53 = *(void *)v67;
  presets = v4->_presets;
  resolvedPresets = v4->_resolvedPresets;
  int64_t v50 = v3;
  v51 = v6;
  do
  {
    for (uint64_t i = 0; i != v54; ++i)
    {
      if (*(void *)v67 != v53) {
        objc_enumerationMutation(v6);
      }
      *(void *)buf = *(void *)(*((void *)&v66 + 1) + 8 * i);
      objc_msgSend(v7, "removeAllObjects", v47);
      id v9 = [*(id *)buf conditions];
      uint64_t v60 = [v9 count];
      if (!v60)
      {
        uint64_t v34 = [v7 count];
        goto LABEL_46;
      }
      uint64_t v55 = i;
      int v10 = 0;
      uint64_t v11 = 0;
      v59 = v9;
      do
      {
        id v65 = [v9 objectAtIndexedSubscript:v11];
        int64x2_t v12 = [v65 presetOfOtherCategory];
        uint64_t v13 = [v12 category];

        BOOL v14 = [(AVTPresetStore *)v4 hasUnresolvedDependenciesForCategory:v13];
        if (v14)
        {
LABEL_10:
          v10 |= !v14;
          goto LABEL_35;
        }
        int64x2_t v15 = [v65 presetOfOtherCategory];
        id v16 = resolvedPresets[v13];

        if (v15 == v16)
        {
          long long v19 = [v65 specificPresetIdentifier];

          id v9 = v59;
          if (!v19) {
            goto LABEL_10;
          }
          uint64_t v20 = [v65 specificPresetIdentifier];
          long long v21 = [(AVTPreset *)presets[v3] identifier];
          char v22 = [v20 isEqualToString:v21];

          uint64_t v23 = [(NSMutableArray *)v6 count];
          BOOL v17 = v23 != 1;
          if (v23 == 1) {
            char v18 = v22;
          }
          else {
            char v18 = 1;
          }
          if (v23 != 1 && (v22 & 1) == 0)
          {
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            v24 = v6;
            uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v61 objects:v71 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              v56 = v7;
              uint64_t v27 = *(void *)v62;
              while (2)
              {
                for (uint64_t j = 0; j != v26; ++j)
                {
                  if (*(void *)v62 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  v29 = *(void **)(*((void *)&v61 + 1) + 8 * j);
                  if (v29 != *(void **)buf)
                  {
                    v30 = [v65 specificPresetIdentifier];
                    v31 = [v29 overridePreset];
                    v32 = [v31 identifier];
                    char v33 = [v30 isEqualToString:v32];

                    if (v33)
                    {
                      BOOL v17 = 1;
                      goto LABEL_38;
                    }
                  }
                }
                uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v61 objects:v71 count:16];
                if (v26) {
                  continue;
                }
                break;
              }
              BOOL v17 = 0;
LABEL_38:
              id v6 = v51;
              uint64_t v4 = v52;
              int64_t v3 = v50;
              uint64_t v7 = v56;
            }
            else
            {
              BOOL v17 = 0;
            }

            char v18 = v17;
          }
        }
        else
        {
          BOOL v17 = 0;
          char v18 = 0;
        }
        if (v17 || (v18 & 1) != 0)
        {
          v10 |= !v17;
          id v9 = v59;
        }
        else
        {
          id v9 = v59;
          if (v7) {
            [v7 addObject:v65];
          }
          else {
            uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithObjects:&v65 count:1];
          }
        }
LABEL_35:

        ++v11;
      }
      while (v11 != v60);
      uint64_t v34 = [v7 count];
      if ((v10 & 1) == 0)
      {
        id v5 = v49;
        uint64_t i = v55;
LABEL_46:
        if (v34 == v60)
        {
          if (v48) {
            [v48 addObject:*(void *)buf];
          }
          else {
            v48 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithObjects:buf count:1];
          }
        }
        else
        {
          [v9 removeObjectsInArray:v7];
        }
        goto LABEL_53;
      }
      if (v47) {
        [v47 addObject:*(void *)buf];
      }
      else {
        v47 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithObjects:buf count:1];
      }
      id v5 = v49;
      uint64_t i = v55;
LABEL_53:
    }
    uint64_t v54 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v66 objects:v72 count:16];
  }
  while (v54);
LABEL_57:

  v35 = v47;
  if ([v47 count])
  {
    v36 = [v47 firstObject];
    v37 = [v36 overridePreset];

    if ((unint64_t)[v47 count] >= 2)
    {
      unint64_t v38 = 1;
      do
      {
        v39 = objc_msgSend(v35, "objectAtIndexedSubscript:", v38, v47);
        v40 = [v39 overridePreset];

        if (v37 != v40)
        {
          v41 = v7;
          v42 = avt_default_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            [(AVTPresetStore *)buf solveDependenciesForCategory:v42];
          }

          uint64_t v7 = v41;
        }

        ++v38;
        v35 = v47;
      }
      while (v38 < [v47 count]);
    }
    v43 = &v4->super.isa + v3;
    Class v44 = v43[41];
    v43[41] = v37;
    v45 = v37;

    v4->_unresolvedDependencyCount -= [(NSMutableArray *)v6 count];
    [(NSMutableArray *)v6 removeAllObjects];

    v46 = v48;
    id v5 = v49;
  }
  else
  {
    v46 = v48;
    if ([v48 count])
    {
      v4->_unresolvedDependencyCount -= [v48 count];
      [(NSMutableArray *)v6 removeObjectsInArray:v48];
    }
  }

LABEL_69:
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  uint64_t v4 = &self->_unresolvedDependencies[39];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -40);
  for (uint64_t i = 640; i != 320; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

- (void)solveDependencies
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Failed to resolve dependencies in a fair number of steps!", v1, 2u);
}

- (void)solveDependenciesForCategory:(os_log_t)log .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "overridePreset == otherOverridePreset";
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. Two resolved dependencies disagree on the resolved preset!", buf, 0xCu);
}

@end