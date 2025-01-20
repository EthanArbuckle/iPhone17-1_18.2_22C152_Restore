@interface SFNavigationBarAccessoryButtonArrangement
- (id)description;
- (uint64_t)containsButtonType:(uint64_t)result;
- (void)enumerateButtonTypesFromEdge:(uint64_t)a3 withLayoutDirection:(void *)a4 usingBlock:;
- (void)initWithLeadingButtonTypes:(void *)a3 trailingButtonTypes:;
@end

@implementation SFNavigationBarAccessoryButtonArrangement

- (void)initWithLeadingButtonTypes:(void *)a3 trailingButtonTypes:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)SFNavigationBarAccessoryButtonArrangement;
    a1 = objc_msgSendSuper2(&v15, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      v8 = (void *)a1[3];
      a1[3] = v7;

      uint64_t v9 = [v6 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;

      v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
      [v11 addObjectsFromArray:v5];
      [v11 addObjectsFromArray:v6];
      uint64_t v12 = [v11 copy];
      v13 = (void *)a1[1];
      a1[1] = v12;

      a1 = a1;
    }
  }

  return a1;
}

- (uint64_t)containsButtonType:(uint64_t)result
{
  if (result)
  {
    v2 = *(void **)(result + 8);
    v3 = [NSNumber numberWithInteger:a2];
    uint64_t v4 = [v2 containsObject:v3];

    return v4;
  }
  return result;
}

- (void)enumerateButtonTypesFromEdge:(uint64_t)a3 withLayoutDirection:(void *)a4 usingBlock:
{
  id v7 = a4;
  v8 = v7;
  if (a1)
  {
    BOOL v9 = a2 == 2 && a3 == 0;
    int v10 = v9;
    if (a2 == 8 && a3 == 1) {
      int v10 = 1;
    }
    BOOL v9 = v10 == 0;
    uint64_t v12 = 16;
    if (!v9) {
      uint64_t v12 = 24;
    }
    v13 = *(void **)(a1 + v12);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __105__SFNavigationBarAccessoryButtonArrangement_enumerateButtonTypesFromEdge_withLayoutDirection_usingBlock___block_invoke;
    v15[3] = &unk_1E5C73690;
    id v16 = v7;
    id v14 = v13;
    [v14 enumerateObjectsUsingBlock:v15];
  }
}

uint64_t __105__SFNavigationBarAccessoryButtonArrangement_enumerateButtonTypesFromEdge_withLayoutDirection_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [a2 integerValue];
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v7(v5, v6, a4);
}

- (id)description
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = self->_leadingButtonTypes;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) integerValue];
        int v10 = @"stop";
        if (v9 <= 3) {
          int v10 = off_1E5C736D0[v9];
        }
        [v3 appendFormat:@"[%@]", v10];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"..."];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = [(NSArray *)self->_trailingButtonTypes reverseObjectEnumerator];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        unint64_t v16 = [*(id *)(*((void *)&v19 + 1) + 8 * j) integerValue];
        v17 = @"stop";
        if (v16 <= 3) {
          v17 = off_1E5C736D0[v16];
        }
        [v3 appendFormat:@"[%@]", v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingButtonTypes, 0);
  objc_storeStrong((id *)&self->_trailingButtonTypes, 0);

  objc_storeStrong((id *)&self->_allButtonTypes, 0);
}

@end