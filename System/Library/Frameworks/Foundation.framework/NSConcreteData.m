@interface NSConcreteData
- (BOOL)_copyWillRetain;
- (BOOL)_isCompact;
- (BOOL)_providesConcreteBacking;
- (NSConcreteData)init;
- (NSConcreteData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6;
- (NSConcreteData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 freeWhenDone:(BOOL)a6 bytesAreVM:(BOOL)a7;
- (const)bytes;
- (id)_createDispatchData;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)length;
- (void)dealloc;
- (void)getBytes:(void *)a3;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
@end

@implementation NSConcreteData

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  v4 = (char *)a3;
  if (self->_length >= a4) {
    size_t length = a4;
  }
  else {
    size_t length = self->_length;
  }
  unint64_t bytes = (unint64_t)self->_bytes;
  if (length < 0x80000)
  {
LABEL_8:
    if (!length) {
      return;
    }
    goto LABEL_9;
  }
  v7 = (void *)MEMORY[0x1E4F14B00];
  if (((*MEMORY[0x1E4F14B00] - 1) & (bytes | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v8 = length & -*v7;
      NSCopyMemoryPages((const void *)bytes, v4, v8);
      bytes += v8;
      v4 += v8;
      length -= v8;
      goto LABEL_8;
    }
  }
LABEL_9:

  memmove(v4, (const void *)bytes, length);
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  if (!a4.length) {
    return;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  int v9 = _CFExecutableLinkedOnOrAfter();
  unint64_t v10 = self->_length;
  if (!v9)
  {
    if (v10 > location)
    {
      if (length >= v10 - location) {
        NSUInteger length = v10 - location;
      }
      goto LABEL_9;
    }
    v21 = (NSString *)location;
    unint64_t v22 = self->_length;
    v20 = _NSMethodExceptionProem((objc_class *)self, a2);
    v14 = @"%@: location %lu exceeds data length %lu";
LABEL_20:
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v20, v21, v22);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v19 userInfo:0]);
  }
  if (__CFADD__(length, location))
  {
    v18 = _NSMethodExceptionProem((objc_class *)self, a2);
    v25.NSUInteger location = location;
    v25.NSUInteger length = length;
    v20 = v18;
    v21 = NSStringFromRange(v25);
    v14 = @"%@: range %@ causes integer overflow";
    goto LABEL_20;
  }
  if (location + length > v10)
  {
    v11 = a2;
    unint64_t v12 = self->_length;
    v13 = _NSMethodExceptionProem((objc_class *)self, v11);
    v24.NSUInteger location = location;
    v24.NSUInteger length = length;
    v21 = NSStringFromRange(v24);
    unint64_t v22 = v12;
    v20 = v13;
    v14 = @"%@: range %@ exceeds data length %lu";
    goto LABEL_20;
  }
LABEL_9:
  unint64_t v15 = (unint64_t)self->_bytes + location;
  if (length < 0x80000) {
    goto LABEL_13;
  }
  v16 = (void *)MEMORY[0x1E4F14B00];
  if (((*MEMORY[0x1E4F14B00] - 1) & (v15 | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v17 = length & -*v16;
      NSCopyMemoryPages((const void *)v15, a3, v17);
      v15 += v17;
      a3 = (char *)a3 + v17;
      length -= v17;
LABEL_13:
      if (!length) {
        return;
      }
    }
  }

  memmove(a3, (const void *)v15, length);
}

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  return self->_bytes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(NSConcreteData *)self _copyWillRetain])
  {
    return self;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NSConcreteData;
    return [(NSData *)&v6 copyWithZone:a3];
  }
}

- (BOOL)_copyWillRetain
{
  return !_CFExecutableLinkedOnOrAfter() || self->_deallocator != 0;
}

- (NSConcreteData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  uint64_t v7 = self;
  if (a4 >= 0x8000000000000001)
  {
    v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem((objc_class *)self, a2), "length", a4, 0x8000000000000000), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  if (!a4)
  {
    self->_unint64_t bytes = 0;
    if (a6) {
      (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, self->_length);
    }
    goto LABEL_17;
  }
  if (!a5)
  {
    self->_unint64_t bytes = a3;
    if (a6) {
      self->_deallocator = _Block_copy(a6);
    }
    goto LABEL_17;
  }
  unint64_t v10 = malloc_default_zone();
  unint64_t v11 = (unint64_t)malloc_type_zone_malloc(v10, a4, 0x8B37E73CuLL);
  v7->_unint64_t bytes = (void *)v11;
  if (!v11)
  {

    return 0;
  }
  unint64_t v12 = (char *)v11;
  if (a4 < 0x80000
    || (v13 = (void *)MEMORY[0x1E4F14B00], ((*MEMORY[0x1E4F14B00] - 1) & (v11 | (unint64_t)a3)) != 0)
    || (malloc_default_zone(), malloc_zone_claimed_address()))
  {
    size_t v14 = a4;
    unint64_t v15 = (char *)a3;
LABEL_9:
    memmove(v12, v15, v14);
    goto LABEL_10;
  }
  NSUInteger v17 = -*v13 & a4;
  NSCopyMemoryPages(a3, v12, v17);
  size_t v14 = a4 - v17;
  if (a4 != v17)
  {
    unint64_t v15 = (char *)a3 + v17;
    v12 += v17;
    goto LABEL_9;
  }
LABEL_10:
  v7->_deallocator = _Block_copy(&__block_literal_global_6);
  if (a6) {
    (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, a4);
  }
LABEL_17:
  v7->_NSUInteger length = a4;
  return v7;
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

- (BOOL)_isCompact
{
  return 1;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
  if (deallocator)
  {
    unint64_t bytes = self->_bytes;
    if (bytes)
    {
      deallocator[2](deallocator, bytes, self->_length);
      deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
    }
    _Block_release(deallocator);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSConcreteData;
  [(NSConcreteData *)&v5 dealloc];
}

- (id)_createDispatchData
{
  char v3 = ![(NSConcreteData *)self _copyWillRetain];

  return (id)_NSDataCreateDispatchDataFromData(self, v3);
}

- (void)getBytes:(void *)a3
{
  char v3 = (char *)a3;
  unint64_t bytes = (unint64_t)self->_bytes;
  size_t length = self->_length;
  if (length < 0x80000)
  {
LABEL_5:
    if (!length) {
      return;
    }
    goto LABEL_6;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F14B00];
  if (((*MEMORY[0x1E4F14B00] - 1) & (bytes | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v7 = length & -*v6;
      NSCopyMemoryPages((const void *)bytes, v3, v7);
      bytes += v7;
      v3 += v7;
      length -= v7;
      goto LABEL_5;
    }
  }
LABEL_6:

  memmove(v3, (const void *)bytes, length);
}

- (NSConcreteData)init
{
  return [(NSConcreteData *)self initWithBytes:0 length:0 copy:0 freeWhenDone:0 bytesAreVM:0];
}

- (NSConcreteData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 freeWhenDone:(BOOL)a6 bytesAreVM:(BOOL)a7
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSConcreteData;
  return [(NSData *)&v8 initWithBytes:a3 length:a4 copy:a5 freeWhenDone:a6 bytesAreVM:a7];
}

@end