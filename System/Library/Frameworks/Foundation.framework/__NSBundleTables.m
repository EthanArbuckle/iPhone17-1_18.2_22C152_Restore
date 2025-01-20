@interface __NSBundleTables
+ (id)bundleTables;
- (__NSBundleTables)init;
- (id)_addBundleLocked:(uint64_t)a3 forPath:(uint64_t)a4 withType:(uint64_t)a5 forClass:(int)a6 isImmortal:;
- (id)addBundle:(uint64_t)a3 forPath:(uint64_t)a4 withType:(uint64_t)a5 forClass:(int)a6 isImmortal:;
- (id)addBundleIfNeeded:(uint64_t)a3 forPath:(uint64_t)a4 withType:(int)a5 isImmortal:;
- (id)bundleForClass:(id *)result;
- (id)bundleForPath:(id *)result;
- (uint64_t)addStaticFrameworkBundles:(uint64_t)result;
- (uint64_t)allBundles;
- (uint64_t)allFrameworks;
- (uint64_t)loadedBundles;
- (uint64_t)removeBundle:(uint64_t)a3 forPath:(uint64_t)a4 type:;
- (void)dealloc;
@end

@implementation __NSBundleTables

+ (id)bundleTables
{
  self;
  if (qword_1EB1ED630 != -1) {
    dispatch_once(&qword_1EB1ED630, &__block_literal_global_37);
  }
  id v0 = (id)_MergedGlobals_113;

  return v0;
}

- (id)bundleForPath:(id *)result
{
  if (result)
  {
    v3 = result;
    [result[1] lock];
    id v4 = (id)[v3[5] objectForKey:a2];
    [v3[1] unlock];
    return (id *)v4;
  }
  return result;
}

- (id)bundleForClass:(id *)result
{
  if (result)
  {
    v3 = result;
    [result[1] lock];
    id v4 = (id)[v3[6] objectForKey:a2];
    [v3[1] unlock];
    return (id *)v4;
  }
  return result;
}

- (id)addBundle:(uint64_t)a3 forPath:(uint64_t)a4 withType:(uint64_t)a5 forClass:(int)a6 isImmortal:
{
  if (result)
  {
    v11 = result;
    [result[1] lock];
    v12 = -[__NSBundleTables _addBundleLocked:forPath:withType:forClass:isImmortal:](v11, a2, a3, a4, a5, a6);
    [v11[1] unlock];
    return v12;
  }
  return result;
}

- (id)_addBundleLocked:(uint64_t)a3 forPath:(uint64_t)a4 withType:(uint64_t)a5 forClass:(int)a6 isImmortal:
{
  if (result)
  {
    v10 = result;
    *((void *)&v11 + 1) = a4;
    *(void *)&long long v11 = a4 - 0x10000;
    switch((unint64_t)(v11 >> 16))
    {
      case 0uLL:
      case 3uLL:
        v13 = result + 4;
        id v12 = result[4];
        goto LABEL_6;
      case 1uLL:
        v13 = result + 3;
        id v12 = result[3];
        goto LABEL_6;
      case 2uLL:
        v13 = result + 2;
        id v12 = result[2];
LABEL_6:
        if (([v12 containsObject:a2] & 1) == 0)
        {
          id v14 = a2;
          [*v13 addObject:a2];
        }
        break;
      default:
        break;
    }
    if (a3)
    {
      result = (id *)[v10[5] objectForKey:a3];
      if (result)
      {
        if (!a5) {
          goto LABEL_11;
        }
        goto LABEL_15;
      }
      id v15 = a2;
      [v10[5] setObject:a2 forKey:a3];
    }
    result = 0;
    if (!a5)
    {
LABEL_11:
      if (result) {
        return result;
      }
      goto LABEL_17;
    }
LABEL_15:
    result = (id *)[v10[6] objectForKey:a5];
    if (result) {
      return result;
    }
    id v16 = a2;
    [v10[6] setObject:a2 forKey:a5];
    result = 0;
LABEL_17:
    if (a6)
    {
      [v10[7] addPointer:a2];
      return 0;
    }
  }
  return result;
}

- (id)addBundleIfNeeded:(uint64_t)a3 forPath:(uint64_t)a4 withType:(int)a5 isImmortal:
{
  if (result)
  {
    v9 = result;
    [result[1] lock];
    id v10 = (id)[v9[5] objectForKey:a3];
    if (v10)
    {
      long long v11 = v10;
      [v9[1] unlock];
      return (id *)v11;
    }
    else
    {
      id v12 = -[__NSBundleTables _addBundleLocked:forPath:withType:forClass:isImmortal:](v9, a2, a3, a4, 0, a5);
      [v9[1] unlock];
      return v12;
    }
  }
  return result;
}

- (uint64_t)removeBundle:(uint64_t)a3 forPath:(uint64_t)a4 type:
{
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  [*(id *)(result + 8) lock];
  if (a3 && [*(id *)(v7 + 40) objectForKey:a3])
  {
    [*(id *)(v7 + 40) removeObjectForKey:a3];
  }
  switch(a4)
  {
    case 0x10000:
      goto LABEL_8;
    case 0x40000:
      v8 = (id *)(v7 + 32);
      if (![*(id *)(v7 + 32) containsObject:a2]) {
        break;
      }
      goto LABEL_9;
    case 0x20000:
LABEL_8:
      v8 = (id *)(v7 + 24);
      if ([*(id *)(v7 + 24) containsObject:a2])
      {
LABEL_9:
        [*v8 removeObject:a2];
      }
      break;
  }
  v9 = *(void **)(v7 + 8);

  return [v9 unlock];
}

- (__NSBundleTables)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)__NSBundleTables;
  v2 = [(__NSBundleTables *)&v4 init];
  v2->_immortalBundles = [[NSPointerArray alloc] initWithOptions:258];
  v2->_lock = (NSLock *)objc_opt_new();
  v2->_staticFrameworks = [[NSHashTable alloc] initWithOptions:5 capacity:0];
  v2->_loadedBundles = [[NSHashTable alloc] initWithOptions:5 capacity:0];
  v2->_loadedFrameworks = [[NSHashTable alloc] initWithOptions:5 capacity:0];
  v2->_resolvedPathToBundles = [[NSMapTable alloc] initWithKeyOptions:0 valueOptions:5 capacity:0];
  v2->_bundleForClassMap = [[NSMapTable alloc] initWithKeyOptions:256 valueOptions:5 capacity:0];
  return v2;
}

- (uint64_t)allBundles
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = +[NSHashTable hashTableWithOptions:0];
    v3 = +[NSBundle mainBundle];
    if (v3) {
      [(NSHashTable *)v2 addObject:v3];
    }
    [*(id *)(v1 + 8) lock];
    [(NSHashTable *)v2 unionHashTable:*(void *)(v1 + 24)];
    [*(id *)(v1 + 8) unlock];
    return (uint64_t)[(NSHashTable *)v2 allObjects];
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)__NSBundleTables;
  [(__NSBundleTables *)&v3 dealloc];
}

- (uint64_t)addStaticFrameworkBundles:(uint64_t)result
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = +[NSBundle mainBundle];
    uint64_t v5 = +[NSHashTable hashTableWithOptions:0];
    [*(id *)(v3 + 8) lock];
    [(NSHashTable *)v5 unionHashTable:*(void *)(v3 + 24)];
    [(NSHashTable *)v5 unionHashTable:*(void *)(v3 + 32)];
    [(NSHashTable *)v5 unionHashTable:*(void *)(v3 + 16)];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [a2 countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(a2);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (![(NSHashTable *)v5 containsObject:v10])
          {
            objc_msgSend(v10, "__static");
            [*(id *)(v3 + 16) addObject:v10];
          }
        }
        uint64_t v7 = [a2 countByEnumeratingWithState:&v12 objects:v11 count:16];
      }
      while (v7);
    }
    if (v4) {
      [*(id *)(v3 + 24) removeObject:v4];
    }
    return [*(id *)(v3 + 8) unlock];
  }
  return result;
}

- (uint64_t)allFrameworks
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = +[NSHashTable hashTableWithOptions:0];
    [*(id *)(v1 + 8) lock];
    [(NSHashTable *)v2 unionHashTable:*(void *)(v1 + 16)];
    [(NSHashTable *)v2 unionHashTable:*(void *)(v1 + 32)];
    [(NSHashTable *)v2 minusHashTable:*(void *)(v1 + 24)];
    [*(id *)(v1 + 8) unlock];
    return (uint64_t)[(NSHashTable *)v2 allObjects];
  }
  return result;
}

- (uint64_t)loadedBundles
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = +[NSHashTable hashTableWithOptions:0];
    uint64_t v3 = +[NSBundle mainBundle];
    if (v3) {
      [(NSHashTable *)v2 addObject:v3];
    }
    [*(id *)(v1 + 8) lock];
    [(NSHashTable *)v2 unionHashTable:*(void *)(v1 + 24)];
    [(NSHashTable *)v2 unionHashTable:*(void *)(v1 + 16)];
    [(NSHashTable *)v2 unionHashTable:*(void *)(v1 + 32)];
    [*(id *)(v1 + 8) unlock];
    return (uint64_t)[(NSHashTable *)v2 allObjects];
  }
  return result;
}

@end