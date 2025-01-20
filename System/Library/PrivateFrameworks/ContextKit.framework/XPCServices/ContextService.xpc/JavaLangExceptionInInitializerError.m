@interface JavaLangExceptionInInitializerError
+ (const)__metadata;
- (JavaLangExceptionInInitializerError)init;
- (JavaLangExceptionInInitializerError)initWithJavaLangThrowable:(id)a3;
- (JavaLangExceptionInInitializerError)initWithNSString:(id)a3;
- (id)getCause;
- (id)getException;
- (void)dealloc;
@end

@implementation JavaLangExceptionInInitializerError

- (JavaLangExceptionInInitializerError)init
{
  return self;
}

- (JavaLangExceptionInInitializerError)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangExceptionInInitializerError)initWithJavaLangThrowable:(id)a3
{
  return self;
}

- (id)getException
{
  return self->exception_;
}

- (id)getCause
{
  return self->exception_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangExceptionInInitializerError;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100448198;
}

@end