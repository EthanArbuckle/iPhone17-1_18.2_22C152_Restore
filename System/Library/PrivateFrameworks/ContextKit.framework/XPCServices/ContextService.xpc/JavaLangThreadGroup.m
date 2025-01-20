@interface JavaLangThreadGroup
+ (const)__metadata;
- (BOOL)isDestroyed;
- (BOOL)parentOfWithJavaLangThreadGroup:(id)a3;
- (JavaLangThreadGroup)init;
- (JavaLangThreadGroup)initWithJavaLangThreadGroup:(id)a3;
- (JavaLangThreadGroup)initWithJavaLangThreadGroup:(id)a3 withNSString:(id)a4;
- (JavaLangThreadGroup)initWithNSString:(id)a3;
- (NSString)description;
- (id)getName;
- (id)getParent;
- (int)activeCount;
- (int)activeGroupCount;
- (int)enumerateGenericWithNSObjectArray:(id)a3 withBoolean:(BOOL)a4 withInt:(int)a5 withBoolean:(BOOL)a6;
- (int)enumerateWithJavaLangThreadArray:(id)a3;
- (int)enumerateWithJavaLangThreadArray:(id)a3 withBoolean:(BOOL)a4;
- (int)enumerateWithJavaLangThreadGroupArray:(id)a3;
- (int)enumerateWithJavaLangThreadGroupArray:(id)a3 withBoolean:(BOOL)a4;
- (int)getMaxPriority;
- (void)addWithJavaLangThread:(id)a3;
- (void)addWithJavaLangThreadGroup:(id)a3;
- (void)dealloc;
- (void)list;
- (void)listWithInt:(int)a3;
- (void)removeWithJavaLangThread:(id)a3;
- (void)removeWithJavaLangThreadGroup:(id)a3;
- (void)setMaxPriorityWithInt:(int)a3;
- (void)setParentWithJavaLangThreadGroup:(id)a3;
- (void)uncaughtExceptionWithJavaLangThread:(id)a3 withJavaLangThrowable:(id)a4;
@end

@implementation JavaLangThreadGroup

- (JavaLangThreadGroup)init
{
  self->maxPriority_ = 10;
  p_childrenThreads = &self->childrenThreads_;
  id v4 = +[IOSObjectArray newArrayWithLength:5 type:JavaLangThread_class_()];
  JreStrongAssignAndConsume((id *)p_childrenThreads, v4);
  if (qword_100561260 != -1) {
    dispatch_once(&qword_100561260, &stru_100468868);
  }
  JreStrongAssignAndConsume((id *)&self->childrenGroups_, +[IOSObjectArray newArrayWithLength:3 type:qword_100561258]);
  JreStrongAssignAndConsume(&self->childrenGroupsLock_, [JavaLangThreadGroup_ChildrenGroupsLock alloc]);
  JreStrongAssignAndConsume(&self->childrenThreadsLock_, [JavaLangThreadGroup_ChildrenThreadsLock alloc]);
  JreStrongAssign((id *)&self->name_, @"system");
  return self;
}

- (JavaLangThreadGroup)initWithNSString:(id)a3
{
  v5 = JavaLangThread_currentThread();
  if (!v5) {
    JreThrowNullPointerException();
  }
  JavaLangThreadGroup_initWithJavaLangThreadGroup_withNSString_((uint64_t)self, [(JavaLangThread *)v5 getThreadGroup], a3);
  return self;
}

- (JavaLangThreadGroup)initWithJavaLangThreadGroup:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaLangThreadGroup)initWithJavaLangThreadGroup:(id)a3
{
  return self;
}

- (int)activeCount
{
  int numThreads = self->numThreads_;
  id childrenGroupsLock = self->childrenGroupsLock_;
  objc_sync_enter(childrenGroupsLock);
  if (self->numGroups_ >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      childrenGroups = self->childrenGroups_;
      if (!childrenGroups) {
        goto LABEL_10;
      }
      uint64_t size = childrenGroups->super.size_;
      if ((int)v5 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v5);
      }
      v8 = (&childrenGroups->elementType_)[v5];
      if (!v8) {
LABEL_10:
      }
        JreThrowNullPointerException();
      numThreads += [(IOSClass *)v8 activeCount];
      ++v5;
    }
    while ((int)v5 < self->numGroups_);
  }
  objc_sync_exit(childrenGroupsLock);
  return numThreads;
}

- (int)activeGroupCount
{
  id childrenGroupsLock = self->childrenGroupsLock_;
  objc_sync_enter(childrenGroupsLock);
  if (self->numGroups_ < 1)
  {
    int v5 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    int v5 = 0;
    do
    {
      childrenGroups = self->childrenGroups_;
      if (!childrenGroups) {
        goto LABEL_11;
      }
      uint64_t size = childrenGroups->super.size_;
      if ((int)v4 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v4);
      }
      v8 = (&childrenGroups->elementType_)[v4];
      if (!v8) {
LABEL_11:
      }
        JreThrowNullPointerException();
      v5 += [(IOSClass *)v8 activeGroupCount] + 1;
      ++v4;
    }
    while ((int)v4 < self->numGroups_);
  }
  objc_sync_exit(childrenGroupsLock);
  return v5;
}

- (void)addWithJavaLangThread:(id)a3
{
  id childrenThreadsLock = self->childrenThreadsLock_;
  objc_sync_enter(childrenThreadsLock);
  if (self->isDestroyed_)
  {
    v11 = new_JavaLangIllegalThreadStateException_init();
    objc_exception_throw(v11);
  }
  childrenThreads = self->childrenThreads_;
  if (!childrenThreads) {
    JreThrowNullPointerException();
  }
  int size = childrenThreads->super.size_;
  uint64_t numThreads = self->numThreads_;
  if (size == numThreads)
  {
    v9 = +[IOSObjectArray arrayWithLength:2 * size type:JavaLangThread_class_()];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->childrenThreads_, 0, v9, 0, self->numThreads_);
    uint64_t v10 = self->numThreads_;
    self->numThreads_ = v10 + 1;
    IOSObjectArray_Set((uint64_t)v9, v10, a3);
    JreStrongAssign((id *)&self->childrenThreads_, v9);
  }
  else
  {
    self->numThreads_ = numThreads + 1;
    IOSObjectArray_Set((uint64_t)childrenThreads, numThreads, a3);
  }
  objc_sync_exit(childrenThreadsLock);
}

- (void)addWithJavaLangThreadGroup:(id)a3
{
}

- (int)enumerateWithJavaLangThreadArray:(id)a3
{
  return [(JavaLangThreadGroup *)self enumerateWithJavaLangThreadArray:a3 withBoolean:1];
}

- (int)enumerateWithJavaLangThreadArray:(id)a3 withBoolean:(BOOL)a4
{
  return sub_100258200((uint64_t)self, (uint64_t)a3, a4, 0, 1);
}

- (int)enumerateWithJavaLangThreadGroupArray:(id)a3
{
  return [(JavaLangThreadGroup *)self enumerateWithJavaLangThreadGroupArray:a3 withBoolean:1];
}

- (int)enumerateWithJavaLangThreadGroupArray:(id)a3 withBoolean:(BOOL)a4
{
  return sub_100258200((uint64_t)self, (uint64_t)a3, a4, 0, 0);
}

- (int)enumerateGenericWithNSObjectArray:(id)a3 withBoolean:(BOOL)a4 withInt:(int)a5 withBoolean:(BOOL)a6
{
  return sub_100258200((uint64_t)self, (uint64_t)a3, a4, *(uint64_t *)&a5, a6);
}

- (int)getMaxPriority
{
  return self->maxPriority_;
}

- (id)getName
{
  return self->name_;
}

- (id)getParent
{
  return self->parent_;
}

- (BOOL)isDestroyed
{
  return self->isDestroyed_;
}

- (void)list
{
}

- (void)listWithInt:(int)a3
{
}

- (BOOL)parentOfWithJavaLangThreadGroup:(id)a3
{
  BOOL v3 = a3 != 0;
  if (a3 != self && a3)
  {
    do
    {
      a3 = (id)*((void *)a3 + 1);
      BOOL v3 = a3 != 0;
    }
    while (a3 != self && a3 != 0);
  }
  return v3;
}

- (void)removeWithJavaLangThread:(id)a3
{
  id childrenThreadsLock = self->childrenThreadsLock_;
  objc_sync_enter(childrenThreadsLock);
  if (self->numThreads_ >= 1)
  {
    uint64_t v6 = 0;
    while (1)
    {
      childrenThreads = self->childrenThreads_;
      if (!childrenThreads) {
        goto LABEL_14;
      }
      uint64_t size = childrenThreads->super.size_;
      if ((int)v6 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      v9 = (&childrenThreads->elementType_)[v6];
      if (!v9) {
LABEL_14:
      }
        JreThrowNullPointerException();
      if ([(IOSClass *)v9 isEqual:a3]) {
        break;
      }
      if ((int)++v6 >= self->numThreads_) {
        goto LABEL_11;
      }
    }
    int v10 = self->numThreads_ - 1;
    self->numThreads_ = v10;
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->childrenThreads_, (v6 + 1), self->childrenThreads_, v6, (v10 - v6));
    IOSObjectArray_Set((uint64_t)self->childrenThreads_, self->numThreads_, 0);
  }
LABEL_11:
  objc_sync_exit(childrenThreadsLock);
}

- (void)removeWithJavaLangThreadGroup:(id)a3
{
}

- (void)setMaxPriorityWithInt:(int)a3
{
}

- (void)setParentWithJavaLangThreadGroup:(id)a3
{
}

- (NSString)description
{
  id v2 = objc_msgSend(-[JavaLangThreadGroup getClass](self, "getClass"), "getName");
  return (NSString *)JreStrcat("$$$$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)uncaughtExceptionWithJavaLangThread:(id)a3 withJavaLangThrowable:(id)a4
{
  parent = self->parent_;
  if (parent)
  {
LABEL_4:
    [parent uncaughtExceptionWithJavaLangThread:a3 withJavaLangThrowable:a4];
    return;
  }
  if (JavaLangThread_getDefaultUncaughtExceptionHandler())
  {
    parent = (void *)JavaLangThread_getDefaultUncaughtExceptionHandler();
    if (parent) {
      goto LABEL_4;
    }
LABEL_12:
    JreThrowNullPointerException();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return;
  }
  if (!a4) {
    goto LABEL_12;
  }
  [a4 printStackTrace];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangThreadGroup;
  [(JavaLangThreadGroup *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004687F8;
}

@end