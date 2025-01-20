@interface JavaLangClassNotFoundException
+ (const)__metadata;
- (JavaLangClassNotFoundException)init;
- (JavaLangClassNotFoundException)initWithNSString:(id)a3;
- (JavaLangClassNotFoundException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
- (id)getCause;
- (id)getException;
- (void)dealloc;
@end

@implementation JavaLangClassNotFoundException

- (JavaLangClassNotFoundException)init
{
  return self;
}

- (JavaLangClassNotFoundException)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangClassNotFoundException)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
  return self;
}

- (id)getException
{
  return self->ex_;
}

- (id)getCause
{
  return self->ex_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangClassNotFoundException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100461068;
}

@end