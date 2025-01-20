@interface BKGraphDescription
- (id)_themeForItemIndex:(uint64_t)a1;
- (uint64_t)appendSubnodesWithCount:(void *)a3 block:;
- (void)appendNode:(uint64_t)a3;
- (void)initWithTopLevelCount:(void *)a3 target:;
@end

@implementation BKGraphDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_stackIndexesHighlighted, 0);
  objc_storeStrong((id *)&self->_itemRemainingStack, 0);

  objc_storeStrong((id *)&self->_itemCountStack, 0);
}

- (void)appendNode:(uint64_t)a3
{
  if (a1)
  {
    id v10 = a1[1];
    id v11 = a2;
    v12 = [v10 lastObject];
    uint64_t v13 = [v12 integerValue];

    v14 = [a1[2] lastObject];
    uint64_t v15 = [v14 integerValue];

    [a1[2] removeLastObject];
    id v16 = a1[2];
    v17 = [NSNumber numberWithInteger:v15 - 1];
    [v16 addObject:v17];

    uint64_t v18 = [a1[1] count];
    v19 = @"middle";
    if (v15 == 1) {
      v20 = @"bottom";
    }
    else {
      v20 = @"middle";
    }
    if (v15 == 1) {
      v19 = @"bottom";
    }
    if (v15 == v13) {
      v19 = @"top";
    }
    if (v13 == 1) {
      v19 = @"single";
    }
    if (v18 != 1) {
      v19 = v20;
    }
    v21 = v19;
    id v22 = v11;
    v23 = -[BKGraphDescription _themeForItemIndex:]((uint64_t)a1, [a1[1] count] - 1);
    v34 = v21;
    uint64_t v33 = [v23 objectForKey:v21];
    id v24 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v25 = [a1[2] count] - 1;
    if (v25 < 1)
    {
      v27 = v23;
    }
    else
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        v27 = -[BKGraphDescription _themeForItemIndex:]((uint64_t)a1, i);

        v28 = [a1[2] objectAtIndex:i];
        uint64_t v29 = [v28 integerValue];

        if (v29) {
          v30 = @"dropline";
        }
        else {
          v30 = @"indent";
        }
        v31 = objc_msgSend(v27, "objectForKey:", v30, v33);
        [v24 appendString:v31];

        v23 = v27;
      }
    }
    v32 = (void *)v33;
    objc_msgSend(v24, "appendString:", v33, v33);
    [a1[4] writePrefix:v24 label:v22 args:&a9];
  }
}

- (uint64_t)appendSubnodesWithCount:(void *)a3 block:
{
  if (result)
  {
    uint64_t v4 = result;
    v5 = *(void **)(result + 8);
    v6 = NSNumber;
    v7 = a3;
    v8 = [v6 numberWithInteger:a2];
    [v5 addObject:v8];

    v9 = *(void **)(v4 + 16);
    id v10 = [NSNumber numberWithInteger:a2];
    [v9 addObject:v10];

    v7[2](v7);
    [*(id *)(v4 + 16) removeLastObject];
    id v11 = *(void **)(v4 + 8);
    return [v11 removeLastObject];
  }
  return result;
}

- (id)_themeForItemIndex:(uint64_t)a1
{
  if ([*(id *)(a1 + 24) containsIndex:a2])
  {
    if (_BKHighlightedTheme_onceToken != -1) {
      dispatch_once(&_BKHighlightedTheme_onceToken, &__block_literal_global_1786);
    }
    v2 = &_BKHighlightedTheme_dictionary;
  }
  else
  {
    if (_BKNormalTheme_onceToken != -1) {
      dispatch_once(&_BKNormalTheme_onceToken, &__block_literal_global_174);
    }
    v2 = &_BKNormalTheme_dictionary;
  }
  v3 = (void *)*v2;

  return v3;
}

- (void)initWithTopLevelCount:(void *)a3 target:
{
  id v6 = a3;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)BKGraphDescription;
    id v7 = objc_msgSendSuper2(&v19, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 4, a3);
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v9 = (void *)a1[1];
      a1[1] = v8;

      id v10 = (void *)a1[1];
      id v11 = [NSNumber numberWithInteger:a2];
      [v10 addObject:v11];

      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v13 = (void *)a1[2];
      a1[2] = v12;

      v14 = (void *)a1[2];
      uint64_t v15 = [NSNumber numberWithInteger:a2];
      [v14 addObject:v15];

      id v16 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v17 = (void *)a1[3];
      a1[3] = v16;
    }
  }

  return a1;
}

@end