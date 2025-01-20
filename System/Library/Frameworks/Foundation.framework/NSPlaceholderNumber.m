@interface NSPlaceholderNumber
+ (BOOL)supportsSecureCoding;
- (NSPlaceholderNumber)init;
- (NSPlaceholderNumber)initWithBool:(BOOL)a3;
- (NSPlaceholderNumber)initWithChar:(char)a3;
- (NSPlaceholderNumber)initWithCoder:(id)a3;
- (NSPlaceholderNumber)initWithDouble:(double)a3;
- (NSPlaceholderNumber)initWithFloat:(float)a3;
- (NSPlaceholderNumber)initWithInt:(int)a3;
- (NSPlaceholderNumber)initWithInteger:(int64_t)a3;
- (NSPlaceholderNumber)initWithLong:(int64_t)a3;
- (NSPlaceholderNumber)initWithLongLong:(int64_t)a3;
- (NSPlaceholderNumber)initWithShort:(signed __int16)a3;
- (NSPlaceholderNumber)initWithUnsignedChar:(unsigned __int8)a3;
- (NSPlaceholderNumber)initWithUnsignedInt:(unsigned int)a3;
- (NSPlaceholderNumber)initWithUnsignedInteger:(unint64_t)a3;
- (NSPlaceholderNumber)initWithUnsignedLong:(unint64_t)a3;
- (NSPlaceholderNumber)initWithUnsignedLongLong:(unint64_t)a3;
- (NSPlaceholderNumber)initWithUnsignedShort:(unsigned __int16)a3;
@end

@implementation NSPlaceholderNumber

- (NSPlaceholderNumber)initWithLongLong:(int64_t)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithInteger:(int64_t)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithDouble:(double)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  *(double *)v4 = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberDoubleType, v4);
}

- (NSPlaceholderNumber)initWithUnsignedLongLong:(unint64_t)a3
{
  valuePtr[2] = *MEMORY[0x1E4F143B8];
  if ((a3 & 0x8000000000000000) != 0)
  {
    valuePtr[0] = 0;
    valuePtr[1] = a3;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberType v4 = kCFNumberMaxType|kCFNumberSInt8Type;
  }
  else
  {
    valuePtr[0] = a3;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberType v4 = kCFNumberSInt64Type;
  }
  return (NSPlaceholderNumber *)CFNumberCreate(v3, v4, valuePtr);
}

- (NSPlaceholderNumber)initWithFloat:(float)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  float valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloatType, &valuePtr);
}

- (NSPlaceholderNumber)initWithUnsignedLong:(unint64_t)a3
{
  valuePtr[2] = *MEMORY[0x1E4F143B8];
  if ((a3 & 0x8000000000000000) != 0)
  {
    valuePtr[0] = 0;
    valuePtr[1] = a3;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberType v4 = kCFNumberMaxType|kCFNumberSInt8Type;
  }
  else
  {
    valuePtr[0] = a3;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberType v4 = kCFNumberSInt64Type;
  }
  return (NSPlaceholderNumber *)CFNumberCreate(v3, v4, valuePtr);
}

- (NSPlaceholderNumber)initWithUnsignedInteger:(unint64_t)a3
{
  valuePtr[2] = *MEMORY[0x1E4F143B8];
  if ((a3 & 0x8000000000000000) != 0)
  {
    valuePtr[0] = 0;
    valuePtr[1] = a3;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberType v4 = kCFNumberMaxType|kCFNumberSInt8Type;
  }
  else
  {
    valuePtr[0] = a3;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberType v4 = kCFNumberSInt64Type;
  }
  return (NSPlaceholderNumber *)CFNumberCreate(v3, v4, valuePtr);
}

- (NSPlaceholderNumber)initWithInt:(int)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithLong:(int64_t)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    if (object_getClass(a3) == (Class)NSKeyedUnarchiver
      || [a3 containsValueForKey:@"NS.number"])
    {
      id v8 = (id)[a3 _decodePropertyListForKey:@"NS.number"];
      if (_NSIsNSNumber())
      {
        return (NSPlaceholderNumber *)v8;
      }
      else
      {
        objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", @"Decoded object is not a number"));

        return 0;
      }
    }
    else if ([a3 containsValueForKey:@"NS.BOOLval"])
    {
      uint64_t v6 = [a3 decodeBoolForKey:@"NS.BOOLval"];
      return [(NSPlaceholderNumber *)self initWithBool:v6];
    }
    else if ([a3 containsValueForKey:@"NS.intval"])
    {
      uint64_t v7 = [a3 decodeInt64ForKey:@"NS.intval"];
      return [(NSPlaceholderNumber *)self initWithLongLong:v7];
    }
    else
    {
      if (![a3 containsValueForKey:@"NS.dblval"])
      {

        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"*** -[NSPlaceholderNumber initWithCoder:]: unknown number type" userInfo:0]);
      }
      [a3 decodeDoubleForKey:@"NS.dblval"];
      return -[NSPlaceholderNumber initWithDouble:](self, "initWithDouble:");
    }
  }
  else
  {
    return newDecodedNumber(a3);
  }
}

- (NSPlaceholderNumber)initWithUnsignedInt:(unsigned int)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithBool:(BOOL)a3
{
  CFAllocatorRef v3 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    CFAllocatorRef v3 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
  }
  return (NSPlaceholderNumber *)CFRetain(*v3);
}

- (NSPlaceholderNumber)initWithShort:(signed __int16)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  signed __int16 valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt16Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithUnsignedShort:(unsigned __int16)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithChar:(char)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  char valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt8Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithUnsignedChar:(unsigned __int8)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  __int16 valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt16Type, &valuePtr);
}

- (NSPlaceholderNumber)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end