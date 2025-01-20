@interface NSConcretePointerArray
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSConcretePointerArray)init;
- (NSConcretePointerArray)initWithCoder:(id)a3;
- (NSConcretePointerArray)initWithOptions:(unint64_t)a3;
- (NSConcretePointerArray)initWithPointerFunctions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)pointerFunctions;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (unint64_t)indexOfPointer:(void *)a3;
- (void)_markNeedsCompaction;
- (void)addPointer:(void *)a3;
- (void)arrayGrow:(unint64_t)a3;
- (void)compact;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)insertPointer:(void *)a3 atIndex:(unint64_t)a4;
- (void)pointerAtIndex:(unint64_t)a3;
- (void)removePointer:(void *)a3;
- (void)removePointerAtIndex:(unint64_t)a3;
- (void)replacePointerAtIndex:(unint64_t)a3 withPointer:(void *)a4;
- (void)setCount:(unint64_t)a3;
@end

@implementation NSConcretePointerArray

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_slice = &self->slice;
  internalProps = self->slice.internalProps;
  if (internalProps)
  {
    unint64_t capacity = self->capacity;
    if (*((void *)internalProps + 3))
    {
      if (capacity && *((void *)internalProps + 6) != 0)
      {
        uint64_t v7 = 0;
        unint64_t v8 = self->capacity;
        do
        {
          uint64_t v9 = (*((uint64_t (**)(void **, void))p_slice->internalProps + 3))(&p_slice->items[v7], 0);
          uint64_t v10 = v9;
          if (v9)
          {
            v11 = (void (*)(uint64_t, void))*((void *)p_slice->acquisitionProps + 2);
            if (v11) {
              v11(v9, *((void *)p_slice->personalityProps + 1));
            }
          }
          (*((void (**)(void **))p_slice->internalProps + 6))(&p_slice->items[v7]);
          (*((void (**)(uint64_t))p_slice->internalProps + 4))(v10);
          ++v7;
          --v8;
        }
        while (v8);
        internalProps = p_slice->internalProps;
      }
    }
    v12 = (void (*)(void **, unint64_t))*((void *)internalProps + 2);
    if (v12) {
      v12(p_slice->items, capacity);
    }
    p_slice->items = 0;
  }
  if (self->hasDynamicSlice) {
    NSSliceDealloc((uint64_t)p_slice);
  }
  v13.receiver = self;
  v13.super_class = (Class)NSConcretePointerArray;
  [(NSConcretePointerArray *)&v13 dealloc];
}

- (void)pointerAtIndex:(unint64_t)a3
{
  unint64_t count = self->count;
  if (count <= a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: attempt to access pointer at index %lu beyond bounds %lu", _NSMethodExceptionProem((objc_class *)self, a2), a3, self->count), 0 reason userInfo];
      objc_exception_throw(v10);
    }
    unint64_t count = self->count;
  }
  if (count <= a3) {
    return 0;
  }
  p_slice = &self->slice;
  unint64_t v8 = (void *)(*((uint64_t (**)(void **, void))p_slice->internalProps + 3))(&p_slice->items[a3], 0);
  (*((void (**)(void))p_slice->internalProps + 5))();
  return v8;
}

- (unint64_t)count
{
  return self->count;
}

- (void)removePointerAtIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (self->count <= a3)
  {
    objc_super v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: attempt to remove pointer at index %lu beyond bounds %lu", _NSMethodExceptionProem((objc_class *)self, a2), a3, self->count), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  p_slice = &self->slice;
  uint64_t v6 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&self->slice.items[a3], 0);
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = (void (*)(uint64_t, void))*((void *)self->slice.acquisitionProps + 2);
    if (v8) {
      v8(v6, *((void *)self->slice.personalityProps + 1));
    }
    (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[v3]);
    (*((void (**)(uint64_t))self->slice.internalProps + 4))(v7);
  }
  unint64_t count = self->count;
  if (v3 + 1 < count)
  {
    uint64_t v10 = 8 * v3 + 8;
    do
    {
      uint64_t v11 = (*((uint64_t (**)(char *, void))self->slice.internalProps + 3))((char *)p_slice->items + v10, 0);
      (*((void (**)(void **, unint64_t, uint64_t))self->slice.internalProps + 7))(p_slice->items, v3, v11);
      (*((void (**)(uint64_t))self->slice.internalProps + 4))(v11);
      (*((void (**)(char *))self->slice.internalProps + 6))((char *)p_slice->items + v10);
      unint64_t count = self->count;
      unint64_t v12 = v3 + 2;
      ++v3;
      v10 += 8;
    }
    while (v12 < count);
  }
  self->unint64_t count = count - 1;
  ++self->mutations;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[NSPointerArray allocWithZone:a3] initWithPointerFunctions:[(NSConcretePointerArray *)self pointerFunctions]];
  unint64_t count = self->count;
  if (count)
  {
    uint64_t v6 = 0;
    p_slice = &self->slice;
    do
    {
      uint64_t v8 = (*((uint64_t (**)(void **, void))p_slice->internalProps + 3))(&p_slice->items[v6], 0);
      [(NSConcretePointerArray *)v4 addPointer:v8];
      (*((void (**)(uint64_t))p_slice->internalProps + 4))(v8);
      ++v6;
      --count;
    }
    while (count);
  }
  return v4;
}

- (void)addPointer:(void *)a3
{
  unint64_t count = self->count;
  if (count == self->capacity) {
    [(NSConcretePointerArray *)self arrayGrow:2 * count];
  }
  if (a3)
  {
    acquisitionProps = self->slice.acquisitionProps;
    uint64_t v7 = (uint64_t (*)(void *, void, void))*((void *)acquisitionProps + 1);
    if (v7) {
      a3 = (void *)v7(a3, *((void *)self->slice.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
    }
  }
  (*((void (**)(void **, unint64_t, void *))self->slice.internalProps + 7))(self->slice.items, self->count, a3);
  if (!a3) {
    self->needsCompaction = 1;
  }
  ++self->count;
  ++self->mutations;
}

- (void)arrayGrow:(unint64_t)a3
{
  p_slice = &self->slice;
  items = self->slice.items;
  uint64_t v7 = (*((uint64_t (**)(unint64_t, SEL))self->slice.internalProps + 1))(a3, a2);
  p_slice->items = (void **)v7;
  if (!v7) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"*** NSPointerArray unable to allocate memory -- allocation function failed" userInfo:0]);
  }
  if (self->capacity)
  {
    unint64_t v8 = 0;
    uint64_t v9 = items;
    do
    {
      if (*v9)
      {
        uint64_t v10 = (*((uint64_t (**)(void **, void))p_slice->internalProps + 3))(v9, 0);
        if (v10)
        {
          uint64_t v11 = v10;
          (*((void (**)(void **, unint64_t, uint64_t))p_slice->internalProps + 7))(p_slice->items, v8, v10);
          (*((void (**)(uint64_t))p_slice->internalProps + 4))(v11);
        }
      }
      ++v8;
      unint64_t capacity = self->capacity;
      ++v9;
    }
    while (v8 < capacity);
  }
  else
  {
    unint64_t capacity = 0;
  }
  (*((void (**)(void **, unint64_t))p_slice->internalProps + 2))(items, capacity);
  self->unint64_t capacity = a3;
}

- (id)pointerFunctions
{
  unint64_t v3 = [NSConcretePointerFunctions alloc];
  NSSliceInitWithSlice(&v3->slice.items, &self->slice.items);

  return v3;
}

- (NSConcretePointerArray)initWithPointerFunctions:(id)a3
{
  if (!a3)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSPointerArray %@] Functions cannot be NULL.", NSStringFromSelector(a2));

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v5 userInfo:0]);
  }
  NSSliceInitWithSlice(&self->slice.items, (void *)a3 + 1);
  self->hasDynamicSlice = 1;
  self->unint64_t capacity = 16;
  self->unint64_t count = 0;
  self->mutations = 0;
  +[NSConcretePointerFunctions initializeBackingStore:&self->slice sentinel:0 weakAutoreleasing:*((unsigned __int8 *)self->slice.acquisitionProps + 3) dynamic:1];
  self->options = -1;
  allocateInitialCapacity_1((uint64_t *)&self->slice, self->capacity);
  return self;
}

- (NSConcretePointerArray)init
{
  return [(NSConcretePointerArray *)self initWithOptions:0];
}

- (NSConcretePointerArray)initWithOptions:(unint64_t)a3
{
  self->options = a3;
  self->unint64_t capacity = 4;
  self->unint64_t count = 0;
  self->mutations = 0;
  if (!+[NSConcretePointerFunctions initializeSlice:&self->slice withOptions:self->options])
  {
    uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSPointerArray %@] Requested configuration not supported.", NSStringFromSelector(a2));

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v6 userInfo:0]);
  }
  +[NSConcretePointerFunctions initializeBackingStore:&self->slice sentinel:0 weakAutoreleasing:*((unsigned __int8 *)self->slice.acquisitionProps + 3) dynamic:0];
  allocateInitialCapacity_1((uint64_t *)&self->slice, self->capacity);
  return self;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0)
  {
    (*((void (**)(unint64_t, SEL))self->slice.internalProps + 4))(a3->var3[0], a2);
    unint64_t var0 = a3->var0;
  }
  else
  {
    a3->var2 = &self->mutations;
    if (!*((unsigned char *)self->slice.internalProps + 1))
    {
      a3->var1 = self->slice.items;
      a3->unint64_t var0 = self->count;
      return self->count;
    }
    unint64_t var0 = 0;
    a3->var1 = (id *)a3->var3;
  }
  if (var0 >= self->count) {
    return 0;
  }
  uint64_t v8 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&self->slice.items[var0], 0);
  ++a3->var0;
  a3->var3[0] = v8;
  return 1;
}

- (void)compact
{
  if (self->needsCompaction && self->count)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    p_slice = &self->slice;
    while ((*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&p_slice->items[v3], 0))
    {
      (*((void (**)(void))self->slice.internalProps + 4))();
      ++v4;
      unint64_t count = self->count;
      ++v3;
      if (v4 >= count) {
        goto LABEL_8;
      }
    }
    unint64_t count = self->count;
LABEL_8:
    if (v4 != count)
    {
      unint64_t v7 = v4 + 1;
      if (v4 + 1 < count)
      {
        uint64_t v8 = 8 * v4 + 8;
        do
        {
          uint64_t v9 = (*((uint64_t (**)(char *, void))self->slice.internalProps + 3))((char *)p_slice->items + v8, 0);
          if (v9)
          {
            uint64_t v10 = v9;
            (*((void (**)(void **, unint64_t, uint64_t))self->slice.internalProps + 7))(p_slice->items, v4, v9);
            (*((void (**)(char *))self->slice.internalProps + 6))((char *)p_slice->items + v8);
            (*((void (**)(uint64_t))self->slice.internalProps + 4))(v10);
            ++v4;
          }
          ++v7;
          v8 += 8;
        }
        while (v7 < self->count);
      }
      self->unint64_t count = v4;
      ++self->mutations;
      self->needsCompaction = 0;
    }
  }
}

- (void)insertPointer:(void *)a3 atIndex:(unint64_t)a4
{
  unint64_t count = self->count;
  if (count < a4)
  {
    unint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: attempt to insert pointer at index %lu beyond bounds %lu", _NSMethodExceptionProem((objc_class *)self, a2), a4, self->count), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  if (count == self->capacity)
  {
    [(NSConcretePointerArray *)self arrayGrow:2 * count];
    unint64_t count = self->count;
  }
  if (count > a4)
  {
    uint64_t v8 = 8 * count - 8;
    do
    {
      uint64_t v9 = (*((uint64_t (**)(char *, void))self->slice.internalProps + 3))((char *)self->slice.items + v8, 0);
      (*((void (**)(void **, unint64_t, uint64_t))self->slice.internalProps + 7))(self->slice.items, count, v9);
      (*((void (**)(uint64_t))self->slice.internalProps + 4))(v9);
      (*((void (**)(char *))self->slice.internalProps + 6))((char *)self->slice.items + v8);
      v8 -= 8;
      --count;
    }
    while (count > a4);
  }
  if (a3)
  {
    acquisitionProps = self->slice.acquisitionProps;
    uint64_t v11 = (uint64_t (*)(void *, void, void))*((void *)acquisitionProps + 1);
    if (v11) {
      a3 = (void *)v11(a3, *((void *)self->slice.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
    }
  }
  (*((void (**)(void **, unint64_t, void *))self->slice.internalProps + 7))(self->slice.items, a4, a3);
  if (!a3) {
    self->needsCompaction = 1;
  }
  ++self->count;
  ++self->mutations;
}

- (void)replacePointerAtIndex:(unint64_t)a3 withPointer:(void *)a4
{
  if (self->count <= a3)
  {
    objc_super v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: attempt to replace pointer at index %lu beyond bounds %lu", _NSMethodExceptionProem((objc_class *)self, a2), a3, self->count), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  p_slice = &self->slice;
  uint64_t v8 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&self->slice.items[a3], 0);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void (*)(uint64_t, void))*((void *)self->slice.acquisitionProps + 2);
    if (v10) {
      v10(v8, *((void *)self->slice.personalityProps + 1));
    }
    (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[a3]);
    (*((void (**)(uint64_t))self->slice.internalProps + 4))(v9);
  }
  if (a4)
  {
    acquisitionProps = self->slice.acquisitionProps;
    unint64_t v12 = (uint64_t (*)(void *, void, void))*((void *)acquisitionProps + 1);
    if (v12) {
      a4 = (void *)v12(a4, *((void *)self->slice.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
    }
  }
  (*((void (**)(void **, unint64_t, void *))self->slice.internalProps + 7))(p_slice->items, a3, a4);
  if (!a4) {
    self->needsCompaction = 1;
  }
  ++self->mutations;
}

- (void)setCount:(unint64_t)a3
{
  if (self->count != a3)
  {
    ++self->mutations;
    unint64_t count = self->count;
    if (count >= a3)
    {
      if (count > a3)
      {
        p_slice = &self->slice;
        do
        {
          unint64_t v7 = count - 1;
          self->unint64_t count = v7;
          uint64_t v8 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&p_slice->items[v7], 0);
          uint64_t v9 = v8;
          uint64_t v10 = (void (*)(uint64_t, void))*((void *)self->slice.acquisitionProps + 2);
          if (v10) {
            BOOL v11 = v8 == 0;
          }
          else {
            BOOL v11 = 1;
          }
          if (!v11) {
            v10(v8, *((void *)self->slice.personalityProps + 1));
          }
          (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[self->count]);
          (*((void (**)(uint64_t))self->slice.internalProps + 4))(v9);
          unint64_t count = self->count;
        }
        while (count > a3);
      }
    }
    else
    {
      if (self->capacity < a3) {
        [(NSConcretePointerArray *)self arrayGrow:a3];
      }
      self->unint64_t count = a3;
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSConcretePointerArray)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned int v11 = 0;
  [a3 decodeValueOfObjCType:"i" at:&v11 size:4];
  if ((_NSPointerFunctionCoding_isValidOptions(v11) & 1) == 0)
  {

    objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", @"Invalid NSPointerArray options for %d", v11));
    return 0;
  }
  int v10 = 0;
  [a3 decodeValueOfObjCType:"i" at:&v10 size:4];
  if (v10 < 0)
  {

    objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", @"NSPointerArray archive contains negative count"));
    return 0;
  }
  v5 = [(NSConcretePointerArray *)self initWithOptions:(int)v11];
  if (objc_opt_isKindOfClass())
  {
    if (v10 >= 1)
    {
      uint64_t v6 = 0;
      while (([a3 _containsNextUnkeyedObject] & 1) != 0)
      {
        -[NSConcretePointerArray addPointer:](v5, "addPointer:", [a3 decodeObject]);
        if (++v6 >= v10) {
          return v5;
        }
      }
      id v8 = +[NSError _readCorruptErrorWithFormat:@"Missing expected key while decoding NSPointerArray"];

      [a3 failWithError:v8];
      return 0;
    }
  }
  else if (v10 >= 1)
  {
    for (uint64_t i = 0; i < v10; ++i)
      -[NSConcretePointerArray addPointer:](v5, "addPointer:", [a3 decodeObject]);
  }
  return v5;
}

- (unint64_t)hash
{
  if (!*(unsigned char *)(*(void *)(self + 32) + 1)) {
    return *(void *)(self + 40);
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  uint64_t v6 = *((void *)a3 + 5);
  if (v6 != self->count) {
    return 0;
  }
  personalityProps = self->slice.personalityProps;
  id v8 = (char *)a3 + 8;
  uint64_t v9 = *((void *)a3 + 3);
  if (*((void *)personalityProps + 3) != *(void *)(v9 + 24)
    || *((void *)personalityProps + 1) != *(void *)(v9 + 8))
  {
    return 0;
  }
  if (v6)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    p_internalProps = (NSSliceInternalProperties **)((char *)a3 + 32);
    while (1)
    {
      uint64_t v14 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&self->slice.items[v11], 0);
      uint64_t v15 = (*(uint64_t (**)(uint64_t, void))(v8[3] + 24))(*v8 + v11 * 8, 0);
      if (v14) {
        BOOL v16 = v15 == 0;
      }
      else {
        BOOL v16 = 0;
      }
      if (v16)
      {
        p_internalProps = &self->slice.internalProps;
        goto LABEL_26;
      }
      uint64_t v17 = v15;
      if (v15 && v14 == 0) {
        break;
      }
      if (v14 | v15)
      {
        int v19 = (*((uint64_t (**)(uint64_t, uint64_t, void))self->slice.personalityProps + 3))(v14, v15, *((void *)self->slice.personalityProps + 1));
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v14);
        (*((void (**)(uint64_t))*p_internalProps + 4))(v17);
        if (!v19) {
          return 0;
        }
      }
      ++v12;
      ++v11;
      BOOL result = 1;
      if (v12 >= self->count) {
        return result;
      }
    }
    uint64_t v14 = v15;
LABEL_26:
    (*((void (**)(uint64_t))*p_internalProps + 4))(v14);
    return 0;
  }
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (encodeWithCoder__onceToken != -1) {
    dispatch_once(&encodeWithCoder__onceToken, &__block_literal_global_35);
  }
  unint64_t options = self->options;
  if ((_NSPointerFunctionCoding_isValidOptions(options) & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v20 = @"NSHashTable has invalid options for encoding";
    goto LABEL_27;
  }
  unint64_t count = self->count;
  unint64_t v7 = _NSPointerFunctionCoding_bufferForCount(count);
  if (!v7)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C4A0];
    v20 = @"NSPointerArray is too big to encode";
LABEL_27:
    objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v20 userInfo:0]);
  }
  id v8 = v7;
  unint64_t v21 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v9 = [(NSConcretePointerArray *)self countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v9)
  {
    unint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(self);
        }
        if (v11 > count) {
          goto LABEL_26;
        }
        v8[v11++] = *(void *)(*((void *)&v23 + 1) + 8 * i);
        unint64_t v21 = v11;
      }
      unint64_t v10 = [(NSConcretePointerArray *)self countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }
  unint64_t v14 = options & 7;
  BOOL v15 = v14 != 5;
  if (v11 >= count) {
    BOOL v15 = 0;
  }
  if (v11 > count || v15)
  {
LABEL_26:
    free(v8);
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v20 = @"NSPointerArray was modified while encoding";
    goto LABEL_27;
  }
  [a3 encodeValueOfObjCType:"i" at:&self->options];
  [a3 encodeValueOfObjCType:"i" at:&v21];
  if (v21)
  {
    for (unint64_t j = 0; j < v21; ++j)
    {
      uint64_t v17 = v8[j];
      if (v14 == 5) {
        [a3 encodeConditionalObject:v17];
      }
      else {
        [a3 encodeObject:v17];
      }
    }
  }
  [a3 encodeObject:0];
  free(v8);
}

void __42__NSConcretePointerArray_encodeWithCoder___block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v0 = _NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
  }
}

- (void)_markNeedsCompaction
{
  self->needsCompaction = 1;
}

- (unint64_t)indexOfPointer:(void *)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->count)
  {
    p_slice = &self->slice;
    do
    {
      uint64_t v6 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(p_slice->items, 0);
      if (v6)
      {
        uint64_t v7 = v6;
        char v8 = (*((uint64_t (**)(uint64_t, void *, void))self->slice.personalityProps + 3))(v6, a3, *((void *)self->slice.personalityProps + 1));
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v7);
        if (v8) {
          return 0;
        }
      }
      else
      {
        (*((void (**)(void))self->slice.internalProps + 4))();
      }
    }
    while (self->count);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)removePointer:(void *)a3
{
  if (a3 && self->count)
  {
    p_slice = &self->slice;
    while (1)
    {
      uint64_t v6 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(p_slice->items, 0);
      if (v6)
      {
        uint64_t v7 = v6;
        if ((*((unsigned int (**)(uint64_t, void *, void))self->slice.personalityProps + 3))(v6, a3, *((void *)self->slice.personalityProps + 1)))
        {
          break;
        }
      }
      if (!self->count) {
        return;
      }
    }
    char v8 = (void (*)(uint64_t, void))*((void *)self->slice.acquisitionProps + 2);
    if (v8) {
      v8(v7, *((void *)self->slice.personalityProps + 1));
    }
    (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[self->count]);
    unint64_t v9 = (void (*)(uint64_t))*((void *)self->slice.internalProps + 4);
    v9(v7);
  }
}

@end