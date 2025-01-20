@interface _PFResultArray
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (void)initialize;
- (BOOL)_setPurgeable:(BOOL)a3;
- (Class)classForCoder;
- (_PFResultArray)initWithObjects:(id *)a3 count:(unsigned int)a4 store:(id)a5 metadata:(id)a6;
- (_PFResultArray)retain;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)release;
@end

@implementation _PFResultArray

- (_PFResultArray)retain
{
  return self;
}

- (unint64_t)count
{
  if ((*(unsigned char *)&self->_resultSet->var7 & 0x40) != 0) {
    return 0;
  }
  else {
    return self->_count;
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if ((*(unsigned char *)&self->_resultSet->var7 & 0x40) != 0) {
    return 0;
  }
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&self->_count;
  }
  unint64_t result = 0;
  a3->var1 = a4;
  if (a5)
  {
    unint64_t count = self->_count;
    if (var0 < count)
    {
      unint64_t result = 0;
      do
      {
        unint64_t v12 = result;
        unint64_t v13 = var0 + result;
        id v14 = [(_PFResultArray *)self objectAtIndex:var0 + result];
        unint64_t result = v12 + 1;
        a4[v12] = v14;
      }
      while (v13 + 1 < count && result < a5);
      var0 += result;
    }
  }
  a3->unint64_t var0 = var0;
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  resultSet = self->_resultSet;
  $832F591C28F8B7CE1ACC7DCBC97655CC var7 = resultSet->var7;
  if ((*(unsigned char *)&var7 & 0x10) != 0)
  {
    if ((*(unsigned char *)&var7 & 0x40) != 0)
    {
      v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3C8];
      uint64_t v25 = _NSMethodExceptionProem();
      v18 = @"%@: backing buffer has been purged";
    }
    else
    {
      if ((*(unsigned char *)&var7 & 0x20) == 0) {
        goto LABEL_2;
      }
      v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3C8];
      uint64_t v25 = _NSMethodExceptionProem();
      v18 = @"%@: backing buffer can be purged";
    }
    objc_msgSend(v16, "raise:format:", v17, v18, v25, v26, v27);
    return 0;
  }
LABEL_2:
  if (self->_count <= a3)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"%@: index (%lu) beyond bounds (%lu)", _NSMethodExceptionProem(), a3, self->_count format];
    return 0;
  }
  if (!resultSet->var5)
  {
    uint64_t v13 = 0;
LABEL_19:
    id v14 = (unsigned int *)resultSet->var9[v13];
    goto LABEL_20;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  while (1)
  {
    id v14 = (unsigned int *)resultSet->var9[v13];
    uint64_t v15 = *v14;
    if (v12 + (unint64_t)(v15 - 1) >= a3) {
      break;
    }
    v12 += v15;
LABEL_9:
    if (++v13 >= (unint64_t)resultSet->var5) {
      goto LABEL_19;
    }
  }
  if (v15 < (int)a3 - (int)v12)
  {
    _NSCoreDataLog(1, @"Index beyond buffer: %ld, %ld, %ld, %ld", a3, v3, v4, v5, v6, v7, v13);
    resultSet = self->_resultSet;
    goto LABEL_9;
  }
  uint64_t v23 = a3 - v12;
  if (a3 == v12)
  {
LABEL_20:
    uint64_t v20 = 8;
    goto LABEL_21;
  }
  uint64_t v24 = v14[1];
  uint64_t v20 = 8;
  do
  {
    v20 += *(unsigned int *)((char *)v14 + v24);
    v24 += 4;
    --v23;
  }
  while (v23);
LABEL_21:
  v19 = (char *)v14 + v20;
  if (!*(void *)((char *)v14 + v20))
  {
    v21 = (objc_class *)objc_opt_class();
    object_setClass(v19, v21);
  }
  [v19 _setParentBuffer:self];
  return v19;
}

- (void)release
{
  if ((int)atomic_fetch_add_explicit(&self->_cd_rc, 0xFFFFFFFF, memory_order_relaxed) <= 0)
  {
    self->_cd_rc += 0x20000000;
    [(_PFResultArray *)self dealloc];
  }
}

- (void)dealloc
{
  resultSet = self->_resultSet;
  if (resultSet) {
    bufferResultSetDeallocate((uint64_t)resultSet);
  }

  self->_weakRequestStore = 0;
  self->_metadata = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PFResultArray;
  [(_PFResultArray *)&v4 dealloc];
}

+ (void)initialize
{
}

- (_PFResultArray)initWithObjects:(id *)a3 count:(unsigned int)a4 store:(id)a5 metadata:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)_PFResultArray;
  v9 = [(_PFResultArray *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_unint64_t count = a3->var0;
    v9->_weakRequestStore = [[_PFWeakReference alloc] initWithObject:a5];
    v10->_resultSet = a3;
    v10->_resultType = 2;
    v10->_metadata = (NSKnownKeysDictionary *)a6;
  }
  return v10;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[_PFResultArray indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, 0, self->_count);
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v8 = a4.location + a4.length;
  uint64_t v9 = [a3 methodForSelector:sel_isEqual_];
  if (location >= v8) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v10 = (uint64_t (*)(id, char *, id))v9;
  while (1)
  {
    id v11 = [(_PFResultArray *)self objectAtIndex:location];
    if (v11 == a3 || (v10(a3, sel_isEqual_, v11) & 1) != 0) {
      break;
    }
    ++location;
    if (!--length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return location;
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  return -[_PFResultArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, self->_count);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((*(unsigned char *)&self->_resultSet->var7 & 0x40) != 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location >= a4.location + a4.length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  while ([(_PFResultArray *)self objectAtIndex:location] != a3)
  {
    ++location;
    if (!--length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return location;
}

- (BOOL)_setPurgeable:(BOOL)a3
{
  resultSet = self->_resultSet;
  if (a3) {
    return bufferResultSetPurgeable((uint64_t)resultSet);
  }
  else {
    return bufferResultSetNonPurgeable((uint64_t)resultSet);
  }
}

- (void)getObjects:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unsigned int count = self->_count;
  MEMORY[0x1F4188790](self);
  NSUInteger v8 = (char *)v12 - v7;
  if (count > 0x200)
  {
    NSUInteger v8 = (char *)NSAllocateScannedUncollectable();
    if (self->_count)
    {
LABEL_3:
      unint64_t v9 = 0;
      do
      {
        *(void *)&v8[8 * v9] = [(_PFResultArray *)self objectAtIndex:v9];
        ++v9;
        unint64_t v10 = self->_count;
      }
      while (v9 < v10);
      size_t v11 = 8 * v10;
      goto LABEL_8;
    }
  }
  else
  {
    bzero((char *)v12 - v7, 8 * v6);
    if (count) {
      goto LABEL_3;
    }
  }
  size_t v11 = 0;
LABEL_8:
  memmove(a3, v8, v11);
  if (count >= 0x201) {
    NSZoneFree(0, v8);
  }
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = self;
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a4.location + a4.length > self->_count) {
    self = (_PFResultArray *)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"%@: index (%lu) beyond bounds (%lu)", _NSMethodExceptionProem(), a4.location + a4.length - 1, self->_count format];
  }
  if (length)
  {
    MEMORY[0x1F4188790](self);
    unint64_t v9 = (char *)v13 - v8;
    if (length > 0x200) {
      unint64_t v9 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v13 - v8, 8 * length);
    }
    if (location < v7->_count)
    {
      unint64_t v10 = 0;
      do
      {
        NSUInteger v11 = location + v10;
        *(void *)&v9[8 * v10] = [(_PFResultArray *)v7 objectAtIndex:location + v10];
        ++v10;
      }
      while (v11 + 1 < v7->_count && length > v10);
    }
    memmove(a3, v9, 8 * length);
    if (length >= 0x201) {
      NSZoneFree(0, v9);
    }
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

@end