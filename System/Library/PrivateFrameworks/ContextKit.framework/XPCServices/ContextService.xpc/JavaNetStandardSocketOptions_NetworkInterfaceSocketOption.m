@interface JavaNetStandardSocketOptions_NetworkInterfaceSocketOption
+ (const)__metadata;
- (JavaNetStandardSocketOptions_NetworkInterfaceSocketOption)initWithNSString:(id)a3 withInt:(int)a4;
- (id)validateAndConvertValueAfterGetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4;
- (id)validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4;
@end

@implementation JavaNetStandardSocketOptions_NetworkInterfaceSocketOption

- (JavaNetStandardSocketOptions_NetworkInterfaceSocketOption)initWithNSString:(id)a3 withInt:(int)a4
{
  v7 = (void *)JavaNetNetworkInterface_class_();
  JreStrongAssign((id *)&self->super.name_, a3);
  JreStrongAssign((id *)&self->super.type_, v7);
  self->super.socketOption_ = a4;
  return self;
}

- (id)validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4
{
  if (!a4)
  {
    CFStringRef v10 = JreStrcat("$$$", (uint64_t)a2, (uint64_t)a3, 0, v4, v5, v6, v7, @"value for ");
    goto LABEL_8;
  }
  int v8 = objc_msgSend(a4, "getIndex", a3);
  if (v8 == -1)
  {
    CFStringRef v10 = @"The NetworkInterface must have a valid index";
LABEL_8:
    v11 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v10);
    objc_exception_throw(v11);
  }
  return JavaLangInteger_valueOfWithInt_(v8);
}

- (id)validateAndConvertValueAfterGetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4
{
  if (!a4) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (__CFString *)JreStrcat("$$", v5, v6, v7, v8, v9, v10, v11, @"Unexpected type of value returned for ");
    v14 = new_JavaLangAssertionError_initWithId_(v13);
    objc_exception_throw(v14);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return JavaNetNetworkInterface_getByIndexWithInt_((uint64_t)[a4 intValue]);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100454890;
}

@end