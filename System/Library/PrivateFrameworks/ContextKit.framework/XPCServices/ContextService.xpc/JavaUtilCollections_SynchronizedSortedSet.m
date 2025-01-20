@interface JavaUtilCollections_SynchronizedSortedSet
+ (const)__metadata;
- (JavaUtilCollections_SynchronizedSortedSet)initWithJavaUtilSortedSet:(id)a3;
- (JavaUtilCollections_SynchronizedSortedSet)initWithJavaUtilSortedSet:(id)a3 withId:(id)a4;
- (id)comparator;
- (id)first;
- (id)headSetWithId:(id)a3;
- (id)last;
- (id)subSetWithId:(id)a3 withId:(id)a4;
- (id)tailSetWithId:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilCollections_SynchronizedSortedSet

- (JavaUtilCollections_SynchronizedSortedSet)initWithJavaUtilSortedSet:(id)a3
{
  return self;
}

- (JavaUtilCollections_SynchronizedSortedSet)initWithJavaUtilSortedSet:(id)a3 withId:(id)a4
{
  return self;
}

- (id)comparator
{
  id mutex = self->super.super.mutex_;
  objc_sync_enter(mutex);
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  id v5 = [(JavaUtilSortedSet *)ss comparator];
  objc_sync_exit(mutex);
  return v5;
}

- (id)first
{
  id mutex = self->super.super.mutex_;
  objc_sync_enter(mutex);
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  id v5 = [(JavaUtilSortedSet *)ss first];
  objc_sync_exit(mutex);
  return v5;
}

- (id)headSetWithId:(id)a3
{
  id mutex = self->super.super.mutex_;
  objc_sync_enter(mutex);
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilSortedSet *)ss headSetWithId:a3];
  id v8 = self->super.super.mutex_;
  v9 = [JavaUtilCollections_SynchronizedSortedSet alloc];
  JavaUtilCollections_SynchronizedSortedSet_initWithJavaUtilSortedSet_withId_((id *)&v9->super.super.super.isa, v7, v8);
  v10 = v9;
  objc_sync_exit(mutex);
  return v10;
}

- (id)last
{
  id mutex = self->super.super.mutex_;
  objc_sync_enter(mutex);
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  id v5 = [(JavaUtilSortedSet *)ss last];
  objc_sync_exit(mutex);
  return v5;
}

- (id)subSetWithId:(id)a3 withId:(id)a4
{
  id mutex = self->super.super.mutex_;
  objc_sync_enter(mutex);
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  id v9 = [(JavaUtilSortedSet *)ss subSetWithId:a3 withId:a4];
  id v10 = self->super.super.mutex_;
  v11 = [JavaUtilCollections_SynchronizedSortedSet alloc];
  JavaUtilCollections_SynchronizedSortedSet_initWithJavaUtilSortedSet_withId_((id *)&v11->super.super.super.isa, v9, v10);
  v12 = v11;
  objc_sync_exit(mutex);
  return v12;
}

- (id)tailSetWithId:(id)a3
{
  id mutex = self->super.super.mutex_;
  objc_sync_enter(mutex);
  ss = self->ss_;
  if (!ss) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilSortedSet *)ss tailSetWithId:a3];
  id v8 = self->super.super.mutex_;
  id v9 = [JavaUtilCollections_SynchronizedSortedSet alloc];
  JavaUtilCollections_SynchronizedSortedSet_initWithJavaUtilSortedSet_withId_((id *)&v9->super.super.super.isa, v7, v8);
  id v10 = v9;
  objc_sync_exit(mutex);
  return v10;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  id mutex = self->super.super.mutex_;
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
  v3.super_class = (Class)JavaUtilCollections_SynchronizedSortedSet;
  [(JavaUtilCollections_SynchronizedCollection *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004287B0;
}

@end