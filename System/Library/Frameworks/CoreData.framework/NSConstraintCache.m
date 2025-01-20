@interface NSConstraintCache
+ (uint64_t)createCachesForEntity:(uint64_t)a3 forValidator:;
- (id)description;
- (uint64_t)extendConstraint:(void *)a3 onParentEntity:(uint64_t)a4 parentCache:;
- (uint64_t)registerObject:(uint64_t)result;
- (uint64_t)reset;
- (void)dealloc;
- (void)initForEntity:(void *)a3 constraint:(void *)a4 extension:;
- (void)validateForSave:(void *)result;
@end

@implementation NSConstraintCache

- (void)validateForSave:(void *)result
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v2 = a2;
    v3 = result;
    if (a2) {
      id v4 = a2;
    }
    else {
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = (void *)v3[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)-[NSConstraintCache validateForSave:](*(void *)(*((void *)&v13 + 1) + 8 * i), v2), "allObjects"));
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    v11 = (void *)v3[4];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__NSConstraintCache_validateForSave___block_invoke;
    v12[3] = &unk_1E544E3A0;
    v12[4] = v3;
    v12[5] = v2;
    v12[6] = v5;
    [v11 enumerateKeysAndObjectsUsingBlock:v12];

    return v5;
  }
  return result;
}

+ (uint64_t)createCachesForEntity:(uint64_t)a3 forValidator:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  if (a2)
  {
    uint64_t v5 = a2[16];
    if (!v5 || (v6 = *(void **)(v5 + 24)) == 0) {
      v6 = NSArray_EmptyArray;
    }
  }
  else
  {
    v6 = 0;
  }
  uint64_t result = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if ((-[NSEntityDescription _constraintIsExtension:](objc_msgSend(a2, "superentity", (void)v13), v11) & 1) == 0)
        {
          v12 = -[NSConstraintCache initForEntity:constraint:extension:]([NSConstraintCache alloc], (uint64_t)a2, v11, 0);
          -[NSConstraintCache extendConstraint:onParentEntity:parentCache:]((uint64_t)v12, v11, a2, (uint64_t)v12);
          -[NSConstraintValidator _addConstraintRoot:forEntity:](a3, (uint64_t)v12, a2);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t result = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v8 = result;
    }
    while (result);
  }
  return result;
}

- (void)initForEntity:(void *)a3 constraint:(void *)a4 extension:
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)NSConstraintCache;
  uint64_t v7 = objc_msgSendSuper2(&v10, sel_init);
  uint64_t v8 = v7;
  if (v7)
  {
    v7[3] = a2;
    v7[1] = a3;
    v8[2] = a4;
    v8[5] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8[4] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v8;
}

- (uint64_t)extendConstraint:(void *)a3 onParentEntity:(uint64_t)a4 parentCache:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = result;
  if (result)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = (id)[a3 subentities];
    uint64_t result = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
    uint64_t v27 = result;
    if (result)
    {
      uint64_t v26 = *(void *)v43;
      uint64_t v36 = a4;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v43 != v26)
          {
            uint64_t v6 = v5;
            objc_enumerationMutation(obj);
            uint64_t v5 = v6;
          }
          uint64_t v28 = v5;
          v32 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
          uint64_t v7 = -[NSEntityDescription _extensionsOfParentConstraint:](v32, a2);
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v31 = v7;
          uint64_t v34 = [v7 countByEnumeratingWithState:&v38 objects:v50 count:16];
          if (v34)
          {
            uint64_t v33 = *(void *)v39;
            do
            {
              uint64_t v8 = 0;
              do
              {
                if (*(void *)v39 != v33) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v37 = v8;
                v35 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
                uint64_t v9 = [v35 objectAtIndexedSubscript:0];
                if (a4)
                {
                  objc_super v10 = (void *)v9;
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v46 = 0u;
                  long long v47 = 0u;
                  v11 = *(void **)(a4 + 40);
                  uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
                  if (v12)
                  {
                    uint64_t v13 = v12;
                    uint64_t v14 = *(void *)v47;
                    do
                    {
                      uint64_t v15 = 0;
                      do
                      {
                        if (*(void *)v47 != v14) {
                          objc_enumerationMutation(v11);
                        }
                        uint64_t v16 = *(void *)(*((void *)&v46 + 1) + 8 * v15);
                        if (v16) {
                          v17 = *(void **)(v16 + 8);
                        }
                        else {
                          v17 = 0;
                        }
                        unint64_t v18 = [v10 count];
                        unint64_t v19 = [v17 count];
                        if (v18 > v19)
                        {
                          unint64_t v20 = v19;
                          if (v19)
                          {
                            uint64_t v21 = 0;
                            uint64_t v22 = 0;
                            do
                            {
                              v22 += objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v21), "isEqual:", objc_msgSend(v17, "objectAtIndex:", v21));
                              ++v21;
                            }
                            while (v20 != v21);
                          }
                          else
                          {
                            uint64_t v22 = 0;
                          }
                          if (v22 == v20)
                          {
                            a4 = v36;
                            goto LABEL_35;
                          }
                        }
                        ++v15;
                      }
                      while (v15 != v13);
                      uint64_t v23 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
                      uint64_t v13 = v23;
                      a4 = v36;
                    }
                    while (v23);
                  }
                }
                v24 = -[NSConstraintCache initForEntity:constraint:extension:]([NSConstraintCache alloc], (uint64_t)v32, (void *)[v35 objectAtIndexedSubscript:0], objc_msgSend(v35, "objectAtIndexedSubscript:", 2));
                if (a4) {
                  [*(id *)(a4 + 40) addObject:v24];
                }

                -[NSConstraintCache extendConstraint:onParentEntity:parentCache:](v30, [v35 objectAtIndexedSubscript:0], v32, v24);
LABEL_35:
                uint64_t v8 = v37 + 1;
              }
              while (v37 + 1 != v34);
              uint64_t v34 = [v31 countByEnumeratingWithState:&v38 objects:v50 count:16];
            }
            while (v34);
          }
          -[NSConstraintCache extendConstraint:onParentEntity:parentCache:](v30, a2, v32, a4);
          uint64_t v5 = v28 + 1;
        }
        while (v28 + 1 != v27);
        uint64_t result = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
        uint64_t v27 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)reset
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) removeAllObjects];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    id v2 = *(void **)(v1 + 40);
    uint64_t result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          -[NSConstraintCache reset](*(void *)(*((void *)&v6 + 1) + 8 * v5++));
        }
        while (v3 != v5);
        uint64_t result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v3 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)dealloc
{
  self->_entity = 0;

  self->_constraint = 0;
  self->_extension = 0;

  self->_children = 0;
  self->_knownValues = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSConstraintCache;
  [(NSConstraintCache *)&v3 dealloc];
}

- (uint64_t)registerObject:(uint64_t)result
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "entity"), "isKindOfEntity:", *(void *)(result + 24));
  if (!result) {
    return result;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v32 = v3;
  uint64_t v5 = *(void **)(v3 + 8);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (!v6) {
    goto LABEL_25;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v38;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v38 != v8) {
        objc_enumerationMutation(v5);
      }
      objc_super v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      uint64_t v11 = (void *)[v10 componentsSeparatedByString:@"."];
      if ((unint64_t)[v11 count] < 2)
      {
        uint64_t v13 = (void *)[a2 valueForKey:v10];
        if (!v13) {
          goto LABEL_19;
        }
      }
      else
      {
        if (![v11 count]) {
          goto LABEL_19;
        }
        unint64_t v12 = 0;
        uint64_t v13 = 0;
        do
        {
          uint64_t v14 = [v11 objectAtIndex:v12];
          if (v12) {
            uint64_t v15 = [v13 objectForKey:v14];
          }
          else {
            uint64_t v15 = [a2 valueForKey:v14];
          }
          uint64_t v13 = (void *)v15;
          ++v12;
        }
        while ([v11 count] > v12);
        if (!v13)
        {
LABEL_19:
          uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
          goto LABEL_22;
        }
      }
      if ([v13 isNSString])
      {
        uint64_t v16 = +[_PFRoutines sanitize:]((uint64_t)_PFRoutines, v13);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_23;
        }
        uint64_t v16 = [v13 objectID];
      }
LABEL_22:
      uint64_t v13 = (void *)v16;
LABEL_23:
      [v4 addObject:v13];
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v47 count:16];
  }
  while (v7);
LABEL_25:
  v17 = *(void **)(v32 + 16);
  if (!v17) {
    v17 = *(void **)(v32 + 8);
  }
  if ([v17 count] == 1)
  {
    unint64_t v18 = (id)[v4 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v19 = (id)[v18 objectID];

      unint64_t v18 = v19;
    }
  }
  else
  {
    unint64_t v20 = [NSConstraintCacheKey alloc];
    if (v20)
    {
      v45.receiver = v20;
      v45.super_class = (Class)NSConstraintCacheKey;
      unint64_t v18 = objc_msgSendSuper2(&v45, sel_init);
      if (v18)
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v22 = [v4 countByEnumeratingWithState:&v41 objects:v48 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v42;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v42 != v24) {
                objc_enumerationMutation(v4);
              }
              uint64_t v26 = *(void **)(*((void *)&v41 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v26 = (void *)[v26 objectID];
              }
              [v21 addObject:v26];
            }
            uint64_t v23 = [v4 countByEnumeratingWithState:&v41 objects:v48 count:16];
          }
          while (v23);
        }
        v18[1] = [v21 copy];
      }
    }
    else
    {
      unint64_t v18 = 0;
    }
  }
  id v27 = (id)[*(id *)(v32 + 32) objectForKey:v18];
  if (!v27)
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(v32 + 32) setObject:v27 forKey:v18];
  }
  [v27 addObject:a2];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v28 = *(void **)(v32 + 40);
  uint64_t result = [v28 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (result)
  {
    uint64_t v29 = result;
    uint64_t v30 = *(void *)v34;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(v28);
        }
        -[NSConstraintCache registerObject:](*(void *)(*((void *)&v33 + 1) + 8 * v31++), a2);
      }
      while (v29 != v31);
      uint64_t result = [v28 countByEnumeratingWithState:&v33 objects:v46 count:16];
      uint64_t v29 = result;
    }
    while (result);
  }
  return result;
}

void __37__NSConstraintCache_validateForSave___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1CA98] null] != a2
    && (unint64_t)[a3 count] >= 2
    && *(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "objectID"), "persistentStore");
          if (!v10)
          {

            goto LABEL_15;
          }
          [v5 addObject:v10];
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = [v5 count];

    if (v11 != [a3 count])
    {
LABEL_15:
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v12 = [a3 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
        while (2)
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(a3);
            }
            if (![*(id *)(a1 + 40) containsObject:*(void *)(*((void *)&v29 + 1) + 8 * j)])
            {
              [*(id *)(a1 + 40) addObjectsFromArray:a3];
              id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v25 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              uint64_t v17 = [a3 countByEnumeratingWithState:&v25 objects:v37 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v26;
                do
                {
                  for (uint64_t k = 0; k != v18; ++k)
                  {
                    if (*(void *)v26 != v19) {
                      objc_enumerationMutation(a3);
                    }
                    uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * k);
                    if (!v21 || (uint64_t v22 = *(void *)(v21 + 48)) == 0 || (v23 = *(void *)(v22 + 8)) == 0) {
                      uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
                    }
                    [v16 addObject:v23];
                  }
                  uint64_t v18 = [a3 countByEnumeratingWithState:&v25 objects:v37 count:16];
                }
                while (v18);
              }
              uint64_t v24 = [[NSConstraintConflict alloc] initWithConstraint:*(void *)(*(void *)(a1 + 32) + 8) databaseObject:0 databaseSnapshot:0 conflictingObjects:a3 conflictingSnapshots:v16];

              [*(id *)(a1 + 48) addObject:v24];
              return;
            }
          }
          uint64_t v13 = [a3 countByEnumeratingWithState:&v29 objects:v38 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSConstraintCache : entity = %@, constraint = %@, extension = %@>", -[NSEntityDescription name](self->_entity, "name"), self->_constraint, self->_extension];
}

@end