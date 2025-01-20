@interface JavaUtilCollections_SynchronizedSortedMap
+ (const)__metadata;
- (JavaUtilCollections_SynchronizedSortedMap)initWithJavaUtilSortedMap:(id)a3;
- (JavaUtilCollections_SynchronizedSortedMap)initWithJavaUtilSortedMap:(id)a3 withId:(id)a4;
- (id)comparator;
- (id)firstKey;
- (id)headMapWithId:(id)a3;
- (id)lastKey;
- (id)subMapWithId:(id)a3 withId:(id)a4;
- (id)tailMapWithId:(id)a3;
- (void)dealloc;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilCollections_SynchronizedSortedMap

- (JavaUtilCollections_SynchronizedSortedMap)initWithJavaUtilSortedMap:(id)a3
{
  return self;
}

- (JavaUtilCollections_SynchronizedSortedMap)initWithJavaUtilSortedMap:(id)a3 withId:(id)a4
{
  return self;
}

- (id)comparator
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  id v5 = [(JavaUtilSortedMap *)sm comparator];
  objc_sync_exit(mutex);
  return v5;
}

- (id)firstKey
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  id v5 = [(JavaUtilSortedMap *)sm firstKey];
  objc_sync_exit(mutex);
  return v5;
}

- (id)headMapWithId:(id)a3
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilSortedMap *)sm headMapWithId:a3];
  id v8 = self->super.mutex_;
  v9 = [JavaUtilCollections_SynchronizedSortedMap alloc];
  JavaUtilCollections_SynchronizedSortedMap_initWithJavaUtilSortedMap_withId_((id *)&v9->super.super.isa, v7, v8);
  v10 = v9;
  objc_sync_exit(mutex);
  return v10;
}

- (id)lastKey
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  id v5 = [(JavaUtilSortedMap *)sm lastKey];
  objc_sync_exit(mutex);
  return v5;
}

- (id)subMapWithId:(id)a3 withId:(id)a4
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  id v9 = [(JavaUtilSortedMap *)sm subMapWithId:a3 withId:a4];
  id v10 = self->super.mutex_;
  v11 = [JavaUtilCollections_SynchronizedSortedMap alloc];
  JavaUtilCollections_SynchronizedSortedMap_initWithJavaUtilSortedMap_withId_((id *)&v11->super.super.isa, v9, v10);
  v12 = v11;
  objc_sync_exit(mutex);
  return v12;
}

- (id)tailMapWithId:(id)a3
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  sm = self->sm_;
  if (!sm) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilSortedMap *)sm tailMapWithId:a3];
  id v8 = self->super.mutex_;
  id v9 = [JavaUtilCollections_SynchronizedSortedMap alloc];
  JavaUtilCollections_SynchronizedSortedMap_initWithJavaUtilSortedMap_withId_((id *)&v9->super.super.isa, v7, v8);
  id v10 = v9;
  objc_sync_exit(mutex);
  return v10;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultWriteObject];
  objc_sync_exit(mutex);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_SynchronizedSortedMap;
  [(JavaUtilCollections_SynchronizedMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100428520;
}

@end