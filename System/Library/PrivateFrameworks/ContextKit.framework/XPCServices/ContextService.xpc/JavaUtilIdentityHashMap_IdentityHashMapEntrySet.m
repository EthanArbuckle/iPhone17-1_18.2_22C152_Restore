@interface JavaUtilIdentityHashMap_IdentityHashMapEntrySet
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilIdentityHashMap_IdentityHashMapEntrySet)initWithJavaUtilIdentityHashMap:(id)a3;
- (id)hashMap;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)clear;
- (void)dealloc;
@end

@implementation JavaUtilIdentityHashMap_IdentityHashMapEntrySet

- (JavaUtilIdentityHashMap_IdentityHashMapEntrySet)initWithJavaUtilIdentityHashMap:(id)a3
{
  return self;
}

- (id)hashMap
{
  return self->associatedMap_;
}

- (int)size
{
  associatedMap = self->associatedMap_;
  if (!associatedMap) {
    JreThrowNullPointerException();
  }
  return associatedMap->size_;
}

- (void)clear
{
  associatedMap = self->associatedMap_;
  if (!associatedMap) {
    JreThrowNullPointerException();
  }
  [(JavaUtilIdentityHashMap *)associatedMap clear];
}

- (BOOL)removeWithId:(id)a3
{
  BOOL v5 = -[JavaUtilIdentityHashMap_IdentityHashMapEntrySet containsWithId:](self, "containsWithId:");
  if (v5)
  {
    associatedMap = self->associatedMap_;
    if (!associatedMap || (v7 = (void *)JavaUtilMap_Entry_class_(), !a3)) {
      JreThrowNullPointerException();
    }
    if (([v7 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    -[JavaUtilIdentityHashMap removeWithId:](associatedMap, "removeWithId:", [a3 getKey]);
  }
  return v5;
}

- (BOOL)containsWithId:(id)a3
{
  if (![(id)JavaUtilMap_Entry_class_() isInstance:a3]) {
    return 0;
  }
  associatedMap = self->associatedMap_;
  if (!associatedMap || (v6 = (void *)JavaUtilMap_Entry_class_(), !a3)) {
    JreThrowNullPointerException();
  }
  if (([v6 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  v7 = sub_10026E6E4(associatedMap, (uint64_t)[a3 getKey]);
  if (!v7) {
    return 0;
  }
  return [(JavaUtilIdentityHashMap_IdentityHashMapEntry *)v7 isEqual:a3];
}

- (id)iterator
{
  v3 = [JavaUtilIdentityHashMap_IdentityHashMapEntrySet__1 alloc];
  associatedMap = self->associatedMap_;
  BOOL v5 = [JavaUtilIdentityHashMap_IdentityHashMapIterator alloc];
  JavaUtilIdentityHashMap_IdentityHashMapIterator_initWithJavaUtilMapEntry_Type_withJavaUtilIdentityHashMap_((uint64_t)v5, v3, associatedMap);
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilIdentityHashMap_IdentityHashMapEntrySet;
  [(JavaUtilIdentityHashMap_IdentityHashMapEntrySet *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100473BF0;
}

@end