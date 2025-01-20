@interface LibcoreNetUrlUrlUtils
+ (BOOL)isValidSchemeCharWithInt:(int)a3 withChar:(unsigned __int16)a4;
+ (const)__metadata;
+ (id)authoritySafePathWithNSString:(id)a3 withNSString:(id)a4;
+ (id)canonicalizePathWithNSString:(id)a3 withBoolean:(BOOL)a4;
+ (id)getSchemePrefixWithNSString:(id)a3;
+ (int)findFirstOfWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6;
@end

@implementation LibcoreNetUrlUrlUtils

+ (id)canonicalizePathWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  return LibcoreNetUrlUrlUtils_canonicalizePathWithNSString_withBoolean_((__CFString *)a3, a4);
}

+ (id)authoritySafePathWithNSString:(id)a3 withNSString:(id)a4
{
  return (id)LibcoreNetUrlUrlUtils_authoritySafePathWithNSString_withNSString_(a3, a4);
}

+ (id)getSchemePrefixWithNSString:(id)a3
{
  return LibcoreNetUrlUrlUtils_getSchemePrefixWithNSString_(a3);
}

+ (BOOL)isValidSchemeCharWithInt:(int)a3 withChar:(unsigned __int16)a4
{
  unint64_t v4 = (0x680000000000uLL >> a4) & 1;
  if (a4 > 0x2Eu) {
    LOBYTE(v4) = 0;
  }
  if ((a4 - 48) >= 0xA) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 1;
  }
  if (a3 < 1) {
    BOOL v5 = 0;
  }
  return (a4 & 0xFFFFFFDF) - 65 < 0x1A || v5;
}

+ (int)findFirstOfWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return LibcoreNetUrlUrlUtils_findFirstOfWithNSString_withNSString_withInt_withInt_(a3, a4, *(uint64_t *)&a5, a6);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004836C0;
}

@end