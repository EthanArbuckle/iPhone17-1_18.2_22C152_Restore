@interface _PFMutableProxyArray
+ (Class)classForKeyedUnarchiver;
- (Class)classForCoder;
- (_PFMutableProxyArray)initWithPFArray:(id)a3;
- (_PFMutableProxyArray)initWithPFArray:(id)a3 inRange:(_NSRange)a4;
- (id)arrayFromObjectIDs;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)managedObjectIDAtIndex:(unint64_t)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newArrayFromObjectIDs;
- (id)objectAtIndex:(unint64_t)a3;
- (id)subarrayWithRange:(_NSRange)a3;
- (id)valueForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)indexOfManagedObjectForObjectID:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation _PFMutableProxyArray

- (id)copy
{
  return [(_PFMutableProxyArray *)self copyWithZone:0];
}

- (unint64_t)count
{
  return CFArrayGetCount(self->_indicesVeneer);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  int v7 = [(NSMutableArray *)self->_updatedObjectsArray count];
  [(NSMutableArray *)self->_updatedObjectsArray addObject:a3];
  indicesVeneer = self->_indicesVeneer;

  CFArrayInsertValueAtIndex(indicesVeneer, a4, (const void *)(v7 & 0x7FFFFFFF | 0x80000000));
}

- (id)arrayFromObjectIDs
{
  id v2 = [(_PFMutableProxyArray *)self newArrayFromObjectIDs];

  return v2;
}

- (unint64_t)indexOfManagedObjectForObjectID:(id)a3
{
  unint64_t v5 = [(_PFMutableProxyArray *)self count];
  uint64_t v6 = [a3 methodForSelector:sel_isEqual_];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int v7 = (uint64_t (*)(id, char *, id))v6;
  unint64_t v8 = 0;
  while (1)
  {
    id v9 = [(_PFMutableProxyArray *)self managedObjectIDAtIndex:v8];
    if (v9 == a3 || (v7(a3, sel_isEqual_, v9) & 1) != 0) {
      break;
    }
    if (v5 == ++v8) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v8;
}

- (id)newArrayFromObjectIDs
{
  v11[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(_PFMutableProxyArray *)self count];
  unint64_t v4 = v3;
  if (v3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v3;
  }
  if (v3 >= 0x201) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  int v7 = (char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 >= 0x201)
  {
    int v7 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
    if (!v4) {
      goto LABEL_13;
    }
  }
  uint64_t v8 = 0;
  do
  {
    *(void *)&v7[8 * v8] = [(_PFMutableProxyArray *)self managedObjectIDAtIndex:v8];
    ++v8;
  }
  while (v4 != v8);
LABEL_13:
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v7 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0, v7);
  }
  return v9;
}

- (id)managedObjectIDAtIndex:(unint64_t)a3
{
  unsigned int ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, a3);
  if ((ValueAtIndex & 0x80000000) != 0)
  {
    uint64_t v8 = (void *)[(NSMutableArray *)self->_updatedObjectsArray objectAtIndex:ValueAtIndex & 0x7FFFFFFF];
    return (id)[v8 objectID];
  }
  else
  {
    uint64_t v5 = self->_offset + ValueAtIndex;
    originalArray = self->_originalArray;
    return [(_PFArray *)originalArray managedObjectIDAtIndex:v5];
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  unsigned int ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, a3);
  CFArrayRemoveValueAtIndex(self->_indicesVeneer, a3);
  if ((ValueAtIndex & 0x80000000) != 0)
  {
    [(NSMutableArray *)self->_updatedObjectsArray replaceObjectAtIndex:ValueAtIndex & 0x7FFFFFFF withObject:NSKeyValueCoding_NullValue];
    unsigned int editCount = self->_editCount;
    if (editCount) {
      self->_unsigned int editCount = editCount - 1;
    }
  }
}

- (_PFMutableProxyArray)initWithPFArray:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  unsigned int location = a4.location;
  v10.receiver = self;
  v10.super_class = (Class)_PFMutableProxyArray;
  int v7 = [(_PFMutableProxyArray *)&v10 init];
  if (v7)
  {
    v7->_originalArray = (_PFArray *)a3;
    v7->_offset = location;
    v7->_limit = location + length;
    v7->_updatedObjectsArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7->_unsigned int editCount = length + 1;
    v7->_indicesVeneer = CFArrayCreateMutable(0, 0, 0);
    if (length)
    {
      for (i = 0; i != (char *)length; ++i)
        CFArrayAppendValue(v7->_indicesVeneer, i);
    }
  }
  return v7;
}

- (_PFMutableProxyArray)initWithPFArray:(id)a3
{
  uint64_t v5 = [a3 count];

  return -[_PFMutableProxyArray initWithPFArray:inRange:](self, "initWithPFArray:inRange:", a3, 0, v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(_PFMutableProxyArray *)self count];
  uint64_t v5 = (void *)MEMORY[0x18C127630]();
  if (v4 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v4;
  }
  if (v4 >= 0x201) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = (char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4 >= 0x201)
  {
    uint64_t v8 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v6);
    if (!v4) {
      goto LABEL_13;
    }
  }
  for (uint64_t i = 0; i != v4; ++i)
    *(void *)&v8[8 * i] = [(_PFMutableProxyArray *)self objectAtIndex:i];
LABEL_13:
  objc_super v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v8 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0, v8);
  }
  return v10;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unsigned int ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, a3);
  if ((ValueAtIndex & 0x80000000) != 0)
  {
    updatedObjectsArray = self->_updatedObjectsArray;
    uint64_t v6 = ValueAtIndex & 0x7FFFFFFF;
  }
  else
  {
    updatedObjectsArray = self->_originalArray;
    uint64_t v6 = self->_offset + ValueAtIndex;
  }

  return (id)[updatedObjectsArray objectAtIndex:v6];
}

- (id)subarrayWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = -[_PFMutableProxyArray initWithPFArray:inRange:]([_PFMutableProxyArray alloc], "initWithPFArray:inRange:", self->_originalArray, a3.location, a3.length);
  v6->_offset = self->_offset;
  indicesVeneer = v6->_indicesVeneer;
  v14 = v6;
  updatedObjectsArray = v6->_updatedObjectsArray;
  int v9 = [(NSMutableArray *)updatedObjectsArray count];
  if (length)
  {
    int v10 = v9;
    for (CFIndex i = 0; i != length; ++i)
    {
      unsigned int ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, location + i);
      if ((ValueAtIndex & 0x80000000) != 0)
      {
        [(NSMutableArray *)updatedObjectsArray addObject:[(NSMutableArray *)self->_updatedObjectsArray objectAtIndex:ValueAtIndex & 0x7FFFFFFF]];
        CFArraySetValueAtIndex(indicesVeneer, i, (const void *)(v10++ | 0x80000000));
      }
      else
      {
        CFArraySetValueAtIndex(indicesVeneer, i, (const void *)ValueAtIndex);
      }
    }
  }

  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_PFMutableProxyArray;
  [(_PFMutableProxyArray *)&v3 dealloc];
}

- (id)mutableCopy
{
  return [(_PFMutableProxyArray *)self mutableCopyWithZone:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(_PFMutableProxyArray *)self count];
  uint64_t v5 = (void *)MEMORY[0x18C127630]();
  if (v4 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v4;
  }
  if (v4 >= 0x201) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = (char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4 >= 0x201)
  {
    uint64_t v8 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v6);
    if (!v4) {
      goto LABEL_13;
    }
  }
  for (uint64_t i = 0; i != v4; ++i)
    *(void *)&v8[8 * i] = [(_PFMutableProxyArray *)self objectAtIndex:i];
LABEL_13:
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v8 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0, v8);
  }
  return v10;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v17[1] = *MEMORY[0x1E4F143B8];
  unint64_t v8 = [(_PFMutableProxyArray *)self count];
  if (v8 < location + length) {
    unint64_t v8 = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"%@: index (%lu) beyond bounds (%lu)", _NSMethodExceptionProem(), location + length - 1, v8 format];
  }
  if (length)
  {
    int v9 = (void *)MEMORY[0x18C127630](v8);
    if (length >= 0x201) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = length;
    }
    unint64_t v11 = (8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0;
    v12 = (char *)v17 - v11;
    if (length > 0x200) {
      v12 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v17 - v11, 8 * length);
    }
    for (uint64_t i = 0; i != length; ++i)
    {
      id v14 = [(_PFMutableProxyArray *)self objectAtIndex:location + i];
      *(void *)&v12[8 * i] = v14;
      a3[i] = v14;
    }
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v12 count:length];
    if (length >= 0x201) {
      NSZoneFree(0, v12);
    }
    id v16 = v15;
  }
}

- (unint64_t)indexOfObject:(id)a3
{
  unint64_t v5 = [(_PFMutableProxyArray *)self count];

  return -[_PFMutableProxyArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, v5);
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  unint64_t v6 = [(_PFMutableProxyArray *)self count];

  return -[_PFMutableProxyArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, v6);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  unint64_t v5 = [(_PFMutableProxyArray *)self count];

  return -[_PFMutableProxyArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, v5);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = (id)[a3 objectID];
  uint64_t v8 = [v7 methodForSelector:sel_isEqual_];
  if (location >= location + length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int v9 = (uint64_t (*)(id, char *, id))v8;
  while (1)
  {
    id v10 = [(_PFMutableProxyArray *)self managedObjectIDAtIndex:location];
    if (v7 == v10 || (v9(v7, sel_isEqual_, v10) & 1) != 0) {
      break;
    }
    ++location;
    if (!--length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return location;
}

- (id)valueForKey:(id)a3
{
  if (![a3 isEqual:@"objectID"]
    || (id v5 = [(_PFMutableProxyArray *)self arrayFromObjectIDs],
        uint64_t v6 = [v5 count],
        v6 != [(_PFMutableProxyArray *)self count]))
  {
    v8.receiver = self;
    v8.super_class = (Class)_PFMutableProxyArray;
    return [(_PFMutableProxyArray *)&v8 valueForKey:a3];
  }
  return v5;
}

- (void)addObject:(id)a3
{
  int v5 = [(NSMutableArray *)self->_updatedObjectsArray count];
  [(NSMutableArray *)self->_updatedObjectsArray addObject:a3];
  indicesVeneer = self->_indicesVeneer;

  CFArrayAppendValue(indicesVeneer, (const void *)(v5 & 0x7FFFFFFF | 0x80000000));
}

- (void)removeLastObject
{
  CFIndex Count = CFArrayGetCount(self->_indicesVeneer);
  if (Count)
  {
    CFIndex v4 = Count;
    unsigned int ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, Count - 1);
    if ((ValueAtIndex & 0x80000000) != 0)
    {
      [(NSMutableArray *)self->_updatedObjectsArray replaceObjectAtIndex:ValueAtIndex & 0x7FFFFFFF withObject:NSKeyValueCoding_NullValue];
      unsigned int editCount = self->_editCount;
      if (editCount) {
        self->_unsigned int editCount = editCount - 1;
      }
    }
    indicesVeneer = self->_indicesVeneer;
    CFArrayRemoveValueAtIndex(indicesVeneer, v4);
  }
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  int v7 = [(NSMutableArray *)self->_updatedObjectsArray count];
  [(NSMutableArray *)self->_updatedObjectsArray addObject:a4];
  indicesVeneer = self->_indicesVeneer;

  CFArraySetValueAtIndex(indicesVeneer, a3, (const void *)(v7 & 0x7FFFFFFF | 0x80000000));
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end