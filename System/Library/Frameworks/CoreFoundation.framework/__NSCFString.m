@interface __NSCFString
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isCString;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unint64_t)a5;
- (BOOL)hasPrefix:(id)a3;
- (BOOL)hasSuffix:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (BOOL)isNSString__;
- (Class)classForCoder;
- (const)UTF8String;
- (const)_fastCStringContents:(BOOL)a3;
- (const)cString;
- (const)cStringUsingEncoding:(unint64_t)a3;
- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)substringWithRange:(_NSRange)a3;
- (unint64_t)cStringLength;
- (unint64_t)fastestEncoding;
- (unint64_t)replaceOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6;
- (unint64_t)smallestEncoding;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (void)appendFormat:(id)a3;
- (void)appendString:(id)a3;
- (void)deleteCharactersInRange:(_NSRange)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)getLineStart:(unint64_t *)a3 end:(unint64_t *)a4 contentsEnd:(unint64_t *)a5 forRange:(_NSRange)a6;
- (void)insertString:(id)a3 atIndex:(unint64_t)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setString:(id)a3;
@end

@implementation __NSCFString

- (void)appendString:(id)a3
{
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  int v7 = __CFStringCheckAndReplace((__CFString *)self, Length2, 0, (__CFString *)a3);
  if (v7) {
    mutateError(a2, v7, self);
  }
}

- (const)_fastCStringContents:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringEncoding SystemEncoding = enc;
  if (enc == -1)
  {
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    enc = SystemEncoding;
  }

  return (const char *)_CFNonObjCStringGetCStringPtr((unint64_t *)self, SystemEncoding, v3);
}

- (BOOL)isEqualToString:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  if (!a3) {
    goto LABEL_35;
  }
  if (((unint64_t)a3 & 0x8000000000000000) != 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)off_1ECE0A6F0;
    if ((~(unint64_t)a3 & 0xC000000000000007) == 0) {
      uint64_t v6 = 0;
    }
    unint64_t v7 = v6 ^ (unint64_t)a3;
    unint64_t v8 = v7 & 7;
    while (v8 != *((unsigned __int8 *)off_1ECE0A6E0 + v5))
    {
      if (++v5 == 7) {
        goto LABEL_22;
      }
    }
    if (v5 == 2)
    {
      LOBYTE(v9) = _NSTaggedPointerStringEqualCFString(a3, self);
      return v9;
    }
LABEL_22:
    for (uint64_t i = 0; i != 7; ++i)
    {
      if (v8 == *((unsigned __int8 *)off_1ECE0A6E0 + i)) {
        break;
      }
    }
    LOBYTE(v9) = 0;
    if ((~(_BYTE)i & 7) != 0 || ((i | v7) & 0x7F80000000000000) != 0x700000000000000) {
      return v9;
    }
    goto LABEL_27;
  }
  unint64_t v10 = *(void *)a3 & ~(unint64_t)off_1ECE0A6D0;
  if ((*(void *)a3 & (unint64_t)off_1ECE0A6D0) != 0) {
    v10 |= *(void *)a3 & (unint64_t)off_1ECE0A6D0;
  }
  if ((__objc2_class *)v10 == __CFConstantStringClassReferencePtr) {
    goto LABEL_17;
  }
  unint64_t v11 = (unint64_t)self->super.super.isa & ~(unint64_t)off_1ECE0A6D0;
  if (((unint64_t)self->super.super.isa & (unint64_t)off_1ECE0A6D0) != 0) {
    v11 |= (unint64_t)self->super.super.isa & (unint64_t)off_1ECE0A6D0;
  }
  if (v10 == v11)
  {
LABEL_17:
    LOBYTE(v9) = _CFStringEqual((CFStringRef)self, (CFStringRef)a3) != 0;
    return v9;
  }
  int v9 = [a3 isNSString];
  if (!v9) {
    return v9;
  }
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  if (Length2 != [a3 length])
  {
LABEL_35:
    LOBYTE(v9) = 0;
    return v9;
  }
  v14 = (__objc2_class *)objc_opt_class();
  if (v14 == __NSCFString || class_getSuperclass((Class)v14) == (Class)__NSCFString) {
    goto LABEL_17;
  }
LABEL_27:

  LOBYTE(v9) = [a3 isEqualToString:self];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  if (!a3) {
    goto LABEL_35;
  }
  if (((unint64_t)a3 & 0x8000000000000000) != 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)off_1ECE0A6F0;
    if ((~(unint64_t)a3 & 0xC000000000000007) == 0) {
      uint64_t v6 = 0;
    }
    unint64_t v7 = v6 ^ (unint64_t)a3;
    unint64_t v8 = v7 & 7;
    while (v8 != *((unsigned __int8 *)off_1ECE0A6E0 + v5))
    {
      if (++v5 == 7) {
        goto LABEL_22;
      }
    }
    if (v5 == 2)
    {
      LOBYTE(v9) = _NSTaggedPointerStringEqualCFString(a3, self);
      return v9;
    }
LABEL_22:
    for (uint64_t i = 0; i != 7; ++i)
    {
      if (v8 == *((unsigned __int8 *)off_1ECE0A6E0 + i)) {
        break;
      }
    }
    LOBYTE(v9) = 0;
    if ((~(_BYTE)i & 7) != 0 || ((i | v7) & 0x7F80000000000000) != 0x700000000000000) {
      return v9;
    }
    goto LABEL_27;
  }
  unint64_t v10 = *(void *)a3 & ~(unint64_t)off_1ECE0A6D0;
  if ((*(void *)a3 & (unint64_t)off_1ECE0A6D0) != 0) {
    v10 |= *(void *)a3 & (unint64_t)off_1ECE0A6D0;
  }
  if ((__objc2_class *)v10 == __CFConstantStringClassReferencePtr) {
    goto LABEL_17;
  }
  unint64_t v11 = (unint64_t)self->super.super.isa & ~(unint64_t)off_1ECE0A6D0;
  if (((unint64_t)self->super.super.isa & (unint64_t)off_1ECE0A6D0) != 0) {
    v11 |= (unint64_t)self->super.super.isa & (unint64_t)off_1ECE0A6D0;
  }
  if (v10 == v11)
  {
LABEL_17:
    LOBYTE(v9) = _CFStringEqual((CFStringRef)self, (CFStringRef)a3) != 0;
    return v9;
  }
  int v9 = [a3 isNSString];
  if (!v9) {
    return v9;
  }
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  if (Length2 != [a3 length])
  {
LABEL_35:
    LOBYTE(v9) = 0;
    return v9;
  }
  v14 = (__objc2_class *)objc_opt_class();
  if (v14 == __NSCFString || class_getSuperclass((Class)v14) == (Class)__NSCFString) {
    goto LABEL_17;
  }
LABEL_27:

  LOBYTE(v9) = [a3 isEqualToString:self];
  return v9;
}

- (BOOL)isNSString__
{
  return 1;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if (_CFStringCheckAndGetCharacters((uint64_t)self, a4.location, a4.length, a3)) {
    -[__NSCFString getCharacters:range:]((objc_class *)self, a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return _CFNonObjCStringCreateCopy(0, (uint64_t)self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return CFStringCreateMutableCopy(0, 0, (CFStringRef)self);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  unsigned __int16 v6 = 0;
  if (_CFStringCheckAndGetCharacterAtIndex((uint64_t)self, a3, &v6)) {
    -[__NSCFString characterAtIndex:]((objc_class *)self, a2);
  }
  return v6;
}

- (void)appendFormat:(id)a3
{
  if (!__CFStringMtbl((uint64_t)self)) {
    -[__NSCFString appendFormat:](a2);
  }
  _CFStringAppendFormatAndArgumentsAux2((uint64_t)self, (uint64_t)_DescriptionWithLocaleFunc, (uint64_t)_DescriptionWithStringProxyFunc, 0, 0, (uint64_t)a3, &v6);
}

- (Class)classForCoder
{
  if (__CFStringMtbl((uint64_t)self)) {
    v2 = "NSMutableString";
  }
  else {
    v2 = "NSString";
  }

  return objc_lookUpClass(v2);
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  if (__CFStringMtbl((uint64_t)self)) {
    goto LABEL_2;
  }
  CFStringEncoding v6 = CFStringConvertNSStringEncodingToEncoding(a3);
  if (v6 == -1)
  {
    if (a3 != 134217984 && a3) {
      return 0;
    }
    if (_CFExecutableLinkedOnOrAfter(6uLL)) {
      CFLog(4, @"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSStringEncodingASCII. Will stop this compatibility mapping behavior in the near future.", v7, v8, v9, v10, v11, v12, a3);
    }
    CFStringEncoding v6 = 1536;
  }
  result = (const char *)_CFNonObjCStringGetCStringPtr((unint64_t *)self, v6, 1);
  if (!result)
  {
LABEL_2:
    v13.receiver = self;
    v13.super_class = (Class)__NSCFString;
    return [(__NSCFString *)&v13 cStringUsingEncoding:a3];
  }
  return result;
}

- (const)UTF8String
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (__CFStringMtbl((uint64_t)self)
    || (result = (const char *)_CFNonObjCStringGetCStringPtr((unint64_t *)self, 0x8000100u, 1)) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)__NSCFString;
    return [(__NSCFString *)&v4 UTF8String];
  }
  return result;
}

- (BOOL)getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unint64_t)a5
{
  CFStringEncoding v9 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v9 != -1) {
    return CFStringGetCString((CFStringRef)self, a3, a4, v9) != 0;
  }
  if (a5 == 134217984 || !a5)
  {
    if (_CFExecutableLinkedOnOrAfter(6uLL)) {
      CFLog(4, @"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSStringEncodingASCII. Will stop this compatibility mapping behavior in the near future.", v10, v11, v12, v13, v14, v15, a5);
    }
    CFStringEncoding v9 = 1536;
    return CFStringGetCString((CFStringRef)self, a3, a4, v9) != 0;
  }
  return 0;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  int v6 = __CFStringCheckAndReplace((__CFString *)self, a3.location, a3.length, (__CFString *)a4);
  if (v6) {
    mutateError(a2, v6, self);
  }
}

- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  unint64_t v9 = Length2;
  if (location + length > Length2)
  {
    uint64_t v19 = __CFExceptionProem((objc_class *)self, a2);
    v20 = "";
    if (length == 64) {
      v20 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    }
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: Range {%lu, %lu} out of bounds; string length %lu%s",
      v19,
      location,
      length,
      v9,
      v20);
  }
  if ((Length2 < length || location > Length2 - length) && (_newSubstringWithRange_zone__warnonce & 1) == 0)
  {
    _newSubstringWithRange_zone__warnonce = 1;
    __int16 v10 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(4, @"*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution.",
      v11,
      v12,
      v13,
      v14,
      v15,
      v16,
      v10);
  }
  v17.NSUInteger location = location;
  v17.NSUInteger length = length;

  return (id)CFStringCreateWithSubstring(0, (CFStringRef)self, v17);
}

- (BOOL)hasPrefix:(id)a3
{
  if (!a3) {
    -[__NSCFString hasPrefix:]((objc_class *)self, a2);
  }
  return CFStringHasPrefix((CFStringRef)self, (CFStringRef)a3) != 0;
}

- (unint64_t)fastestEncoding
{
  CFStringEncoding FastestEncoding = CFStringGetFastestEncoding((CFStringRef)self);

  return CFStringConvertEncodingToNSStringEncoding(FastestEncoding);
}

- (id)substringWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  unint64_t v8 = Length2;
  if (location + length > Length2)
  {
    uint64_t v18 = __CFExceptionProem((objc_class *)self, a2);
    uint64_t v19 = "";
    if (length == 64) {
      uint64_t v19 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    }
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: Range {%lu, %lu} out of bounds; string length %lu%s",
      v18,
      location,
      length,
      v8,
      v19);
  }
  if ((Length2 < length || location > Length2 - length) && (substringWithRange__warnonce & 1) == 0)
  {
    substringWithRange__warnonce = 1;
    __int16 v9 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(4, @"*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution.",
      v10,
      v11,
      v12,
      v13,
      v14,
      v15,
      v9);
  }
  v21.NSUInteger location = location;
  v21.NSUInteger length = length;
  uint64_t v16 = (__CFString *)CFStringCreateWithSubstring(0, (CFStringRef)self, v21);

  return v16;
}

- (id)copy
{
  return _CFNonObjCStringCreateCopy(0, (uint64_t)self);
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)hasSuffix:(id)a3
{
  if (!a3) {
    -[__NSCFString hasSuffix:]((objc_class *)self, a2);
  }
  return CFStringHasSuffix((CFStringRef)self, (CFStringRef)a3) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (unint64_t)replaceOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v27 = *(void *)off_1ECE0A5B0;
  if (!__CFStringMtbl((uint64_t)self)) {
    -[__NSCFString replaceOccurrencesOfString:withString:options:range:](a2);
  }
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  if (!a3 || !a4) {
    -[__NSCFString replaceOccurrencesOfString:withString:options:range:]((objc_class *)self, a2);
  }
  unint64_t v14 = Length2;
  if (location + length > Length2)
  {
    uint64_t v24 = __CFExceptionProem((objc_class *)self, a2);
    v25 = "";
    if (length == 64) {
      v25 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    }
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: Range {%lu, %lu} out of bounds; string length %lu%s",
      v24,
      location,
      length,
      v14,
      v25);
  }
  if ((Length2 < length || location > Length2 - length)
    && (replaceOccurrencesOfString_withString_options_range__warnonce & 1) == 0)
  {
    replaceOccurrencesOfString_withString_options_range__warnonce = 1;
    __int16 v15 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(4, @"*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution.",
      v16,
      v17,
      v18,
      v19,
      v20,
      v21,
      v15);
  }
  if ((a5 & 0x400) != 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)__NSCFString;
    return -[__NSCFString replaceOccurrencesOfString:withString:options:range:](&v26, sel_replaceOccurrencesOfString_withString_options_range_, a3, a4, a5, location, length);
  }
  else
  {
    v22.NSUInteger location = location;
    v22.NSUInteger length = length;
    return CFStringFindAndReplace((CFMutableStringRef)self, (CFStringRef)a3, (CFStringRef)a4, v22, ~(8 * (_BYTE)a5) & 0x10 | a5);
  }
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  int v6 = __CFStringCheckAndReplace((__CFString *)self, a4, 0, (__CFString *)a3);
  if (v6) {
    mutateError(a2, v6, self);
  }
}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  int v5 = __CFStringCheckAndReplace((__CFString *)self, a3.location, a3.length, &stru_1ECE10768);
  if (v5) {
    mutateError(a2, v5, self);
  }
}

- (void)setString:(id)a3
{
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  int v7 = __CFStringCheckAndReplace((__CFString *)self, 0, Length2, (__CFString *)a3);
  if (v7) {
    mutateError(a2, v7, self);
  }
}

- (BOOL)_isCString
{
  return __CFStringIsEightBit((uint64_t)self);
}

- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  if (!__CFStringMtbl((uint64_t)self)) {
    -[__NSCFString appendCharacters:length:](a2);
  }

  CFStringAppendCharacters((CFMutableStringRef)self, a3, a4);
}

- (void)getLineStart:(unint64_t *)a3 end:(unint64_t *)a4 contentsEnd:(unint64_t *)a5 forRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  unint64_t Length2 = _CFStringGetLength2((unint64_t *)self);
  unint64_t v14 = Length2;
  if (location + length > Length2)
  {
    uint64_t v23 = __CFExceptionProem((objc_class *)self, a2);
    uint64_t v24 = "";
    if (length == 64) {
      uint64_t v24 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    }
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: Range {%lu, %lu} out of bounds; string length %lu%s",
      v23,
      location,
      length,
      v14,
      v24);
  }
  if ((Length2 < length || location > Length2 - length) && (getLineStart_end_contentsEnd_forRange__warnonce & 1) == 0)
  {
    getLineStart_end_contentsEnd_forRange__warnonce = 1;
    __int16 v15 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(4, @"*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution.",
      v16,
      v17,
      v18,
      v19,
      v20,
      v21,
      v15);
  }
  v22.NSUInteger location = location;
  v22.NSUInteger length = length;

  CFStringGetLineBounds((CFStringRef)self, v22, (CFIndex *)a3, (CFIndex *)a4, (CFIndex *)a5);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (const)cString
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  if (__CFStringMtbl((uint64_t)self)) {
    goto LABEL_2;
  }
  CFStringEncoding SystemEncoding = enc;
  if (enc == -1)
  {
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    enc = SystemEncoding;
  }
  result = (const char *)_CFNonObjCStringGetCStringPtr((unint64_t *)self, SystemEncoding, 1);
  if (!result)
  {
LABEL_2:
    v5.receiver = self;
    v5.super_class = (Class)__NSCFString;
    return [(__NSCFString *)&v5 cString];
  }
  return result;
}

- (unint64_t)cStringLength
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  CFStringEncoding SystemEncoding = enc;
  if (enc == -1)
  {
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    enc = SystemEncoding;
  }
  if (_CFNonObjCStringGetCStringPtr((unint64_t *)self, SystemEncoding, 0))
  {
    return _CFStringGetLength2((unint64_t *)self);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)__NSCFString;
    return [(__NSCFString *)&v5 cStringLength];
  }
}

- (unint64_t)smallestEncoding
{
  CFStringEncoding SmallestEncoding = CFStringGetSmallestEncoding((CFStringRef)self);

  return CFStringConvertEncodingToNSStringEncoding(SmallestEncoding);
}

- (void)characterAtIndex:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: Range or index out of bounds", v2);
}

- (void)getCharacters:(objc_class *)a1 range:(const char *)a2 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: Range or index out of bounds", v2);
}

- (void)hasPrefix:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: nil argument", v2);
}

- (void)hasSuffix:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: nil argument", v2);
}

- (void)appendFormat:(const char *)a1 .cold.1(const char *a1)
{
  Name = sel_getName(a1);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"Attempt to mutate immutable object with %s", Name);
}

- (void)appendCharacters:(const char *)a1 length:.cold.1(const char *a1)
{
  Name = sel_getName(a1);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"Attempt to mutate immutable object with %s", Name);
}

- (void)replaceOccurrencesOfString:(const char *)a1 withString:options:range:.cold.1(const char *a1)
{
  Name = sel_getName(a1);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"Attempt to mutate immutable object with %s", Name);
}

- (void)replaceOccurrencesOfString:(objc_class *)a1 withString:(const char *)a2 options:range:.cold.2(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: nil argument", v2);
}

@end