@interface NSSQLiteStatementCache
- (CFMutableDictionaryRef)createCorrelationCacheDictionary;
- (NSSQLiteStatementCache)initWithEntity:(id)a3;
- (void)_clearSaveGeneratedCachedStatements;
- (void)cacheBatchInsertStatement:(void *)result;
- (void)cacheCorrelationDeleteStatement:(void *)key forRelationship:;
- (void)cacheCorrelationInsertStatement:(void *)key forRelationship:;
- (void)cacheCorrelationMasterReorderStatement:(void *)key forRelationship:;
- (void)cacheCorrelationReorderStatement:(void *)key forRelationship:;
- (void)cacheDeletionStatement:(void *)result;
- (void)cacheFaultingStatement:(uint64_t)a3 andFetchRequest:(void *)a4 forRelationship:;
- (void)cacheFaultingStatement:(void *)result;
- (void)cacheInsertStatement:(void *)result;
- (void)clearCachedStatements;
- (void)dealloc;
- (void)insertOrReplaceStatement:(void *)key forRelationship:(CFDictionaryRef)theDict inDictionary:;
@end

@implementation NSSQLiteStatementCache

- (NSSQLiteStatementCache)initWithEntity:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSSQLiteStatementCache;
  v4 = [(NSSQLiteStatementCache *)&v6 init];
  if (v4) {
    v4->_entity = (NSSQLEntity *)a3;
  }
  return v4;
}

- (void)cacheFaultingStatement:(uint64_t)a3 andFetchRequest:(void *)a4 forRelationship:
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v7 = [a4 name];
    v8 = (void *)[*(id *)(a1 + 48) objectForKey:v7];
    v9 = (unint64_t)[v8 count] < 2 ? 0 : objc_msgSend(v8, "objectAtIndex:", 0);
    if (v9 != a2)
    {
      -[NSSQLiteStatement clearCaches:](v9, 1);
      v10 = *(void **)(a1 + 48);
      if (a2)
      {
        if (!v10) {
          *(void *)(a1 + 48) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        v12[0] = a2;
        v12[1] = a3;
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v12 count:2];
        [*(id *)(a1 + 48) setObject:v11 forKey:v7];
      }
      else
      {
        [v10 removeObjectForKey:v7];
      }
    }
  }
}

- (void)_clearSaveGeneratedCachedStatements
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(void *)(a1 + 16)) {
      -[NSSQLiteStatementCache cacheInsertStatement:]((void *)a1, 0);
    }
    if (*(void *)(a1 + 24)) {
      -[NSSQLiteStatementCache cacheBatchInsertStatement:]((void *)a1, 0);
    }
    if (*(void *)(a1 + 32)) {
      -[NSSQLiteStatementCache cacheDeletionStatement:]((void *)a1, 0);
    }
    v2 = *(void **)(a1 + 56);
    if (v2)
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v3 = (void *)[v2 allValues];
      uint64_t v4 = [v3 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v49;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v49 != v6) {
              objc_enumerationMutation(v3);
            }
            -[NSSQLiteStatement clearCaches:](*(void **)(*((void *)&v48 + 1) + 8 * v7++), 1);
          }
          while (v5 != v7);
          uint64_t v5 = [v3 countByEnumeratingWithState:&v48 objects:v56 count:16];
        }
        while (v5);
      }
      CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 56));
    }
    v8 = *(void **)(a1 + 72);
    if (v8)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v9 = (void *)[v8 allValues];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v55 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v45;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v45 != v12) {
              objc_enumerationMutation(v9);
            }
            -[NSSQLiteStatement clearCaches:](*(void **)(*((void *)&v44 + 1) + 8 * v13++), 1);
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v55 count:16];
        }
        while (v11);
      }
      CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 72));
    }
    v14 = *(void **)(a1 + 80);
    if (v14)
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v15 = (void *)[v14 allValues];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v54 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v41;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v41 != v18) {
              objc_enumerationMutation(v15);
            }
            -[NSSQLiteStatement clearCaches:](*(void **)(*((void *)&v40 + 1) + 8 * v19++), 1);
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v54 count:16];
        }
        while (v17);
      }
      CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 80));
    }
    v20 = *(void **)(a1 + 88);
    if (v20)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v21 = (void *)[v20 allValues];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v53 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v37;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v21);
            }
            -[NSSQLiteStatement clearCaches:](*(void **)(*((void *)&v36 + 1) + 8 * v25++), 1);
          }
          while (v23 != v25);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v53 count:16];
        }
        while (v23);
      }
      CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 88));
    }
    v26 = *(void **)(a1 + 64);
    if (v26)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v27 = objc_msgSend(v26, "allValues", 0);
      uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v33;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v33 != v30) {
              objc_enumerationMutation(v27);
            }
            -[NSSQLiteStatement clearCaches:](*(void **)(*((void *)&v32 + 1) + 8 * v31++), 1);
          }
          while (v29 != v31);
          uint64_t v29 = [v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
        }
        while (v29);
      }
      CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 64));
    }
  }
}

- (void)cacheInsertStatement:(void *)result
{
  if (result)
  {
    v3 = result;
    result = (void *)result[2];
    if (result != a2)
    {
      -[NSSQLiteStatement clearCaches:](result, 1);

      result = a2;
      v3[2] = result;
    }
  }
  return result;
}

- (void)dealloc
{
  -[NSSQLiteStatementCache clearCachedStatements]((uint64_t)self);

  correlationInsertCache = self->_correlationInsertCache;
  if (correlationInsertCache) {
    CFRelease(correlationInsertCache);
  }
  correlationMasterReorderCache = self->_correlationMasterReorderCache;
  if (correlationMasterReorderCache) {
    CFRelease(correlationMasterReorderCache);
  }
  correlationMasterReorderCachePart2 = self->_correlationMasterReorderCachePart2;
  if (correlationMasterReorderCachePart2) {
    CFRelease(correlationMasterReorderCachePart2);
  }
  correlationReorderCache = self->_correlationReorderCache;
  if (correlationReorderCache) {
    CFRelease(correlationReorderCache);
  }
  correlationDeleteCache = self->_correlationDeleteCache;
  if (correlationDeleteCache) {
    CFRelease(correlationDeleteCache);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSSQLiteStatementCache;
  [(NSSQLiteStatementCache *)&v8 dealloc];
}

- (void)clearCachedStatements
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[NSSQLiteStatementCache _clearSaveGeneratedCachedStatements](a1);
    if (*(void *)(a1 + 40)) {
      -[NSSQLiteStatementCache cacheFaultingStatement:]((void *)a1, 0);
    }
    v2 = *(void **)(a1 + 48);
    if (v2)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v10;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v10 != v5) {
              objc_enumerationMutation(v2);
            }
            uint64_t v7 = (void *)[*(id *)(a1 + 48) objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v6)];
            objc_super v8 = (void *)[v7 count];
            if (v8) {
              objc_super v8 = (void *)[v7 objectAtIndex:0];
            }
            -[NSSQLiteStatement clearCaches:](v8, 1);
            ++v6;
          }
          while (v4 != v6);
          uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v4);
      }
      [*(id *)(a1 + 48) removeAllObjects];
    }
  }
}

- (void)cacheFaultingStatement:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = (void *)result[5];
    if (result != a2)
    {
      -[NSSQLiteStatement clearCaches:](result, 1);

      result = a2;
      v3[5] = result;
    }
  }
  return result;
}

- (void)cacheDeletionStatement:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = (void *)result[4];
    if (result != a2)
    {
      -[NSSQLiteStatement clearCaches:](result, 1);

      result = a2;
      v3[4] = result;
    }
  }
  return result;
}

- (void)cacheBatchInsertStatement:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = (void *)result[3];
    if (result != a2)
    {
      -[NSSQLiteStatement clearCaches:](result, 1);

      result = a2;
      v3[3] = result;
    }
  }
  return result;
}

- (CFMutableDictionaryRef)createCorrelationCacheDictionary
{
  if (result)
  {
    keyCallBacks.version = *MEMORY[0x1E4F1D530];
    *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x1E4F1D530] + 8);
    v1 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D530] + 24);
    keyCallBacks.equal = 0;
    keyCallBacks.hash = 0;
    keyCallBacks.copyDescription = v1;
    valueCallBacks.version = *MEMORY[0x1E4F1D540];
    *(_OWORD *)&valueCallBacks.retain = *(_OWORD *)(MEMORY[0x1E4F1D540] + 8);
    valueCallBacks.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E4F1D540] + 24);
    valueCallBacks.equal = 0;
    return CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &keyCallBacks, &valueCallBacks);
  }
  return result;
}

- (void)insertOrReplaceStatement:(void *)key forRelationship:(CFDictionaryRef)theDict inDictionary:
{
  if (a1)
  {
    Value = (void *)CFDictionaryGetValue(theDict, key);
    if (Value) {
      -[NSSQLiteStatement clearCaches:](Value, 1);
    }
    CFDictionarySetValue(theDict, key, a2);
  }
}

- (void)cacheCorrelationInsertStatement:(void *)key forRelationship:
{
  if (a1)
  {
    CFDictionaryRef v6 = (const __CFDictionary *)*((void *)a1 + 7);
    if (!v6)
    {
      CFDictionaryRef v6 = -[NSSQLiteStatementCache createCorrelationCacheDictionary](a1);
      *((void *)a1 + 7) = v6;
    }
    -[NSSQLiteStatementCache insertOrReplaceStatement:forRelationship:inDictionary:]((uint64_t)a1, a2, key, v6);
  }
}

- (void)cacheCorrelationMasterReorderStatement:(void *)key forRelationship:
{
  if (a1)
  {
    CFDictionaryRef v6 = (const __CFDictionary *)*((void *)a1 + 9);
    if (!v6)
    {
      CFDictionaryRef v6 = -[NSSQLiteStatementCache createCorrelationCacheDictionary](a1);
      *((void *)a1 + 9) = v6;
    }
    -[NSSQLiteStatementCache insertOrReplaceStatement:forRelationship:inDictionary:]((uint64_t)a1, a2, key, v6);
  }
}

- (void)cacheCorrelationReorderStatement:(void *)key forRelationship:
{
  if (a1)
  {
    CFDictionaryRef v6 = (const __CFDictionary *)*((void *)a1 + 11);
    if (!v6)
    {
      CFDictionaryRef v6 = -[NSSQLiteStatementCache createCorrelationCacheDictionary](a1);
      *((void *)a1 + 11) = v6;
    }
    -[NSSQLiteStatementCache insertOrReplaceStatement:forRelationship:inDictionary:]((uint64_t)a1, a2, key, v6);
  }
}

- (void)cacheCorrelationDeleteStatement:(void *)key forRelationship:
{
  if (a1)
  {
    CFDictionaryRef v6 = (const __CFDictionary *)*((void *)a1 + 8);
    if (!v6)
    {
      CFDictionaryRef v6 = -[NSSQLiteStatementCache createCorrelationCacheDictionary](a1);
      *((void *)a1 + 8) = v6;
    }
    -[NSSQLiteStatementCache insertOrReplaceStatement:forRelationship:inDictionary:]((uint64_t)a1, a2, key, v6);
  }
}

@end