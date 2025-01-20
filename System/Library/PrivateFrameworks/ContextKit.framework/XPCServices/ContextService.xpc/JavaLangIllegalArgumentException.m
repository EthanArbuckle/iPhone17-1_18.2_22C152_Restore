@interface JavaLangIllegalArgumentException
+ (const)__metadata;
- (JavaLangIllegalArgumentException)init;
- (JavaLangIllegalArgumentException)initWithJavaLangThrowable:(id)a3;
- (JavaLangIllegalArgumentException)initWithNSString:(id)a3;
- (JavaLangIllegalArgumentException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
@end

@implementation JavaLangIllegalArgumentException

- (JavaLangIllegalArgumentException)init
{
  return self;
}

- (JavaLangIllegalArgumentException)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangIllegalArgumentException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
  return self;
}

- (JavaLangIllegalArgumentException)initWithJavaLangThrowable:(id)a3
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
  return (const J2ObjcClassInfo *)&unk_100455080;
}

@end