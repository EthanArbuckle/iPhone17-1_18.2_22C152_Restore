@interface NSCountedSet
+ (BOOL)supportsSecureCoding;
- (NSCountedSet)init;
- (NSCountedSet)initWithArray:(NSArray *)array;
- (NSCountedSet)initWithCapacity:(NSUInteger)numItems;
- (NSCountedSet)initWithCoder:(id)a3;
- (NSCountedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (NSCountedSet)initWithSet:(NSSet *)set;
- (NSCountedSet)initWithSet:(id)a3 copyItems:(BOOL)a4;
- (NSEnumerator)objectEnumerator;
- (NSUInteger)countForObject:(id)object;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithLocale:(id)a3;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)object;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getObjects:(id *)a3 count:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeObject:(id)object;
@end

@implementation NSCountedSet

- (NSCountedSet)init
{
  return [(NSCountedSet *)self initWithCapacity:0];
}

- (NSCountedSet)initWithSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a3 count];
  v8 = [(NSCountedSet *)self initWithCapacity:v7];
  if (v7)
  {
    v9 = (void *)[a3 objectEnumerator];
    uint64_t v10 = [v9 nextObject];
    if (v10)
    {
      v11 = (void *)v10;
      do
      {
        uint64_t v12 = [a3 countForObject:v11];
        if (v4) {
          id v13 = (id)[v11 copyWithZone:0];
        }
        else {
          id v13 = v11;
        }
        v14 = v13;
        while (v12)
        {
          --v12;
          [(NSCountedSet *)v8 addObject:v14];
        }

        v11 = (void *)[v9 nextObject];
      }
      while (v11);
    }
  }
  return v8;
}

- (NSUInteger)countForObject:(id)object
{
  v7[1] = *(const void **)MEMORY[0x1E4F143B8];
  CFTypeID TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    if (object)
    {
      JUMPOUT(0x185304660);
    }
    return 0;
  }
  v7[0] = 0;
  if (!object) {
    return 0;
  }
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)self->_table, object, v7)) {
    return (NSUInteger)v7[0];
  }
  else {
    return 0;
  }
}

- (void)addObject:(id)object
{
  v10[1] = *(const void **)MEMORY[0x1E4F143B8];
  if (!object) {
    _NSSetRaiseInsertNilException((objc_class *)self, a2);
  }
  CFTypeID TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    table = (__CFBag *)self->_table;
    CFBagAddValue(table, object);
  }
  else
  {
    v10[0] = 0;
    if (CFDictionaryGetValueIfPresent((CFDictionaryRef)self->_table, object, v10))
    {
      uint64_t v7 = (uint64_t)++v10[0];
      v8 = (__CFDictionary *)self->_table;
      id v9 = object;
    }
    else
    {
      v8 = (__CFDictionary *)self->_table;
      id v9 = object;
      uint64_t v7 = 1;
    }
    CFDictionarySetValue(v8, v9, (const void *)v7);
  }
}

- (unint64_t)count
{
  CFTypeID TypeID = CFBagGetTypeID();
  CFTypeID v4 = CFGetTypeID(self->_table);
  CFDictionaryRef table = (const __CFDictionary *)self->_table;
  if (TypeID == v4)
  {
    JUMPOUT(0x185305F40);
  }

  return CFDictionaryGetCount(table);
}

- (NSCountedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  _NSSetCheckSize((objc_class *)self, a2, a4, (uint64_t)"count");
  for (i = [(NSCountedSet *)self initWithCapacity:v4]; v4; ++a3)
  {
    if (!*a3) {
      _NSSetRaiseInsertNilException((objc_class *)i, a2);
    }
    --v4;
    -[NSCountedSet addObject:](i, "addObject:");
  }
  return i;
}

- (NSCountedSet)initWithCapacity:(NSUInteger)numItems
{
  self->_CFDictionaryRef table = CFBagCreateMutable(0, 0, MEMORY[0x1E4F1D520]);
  return self;
}

- (NSEnumerator)objectEnumerator
{
  CFTypeID TypeID = CFBagGetTypeID();
  CFTypeID v4 = CFGetTypeID(self->_table);
  id v5 = objc_allocWithZone(MEMORY[0x1E4F1CB28]);
  if (TypeID == v4) {
    CFDictionaryRef table = self;
  }
  else {
    CFDictionaryRef table = self->_table;
  }
  uint64_t v7 = (void *)[v5 initWithObject:table];

  return (NSEnumerator *)v7;
}

- (void)removeObject:(id)object
{
  value[1] = *(void **)MEMORY[0x1E4F143B8];
  if (!object)
  {
    id v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: attempt to remove nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  CFTypeID TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    CFDictionaryRef table = (__CFBag *)self->_table;
    CFBagRemoveValue(table, object);
  }
  else
  {
    value[0] = 0;
    if (CFDictionaryGetValueIfPresent((CFDictionaryRef)self->_table, object, (const void **)value))
    {
      uint64_t v7 = (__CFDictionary *)self->_table;
      v8 = --value[0];
      if (value[0]) {
        CFDictionarySetValue(v7, object, v8);
      }
      else {
        CFDictionaryRemoveValue(v7, object);
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id table = self->_table;
  if (table)
  {

    self->_id table = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSCountedSet;
  [(NSCountedSet *)&v4 dealloc];
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v7 = [(NSCountedSet *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(self);
      }
      if (a4 == v10) {
        break;
      }
      *a3++ = *(id *)(*((void *)&v12 + 1) + 8 * v10);
      if (v8 == ++v10)
      {
        unint64_t v8 = [(NSCountedSet *)self countByEnumeratingWithState:&v12 objects:v11 count:16];
        a4 -= v10;
        if (v8) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFTypeID TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    unint64_t v10 = _CFBagFastEnumeration();
    if (!_CFExecutableLinkedOnOrAfter()) {
      a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__mut;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NSCountedSet;
    return [(NSCountedSet *)&v12 countByEnumeratingWithState:a3 objects:a4 count:a5];
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_allocWithZone((Class)objc_opt_class());

  return (id)[v4 initWithSet:self copyItems:0];
}

- (NSCountedSet)initWithArray:(NSArray *)array
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSCountedSet;
  return [(NSCountedSet *)&v4 initWithArray:array];
}

- (id)member:(id)a3
{
  if (!a3) {
    return 0;
  }
  CFTypeID TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    CFBagRef table = (const __CFBag *)self->_table;
    return (id)CFBagGetValue(table, a3);
  }
  else if (CFDictionaryGetKeyIfPresent())
  {
    return 0;
  }
  else
  {
    return 0;
  }
}

- (void)removeAllObjects
{
  CFTypeID TypeID = CFBagGetTypeID();
  CFTypeID v4 = CFGetTypeID(self->_table);
  CFBagRef table = (__CFBag *)self->_table;
  if (TypeID == v4)
  {
    CFBagRemoveAllValues(table);
  }
  else
  {
    CFDictionaryRemoveAllValues(table);
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_allocWithZone((Class)objc_opt_class());

  return (id)[v4 initWithSet:self copyItems:0];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v5 = [a3 allowsKeyedCoding];
  unint64_t v6 = [(NSCountedSet *)self count];
  uint64_t v7 = v6;
  if (v5)
  {
    [a3 encodeInt64:v6 forKey:@"NS.count"];
    unint64_t v8 = [(NSCountedSet *)self objectEnumerator];
    uint64_t v9 = [(NSEnumerator *)v8 nextObject];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      do
      {
        [a3 encodeObject:v10, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NS.object%qd", v11) forKey];
        [a3 encodeInt64:-[NSCountedSet countForObject:](self, "countForObject:", v10), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NS.count%qd", v11++) forKey];
        uint64_t v10 = [(NSEnumerator *)v8 nextObject];
      }
      while (v10);
    }
  }
  else
  {
    int v20 = v6;
    uint64_t v12 = [a3 encodeValueOfObjCType:"I" at:&v20];
    if (v7 >= 1)
    {
      if ((unint64_t)v7 >> 60)
      {
        CFStringRef v17 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v7);
        v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v17 userInfo:0];
        CFRelease(v17);
        objc_exception_throw(v18);
      }
      double v13 = MEMORY[0x1F4188790](v12);
      long long v15 = (void *)((char *)v19 - v14);
      v19[1] = 0;
      if ((unint64_t)v7 >= 0x101)
      {
        long long v15 = (void *)_CFCreateArrayStorage();
        uint64_t v16 = v15;
      }
      else
      {
        uint64_t v16 = 0;
      }
      -[NSCountedSet getObjects:count:](self, "getObjects:count:", v15, v7, v13);
      do
      {
        [a3 encodeBycopyObject:*v15];
        int v20 = [(NSCountedSet *)self countForObject:*v15];
        [a3 encodeValueOfObjCType:"I" at:&v20];
        ++v15;
        --v7;
      }
      while (v7);
      free(v16);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSCountedSet)initWithCoder:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    unint64_t v6 = [a3 decodeInt64ForKey:@"NS.count"];
    if (v6 >> 60)
    {
      uint64_t v7 = +[NSString stringWithFormat:@"%@: cannot decode set with %qd elements in this version", _NSMethodExceptionProem((objc_class *)self, a2), v6];

      uint64_t v8 = *MEMORY[0x1E4F1D148];
      v39 = @"NSLocalizedDescription";
      v40[0] = v7;
      uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v10 = (NSString **)v40;
      uint64_t v11 = &v39;
LABEL_4:
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, 4864, objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1)));
      return 0;
    }
    uint64_t v12 = [(NSCountedSet *)self initWithCapacity:v6];
    if (v12 && v6)
    {
      uint64_t v16 = 0;
      while (1)
      {
        CFStringRef v17 = +[NSString stringWithFormat:@"NS.object%qd", v16];
        v18 = +[NSString stringWithFormat:@"NS.count%qd", v16];
        if (![a3 containsValueForKey:v17]
          || ![a3 containsValueForKey:v18])
        {
          v24 = +[NSString stringWithFormat:@"%@: mismatch in count stored (%llu) vs count present (%llu)", _NSMethodExceptionProem((objc_class *)v12, a2), v6, v16];

          uint64_t v8 = *MEMORY[0x1E4F1D148];
          v31 = @"NSLocalizedDescription";
          v32 = v24;
          uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v10 = &v32;
          uint64_t v11 = &v31;
          goto LABEL_4;
        }
        uint64_t v19 = [a3 decodeObjectForKey:v17];
        if (!v19)
        {
          v25 = +[NSString stringWithFormat:@"%@: decode failure at index %llu - item nil", _NSMethodExceptionProem((objc_class *)v12, a2), v16];

          uint64_t v8 = *MEMORY[0x1E4F1D148];
          v37 = @"NSLocalizedDescription";
          v38 = v25;
          uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v10 = &v38;
          uint64_t v11 = &v37;
          goto LABEL_4;
        }
        uint64_t v20 = v19;
        unint64_t v21 = [a3 decodeInt64ForKey:v18];
        if (!v21)
        {
          v26 = +[NSString stringWithFormat:@"%@: decode failure at index %llu -- itemCount zero", _NSMethodExceptionProem((objc_class *)v12, a2), v16];

          uint64_t v8 = *MEMORY[0x1E4F1D148];
          v35 = @"NSLocalizedDescription";
          v36 = v26;
          uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v10 = &v36;
          uint64_t v11 = &v35;
          goto LABEL_4;
        }
        unint64_t v22 = v21;
        if (v21 >> 60) {
          break;
        }
        do
        {
          --v22;
          [(NSCountedSet *)v12 addObject:v20];
        }
        while (v22);
        if (++v16 == v6) {
          return v12;
        }
      }
      v27 = +[NSString stringWithFormat:@"%@: cannot store %qd instances of item '%@' in this version", _NSMethodExceptionProem((objc_class *)v12, a2), v21, v20];

      uint64_t v8 = *MEMORY[0x1E4F1D148];
      v33 = @"NSLocalizedDescription";
      v34 = v27;
      uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v10 = &v34;
      uint64_t v11 = &v33;
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v13 = [a3 versionForClassName:@"NSCountedSet"];
    if (v13 > 1)
    {
      v28 = +[NSString stringWithFormat:@"%@: NSCountedSet cannot decode class version %lu", _NSMethodExceptionProem((objc_class *)self, a2), v13];

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v28 userInfo:0]);
    }
    unsigned int v30 = 0;
    [a3 decodeValueOfObjCType:"I" at:&v30 size:4];
    uint64_t v14 = v30;
    _NSSetCheckSize((objc_class *)self, a2, v30, (uint64_t)"count");
    uint64_t v12 = [(NSCountedSet *)self initWithCapacity:v14];
    if (v14)
    {
      do
      {
        uint64_t v29 = 0;
        [a3 decodeValueOfObjCType:"@" at:&v29 size:8];
        [a3 decodeValueOfObjCType:"I" at:&v30 size:4];
        uint64_t v15 = v30;
        if (v30)
        {
          do
          {
            --v15;
            [(NSCountedSet *)v12 addObject:v29];
          }
          while (v15);
        }
        --v14;
      }
      while (v14);
    }
  }
  return v12;
}

- (id)descriptionWithLocale:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(NSCountedSet *)self count];
  if (v5)
  {
    unint64_t v6 = v5;
    id v7 = (id)[objc_allocWithZone((Class)NSMutableString) initWithCapacity:v5 << 6];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "appendFormat:", @"<%@: %p> ("), NSStringFromClass(v8), self;
    if (v6 >> 60)
    {
      CFStringRef v19 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
      uint64_t v20 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v19 userInfo:0];
      CFRelease(v19);
      objc_exception_throw(v20);
    }
    v21[1] = v21;
    double v10 = MEMORY[0x1F4188790](v9);
    uint64_t v12 = (id *)((char *)v21 - v11);
    v21[2] = 0;
    if (v6 >= 0x101)
    {
      uint64_t v12 = (id *)_CFCreateArrayStorage();
      unint64_t v13 = v12;
    }
    else
    {
      unint64_t v13 = 0;
    }
    -[NSCountedSet getObjects:count:](self, "getObjects:count:", v12, v6, v10);
    char v16 = 1;
    do
    {
      if ((v16 & 1) == 0) {
        [v7 replaceCharactersInRange:objc_msgSend(v7, "length"), 0, @", " withString];
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v17 = [v7 length];
        uint64_t v18 = [*v12 descriptionWithLocale:a3];
      }
      else
      {
        uint64_t v17 = [v7 length];
        uint64_t v18 = [*v12 description];
      }
      objc_msgSend(v7, "replaceCharactersInRange:withString:", v17, 0, v18);
      objc_msgSend(v7, "appendFormat:", @" [%ld]", -[NSCountedSet countForObject:](self, "countForObject:", *v12));
      char v16 = 0;
      ++v12;
      --v6;
    }
    while (v6);
    [v7 replaceCharactersInRange:objc_msgSend(v7, "length"), 0, @"" withString]);
    free(v13);
    return v7;
  }
  else
  {
    uint64_t v14 = (objc_class *)objc_opt_class();
    return +[NSString stringWithFormat:@"<%@: %p> ()", NSStringFromClass(v14), self];
  }
}

- (NSCountedSet)initWithSet:(NSSet *)set
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSCountedSet;
  return [(NSCountedSet *)&v4 initWithSet:set];
}

@end