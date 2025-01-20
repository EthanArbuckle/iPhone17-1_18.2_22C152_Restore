@interface JavaLangUnsupportedOperationException
+ (const)__metadata;
- (JavaLangUnsupportedOperationException)init;
- (JavaLangUnsupportedOperationException)initWithJavaLangThrowable:(id)a3;
- (JavaLangUnsupportedOperationException)initWithNSString:(id)a3;
- (JavaLangUnsupportedOperationException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
@end

@implementation JavaLangUnsupportedOperationException

- (JavaLangUnsupportedOperationException)init
{
  return self;
}

- (JavaLangUnsupportedOperationException)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangUnsupportedOperationException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
  return self;
}

- (JavaLangUnsupportedOperationException)initWithJavaLangThrowable:(id)a3
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
  return (const J2ObjcClassInfo *)&unk_1004244D0;
}

@end