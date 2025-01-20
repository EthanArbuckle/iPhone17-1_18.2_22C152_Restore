@interface JavaUtilCollections_UnmodifiableSortedSet
+ (const)__metadata;
- (JavaUtilCollections_UnmodifiableSortedSet)initWithJavaUtilSortedSet:(id)a3;
- (id)comparator;
- (id)first;
- (id)headSetWithId:(id)a3;
- (id)last;
- (id)subSetWithId:(id)a3 withId:(id)a4;
- (id)tailSetWithId:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation JavaUtilCollections_UnmodifiableSortedSet

- (JavaUtilCollections_UnmodifiableSortedSet)initWithJavaUtilSortedSet:(id)a3
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

- (id)first
{
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSortedSet *)ss first];
}

- (id)headSetWithId:(id)a3
{
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  v4 = sub_1001CCEBC([(JavaUtilSortedSet *)ss headSetWithId:a3]);
  return v4;
}

- (id)last
{
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSortedSet *)ss last];
}

- (id)subSetWithId:(id)a3 withId:(id)a4
{
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  v5 = sub_1001CCEBC([(JavaUtilSortedSet *)ss subSetWithId:a3 withId:a4]);
  return v5;
}

- (id)tailSetWithId:(id)a3
{
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  v4 = sub_1001CCEBC([(JavaUtilSortedSet *)ss tailSetWithId:a3]);
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_UnmodifiableSortedSet;
  [(JavaUtilCollections_UnmodifiableCollection *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042A2B0;
}

@end