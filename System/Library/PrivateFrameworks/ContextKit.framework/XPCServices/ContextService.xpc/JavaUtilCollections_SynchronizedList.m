@interface JavaUtilCollections_SynchronizedList
+ (const)__metadata;
- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_SynchronizedList)initWithJavaUtilList:(id)a3;
- (JavaUtilCollections_SynchronizedList)initWithJavaUtilList:(id)a3 withId:(id)a4;
- (id)getWithInt:(int)a3;
- (id)listIterator;
- (id)listIteratorWithInt:(int)a3;
- (id)readResolve;
- (id)removeWithInt:(int)a3;
- (id)setWithInt:(int)a3 withId:(id)a4;
- (id)subListWithInt:(int)a3 withInt:(int)a4;
- (int)indexOfWithId:(id)a3;
- (int)lastIndexOfWithId:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)addWithInt:(int)a3 withId:(id)a4;
- (void)dealloc;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilCollections_SynchronizedList

- (JavaUtilCollections_SynchronizedList)initWithJavaUtilList:(id)a3
{
  return self;
}

- (JavaUtilCollections_SynchronizedList)initWithJavaUtilList:(id)a3 withId:(id)a4
{
  return self;
}

- (void)addWithInt:(int)a3 withId:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  [(JavaUtilList *)list addWithInt:v5 withId:a4];
  objc_sync_exit(mutex);
}

- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  unsigned __int8 v9 = [(JavaUtilList *)list addAllWithInt:v5 withJavaUtilCollection:a4];
  objc_sync_exit(mutex);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  unsigned __int8 v7 = [(JavaUtilList *)list isEqual:a3];
  objc_sync_exit(mutex);
  return v7;
}

- (id)getWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilList *)list getWithInt:v3];
  objc_sync_exit(mutex);
  return v7;
}

- (unint64_t)hash
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  unint64_t v5 = (int)[(JavaUtilList *)list hash];
  objc_sync_exit(mutex);
  return v5;
}

- (int)indexOfWithId:(id)a3
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  int v7 = [(JavaUtilList *)list size];
  v8 = +[IOSObjectArray arrayWithLength:v7 type:NSObject_class_()];
  [(JavaUtilList *)self->list_ toArrayWithNSObjectArray:v8];
  objc_sync_exit(mutex);
  if (a3)
  {
    if (v7 >= 1)
    {
      uint64_t v9 = 0;
      while (1)
      {
        uint64_t size = v8->super.size_;
        if (v9 >= size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v9);
        }
        if ([a3 isEqual:(&v8->elementType_)[v9]]) {
          break;
        }
        if (v7 == ++v9) {
          goto LABEL_17;
        }
      }
      LODWORD(v11) = v9;
      return v11;
    }
LABEL_17:
    LODWORD(v11) = -1;
    return v11;
  }
  if (v7 < 1) {
    goto LABEL_17;
  }
  uint64_t v11 = 0;
  while (1)
  {
    uint64_t v12 = v8->super.size_;
    if (v11 >= v12) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v11);
    }
    if (!(&v8->elementType_)[v11]) {
      return v11;
    }
    if (v7 == ++v11) {
      goto LABEL_17;
    }
  }
}

- (int)lastIndexOfWithId:(id)a3
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  LODWORD(v7) = [(JavaUtilList *)list size];
  v8 = +[IOSObjectArray arrayWithLength:(int)v7 type:NSObject_class_()];
  [(JavaUtilList *)self->list_ toArrayWithNSObjectArray:v8];
  objc_sync_exit(mutex);
  if (a3)
  {
    while (1)
    {
      uint64_t v7 = (v7 - 1);
      if ((int)v7 < 0) {
        break;
      }
      uint64_t size = v8->super.size_;
      if ((int)v7 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v7);
      }
      if ([a3 isEqual:(&v8->elementType_)[v7]]) {
        return v7;
      }
    }
  }
  else
  {
    while (1)
    {
      uint64_t v10 = (v7 - 1);
      if ((int)v7 - 1 < 0) {
        break;
      }
      LODWORD(v7) = v7 - 1;
      uint64_t v11 = v8->super.size_;
      if ((int)v10 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v10);
      }
      if (!(&v8->elementType_)[v10]) {
        return v7;
      }
    }
  }
  LODWORD(v7) = -1;
  return v7;
}

- (id)listIterator
{
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  id v5 = [(JavaUtilList *)list listIterator];
  objc_sync_exit(mutex);
  return v5;
}

- (id)listIteratorWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilList *)list listIteratorWithInt:v3];
  objc_sync_exit(mutex);
  return v7;
}

- (id)removeWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilList *)list removeWithInt:v3];
  objc_sync_exit(mutex);
  return v7;
}

- (id)setWithInt:(int)a3 withId:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  id v9 = [(JavaUtilList *)list setWithInt:v5 withId:a4];
  objc_sync_exit(mutex);
  return v9;
}

- (id)subListWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id mutex = self->super.mutex_;
  objc_sync_enter(mutex);
  list = self->list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  id v9 = [(JavaUtilList *)list subListWithInt:v5 withInt:v4];
  id v10 = self->super.mutex_;
  uint64_t v11 = [JavaUtilCollections_SynchronizedList alloc];
  JavaUtilCollections_SynchronizedList_initWithJavaUtilList_withId_((id *)&v11->super.super.isa, v9, v10);
  uint64_t v12 = v11;
  objc_sync_exit(mutex);
  return v12;
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

- (id)readResolve
{
  if (![(id)JavaUtilRandomAccess_class_() isInstance:self->list_]) {
    return self;
  }
  list = self->list_;
  id mutex = self->super.mutex_;
  uint64_t v5 = [JavaUtilCollections_SynchronizedRandomAccessList alloc];
  JavaUtilCollections_SynchronizedList_initWithJavaUtilList_withId_((id *)&v5->super.super.super.isa, list, mutex);
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_SynchronizedList;
  [(JavaUtilCollections_SynchronizedCollection *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100427B18;
}

@end