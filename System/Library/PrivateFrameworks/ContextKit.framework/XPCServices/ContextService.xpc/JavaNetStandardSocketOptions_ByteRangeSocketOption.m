@interface JavaNetStandardSocketOptions_ByteRangeSocketOption
+ (const)__metadata;
- (JavaNetStandardSocketOptions_ByteRangeSocketOption)initWithNSString:(id)a3 withInt:(int)a4;
- (id)validateAndConvertValueAfterGetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4;
- (id)validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4;
@end

@implementation JavaNetStandardSocketOptions_ByteRangeSocketOption

- (JavaNetStandardSocketOptions_ByteRangeSocketOption)initWithNSString:(id)a3 withInt:(int)a4
{
  v7 = (void *)JavaLangInteger_class_();
  JreStrongAssign((id *)&self->super.name_, a3);
  JreStrongAssign((id *)&self->super.type_, v7);
  self->super.socketOption_ = a4;
  return self;
}

- (id)validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4
{
  if (!a4
    || (objc_msgSend(a4, "intValue", a3) & 0x80000000) != 0
    || (int)[a4 intValue] >= 256)
  {
    CFStringRef v11 = JreStrcat("$$@", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, self->super.name_);
    v12 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v11);
    objc_exception_throw(v12);
  }
  return a4;
}

- (id)validateAndConvertValueAfterGetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (!a4) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  unsigned int v12 = [a4 intValue];
  if (v12 >= 0x100)
  {
LABEL_9:
    v14 = (__CFString *)JreStrcat("$$$@", v5, v6, v7, v8, v9, v10, v11, @"Unexpected value for option ");
    v15 = new_JavaLangAssertionError_initWithId_(v14);
    objc_exception_throw(v15);
  }
  return JavaLangInteger_valueOfWithInt_(v12);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100454990;
}

@end