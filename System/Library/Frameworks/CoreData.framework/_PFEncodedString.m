@interface _PFEncodedString
- (BOOL)_isCString;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (_PFEncodedString)init;
- (_PFEncodedString)retain;
- (const)UTF8String;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)cStringLength;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)retainCount;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCString:(char *)a3;
- (void)getCharacters:(unsigned __int16 *)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)release;
@end

@implementation _PFEncodedString

- (unint64_t)hash
{
  v3 = [(_PFEncodedString *)self UTF8String];
  uint64_t length = self->_length;

  return MEMORY[0x1F40D8610](v3, length);
}

- (unint64_t)length
{
  return self->_length;
}

- (const)UTF8String
{
  return (const char *)&self[1];
}

- (BOOL)isEqualToString:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (a3) {
    return _compareUnknownStrings(self, (__CFString *)a3);
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NSString alloc];
  v5 = [(_PFEncodedString *)self UTF8String];

  return (id)[v4 initWithUTF8String:v5];
}

- (void)getCharacters:(unsigned __int16 *)a3
{
  uint64_t length = self->_length;
  v5 = [(_PFEncodedString *)self UTF8String];
  if (length)
  {
    do
    {
      unsigned __int16 v6 = *v5++;
      *a3++ = v6;
      --length;
    }
    while (length);
  }
}

- (_PFEncodedString)retain
{
  id v3 = self->_sourceData;
  return self;
}

- (void)release
{
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isNSString];
    if (v5)
    {
      LOBYTE(v5) = _compareUnknownStrings(self, (__CFString *)a3);
    }
  }
  return v5;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v7 = a4.location + a4.length;
  v8 = [(_PFEncodedString *)self UTF8String];
  if (location < v7)
  {
    v9 = &v8[location];
    do
    {
      unsigned __int16 v10 = *v9++;
      *a3++ = v10;
      --length;
    }
    while (length);
  }
}

- (id)copy
{
  id v3 = [NSString alloc];
  id v4 = [(_PFEncodedString *)self UTF8String];

  return (id)[v3 initWithUTF8String:v4];
}

- (_PFEncodedString)init
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"You're doing it wrong" reason:@"Skanky class can only be used skankily." userInfo:0]);
}

- (unint64_t)retainCount
{
  return [self->_sourceData retainCount];
}

- (BOOL)_isDeallocating
{
  return [self->_sourceData _isDeallocating];
}

- (BOOL)_tryRetain
{
  return [self->_sourceData _tryRetain];
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(_PFEncodedString *)self UTF8String][a3];
}

- (BOOL)_isCString
{
  return 1;
}

- (void)getCString:(char *)a3
{
  int v5 = [(_PFEncodedString *)self UTF8String];
  size_t v6 = self->_length + 1;

  memcpy(a3, v5, v6);
}

- (unint64_t)cStringLength
{
  return self->_length;
}

@end