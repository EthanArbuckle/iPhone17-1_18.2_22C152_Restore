@interface NSSubrangeData
- (BOOL)_isCompact;
- (NSSubrangeData)init;
- (NSSubrangeData)initWithData:(id)a3 range:(_NSRange)a4;
- (const)bytes;
- (unint64_t)length;
- (void)dealloc;
- (void)getBytes:(void *)a3;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
@end

@implementation NSSubrangeData

- (const)bytes
{
  return [(NSData *)self->_data bytes] + self->_range.location;
}

- (NSSubrangeData)initWithData:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v9 = [a3 length];
  if (__CFADD__(length, location))
  {
    v12 = _NSMethodExceptionProem((objc_class *)self, a2);
    v22.NSUInteger location = location;
    v22.NSUInteger length = length;
    v13 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v12, NSStringFromRange(v22), v20];
    goto LABEL_14;
  }
  if (location + length > v9)
  {
    unint64_t v14 = v9;
    v15 = _NSMethodExceptionProem((objc_class *)self, a2);
    v16 = v15;
    if (length)
    {
      v23.NSUInteger location = location;
      v23.NSUInteger length = length;
      v19 = NSStringFromRange(v23);
      unint64_t v21 = v14;
      v18 = v16;
      v17 = @"%@: range %@ exceeds data length %lu";
    }
    else
    {
      v19 = (NSString *)location;
      unint64_t v21 = v14;
      v18 = v15;
      v17 = @"%@: location %lu exceeds data length %lu";
    }
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18, v19, v21);
LABEL_14:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v13 userInfo:0]);
  }
  if (objc_opt_isKindOfClass())
  {
    self->_range.NSUInteger location = *((void *)a3 + 1) + location;
    self->_range.NSUInteger length = length;
    v10 = (NSData *)*((id *)a3 + 3);
  }
  else
  {
    self->_range.NSUInteger location = location;
    self->_range.NSUInteger length = length;
    v10 = (NSData *)[a3 copyWithZone:0];
  }
  self->_data = v10;
  if (!v10)
  {

    return 0;
  }
  return self;
}

- (unint64_t)length
{
  return self->_range.length;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSSubrangeData;
  [(NSSubrangeData *)&v3 dealloc];
}

- (BOOL)_isCompact
{
  return [(NSData *)self->_data _isCompact];
}

- (void)getBytes:(void *)a3
{
  int v5 = _CFExecutableLinkedOnOrAfter();
  data = self->_data;
  if (v5)
  {
    NSUInteger location = self->_range.location;
    NSUInteger length = self->_range.length;
    -[NSData getBytes:range:](data, "getBytes:range:", a3, location, length);
    return;
  }
  uint64_t v9 = [(NSData *)data bytes];
  NSUInteger v10 = self->_range.location;
  size_t v11 = self->_range.length;
  NSUInteger v12 = v9 + v10;
  if (v11 < 0x80000) {
    goto LABEL_9;
  }
  v13 = (void *)MEMORY[0x1E4F14B00];
  if (((*MEMORY[0x1E4F14B00] - 1) & (v12 | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v14 = v11 & -*v13;
      NSCopyMemoryPages((const void *)v12, a3, v14);
      v12 += v14;
      a3 = (char *)a3 + v14;
      v11 -= v14;
LABEL_9:
      if (!v11) {
        return;
      }
    }
  }

  memmove(a3, (const void *)v12, v11);
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  p_range = &self->_range;
  if (self->_range.length >= a4) {
    size_t length = a4;
  }
  else {
    size_t length = self->_range.length;
  }
  int v8 = _CFExecutableLinkedOnOrAfter();
  data = self->_data;
  if (v8)
  {
    NSUInteger location = p_range->location;
    -[NSData getBytes:range:](data, "getBytes:range:", a3, location, length);
    return;
  }
  uint64_t v11 = (uint64_t)([(NSData *)data bytes] + p_range->location);
  if (length < 0x80000) {
    goto LABEL_12;
  }
  NSUInteger v12 = (void *)MEMORY[0x1E4F14B00];
  if (((*MEMORY[0x1E4F14B00] - 1) & (v11 | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v13 = length & -*v12;
      NSCopyMemoryPages((const void *)v11, a3, v13);
      v11 += v13;
      a3 = (char *)a3 + v13;
      length -= v13;
LABEL_12:
      if (!length) {
        return;
      }
    }
  }

  memmove(a3, (const void *)v11, length);
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  if (!a4.length) {
    return;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  int v9 = _CFExecutableLinkedOnOrAfter();
  NSUInteger v10 = self->_range.length;
  if (!v9)
  {
    if (v10 > location)
    {
      if (length >= v10 - location) {
        NSUInteger length = v10 - location;
      }
      goto LABEL_9;
    }
    unint64_t v21 = (NSString *)location;
    NSUInteger v22 = self->_range.length;
    uint64_t v20 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSUInteger v14 = @"%@: location %lu exceeds data length %lu";
LABEL_20:
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v20, v21, v22);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v19 userInfo:0]);
  }
  if (__CFADD__(length, location))
  {
    v18 = _NSMethodExceptionProem((objc_class *)self, a2);
    v25.NSUInteger location = location;
    v25.NSUInteger length = length;
    uint64_t v20 = v18;
    unint64_t v21 = NSStringFromRange(v25);
    NSUInteger v14 = @"%@: range %@ causes integer overflow";
    goto LABEL_20;
  }
  if (location + length > v10)
  {
    uint64_t v11 = a2;
    NSUInteger v12 = self->_range.length;
    NSUInteger v13 = _NSMethodExceptionProem((objc_class *)self, v11);
    v24.NSUInteger location = location;
    v24.NSUInteger length = length;
    unint64_t v21 = NSStringFromRange(v24);
    NSUInteger v22 = v12;
    uint64_t v20 = v13;
    NSUInteger v14 = @"%@: range %@ exceeds data length %lu";
    goto LABEL_20;
  }
LABEL_9:
  unint64_t v15 = (unint64_t)([(NSData *)self->_data bytes] + self->_range.location + location);
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

- (NSSubrangeData)init
{
  objc_super v3 = +[NSString stringWithFormat:@"%@: should never be called", _NSMethodExceptionProem((objc_class *)self, a2)];

  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v3 userInfo:0]);
}

@end