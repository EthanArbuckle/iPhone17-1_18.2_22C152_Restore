@interface NSConcreteMutableData
- (BOOL)_canUseRealloc;
- (BOOL)_providesConcreteBacking;
- (NSConcreteMutableData)init;
- (NSConcreteMutableData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6;
- (NSConcreteMutableData)initWithCapacity:(unint64_t)a3;
- (NSConcreteMutableData)initWithLength:(unint64_t)a3;
- (const)bytes;
- (unint64_t)length;
- (void)_freeBytes;
- (void)appendBytes:(const void *)a3 length:(unint64_t)a4;
- (void)appendData:(id)a3;
- (void)dealloc;
- (void)increaseLengthBy:(unint64_t)a3;
- (void)mutableBytes;
- (void)replaceBytesInRange:(_NSRange)a3 withBytes:(const void *)a4;
- (void)resetBytesInRange:(_NSRange)a3;
- (void)setLength:(unint64_t)a3;
@end

@implementation NSConcreteMutableData

- (const)bytes
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(NSConcreteMutableData *, uint64_t, void))*MEMORY[0x1E4F1CC10])(self, v2, *MEMORY[0x1E4F1CBD0]);
  }
  return self->_bytes;
}

- (void)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  NSUInteger v5 = a4;
  if (*MEMORY[0x1E4F1CC18])
  {
    ((void (*)(NSConcreteMutableData *, uint64_t, void))*MEMORY[0x1E4F1CC18])(self, v4, *MEMORY[0x1E4F1CBD0]);
    if (!v5) {
      return;
    }
  }
  else if (!a4)
  {
    return;
  }
  NSUInteger length = self->_length;
  if (__CFADD__(v5, length))
  {
    v26 = _NSMethodExceptionProem((objc_class *)self, a2);
    v29.location = length;
    v29.NSUInteger length = v5;
    v27 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: range %@ causes integer overflow", v26, NSStringFromRange(v29)), 0 reason userInfo];
    objc_exception_throw(v27);
  }
  unint64_t capacity = self->_capacity;
  bytes = (char *)self->_bytes;
  if (capacity < length + v5)
  {
    unint64_t v12 = (unint64_t)&bytes[capacity];
    if (bytes) {
      BOOL v13 = v12 > (unint64_t)a3;
    }
    else {
      BOOL v13 = 0;
    }
    BOOL v14 = !v13 || bytes >= (char *)a3 + v5;
    unint64_t v15 = (unint64_t)a3;
    if (v14) {
      goto LABEL_19;
    }
    unint64_t v16 = (unint64_t)malloc_type_malloc(v5, 0x7AE8436CuLL);
    unint64_t v15 = v16;
    size_t v17 = v5;
    v18 = (char *)a3;
    if (v5 >= 0x80000)
    {
      v19 = (void *)MEMORY[0x1E4F14B00];
      size_t v17 = v5;
      v18 = (char *)a3;
      if (((*MEMORY[0x1E4F14B00] - 1) & (v16 | (unint64_t)a3)) == 0)
      {
        malloc_default_zone();
        int v20 = malloc_zone_claimed_address();
        unint64_t v16 = v15;
        size_t v17 = v5;
        v18 = (char *)a3;
        if (!v20)
        {
          NSUInteger v21 = -*v19 & v5;
          NSCopyMemoryPages(a3, (void *)v15, v21);
          size_t v17 = v5 - v21;
          if (v5 == v21)
          {
LABEL_19:
            _NSMutableDataGrowBytes((uint64_t)self, a2, length + v5, 0);
            bytes = (char *)self->_bytes;
            goto LABEL_20;
          }
          v18 = (char *)a3 + v21;
          unint64_t v16 = v15 + v21;
        }
      }
    }
    memmove((void *)v16, v18, v17);
    goto LABEL_19;
  }
  unint64_t v15 = (unint64_t)a3;
  if (!bytes) {
    goto LABEL_19;
  }
LABEL_20:
  self->_NSUInteger length = length + v5;
  unint64_t v22 = (unint64_t)&bytes[length];
  if (v5 < 0x80000
    || (v23 = (void *)MEMORY[0x1E4F14B00], ((*MEMORY[0x1E4F14B00] - 1) & (v22 | v15)) != 0)
    || (malloc_default_zone(), malloc_zone_claimed_address()))
  {
    v24 = (char *)v15;
LABEL_24:
    memmove((void *)v22, v24, v5);
    goto LABEL_25;
  }
  NSUInteger v25 = -*v23 & v5;
  NSCopyMemoryPages((const void *)v15, (void *)v22, v25);
  v5 -= v25;
  if (v5)
  {
    v24 = (char *)(v15 + v25);
    v22 += v25;
    goto LABEL_24;
  }
LABEL_25:
  if ((const void *)v15 != a3)
  {
    free((void *)v15);
  }
}

- (unint64_t)length
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(NSConcreteMutableData *, uint64_t, void))*MEMORY[0x1E4F1CC10])(self, v2, *MEMORY[0x1E4F1CBD0]);
  }
  return self->_length;
}

- (BOOL)_canUseRealloc
{
  return 1;
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

- (void)replaceBytesInRange:(_NSRange)a3 withBytes:(const void *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (*MEMORY[0x1E4F1CC18])
  {
    ((void (*)(NSConcreteMutableData *, uint64_t, void))*MEMORY[0x1E4F1CC18])(self, v4, *MEMORY[0x1E4F1CBD0]);
    if (!length) {
      return;
    }
  }
  else if (!a3.length)
  {
    return;
  }
  unint64_t v10 = self->_length;
  if (location > v10)
  {
    v28 = +[NSString stringWithFormat:@"%@: location %lu exceeds data length %lu", _NSMethodExceptionProem((objc_class *)self, a2), location, v10];
    goto LABEL_37;
  }
  if (__CFADD__(length, location))
  {
    NSRange v29 = _NSMethodExceptionProem((objc_class *)self, a2);
    v32.NSUInteger location = location;
    v32.NSUInteger length = length;
    v28 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v29, NSStringFromRange(v32), v30];
LABEL_37:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v28 userInfo:0]);
  }
  unint64_t v11 = location + length;
  unint64_t v12 = (unint64_t)a4;
  if (v10 < location + length)
  {
    unint64_t capacity = self->_capacity;
    unint64_t v12 = (unint64_t)a4;
    if (capacity >= v11)
    {
LABEL_21:
      self->_NSUInteger length = v11;
      goto LABEL_22;
    }
    bytes = (char *)self->_bytes;
    unint64_t v15 = (unint64_t)&bytes[capacity];
    if (bytes) {
      BOOL v16 = v15 > (unint64_t)a4;
    }
    else {
      BOOL v16 = 0;
    }
    BOOL v17 = !v16 || bytes >= (char *)a4 + length;
    unint64_t v12 = (unint64_t)a4;
    if (!v17)
    {
      unint64_t v18 = (unint64_t)malloc_type_malloc(length, 0xF1049D82uLL);
      unint64_t v12 = v18;
      size_t v19 = length;
      int v20 = (char *)a4;
      if (length < 0x80000) {
        goto LABEL_19;
      }
      NSUInteger v21 = (void *)MEMORY[0x1E4F14B00];
      size_t v19 = length;
      int v20 = (char *)a4;
      if (((*MEMORY[0x1E4F14B00] - 1) & (v18 | (unint64_t)a4)) != 0) {
        goto LABEL_19;
      }
      malloc_default_zone();
      int v22 = malloc_zone_claimed_address();
      unint64_t v18 = v12;
      size_t v19 = length;
      int v20 = (char *)a4;
      if (v22) {
        goto LABEL_19;
      }
      NSUInteger v23 = length & -*v21;
      NSCopyMemoryPages(a4, (void *)v12, v23);
      size_t v19 = length - v23;
      if (length != v23)
      {
        int v20 = (char *)a4 + v23;
        unint64_t v18 = v12 + v23;
LABEL_19:
        memmove((void *)v18, v20, v19);
      }
    }
    _NSMutableDataGrowBytes((uint64_t)self, a2, location + length, 0);
    goto LABEL_21;
  }
LABEL_22:
  unint64_t v24 = (unint64_t)self->_bytes + location;
  if (length < 0x80000
    || (NSUInteger v25 = (void *)MEMORY[0x1E4F14B00], ((*MEMORY[0x1E4F14B00] - 1) & (v24 | v12)) != 0)
    || (malloc_default_zone(), malloc_zone_claimed_address()))
  {
    v26 = (char *)v12;
LABEL_26:
    memmove((void *)v24, v26, length);
    goto LABEL_27;
  }
  NSUInteger v27 = length & -*v25;
  NSCopyMemoryPages((const void *)v12, (void *)v24, v27);
  length -= v27;
  if (length)
  {
    v26 = (char *)(v12 + v27);
    v24 += v27;
    goto LABEL_26;
  }
LABEL_27:
  if ((const void *)v12 != a4)
  {
    free((void *)v12);
  }
}

- (void)mutableBytes
{
  if (*MEMORY[0x1E4F1CC18]) {
    ((void (*)(NSConcreteMutableData *, uint64_t, void))*MEMORY[0x1E4F1CC18])(self, v2, *MEMORY[0x1E4F1CBD0]);
  }
  return self->_bytes;
}

- (NSConcreteMutableData)initWithLength:(unint64_t)a3
{
  uint64_t v4 = self;
  if (a3 >= 0x8000000000000001)
  {
    unint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem((objc_class *)self, a2), "length", a3, 0x8000000000000000), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  unint64_t v5 = a3 >> 2;
  if (a3 >> 30) {
    unint64_t v5 = 0;
  }
  size_t v6 = v5 + a3;
  if (v5 + a3 >= 0x80000) {
    size_t v6 = (v6 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00];
  }
  *((unsigned char *)self + 8) &= ~4u;
  v7 = malloc_default_zone();
  if (a3 <= 0x20000)
  {
    v8 = malloc_type_zone_malloc(v7, v6, 0x8B37E73CuLL);
    char v9 = 2;
  }
  else
  {
    v8 = malloc_type_zone_calloc(v7, 1uLL, v6, 0x8B297409uLL);
    char v9 = 0;
  }
  v4->_bytes = v8;
  v4->_unint64_t capacity = v6;
  *((unsigned char *)v4 + 8) = *((unsigned char *)v4 + 8) & 0xFD | v9;
  if (v4->_bytes)
  {
    [(NSConcreteMutableData *)v4 setLength:a3];
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)setLength:(unint64_t)a3
{
  if (*MEMORY[0x1E4F1CC18]) {
    ((void (*)(NSConcreteMutableData *, uint64_t, void))*MEMORY[0x1E4F1CC18])(self, v3, *MEMORY[0x1E4F1CBD0]);
  }
  if (a3 >= 0x8000000000000001)
  {
    char v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem((objc_class *)self, a2), "length", a3, 0x8000000000000000), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  if (self->_capacity >= a3 && (bytes = (char *)self->_bytes) != 0)
  {
    unint64_t length = self->_length;
    if (a3 > length && (*((unsigned char *)self + 8) & 2) != 0)
    {
      bzero(&bytes[length], a3 - length);
    }
    else if (a3 < length)
    {
      *((unsigned char *)self + 8) |= 2u;
    }
  }
  else
  {
    _NSMutableDataGrowBytes((uint64_t)self, a2, a3, 1);
  }
  self->_unint64_t length = a3;
}

- (NSConcreteMutableData)initWithCapacity:(unint64_t)a3
{
  uint64_t v3 = self;
  if (a3 >= 0x8000000000000001)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem((objc_class *)self, a2), "capacity", a3, 0x8000000000000000), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  unint64_t v4 = a3 >> 2;
  if (a3 >> 30) {
    unint64_t v4 = 0;
  }
  size_t v5 = v4 + a3;
  if (v4 + a3 >= 0x80000) {
    size_t v5 = (v5 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00];
  }
  self->_unint64_t length = 0;
  *((unsigned char *)self + 8) &= ~4u;
  size_t v6 = malloc_default_zone();
  v3->_bytes = malloc_type_zone_malloc(v6, v5, 0x8B37E73CuLL);
  v3->_unint64_t capacity = v5;
  *((unsigned char *)v3 + 8) |= 2u;
  if (!v3->_bytes)
  {

    return 0;
  }
  return v3;
}

- (NSConcreteMutableData)init
{
  return [(NSConcreteMutableData *)self initWithCapacity:0];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NSConcreteMutableData *)self _freeBytes];
  v3.receiver = self;
  v3.super_class = (Class)NSConcreteMutableData;
  [(NSConcreteMutableData *)&v3 dealloc];
}

- (void)_freeBytes
{
  if (self->_bytes)
  {
    if ((*((unsigned char *)self + 8) & 4) != 0) {
      NSDeallocateMemoryPages(self->_bytes, self->_capacity);
    }
    else {
      free(self->_bytes);
    }
  }
}

- (NSConcreteMutableData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  if (a4 >= 0x8000000000000001)
  {
    BOOL v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem((objc_class *)self, a2), "length", a4, 0x8000000000000000), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  char v9 = [(NSConcreteMutableData *)self initWithCapacity:a4];
  unint64_t v10 = v9;
  if (v9)
  {
    unint64_t bytes = (unint64_t)v9->_bytes;
    if (a4 < 0x80000)
    {
      BOOL v14 = (char *)a3;
      size_t v13 = a4;
      if (!a4)
      {
LABEL_9:
        if (a6) {
          (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, a4);
        }
        v10->_unint64_t length = a4;
        return v10;
      }
    }
    else
    {
      unint64_t v12 = (void *)MEMORY[0x1E4F14B00];
      if (((*MEMORY[0x1E4F14B00] - 1) & (bytes | (unint64_t)a3)) != 0
        || (malloc_default_zone(), malloc_zone_claimed_address()))
      {
        size_t v13 = a4;
        BOOL v14 = (char *)a3;
      }
      else
      {
        NSUInteger v16 = -*v12 & a4;
        NSCopyMemoryPages(a3, (void *)bytes, v16);
        BOOL v14 = (char *)a3 + v16;
        bytes += v16;
        size_t v13 = a4 - v16;
        if (a4 == v16) {
          goto LABEL_9;
        }
      }
    }
    memmove((void *)bytes, v14, v13);
    goto LABEL_9;
  }
  return v10;
}

- (void)appendData:(id)a3
{
  v6[5] = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC18]) {
    ((void (*)(NSConcreteMutableData *, uint64_t, void))*MEMORY[0x1E4F1CC18])(self, v3, *MEMORY[0x1E4F1CBD0]);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NSConcreteMutableData_appendData___block_invoke;
  v6[3] = &unk_1E51F7018;
  v6[4] = self;
  [a3 enumerateByteRangesUsingBlock:v6];
}

uint64_t __36__NSConcreteMutableData_appendData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", a2);
}

- (void)increaseLengthBy:(unint64_t)a3
{
  if (*MEMORY[0x1E4F1CC18])
  {
    ((void (*)(NSConcreteMutableData *, uint64_t, void))*MEMORY[0x1E4F1CC18])(self, v3, *MEMORY[0x1E4F1CBD0]);
    if (!a3) {
      return;
    }
  }
  else if (!a3)
  {
    return;
  }
  if (a3 >= 0x8000000000000001)
  {
    unint64_t v10 = +[NSString stringWithFormat:@"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem((objc_class *)self, a2), "extra length", a3, 0x8000000000000000];
    unint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    unint64_t v12 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_16;
  }
  unint64_t length = self->_length;
  if (__CFADD__(a3, length))
  {
    NSUInteger v13 = self->_length;
    BOOL v14 = _NSMethodExceptionProem((objc_class *)self, a2);
    v15.NSUInteger location = v13;
    v15.unint64_t length = a3;
    unint64_t v10 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v14, NSStringFromRange(v15)];
    unint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    unint64_t v12 = (void *)MEMORY[0x1E4F1C4A8];
LABEL_16:
    objc_exception_throw((id)[v11 exceptionWithName:*v12 reason:v10 userInfo:0]);
  }
  unint64_t v8 = length + a3;
  if (self->_capacity >= length + a3 && (unint64_t bytes = (char *)self->_bytes) != 0)
  {
    if ((*((unsigned char *)self + 8) & 2) != 0) {
      bzero(&bytes[length], a3);
    }
  }
  else
  {
    _NSMutableDataGrowBytes((uint64_t)self, a2, length + a3, 1);
  }
  self->_unint64_t length = v8;
}

- (void)resetBytesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (*MEMORY[0x1E4F1CC18])
  {
    ((void (*)(NSConcreteMutableData *, uint64_t, void))*MEMORY[0x1E4F1CC18])(self, v3, *MEMORY[0x1E4F1CBD0]);
    if (!length) {
      return;
    }
  }
  else if (!a3.length)
  {
    return;
  }
  unint64_t v8 = self->_length;
  if (location > v8)
  {
    unint64_t v11 = +[NSString stringWithFormat:@"%@: location %lu exceeds data length %lu", _NSMethodExceptionProem((objc_class *)self, a2), location, self->_length];
    goto LABEL_16;
  }
  if (__CFADD__(length, location))
  {
    unint64_t v12 = _NSMethodExceptionProem((objc_class *)self, a2);
    v15.NSUInteger location = location;
    v15.NSUInteger length = length;
    unint64_t v11 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v12, NSStringFromRange(v15), v13];
LABEL_16:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v11 userInfo:0]);
  }
  unint64_t v9 = location + length;
  if (v8 < location + length)
  {
    if (self->_capacity < v9) {
      _NSMutableDataGrowBytes((uint64_t)self, a2, location + length, 0);
    }
    self->_NSUInteger length = v9;
  }
  unint64_t v10 = (char *)self->_bytes + location;

  bzero(v10, length);
}

@end