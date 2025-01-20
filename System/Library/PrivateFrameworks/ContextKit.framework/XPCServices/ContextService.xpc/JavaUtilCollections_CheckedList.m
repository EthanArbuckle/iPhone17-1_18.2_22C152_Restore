@interface JavaUtilCollections_CheckedList
+ (const)__metadata;
- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_CheckedList)initWithJavaUtilList:(id)a3 withIOSClass:(id)a4;
- (id)getWithInt:(int)a3;
- (id)listIterator;
- (id)listIteratorWithInt:(int)a3;
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

@implementation JavaUtilCollections_CheckedList

- (JavaUtilCollections_CheckedList)initWithJavaUtilList:(id)a3 withIOSClass:(id)a4
{
  return self;
}

- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4
{
  if (!a4) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)&a3;
  v6 = (void **)[a4 toArray];
  if (!v6) {
    goto LABEL_12;
  }
  v7 = v6;
  v8 = v6 + 3;
  unint64_t v9 = (unint64_t)&v6[*((int *)v6 + 2) + 3];
  while ((unint64_t)v8 < v9)
  {
    v10 = *v8++;
    JavaUtilCollections_checkTypeWithId_withIOSClass_(v10, self->super.type_);
  }
  l = self->l_;
  if (!l) {
LABEL_12:
  }
    JreThrowNullPointerException();
  v12 = JavaUtilArrays_asListWithNSObjectArray_(v7);
  v13 = (void *)JavaUtilList_class_();
  if (v12 && ([v13 isInstance:v12] & 1) == 0) {
    JreThrowClassCastException();
  }
  return [(JavaUtilList *)l addAllWithInt:v4 withJavaUtilCollection:v12];
}

- (id)getWithInt:(int)a3
{
  l = self->l_;
  if (!l) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)l getWithInt:*(void *)&a3];
}

- (id)setWithInt:(int)a3 withId:(id)a4
{
  l = self->l_;
  if (!l) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = *(void *)&a3;
  JavaUtilCollections_checkTypeWithId_withIOSClass_(a4, self->super.type_);
  return [(JavaUtilList *)l setWithInt:v6 withId:a4];
}

- (void)addWithInt:(int)a3 withId:(id)a4
{
  l = self->l_;
  if (!l) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = *(void *)&a3;
  JavaUtilCollections_checkTypeWithId_withIOSClass_(a4, self->super.type_);
  [(JavaUtilList *)l addWithInt:v6 withId:a4];
}

- (id)removeWithInt:(int)a3
{
  l = self->l_;
  if (!l) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)l removeWithInt:*(void *)&a3];
}

- (int)indexOfWithId:(id)a3
{
  l = self->l_;
  if (!l) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)l indexOfWithId:a3];
}

- (int)lastIndexOfWithId:(id)a3
{
  l = self->l_;
  if (!l) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)l lastIndexOfWithId:a3];
}

- (id)listIterator
{
  l = self->l_;
  if (!l) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = sub_1001D2B10([(JavaUtilList *)l listIterator], self->super.type_);
  return v4;
}

- (id)listIteratorWithInt:(int)a3
{
  l = self->l_;
  if (!l) {
    JreThrowNullPointerException();
  }
  v5 = sub_1001D2B10([(JavaUtilList *)l listIteratorWithInt:*(void *)&a3], self->super.type_);
  return v5;
}

- (id)subListWithInt:(int)a3 withInt:(int)a4
{
  l = self->l_;
  if (!l) {
    JreThrowNullPointerException();
  }
  id v6 = [(JavaUtilList *)l subListWithInt:*(void *)&a3 withInt:*(void *)&a4];
  type = self->super.type_;
  return JavaUtilCollections_checkedListWithJavaUtilList_withIOSClass_(v6, type);
}

- (BOOL)isEqual:(id)a3
{
  l = self->l_;
  if (!l) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)l isEqual:a3];
}

- (unint64_t)hash
{
  l = self->l_;
  if (!l) {
    JreThrowNullPointerException();
  }
  return (int)[(JavaUtilList *)l hash];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_CheckedList;
  [(JavaUtilCollections_CheckedCollection *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042B530;
}

@end