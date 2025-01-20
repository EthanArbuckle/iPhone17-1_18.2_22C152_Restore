@interface JavaNetStandardSocketOptions_PositiveIntegerSocketOption
+ (const)__metadata;
- (JavaNetStandardSocketOptions_PositiveIntegerSocketOption)initWithNSString:(id)a3 withInt:(int)a4;
- (id)validateAndConvertValueAfterGetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4;
- (id)validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4;
@end

@implementation JavaNetStandardSocketOptions_PositiveIntegerSocketOption

- (JavaNetStandardSocketOptions_PositiveIntegerSocketOption)initWithNSString:(id)a3 withInt:(int)a4
{
  v7 = (void *)JavaLangInteger_class_();
  JreStrongAssign((id *)&self->super.name_, a3);
  JreStrongAssign((id *)&self->super.type_, v7);
  self->super.socketOption_ = a4;
  return self;
}

- (id)validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  if ((int)objc_msgSend(a4, "intValue", a3) <= 0)
  {
    CFStringRef v14 = JreStrcat("$$", v6, v7, v8, v9, v10, v11, v12, self->super.name_);
    v15 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v14);
    objc_exception_throw(v15);
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
  int v12 = [a4 intValue];
  if (v12 <= 0)
  {
LABEL_9:
    CFStringRef v14 = (__CFString *)JreStrcat("$$$@", v5, v6, v7, v8, v9, v10, v11, @"Unexpected value for option ");
    v15 = new_JavaLangAssertionError_initWithId_(v14);
    objc_exception_throw(v15);
  }
  return JavaLangInteger_valueOfWithInt_(v12);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100454A90;
}

@end