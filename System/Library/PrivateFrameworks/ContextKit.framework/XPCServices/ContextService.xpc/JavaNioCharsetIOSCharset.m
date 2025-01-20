@interface JavaNioCharsetIOSCharset
+ (JavaNioCharsetIOSCharset)getDefaultCharset;
+ (const)__metadata;
+ (id)charsetForNameWithNSString:(id)a3;
+ (uint64_t)getEncodings;
+ (void)initialize;
- (BOOL)containsWithJavaNioCharsetCharset:(id)a3;
- (JavaNioCharsetIOSCharset)initWithLong:(int64_t)a3 withNSString:(id)a4 withNSStringArray:(id)a5 withFloat:(float)a6;
- (id)newDecoder;
- (id)newEncoder;
- (int64_t)nsEncoding;
@end

@implementation JavaNioCharsetIOSCharset

- (JavaNioCharsetIOSCharset)initWithLong:(int64_t)a3 withNSString:(id)a4 withNSStringArray:(id)a5 withFloat:(float)a6
{
  self->nsEncoding_ = a3;
  self->charBytes_ = a6;
  return self;
}

- (int64_t)nsEncoding
{
  return self->nsEncoding_;
}

- (BOOL)containsWithJavaNioCharsetCharset:(id)a3
{
  return 0;
}

- (id)newEncoder
{
  v2 = new_JavaNioCharsetIOSCharsetEncoder_initWithJavaNioCharsetCharset_withFloat_(self, self->charBytes_);
  return v2;
}

- (id)newDecoder
{
  v2 = new_JavaNioCharsetIOSCharsetDecoder_initWithJavaNioCharsetCharset_(self);
  return v2;
}

+ (id)charsetForNameWithNSString:(id)a3
{
  return JavaNioCharsetIOSCharset_charsetForNameWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_1005608C0, v2);
    v3 = +[JavaNioCharsetIOSCharset getDefaultCharset]_0();
    JreStrongAssign((id *)&JavaNioCharsetIOSCharset_DEFAULT_CHARSET_, v3);
    atomic_store(1u, (unsigned __int8 *)JavaNioCharsetIOSCharset__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FF408;
}

+ (JavaNioCharsetIOSCharset)getDefaultCharset
{
  if ((atomic_load_explicit(JavaNioCharsetIOSCharset__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  PropertyWithNSString = (__CFString *)JavaLangSystem_getPropertyWithNSString_(@"file.encoding");
  if (PropertyWithNSString) {
    return (JavaNioCharsetIOSCharset *)JavaNioCharsetCharset_forNameUEEWithNSString_(PropertyWithNSString);
  }
  return sub_10016663C((uint64_t)&unk_1003FF478);
}

+ (uint64_t)getEncodings
{
  if ((atomic_load_explicit(JavaNioCharsetIOSCharset__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (qword_1005608C8 != -1) {
    dispatch_once(&qword_1005608C8, &stru_1003FF6F8);
  }
  return qword_1005608C0;
}

@end