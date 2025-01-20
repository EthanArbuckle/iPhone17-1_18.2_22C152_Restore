@interface GEOTileKeyList
+ (id)formatOSLogData:(id)a3;
+ (id)listFromXPCData:(id)a3;
- (BOOL)containsKey:(uint64_t)a1;
- (BOOL)intersectsList:(id)a3;
- (BOOL)removeKey:(id *)a1;
- (GEOTileKeyList)init;
- (GEOTileKeyList)initWithCapacity:(unint64_t)a3;
- (GEOTileKeyList)initWithCapacity:(unint64_t)a3 maxCapacity:(unint64_t)a4;
- (GEOTileKeyList)initWithMaxCapacity:(unint64_t)a3;
- (GEOTileKeyList)listWithout:(id)a3;
- (id)copyWithMaxCapacity:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newXPCData;
- (id)sublistWithRange:(_NSRange)a3;
- (uint64_t)_addKeyToBack:(uint64_t *)a3;
- (uint64_t)addKey:(uint64_t *)a3 lostKey:(_OWORD *)a4;
- (uint64_t)addKey:(uint64_t)a3;
- (uint64_t)firstKey;
- (uint64_t)keyAtIndex:(unint64_t)a3;
- (unint64_t)capacity;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
- (void)removeKeysMatchingPredicate:(id)a3;
- (void)sort:(id)a3;
@end

@implementation GEOTileKeyList

- (void).cxx_destruct
{
}

- (BOOL)containsKey:(uint64_t)a1
{
  return objc_msgSend(*(id *)(a1 + 24), "objectForKey:") != 0;
}

- (BOOL)removeKey:(id *)a1
{
  v2 = objc_msgSend(a1[3], "objectForKey:");
  if (v2) {
    _remove(a1, v2);
  }
  return v2 != 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!self->_count || a3->var3[0] == 1) {
    return 0;
  }
  var0 = (void *)a3->var0;
  if (!a3->var0)
  {
    a3->var1 = a4;
    a3->var2 = &self->_mutationsCount;
    var0 = self->_head;
  }
  unint64_t result = 0;
  BOOL v7 = var0 != 0;
  if (a5 && var0)
  {
    unint64_t result = 0;
    do
    {
      a4[result++] = var0;
      var0 = (void *)var0[2];
      BOOL v7 = var0 != 0;
      if (var0) {
        BOOL v8 = result >= a5;
      }
      else {
        BOOL v8 = 1;
      }
    }
    while (!v8);
  }
  if (!v7) {
    a3->var3[0] = 1;
  }
  a3->var0 = (unint64_t)var0;
  return result;
}

- (GEOTileKeyList)initWithCapacity:(unint64_t)a3 maxCapacity:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)GEOTileKeyList;
  v6 = [(GEOTileKeyList *)&v12 init];
  BOOL v7 = v6;
  if (v6)
  {
    if (a4) {
      unint64_t v8 = a4;
    }
    else {
      unint64_t v8 = -1;
    }
    v6->_count = 0;
    v6->_maxCount = v8;
    v9 = [[GEOTileKeyMap alloc] initWithMapType:1];
    map = v7->_map;
    v7->_map = v9;

    if (a3) {
      [(GEOTileKeyMap *)v7->_map reserveCapacity:a3];
    }
  }
  return v7;
}

- (GEOTileKeyList)init
{
  return [(GEOTileKeyList *)self initWithCapacity:0 maxCapacity:-1];
}

- (unint64_t)count
{
  return self->_count;
}

- (id)newXPCData
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(GEOTileKeyList *)self count])
  {
    size_t v3 = 16 * [(GEOTileKeyList *)self count];
    v4 = (char *)malloc_type_malloc(v3, 0xA1DF487AuLL);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self;
    uint64_t v6 = [(GEOTileKeyList *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        v11 = &v4[16 * v8];
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          *(_OWORD *)v11 = *(_OWORD *)*(void *)(*((void *)&v14 + 1) + 8 * v10);
          v11 += 16;
          ++v10;
        }
        while (v7 != v10);
        uint64_t v7 = [(GEOTileKeyList *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        v8 += v10;
      }
      while (v7);
    }

    xpc_object_t v12 = xpc_data_create(v4, v3);
    free(v4);
    return v12;
  }
  else
  {
    return xpc_data_create(0, 0);
  }
}

+ (id)listFromXPCData:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_13:
      uint64_t v7 = objc_alloc_init(GEOTileKeyList);
      goto LABEL_7;
    }
    __int16 v14 = 0;
    uint64_t v10 = MEMORY[0x1E4F14500];
    v11 = "Assertion failed: xpcData != ((void *)0)";
    xpc_object_t v12 = (uint8_t *)&v14;
LABEL_15:
    _os_log_fault_impl(&dword_188D96000, v10, OS_LOG_TYPE_FAULT, v11, v12, 2u);
    goto LABEL_13;
  }
  if (MEMORY[0x18C1213B0](v3) != MEMORY[0x1E4F14580])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    __int16 v13 = 0;
    uint64_t v10 = MEMORY[0x1E4F14500];
    v11 = "Assertion failed: xpc_get_type(xpcData) == (&_xpc_type_data)";
    xpc_object_t v12 = (uint8_t *)&v13;
    goto LABEL_15;
  }
  size_t length = xpc_data_get_length(v4);
  unint64_t v6 = length >> 4;
  uint64_t v7 = [[GEOTileKeyList alloc] initWithCapacity:length >> 4];
  if (length >= 0x10)
  {
    bytes_ptr = (char *)xpc_data_get_bytes_ptr(v4);
    if (v6 <= 1) {
      unint64_t v6 = 1;
    }
    do
    {
      [(GEOTileKeyList *)v7 _addKeyToBack:bytes_ptr];
      bytes_ptr += 16;
      --v6;
    }
    while (v6);
  }
LABEL_7:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = [+[GEOTileKeyList allocWithZone:a3] initWithCapacity:[(GEOTileKeyList *)self count] maxCapacity:self->_maxCount];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self;
  uint64_t v6 = [(GEOTileKeyList *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        -[GEOTileKeyList _addKeyToBack:](v4, "_addKeyToBack:", *(void *)(*((void *)&v10 + 1) + 8 * v8++), (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(GEOTileKeyList *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v4;
}

- (uint64_t)_addKeyToBack:(uint64_t *)a3
{
  v4 = (void *)a1[3];
  ++a1[4];
  uint64_t v5 = *a3;
  uint64_t v6 = a3[1];
  uint64_t v7 = a1;
  uint64_t v8 = malloc_type_malloc(0x20uLL, 0x1020040AB73632BuLL);
  uint64_t v9 = v8;
  *uint64_t v8 = v5;
  v8[1] = v6;
  uint64_t v10 = v7[2];
  v8[2] = 0;
  v8[3] = v10;
  uint64_t v11 = v7[2];
  if (v11) {
    *(void *)(v11 + 16) = v8;
  }
  v7[2] = v8;
  if (!v7[1]) {
    v7[1] = v8;
  }
  ++v7[6];

  return [v4 setObject:v9 forKey:a3];
}

- (GEOTileKeyList)initWithCapacity:(unint64_t)a3
{
  return [(GEOTileKeyList *)self initWithCapacity:a3 maxCapacity:-1];
}

- (uint64_t)firstKey
{
  return *(void *)(a1 + 8);
}

- (void)removeKeysMatchingPredicate:(id)a3
{
  uint64_t v6 = (unsigned int (**)(id, void *))a3;
  head = self->_head;
  if (head)
  {
    do
    {
      uint64_t v5 = (void *)head[2];
      if (v6[2](v6, head)) {
        _remove(self, head);
      }
      head = v5;
    }
    while (v5);
  }
}

- (uint64_t)addKey:(uint64_t *)a3 lostKey:(_OWORD *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 24), "objectForKey:");
  if (v7)
  {
    if (*(void *)(a1 + 8) != v7)
    {
      uint64_t v9 = *(void *)(v7 + 16);
      uint64_t v8 = *(void *)(v7 + 24);
      if (v8) {
        *(void *)(v8 + 16) = v9;
      }
      if (v9) {
        *(void *)(v9 + 24) = v8;
      }
      *(void *)(v7 + 24) = 0;
      *(void *)(*(void *)(a1 + 8) + 24) = v7;
      *(void *)(v7 + 16) = *(void *)(a1 + 8);
      *(void *)(a1 + 8) = v7;
      if (*(void *)(a1 + 16) == v7) {
        *(void *)(a1 + 16) = v8;
      }
      uint64_t result = 0;
      ++*(void *)(a1 + 48);
      return result;
    }
    return 0;
  }
  uint64_t v11 = *(void **)(a1 + 24);
  ++*(void *)(a1 + 32);
  uint64_t v12 = *a3;
  uint64_t v13 = a3[1];
  __int16 v14 = (id)a1;
  uint64_t v15 = malloc_type_malloc(0x20uLL, 0x1020040AB73632BuLL);
  long long v16 = v15;
  *uint64_t v15 = v12;
  v15[1] = v13;
  v15[3] = 0;
  v15[2] = v14[1];
  uint64_t v17 = v14[1];
  if (v17) {
    *(void *)(v17 + 24) = v15;
  }
  v14[1] = v15;
  if (!v14[2]) {
    v14[2] = v15;
  }
  ++v14[6];

  [v11 setObject:v16 forKey:a3];
  if (*(void *)(a1 + 32) <= v14[5]) {
    return 0;
  }
  v18 = (uint64_t *)v14[2];
  uint64_t v19 = *v18;
  uint64_t v20 = v18[1];
  uint64_t v21 = v18[3];
  v22 = (void *)(v21 + 16);
  if (!v21) {
    v22 = v14 + 1;
  }
  void *v22 = 0;
  v14[2] = v21;
  v23 = v14;
  free(v18);
  ++v14[6];

  *(void *)&long long v24 = v19;
  *((void *)&v24 + 1) = v20;
  if (a4) {
    *a4 = v24;
  }
  [*(id *)(a1 + 24) removeObjectForKey:&v24];
  --*(void *)(a1 + 32);
  return 1;
}

- (uint64_t)addKey:(uint64_t)a3
{
  return [a1 addKey:a3 lostKey:0];
}

- (void)dealloc
{
  p_head = &self->_head;
  head = self->_head;
  if (head)
  {
    do
    {
      uint64_t v5 = (void *)head[2];
      free(head);
      head = v5;
    }
    while (v5);
  }
  *p_head = 0;
  p_head[1] = 0;
  v6.receiver = self;
  v6.super_class = (Class)GEOTileKeyList;
  [(GEOTileKeyList *)&v6 dealloc];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  __int16 v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v19 = self;
  int8x16_t v20 = vextq_s8(*(int8x16_t *)&self->_count, *(int8x16_t *)&self->_count, 8uLL);
  [v8 appendBytes:&v19 length:24];
  if ((v6 & 0x102) != 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = self;
    uint64_t v10 = [(GEOTileKeyList *)v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v10)
    {
      unint64_t v11 = a5 - 24;
      uint64_t v12 = *(void *)v16;
LABEL_4:
      uint64_t v13 = 0;
      unint64_t v14 = v11 + 16;
      v11 -= 16 * v10;
      while (1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 -= 16;
        if (v14 < 0x11) {
          break;
        }
        objc_msgSend(v8, "appendBytes:length:", *(void *)(*((void *)&v15 + 1) + 8 * v13++), 16, (void)v15);
        if (v10 == v13)
        {
          uint64_t v10 = [(GEOTileKeyList *)v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (GEOTileKeyList)initWithMaxCapacity:(unint64_t)a3
{
  return [(GEOTileKeyList *)self initWithCapacity:0 maxCapacity:a3];
}

- (id)copyWithMaxCapacity:(unint64_t)a3
{
  uint64_t v5 = [GEOTileKeyList alloc];
  unint64_t v6 = [(GEOTileKeyList *)self count];
  unint64_t v7 = a3;
  if (v6 < a3) {
    unint64_t v7 = [(GEOTileKeyList *)self count];
  }
  uint64_t v8 = [(GEOTileKeyList *)v5 initWithCapacity:v7 maxCapacity:a3];
  uint64_t v9 = (void *)v8;
  head = self->_head;
  if (head)
  {
    unint64_t v11 = *(void *)(v8 + 40);
    if (v11)
    {
      unint64_t v12 = 1;
      do
      {
        [v9 _addKeyToBack:head];
        head = (void *)head[2];
        if (head) {
          BOOL v13 = v12 >= v11;
        }
        else {
          BOOL v13 = 1;
        }
        ++v12;
      }
      while (!v13);
    }
  }
  return v9;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; maxCount = %lu; count = %lu;",
    objc_opt_class(),
    self,
    self->_maxCount,
  id v3 = self->_count);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = self;
  uint64_t v5 = [(GEOTileKeyList *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = GEOStringFromTileKey(*(char **)(*((void *)&v10 + 1) + 8 * i));
        [v3 appendFormat:@"\n   %@", v8];
      }
      uint64_t v5 = [(GEOTileKeyList *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [v3 appendString:@">"];

  return v3;
}

- (unint64_t)capacity
{
  return self->_maxCount;
}

- (GEOTileKeyList)listWithout:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self;
  uint64_t v6 = 0;
  uint64_t v7 = [(GEOTileKeyList *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsKey:", v10, (void)v12) & 1) == 0)
        {
          if (!v6) {
            uint64_t v6 = objc_alloc_init(GEOTileKeyList);
          }
          [(GEOTileKeyList *)v6 _addKeyToBack:v10];
        }
      }
      uint64_t v7 = [(GEOTileKeyList *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v6;
}

- (id)sublistWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [[GEOTileKeyList alloc] initWithMaxCapacity:a3.length];
  head = self->_head;
  if (head) {
    BOOL v8 = location == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    unint64_t v9 = 1;
    do
    {
      head = (void *)head[2];
      if (head) {
        BOOL v10 = v9 >= location;
      }
      else {
        BOOL v10 = 1;
      }
      ++v9;
    }
    while (!v10);
  }
  if (head) {
    BOOL v11 = length == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    unint64_t v12 = 1;
    do
    {
      [(GEOTileKeyList *)v6 _addKeyToBack:head];
      head = (void *)head[2];
      if (head) {
        BOOL v13 = v12 >= length;
      }
      else {
        BOOL v13 = 1;
      }
      ++v12;
    }
    while (!v13);
  }

  return v6;
}

- (uint64_t)keyAtIndex:(unint64_t)a3
{
  if (*(void *)(a1 + 32) <= a3)
  {
    [NSString stringWithFormat:@"*** -[%@ keyAtIndex:]: index %llu beyond bounds [0 .. %llu]", objc_opt_class(), a3, *(void *)(a1 + 32) - 1];
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v6);
  }
  uint64_t result = *(void *)(a1 + 8);
  if (a3 && result)
  {
    unint64_t v4 = 1;
    do
    {
      uint64_t result = *(void *)(result + 16);
      if (result) {
        BOOL v5 = v4 >= a3;
      }
      else {
        BOOL v5 = 1;
      }
      ++v4;
    }
    while (!v5);
  }
  return result;
}

- (void)sort:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t count = self->_count;
  if (!count) {
    goto LABEL_14;
  }
  size_t v6 = 16 * count;
  if (count <= 0x7F)
  {
    uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v7, v6);
    p_head = &self->_head;
LABEL_6:
    size_t v10 = 0;
    BOOL v11 = v7;
    unint64_t v12 = p_head;
    do
    {
      BOOL v13 = *v12;
      long long v14 = *v13;
      unint64_t v12 = (void **)(v13 + 1);
      *v11++ = v14;
      ++v10;
      size_t v9 = self->_count;
    }
    while (v10 < v9);
    goto LABEL_8;
  }
  uint64_t v7 = (char *)malloc_type_malloc(16 * count, 0x1000040451B5BE8uLL);
  p_head = &self->_head;
  if (self->_count) {
    goto LABEL_6;
  }
  size_t v9 = 0;
LABEL_8:
  qsort_b(v7, v9, 0x10uLL, v4);
  if (self->_count)
  {
    unint64_t v15 = 0;
    long long v16 = v7;
    do
    {
      uint64_t v17 = *p_head;
      *uint64_t v17 = *v16;
      [(GEOTileKeyMap *)self->_map setObject:v17 forKey:v16];
      p_head = (void **)(v17 + 1);
      ++v15;
      ++v16;
    }
    while (v15 < self->_count);
  }
  if (count >= 0x80) {
    free(v7);
  }
  ++self->_mutationsCount;
LABEL_14:
}

- (BOOL)intersectsList:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 count];
  if (v5 >= [(GEOTileKeyList *)self count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v7 = self;
    uint64_t v6 = [(GEOTileKeyList *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(v4, "containsKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [(GEOTileKeyList *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v6) = [v4 intersectsList:self];
  }

  return v6;
}

+ (id)formatOSLogData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 0x18)
  {
    [v4 getBytes:&v11 length:24];
    objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p> maxCount = %zu; unint64_t count = %zu; tiles = ",
      a1,
      v11,
    unint64_t v5 = v12);
    if ([v4 length] == 24)
    {
      uint64_t v6 = @"<>";
    }
    else
    {
      [v5 appendString:@"<"];
      uint64_t v8 = 24;
      uint64_t v6 = @"\n>";
      while (1)
      {
        uint64_t v9 = v8 + 16;
        if (v8 + 16 > (unint64_t)[v4 length]) {
          break;
        }
        objc_msgSend(v4, "getBytes:range:", v13, v8, 16);
        [v5 appendString:@"\n    "];
        size_t v10 = GEOStringFromTileKey(v13);
        [v5 appendString:v10];

        uint64_t v8 = v9;
      }
    }
    [v5 appendString:v6];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

@end