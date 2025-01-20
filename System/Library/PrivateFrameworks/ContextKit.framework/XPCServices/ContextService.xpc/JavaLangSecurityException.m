@interface JavaLangSecurityException
+ (const)__metadata;
- (JavaLangSecurityException)init;
- (JavaLangSecurityException)initWithJavaLangThrowable:(id)a3;
- (JavaLangSecurityException)initWithNSString:(id)a3;
- (JavaLangSecurityException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
@end

@implementation JavaLangSecurityException

- (JavaLangSecurityException)init
{
  return self;
}

- (JavaLangSecurityException)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangSecurityException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
  return self;
}

- (JavaLangSecurityException)initWithJavaLangThrowable:(id)a3
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
  return (const J2ObjcClassInfo *)&unk_100424ED8;
}

@end