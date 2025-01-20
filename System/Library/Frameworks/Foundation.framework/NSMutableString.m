@interface NSMutableString
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (NSMutableString)allocWithZone:(_NSZone *)a3;
+ (NSMutableString)stringWithCapacity:(NSUInteger)capacity;
- (BOOL)applyTransform:(NSStringTransform)transform reverse:(BOOL)reverse range:(NSRange)range updatedRange:(NSRangePointer)resultingRange;
- (Class)classForCoder;
- (NSMutableString)initWithCapacity:(NSUInteger)capacity;
- (NSUInteger)replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange;
- (unint64_t)_replaceOccurrencesOfRegularExpressionPattern:(id)a3 withTemplate:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6;
- (void)_cfAppendCString:(const char *)a3 length:(int64_t)a4;
- (void)_cfCapitalize:(const void *)a3;
- (void)_cfLowercase:(const void *)a3;
- (void)_cfNormalize:(int64_t)a3;
- (void)_cfPad:(__CFString *)a3 length:(unsigned int)a4 padIndex:(unsigned int)a5;
- (void)_cfTrim:(__CFString *)a3;
- (void)_cfTrimWS;
- (void)_cfUppercase:(const void *)a3;
- (void)_trimWithCharacterSet:(id)a3;
- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (void)appendFormat:(NSString *)format;
- (void)appendString:(NSString *)aString;
- (void)deleteCharactersInRange:(NSRange)range;
- (void)insertString:(NSString *)aString atIndex:(NSUInteger)loc;
- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)aString;
- (void)replaceCharactersInRange:(_NSRange)a3 withCString:(const char *)a4 length:(unint64_t)a5;
- (void)replaceCharactersInRange:(_NSRange)a3 withCharacters:(const unsigned __int16 *)a4 length:(unint64_t)a5;
- (void)setString:(NSString *)aString;
@end

@implementation NSMutableString

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

+ (NSMutableString)allocWithZone:(_NSZone *)a3
{
  if ((id)__NSMutableStringClass == a1) {
    return (NSMutableString *)&__mutablePlaceholder;
  }
  else {
    return (NSMutableString *)NSAllocateObject((Class)a1, 0, a3);
  }
}

+ (NSMutableString)stringWithCapacity:(NSUInteger)capacity
{
  v3 = [(NSPlaceholderMutableString *)&__mutablePlaceholder initWithCapacity:capacity];

  return (NSMutableString *)v3;
}

- (NSUInteger)replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
  unint64_t length = searchRange.length;
  unint64_t location = searchRange.location;
  NSUInteger v13 = [(NSString *)self length];
  if (!target || !replacement)
  {
    v23 = +[NSString stringWithFormat:@"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)];
    v24 = (void *)MEMORY[0x1E4F1CA00];
    v25 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_21;
  }
  if (v13 < length || location > v13 - length)
  {
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
            _NSMethodExceptionProem((objc_class *)self, a2),
            location,
            length,
            v13);
    v24 = (void *)MEMORY[0x1E4F1CA00];
    v25 = (void *)MEMORY[0x1E4F1C4A8];
LABEL_21:
    objc_exception_throw((id)[v24 exceptionWithName:*v25 reason:v23 userInfo:0]);
  }
  if ((options & 0x400) != 0)
  {
    return -[NSMutableString _replaceOccurrencesOfRegularExpressionPattern:withTemplate:options:range:](self, "_replaceOccurrencesOfRegularExpressionPattern:withTemplate:options:range:", target, replacement, options, location, length);
  }
  else
  {
    v27.unint64_t location = location;
    v27.unint64_t length = length;
    CFArrayRef Results = CFStringCreateArrayWithFindResults(0, (CFStringRef)self, (CFStringRef)target, v27, ~(8 * (_BYTE)options) & 0x10 | options);
    if (!Results) {
      return 0;
    }
    CFArrayRef v15 = Results;
    CFIndex Count = CFArrayGetCount(Results);
    NSUInteger v17 = Count;
    if (Count)
    {
      CFIndex v18 = 0;
      CFIndex v19 = Count - 1;
      do
      {
        if ((options & 4) != 0) {
          CFIndex v20 = v18;
        }
        else {
          CFIndex v20 = v19;
        }
        ValueAtIndex = CFArrayGetValueAtIndex(v15, v20);
        -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", *ValueAtIndex, ValueAtIndex[1], replacement);
        ++v18;
        --v19;
      }
      while (v19 != -1);
    }
    CFRelease(v15);
    return v17;
  }
}

- (void)appendFormat:(NSString *)format
{
  va_start(va, format);
  v4 = (void *)[objc_allocWithZone((Class)NSString) initWithFormat:format locale:0 arguments:va];
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", [(NSString *)self length], 0, v4);
}

- (void)appendString:(NSString *)aString
{
  NSUInteger v5 = [(NSString *)self length];

  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", v5, 0, aString);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withCharacters:(const unsigned __int16 *)a4 length:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = (id)[objc_allocWithZone((Class)NSString) initWithCharacters:a4 length:a5];
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", location, length, v8);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withCString:(const char *)a4 length:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = (id)[objc_allocWithZone((Class)NSString) initWithCString:a4 length:a5];
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", location, length, v8);
}

- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  NSUInteger v7 = [(NSString *)self length];

  -[NSMutableString replaceCharactersInRange:withCharacters:length:](self, "replaceCharactersInRange:withCharacters:length:", v7, 0, a3, a4);
}

- (void)_cfAppendCString:(const char *)a3 length:(int64_t)a4
{
  NSUInteger v7 = [(NSString *)self length];

  -[NSMutableString replaceCharactersInRange:withCString:length:](self, "replaceCharactersInRange:withCString:length:", v7, 0, a3, a4);
}

- (void)_cfLowercase:(const void *)a3
{
  NSUInteger v4 = [(NSString *)self length];
  NSUInteger v5 = [(NSString *)self lowercaseString];

  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", 0, v4, v5);
}

- (void)_cfUppercase:(const void *)a3
{
  NSUInteger v4 = [(NSString *)self length];
  NSUInteger v5 = [(NSString *)self uppercaseString];

  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", 0, v4, v5);
}

- (void)_cfCapitalize:(const void *)a3
{
  NSUInteger v4 = [(NSString *)self length];
  NSUInteger v5 = [(NSString *)self capitalizedString];

  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", 0, v4, v5);
}

- (void)_cfPad:(__CFString *)a3 length:(unsigned int)a4 padIndex:(unsigned int)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = [(NSString *)self length];
  uint64_t v10 = a4;
  if (v9 > a4)
  {
    -[NSMutableString deleteCharactersInRange:](self, "deleteCharactersInRange:", a4, v9 - a4);
    return;
  }
  if (v9 >= a4) {
    return;
  }
  uint64_t v11 = a4 - v9;
  if ((uint64_t)(v10 - v9) >= 512)
  {
    NSUInteger v13 = malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
    CFIndex Length = CFStringGetLength(a3);
LABEL_10:
    CFIndex v14 = a5;
    if (v11 >= Length - a5) {
      CFIndex v15 = Length - a5;
    }
    else {
      CFIndex v15 = v11;
    }
    uint64_t v16 = v11;
    do
    {
      NSUInteger v17 = [(NSString *)self length];
      v22.NSUInteger location = v14;
      v22.NSUInteger length = v15;
      CFStringGetCharacters(a3, v22, (UniChar *)&v13[2 * (v10 - v16) + -2 * v17]);
      v16 -= v15;
      BOOL v18 = v16 < v15;
      CFIndex v15 = v16;
      if (!v18) {
        CFIndex v15 = CFStringGetLength(a3);
      }
      CFIndex v14 = 0;
    }
    while (v16 > 0);
    goto LABEL_17;
  }
  CFIndex Length = CFStringGetLength(a3);
  NSUInteger v13 = v19;
  if (v11 >= 1) {
    goto LABEL_10;
  }
LABEL_17:
  -[NSMutableString replaceCharactersInRange:withCharacters:length:](self, "replaceCharactersInRange:withCharacters:length:", [(NSString *)self length], 0, v13, v11);
  if (v13 != v19) {
    free(v13);
  }
}

- (void)_cfTrim:(__CFString *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  result.NSUInteger location = 0;
  result.NSUInteger length = 0;
  CFIndex v5 = [(NSString *)self length];
  v10.NSUInteger location = 0;
  v10.NSUInteger length = v5;
  if (CFStringFindWithOptions((CFStringRef)self, a3, v10, 8uLL, &result))
  {
    do
    {
      CFIndex v6 = result.length + result.location;
      CFIndex v7 = v5 - (result.length + result.location);
      v11.NSUInteger location = result.length + result.location;
      v11.NSUInteger length = v7;
    }
    while (CFStringFindWithOptions((CFStringRef)self, a3, v11, 8uLL, &result));
  }
  else
  {
    CFIndex v6 = 0;
    CFIndex v7 = v5;
  }
  if (v6 >= v5)
  {
    CFIndex v6 = v5;
  }
  else
  {
    if (CFStringGetLength(a3) < v7)
    {
      while (1)
      {
        v12.NSUInteger location = v6;
        v12.NSUInteger length = v7;
        if (!CFStringFindWithOptions((CFStringRef)self, a3, v12, 0xCuLL, &result)) {
          break;
        }
        CFIndex v7 = result.location - v6;
      }
    }
    -[NSMutableString deleteCharactersInRange:](self, "deleteCharactersInRange:", v7 + v6, [(NSString *)self length] - (v7 + v6));
  }
  -[NSMutableString deleteCharactersInRange:](self, "deleteCharactersInRange:", 0, v6);
}

- (void)_trimWithCharacterSet:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = [(NSString *)self length];
  NSUInteger v6 = v5;
  long long v33 = 0u;
  memset(v32, 0, sizeof(v32));
  long long v29 = 0u;
  v30 = self;
  unint64_t v31 = v5;
  v28 = self;
  if (v5)
  {
    if (v5 >= 0x20) {
      uint64_t v7 = 32;
    }
    else {
      uint64_t v7 = v5;
    }
    *(void *)&long long v29 = v7;
    objc_msgSend(self, sel_getUid("getCharacters:range:"), (char *)v32 + 8, 0, v7);
    unsigned __int16 v8 = WORD4(v32[0]);
  }
  else
  {
    unsigned __int16 v8 = -1;
  }
  *((void *)&v29 + 1) = 1;
  WORD4(v33) = v8;
  unint64_t v9 = 1;
  while (1)
  {
    unint64_t v10 = v29;
    if (v9 > (unint64_t)v29) {
      goto LABEL_23;
    }
    int v11 = [a3 characterIsMember:v8];
    uint64_t v12 = *((void *)&v29 + 1);
    if (!v11) {
      break;
    }
    if (*((void *)&v29 + 1) >= (unint64_t)v29)
    {
      uint64_t v13 = *(void *)&v32[0] + v29;
      if (v31 > *(void *)&v32[0] + (void)v29)
      {
        if (v31 - (*(void *)&v32[0] + (void)v29) >= 0x20) {
          uint64_t v14 = 32;
        }
        else {
          uint64_t v14 = v31 - (*(void *)&v32[0] + v29);
        }
        *(void *)&v32[0] += v29;
        *(void *)&long long v29 = v14;
        objc_msgSend(v30, sel_getUid("getCharacters:range:"), (char *)v32 + 8, v13, v14);
        unsigned __int16 v8 = WORD4(v32[0]);
        WORD4(v33) = WORD4(v32[0]);
        *((void *)&v29 + 1) = 1;
        unint64_t v9 = 1;
        goto LABEL_19;
      }
      unint64_t v9 = v29 + 1;
      *((void *)&v29 + 1) = v29 + 1;
      unsigned __int16 v8 = -1;
    }
    else
    {
      unint64_t v9 = ++*((void *)&v29 + 1);
      unsigned __int16 v8 = *((_WORD *)v32 + v12 + 4);
    }
    WORD4(v33) = v8;
LABEL_19:
    if (!v9) {
      goto LABEL_24;
    }
  }
  if (!*((void *)&v29 + 1)) {
    goto LABEL_24;
  }
  unint64_t v9 = *((void *)&v29 + 1);
  unint64_t v10 = v29;
LABEL_23:
  if (v9 > v10)
  {
LABEL_24:
    [(NSMutableString *)self setString:&stru_1ECA5C228];
    return;
  }
  uint64_t v15 = *(void *)&v32[0];
  unint64_t v16 = v6 - 1;
  BOOL v17 = *(void *)&v32[0] <= v6 - 1 && *(void *)&v32[0] + v10 > v16;
  uint64_t v18 = *(void *)&v32[0];
  if (!v17)
  {
    if (v16 > 0xF)
    {
      unint64_t v20 = v31;
      if (v31 - 16 >= v16)
      {
        unint64_t v19 = v6 - 17;
      }
      else if (v31 >= 0x20)
      {
        unint64_t v19 = v31 - 32;
      }
      else
      {
        unint64_t v19 = 0;
      }
      *(void *)&v32[0] = v19;
    }
    else
    {
      unint64_t v19 = 0;
      *(void *)&v32[0] = 0;
      unint64_t v20 = v31;
    }
    unint64_t v21 = v20 - v19;
    if (v21 >= 0x20) {
      uint64_t v22 = 32;
    }
    else {
      uint64_t v22 = v21;
    }
    *(void *)&long long v29 = v22;
    objc_msgSend(v30, sel_getUid("getCharacters:range:"), (char *)v32 + 8, v19, v22);
    WORD4(v33) = WORD4(v32[0]);
    uint64_t v18 = *(void *)&v32[0];
  }
  uint64_t v23 = v9 + v15;
  uint64_t v24 = v16 - v18;
  *((void *)&v29 + 1) = v24 + 1;
  WORD4(v33) = *((_WORD *)v32 + v24 + 4);
  if (objc_msgSend(a3, "characterIsMember:"))
  {
    do
    {
      uint64_t v25 = *((void *)&v29 + 1);
      if (*((void *)&v29 + 1) < 2uLL)
      {
        if (*(void *)&v32[0])
        {
          if (*(void *)&v32[0] >= 0x20uLL) {
            uint64_t v27 = 32;
          }
          else {
            uint64_t v27 = *(void *)&v32[0];
          }
          *(void *)&long long v29 = v27;
          *((void *)&v29 + 1) = v27;
          *(void *)&v32[0] -= v27;
          objc_msgSend(v30, sel_getUid("getCharacters:range:"), (char *)v32 + 8, *(void *)&v32[0], v27);
          __int16 v26 = *((_WORD *)v32 + *((void *)&v29 + 1) + 3);
        }
        else
        {
          *((void *)&v29 + 1) = 0;
          __int16 v26 = -1;
        }
      }
      else
      {
        --*((void *)&v29 + 1);
        __int16 v26 = *((_WORD *)v32 + v25 + 2);
      }
      WORD4(v33) = v26;
    }
    while ((objc_msgSend(a3, "characterIsMember:") & 1) != 0);
  }
  if (v6 != *((void *)&v29 + 1) + *(void *)&v32[0]) {
    -[NSMutableString replaceCharactersInRange:withString:](v28, "replaceCharactersInRange:withString:", *((void *)&v29 + 1) + *(void *)&v32[0], v6 - (*((void *)&v29 + 1) + *(void *)&v32[0]), &stru_1ECA5C228);
  }
  if (v23 != 1) {
    -[NSMutableString replaceCharactersInRange:withString:](v28, "replaceCharactersInRange:withString:", 0, v23 - 1, &stru_1ECA5C228);
  }
}

- (void)_cfTrimWS
{
  v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];

  [(NSMutableString *)self _trimWithCharacterSet:v3];
}

- (void)_cfNormalize:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      NSUInteger v4 = [(NSString *)self length];
      NSUInteger v5 = [(NSString *)self decomposedStringWithCanonicalMapping];
      break;
    case 1:
      NSUInteger v4 = [(NSString *)self length];
      NSUInteger v5 = [(NSString *)self decomposedStringWithCompatibilityMapping];
      break;
    case 2:
      NSUInteger v4 = [(NSString *)self length];
      NSUInteger v5 = [(NSString *)self precomposedStringWithCanonicalMapping];
      break;
    case 3:
      NSUInteger v4 = [(NSString *)self length];
      NSUInteger v5 = [(NSString *)self precomposedStringWithCompatibilityMapping];
      break;
    default:
      NSUInteger v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: invalid normalization form %ld", objc_opt_class(), a3), 0 reason userInfo];
      objc_exception_throw(v6);
  }

  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", 0, v4, v5);
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)aString
{
}

- (void)insertString:(NSString *)aString atIndex:(NSUInteger)loc
{
}

- (void)deleteCharactersInRange:(NSRange)range
{
}

- (void)setString:(NSString *)aString
{
  NSUInteger v5 = [(NSString *)self length];

  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", 0, v5, aString);
}

- (BOOL)applyTransform:(NSStringTransform)transform reverse:(BOOL)reverse range:(NSRange)range updatedRange:(NSRangePointer)resultingRange
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  NSRange v9 = range;
  int v7 = CFStringTransform((CFMutableStringRef)self, (CFRange *)&v9, (CFStringRef)transform, reverse);
  if (resultingRange && v7) {
    *resultingRange = v9;
  }
  return v7 != 0;
}

- (Class)classForCoder
{
  return (Class)__NSMutableStringClass;
}

- (NSMutableString)initWithCapacity:(NSUInteger)capacity
{
}

- (unint64_t)_replaceOccurrencesOfRegularExpressionPattern:(id)a3 withTemplate:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  unint64_t v12 = a5 & 1;
  if (_MergedGlobals_144 != -1) {
    dispatch_once(&_MergedGlobals_144, &__block_literal_global_69);
  }
  uint64_t v13 = +[NSString stringWithFormat:@"%lx:%@", v12, a3];
  id v14 = (id)[(id)qword_1EB1EDC60 objectForKey:v13];
  if (!v14)
  {
    unint64_t result = [[NSRegularExpression alloc] initWithPattern:a3 options:v12 error:0];
    if (!result) {
      return result;
    }
    id v14 = (id)result;
    [(id)qword_1EB1EDC60 setObject:result forKey:v13];
  }
  unint64_t v16 = objc_msgSend(v14, "replaceMatchesInString:options:range:withTemplate:", self, (a5 >> 1) & 4, location, length, a4);

  return v16;
}

@end