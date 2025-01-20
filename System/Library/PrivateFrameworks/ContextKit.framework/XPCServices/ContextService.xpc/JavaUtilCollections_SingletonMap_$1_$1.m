@interface JavaUtilCollections_SingletonMap_$1_$1
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilCollections_SingletonMap_$1_$1)initWithJavaUtilCollections_SingletonMap_$1:(id)a3;
- (id)next;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilCollections_SingletonMap_$1_$1

- (BOOL)hasNext
{
  return self->hasNext_;
}

- (id)next
{
  if (!self->hasNext_)
  {
    v7 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v7);
  }
  self->hasNext_ = 0;
  v2 = self->this$0_->this$0_;
  id k = v2->k_;
  id v = v2->v_;
  v5 = [JavaUtilCollections_SingletonMap__1__1__1 alloc];
  JavaUtilMapEntry_initWithId_withId_((uint64_t)v5, k, v);
  return v5;
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (JavaUtilCollections_SingletonMap_$1_$1)initWithJavaUtilCollections_SingletonMap_$1:(id)a3
{
  self->hasNext_ = 1;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_SingletonMap__1__1;
  [(JavaUtilCollections_SingletonMap_$1_$1 *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100427210;
}

@end