@interface JavaUtilPropertyResourceBundle
+ (const)__metadata;
- (JavaUtilPropertyResourceBundle)initWithJavaIoInputStream:(id)a3;
- (JavaUtilPropertyResourceBundle)initWithJavaIoReader:(id)a3;
- (id)getKeys;
- (id)handleGetObjectWithNSString:(id)a3;
- (id)handleKeySet;
- (void)dealloc;
@end

@implementation JavaUtilPropertyResourceBundle

- (JavaUtilPropertyResourceBundle)initWithJavaIoInputStream:(id)a3
{
  return self;
}

- (JavaUtilPropertyResourceBundle)initWithJavaIoReader:(id)a3
{
  return self;
}

- (id)handleKeySet
{
  resources = self->resources_;
  if (!resources) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilProperties *)resources stringPropertyNames];
}

- (id)getKeys
{
  if (self->super.parent_)
  {
    v3 = [JavaUtilPropertyResourceBundle__1 alloc];
    sub_1001E4FE4((id *)&v3->super.isa, self);
    return v3;
  }
  else
  {
    return sub_1001E4CB0((uint64_t)self);
  }
}

- (id)handleGetObjectWithNSString:(id)a3
{
  resources = self->resources_;
  if (!resources) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilHashtable *)resources getWithId:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilPropertyResourceBundle;
  [(JavaUtilResourceBundle *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100434160;
}

@end