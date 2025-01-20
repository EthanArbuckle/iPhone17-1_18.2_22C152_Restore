@interface JavaNetStandardSocketOptions_$1
+ (const)__metadata;
- (JavaNetStandardSocketOptions_$1)initWithNSString:(id)a3 withIOSClass:(id)a4 withInt:(int)a5;
- (id)validateAndConvertValueAfterGetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4;
- (id)validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4;
@end

@implementation JavaNetStandardSocketOptions_$1

- (id)validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)JavaNetStandardSocketOptions__1;
  id v5 = -[JavaNetStandardSocketOptions_SocketOptionImpl validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:withId:](&v7, "validateAndConvertValueBeforeSetWithJavaIoFileDescriptor:withId:", a3);
  if (a4 && ([a4 intValue] & 0x80000000) != 0)
  {
    if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    return (id)JavaLangBoolean_FALSE__;
  }
  return v5;
}

- (id)validateAndConvertValueAfterGetWithJavaIoFileDescriptor:(id)a3 withId:(id)a4
{
  v4 = a4;
  if (a4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = JavaLangInteger_valueOfWithInt_(-1);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)JavaNetStandardSocketOptions__1;
  return [(JavaNetStandardSocketOptions_SocketOptionImpl *)&v8 validateAndConvertValueAfterGetWithJavaIoFileDescriptor:a3 withId:v4];
}

- (JavaNetStandardSocketOptions_$1)initWithNSString:(id)a3 withIOSClass:(id)a4 withInt:(int)a5
{
  self->super.socketOption_ = a5;
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100454B90;
}

@end