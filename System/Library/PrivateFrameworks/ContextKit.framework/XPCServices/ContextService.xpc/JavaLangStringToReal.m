@interface JavaLangStringToReal
+ (const)__metadata;
+ (double)parseDblImplWithNSString:(id)a3 withInt:(int)a4;
+ (double)parseDoubleWithNSString:(id)a3;
+ (float)parseFloatWithNSString:(id)a3;
+ (float)parseFltImplWithNSString:(id)a3 withInt:(int)a4;
+ (float)parseNameWithNSString:(id)a3 withBoolean:(BOOL)a4;
+ (id)initialParseWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
+ (id)invalidRealWithNSString:(id)a3 withBoolean:(BOOL)a4;
@end

@implementation JavaLangStringToReal

+ (double)parseDblImplWithNSString:(id)a3 withInt:(int)a4
{
  return JavaLangStringToReal_parseDblImplWithNSString_withInt_(a3, a4);
}

+ (float)parseFltImplWithNSString:(id)a3 withInt:(int)a4
{
  return JavaLangStringToReal_parseFltImplWithNSString_withInt_(a3, a4);
}

+ (id)invalidRealWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  sub_1001ACF48((uint64_t)a3, a4, (uint64_t)a3, a4, v4, v5, v6, v7);
}

+ (id)initialParseWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  return sub_1001ACFB8((__CFString *)a3, *(uint64_t *)&a4, a5);
}

+ (float)parseNameWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  return sub_1001AD398(a3, a4);
}

+ (double)parseDoubleWithNSString:(id)a3
{
  return JavaLangStringToReal_parseDoubleWithNSString_(a3);
}

+ (float)parseFloatWithNSString:(id)a3
{
  JavaLangStringToReal_parseFloatWithNSString_(a3);
  return result;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100417A78;
}

@end