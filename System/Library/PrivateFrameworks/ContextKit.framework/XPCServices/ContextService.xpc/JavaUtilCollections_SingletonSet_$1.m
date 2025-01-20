@interface JavaUtilCollections_SingletonSet_$1
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilCollections_SingletonSet_$1)initWithJavaUtilCollections_SingletonSet:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilCollections_SingletonSet_$1

- (BOOL)hasNext
{
  return self->hasNext_;
}

- (id)next
{
  if (!self->hasNext_)
  {
    v3 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v3);
  }
  self->hasNext_ = 0;
  return self->this$0_->element_;
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (JavaUtilCollections_SingletonSet_$1)initWithJavaUtilCollections_SingletonSet:(id)a3
{
  self->hasNext_ = 1;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_SingletonSet__1;
  [(JavaUtilCollections_SingletonSet_$1 *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100426B10;
}

@end