@interface LibcoreIoIoUtils
+ (BOOL)canOpenReadOnlyWithNSString:(id)a3;
+ (const)__metadata;
+ (id)readFileAsByteArrayWithNSString:(id)a3;
+ (id)readFileAsBytesWithNSString:(id)a3;
+ (id)readFileAsStringWithNSString:(id)a3;
+ (void)closeQuietlyWithJavaIoFileDescriptor:(id)a3;
+ (void)closeQuietlyWithJavaLangAutoCloseable:(id)a3;
+ (void)closeQuietlyWithJavaNetSocket:(id)a3;
+ (void)closeWithJavaIoFileDescriptor:(id)a3;
+ (void)deleteContentsWithJavaIoFile:(id)a3;
+ (void)setBlockingWithJavaIoFileDescriptor:(id)a3 withBoolean:(BOOL)a4;
+ (void)throwInterruptedIoException;
@end

@implementation LibcoreIoIoUtils

+ (void)closeWithJavaIoFileDescriptor:(id)a3
{
}

+ (void)closeQuietlyWithJavaLangAutoCloseable:(id)a3
{
}

+ (void)closeQuietlyWithJavaIoFileDescriptor:(id)a3
{
}

+ (void)closeQuietlyWithJavaNetSocket:(id)a3
{
}

+ (void)setBlockingWithJavaIoFileDescriptor:(id)a3 withBoolean:(BOOL)a4
{
}

+ (id)readFileAsByteArrayWithNSString:(id)a3
{
  v3 = sub_1001E0648(a3);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [(JavaIoByteArrayOutputStream *)v3 toByteArray];
}

+ (id)readFileAsStringWithNSString:(id)a3
{
  v3 = sub_1001E0648(a3);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [(JavaIoByteArrayOutputStream *)v3 description];
}

+ (id)readFileAsBytesWithNSString:(id)a3
{
  return sub_1001E0648(a3);
}

+ (void)deleteContentsWithJavaIoFile:(id)a3
{
}

+ (BOOL)canOpenReadOnlyWithNSString:(id)a3
{
  return LibcoreIoIoUtils_canOpenReadOnlyWithNSString_((uint64_t)a3);
}

+ (void)throwInterruptedIoException
{
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100431AE0;
}

@end