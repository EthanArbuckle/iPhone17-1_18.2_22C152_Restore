@interface JavaUtilCollections_UnmodifiableCollection
+ (const)__metadata;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeAllWithJavaUtilCollection:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (BOOL)retainAllWithJavaUtilCollection:(id)a3;
- (JavaUtilCollections_UnmodifiableCollection)initWithJavaUtilCollection:(id)a3;
- (NSString)description;
- (id)iterator;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)clear;
- (void)dealloc;
@end

@implementation JavaUtilCollections_UnmodifiableCollection

- (JavaUtilCollections_UnmodifiableCollection)initWithJavaUtilCollection:(id)a3
{
  return self;
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
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (BOOL)containsWithId:(id)a3
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c containsWithId:a3];
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c containsAllWithJavaUtilCollection:a3];
}

- (BOOL)isEmpty
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c isEmpty];
}

- (id)iterator
{
  v3 = [JavaUtilCollections_UnmodifiableCollection__1 alloc];
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)&v3->iterator_, [(JavaUtilCollection *)c iterator]);
  return v3;
}

- (BOOL)removeWithId:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)removeAllWithJavaUtilCollection:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (int)size
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c size];
}

- (id)toArray
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c toArray];
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c toArrayWithNSObjectArray:a3];
}

- (NSString)description
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return (NSString *)[(JavaUtilCollection *)c description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_UnmodifiableCollection;
  [(JavaUtilCollections_UnmodifiableCollection *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100428B60;
}

@end