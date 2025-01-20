@interface JavaUtilInvalidPropertiesFormatException
+ (const)__metadata;
- (JavaUtilInvalidPropertiesFormatException)initWithJavaLangThrowable:(id)a3;
- (JavaUtilInvalidPropertiesFormatException)initWithNSString:(id)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilInvalidPropertiesFormatException

- (JavaUtilInvalidPropertiesFormatException)initWithNSString:(id)a3
{
  return self;
}

- (JavaUtilInvalidPropertiesFormatException)initWithJavaLangThrowable:(id)a3
{
  return self;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  v3 = new_JavaIoNotSerializableException_init();
  objc_exception_throw(v3);
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  v3 = new_JavaIoNotSerializableException_init();
  objc_exception_throw(v3);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100448528;
}

@end