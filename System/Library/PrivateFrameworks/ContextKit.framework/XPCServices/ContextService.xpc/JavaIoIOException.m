@interface JavaIoIOException
+ (const)__metadata;
- (JavaIoIOException)init;
- (JavaIoIOException)initWithJavaLangThrowable:(id)a3;
- (JavaIoIOException)initWithNSString:(id)a3;
- (JavaIoIOException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
@end

@implementation JavaIoIOException

- (JavaIoIOException)init
{
  return self;
}

- (JavaIoIOException)initWithNSString:(id)a3
{
  return self;
}

- (JavaIoIOException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
  return self;
}

- (JavaIoIOException)initWithJavaLangThrowable:(id)a3
{
  if (a3) {
    id v5 = [a3 description];
  }
  else {
    id v5 = 0;
  }
  JavaLangException_initWithNSString_withJavaLangThrowable_(self, v5, a3);
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043B5D0;
}

@end