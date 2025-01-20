@interface JavaUtilCollections_UnmodifiableSortedMap
+ (const)__metadata;
- (JavaUtilCollections_UnmodifiableSortedMap)initWithJavaUtilSortedMap:(id)a3;
- (id)comparator;
- (id)firstKey;
- (id)headMapWithId:(id)a3;
- (id)lastKey;
- (id)subMapWithId:(id)a3 withId:(id)a4;
- (id)tailMapWithId:(id)a3;
- (void)dealloc;
@end

@implementation JavaUtilCollections_UnmodifiableSortedMap

- (JavaUtilCollections_UnmodifiableSortedMap)initWithJavaUtilSortedMap:(id)a3
{
  return self;
}

- (id)comparator
{
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSortedMap *)sm comparator];
}

- (id)firstKey
{
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSortedMap *)sm firstKey];
}

- (id)headMapWithId:(id)a3
{
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  v4 = sub_1001CCE68([(JavaUtilSortedMap *)sm headMapWithId:a3]);
  return v4;
}

- (id)lastKey
{
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSortedMap *)sm lastKey];
}

- (id)subMapWithId:(id)a3 withId:(id)a4
{
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  v5 = sub_1001CCE68([(JavaUtilSortedMap *)sm subMapWithId:a3 withId:a4]);
  return v5;
}

- (id)tailMapWithId:(id)a3
{
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  v4 = sub_1001CCE68([(JavaUtilSortedMap *)sm tailMapWithId:a3]);
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_UnmodifiableSortedMap;
  [(JavaUtilCollections_UnmodifiableMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042A080;
}

@end