@interface JavaNetDefaultFileNameMap
+ (const)__metadata;
- (id)getContentTypeForWithNSString:(id)a3;
@end

@implementation JavaNetDefaultFileNameMap

- (id)getContentTypeForWithNSString:(id)a3
{
  if (!a3) {
LABEL_8:
  }
    JreThrowNullPointerException();
  if ([a3 hasSuffix:@"/"])
  {
    v4 = @"html";
    goto LABEL_13;
  }
  id v5 = [a3 lastIndexOf:35];
  if ((v5 & 0x80000000) != 0) {
    id v5 = [a3 length];
  }
  uint64_t v6 = [a3 lastIndexOf:46] + 1;
  if ((int)v6 <= (int)[a3 lastIndexOf:47])
  {
    v7 = &stru_10048C1F8;
  }
  else
  {
    v7 = (__CFString *)[a3 substring:v6 endIndex:v5];
    if (!v7) {
      goto LABEL_8;
    }
  }
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v4 = (__CFString *)[(__CFString *)v7 lowercaseStringWithJRELocale:JavaUtilLocale_US_];
LABEL_13:
  return LibcoreNetMimeUtils_guessMimeTypeFromExtensionWithNSString_(v4);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100471B08;
}

@end