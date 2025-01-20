@interface JavaNioCharsetModifiedUtf8
+ (const)__metadata;
+ (id)decodeWithByteArray:(id)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (id)encodeWithNSString:(id)a3;
+ (int64_t)countBytesWithNSString:(id)a3 withBoolean:(BOOL)a4;
+ (void)encodeWithByteArray:(id)a3 withInt:(int)a4 withNSString:(id)a5;
@end

@implementation JavaNioCharsetModifiedUtf8

+ (id)decodeWithByteArray:(id)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return JavaNioCharsetModifiedUtf8_decodeWithByteArray_withCharArray_withInt_withInt_((uint64_t)a3, (uint64_t)a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a5, *(uint64_t *)&a6, v6, v7);
}

+ (int64_t)countBytesWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  return JavaNioCharsetModifiedUtf8_countBytesWithNSString_withBoolean_(a3, a4);
}

+ (void)encodeWithByteArray:(id)a3 withInt:(int)a4 withNSString:(id)a5
{
}

+ (id)encodeWithNSString:(id)a3
{
  return JavaNioCharsetModifiedUtf8_encodeWithNSString_(a3);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F6338;
}

@end