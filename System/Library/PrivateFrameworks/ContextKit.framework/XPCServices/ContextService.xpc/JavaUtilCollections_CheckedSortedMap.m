@interface JavaUtilCollections_CheckedSortedMap
+ (const)__metadata;
- (JavaUtilCollections_CheckedSortedMap)initWithJavaUtilSortedMap:(id)a3 withIOSClass:(id)a4 withIOSClass:(id)a5;
- (id)comparator;
- (id)firstKey;
- (id)headMapWithId:(id)a3;
- (id)lastKey;
- (id)subMapWithId:(id)a3 withId:(id)a4;
- (id)tailMapWithId:(id)a3;
- (void)dealloc;
@end

@implementation JavaUtilCollections_CheckedSortedMap

- (JavaUtilCollections_CheckedSortedMap)initWithJavaUtilSortedMap:(id)a3 withIOSClass:(id)a4 withIOSClass:(id)a5
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

- (id)subMapWithId:(id)a3 withId:(id)a4
{
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  v6 = sub_1001CD0F8([(JavaUtilSortedMap *)sm subMapWithId:a3 withId:a4], self->super.keyType_, self->super.valueType_);
  return v6;
}

- (id)headMapWithId:(id)a3
{
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  v5 = sub_1001CD0F8([(JavaUtilSortedMap *)sm headMapWithId:a3], self->super.keyType_, self->super.valueType_);
  return v5;
}

- (id)tailMapWithId:(id)a3
{
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  v5 = sub_1001CD0F8([(JavaUtilSortedMap *)sm tailMapWithId:a3], self->super.keyType_, self->super.valueType_);
  return v5;
}

- (id)firstKey
{
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSortedMap *)sm firstKey];
}

- (id)lastKey
{
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilSortedMap *)sm lastKey];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_CheckedSortedMap;
  [(JavaUtilCollections_CheckedMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042C770;
}

@end