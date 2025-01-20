@interface JavaLangIntegralToString
+ (const)__metadata;
+ (id)appendByteAsHexWithJavaLangStringBuilder:(id)a3 withByte:(char)a4 withBoolean:(BOOL)a5;
+ (id)byteToHexStringWithByte:(char)a3 withBoolean:(BOOL)a4;
+ (id)bytesToHexStringWithByteArray:(id)a3 withBoolean:(BOOL)a4;
+ (id)intToBinaryStringWithInt:(int)a3;
+ (id)intToHexStringWithInt:(int)a3 withBoolean:(BOOL)a4 withInt:(int)a5;
+ (id)intToOctalStringWithInt:(int)a3;
+ (id)intToStringWithInt:(int)a3;
+ (id)intToStringWithInt:(int)a3 withInt:(int)a4;
+ (id)longToBinaryStringWithLong:(int64_t)a3;
+ (id)longToHexStringWithLong:(int64_t)a3;
+ (id)longToOctalStringWithLong:(int64_t)a3;
+ (id)longToStringWithLong:(int64_t)a3;
+ (id)longToStringWithLong:(int64_t)a3 withInt:(int)a4;
+ (void)appendIntWithJavaLangAbstractStringBuilder:(id)a3 withInt:(int)a4;
+ (void)appendLongWithJavaLangAbstractStringBuilder:(id)a3 withLong:(int64_t)a4;
@end

@implementation JavaLangIntegralToString

+ (id)intToStringWithInt:(int)a3 withInt:(int)a4
{
  return JavaLangIntegralToString_intToStringWithInt_withInt_(a3, a4);
}

+ (id)intToStringWithInt:(int)a3
{
  return IntegralToString_convertInt(0, a3);
}

+ (void)appendIntWithJavaLangAbstractStringBuilder:(id)a3 withInt:(int)a4
{
}

+ (id)longToStringWithLong:(int64_t)a3 withInt:(int)a4
{
  return (id)JavaLangIntegralToString_longToStringWithLong_withInt_(a3, a4);
}

+ (id)longToStringWithLong:(int64_t)a3
{
  return (id)IntegralToString_convertLong(0, a3);
}

+ (void)appendLongWithJavaLangAbstractStringBuilder:(id)a3 withLong:(int64_t)a4
{
}

+ (id)intToBinaryStringWithInt:(int)a3
{
  return JavaLangIntegralToString_intToBinaryStringWithInt_(a3);
}

+ (id)longToBinaryStringWithLong:(int64_t)a3
{
  return JavaLangIntegralToString_longToBinaryStringWithLong_(a3);
}

+ (id)appendByteAsHexWithJavaLangStringBuilder:(id)a3 withByte:(char)a4 withBoolean:(BOOL)a5
{
  return JavaLangIntegralToString_appendByteAsHexWithJavaLangStringBuilder_withByte_withBoolean_(a3, a4, a5);
}

+ (id)byteToHexStringWithByte:(char)a3 withBoolean:(BOOL)a4
{
  return JavaLangIntegralToString_byteToHexStringWithByte_withBoolean_(a3, a4);
}

+ (id)bytesToHexStringWithByteArray:(id)a3 withBoolean:(BOOL)a4
{
  return JavaLangIntegralToString_bytesToHexStringWithByteArray_withBoolean_();
}

+ (id)intToHexStringWithInt:(int)a3 withBoolean:(BOOL)a4 withInt:(int)a5
{
  return JavaLangIntegralToString_intToHexStringWithInt_withBoolean_withInt_(a3, a4, a5);
}

+ (id)longToHexStringWithLong:(int64_t)a3
{
  return JavaLangIntegralToString_longToHexStringWithLong_(a3);
}

+ (id)intToOctalStringWithInt:(int)a3
{
  return JavaLangIntegralToString_intToOctalStringWithInt_(a3);
}

+ (id)longToOctalStringWithLong:(int64_t)a3
{
  return JavaLangIntegralToString_longToOctalStringWithLong_(a3);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045ECA8;
}

@end