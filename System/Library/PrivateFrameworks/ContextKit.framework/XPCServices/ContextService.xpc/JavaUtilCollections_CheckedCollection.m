@interface JavaUtilCollections_CheckedCollection
+ (const)__metadata;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeAllWithJavaUtilCollection:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (BOOL)retainAllWithJavaUtilCollection:(id)a3;
- (JavaUtilCollections_CheckedCollection)initWithJavaUtilCollection:(id)a3 withIOSClass:(id)a4;
- (NSString)description;
- (id)iterator;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)clear;
- (void)dealloc;
@end

@implementation JavaUtilCollections_CheckedCollection

- (JavaUtilCollections_CheckedCollection)initWithJavaUtilCollection:(id)a3 withIOSClass:(id)a4
{
  return self;
}

- (int)size
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c size];
}

- (BOOL)isEmpty
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c isEmpty];
}

- (BOOL)containsWithId:(id)a3
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c containsWithId:a3];
}

- (id)iterator
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  id v4 = [(JavaUtilCollection *)c iterator];
  if (![(id)JavaUtilListIterator_class_() isInstance:v4]) {
    return v4;
  }
  v5 = (void *)JavaUtilListIterator_class_();
  if (v4 && ([v5 isInstance:v4] & 1) == 0) {
    JreThrowClassCastException();
  }
  v6 = sub_1001D2B10(v4, self->type_);
  return v6;
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

- (BOOL)addWithId:(id)a3
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  JavaUtilCollections_checkTypeWithId_withIOSClass_(a3, self->type_);
  return [(JavaUtilCollection *)c addWithId:a3];
}

- (BOOL)removeWithId:(id)a3
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c removeWithId:a3];
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c containsAllWithJavaUtilCollection:a3];
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  if (!a3) {
    goto LABEL_12;
  }
  id v4 = (void **)[a3 toArray];
  if (!v4) {
    goto LABEL_12;
  }
  v5 = v4;
  v6 = v4 + 3;
  unint64_t v7 = (unint64_t)&v4[*((int *)v4 + 2) + 3];
  while ((unint64_t)v6 < v7)
  {
    v8 = *v6++;
    JavaUtilCollections_checkTypeWithId_withIOSClass_(v8, self->type_);
  }
  c = self->c_;
  if (!c) {
LABEL_12:
  }
    JreThrowNullPointerException();
  v10 = JavaUtilArrays_asListWithNSObjectArray_(v5);
  v11 = (void *)JavaUtilList_class_();
  if (v10 && ([v11 isInstance:v10] & 1) == 0) {
    JreThrowClassCastException();
  }
  return [(JavaUtilCollection *)c addAllWithJavaUtilCollection:v10];
}

- (BOOL)removeAllWithJavaUtilCollection:(id)a3
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c removeAllWithJavaUtilCollection:a3];
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c retainAllWithJavaUtilCollection:a3];
}

- (void)clear
{
  c = self->c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  [(JavaUtilCollection *)c clear];
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
  v3.super_class = (Class)JavaUtilCollections_CheckedCollection;
  [(JavaUtilCollections_CheckedCollection *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042AF20;
}

@end