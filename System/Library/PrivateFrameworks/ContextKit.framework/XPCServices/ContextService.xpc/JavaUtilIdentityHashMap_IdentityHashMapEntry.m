@interface JavaUtilIdentityHashMap_IdentityHashMapEntry
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilIdentityHashMap_IdentityHashMapEntry)initWithJavaUtilIdentityHashMap:(id)a3 withId:(id)a4 withId:(id)a5;
- (id)clone;
- (id)description;
- (id)setValueWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaUtilIdentityHashMap_IdentityHashMapEntry

- (JavaUtilIdentityHashMap_IdentityHashMapEntry)initWithJavaUtilIdentityHashMap:(id)a3 withId:(id)a4 withId:(id)a5
{
  return self;
}

- (id)clone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilIdentityHashMap_IdentityHashMapEntry;
  return [(JavaUtilMapEntry *)&v3 clone];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    unsigned int v5 = [(id)JavaUtilMap_Entry_class_() isInstance:a3];
    if (v5)
    {
      v6 = (void *)JavaUtilMap_Entry_class_();
      if (!a3) {
        JreThrowNullPointerException();
      }
      if (([v6 isInstance:a3] & 1) == 0) {
        JreThrowClassCastException();
      }
      id key = self->super.key_;
      if (key == [a3 getKey])
      {
        id value = self->super.value_;
        LOBYTE(v5) = value == [a3 getValue];
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  int v3 = JavaLangSystem_identityHashCodeWithId_((uint64_t)self->super.key_);
  return (int)(JavaLangSystem_identityHashCodeWithId_((uint64_t)self->super.value_) ^ v3);
}

- (id)description
{
  return (id)JreStrcat("@C@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, self->super.key_);
}

- (id)setValueWithId:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)JavaUtilIdentityHashMap_IdentityHashMapEntry;
  id v5 = -[JavaUtilMapEntry setValueWithId:](&v8, "setValueWithId:");
  map = self->map_;
  if (!map) {
    JreThrowNullPointerException();
  }
  [(JavaUtilIdentityHashMap *)map putWithId:self->super.key_ withId:a3];
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilIdentityHashMap_IdentityHashMapEntry;
  [(JavaUtilMapEntry *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100473748;
}

@end