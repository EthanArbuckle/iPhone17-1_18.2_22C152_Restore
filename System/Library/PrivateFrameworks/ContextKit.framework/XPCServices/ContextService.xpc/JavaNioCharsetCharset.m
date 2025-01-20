@interface JavaNioCharsetCharset
+ (BOOL)isSupportedWithNSString:(id)a3;
+ (BOOL)isValidCharsetNameCharacterWithChar:(unsigned __int16)a3;
+ (const)__metadata;
+ (id)cacheCharsetWithNSString:(id)a3 withJavaNioCharsetCharset:(id)a4;
+ (id)forNameUEEWithNSString:(id)a3;
+ (id)forNameWithNSString:(id)a3;
+ (void)checkCharsetNameWithNSString:(id)a3;
+ (void)initialize;
- (BOOL)canEncode;
- (BOOL)containsWithJavaNioCharsetCharset:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRegistered;
- (JavaNioCharsetCharset)initWithNSString:(id)a3 withNSStringArray:(id)a4;
- (NSString)description;
- (id)aliases;
- (id)decodeWithJavaNioByteBuffer:(id)a3;
- (id)displayName;
- (id)displayNameWithJavaUtilLocale:(id)a3;
- (id)encodeWithJavaNioCharBuffer:(id)a3;
- (id)encodeWithNSString:(id)a3;
- (id)name;
- (id)newDecoder;
- (id)newEncoder;
- (int)compareToWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaNioCharsetCharset

- (JavaNioCharsetCharset)initWithNSString:(id)a3 withNSStringArray:(id)a4
{
  return self;
}

+ (void)checkCharsetNameWithNSString:(id)a3
{
}

+ (BOOL)isValidCharsetNameCharacterWithChar:(unsigned __int16)a3
{
  return sub_1001C7F84(a3);
}

+ (id)cacheCharsetWithNSString:(id)a3 withJavaNioCharsetCharset:(id)a4
{
  return sub_1001C8004((uint64_t)a3, a4);
}

+ (id)forNameWithNSString:(id)a3
{
  return JavaNioCharsetCharset_forNameWithNSString_((__CFString *)a3);
}

+ (id)forNameUEEWithNSString:(id)a3
{
  return JavaNioCharsetCharset_forNameUEEWithNSString_((__CFString *)a3);
}

+ (BOOL)isSupportedWithNSString:(id)a3
{
  return JavaNioCharsetCharset_isSupportedWithNSString_((__CFString *)a3);
}

- (BOOL)containsWithJavaNioCharsetCharset:(id)a3
{
  return 0;
}

- (id)newEncoder
{
  return 0;
}

- (id)newDecoder
{
  return 0;
}

- (id)name
{
  return self->canonicalName_;
}

- (id)aliases
{
  return JavaUtilCollections_unmodifiableSetWithJavaUtilSet_(self->aliasesSet_);
}

- (id)displayName
{
  return self->canonicalName_;
}

- (id)displayNameWithJavaUtilLocale:(id)a3
{
  return self->canonicalName_;
}

- (BOOL)isRegistered
{
  canonicalName = self->canonicalName_;
  if (!canonicalName) {
    JreThrowNullPointerException();
  }
  if ([(NSString *)canonicalName hasPrefix:@"x-"]) {
    return 0;
  }
  else {
    return ![(NSString *)self->canonicalName_ hasPrefix:@"X-"];
  }
}

- (BOOL)canEncode
{
  return 1;
}

- (id)encodeWithJavaNioCharBuffer:(id)a3
{
  return sub_1001C84A0(self, (uint64_t)a3);
}

- (id)encodeWithNSString:(id)a3
{
  v4 = JavaNioCharBuffer_wrapWithJavaLangCharSequence_(a3);
  return sub_1001C84A0(self, (uint64_t)v4);
}

- (id)decodeWithJavaNioByteBuffer:(id)a3
{
  id v4 = [(JavaNioCharsetCharset *)self newDecoder];
  if (!v4) {
    goto LABEL_9;
  }
  if ((atomic_load_explicit(JavaNioCharsetCodingErrorAction__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v5 = [v4 onMalformedInputWithJavaNioCharsetCodingErrorAction:JavaNioCharsetCodingErrorAction_REPLACE_];
  if (!v5) {
    goto LABEL_9;
  }
  if ((atomic_load_explicit(JavaNioCharsetCodingErrorAction__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v6 = [v5 onUnmappableCharacterWithJavaNioCharsetCodingErrorAction:JavaNioCharsetCodingErrorAction_REPLACE_];
  if (!v6) {
LABEL_9:
  }
    JreThrowNullPointerException();
  return [v6 decodeWithJavaNioByteBuffer:a3];
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  canonicalName = self->canonicalName_;
  if (!canonicalName) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = *((void *)a3 + 1);
  return [(NSString *)canonicalName compareToIgnoreCase:v6];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  canonicalName = self->canonicalName_;
  if (!canonicalName) {
LABEL_10:
  }
    JreThrowNullPointerException();
  uint64_t v6 = *((void *)a3 + 1);
  return [(NSString *)canonicalName isEqual:v6];
}

- (unint64_t)hash
{
  canonicalName = self->canonicalName_;
  if (!canonicalName) {
    JreThrowNullPointerException();
  }
  return (int)[(NSString *)canonicalName hash];
}

- (NSString)description
{
  id v2 = objc_msgSend(-[JavaNioCharsetCharset getClass](self, "getClass"), "getName");
  return (NSString *)JreStrcat("$C$C", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioCharsetCharset;
  [(JavaNioCharsetCharset *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = new_JavaUtilHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_100560C10, v2);
    atomic_store(1u, (unsigned __int8 *)JavaNioCharsetCharset__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100424368;
}

@end