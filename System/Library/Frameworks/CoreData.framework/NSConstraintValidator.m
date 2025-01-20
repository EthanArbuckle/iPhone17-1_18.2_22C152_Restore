@interface NSConstraintValidator
- (id)initWithManagedObjectContext:(void *)a1;
- (uint64_t)_addConstraintRoot:(void *)a3 forEntity:;
- (uint64_t)registerObject:(uint64_t)result;
- (uint64_t)registerObjects:(uint64_t)result;
- (uint64_t)reset;
- (uint64_t)validateForSave;
- (void)dealloc;
@end

@implementation NSConstraintValidator

- (uint64_t)validateForSave
{
  uint64_t v1 = a1;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (*(void *)(v1 + 24))
    {
      uint64_t v3 = [*(id *)(v1 + 16) count];
      if (v3)
      {
        uint64_t v4 = v3;
        for (uint64_t i = 0; i != v4; ++i)
        {
          uint64_t v6 = *(void *)(v1 + 24);
          if (*(void *)(v6 + 8 * i))
          {
            long long v17 = 0u;
            long long v18 = 0u;
            long long v15 = 0u;
            long long v16 = 0u;
            v7 = *(void **)(v6 + 8 * i);
            uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
            if (v8)
            {
              uint64_t v9 = v8;
              uint64_t v10 = *(void *)v16;
              do
              {
                for (uint64_t j = 0; j != v9; ++j)
                {
                  if (*(void *)v16 != v10) {
                    objc_enumerationMutation(v7);
                  }
                  v12 = -[NSConstraintCache validateForSave:](*(void **)(*((void *)&v15 + 1) + 8 * j), 0);
                  if ([v12 count]) {
                    [v2 addObjectsFromArray:v12];
                  }
                }
                uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
              }
              while (v9);
            }
          }
        }
      }
    }
    if ([v2 count])
    {
      uint64_t v13 = *MEMORY[0x1E4F281F8];
      v19 = @"Conflicts";
      id v20 = v2;
      uint64_t v1 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v13, 1551, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (id)initWithManagedObjectContext:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v18.receiver = a1;
  v18.super_class = (Class)NSConstraintValidator;
  id v3 = objc_msgSendSuper2(&v18, sel_init);
  if (v3)
  {
    uint64_t v4 = [a2 persistentStoreCoordinator];
    v5 = v4 ? *(void **)(v4 + 96) : 0;
    id v6 = v5;
    *((void *)v3 + 1) = v6;
    id v7 = -[_PFModelMap entitiesForContext:configuration:]((uint64_t)v6, a2, 0);
    *((void *)v3 + 2) = v7;
    *((void *)v3 + 3) = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (-[NSEntityDescription _hasUniqueProperties]((BOOL)v12))
          {
            if (!*((void *)v3 + 3)) {
              *((void *)v3 + 3) = PF_CALLOC_OBJECT_ARRAY([*((id *)v3 + 2) count]);
            }
            +[NSConstraintCache createCachesForEntity:forValidator:]((uint64_t)NSConstraintCache, v12, (uint64_t)v3);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
  }
  return v3;
}

- (uint64_t)_addConstraintRoot:(void *)a3 forEntity:
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = _PFModelMapSlotForEntity(*(void *)(result + 8), a3);
    id v6 = *(id *)(*(void *)(v4 + 24) + 8 * v5);
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)(*(void *)(v4 + 24) + 8 * v5) = v6;
    }
    return [v6 addObject:a2];
  }
  return result;
}

- (uint64_t)reset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 24))
    {
      result = [*(id *)(result + 16) count];
      if (result)
      {
        uint64_t v2 = result;
        for (uint64_t i = 0; i != v2; ++i)
        {
          uint64_t v4 = *(void *)(v1 + 24);
          if (*(void *)(v4 + 8 * i))
          {
            long long v11 = 0u;
            long long v12 = 0u;
            long long v9 = 0u;
            long long v10 = 0u;
            uint64_t v5 = *(void **)(v4 + 8 * i);
            result = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
            if (result)
            {
              uint64_t v6 = result;
              uint64_t v7 = *(void *)v10;
              do
              {
                uint64_t v8 = 0;
                do
                {
                  if (*(void *)v10 != v7) {
                    objc_enumerationMutation(v5);
                  }
                  -[NSConstraintCache reset](*(void *)(*((void *)&v9 + 1) + 8 * v8++));
                }
                while (v6 != v8);
                result = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
                uint64_t v6 = result;
              }
              while (result);
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)dealloc
{
  if (self->_cachesByEntity)
  {
    NSUInteger v3 = [(NSArray *)self->_entities count];
    if (v3)
    {
      NSUInteger v4 = v3;
      for (uint64_t i = 0; i != v4; ++i)
      {
        id v6 = self->_cachesByEntity[i];
        if (v6)
        {

          self->_cachesByEntity[i] = 0;
        }
      }
    }
    PF_FREE_OBJECT_ARRAY(self->_cachesByEntity);
  }

  self->_modelMap = 0;
  self->_entities = 0;
  v7.receiver = self;
  v7.super_class = (Class)NSConstraintValidator;
  [(NSConstraintValidator *)&v7 dealloc];
}

- (uint64_t)registerObjects:(uint64_t)result
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 24))
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v7 = 0u;
      long long v8 = 0u;
      result = [a2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (result)
      {
        uint64_t v4 = result;
        uint64_t v5 = *(void *)v8;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v8 != v5) {
              objc_enumerationMutation(a2);
            }
            -[NSConstraintValidator registerObject:](v2, *(void **)(*((void *)&v7 + 1) + 8 * v6++));
          }
          while (v4 != v6);
          result = [a2 countByEnumeratingWithState:&v7 objects:v11 count:16];
          uint64_t v4 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)registerObject:(uint64_t)result
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    result = [a2 entity];
    if (result)
    {
      uint64_t v4 = (void *)result;
      do
      {
        uint64_t v5 = *(void *)(v3 + 24);
        uint64_t v6 = *(void **)(v5 + 8 * _PFModelMapSlotForEntity(*(void *)(v3 + 8), v4));
        if (v6)
        {
          long long v13 = 0u;
          long long v14 = 0u;
          long long v11 = 0u;
          long long v12 = 0u;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v12;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v12 != v9) {
                  objc_enumerationMutation(v6);
                }
                -[NSConstraintCache registerObject:](*(void *)(*((void *)&v11 + 1) + 8 * v10++), a2);
              }
              while (v8 != v10);
              uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
            }
            while (v8);
          }
        }
        result = [v4 superentity];
        uint64_t v4 = (void *)result;
      }
      while (result);
    }
  }
  return result;
}

@end