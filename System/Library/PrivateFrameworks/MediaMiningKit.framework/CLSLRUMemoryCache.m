@interface CLSLRUMemoryCache
- (BOOL)loadFromURL:(id)a3;
- (BOOL)writeToURL:(id)a3;
- (CLSLRUMemoryCache)init;
- (id)allKeys;
- (id)objectForKey:(id)a3;
- (unint64_t)currentUsedSlots;
- (unint64_t)numberOfSlots;
- (void)_promoteListElement:(_CLSLRUMemoryCacheListElement *)a3;
- (void)_removeListElement:(_CLSLRUMemoryCacheListElement *)a3;
- (void)dealloc;
- (void)evictSlots:(unint64_t)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setNumberOfSlots:(unint64_t)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation CLSLRUMemoryCache

- (unint64_t)numberOfSlots
{
  return self->_numberOfSlots;
}

- (BOOL)writeToURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_recursiveLock lock];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setObject:self->_cacheDictionary forKey:@"CLSLRUMemoryCacheSaveMemoryKey"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (i = self->_leastRecentUsedList->var1; i; i = i->var1)
    [v6 addObject:i->var0];
  [v5 setObject:v6 forKey:@"CLSLRUMemoryCacheSaveLeastRecentUsedKey"];

  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", objc_msgSend(MEMORY[0x1E4F28CB8], "temporaryFilePathWithExtension:", @"tmp"));
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initWithURL:v9 append:0];
  id v17 = 0;
  [v10 open];
  if (![MEMORY[0x1E4F28F98] writePropertyList:v5 toStream:v10 format:200 options:0 error:&v17])
  {
    v12 = objc_msgSend(+[CLSLogging sharedLogging](CLSLogging, "sharedLogging"), "loggingConnection");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v17 localizedDescription];
      *(_DWORD *)buf = 138412802;
      id v19 = a3;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      _os_log_error_impl(&dword_1D2150000, v12, OS_LOG_TYPE_ERROR, "Failed to save cache to \"%@\" (\"%@\"): \"%@\"", buf, 0x20u);
    }
    [v10 close];

    goto LABEL_11;
  }
  [v10 close];

  [v8 removeItemAtURL:a3 error:0];
  if (([v8 moveItemAtURL:v9 toURL:a3 error:&v17] & 1) == 0)
  {
    v13 = objc_msgSend(+[CLSLogging sharedLogging](CLSLogging, "sharedLogging"), "loggingConnection");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v17 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v19 = a3;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      _os_log_error_impl(&dword_1D2150000, v13, OS_LOG_TYPE_ERROR, "Failed to save cache to \"%@\": \"%@\"", buf, 0x16u);
    }
LABEL_11:
    [v8 removeItemAtURL:v9 error:0];
    BOOL v11 = 0;
    goto LABEL_12;
  }
  BOOL v11 = 1;
LABEL_12:

  [(NSRecursiveLock *)self->_recursiveLock unlock];
  return v11;
}

- (BOOL)loadFromURL:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D2602300](self, a2);
  [(CLSLRUMemoryCache *)self removeAllObjects];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:a3];
  id v35 = 0;
  [v5 open];
  id v6 = (void *)[MEMORY[0x1E4F28F98] propertyListWithStream:v5 options:0 format:0 error:&v35];
  [v5 close];

  if (v6)
  {
    v7 = (void *)[v6 objectForKey:@"CLSLRUMemoryCacheSaveMemoryKey"];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          -[NSMapTable setObject:forKey:](self->_cacheDictionary, "setObject:forKey:", [v7 objectForKey:*(void *)(*((void *)&v31 + 1) + 8 * i)], *(void *)(*((void *)&v31 + 1) + 8 * i));
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v9);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v12 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"CLSLRUMemoryCacheSaveLeastRecentUsedKey"), "reverseObjectEnumerator");
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          v18 = (_CLSLRUMemoryCacheListElement *)malloc_type_malloc(0x18uLL, 0xA00409BE6959DuLL);
          v18->var0 = v17;
          v18->var1 = self->_leastRecentUsedList->var1;
          v18->var2 = 0;
          leastRecentUsedList = self->_leastRecentUsedList;
          var1 = leastRecentUsedList->var1;
          if (var1)
          {
            var1->var2 = v18;
            leastRecentUsedList = self->_leastRecentUsedList;
          }
          leastRecentUsedList->var1 = v18;
          uint64_t v21 = self->_leastRecentUsedList;
          if (!v21->var0++) {
            v21->var2 = v18;
          }
          -[NSMapTable setObject:forKey:](self->_leastRecentUsedDictionary, "setObject:forKey:", [MEMORY[0x1E4F29238] valueWithPointer:v18], v17);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v14);
    }
  }
  else
  {
    uint64_t v23 = objc_msgSend(+[CLSLogging sharedLogging](CLSLogging, "sharedLogging"), "loggingConnection");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [v35 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v39 = a3;
      __int16 v40 = 2112;
      uint64_t v41 = v25;
      _os_log_error_impl(&dword_1D2150000, v23, OS_LOG_TYPE_ERROR, "Failed to load cache from \"%@\": \"%@\"", buf, 0x16u);
    }
  }
  return v6 != 0;
}

- (void)evictSlots:(unint64_t)a3
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  for (; a3; --a3)
  {
    var2 = self->_leastRecentUsedList->var2;
    if (var2)
    {
      [(NSMapTable *)self->_cacheDictionary removeObjectForKey:var2->var0];
      [(CLSLRUMemoryCache *)self _removeListElement:self->_leastRecentUsedList->var2];
    }
  }
  recursiveLock = self->_recursiveLock;
  [(NSRecursiveLock *)recursiveLock unlock];
}

- (void)removeAllObjects
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  [(NSMapTable *)self->_leastRecentUsedDictionary removeAllObjects];
  leastRecentUsedList = self->_leastRecentUsedList;
  var1 = leastRecentUsedList->var1;
  if (var1)
  {
    do
    {
      id v5 = var1->var1;
      if (var1->var0) {

      }
      free(var1);
      var1 = v5;
    }
    while (v5);
    leastRecentUsedList = self->_leastRecentUsedList;
  }
  leastRecentUsedList->var0 = 0;
  leastRecentUsedList->var1 = 0;
  self->_leastRecentUsedList->var2 = 0;
  [(NSMapTable *)self->_cacheDictionary removeAllObjects];
  recursiveLock = self->_recursiveLock;
  [(NSRecursiveLock *)recursiveLock unlock];
}

- (void)removeObjectForKey:(id)a3
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  id v5 = [(NSMapTable *)self->_leastRecentUsedDictionary objectForKey:a3];
  if (v5) {
    -[CLSLRUMemoryCache _removeListElement:](self, "_removeListElement:", [v5 pointerValue]);
  }
  [(NSMapTable *)self->_cacheDictionary removeObjectForKey:a3];
  recursiveLock = self->_recursiveLock;
  [(NSRecursiveLock *)recursiveLock unlock];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (self->_numberOfSlots)
  {
    [(NSRecursiveLock *)self->_recursiveLock lock];
    id v7 = [(NSMapTable *)self->_leastRecentUsedDictionary objectForKey:a4];
    if (v7)
    {
      -[CLSLRUMemoryCache _promoteListElement:](self, "_promoteListElement:", [v7 pointerValue]);
    }
    else
    {
      uint64_t v8 = (_CLSLRUMemoryCacheListElement *)malloc_type_malloc(0x18uLL, 0xA00409BE6959DuLL);
      id v9 = a4;
      var1 = self->_leastRecentUsedList->var1;
      v8->var0 = v9;
      v8->var1 = var1;
      v8->var2 = 0;
      leastRecentUsedList = self->_leastRecentUsedList;
      v12 = leastRecentUsedList->var1;
      if (v12)
      {
        v12->var2 = v8;
        leastRecentUsedList = self->_leastRecentUsedList;
      }
      leastRecentUsedList->var1 = v8;
      uint64_t v13 = self->_leastRecentUsedList;
      if (!v13->var0++) {
        v13->var2 = v8;
      }
      -[NSMapTable setObject:forKey:](self->_leastRecentUsedDictionary, "setObject:forKey:", [MEMORY[0x1E4F29238] valueWithPointer:v8], a4);
    }
    uint64_t v15 = self->_leastRecentUsedList;
    if (v15->var0 > self->_numberOfSlots)
    {
      var2 = v15->var2;
      if (var2)
      {
        [(NSMapTable *)self->_cacheDictionary removeObjectForKey:var2->var0];
        [(CLSLRUMemoryCache *)self _removeListElement:self->_leastRecentUsedList->var2];
      }
    }
    [(NSMapTable *)self->_cacheDictionary setObject:a3 forKey:a4];
    recursiveLock = self->_recursiveLock;
    [(NSRecursiveLock *)recursiveLock unlock];
  }
}

- (id)allKeys
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  cacheDictionary = self->_cacheDictionary;
  if (cacheDictionary) {
    v4 = (void *)[(NSArray *)NSAllMapTableKeys(cacheDictionary) copy];
  }
  else {
    v4 = 0;
  }
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  return v4;
}

- (id)objectForKey:(id)a3
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  id v5 = [(NSMapTable *)self->_cacheDictionary objectForKey:a3];
  if (v5)
  {
    id v6 = [(NSMapTable *)self->_leastRecentUsedDictionary objectForKey:a3];
    if (v6) {
      -[CLSLRUMemoryCache _promoteListElement:](self, "_promoteListElement:", [v6 pointerValue]);
    }
  }
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  return v5;
}

- (unint64_t)currentUsedSlots
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  recursiveLock = self->_recursiveLock;
  unint64_t var0 = self->_leastRecentUsedList->var0;
  [(NSRecursiveLock *)recursiveLock unlock];
  return var0;
}

- (void)setNumberOfSlots:(unint64_t)a3
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (self->_numberOfSlots > a3)
  {
LABEL_2:
    leastRecentUsedList = self->_leastRecentUsedList;
    while (leastRecentUsedList->var0 > a3)
    {
      var2 = leastRecentUsedList->var2;
      if (var2)
      {
        [(NSMapTable *)self->_cacheDictionary removeObjectForKey:var2->var0];
        [(CLSLRUMemoryCache *)self _removeListElement:self->_leastRecentUsedList->var2];
        goto LABEL_2;
      }
    }
  }
  self->_numberOfSlots = a3;
  recursiveLock = self->_recursiveLock;
  [(NSRecursiveLock *)recursiveLock unlock];
}

- (void)_removeListElement:(_CLSLRUMemoryCacheListElement *)a3
{
  var1 = a3->var1;
  var2 = a3->var2;
  if (var2)
  {
    var2->var1 = var1;
    leastRecentUsedList = self->_leastRecentUsedList;
    if (leastRecentUsedList->var1 == a3) {
      leastRecentUsedList->var1 = 0;
    }
  }
  else
  {
    self->_leastRecentUsedList->var1 = var1;
  }
  uint64_t v8 = a3->var1;
  if (v8)
  {
    v8->var2 = var2;
    id v9 = self->_leastRecentUsedList;
    if (v9->var2 == a3) {
      v9->var2 = 0;
    }
  }
  else
  {
    self->_leastRecentUsedList->var2 = var2;
  }
  [(NSMapTable *)self->_leastRecentUsedDictionary removeObjectForKey:a3->var0];
  if (a3->var0) {

  }
  free(a3);
  --self->_leastRecentUsedList->var0;
}

- (void)_promoteListElement:(_CLSLRUMemoryCacheListElement *)a3
{
  leastRecentUsedList = self->_leastRecentUsedList;
  if (leastRecentUsedList->var0 < 2) {
    return;
  }
  var1 = a3->var1;
  var2 = a3->var2;
  if (!var2)
  {
    leastRecentUsedList->var1 = var1;
    if (var1) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  var2->var1 = var1;
  var1 = a3->var1;
  if (!var1) {
LABEL_4:
  }
    var1 = (_CLSLRUMemoryCacheListElement *)self->_leastRecentUsedList;
LABEL_5:
  var1->var2 = var2;
  a3->var1 = self->_leastRecentUsedList->var1;
  a3->var2 = 0;
  id v6 = self->_leastRecentUsedList;
  id v7 = v6->var1;
  if (v7)
  {
    v7->var2 = a3;
    id v6 = self->_leastRecentUsedList;
  }
  v6->var1 = a3;
}

- (void)dealloc
{
  recursiveLock = self->_recursiveLock;
  if (recursiveLock)
  {

    self->_recursiveLock = 0;
  }
  cacheDictionary = self->_cacheDictionary;
  if (cacheDictionary)
  {

    self->_cacheDictionary = 0;
  }
  leastRecentUsedList = self->_leastRecentUsedList;
  var1 = leastRecentUsedList->var1;
  if (var1)
  {
    do
    {
      id v7 = var1->var1;
      if (var1->var0) {

      }
      free(var1);
      var1 = v7;
    }
    while (v7);
    leastRecentUsedList = self->_leastRecentUsedList;
  }
  leastRecentUsedList->unint64_t var0 = 0;
  leastRecentUsedList->var1 = 0;
  self->_leastRecentUsedList->var2 = 0;
  uint64_t v8 = self->_leastRecentUsedList;
  if (v8)
  {
    free(v8);
    self->_leastRecentUsedList = 0;
  }
  leastRecentUsedDictionary = self->_leastRecentUsedDictionary;
  if (leastRecentUsedDictionary)
  {

    self->_leastRecentUsedDictionary = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)CLSLRUMemoryCache;
  [(CLSLRUMemoryCache *)&v10 dealloc];
}

- (CLSLRUMemoryCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLSLRUMemoryCache;
  v2 = [(CLSLRUMemoryCache *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_numberOfSlots = 128;
    v2->_cacheDictionary = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:128];
    v3->_recursiveLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v4 = (_CLSLRUMemoryCacheList *)malloc_type_malloc(0x18uLL, 0x102004023CB03E4uLL);
    v3->_leastRecentUsedList = v4;
    v4->unint64_t var0 = 0;
    v4->var1 = 0;
    v3->_leastRecentUsedList->var2 = 0;
    v3->_leastRecentUsedDictionary = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:128];
  }
  return v3;
}

@end