@interface _NSDispatchData
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsDirectEncoding;
- (BOOL)_isDispatchData;
- (Class)classForCoder;
- (_NSDispatchData)initWithCoder:(id)a3;
- (id)_createDispatchData;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateByteRangesUsingBlock:(id)a3;
- (void)getBytes:(void *)a3;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
@end

@implementation _NSDispatchData

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (BOOL)_isDispatchData
{
  return 1;
}

- (id)_createDispatchData
{
  return self;
}

- (id)subdataWithRange:(_NSRange)a3
{
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    unint64_t v7 = [(NSData *)self length];
    if (__CFADD__(length, location))
    {
      v11 = _NSMethodExceptionProem((objc_class *)self, a2);
      v17.NSUInteger location = location;
      v17.NSUInteger length = length;
      v12 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v11, NSStringFromRange(v17), v15];
    }
    else
    {
      if (location + length <= v7)
      {
        dispatch_data_t subrange = dispatch_data_create_subrange(&self->super.super, location, length);
        return subrange;
      }
      unint64_t v13 = v7;
      v14 = _NSMethodExceptionProem((objc_class *)self, a2);
      v18.NSUInteger location = location;
      v18.NSUInteger length = length;
      v12 = +[NSString stringWithFormat:@"%@: range %@ exceeds data length %lu", v14, NSStringFromRange(v18), v13];
    }
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v12 userInfo:0]);
  }
  v10 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)objc_msgSend(v10, "data", a3.location);
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    if (objc_opt_isKindOfClass())
    {
      xpc_object_t v5 = xpc_data_create_with_dispatch_data(&self->super.super);
      [a3 encodeXPCObject:v5 forKey:@"NS.xpcdata"];
      xpc_release(v5);
    }
    else
    {
      size_t v6 = [(NSData *)self length];
      if ([(NSData *)self _isCompact])
      {
        unint64_t v7 = [(NSData *)self bytes];
        [a3 encodeBytes:v7 length:v6 forKey:@"NS.bytes"];
      }
      else
      {
        v8 = malloc_type_malloc(v6, 0x44867618uLL);
        [(_NSDispatchData *)self getBytes:v8 length:v6];
        [a3 encodeBytes:v8 length:v6 forKey:@"NS.bytes"];
        free(v8);
      }
    }
  }
  else
  {
    [a3 encodeDataObject:self];
  }
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  v16[4] = *MEMORY[0x1E4F143B8];
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    unint64_t v9 = [(NSData *)self length];
    if (__CFADD__(length, location))
    {
      v10 = _NSMethodExceptionProem((objc_class *)self, a2);
      v17.NSUInteger location = location;
      v17.NSUInteger length = length;
      v11 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v10, NSStringFromRange(v17), v14];
    }
    else
    {
      if (location + length <= v9)
      {
        v16[0] = 0;
        v16[1] = v16;
        v16[2] = 0x2020000000;
        v16[3] = a3;
        applier[0] = MEMORY[0x1E4F143A8];
        applier[1] = 3221225472;
        applier[2] = __34___NSDispatchData_getBytes_range___block_invoke;
        applier[3] = &unk_1E51FEF60;
        applier[5] = location;
        applier[6] = length;
        applier[4] = v16;
        dispatch_data_apply(&self->super.super, applier);
        _Block_object_dispose(v16, 8);
        return;
      }
      unint64_t v12 = v9;
      unint64_t v13 = _NSMethodExceptionProem((objc_class *)self, a2);
      v18.NSUInteger location = location;
      v18.NSUInteger length = length;
      v11 = +[NSString stringWithFormat:@"%@: range %@ exceeds data length %lu", v13, NSStringFromRange(v18), v12];
    }
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v11 userInfo:0]);
  }
}

- (Class)classForCoder
{
  return (Class)self;
}

- (void)enumerateByteRangesUsingBlock:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49___NSDispatchData_enumerateByteRangesUsingBlock___block_invoke;
  v3[3] = &unk_1E51FEF38;
  v3[4] = a3;
  dispatch_data_apply(&self->super.super, v3);
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  unint64_t v4 = a4;
  if ([(NSData *)self length] < a4) {
    unint64_t v4 = [(NSData *)self length];
  }

  -[_NSDispatchData getBytes:range:](self, "getBytes:range:", a3, 0, v4);
}

- (void)getBytes:(void *)a3
{
  size_t size = dispatch_data_get_size(&self->super.super);

  -[_NSDispatchData getBytes:range:](self, "getBytes:range:", a3, 0, size);
}

- (unint64_t)hash
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  size_t size = dispatch_data_get_size(&self->super.super);
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __23___NSDispatchData_hash__block_invoke;
  applier[3] = &unk_1E51FEF88;
  applier[4] = &v13;
  applier[5] = size;
  BOOL v4 = dispatch_data_apply(&self->super.super, applier);
  unint64_t v5 = v14[3];
  if (!v5)
  {
    if (size >= 0x50) {
      size_t size = 80;
    }
    double v6 = MEMORY[0x1F4188790](v4);
    -[_NSDispatchData getBytes:range:](self, "getBytes:range:", (char *)&applier[-1] - v7, 0, size, v6);
    uint64_t v8 = CFHashBytes();
    unint64_t v9 = v14;
    v14[3] = v8;
    unint64_t v5 = v9[3];
  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSDispatchData)initWithCoder:(id)a3
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Decoding an _NSDispatchData directly is not allowed" userInfo:0]);
}

@end