@interface AXIndexMap
- (AXIndexMap)init;
- (AXIndexMap)initWithCoder:(id)a3;
- (AXIndexMap)initWithObjects:(id *)a3 andIndexes:(unint64_t *)a4 count:(unint64_t)a5;
- (id)_initAndDeepCopyIndexMap:(id)a3;
- (id)_initWithIndexMap:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopyWithZone:(_NSZone *)a3;
- (id)description;
- (id)indexes;
- (id)objectForIndex:(unint64_t)a3;
- (unint64_t)_createIndexesWithSize:(unint64_t *)a3;
- (unint64_t)count;
- (void)addObjectsFromIndexMap:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForIndex:(unint64_t)a3;
- (void)setObject:(id)a3 forIndex:(unint64_t)a4;
@end

@implementation AXIndexMap

- (AXIndexMap)initWithObjects:(id *)a3 andIndexes:(unint64_t *)a4 count:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)AXIndexMap;
  v8 = [(AXIndexMap *)&v12 init];
  if (v8
    && (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]),
        (v8->_map = Mutable) != 0))
  {
    for (; a5; --a5)
    {
      if (*a3) {
        CFDictionarySetValue(v8->_map, (const void *)*a4, *a3);
      }
      ++a4;
      ++a3;
    }
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (AXIndexMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXIndexMap;
  v2 = [(AXIndexMap *)&v6 init];
  if (v2
    && (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]),
        (v2->_map = Mutable) != 0))
  {
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_initWithIndexMap:(id)a3
{
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXIndexMap;
  v5 = [(AXIndexMap *)&v11 init];
  if (v5
    && (CFDictionaryRef v6 = (const __CFDictionary *)v4[1],
        CFIndex Count = CFDictionaryGetCount(v6),
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, Count, v6),
        (v5->_map = MutableCopy) != 0))
  {
    v9 = v5;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_initAndDeepCopyIndexMap:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AXIndexMap;
  v5 = [(AXIndexMap *)&v16 init];
  if (v5
    && (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]),
        (v5->_map = Mutable) != 0))
  {
    unint64_t v15 = 0;
    uint64_t v7 = [v4 _createIndexesWithSize:&v15];
    if (v7)
    {
      v8 = (void *)v7;
      if (v15)
      {
        for (unint64_t i = 0; i < v15; ++i)
        {
          v10 = [v4 objectForIndex:v8[i]];
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v14 = AXLogCommon();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[AXIndexMap _initAndDeepCopyIndexMap:]((uint64_t)v10, v14);
            }

            abort();
          }
          objc_super v11 = (void *)[v10 copyWithZone:0];

          CFDictionarySetValue(v5->_map, (const void *)v8[i], v11);
        }
      }
      free(v8);
    }
    objc_super v12 = v5;
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[AXIndexMap allocWithZone:a3];
  return [(AXIndexMap *)v4 _initWithIndexMap:self];
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  id v4 = +[AXIndexMap allocWithZone:a3];
  return [(AXIndexMap *)v4 _initAndDeepCopyIndexMap:self];
}

- (AXIndexMap)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXIndexMap *)self init];
  if (v5)
  {
    CFDictionaryRef v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"indexes"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"values"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __28__AXIndexMap_initWithCoder___block_invoke;
    v10[3] = &unk_1E5672E28;
    objc_super v11 = v5;
    id v12 = v7;
    id v8 = v7;
    [v6 enumerateObjectsUsingBlock:v10];
  }
  return v5;
}

void __28__AXIndexMap_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v8 = [v5 objectAtIndex:a3];
  uint64_t v7 = [v6 unsignedLongValue];

  [v4 setObject:v8 forIndex:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = objc_opt_new();
  unint64_t v16 = 0;
  uint64_t v7 = [(AXIndexMap *)self _createIndexesWithSize:&v16];
  if (v16)
  {
    for (unint64_t i = 0; i < v16; ++i)
    {
      unint64_t v9 = v7[i];
      v10 = [(AXIndexMap *)self objectForIndex:v9];
      if ([v10 conformsToProtocol:&unk_1EDF6D7C8])
      {
        v14 = [NSNumber numberWithUnsignedLong:v9];
        [v5 addObject:v14];

        [v6 addObject:v10];
      }
      else if (!v10)
      {
        _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/DataStructures/AXIndexMap.m", (void *)0xA6, (uint64_t)"-[AXIndexMap encodeWithCoder:]", @"nil value for an index returned from _createIndexesWithSize, this should never happen", v11, v12, v13, v15);
      }
    }
  }
  [v4 encodeObject:v5 forKey:@"indexes"];
  [v4 encodeObject:v6 forKey:@"values"];
  free(v7);
}

- (void)dealloc
{
  map = self->_map;
  if (map)
  {
    CFRelease(map);
    self->_map = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXIndexMap;
  [(AXIndexMap *)&v4 dealloc];
}

- (void)setObject:(id)a3 forIndex:(unint64_t)a4
{
  if (a3) {
    CFDictionarySetValue(self->_map, (const void *)a4, a3);
  }
}

- (void)removeObjectForIndex:(unint64_t)a3
{
}

- (void)removeAllObjects
{
}

- (id)objectForIndex:(unint64_t)a3
{
  return (id)CFDictionaryGetValue(self->_map, (const void *)a3);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->_map);
}

- (unint64_t)_createIndexesWithSize:(unint64_t *)a3
{
  CFIndex Count = CFDictionaryGetCount(self->_map);
  if (a3) {
    *a3 = Count;
  }
  size_t v6 = 8 * Count;
  uint64_t v7 = (const void **)malloc_type_malloc(8 * Count, 0x4FB2C935uLL);
  id v8 = v7;
  if (v7)
  {
    bzero(v7, v6);
    CFDictionaryGetKeysAndValues(self->_map, v8, 0);
  }
  return (unint64_t *)v8;
}

- (id)indexes
{
  unint64_t v6 = 0;
  v2 = [(AXIndexMap *)self _createIndexesWithSize:&v6];
  v3 = (void *)[objc_allocWithZone(MEMORY[0x1E4F28E60]) init];
  if (v6)
  {
    for (unint64_t i = 0; i < v6; ++i)
      [v3 addIndex:v2[i]];
  }
  free(v2);
  return v3;
}

- (void)addObjectsFromIndexMap:(id)a3
{
  id v4 = a3;
  unint64_t v9 = 0;
  uint64_t v5 = [v4 _createIndexesWithSize:&v9];
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    if (v9)
    {
      for (unint64_t i = 0; i < v9; ++i)
      {
        id v8 = [v4 objectForIndex:v6[i]];
        [(AXIndexMap *)self setObject:v8 forIndex:v6[i]];
      }
    }
    free(v6);
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"AXIndexMap:\n"];
  unint64_t v13 = 0;
  id v4 = [(AXIndexMap *)self _createIndexesWithSize:&v13];
  if (v4)
  {
    uint64_t v5 = v4;
    if (v13)
    {
      for (unint64_t i = 0; i < v13; ++i)
      {
        id v7 = objc_allocWithZone(NSString);
        unint64_t v8 = v5[i];
        unint64_t v9 = [(AXIndexMap *)self objectForIndex:v8];
        v10 = (void *)[v7 initWithFormat:@"\t%lu (0x%lx) -> %@\n", v8, v8, v9];

        [v3 appendString:v10];
      }
    }
    free(v5);
    id v11 = v3;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_initAndDeepCopyIndexMap:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18FC6C000, a2, OS_LOG_TYPE_ERROR, "Trying to copy an object that can't be copied! %@", (uint8_t *)&v2, 0xCu);
}

@end