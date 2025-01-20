@interface JavaLangTypeNotPresentException
+ (const)__metadata;
- (JavaLangTypeNotPresentException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
- (id)typeName;
- (void)dealloc;
@end

@implementation JavaLangTypeNotPresentException

- (JavaLangTypeNotPresentException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
  JavaLangTypeNotPresentException_initWithNSString_withJavaLangThrowable_((uint64_t)self, a3, (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7);
  return self;
}

- (id)typeName
{
  return self->typeName_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangTypeNotPresentException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100483B00;
}

@end