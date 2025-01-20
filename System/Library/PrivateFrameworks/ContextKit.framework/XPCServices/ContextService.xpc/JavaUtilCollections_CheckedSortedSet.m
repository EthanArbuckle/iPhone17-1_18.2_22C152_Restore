@interface JavaUtilCollections_CheckedSortedSet
+ (const)__metadata;
- (JavaUtilCollections_CheckedSortedSet)initWithJavaUtilSortedSet:(id)a3 withIOSClass:(id)a4;
- (id)comparator;
- (id)first;
- (id)headSetWithId:(id)a3;
- (id)last;
- (id)subSetWithId:(id)a3 withId:(id)a4;
- (id)tailSetWithId:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation JavaUtilCollections_CheckedSortedSet

- (JavaUtilCollections_CheckedSortedSet)initWithJavaUtilSortedSet:(id)a3 withIOSClass:(id)a4
{
  return self;
}

- (id)comparator
{
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSortedSet *)ss comparator];
}

- (id)subSetWithId:(id)a3 withId:(id)a4
{
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  v6 = sub_1001CD160([(JavaUtilSortedSet *)ss subSetWithId:a3 withId:a4], self->super.super.type_);
  return v6;
}

- (id)headSetWithId:(id)a3
{
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  v5 = sub_1001CD160([(JavaUtilSortedSet *)ss headSetWithId:a3], self->super.super.type_);
  return v5;
}

- (id)tailSetWithId:(id)a3
{
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  v5 = sub_1001CD160([(JavaUtilSortedSet *)ss tailSetWithId:a3], self->super.super.type_);
  return v5;
}

- (id)first
{
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSortedSet *)ss first];
}

- (id)last
{
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSortedSet *)ss last];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_CheckedSortedSet;
  [(JavaUtilCollections_CheckedCollection *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042C540;
}

@end