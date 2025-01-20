@interface JavaUtilCollections_SingletonSet
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (JavaUtilCollections_SingletonSet)initWithId:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation JavaUtilCollections_SingletonSet

- (JavaUtilCollections_SingletonSet)initWithId:(id)a3
{
  return self;
}

- (BOOL)containsWithId:(id)a3
{
  id element = self->element_;
  if (element) {
    LOBYTE(v4) = [element isEqual:a3];
  }
  else {
    return a3 == 0;
  }
  return v4;
}

- (int)size
{
  return 1;
}

- (id)iterator
{
  v3 = [JavaUtilCollections_SingletonSet__1 alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  v3->hasNext_ = 1;
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_SingletonSet;
  [(JavaUtilCollections_SingletonSet *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100426960;
}

@end