@interface NSPersistentCacheRow
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSPersistentCacheRow)initWithOptions:(unsigned int)a3 andTimestamp:(double)a4;
- (NSPersistentCacheRow)retain;
- (const)knownKeyValuesPointer;
- (double)timestampForProperty:(uint64_t)a1;
- (id)objectID;
- (uint64_t)ancillaryOrderKeysForProperty:(uint64_t)result;
- (unint64_t)retainCount;
- (unint64_t)version;
- (void)_initializeRelationshipCaches;
- (void)copyRelationshipCachesFrom:(void *)result;
- (void)dealloc;
- (void)release;
- (void)setAncillaryOrderKeys:(void *)a3 forProperty:options:andTimestamp:;
- (void)setRelatedObjectIDs:(void *)a1 forProperty:(void *)a2 options:(void *)a3 andTimestamp:(double)a4;
- (void)toManyOffsetForProperty:(void *)result;
- (void)updateMissingRelationshipCachesFromOriginal:(void *)result;
@end

@implementation NSPersistentCacheRow

- (void)copyRelationshipCachesFrom:(void *)result
{
  if (result)
  {
    v3 = *(void **)(a2 + 24);
    if (v3)
    {
      v4 = result;
      v5 = (void *)result[3];
      if (v3 != v5)
      {
        if (!v5)
        {
          result = -[NSPersistentCacheRow _initializeRelationshipCaches](result);
          v5 = (void *)v4[3];
          v3 = *(void **)(a2 + 24);
        }
        if ((void *)*v5 != v5)
        {
          uint64_t v6 = 2;
          do
          {
            v5[v6 - 2] = v3[v6 - 2];
            v7 = (void *)v5[v6 - 1];
            if (v7 != (void *)v3[v6 - 1])
            {

              result = (id)v3[v6 - 1];
              v5[v6 - 1] = result;
            }
            v8 = (void *)v5[v6];
            if (v8 != (void *)v3[v6])
            {

              result = (id)v3[v6];
              v5[v6] = result;
            }
            v9 = (void *)v5[v6 + 1];
            v6 += 3;
          }
          while (v9 != v5);
        }
      }
    }
  }
  return result;
}

- (NSPersistentCacheRow)retain
{
  return self;
}

- (const)knownKeyValuesPointer
{
  return 0;
}

- (NSPersistentCacheRow)initWithOptions:(unsigned int)a3 andTimestamp:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NSPersistentCacheRow;
  result = [(NSPersistentCacheRow *)&v6 init];
  if (result)
  {
    result->_birth = a4;
    result->_toManyMap = 0;
  }
  return result;
}

- (void)release
{
  if ((int)atomic_fetch_add_explicit(&self->_cd_rc, 0xFFFFFFFF, memory_order_relaxed) <= 0)
  {
    atomic_fetch_add_explicit(&self->_cd_rc, 0x20000000u, memory_order_relaxed);
    [(NSPersistentCacheRow *)self dealloc];
  }
}

- (void)setAncillaryOrderKeys:(void *)a3 forProperty:options:andTimestamp:
{
  if (!a1) {
    return;
  }
  v4 = a2;
  if (a1[3])
  {
    if (a2) {
      goto LABEL_4;
    }
  }
  else
  {
    -[NSPersistentCacheRow _initializeRelationshipCaches](a1);
    if (v4)
    {
LABEL_4:
      if (![v4 count]) {
        v4 = NSArray_EmptyArray;
      }
    }
  }
  uint64_t v6 = *(void *)(objc_msgSend((id)objc_msgSend(a3, "entity"), "_propertyRangesByType") + 144);
  uint64_t v7 = 3 * ([a3 _entitysReferenceID] - v6) + 2;
  if (*(void **)(a1[3] + 8 * v7) != v4)
  {
    id v8 = *(id *)(a1[3] + 8 * v7);
    *(void *)(a1[3] + 8 * v7) = v4;
  }
}

- (void)_initializeRelationshipCaches
{
  if (result)
  {
    v1 = result + 3;
    if (!result[3])
    {
      result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "objectID"), "entity"), "_propertyRangesByType");
      uint64_t v2 = result[19];
      if (v2)
      {
        uint64_t v3 = 3 * v2;
        result = PF_CALLOC_OBJECT_ARRAY(3 * v2 + 1);
        void *v1 = result;
        result[v3] = result;
      }
      else
      {
        void *v1 = v1;
      }
    }
  }
  return result;
}

- (void)setRelatedObjectIDs:(void *)a1 forProperty:(void *)a2 options:(void *)a3 andTimestamp:(double)a4
{
  if (!a1) {
    return;
  }
  uint64_t v6 = a2;
  if (a1[3])
  {
    if (a2) {
      goto LABEL_4;
    }
  }
  else
  {
    -[NSPersistentCacheRow _initializeRelationshipCaches](a1);
    if (v6)
    {
LABEL_4:
      if (![v6 count]) {
        uint64_t v6 = NSArray_EmptyArray;
      }
    }
  }
  id v8 = -[NSPersistentCacheRow toManyOffsetForProperty:](a1, a3);
  uint64_t v9 = 3 * (void)v8;
  *(double *)(a1[3] + 24 * (void)v8) = a4;
  uint64_t v10 = 3 * (void)v8 + 1;
  v11 = *(void **)(a1[3] + 8 * v10);
  if (v11 != v6)
  {
    *(void *)(a1[3] + 8 * v10) = v6;

    uint64_t v12 = a1[3] + 8 * v9;
    v13 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = 0;
  }
}

- (double)timestampForProperty:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  if (!*(void *)(a1 + 24)) {
    return *(double *)&NSSQLDistantPastTimeInterval;
  }
  uint64_t v4 = *(void *)(objc_msgSend((id)objc_msgSend(a2, "entity"), "_propertyRangesByType") + 144);
  uint64_t v5 = [a2 _entitysReferenceID];
  double result = *(double *)&NSSQLDistantPastTimeInterval;
  if (*(void *)(*(void *)(a1 + 24) + 24 * (v5 - v4))) {
    return *(double *)(*(void *)(a1 + 24) + 24 * (v5 - v4));
  }
  return result;
}

- (void)toManyOffsetForProperty:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[a2 entity];
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "objectID"), "entity");
    uint64_t v6 = [a2 _entitysReferenceID];
    if (v4 == v5)
    {
      return (void *)(v6 - *(void *)([v4 _propertyRangesByType] + 144));
    }
    else
    {
      uint64_t v7 = *(void *)([v5 _propertyRangesByType] + 144);
      return (void *)(objc_msgSend(v5, "_offsetRelationshipIndex:fromSuperEntity:andIsToMany:", v6, v4, objc_msgSend(a2, "isToMany"))- v7);
    }
  }
  return result;
}

- (uint64_t)ancillaryOrderKeysForProperty:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 24))
    {
      uint64_t v4 = *(void *)(objc_msgSend((id)objc_msgSend(a2, "entity"), "_propertyRangesByType") + 144);
      return *(void *)(*(void *)(v2 + 24) + 24 * ([a2 _entitysReferenceID] - v4) + 16);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (void)dealloc
{
  toManyMap = self->_toManyMap;
  if (toManyMap)
  {
    self->_toManyMap = 0;
    if (*toManyMap != toManyMap)
    {
      uint64_t v4 = 0;
      do
      {
        uint64_t v5 = &toManyMap[v4];

        v4 += 3;
      }
      while (v5[3] != toManyMap);
      if (v4) {
        PF_FREE_OBJECT_ARRAY(toManyMap);
      }
    }
  }

  _PFDeallocateObject(self);
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

- (id)objectID
{
  return 0;
}

- (unint64_t)version
{
  return 0;
}

- (void)updateMissingRelationshipCachesFromOriginal:(void *)result
{
  if (result)
  {
    uint64_t v3 = *(void **)(a2 + 24);
    if (v3)
    {
      uint64_t v4 = result;
      uint64_t v5 = (void *)result[3];
      if (v3 != v5)
      {
        if (!v5)
        {
          double result = -[NSPersistentCacheRow _initializeRelationshipCaches](result);
          uint64_t v3 = *(void **)(a2 + 24);
        }
        uint64_t v6 = (void *)*v3;
        if ((void *)*v3 != v3)
        {
          uint64_t v7 = 0;
          do
          {
            uint64_t v8 = v4[3];
            if (!*(void *)(v8 + v7 * 8 + 8))
            {
              *(void *)(v8 + v7 * 8) = v6;
              *(void *)(v4[3] + v7 * 8 + 8) = (id)v3[v7 + 1];
              double result = (id)v3[v7 + 2];
              *(void *)(v4[3] + v7 * 8 + 16) = result;
            }
            uint64_t v6 = (void *)v3[v7 + 3];
            v7 += 3;
          }
          while (v6 != v3);
        }
      }
    }
  }
  return result;
}

@end