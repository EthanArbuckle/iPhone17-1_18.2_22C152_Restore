@interface __NSCFAttributedString
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttributedString:(id)a3;
- (Class)classForCoder;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributedSubstringFromRange:(_NSRange)a3;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5;
- (void)addAttributes:(id)a3 range:(_NSRange)a4;
- (void)appendAttributedString:(id)a3;
- (void)deleteCharactersInRange:(_NSRange)a3;
- (void)insertAttributedString:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAttribute:(id)a3 range:(_NSRange)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributedString:(id)a3;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
@end

@implementation __NSCFAttributedString

- (void)addAttributes:(id)a3 range:(_NSRange)a4
{
  int v6 = _CFAttributedStringCheckAndSetAttributes((uint64_t)self, a4.location, a4.length, (const __CFDictionary *)a3, 0);
  if (v6) {
    mutateError2(a2, v6, self);
  }
}

- (id)attributedSubstringFromRange:(_NSRange)a3
{
  CFAttributedStringRef v3 = CFAttributedStringCreateWithSubstring(0, (CFAttributedStringRef)self, (CFRange)a3);

  return v3;
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  return CFAttributedStringGetAttributesAndLongestEffectiveRange((CFAttributedStringRef)self, a3, (CFRange)a5, (CFRange *)a4);
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return CFAttributedStringGetAttributes((CFAttributedStringRef)self, a3, (CFRange *)a4);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  return (id)CFAttributedStringGetAttribute((CFAttributedStringRef)self, a4, (CFStringRef)a3, (CFRange *)a5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return CFAttributedStringCreateCopy(0, (CFAttributedStringRef)self);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  return (id)CFAttributedStringGetAttributeAndLongestEffectiveRange((CFAttributedStringRef)self, a4, (CFStringRef)a3, (CFRange)a6, (CFRange *)a5);
}

- (void)insertAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  int v6 = _CFAttributedStringCheckAndReplaceAttributed((uint64_t)self, a4, 0, (const __CFAttributedString *)a3);
  if (v6) {
    mutateError2(a2, v6, self);
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return CFAttributedStringCreateMutableCopy(0, 0, (CFAttributedStringRef)self);
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (BOOL)isEqual:(id)a3
{
  return a3 && _CFNonObjCEqual((unint64_t *)self, (unint64_t)a3) != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  return a3 && CFEqual(self, a3) != 0;
}

- (Class)classForCoder
{
  if (__CFAttributedStringMtbl((uint64_t)self)) {
    v2 = "NSMutableAttributedString";
  }
  else {
    v2 = "NSAttributedString";
  }

  return objc_lookUpClass(v2);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  int v6 = _CFAttributedStringCheckAndReplace((uint64_t)self, a3.location, a3.length, (const __CFString *)a4);
  if (v6) {
    mutateError2(a2, v6, self);
  }
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  int v6 = _CFAttributedStringCheckAndSetAttributes((uint64_t)self, a4.location, a4.length, (const __CFDictionary *)a3, 1u);
  if (v6) {
    mutateError2(a2, v6, self);
  }
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  int v6 = _CFAttributedStringCheckAndReplaceAttributed((uint64_t)self, a3.location, a3.length, (const __CFAttributedString *)a4);
  if (v6) {
    mutateError2(a2, v6, self);
  }
}

- (void)appendAttributedString:(id)a3
{
  CFIndex Length = _CFAttributedStringGetLength((uint64_t)self);
  int v7 = _CFAttributedStringCheckAndReplaceAttributed((uint64_t)self, Length, 0, (const __CFAttributedString *)a3);
  if (v7) {
    mutateError2(a2, v7, self);
  }
}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  int v5 = _CFAttributedStringCheckAndReplaceAttributed((uint64_t)self, a3.location, a3.length, 0);
  if (v5) {
    mutateError2(a2, v5, self);
  }
}

- (void)setAttributedString:(id)a3
{
  CFIndex Length = _CFAttributedStringGetLength((uint64_t)self);
  int v7 = _CFAttributedStringCheckAndReplaceAttributed((uint64_t)self, 0, Length, (const __CFAttributedString *)a3);
  if (v7) {
    mutateError2(a2, v7, self);
  }
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  if (!a4) {
    -[__NSCFAttributedString addAttribute:value:range:]((objc_class *)self, a2);
  }
  int v7 = _CFAttributedStringCheckAndSetAttribute((uint64_t)self, a5.location, a5.length, (const __CFString *)a3, a4);
  if (v7) {
    mutateError2(a2, v7, self);
  }
}

- (void)removeAttribute:(id)a3 range:(_NSRange)a4
{
  int v6 = _CFAttributedStringCheckAndSetAttribute((uint64_t)self, a4.location, a4.length, (const __CFString *)a3, 0);
  if (v6) {
    mutateError2(a2, v6, self);
  }
}

- (void)addAttribute:(objc_class *)a1 value:(const char *)a2 range:.cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2 = __CFExceptionProem(a1, a2);
  _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: nil argument", v2);
}

@end