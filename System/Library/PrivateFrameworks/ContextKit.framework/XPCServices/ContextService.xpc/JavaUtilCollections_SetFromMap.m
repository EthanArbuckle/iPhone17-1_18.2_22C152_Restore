@interface JavaUtilCollections_SetFromMap
+ (const)__metadata;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (BOOL)retainAllWithJavaUtilCollection:(id)a3;
- (JavaUtilCollections_SetFromMap)initWithJavaUtilMap:(id)a3;
- (NSString)description;
- (id)iterator;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)clear;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
@end

@implementation JavaUtilCollections_SetFromMap

- (JavaUtilCollections_SetFromMap)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  backingSet = self->backingSet_;
  if (!backingSet) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)backingSet isEqual:a3];
}

- (unint64_t)hash
{
  backingSet = self->backingSet_;
  if (!backingSet) {
    JreThrowNullPointerException();
  }
  return (int)[(JavaUtilSet *)backingSet hash];
}

- (BOOL)addWithId:(id)a3
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return [(JavaUtilMap *)m putWithId:a3 withId:JavaLangBoolean_TRUE__] == 0;
}

- (void)clear
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  [(JavaUtilMap *)m clear];
}

- (NSString)description
{
  backingSet = self->backingSet_;
  if (!backingSet) {
    JreThrowNullPointerException();
  }
  return (NSString *)[(JavaUtilSet *)backingSet description];
}

- (BOOL)containsWithId:(id)a3
{
  backingSet = self->backingSet_;
  if (!backingSet) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)backingSet containsWithId:a3];
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  backingSet = self->backingSet_;
  if (!backingSet) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)backingSet containsAllWithJavaUtilCollection:a3];
}

- (BOOL)isEmpty
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m isEmpty];
}

- (BOOL)removeWithId:(id)a3
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m removeWithId:a3] != 0;
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  backingSet = self->backingSet_;
  if (!backingSet) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)backingSet retainAllWithJavaUtilCollection:a3];
}

- (id)toArray
{
  backingSet = self->backingSet_;
  if (!backingSet) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)backingSet toArray];
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  backingSet = self->backingSet_;
  if (!backingSet) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)backingSet toArrayWithNSObjectArray:a3];
}

- (id)iterator
{
  backingSet = self->backingSet_;
  if (!backingSet) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)backingSet iterator];
}

- (int)size
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m size];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3 || ([a3 defaultReadObject], (m = self->m_) == 0)) {
    JreThrowNullPointerException();
  }
  id v5 = [(JavaUtilMap *)m keySet];
  JreStrongAssign((id *)&self->backingSet_, v5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_SetFromMap;
  [(JavaUtilCollections_SetFromMap *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042A6C8;
}

@end