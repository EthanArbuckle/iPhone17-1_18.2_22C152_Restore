@interface JavaUtilCollections_SingletonMap
+ (const)__metadata;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsValueWithId:(id)a3;
- (JavaUtilCollections_SingletonMap)initWithId:(id)a3 withId:(id)a4;
- (id)entrySet;
- (id)getWithId:(id)a3;
- (int)size;
- (void)dealloc;
@end

@implementation JavaUtilCollections_SingletonMap

- (JavaUtilCollections_SingletonMap)initWithId:(id)a3 withId:(id)a4
{
  return self;
}

- (BOOL)containsKeyWithId:(id)a3
{
  id k = self->k_;
  if (k) {
    LOBYTE(v4) = [k isEqual:a3];
  }
  else {
    return a3 == 0;
  }
  return v4;
}

- (BOOL)containsValueWithId:(id)a3
{
  id v = self->v_;
  if (v) {
    LOBYTE(v4) = [v isEqual:a3];
  }
  else {
    return a3 == 0;
  }
  return v4;
}

- (id)getWithId:(id)a3
{
  if ([(JavaUtilCollections_SingletonMap *)self containsKeyWithId:a3]) {
    return self->v_;
  }
  else {
    return 0;
  }
}

- (int)size
{
  return 1;
}

- (id)entrySet
{
  v3 = [JavaUtilCollections_SingletonMap__1 alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  JavaUtilAbstractSet_init(v3, v4);
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_SingletonMap;
  [(JavaUtilAbstractMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100426EE8;
}

@end