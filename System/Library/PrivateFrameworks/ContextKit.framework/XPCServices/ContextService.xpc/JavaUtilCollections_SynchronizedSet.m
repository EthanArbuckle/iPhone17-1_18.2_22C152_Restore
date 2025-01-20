@interface JavaUtilCollections_SynchronizedSet
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_SynchronizedSet)initWithJavaUtilSet:(id)a3;
- (JavaUtilCollections_SynchronizedSet)initWithJavaUtilSet:(id)a3 withId:(id)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilCollections_SynchronizedSet

- (JavaUtilCollections_SynchronizedSet)initWithJavaUtilSet:(id)a3
{
  return self;
}

- (JavaUtilCollections_SynchronizedSet)initWithJavaUtilSet:(id)a3 withId:(id)a4
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  c = self->super.c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  unsigned __int8 v7 = [(JavaUtilCollection *)c isEqual:a3];
  objc_sync_exit(mutex);
  return v7;
}

- (unint64_t)hash
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  c = self->super.c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  unint64_t v5 = (int)[(JavaUtilCollection *)c hash];
  objc_sync_exit(mutex);
  return v5;
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

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100428290;
}

@end