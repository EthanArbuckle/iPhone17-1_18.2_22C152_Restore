@interface NSConstantString
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)canBeConvertedToEncoding:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (NSConstantString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4;
- (const)_fastCStringContents:(BOOL)a3;
- (const)cString;
- (const)lossyCString;
- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5;
- (unint64_t)cStringLength;
- (unint64_t)fastestEncoding;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)retainCount;
- (unint64_t)smallestEncoding;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation NSConstantString

- (NSConstantString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4
{
  return 0;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (self->super.numBytes <= a3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Index %lu out of bounds; string length %lu",
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a3,
                     self->super.numBytes),
                   0);
    objc_exception_throw(v4);
  }
  return *(_WORD *)(_NSCStringCharToUnicharTable + 2 * self->super.bytes[a3]);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if (a4.location + a4.length > self->super.numBytes)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a4.location,
                     a4.length,
                     self->super.numBytes),
                   0);
    objc_exception_throw(v7);
  }
  if (a4.length)
  {
    uint64_t v4 = _NSCStringCharToUnicharTable;
    v5 = &self->super.bytes[a4.location];
    do
    {
      unsigned int v6 = *v5++;
      *a3++ = *(_WORD *)(v4 + 2 * v6);
      --a4.length;
    }
    while (a4.length);
  }
}

- (unint64_t)length
{
  return self->super.numBytes;
}

- (unint64_t)cStringLength
{
  return self->super.numBytes;
}

- (unint64_t)fastestEncoding
{
  return _NSCStringEncoding;
}

- (unint64_t)smallestEncoding
{
  return _NSCStringEncoding;
}

- (BOOL)canBeConvertedToEncoding:(unint64_t)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (_NSCStringEncoding == a3) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSConstantString;
  return -[NSSimpleCString canBeConvertedToEncoding:](&v4, sel_canBeConvertedToEncoding_);
}

- (const)_fastCStringContents:(BOOL)a3
{
  if (a3) {
    return 0;
  }
  else {
    return self->super.bytes;
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    if (!a3) {
      goto LABEL_8;
    }
    int v5 = _NSIsNSString();
    if (!v5) {
      return v5;
    }
    uint64_t v6 = [a3 _fastCStringContents:0];
    if (!v6)
    {
      v10.receiver = self;
      v10.super_class = (Class)NSConstantString;
      LOBYTE(v5) = [(NSSimpleCString *)&v10 isEqual:a3];
      return v5;
    }
    v7 = (const void *)v6;
    uint64_t numBytes = self->super.numBytes;
    if ([a3 length] != numBytes)
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = memcmp(self->super.bytes, v7, self->super.numBytes) == 0;
  }
  return v5;
}

- (BOOL)isEqualToString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v5 = [a3 _fastCStringContents:0];
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    uint64_t numBytes = self->super.numBytes;
    if ([a3 length] == numBytes) {
      return memcmp(self->super.bytes, v6, self->super.numBytes) == 0;
    }
    return 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)NSConstantString;
  return [(NSSimpleCString *)&v9 isEqualToString:a3];
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self == a3) {
    return 0;
  }
  if (!a3) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)NSConstantString;
  return -[NSSimpleCString compare:options:range:](&v6, sel_compare_options_range_, a3, a4, a5.location, a5.length);
}

- (unint64_t)hash
{
  return CFStringHashCString();
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)dealloc
{
  uint64_t v2 = objc_opt_class();
  NSLog((NSString *)@"*** dealloc called for %@", v2);
}

- (const)cString
{
  return self->super.bytes;
}

- (const)lossyCString
{
  return self->super.bytes;
}

@end