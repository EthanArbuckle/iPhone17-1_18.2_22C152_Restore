@interface NSCheapMutableString
- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9;
- (const)cString;
- (const)lossyCString;
- (unint64_t)cStringLength;
- (unint64_t)fastestEncoding;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)setContentsNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5 isUnicode:(BOOL)a6;
@end

@implementation NSCheapMutableString

- (unint64_t)length
{
  return self->numCharacters;
}

- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->flags & 1) != 0
    || +[NSString defaultCStringEncoding] != a6)
  {
    v19.receiver = self;
    v19.super_class = (Class)NSCheapMutableString;
    return -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](&v19, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_, a3, a4, a5, a6, a7, a8.location, a8.length, a9);
  }
  else
  {
    if (a8.length >= a4) {
      unint64_t length = a4;
    }
    else {
      unint64_t length = a8.length;
    }
    if (a3 && length)
    {
      NSUInteger location = a8.location;
      unint64_t v17 = length;
      do
      {
        *(unsigned char *)a3 = *((unsigned char *)self->contents.fat + location);
        a3 = (char *)a3 + 1;
        ++location;
        --v17;
      }
      while (v17);
    }
    if (a5) {
      *a5 = length;
    }
    if (a9)
    {
      a9->NSUInteger location = length + a8.location;
      a9->unint64_t length = a8.length - length;
    }
    return 1;
  }
}

- (unint64_t)fastestEncoding
{
  if (*(unsigned char *)&self->flags) {
    return 10;
  }
  if (__NSDefaultStringEncodingFullyInited) {
    return _NSDefaultStringEncoding;
  }
  return _NSDefaultCStringEncoding();
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->flags & 2) != 0) {
    free(self->contents.fat);
  }
  v3.receiver = self;
  v3.super_class = (Class)NSCheapMutableString;
  [(NSCheapMutableString *)&v3 dealloc];
}

- (void)setContentsNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5 isUnicode:(BOOL)a6
{
  BOOL v6 = a6;
  if ((*(unsigned char *)&self->flags & 2) != 0) {
    free(self->contents.fat);
  }
  self->contents.fat = (unsigned __int16 *)a3;
  self->flags = ($992A3B757AA70BF52C20D879373DE9D6)(*(_DWORD *)&self->flags & 0xFFFFFFFE | v6);
  self->numCharacters = a4;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if (*(unsigned char *)&self->flags)
  {
    memmove(a3, &self->contents.fat[a4.location], 2 * a4.length);
  }
  else
  {
    for (; a4.length; --a4.length)
      *a3++ = *((unsigned __int8 *)self->contents.fat + a4.location++);
  }
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  fat = self->contents.fat;
  if (*(unsigned char *)&self->flags) {
    return fat[a3];
  }
  else {
    return *((unsigned __int8 *)fat + a3);
  }
}

- (const)cString
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->flags & 1) == 0) {
    return self->contents.thin;
  }
  v3.receiver = self;
  v3.super_class = (Class)NSCheapMutableString;
  return [(NSString *)&v3 cString];
}

- (const)lossyCString
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->flags & 1) == 0) {
    return self->contents.thin;
  }
  v3.receiver = self;
  v3.super_class = (Class)NSCheapMutableString;
  return [(NSString *)&v3 lossyCString];
}

- (unint64_t)cStringLength
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->flags & 1) == 0) {
    return self->numCharacters;
  }
  v3.receiver = self;
  v3.super_class = (Class)NSCheapMutableString;
  return [(NSString *)&v3 cStringLength];
}

@end