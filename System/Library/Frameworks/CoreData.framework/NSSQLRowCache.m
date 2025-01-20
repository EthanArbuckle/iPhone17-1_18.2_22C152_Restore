@interface NSSQLRowCache
+ (void)initialize;
- (NSSQLRowCache)initWithPersistentStore:(id)a3;
- (id)sqlCore;
- (void)dealloc;
@end

@implementation NSSQLRowCache

- (NSSQLRowCache)initWithPersistentStore:(id)a3
{
  v6[0] = 0;
  v6[1] = _PFfastRowRetain;
  v6[2] = _PFfastRowRelease;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1D540] + 24);
  v5.receiver = self;
  v5.super_class = (Class)NSSQLRowCache;
  result = [(NSPersistentStoreCache *)&v5 initWithValueCallbacks:v6 preserveToManyRelationships:1];
  if (result) {
    result->_sqlCore = (NSSQLCore *)a3;
  }
  return result;
}

- (void)dealloc
{
  if (self->_sqlCore)
  {
    self->_sqlCore = 0;
    CFDictionaryRef externalData = (const __CFDictionary *)self->super._externalData;
    unint64_t Count = CFDictionaryGetCount(externalData);
    objc_super v5 = 0;
    v6 = 0;
    if (Count >= 0x12C)
    {
      unint64_t v7 = Count;
      v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        v8 = malloc_default_zone();
      }
      v9 = (const void **)malloc_type_zone_malloc(v8, 8 * v7, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(externalData, 0, v9);
      v10 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        v10 = malloc_default_zone();
      }
      objc_super v5 = malloc_type_zone_malloc(v10, 0x20uLL, 0x100004000313F17uLL);
      *objc_super v5 = v9;
      v5[1] = v7;
      v5[2] = 0;
      v6 = [[_PFTask alloc] initWithFunction:_deallocateSQLRowCacheOnBackgroundThread withArgument:v5 andPriority:0];
      do
      {
        v11 = *v9++;
        v11[4] |= 2u;
        --v7;
      }
      while (v7);
    }
    v13.receiver = self;
    v13.super_class = (Class)NSSQLRowCache;
    [(NSPersistentStoreCache *)&v13 dealloc];
    if (v6)
    {
      pthread_mutex_lock(&v6->lock);
      v5[2] = 1;
      pthread_cond_broadcast(&v6->condition);
      pthread_mutex_unlock(&v6->lock);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NSSQLRowCache;
    [(NSPersistentStoreCache *)&v12 dealloc];
  }
}

+ (void)initialize
{
}

- (id)sqlCore
{
  return self->_sqlCore;
}

@end