@interface JavaUtilCollections_CheckedMap_CheckedEntrySet
+ (const)__metadata;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeAllWithJavaUtilCollection:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (BOOL)retainAllWithJavaUtilCollection:(id)a3;
- (JavaUtilCollections_CheckedMap_CheckedEntrySet)initWithJavaUtilSet:(id)a3 withIOSClass:(id)a4;
- (id)iterator;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)clear;
- (void)dealloc;
@end

@implementation JavaUtilCollections_CheckedMap_CheckedEntrySet

- (JavaUtilCollections_CheckedMap_CheckedEntrySet)initWithJavaUtilSet:(id)a3 withIOSClass:(id)a4
{
  return self;
}

- (id)iterator
{
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  id v4 = [(JavaUtilSet *)s iterator];
  valueType = self->valueType_;
  v6 = [JavaUtilCollections_CheckedMap_CheckedEntrySet_CheckedEntryIterator alloc];
  JreStrongAssign((id *)&v6->i_, v4);
  JreStrongAssign((id *)&v6->valueType_, valueType);
  return v6;
}

- (id)toArray
{
  int v3 = [(JavaUtilCollections_CheckedMap_CheckedEntrySet *)self size];
  id v4 = +[IOSObjectArray arrayWithLength:v3 type:NSObject_class_()];
  id v5 = [(JavaUtilCollections_CheckedMap_CheckedEntrySet *)self iterator];
  if (v3 >= 1)
  {
    v6 = v5;
    if (!v5) {
      JreThrowNullPointerException();
    }
    for (uint64_t i = 0; i != v3; IOSObjectArray_Set((uint64_t)v4, i++, [v6 next]))
      ;
  }
  return v4;
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  int v5 = [(JavaUtilCollections_CheckedMap_CheckedEntrySet *)self size];
  if (!a3) {
    goto LABEL_12;
  }
  int v6 = v5;
  if (*((_DWORD *)a3 + 2) < v5)
  {
    a3 = JavaLangReflectArray_newInstanceWithIOSClass_withInt_(objc_msgSend(objc_msgSend(a3, "getClass"), "getComponentType"), v5);
    objc_opt_class();
    if (!a3)
    {
      [(JavaUtilCollections_CheckedMap_CheckedEntrySet *)self iterator];
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  id v7 = [(JavaUtilCollections_CheckedMap_CheckedEntrySet *)self iterator];
  if (v6 > 0)
  {
    v8 = v7;
    if (v7)
    {
      for (uint64_t i = 0; i != v6; IOSObjectArray_Set((uint64_t)a3, i++, [v8 next]))
        ;
      goto LABEL_9;
    }
LABEL_12:
    JreThrowNullPointerException();
  }
LABEL_9:
  if (v6 < *((_DWORD *)a3 + 2)) {
    IOSObjectArray_Set((uint64_t)a3, v6, 0);
  }
  return a3;
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)s retainAllWithJavaUtilCollection:a3];
}

- (BOOL)removeAllWithJavaUtilCollection:(id)a3
{
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)s removeAllWithJavaUtilCollection:a3];
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)s containsAllWithJavaUtilCollection:a3];
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  int v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)removeWithId:(id)a3
{
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)s removeWithId:a3];
}

- (BOOL)containsWithId:(id)a3
{
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)s containsWithId:a3];
}

- (BOOL)addWithId:(id)a3
{
  int v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)isEmpty
{
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)s isEmpty];
}

- (void)clear
{
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)s clear];
}

- (int)size
{
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)s size];
}

- (unint64_t)hash
{
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  return (int)[(JavaUtilSet *)s hash];
}

- (BOOL)isEqual:(id)a3
{
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)s isEqual:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_CheckedMap_CheckedEntrySet;
  [(JavaUtilCollections_CheckedMap_CheckedEntrySet *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042C170;
}

@end