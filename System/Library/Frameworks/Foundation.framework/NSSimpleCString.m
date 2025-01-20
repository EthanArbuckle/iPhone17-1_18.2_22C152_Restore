@interface NSSimpleCString
+ (NSSimpleCString)allocWithZone:(_NSZone *)a3;
- (BOOL)canBeConvertedToEncoding:(unint64_t)a3;
- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9;
- (BOOL)hasPrefix:(id)a3;
- (BOOL)hasSuffix:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (NSSimpleCString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4;
- (const)_fastCStringContents:(BOOL)a3;
- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringByAppendingString:(id)a3;
- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5;
- (unint64_t)cStringLength;
- (unint64_t)fastestEncoding;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)smallestEncoding;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation NSSimpleCString

+ (NSSimpleCString)allocWithZone:(_NSZone *)a3
{
  return (NSSimpleCString *)NSAllocateObject((Class)a1, 0, a3);
}

- (NSSimpleCString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4
{
  self->bytes = a3;
  self->numBytes = a4;
  return self;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (self->numBytes <= a3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Index %lu out of bounds; string length %lu",
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a3,
                     self->numBytes),
                   0);
    objc_exception_throw(v4);
  }
  return *(_WORD *)(_NSCStringCharToUnicharTable + 2 * self->bytes[a3]);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if (a4.location + a4.length > self->numBytes)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a4.location,
                     a4.length,
                     self->numBytes),
                   0);
    objc_exception_throw(v7);
  }
  if (a4.length)
  {
    uint64_t v4 = _NSCStringCharToUnicharTable;
    v5 = &self->bytes[a4.location];
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
  return self->numBytes;
}

- (unint64_t)cStringLength
{
  return self->numBytes;
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
  v4.super_class = (Class)NSSimpleCString;
  return -[NSString canBeConvertedToEncoding:](&v4, sel_canBeConvertedToEncoding_);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (NSShouldRetainWithZone(self, a3))
  {
    return self;
  }
  else
  {
    uint64_t v5 = +[NSString allocWithZone:a3];
    bytes = self->bytes;
    uint64_t numBytes = self->numBytes;
    uint64_t v8 = _NSCStringEncoding;
    return [(NSString *)v5 initWithBytes:bytes length:numBytes encoding:v8];
  }
}

- (const)_fastCStringContents:(BOOL)a3
{
  if (a3) {
    return 0;
  }
  else {
    return self->bytes;
  }
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!a3) {
    goto LABEL_8;
  }
  int v5 = _NSIsNSString();
  if (!v5) {
    return v5;
  }
  uint64_t v6 = [a3 _fastCStringContents:0];
  if (v6)
  {
    v7 = (const void *)v6;
    uint64_t numBytes = self->numBytes;
    if ([a3 length] == numBytes)
    {
      LOBYTE(v5) = memcmp(self->bytes, v7, self->numBytes) == 0;
      return v5;
    }
LABEL_8:
    LOBYTE(v5) = 0;
    return v5;
  }
  bytes = (unsigned __int8 *)self->bytes;
  unint64_t v10 = self->numBytes;

  LOBYTE(v5) = isEqualCStringToString(bytes, v10, a3);
  return v5;
}

- (BOOL)isEqualToString:(id)a3
{
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
    uint64_t numBytes = self->numBytes;
    if ([a3 length] == numBytes) {
      return memcmp(self->bytes, v6, self->numBytes) == 0;
    }
    return 0;
  }
  bytes = (unsigned __int8 *)self->bytes;
  unint64_t v10 = self->numBytes;

  return isEqualCStringToString(bytes, v10, a3);
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self == a3) {
    return 0;
  }
  if (!a3) {
    return 1;
  }
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v10 = [a3 _fastCStringContents:0];
  if (v10)
  {
    v11 = (unsigned __int8 *)v10;
    unint64_t v12 = [a3 length];
    v13 = (unsigned __int8 *)&self->bytes[location];
    return NSCompareCString(v13, v11, length, v12, a4);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NSSimpleCString;
    return -[NSString compare:options:range:](&v15, sel_compare_options_range_, a3, a4, location, length);
  }
}

- (BOOL)hasPrefix:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 _fastCStringContents:0];
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    unint64_t v7 = [a3 length];
    if (v7) {
      LOBYTE(v7) = v7 <= self->numBytes && memcmp(self->bytes, v6, v7) == 0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSSimpleCString;
    LOBYTE(v7) = [(NSString *)&v9 hasPrefix:a3];
  }
  return v7;
}

- (BOOL)hasSuffix:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 _fastCStringContents:0];
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    unint64_t v7 = [a3 length];
    if (v7)
    {
      unint64_t numBytes = self->numBytes;
      LOBYTE(v7) = v7 <= numBytes && memcmp(&self->bytes[numBytes - v7], v6, v7) == 0;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NSSimpleCString;
    LOBYTE(v7) = [(NSString *)&v10 hasSuffix:a3];
  }
  return v7;
}

- (unint64_t)hash
{
  return CFStringHashCString();
}

- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_NSCStringEncoding == a6)
  {
    if (a8.length >= a4) {
      size_t length = a4;
    }
    else {
      size_t length = a8.length;
    }
    if (a3 && length) {
      memmove(a3, &self->bytes[a8.location], length);
    }
    if (a5) {
      *a5 = length;
    }
    if (a9)
    {
      a9->NSUInteger location = length + a8.location;
      a9->size_t length = a8.length - length;
    }
    return 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NSSimpleCString;
    return -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](&v12, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_, a3, a4, a5, a8.location, a8.length, a9);
  }
}

- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger numBytes = self->numBytes;
  if (a3.location > numBytes || a3.location + a3.length > numBytes)
  {
    objc_super v12 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      a3.location,
                      a3.length,
                      self->numBytes),
                    0);
    objc_exception_throw(v12);
  }
  if (!a3.length) {
    return &stru_1ECA5C228;
  }
  if (a3.location || a3.length != numBytes)
  {
    objc_super v9 = +[NSString allocWithZone:a4];
    objc_super v10 = &self->bytes[location];
    uint64_t v11 = _NSCStringEncoding;
    return [(NSString *)v9 initWithBytes:v10 length:length encoding:v11];
  }
  else
  {
    return self;
  }
}

- (id)stringByAppendingString:(id)a3
{
  uint64_t v5 = [a3 length];
  uint64_t v6 = v5;
  if (!self->numBytes)
  {
    if (!v5) {
      return &stru_1ECA5C228;
    }
    objc_super v15 = a3;
    goto LABEL_14;
  }
  if (!v5)
  {
    objc_super v15 = self;
LABEL_14:
    v14 = (NSString *)[v15 copyWithZone:0];
    goto LABEL_20;
  }
  uint64_t v7 = [a3 _fastCStringContents:0];
  id result = (id)[(NSSimpleCString *)self zone];
  id v9 = result;
  size_t v10 = v6 + self->numBytes;
  if (v7)
  {
    if (v10)
    {
      if (!result) {
        id result = malloc_default_zone();
      }
      id result = malloc_type_zone_malloc((malloc_zone_t *)result, v10, 0x4A6F13AEuLL);
      if (result)
      {
        uint64_t v11 = (char *)result;
        size_t numBytes = self->numBytes;
        if ((int)numBytes >= 1)
        {
          memmove(result, self->bytes, numBytes);
          LODWORD(numBytes) = self->numBytes;
        }
        objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v11[(int)numBytes], v6, 0, _NSCStringEncoding, 0, 0, v6, 0);
        uint64_t v13 = +[NSString allocWithZone:v9];
        v14 = [(NSString *)v13 initWithBytesNoCopy:v11 length:v6 + self->numBytes encoding:_NSCStringEncoding freeWhenDone:1];
        goto LABEL_20;
      }
    }
LABEL_24:
    qword_1E8EDF350 = (uint64_t)"Unable to allocate memory for string buffer";
    __break(1u);
    return result;
  }
  if (!v10) {
    goto LABEL_24;
  }
  size_t v16 = 2 * v10;
  if (!result) {
    id result = malloc_default_zone();
  }
  id result = malloc_type_zone_malloc((malloc_zone_t *)result, v16, 0x4A6F13AEuLL);
  if (!result) {
    goto LABEL_24;
  }
  v17 = (char *)result;
  -[NSSimpleCString getCharacters:range:](self, "getCharacters:range:", result, 0, self->numBytes);
  objc_msgSend(a3, "getCharacters:range:", &v17[2 * self->numBytes], 0, v6);
  v14 = [+[NSString allocWithZone:v9] initWithCharactersNoCopy:v17 length:v6 + self->numBytes freeWhenDone:1];
LABEL_20:

  return v14;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  bytes = self->bytes;
  if (bytes) {
    free(bytes);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSSimpleCString;
  [(NSSimpleCString *)&v4 dealloc];
}

@end