@interface JavaNioSelectorImpl_UnaddableSet
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
- (JavaNioSelectorImpl_UnaddableSet)initWithJavaUtilSet:(id)a3;
- (id)iterator;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)clear;
- (void)dealloc;
@end

@implementation JavaNioSelectorImpl_UnaddableSet

- (JavaNioSelectorImpl_UnaddableSet)initWithJavaUtilSet:(id)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)set isEqual:a3];
}

- (unint64_t)hash
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return (int)[(JavaUtilSet *)set hash];
}

- (BOOL)addWithId:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (void)clear
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)set clear];
}

- (BOOL)containsWithId:(id)a3
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)set containsWithId:a3];
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)set containsAllWithJavaUtilCollection:a3];
}

- (BOOL)isEmpty
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)set isEmpty];
}

- (id)iterator
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)set iterator];
}

- (BOOL)removeWithId:(id)a3
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)set removeWithId:a3];
}

- (BOOL)removeAllWithJavaUtilCollection:(id)a3
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)set removeAllWithJavaUtilCollection:a3];
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)set retainAllWithJavaUtilCollection:a3];
}

- (int)size
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)set size];
}

- (id)toArray
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)set toArray];
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSet *)set toArrayWithNSObjectArray:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioSelectorImpl_UnaddableSet;
  [(JavaNioSelectorImpl_UnaddableSet *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041A880;
}

@end