@interface JavaLangIllegalStateException
+ (const)__metadata;
- (JavaLangIllegalStateException)init;
- (JavaLangIllegalStateException)initWithJavaLangThrowable:(id)a3;
- (JavaLangIllegalStateException)initWithNSString:(id)a3;
- (JavaLangIllegalStateException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
@end

@implementation JavaLangIllegalStateException

- (JavaLangIllegalStateException)init
{
  return self;
}

- (JavaLangIllegalStateException)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangIllegalStateException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
  return self;
}

- (JavaLangIllegalStateException)initWithJavaLangThrowable:(id)a3
{
  if (a3) {
    id v5 = [a3 description];
  }
  else {
    id v5 = 0;
  }
  JavaLangRuntimeException_initWithNSString_withJavaLangThrowable_(self, v5, a3);
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10044E978;
}

@end