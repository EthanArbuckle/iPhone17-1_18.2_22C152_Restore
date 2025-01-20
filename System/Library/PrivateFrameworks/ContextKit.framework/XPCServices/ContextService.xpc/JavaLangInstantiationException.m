@interface JavaLangInstantiationException
+ (const)__metadata;
- (JavaLangInstantiationException)init;
- (JavaLangInstantiationException)initWithIOSClass:(id)a3;
- (JavaLangInstantiationException)initWithNSString:(id)a3;
@end

@implementation JavaLangInstantiationException

- (JavaLangInstantiationException)init
{
  return self;
}

- (JavaLangInstantiationException)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangInstantiationException)initWithIOSClass:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaLangReflectiveOperationException_initWithNSString_(self, [a3 getName]);
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100459ED8;
}

@end