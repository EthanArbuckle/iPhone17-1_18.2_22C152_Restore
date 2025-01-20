@interface NSSQLCorrelationTableUpdateTracker
- (id)initForRelationship:(id)a3;
- (uint64_t)enumerateDeletesOIDsUsingBlock:(uint64_t)result;
- (uint64_t)enumerateDeletesUsingBlock:(uint64_t)result;
- (uint64_t)enumerateInsertsOIDsUsingBlock:(uint64_t)result;
- (uint64_t)enumerateReordersOIDsUsingBlock:(uint64_t)result;
- (uint64_t)enumerateReordersUsingBlock:(uint64_t)result;
- (uint64_t)trackInserts:(void *)a3 deletes:(void *)a4 reorders:(uint64_t)a5 forObjectWithID:;
- (uint64_t)trackReorders:(uint64_t)a3 forObjectWithID:;
- (void)_organizeValues:(uint64_t)a1;
- (void)dealloc;
- (void)enumerateInsertsUsingBlock:(uint64_t)a1;
- (void)enumerateMasterReordersOIDsUsingBlock:(uint64_t)a1;
- (void)enumerateMasterReordersPart2UsingBlock:(uint64_t)a1;
- (void)enumerateMasterReordersUsingBlock:(uint64_t)a1;
@end

@implementation NSSQLCorrelationTableUpdateTracker

- (uint64_t)trackReorders:(uint64_t)a3 forObjectWithID:
{
  if (result)
  {
    uint64_t v5 = result;
    result = [a2 count];
    if (result)
    {
      id v6 = *(id *)(v5 + 40);
      if (!v6)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        *(void *)(v5 + 40) = v6;
      }
      [v6 addObject:a3];
      v7 = *(void **)(v5 + 40);
      return [v7 addObject:a2];
    }
  }
  return result;
}

- (id)initForRelationship:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSQLCorrelationTableUpdateTracker;
  id result = [(NSSQLCorrelationTableUpdateTracker *)&v5 init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((_OWORD *)result + 1) = 0u;
    *((_OWORD *)result + 2) = 0u;
  }
  return result;
}

- (void)dealloc
{
  self->_inserts = 0;
  self->_deletes = 0;

  self->_masterUpdates = 0;
  self->_otherUpdates = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLCorrelationTableUpdateTracker;
  [(NSSQLCorrelationTableUpdateTracker *)&v3 dealloc];
}

- (uint64_t)trackInserts:(void *)a3 deletes:(void *)a4 reorders:(uint64_t)a5 forObjectWithID:
{
  if (result)
  {
    uint64_t v9 = result;
    if ([a2 count])
    {
      id v10 = *(id *)(v9 + 16);
      if (!v10)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        *(void *)(v9 + 16) = v10;
      }
      [v10 addObject:a5];
      [*(id *)(v9 + 16) addObject:a2];
    }
    if ([a3 count])
    {
      id v11 = *(id *)(v9 + 24);
      if (!v11)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        *(void *)(v9 + 24) = v11;
      }
      [v11 addObject:a5];
      [*(id *)(v9 + 24) addObject:a3];
    }
    id result = [a4 count];
    if (result)
    {
      id v12 = *(id *)(v9 + 32);
      if (!v12)
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        *(void *)(v9 + 32) = v12;
      }
      [v12 addObject:a5];
      v13 = *(void **)(v9 + 32);
      return [v13 addObject:a4];
    }
  }
  return result;
}

- (void)_organizeValues:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [a2 count];
  if (v4)
  {
    unint64_t v5 = v4;
    for (unint64_t i = 0; i < v5; i += 2)
    {
      uint64_t v7 = [a2 objectAtIndex:i];
      v8 = (void *)[a2 objectAtIndex:i | 1];
      uint64_t v9 = (void *)[v3 objectForKey:v7];
      if (!v9)
      {
        uint64_t v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [v3 setObject:v9 forKey:v7];
      }
      uint64_t v10 = [v8 count];
      if (v10)
      {
        unint64_t v11 = v10;
        for (unint64_t j = 0; j < v11; j += 2)
          objc_msgSend(v9, "setObject:forKey:", objc_msgSend(v8, "objectAtIndex:", j + 1), objc_msgSend(v8, "objectAtIndex:", j));
      }
    }
  }
  return v3;
}

- (void)enumerateInsertsUsingBlock:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4) {
      uint64_t v4 = (void *)[v4 propertyDescription];
    }
    int v5 = [v4 isOrdered];
    unint64_t v16 = [*(id *)(a1 + 16) count];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    if (v5 && (uint64_t v6 = *(void *)(a1 + 8)) != 0 && *(void *)(v6 + 56) == v6)
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x3052000000;
      v21 = __Block_byref_object_copy__45;
      v22 = __Block_byref_object_dispose__45;
      v23 = 0;
      v23 = -[NSSQLCorrelationTableUpdateTracker _organizeValues:](a1, *(void **)(a1 + 16));
      v15 = (void *)v19[5];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __65__NSSQLCorrelationTableUpdateTracker_enumerateInsertsUsingBlock___block_invoke;
      v17[3] = &unk_1E544F1D8;
      v17[5] = &v24;
      v17[6] = &v18;
      v17[4] = a2;
      [v15 enumerateKeysAndObjectsUsingBlock:v17];
      _Block_object_dispose(&v18, 8);
    }
    else if (v16)
    {
      unint64_t v7 = 0;
      if (v5) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }
      do
      {
        if (*((unsigned char *)v25 + 24)) {
          break;
        }
        uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "objectAtIndex:", v7), "_referenceData64");
        uint64_t v10 = (void *)[*(id *)(a1 + 16) objectAtIndex:v7 | 1];
        unint64_t v11 = [v10 count];
        if (v11)
        {
          for (unint64_t i = 0; i < v11; i += v8)
          {
            if (*((unsigned char *)v25 + 24)) {
              break;
            }
            uint64_t v13 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", i), "_referenceData64");
            uint64_t v14 = v5 ? objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", i + 1), "unsignedLongLongValue") : 0;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t *))(a2 + 16))(a2, v9, v13, v14, 0, v25 + 3);
          }
        }
        v7 += 2;
      }
      while (v7 < v16);
    }
    _Block_object_dispose(&v24, 8);
  }
}

void __65__NSSQLCorrelationTableUpdateTracker_enumerateInsertsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3052000000;
    v11[3] = __Block_byref_object_copy__45;
    v11[4] = __Block_byref_object_dispose__45;
    v11[5] = a2;
    uint64_t v5 = [a2 _referenceData64];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__NSSQLCorrelationTableUpdateTracker_enumerateInsertsUsingBlock___block_invoke_2;
    v6[3] = &unk_1E544F160;
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = v11;
    long long v7 = *(_OWORD *)(a1 + 32);
    uint64_t v10 = v5;
    [a3 enumerateKeysAndObjectsUsingBlock:v6];
    _Block_object_dispose(v11, 8);
  }
}

uint64_t __65__NSSQLCorrelationTableUpdateTracker_enumerateInsertsUsingBlock___block_invoke_2(uint64_t result, void *a2, void *a3)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v4 = (void *)result;
    [a3 unsignedLongLongValue];
    [a2 _referenceData64];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v4[6] + 8) + 40), "objectForKey:", a2), "objectForKey:", *(void *)(*(void *)(v4[7] + 8) + 40)), "unsignedLongLongValue");
    uint64_t v5 = *(uint64_t (**)(void))(v4[4] + 16);
    return v5();
  }
  return result;
}

- (uint64_t)enumerateInsertsOIDsUsingBlock:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(result + 8);
    if (v4) {
      uint64_t v4 = (void *)[v4 propertyDescription];
    }
    int v5 = [v4 isOrdered];
    id result = [*(id *)(v3 + 16) count];
    unsigned __int8 v15 = 0;
    if (result)
    {
      unint64_t v6 = result;
      unint64_t v7 = 0;
      if (v5) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }
      do
      {
        uint64_t v9 = [*(id *)(v3 + 16) objectAtIndex:v7];
        uint64_t v10 = (void *)[*(id *)(v3 + 16) objectAtIndex:v7 | 1];
        id result = [v10 count];
        int v11 = v15;
        if (result) {
          BOOL v12 = v15 == 0;
        }
        else {
          BOOL v12 = 0;
        }
        if (v12)
        {
          unint64_t v13 = result;
          unint64_t v14 = 0;
          do
          {
            id result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, v9, [v10 objectAtIndex:v14], &v15);
            v14 += v8;
            int v11 = v15;
          }
          while (v14 < v13 && !v15);
        }
        v7 += 2;
      }
      while (v7 < v6 && !v11);
    }
  }
  return result;
}

- (uint64_t)enumerateDeletesUsingBlock:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id result = [*(id *)(result + 24) count];
    unint64_t v14 = result;
    unsigned __int8 v15 = 0;
    uint64_t v4 = *(void *)(v3 + 8);
    BOOL v5 = v4 && *(void *)(v4 + 56) == v4;
    if (result)
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 24), "objectAtIndex:", v6, v14), "_referenceData64");
        uint64_t v8 = (void *)[*(id *)(v3 + 24) objectAtIndex:v6 | 1];
        id result = [v8 count];
        int v9 = v15;
        if (result) {
          BOOL v10 = v15 == 0;
        }
        else {
          BOOL v10 = 0;
        }
        if (v10)
        {
          unint64_t v11 = result;
          unint64_t v12 = 1;
          do
          {
            uint64_t v13 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v12 - 1), "_referenceData64");
            id result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, v7, v13, &v15);
            if (v5) {
              id result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, v13, v7, &v15);
            }
            int v9 = v15;
            if (v12 >= v11) {
              break;
            }
            ++v12;
          }
          while (!v15);
        }
        v6 += 2;
      }
      while (v6 < v14 && !v9);
    }
  }
  return result;
}

- (uint64_t)enumerateDeletesOIDsUsingBlock:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id result = [*(id *)(result + 24) count];
    unint64_t v14 = result;
    unsigned __int8 v15 = 0;
    uint64_t v4 = *(void *)(v3 + 8);
    BOOL v5 = v4 && *(void *)(v4 + 56) == v4;
    if (result)
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = objc_msgSend(*(id *)(v3 + 24), "objectAtIndex:", v6, v14);
        uint64_t v8 = (void *)[*(id *)(v3 + 24) objectAtIndex:v6 | 1];
        id result = [v8 count];
        int v9 = v15;
        if (result) {
          BOOL v10 = v15 == 0;
        }
        else {
          BOOL v10 = 0;
        }
        if (v10)
        {
          unint64_t v11 = result;
          unint64_t v12 = 1;
          do
          {
            uint64_t v13 = [v8 objectAtIndex:v12 - 1];
            id result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, v7, v13, &v15);
            if (v5) {
              id result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, v13, v7, &v15);
            }
            int v9 = v15;
            if (v12 >= v11) {
              break;
            }
            ++v12;
          }
          while (!v15);
        }
        v6 += 2;
      }
      while (v6 < v14 && !v9);
    }
  }
  return result;
}

- (void)enumerateMasterReordersUsingBlock:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4) {
      uint64_t v4 = (void *)[v4 propertyDescription];
    }
    if ([v4 isOrdered])
    {
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 0;
      uint64_t v5 = *(void *)(a1 + 8);
      if (v5)
      {
        unint64_t v6 = *(void **)(a1 + 32);
        if (*(void *)(v5 + 56) == v5)
        {
          v17 = -[NSSQLCorrelationTableUpdateTracker _organizeValues:](a1, v6);
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __72__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersUsingBlock___block_invoke;
          v19[3] = &unk_1E544F1B0;
          v19[4] = a2;
          v19[5] = &v20;
          [v17 enumerateKeysAndObjectsUsingBlock:v19];
LABEL_18:
          _Block_object_dispose(&v20, 8);
          return;
        }
        uint64_t v7 = (id *)(a1 + 32);
      }
      else
      {
        uint64_t v18 = *(void **)(a1 + 32);
        uint64_t v7 = (id *)(a1 + 32);
        unint64_t v6 = v18;
      }
      unint64_t v8 = [v6 count];
      if (v8)
      {
        for (unint64_t i = 0; i < v8; i += 2)
        {
          if (*((unsigned char *)v21 + 24)) {
            break;
          }
          uint64_t v10 = objc_msgSend((id)objc_msgSend(*v7, "objectAtIndex:", i), "_referenceData64");
          unint64_t v11 = (void *)[*v7 objectAtIndex:i | 1];
          unint64_t v12 = [v11 count];
          if (v12)
          {
            for (unint64_t j = 0; j < v12; unint64_t j = v15 + 1)
            {
              if (*((unsigned char *)v21 + 24)) {
                break;
              }
              uint64_t v14 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", j), "_referenceData64");
              unint64_t v15 = j + 1;
              uint64_t v16 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v15), "unsignedLongLongValue");
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, v16, v10, v14, v21 + 3);
            }
          }
        }
      }
      goto LABEL_18;
    }
  }
}

uint64_t __72__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersUsingBlock___block_invoke(uint64_t result, void *a2, void *a3)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v4 = result;
    uint64_t v5 = [a2 _referenceData64];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersUsingBlock___block_invoke_2;
    v6[3] = &unk_1E544F188;
    long long v7 = *(_OWORD *)(v4 + 32);
    uint64_t v8 = v5;
    return [a3 enumerateKeysAndObjectsUsingBlock:v6];
  }
  return result;
}

uint64_t __72__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersUsingBlock___block_invoke_2(uint64_t result, void *a2, void *a3)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v4 = result;
    [a3 unsignedLongLongValue];
    [a2 _referenceData64];
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v4 + 32) + 16);
    return v5();
  }
  return result;
}

- (void)enumerateMasterReordersOIDsUsingBlock:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4) {
      uint64_t v4 = (void *)[v4 propertyDescription];
    }
    if ([v4 isOrdered])
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      uint64_t v5 = *(void *)(a1 + 8);
      if (v5)
      {
        unint64_t v6 = *(void **)(a1 + 32);
        if (*(void *)(v5 + 56) == v5)
        {
          unint64_t v15 = -[NSSQLCorrelationTableUpdateTracker _organizeValues:](a1, v6);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __76__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersOIDsUsingBlock___block_invoke;
          v17[3] = &unk_1E544F1B0;
          v17[4] = a2;
          v17[5] = &v18;
          [v15 enumerateKeysAndObjectsUsingBlock:v17];
LABEL_18:
          _Block_object_dispose(&v18, 8);
          return;
        }
        long long v7 = (id *)(a1 + 32);
      }
      else
      {
        uint64_t v16 = *(void **)(a1 + 32);
        long long v7 = (id *)(a1 + 32);
        unint64_t v6 = v16;
      }
      unint64_t v8 = [v6 count];
      if (v8)
      {
        for (unint64_t i = 0; i < v8; i += 2)
        {
          if (*((unsigned char *)v19 + 24)) {
            break;
          }
          uint64_t v10 = [*v7 objectAtIndex:i];
          unint64_t v11 = (void *)[*v7 objectAtIndex:i | 1];
          unint64_t v12 = [v11 count];
          if (v12)
          {
            for (unint64_t j = 0; j < v12; j += 2)
            {
              if (*((unsigned char *)v19 + 24)) {
                break;
              }
              uint64_t v14 = [v11 objectAtIndex:j];
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, v14, v10, v19 + 3);
            }
          }
        }
      }
      goto LABEL_18;
    }
  }
}

void __76__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersOIDsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(*(void *)(v3 + 8) + 24))
  {
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3052000000;
    v5[3] = __Block_byref_object_copy__45;
    v5[4] = __Block_byref_object_dispose__45;
    v5[5] = a2;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __76__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersOIDsUsingBlock___block_invoke_2;
    v4[3] = &unk_1E544F1D8;
    v4[4] = *(void *)(a1 + 32);
    v4[5] = v3;
    v4[6] = v5;
    [a3 enumerateKeysAndObjectsUsingBlock:v4];
    _Block_object_dispose(v5, 8);
  }
}

void *__76__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersOIDsUsingBlock___block_invoke_2(void *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result[5] + 8);
  int v4 = *(unsigned __int8 *)(v2 + 24);
  uint64_t v3 = v2 + 24;
  if (!v4) {
    return (void *)(*(uint64_t (**)(void, uint64_t, void, uint64_t))(result[4] + 16))(result[4], a2, *(void *)(*(void *)(result[6] + 8) + 40), v3);
  }
  return result;
}

- (void)enumerateMasterReordersPart2UsingBlock:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = -[NSSQLCorrelationTableUpdateTracker _organizeValues:](a1, *(void **)(a1 + 32));
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x2020000000;
    char v6 = 0;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __77__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersPart2UsingBlock___block_invoke;
    v4[3] = &unk_1E544F1B0;
    v4[4] = a2;
    v4[5] = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:v4];
    _Block_object_dispose(v5, 8);
  }
}

uint64_t __77__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersPart2UsingBlock___block_invoke(uint64_t result, void *a2, void *a3)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v4 = result;
    uint64_t v5 = [a2 _referenceData64];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersPart2UsingBlock___block_invoke_2;
    v6[3] = &unk_1E544F188;
    long long v7 = *(_OWORD *)(v4 + 32);
    uint64_t v8 = v5;
    return [a3 enumerateKeysAndObjectsUsingBlock:v6];
  }
  return result;
}

uint64_t __77__NSSQLCorrelationTableUpdateTracker_enumerateMasterReordersPart2UsingBlock___block_invoke_2(uint64_t result, void *a2, void *a3)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v4 = result;
    [a3 unsignedLongLongValue];
    [a2 _referenceData64];
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v4 + 32) + 16);
    return v5();
  }
  return result;
}

- (uint64_t)enumerateReordersUsingBlock:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(result + 8);
    if (v4) {
      uint64_t v4 = (void *)[v4 propertyDescription];
    }
    id result = objc_msgSend((id)objc_msgSend(v4, "inverseRelationship"), "isOrdered");
    if (result)
    {
      id result = [*(id *)(v3 + 40) count];
      unsigned __int8 v13 = 0;
      if (result)
      {
        unint64_t v5 = result;
        unint64_t v6 = 0;
        do
        {
          uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 40), "objectAtIndex:", v6), "_referenceData64");
          uint64_t v8 = (void *)[*(id *)(v3 + 40) objectAtIndex:v6 | 1];
          id result = [v8 count];
          int v9 = v13;
          if (result) {
            BOOL v10 = v13 == 0;
          }
          else {
            BOOL v10 = 0;
          }
          if (v10)
          {
            unint64_t v11 = result;
            unint64_t v12 = 0;
            do
            {
              id result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v12), "_referenceData64"), v7, objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v12 + 1), "unsignedLongLongValue"), &v13);
              v12 += 2;
              int v9 = v13;
            }
            while (v12 < v11 && !v13);
          }
          v6 += 2;
        }
        while (v6 < v5 && !v9);
      }
    }
  }
  return result;
}

- (uint64_t)enumerateReordersOIDsUsingBlock:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(result + 8);
    if (v4) {
      uint64_t v4 = (void *)[v4 propertyDescription];
    }
    id result = objc_msgSend((id)objc_msgSend(v4, "inverseRelationship"), "isOrdered");
    if (result)
    {
      id result = [*(id *)(v3 + 40) count];
      unsigned __int8 v13 = 0;
      if (result)
      {
        unint64_t v5 = result;
        unint64_t v6 = 0;
        do
        {
          uint64_t v7 = [*(id *)(v3 + 40) objectAtIndex:v6];
          uint64_t v8 = (void *)[*(id *)(v3 + 40) objectAtIndex:v6 | 1];
          id result = [v8 count];
          int v9 = v13;
          if (result) {
            BOOL v10 = v13 == 0;
          }
          else {
            BOOL v10 = 0;
          }
          if (v10)
          {
            unint64_t v11 = result;
            unint64_t v12 = 2;
            do
            {
              id result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(a2 + 16))(a2, [v8 objectAtIndex:v12 - 2], v7, &v13);
              int v9 = v13;
              if (v12 >= v11) {
                break;
              }
              v12 += 2;
            }
            while (!v13);
          }
          v6 += 2;
        }
        while (v6 < v5 && !v9);
      }
    }
  }
  return result;
}

@end