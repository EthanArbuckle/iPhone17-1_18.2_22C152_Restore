@interface JavaLangReflectInvocationTargetException
+ (const)__metadata;
- (JavaLangReflectInvocationTargetException)init;
- (JavaLangReflectInvocationTargetException)initWithJavaLangThrowable:(id)a3;
- (JavaLangReflectInvocationTargetException)initWithJavaLangThrowable:(id)a3 withNSString:(id)a4;
- (id)getCause;
- (id)getTargetException;
- (void)dealloc;
@end

@implementation JavaLangReflectInvocationTargetException

- (JavaLangReflectInvocationTargetException)init
{
  return self;
}

- (JavaLangReflectInvocationTargetException)initWithJavaLangThrowable:(id)a3
{
  return self;
}

- (JavaLangReflectInvocationTargetException)initWithJavaLangThrowable:(id)a3 withNSString:(id)a4
{
  return self;
}

- (id)getTargetException
{
  return self->target_;
}

- (id)getCause
{
  return self->target_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangReflectInvocationTargetException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100480BB0;
}

@end