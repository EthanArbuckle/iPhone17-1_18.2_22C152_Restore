@interface NSCharacterSet
+ (BOOL)supportsSecureCoding;
+ (NSCharacterSet)URLFragmentAllowedCharacterSet;
+ (NSCharacterSet)URLHostAllowedCharacterSet;
+ (NSCharacterSet)URLPasswordAllowedCharacterSet;
+ (NSCharacterSet)URLPathAllowedCharacterSet;
+ (NSCharacterSet)URLQueryAllowedCharacterSet;
+ (NSCharacterSet)URLUserAllowedCharacterSet;
+ (NSCharacterSet)alphanumericCharacterSet;
+ (NSCharacterSet)capitalizedLetterCharacterSet;
+ (NSCharacterSet)characterSetWithBitmapRepresentation:(NSData *)data;
+ (NSCharacterSet)characterSetWithCharactersInString:(NSString *)aString;
+ (NSCharacterSet)characterSetWithContentsOfFile:(NSString *)fName;
+ (NSCharacterSet)characterSetWithRange:(NSRange)aRange;
+ (NSCharacterSet)controlCharacterSet;
+ (NSCharacterSet)decimalDigitCharacterSet;
+ (NSCharacterSet)decomposableCharacterSet;
+ (NSCharacterSet)illegalCharacterSet;
+ (NSCharacterSet)letterCharacterSet;
+ (NSCharacterSet)lowercaseLetterCharacterSet;
+ (NSCharacterSet)newlineCharacterSet;
+ (NSCharacterSet)nonBaseCharacterSet;
+ (NSCharacterSet)punctuationCharacterSet;
+ (NSCharacterSet)symbolCharacterSet;
+ (NSCharacterSet)uppercaseLetterCharacterSet;
+ (NSCharacterSet)whitespaceAndNewlineCharacterSet;
+ (NSCharacterSet)whitespaceCharacterSet;
+ (void)initialize;
- (BOOL)characterIsMember:(unichar)aCharacter;
- (BOOL)hasMemberInPlane:(uint8_t)thePlane;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMutable;
- (BOOL)isSupersetOfSet:(NSCharacterSet *)theOtherSet;
- (BOOL)longCharacterIsMember:(UTF32Char)theLongChar;
- (NSCharacterSet)init;
- (NSCharacterSet)initWithCoder:(NSCoder *)coder;
- (NSCharacterSet)invertedSet;
- (NSData)bitmapRepresentation;
- (__CFCharacterSet)_expandedCFCharacterSet;
- (id)_retainedBitmapRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)replacementObjectForPortCoder:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSCharacterSet

+ (NSCharacterSet)URLHostAllowedCharacterSet
{
  return (NSCharacterSet *)MEMORY[0x1F40D9210](a1, a2);
}

+ (NSCharacterSet)whitespaceAndNewlineCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 16);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 16), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 16);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  }
  return result;
}

+ (NSCharacterSet)characterSetWithCharactersInString:(NSString *)aString
{
  CFCharacterSetRef v3 = CFCharacterSetCreateWithCharactersInString(0, (CFStringRef)aString);

  return (NSCharacterSet *)v3;
}

+ (NSCharacterSet)whitespaceCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 8);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetWhitespace) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 8), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 8);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  }
  return result;
}

+ (NSCharacterSet)letterCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 32);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetLetter) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 32), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 32);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetLetter);
  }
  return result;
}

+ (NSCharacterSet)alphanumericCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 72);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 72), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 72);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  }
  return result;
}

+ (NSCharacterSet)decimalDigitCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 24);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 24), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 24);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  }
  return result;
}

+ (void)initialize
{
  if (NSCharacterSet == a1 && !_CFExecutableLinkedOnOrAfter()) {
    __NSBuiltinSetTable = (uint64_t)malloc_type_calloc(0xFuLL, 8uLL, 0x80040B8603338uLL);
  }
}

+ (NSCharacterSet)newlineCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 112);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetNewline) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 112), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 112);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  }
  return result;
}

+ (NSCharacterSet)punctuationCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 80);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetPunctuation) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 80), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 80);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  }
  return result;
}

+ (NSCharacterSet)URLPathAllowedCharacterSet
{
  return (NSCharacterSet *)MEMORY[0x1F40D9220](a1, a2);
}

+ (NSCharacterSet)characterSetWithRange:(NSRange)aRange
{
  CFCharacterSetRef v3 = CFCharacterSetCreateWithCharactersInRange(0, (CFRange)aRange);

  return (NSCharacterSet *)v3;
}

+ (NSCharacterSet)uppercaseLetterCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 48);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 48), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 48);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter);
  }
  return result;
}

+ (NSCharacterSet)URLQueryAllowedCharacterSet
{
  return (NSCharacterSet *)MEMORY[0x1F40D9228](a1, a2);
}

+ (NSCharacterSet)URLFragmentAllowedCharacterSet
{
  return (NSCharacterSet *)MEMORY[0x1F40D9208](a1, a2);
}

+ (NSCharacterSet)illegalCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 88);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetIllegal) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 88), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 88);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetIllegal);
  }
  return result;
}

+ (NSCharacterSet)controlCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)__NSBuiltinSetTable;
    if (!*(void *)__NSBuiltinSetTable)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetControl) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)__NSBuiltinSetTable, (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)__NSBuiltinSetTable;
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetControl);
  }
  return result;
}

+ (NSCharacterSet)symbolCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 104);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetSymbol) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 104), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 104);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetSymbol);
  }
  return result;
}

- (__CFCharacterSet)_expandedCFCharacterSet
{
  return 0;
}

+ (NSCharacterSet)lowercaseLetterCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 40);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 40), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 40);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter);
  }
  return result;
}

+ (NSCharacterSet)nonBaseCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 56);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetNonBase) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 56), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 56);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetNonBase);
  }
  return result;
}

+ (NSCharacterSet)decomposableCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 64);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetDecomposable) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 64), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 64);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetDecomposable);
  }
  return result;
}

+ (NSCharacterSet)capitalizedLetterCharacterSet
{
  if (__NSBuiltinSetTable)
  {
    result = *(NSCharacterSet **)(__NSBuiltinSetTable + 96);
    if (!result)
    {
      result = (NSCharacterSet *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:CFCharacterSetGetPredefined(kCFCharacterSetCapitalizedLetter) options:2];
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(__NSBuiltinSetTable + 96), (unint64_t *)&v3, (unint64_t)result);
      if (v3)
      {

        return *(NSCharacterSet **)(__NSBuiltinSetTable + 96);
      }
    }
  }
  else
  {
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetCapitalizedLetter);
  }
  return result;
}

+ (NSCharacterSet)characterSetWithContentsOfFile:(NSString *)fName
{
  result = (NSCharacterSet *)[MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:fName options:1 error:0];
  if (result)
  {
    CFCharacterSetRef v4 = CFCharacterSetCreateWithBitmapRepresentation(0, (CFDataRef)result);
    return (NSCharacterSet *)v4;
  }
  return result;
}

+ (NSCharacterSet)characterSetWithBitmapRepresentation:(NSData *)data
{
  CFCharacterSetRef v3 = CFCharacterSetCreateWithBitmapRepresentation(0, (CFDataRef)data);

  return (NSCharacterSet *)v3;
}

- (NSCharacterSet)init
{
  if (![(NSCharacterSet *)self isMemberOfClass:NSCharacterSet]) {
    return self;
  }
  v5.location = 0;
  v5.length = 0;
  CFCharacterSetRef v3 = (NSCharacterSet *)CFCharacterSetCreateWithCharactersInRange(0, v5);

  return v3;
}

- (unint64_t)hash
{
  v2 = [(NSCharacterSet *)self bitmapRepresentation];

  return [(NSData *)v2 hash];
}

- (NSCharacterSet)invertedSet
{
  v2 = (void *)[objc_allocWithZone((Class)_NSPlaceholderCharacterSet) initWithSet:self options:1];

  return (NSCharacterSet *)v2;
}

- (BOOL)isEmpty
{
  v2 = [(NSCharacterSet *)self bitmapRepresentation];
  if (!v2) {
    return 1;
  }
  CFCharacterSetRef v3 = v2;
  CFCharacterSetRef v4 = [(NSData *)v2 bytes];
  uint64_t v5 = [(NSData *)v3 length];
  if (v5 < 1) {
    return 1;
  }
  if (*v4) {
    return 0;
  }
  uint64_t v7 = 1;
  do
  {
    uint64_t v8 = v7;
    if (v5 == v7) {
      break;
    }
    ++v7;
  }
  while (!v4[v8]);
  return v8 >= v5;
}

- (unint64_t)count
{
  v2 = [(NSData *)[(NSCharacterSet *)self bitmapRepresentation] bytes];
  unint64_t v4 = 0;
  if (v2)
  {
    for (uint64_t i = 0; i != 0x2000; ++i)
    {
      if (v2[i])
      {
        v3.i32[0] = v2[i];
        int8x8_t v3 = vcnt_s8(v3);
        v3.i16[0] = vaddlv_u8((uint8x8_t)v3);
        uint64_t v6 = v3.u32[0];
      }
      else
      {
        uint64_t v6 = 0;
      }
      v4 += v6;
    }
  }
  return v4;
}

- (BOOL)isMutable
{
  return 0;
}

- (BOOL)characterIsMember:(unichar)aCharacter
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  [(NSCharacterSet *)self doesNotRecognizeSelector:a2];
  return 0;
}

- (BOOL)longCharacterIsMember:(UTF32Char)theLongChar
{
  return [(NSCharacterSet *)self characterIsMember:(unsigned __int16)theLongChar];
}

- (BOOL)isSupersetOfSet:(NSCharacterSet *)theOtherSet
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  [(NSCharacterSet *)self doesNotRecognizeSelector:a2];
  return 0;
}

- (BOOL)hasMemberInPlane:(uint8_t)thePlane
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  [(NSCharacterSet *)self doesNotRecognizeSelector:a2];
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(NSCharacterSet *)self bitmapRepresentation];
  uint64_t v6 = [a3 bitmapRepresentation];

  return [(NSData *)v5 isEqual:v6];
}

- (NSData)bitmapRepresentation
{
  int8x8_t v3 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA58]) initWithLength:0x2000];
  uint64_t v4 = [v3 mutableBytes];
  for (unsigned __int16 i = 0; i != 0xFFFF; ++i)
  {
    if ([(NSCharacterSet *)self characterIsMember:i]) {
      *(unsigned char *)(v4 + (i >> 3)) |= 1 << (i & 7);
    }
  }

  return (NSData *)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  [(NSCharacterSet *)self doesNotRecognizeSelector:a2];
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = [(NSCharacterSet *)self bitmapRepresentation];
  if ([a3 allowsKeyedCoding])
  {
    if (object_getClass(a3) == (Class)NSKeyedArchiver)
    {
      [a3 _encodePropertyList:v4 forKey:@"NSBitmap"];
    }
    else
    {
      [a3 encodeObject:v4 forKey:@"NSBitmapObject"];
    }
  }
}

- (NSCharacterSet)initWithCoder:(NSCoder *)coder
{
  if (![(NSCoder *)coder allowsKeyedCoding]) {
    goto LABEL_36;
  }
  NSInteger v5 = [(NSCoder *)coder decodeIntegerForKey:@"NSBuiltinID"];
  BOOL v6 = [(NSCoder *)coder decodeBoolForKey:@"NSIsInverted"];
  if (!v5) {
    NSInteger v5 = [(NSCoder *)coder decodeIntegerForKey:@"NSBuiltinID2"];
  }
  Class = (__objc2_class *)object_getClass(coder);
  BOOL v8 = [(NSCoder *)coder containsValueForKey:@"NSString"];
  BOOL v9 = [(NSCoder *)coder containsValueForKey:@"NSStringObject"];
  if ((unint64_t)(v5 - 1) <= 0xE)
  {
    CFCharacterSetRef Predefined = CFCharacterSetGetPredefined((CFCharacterSetPredefinedSet)v5);
    if (v6 || [(NSCoder *)coder decodeBoolForKey:@"NSIsInverted2"])
    {
      CFCharacterSetRef Predefined = CFCharacterSetCreateMutableCopy(0, Predefined);
      BOOL v6 = 1;
      if (!Predefined) {
        goto LABEL_20;
      }
    }
    else
    {
      CFRetain(Predefined);
      BOOL v6 = 0;
      if (!Predefined)
      {
LABEL_20:

        v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3A8];
        v17 = @"CFCharacterSetGetPredefined -- Predefined Character Set not found";
        goto LABEL_39;
      }
    }
    goto LABEL_33;
  }
  BOOL v11 = v9;
  if ([(NSCoder *)coder containsValueForKey:@"NSRange"])
  {
    uint64_t v12 = [(NSCoder *)coder decodeInt64ForKey:@"NSRange"];
    CFIndex v13 = v12 >> 32;
    CFIndex v14 = v12;
    if (_CFCharacterSetIsValidRange())
    {
      v24.location = v13;
      v24.length = v14;
      CFCharacterSetRef Predefined = CFCharacterSetCreateWithCharactersInRange(0, v24);
      if (!Predefined)
      {

        v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3A8];
        v17 = @"CFCharacterSetCreateWithCharactersInRange -- Character Set creation with characters in range failed";
        goto LABEL_39;
      }
      goto LABEL_33;
    }

    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3A8];
    v17 = @"CFCharacterSetCreateWithCharactersInRange -- Character Set creation with characters in range failed: Invalid range";
LABEL_39:
    objc_exception_throw((id)[v15 exceptionWithName:v16 reason:v17 userInfo:0]);
  }
  if (v8 || v11)
  {
    int v18 = Class == NSKeyedUnarchiver || v8;
    if (v18 == 1) {
      CFStringRef v19 = (const __CFString *)[(NSCoder *)coder _decodePropertyListForKey:@"NSString"];
    }
    else {
      CFStringRef v19 = [(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NSStringObject"];
    }
    CFStringRef v21 = v19;
    if (v19 && _NSIsNSString())
    {
      CFCharacterSetRef Predefined = CFCharacterSetCreateWithCharactersInString(0, v21);
      if (!Predefined)
      {

        v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3A8];
        v17 = @"CFCharacterSetCreateWithCharactersInString -- Character Set creation with characters in string failed";
        goto LABEL_39;
      }
      goto LABEL_33;
    }
    goto LABEL_35;
  }
  if (Class == NSKeyedUnarchiver
    || [(NSCoder *)coder containsValueForKey:@"NSBitmap"])
  {
    CFDataRef v20 = (const __CFData *)[(NSCoder *)coder _decodePropertyListForKey:@"NSBitmap"];
  }
  else
  {
    CFDataRef v20 = [(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NSBitmapObject"];
  }
  CFDataRef v22 = v20;
  if (!v20 || !_NSIsNSData())
  {
LABEL_35:
    -[NSCoder failWithError:](coder, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4865, [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Decoder value not found" forKey:@"NSLocalizedDescription"]));
LABEL_36:
    CFCharacterSetRef Predefined = 0;
    goto LABEL_37;
  }
  CFCharacterSetRef Predefined = CFCharacterSetCreateWithBitmapRepresentation(0, v22);
  if (!Predefined)
  {

    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3A8];
    v17 = @"CFCharacterSetCreateWithBitmapRepresentation -- Character Set creation with bitmap representation failed";
    goto LABEL_39;
  }
LABEL_33:
  if (v6) {
    _CFCharacterSetSetIsInverted();
  }
LABEL_37:

  return (NSCharacterSet *)Predefined;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_retainedBitmapRepresentation
{
  v2 = [(NSCharacterSet *)self bitmapRepresentation];

  return v2;
}

+ (NSCharacterSet)URLUserAllowedCharacterSet
{
  return (NSCharacterSet *)MEMORY[0x1F40D9230](a1, a2);
}

+ (NSCharacterSet)URLPasswordAllowedCharacterSet
{
  return (NSCharacterSet *)MEMORY[0x1F40D9218](a1, a2);
}

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isByref] && -[NSCharacterSet isMutable](self, "isMutable"))
  {
    v6.receiver = self;
    v6.super_class = (Class)NSCharacterSet;
    return [(NSCharacterSet *)&v6 replacementObjectForPortCoder:a3];
  }
  return self;
}

@end