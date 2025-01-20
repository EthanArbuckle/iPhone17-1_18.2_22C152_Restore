@interface JavaUtilCollections_UnmodifiableList
+ (const)__metadata;
- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_UnmodifiableList)initWithJavaUtilList:(id)a3;
- (id)getWithInt:(int)a3;
- (id)listIterator;
- (id)listIteratorWithInt:(int)a3;
- (id)readResolve;
- (id)removeWithInt:(int)a3;
- (id)setWithInt:(int)a3 withId:(id)a4;
- (id)subListWithInt:(int)a3 withInt:(int)a4;
- (int)indexOfWithId:(id)a3;
- (int)lastIndexOfWithId:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)addWithInt:(int)a3 withId:(id)a4;
- (void)dealloc;
@end

@implementation JavaUtilCollections_UnmodifiableList

- (JavaUtilCollections_UnmodifiableList)initWithJavaUtilList:(id)a3
{
  return self;
}

- (void)addWithInt:(int)a3 withId:(id)a4
{
  v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4
{
  v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (BOOL)isEqual:(id)a3
{
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)list isEqual:a3];
}

- (id)getWithInt:(int)a3
{
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)list getWithInt:*(void *)&a3];
}

- (unint64_t)hash
{
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  return (int)[(JavaUtilList *)list hash];
}

- (int)indexOfWithId:(id)a3
{
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)list indexOfWithId:a3];
}

- (int)lastIndexOfWithId:(id)a3
{
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)list lastIndexOfWithId:a3];
}

- (id)listIterator
{
  return [(JavaUtilCollections_UnmodifiableList *)self listIteratorWithInt:0];
}

- (id)listIteratorWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [JavaUtilCollections_UnmodifiableList__1 alloc];
  v5->val$location_ = v3;
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)&v5->iterator_, [(JavaUtilList *)list listIteratorWithInt:v3]);
  return v5;
}

- (id)removeWithInt:(int)a3
{
  uint64_t v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (id)setWithInt:(int)a3 withId:(id)a4
{
  v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (id)subListWithInt:(int)a3 withInt:(int)a4
{
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  v5 = sub_1001CCE14([(JavaUtilList *)list subListWithInt:*(void *)&a3 withInt:*(void *)&a4]);
  return v5;
}

- (id)readResolve
{
  if (![(id)JavaUtilRandomAccess_class_() isInstance:self->list_]) {
    return self;
  }
  uint64_t v3 = sub_1001CCDC0(self->list_);
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_UnmodifiableList;
  [(JavaUtilCollections_UnmodifiableCollection *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100429058;
}

@end