@interface SGTokenString
+ (id)stringWithString:(id)a3;
+ (id)stringWithString:(id)a3 range:(_NSRange)a4;
+ (id)stringWithString:(id)a3 range:(_NSRange)a4 confidence:(int)a5;
- (SGTokenString)stringWithNewContents:(id)a3;
- (_NSRange)range;
- (const)UTF8String;
- (const)_fastCStringContents:(BOOL)a3;
- (const)_fastCharacterContents;
- (int)confidence;
- (unint64_t)fastestEncoding;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)setConfidence:(int)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation SGTokenString

- (void)setConfidence:(int)a3
{
  self->_confidence = a3;
}

- (int)confidence
{
  return self->_confidence;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)fastestEncoding
{
  if (*((unsigned char *)self + 28)) {
    return 1;
  }
  else {
    return 10;
  }
}

- (const)_fastCharacterContents
{
  if (*((unsigned char *)self + 28)) {
    return 0;
  }
  else {
    return (const unsigned __int16 *)&self->_contents;
  }
}

- (const)_fastCStringContents:(BOOL)a3
{
  if (*((unsigned char *)self + 28)) {
    return (const char *)&self->_contents;
  }
  else {
    return 0;
  }
}

- (const)UTF8String
{
  if (*((unsigned char *)self + 28)) {
    return (const char *)&self->_contents;
  }
  v3.receiver = self;
  v3.super_class = (Class)SGTokenString;
  return [(SGTokenString *)&v3 UTF8String];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > (unint64_t)*((unsigned int *)self + 7) >> 1) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SGTokenString.m", 88, @"Invalid parameter not satisfying: %@", @"range.location + range.length <= _length");
  }
  if (*((unsigned char *)self + 28))
  {
    if (length)
    {
      v8 = (char *)&self->_contents + location;
      do
      {
        unsigned __int16 v9 = *v8++;
        *a3++ = v9;
        --length;
      }
      while (length);
    }
  }
  else
  {
    memcpy(a3, (char *)&self->_contents + 2 * location, 2 * length);
  }
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (a3 >= (unint64_t)*((unsigned int *)self + 7) >> 1) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SGTokenString.m", 78, @"Invalid parameter not satisfying: %@", @"index < _length");
  }
  p_contents = &self->_contents;
  if (*((unsigned char *)self + 28)) {
    return *((char *)p_contents + a3);
  }
  else {
    return *((_WORD *)p_contents + a3);
  }
}

- (unint64_t)length
{
  return (unint64_t)*((unsigned int *)self + 7) >> 1;
}

- (SGTokenString)stringWithNewContents:(id)a3
{
  return +[SGTokenString stringWithString:range:confidence:](SGTokenString, "stringWithString:range:confidence:", a3, self->_range.location, self->_range.length, self->_confidence);
}

+ (id)stringWithString:(id)a3 range:(_NSRange)a4 confidence:(int)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGTokenString.m", 45, @"Invalid parameter not satisfying: %@", @"string");
  }
  if ((unint64_t)[a3 length] >> 31) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGTokenString.m", 46, @"Invalid parameter not satisfying: %@", @"string.length < ((unsigned long)1 << 31)");
  }
  unsigned int v11 = [a3 canBeConvertedToEncoding:1];
  uint64_t v12 = objc_msgSend(class_createInstance((Class)a1, (objc_msgSend(a3, "length") << (v11 ^ 1)) + v11), "init");
  *(void *)(v12 + 8) = location;
  *(void *)(v12 + 16) = length;
  *(_DWORD *)(v12 + 24) = a5;
  *(unsigned char *)(v12 + 28) = *(unsigned char *)(v12 + 28) & 0xFE | v11;
  *(_DWORD *)(v12 + 28) = *(_DWORD *)(v12 + 28) & 1 | (2 * [a3 length]);
  uint64_t v13 = v12 + 32;
  if ((v11 ^ 1)) {
    [a3 getCharacters:v13];
  }
  else {
    objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v13, 0, (unint64_t)*(unsigned int *)(v12 + 28) >> 1, 0);
  }
  return (id)v12;
}

+ (id)stringWithString:(id)a3 range:(_NSRange)a4
{
  return (id)objc_msgSend(a1, "stringWithString:range:confidence:", a3, a4.location, a4.length, 0);
}

+ (id)stringWithString:(id)a3
{
  return (id)objc_msgSend(a1, "stringWithString:range:confidence:", a3, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
}

@end