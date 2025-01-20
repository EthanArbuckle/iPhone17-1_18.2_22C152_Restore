@interface JavaUtilCollections_SynchronizedMap
+ (const)__metadata;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsValueWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_SynchronizedMap)initWithJavaUtilMap:(id)a3;
- (JavaUtilCollections_SynchronizedMap)initWithJavaUtilMap:(id)a3 withId:(id)a4;
- (NSString)description;
- (id)entrySet;
- (id)getWithId:(id)a3;
- (id)keySet;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)removeWithId:(id)a3;
- (id)values;
- (int)size;
- (unint64_t)hash;
- (void)clear;
- (void)dealloc;
- (void)putAllWithJavaUtilMap:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilCollections_SynchronizedMap

- (JavaUtilCollections_SynchronizedMap)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (JavaUtilCollections_SynchronizedMap)initWithJavaUtilMap:(id)a3 withId:(id)a4
{
  return self;
}

- (void)clear
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  [(JavaUtilMap *)m clear];
  objc_sync_exit(mutex);
}

- (BOOL)containsKeyWithId:(id)a3
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  unsigned __int8 v7 = [(JavaUtilMap *)m containsKeyWithId:a3];
  objc_sync_exit(mutex);
  return v7;
}

- (BOOL)containsValueWithId:(id)a3
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  unsigned __int8 v7 = [(JavaUtilMap *)m containsValueWithId:a3];
  objc_sync_exit(mutex);
  return v7;
}

- (id)entrySet
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  v5 = new_JavaUtilCollections_SynchronizedSet_initWithJavaUtilSet_withId_([(JavaUtilMap *)m entrySet], self->mutex_);
  objc_sync_exit(mutex);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  unsigned __int8 v7 = [(JavaUtilMap *)m isEqual:a3];
  objc_sync_exit(mutex);
  return v7;
}

- (id)getWithId:(id)a3
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilMap *)m getWithId:a3];
  objc_sync_exit(mutex);
  return v7;
}

- (unint64_t)hash
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  unint64_t v5 = (int)[(JavaUtilMap *)m hash];
  objc_sync_exit(mutex);
  return v5;
}

- (BOOL)isEmpty
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  unsigned __int8 v5 = [(JavaUtilMap *)m isEmpty];
  objc_sync_exit(mutex);
  return v5;
}

- (id)keySet
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  unsigned __int8 v5 = new_JavaUtilCollections_SynchronizedSet_initWithJavaUtilSet_withId_([(JavaUtilMap *)m keySet], self->mutex_);
  objc_sync_exit(mutex);
  return v5;
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  id v9 = [(JavaUtilMap *)m putWithId:a3 withId:a4];
  objc_sync_exit(mutex);
  return v9;
}

- (void)putAllWithJavaUtilMap:(id)a3
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  [(JavaUtilMap *)m putAllWithJavaUtilMap:a3];
  objc_sync_exit(mutex);
}

- (id)removeWithId:(id)a3
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilMap *)m removeWithId:a3];
  objc_sync_exit(mutex);
  return v7;
}

- (int)size
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  int v5 = [(JavaUtilMap *)m size];
  objc_sync_exit(mutex);
  return v5;
}

- (id)values
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  int v5 = new_JavaUtilCollections_SynchronizedCollection_initWithJavaUtilCollection_withId_([(JavaUtilMap *)m values], self->mutex_);
  objc_sync_exit(mutex);
  return v5;
}

- (NSString)description
{
  id mutex = self->mutex_;
  objc_sync_enter(mutex);
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  int v5 = (NSString *)[(JavaUtilMap *)m description];
  objc_sync_exit(mutex);
  return v5;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  id mutex = self->mutex_;
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
  v3.super_class = (Class)JavaUtilCollections_SynchronizedMap;
  [(JavaUtilCollections_SynchronizedMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004280F8;
}

@end