@interface JavaNetStandardSocketOptions_SocketOptionImpl
+ (const)__metadata;
- (JavaNetStandardSocketOptions_SocketOptionImpl)initWithNSString:(id)a3 withIOSClass:(id)a4 withInt:(int)a5;
- (id)getValueWithJavaIoFileDescriptor:(id)a3;
- (id)name;
- (id)type;
- (id)validateAndConvertValueAfterGetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4;
- (id)validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4;
- (void)dealloc;
- (void)setValueWithJavaIoFileDescriptor:(id)a3 withId:(id)a4;
@end

@implementation JavaNetStandardSocketOptions_SocketOptionImpl

- (JavaNetStandardSocketOptions_SocketOptionImpl)initWithNSString:(id)a3 withIOSClass:(id)a4 withInt:(int)a5
{
  self->socketOption_ = a5;
  return self;
}

- (id)name
{
  return self->name_;
}

- (id)type
{
  return self->type_;
}

- (void)setValueWithJavaIoFileDescriptor:(id)a3 withId:(id)a4
{
  if (a4)
  {
    type = self->type_;
    if (!type) {
      JreThrowNullPointerException();
    }
    if (!-[IOSClass isAssignableFrom:](type, "isAssignableFrom:", [a4 getClass]))
    {
      v22 = (__CFString *)JreStrcat("$@$$", v8, v9, v10, v11, v12, v13, v14, @"Invalid type ");
      v23 = new_JavaLangAssertionError_initWithId_(v22);
      objc_exception_throw(v23);
    }
  }
  id v15 = [(JavaNetStandardSocketOptions_SocketOptionImpl *)self validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:a3 withId:a4];
  uint64_t socketOption = self->socketOption_;
  LibcoreIoIoBridge_setSocketOptionWithJavaIoFileDescriptor_withInt_withId_((uint64_t)a3, socketOption, v15, v16, v17, v18, v19, v20);
}

- (id)validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4
{
  if (!a4)
  {
    CFStringRef v9 = JreStrcat("$$$", (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, @"value for ");
    uint64_t v10 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v9);
    objc_exception_throw(v10);
  }
  return a4;
}

- (id)getValueWithJavaIoFileDescriptor:(id)a3
{
  id v9 = [(JavaNetStandardSocketOptions_SocketOptionImpl *)self validateAndConvertValueAfterGetWithJavaIoFileDescriptor:a3 withId:LibcoreIoIoBridge_getSocketOptionWithJavaIoFileDescriptor_withInt_((uint64_t)a3, self->socketOption_, (uint64_t)a3, v3, v4, v5, v6, v7)];
  uint64_t v10 = v9;
  if (v9)
  {
    type = self->type_;
    if (!type) {
      JreThrowNullPointerException();
    }
    if (!-[IOSClass isAssignableFrom:](type, "isAssignableFrom:", [v9 getClass]))
    {
      uint64_t v20 = (__CFString *)JreStrcat("$$", v12, v13, v14, v15, v16, v17, v18, @"Unexpected type of value returned for ");
      v21 = new_JavaLangAssertionError_initWithId_(v20);
      objc_exception_throw(v21);
    }
  }
  return v10;
}

- (id)validateAndConvertValueAfterGetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4
{
  return a4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetStandardSocketOptions_SocketOptionImpl;
  [(JavaNetStandardSocketOptions_SocketOptionImpl *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004546F0;
}

@end