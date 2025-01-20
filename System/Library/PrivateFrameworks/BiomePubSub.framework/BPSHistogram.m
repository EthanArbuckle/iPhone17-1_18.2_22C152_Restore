@interface BPSHistogram
- (BOOL)_correctKeyType:(id)a3;
- (BPSHistogram)init;
- (id)allKeysAtLevel:(unint64_t)a3;
- (id)scoreForKey:(id)a3;
- (void)_enumerateWithBlock:(id)a3 node:(id)a4 currentKey:(id)a5 stop:(BOOL *)a6;
- (void)_setKeyTypeFromKey:(id)a3;
- (void)addScore:(id)a3 forKey:(id)a4;
- (void)enumerateKeysAndScoresUsingBlock:(id)a3;
- (void)removeAllScores;
- (void)removeScoreForKey:(id)a3;
@end

@implementation BPSHistogram

- (BPSHistogram)init
{
  v7.receiver = self;
  v7.super_class = (Class)BPSHistogram;
  v2 = [(BPSHistogram *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = (NSMutableDictionary *)v3;

    keyType = v2->_keyType;
    v2->_keyType = 0;
  }
  return v2;
}

- (void)_setKeyTypeFromKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(BPSHistogram *)self removeAllScores];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", objc_opt_class(), v13);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
  keyType = self->_keyType;
  self->_keyType = v11;
}

- (BOOL)_correctKeyType:(id)a3
{
  id v4 = a3;
  keyType = self->_keyType;
  if (keyType && (uint64_t v6 = -[NSArray count](keyType, "count"), v6 == [v4 count]))
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__BPSHistogram__correctKeyType___block_invoke;
    v9[3] = &unk_1E5E76320;
    v9[4] = self;
    v9[5] = &v10;
    [v4 enumerateObjectsUsingBlock:v9];
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __32__BPSHistogram__correctKeyType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_opt_class(), "isEqual:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectAtIndexedSubscript:", a3));
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (id)scoreForKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4 copyItems:1];
  id v6 = &unk_1F040EE20;
  if (self->_keyType)
  {
    if ([(BPSHistogram *)self _correctKeyType:v5])
    {
      BOOL v7 = self->_backingDictionary;
      if ([v5 count] == 1)
      {
        uint64_t v8 = v7;
LABEL_11:
        uint64_t v12 = [v5 lastObject];
        uint64_t v13 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v12];
        long long v14 = (void *)v13;
        if (v13) {
          long long v15 = (void *)v13;
        }
        else {
          long long v15 = &unk_1F040EE20;
        }
        id v6 = v15;
      }
      else
      {
        unint64_t v10 = 0;
        while (1)
        {
          v11 = [v5 objectAtIndexedSubscript:v10];
          uint64_t v8 = [(NSMutableDictionary *)v7 objectForKeyedSubscript:v11];

          if (!v8) {
            break;
          }
          ++v10;
          BOOL v7 = v8;
          if (v10 >= [v5 count] - 1) {
            goto LABEL_11;
          }
        }
        id v6 = &unk_1F040EE20;
      }
    }
    else
    {
      uint64_t v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BPSHistogram scoreForKey:]();
      }

      id v6 = &unk_1F040EE20;
    }
  }

  return v6;
}

- (void)addScore:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keyType = self->_keyType;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7 copyItems:1];
  if (!keyType) {
    [(BPSHistogram *)self _setKeyTypeFromKey:v9];
  }
  if ([(BPSHistogram *)self _correctKeyType:v9])
  {
    unint64_t v10 = self->_backingDictionary;
    if ([v9 count] == 1)
    {
      p_super = &v10->super.super;
    }
    else
    {
      unint64_t v12 = 0;
      do
      {
        uint64_t v13 = [v9 objectAtIndexedSubscript:v12];
        long long v14 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v13];

        if (!v14)
        {
          long long v15 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v16 = [v9 objectAtIndexedSubscript:v12];
          [(NSMutableDictionary *)v10 setObject:v15 forKeyedSubscript:v16];
        }
        v17 = [v9 objectAtIndexedSubscript:v12];
        p_super = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v17];

        ++v12;
        unint64_t v10 = (NSMutableDictionary *)p_super;
      }
      while (v12 < [v9 count] - 1);
    }
    uint64_t v18 = [v9 lastObject];
    v19 = [p_super objectForKeyedSubscript:v18];
    [v19 floatValue];
    float v21 = v20;

    [v6 floatValue];
    *(float *)&double v22 = v21 + *(float *)&v22;
    if (*(float *)&v22 < 0.0) {
      *(float *)&double v22 = 0.0;
    }
    v23 = [NSNumber numberWithFloat:v22];
    v24 = [v9 lastObject];
    [p_super setObject:v23 forKeyedSubscript:v24];
  }
  else
  {
    p_super = __biome_log_for_category();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
      -[BPSHistogram scoreForKey:]();
    }
  }
}

- (void)removeScoreForKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4 copyItems:1];
  if (self->_keyType)
  {
    if ([(BPSHistogram *)self _correctKeyType:v5])
    {
      id v6 = self->_backingDictionary;
      unint64_t v7 = [v5 count];
      uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
      if (v7 >= 2) {
        uint64_t v9 = [v5 count] - 2;
      }
      else {
        uint64_t v9 = 0;
      }
      v11 = [v8 arrayWithCapacity:v9];
      if ([v5 count] == 1)
      {
        unint64_t v12 = v6;
LABEL_14:
        v17 = [v5 lastObject];
        [(NSMutableDictionary *)v12 removeObjectForKey:v17];

        uint64_t v18 = [v11 count];
        if (v18 - 1 >= 0)
        {
          uint64_t v19 = v18;
          do
          {
            float v20 = [v11 objectAtIndexedSubscript:--v19];
            float v21 = [v5 objectAtIndexedSubscript:v19];
            double v22 = [v20 objectForKeyedSubscript:v21];

            if (![v22 count])
            {
              v23 = [v11 objectAtIndexedSubscript:v19];
              v24 = [v5 objectAtIndexedSubscript:v19];
              [v23 removeObjectForKey:v24];
            }
          }
          while (v19 > 0);
        }
        id v6 = v12;
      }
      else
      {
        unint64_t v13 = 0;
        while (1)
        {
          [v11 addObject:v6];
          long long v14 = [v5 objectAtIndexedSubscript:v13];
          long long v15 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v14];

          if (!v15) {
            break;
          }
          long long v16 = [v5 objectAtIndexedSubscript:v13];
          unint64_t v12 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v16];

          ++v13;
          id v6 = v12;
          if (v13 >= [v5 count] - 1) {
            goto LABEL_14;
          }
        }
      }
    }
    else
    {
      unint64_t v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BPSHistogram scoreForKey:]();
      }
    }
  }
}

- (id)allKeysAtLevel:(unint64_t)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v30 = [MEMORY[0x1E4F1CA80] set];
  keyType = self->_keyType;
  if (keyType && [(NSArray *)keyType count] > a3)
  {
    unint64_t v29 = a3;
    v32 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v8 = [(NSMutableDictionary *)self->_backingDictionary allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          long long v14 = [(NSMutableDictionary *)self->_backingDictionary objectForKeyedSubscript:v13];
          [v32 addObject:v14];

          [v6 addObject:v13];
          [v7 addObject:&unk_1F040EE20];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v10);
    }

    long long v15 = v32;
    unint64_t v16 = v29;
    while ([v15 count])
    {
      v17 = [v15 firstObject];
      uint64_t v18 = [v6 firstObject];
      uint64_t v19 = [v7 firstObject];
      [v15 removeObjectAtIndex:0];
      [v6 removeObjectAtIndex:0];
      [v7 removeObjectAtIndex:0];
      if ([v19 unsignedIntegerValue] >= v16)
      {
        [v30 addObject:v18];
      }
      else
      {
        v31 = v18;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        float v20 = [v17 allKeys];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v34 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * j);
              v26 = [v17 objectForKeyedSubscript:v25];
              [v32 addObject:v26];

              [v6 addObject:v25];
              v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "unsignedIntegerValue") + 1);
              [v7 addObject:v27];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v22);
        }

        unint64_t v16 = v29;
        uint64_t v18 = v31;
        long long v15 = v32;
      }
    }
  }
  return v30;
}

- (void)removeAllScores
{
  [(NSMutableDictionary *)self->_backingDictionary removeAllObjects];
  keyType = self->_keyType;
  self->_keyType = 0;
}

- (void)enumerateKeysAndScoresUsingBlock:(id)a3
{
  if (self->_keyType)
  {
    char v8 = 0;
    backingDictionary = self->_backingDictionary;
    v5 = (void *)MEMORY[0x1E4F1CA48];
    id v6 = a3;
    unint64_t v7 = [v5 array];
    [(BPSHistogram *)self _enumerateWithBlock:v6 node:backingDictionary currentKey:v7 stop:&v8];
  }
}

- (void)_enumerateWithBlock:(id)a3 node:(id)a4 currentKey:(id)a5 stop:(BOOL *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void (**)(id, id, void *, BOOL *))a3;
  id v11 = a4;
  id v12 = a5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v22 = v11;
  obuint64_t j = [v11 allKeys];
  uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v24 != v15) {
        objc_enumerationMutation(obj);
      }
      if (*a6) {
        break;
      }
      uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v16);
      [v12 addObject:v17];
      uint64_t v18 = [v12 count];
      NSUInteger v19 = [(NSArray *)self->_keyType count];
      float v20 = [v22 objectForKeyedSubscript:v17];
      if (v18 == v19) {
        v10[2](v10, v12, v20, a6);
      }
      else {
        [(BPSHistogram *)self _enumerateWithBlock:v10 node:v20 currentKey:v12 stop:a6];
      }

      [v12 removeLastObject];
      if (v14 == ++v16)
      {
        uint64_t v14 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyType, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

- (void)scoreForKey:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1AD01F000, v0, v1, "Invalid key:%@, expected a key of type: %@");
}

@end