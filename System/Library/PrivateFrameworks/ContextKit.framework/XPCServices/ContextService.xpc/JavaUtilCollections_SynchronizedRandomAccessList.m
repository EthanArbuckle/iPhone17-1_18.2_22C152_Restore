@interface JavaUtilCollections_SynchronizedRandomAccessList
+ (const)__metadata;
- (JavaUtilCollections_SynchronizedRandomAccessList)initWithJavaUtilList:(id)a3;
- (JavaUtilCollections_SynchronizedRandomAccessList)initWithJavaUtilList:(id)a3 withId:(id)a4;
- (id)subListWithInt:(int)a3 withInt:(int)a4;
- (id)writeReplace;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation JavaUtilCollections_SynchronizedRandomAccessList

- (JavaUtilCollections_SynchronizedRandomAccessList)initWithJavaUtilList:(id)a3
{
  return self;
}

- (JavaUtilCollections_SynchronizedRandomAccessList)initWithJavaUtilList:(id)a3 withId:(id)a4
{
  return self;
}

- (id)subListWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id mutex = self->super.super.mutex_;
  objc_sync_enter(mutex);
  list = self->super.list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  id v9 = [(JavaUtilList *)list subListWithInt:v5 withInt:v4];
  id v10 = self->super.super.mutex_;
  v11 = [JavaUtilCollections_SynchronizedRandomAccessList alloc];
  JavaUtilCollections_SynchronizedList_initWithJavaUtilList_withId_((id *)&v11->super.super.super.isa, v9, v10);
  v12 = v11;
  objc_sync_exit(mutex);
  return v12;
}

- (id)writeReplace
{
  v2 = new_JavaUtilCollections_SynchronizedList_initWithJavaUtilList_(self->super.list_);
  return v2;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100427C80;
}

@end