@interface _PFEncodedData
+ (Class)classForKeyedUnarchiver;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqualToData:(id)a3;
- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4;
- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4;
- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (Class)classForCoder;
- (_NSRange)rangeOfData:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5;
- (_PFEncodedData)init;
- (_PFEncodedData)retain;
- (const)bytes;
- (id)description;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)subdataWithRange:(_NSRange)a3;
- (uint64_t)privateCopy;
- (unint64_t)length;
- (unint64_t)retainCount;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
- (void)release;
@end

@implementation _PFEncodedData

- (const)bytes
{
  return &self[1];
}

- (unint64_t)length
{
  return self->_byteCount;
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
}

- (void)release
{
}

- (_PFEncodedData)retain
{
  v3 = self->_aData;
  return self;
}

- (BOOL)isEqualToData:(id)a3
{
  uint64_t byteCount = self->_byteCount;
  if ([a3 length] != byteCount) {
    return 0;
  }
  BytePtr = CFDataGetBytePtr((CFDataRef)a3);
  return memcmp(&self[1], BytePtr, self->_byteCount) == 0;
}

- (_PFEncodedData)init
{
  self->_reserved = 0;

  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"You're doing it wrong" reason:@"Class cannot be used this way." userInfo:0]);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (unint64_t)retainCount
{
  return [(NSData *)self->_aData retainCount];
}

- (BOOL)_isDeallocating
{
  return [(NSData *)self->_aData _isDeallocating];
}

- (BOOL)_tryRetain
{
  return [(NSData *)self->_aData _tryRetain];
}

- (id)description
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&self[1] length:self->_byteCount];
  v3 = (void *)[v2 description];

  return v3;
}

- (id)mutableCopy
{
  return [(_PFEncodedData *)self mutableCopyWithZone:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = self + 1;
  v5 = (void *)[MEMORY[0x1E4F1CA58] allocWithZone:a3];
  uint64_t byteCount = self->_byteCount;

  return (id)[v5 initWithBytes:v4 length:byteCount];
}

- (uint64_t)privateCopy
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = result + 24;
    id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v4 = *(unsigned int *)(v1 + 16);
    return [v3 initWithBytesNoCopy:v2 length:v4];
  }
  return result;
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
}

- (id)subdataWithRange:(_NSRange)a3
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:(char *)&self[1] + a3.location length:a3.length];
}

- (_NSRange)rangeOfData:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5
{
  if (!a3) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Data may not be nil", 0, a5.length));
  }
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v9 = (void *)-[_PFEncodedData privateCopy]((uint64_t)self);
  uint64_t v10 = objc_msgSend(v9, "rangeOfData:options:range:", a3, a4, location, length);
  NSUInteger v12 = v11;

  NSUInteger v13 = v10;
  NSUInteger v14 = v12;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v8 = (void *)-[_PFEncodedData privateCopy]((uint64_t)self);
  LOBYTE(a5) = [v8 writeToFile:a3 options:a4 error:a5];

  return (char)a5;
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  return [(_PFEncodedData *)self writeToFile:a3 options:1 error:0];
}

- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v8 = (void *)-[_PFEncodedData privateCopy]((uint64_t)self);
  LOBYTE(a5) = [v8 writeToURL:a3 options:a4 error:a5];

  return (char)a5;
}

- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4
{
  return [(_PFEncodedData *)self writeToURL:a3 options:1 error:0];
}

@end