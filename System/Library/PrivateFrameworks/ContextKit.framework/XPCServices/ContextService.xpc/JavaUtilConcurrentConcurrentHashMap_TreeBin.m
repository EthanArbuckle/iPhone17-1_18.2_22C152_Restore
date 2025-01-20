@interface JavaUtilConcurrentConcurrentHashMap_TreeBin
+ (BOOL)checkInvariantsWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3;
+ (const)__metadata;
+ (id)balanceDeletionWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3 withJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a4;
+ (id)balanceInsertionWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3 withJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a4;
+ (id)rotateLeftWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3 withJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a4;
+ (id)rotateRightWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3 withJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a4;
+ (int)tieBreakOrderWithId:(id)a3 withId:(id)a4;
+ (void)initialize;
- (BOOL)removeTreeNodeWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3;
- (JavaUtilConcurrentConcurrentHashMap_TreeBin)initWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3;
- (id)findWithInt:(int)a3 withId:(id)a4;
- (id)putTreeValWithInt:(int)a3 withId:(id)a4 withId:(id)a5;
- (void)__javaClone;
- (void)dealloc;
- (void)unlockRoot;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_TreeBin

+ (int)tieBreakOrderWithId:(id)a3 withId:(id)a4
{
  return JavaUtilConcurrentConcurrentHashMap_TreeBin_tieBreakOrderWithId_withId_(a3, a4);
}

- (JavaUtilConcurrentConcurrentHashMap_TreeBin)initWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3
{
  return self;
}

- (void)unlockRoot
{
}

- (id)findWithInt:(int)a3 withId:(id)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t v5 = atomic_load((unint64_t *)&self->first_);
  if (v5)
  {
    uint64_t v7 = *(void *)&a3;
    do
    {
      uint64_t v8 = atomic_load((unsigned int *)&self->lockState_);
      if ((v8 & 3) != 0)
      {
        if (*(_DWORD *)(v5 + 8) == v7)
        {
          id v9 = *(id *)(v5 + 16);
          if (v9 == a4 || v9 && (objc_msgSend(a4, "isEqual:") & 1) != 0) {
            return (id)v5;
          }
        }
        uint64_t v5 = *(void *)(v5 + 32);
      }
      else
      {
        if (!qword_100560BB0) {
          JreThrowNullPointerException();
        }
        if ([(id)qword_100560BB0 compareAndSwapIntWithId:self withLong:qword_100560BB8 withInt:v8 withInt:(v8 + 4)])
        {
          root = self->root_;
          if (root) {
            uint64_t v5 = sub_1001BE550((uint64_t)root, v7, a4, 0);
          }
          else {
            uint64_t v5 = 0;
          }
          do
            uint64_t v12 = atomic_load((unsigned int *)&self->lockState_);
          while (([(id)qword_100560BB0 compareAndSwapIntWithId:self withLong:qword_100560BB8 withInt:v12 withInt:(v12 - 4)] & 1) == 0);
          if (v12 == 6)
          {
            v13 = (void *)atomic_load((unint64_t *)&self->waiter_);
            if (v13) {
              JavaUtilConcurrentLocksLockSupport_unparkWithJavaLangThread_(v13);
            }
          }
          return (id)v5;
        }
      }
    }
    while (v5);
  }
  return (id)v5;
}

- (id)putTreeValWithInt:(int)a3 withId:(id)a4 withId:(id)a5
{
  return (id)sub_1001BC100((uint64_t)self, *(uint64_t *)&a3, a4, a5);
}

- (BOOL)removeTreeNodeWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3
{
  return sub_1001BED24((uint64_t)self, (uint64_t)a3);
}

+ (id)rotateLeftWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3 withJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a4
{
  return JavaUtilConcurrentConcurrentHashMap_TreeBin_rotateLeftWithJavaUtilConcurrentConcurrentHashMap_TreeNode_withJavaUtilConcurrentConcurrentHashMap_TreeNode_((void **)a3, (void **)a4);
}

+ (id)rotateRightWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3 withJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a4
{
  return JavaUtilConcurrentConcurrentHashMap_TreeBin_rotateRightWithJavaUtilConcurrentConcurrentHashMap_TreeNode_withJavaUtilConcurrentConcurrentHashMap_TreeNode_((void **)a3, (void **)a4);
}

+ (id)balanceInsertionWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3 withJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a4
{
  return JavaUtilConcurrentConcurrentHashMap_TreeBin_balanceInsertionWithJavaUtilConcurrentConcurrentHashMap_TreeNode_withJavaUtilConcurrentConcurrentHashMap_TreeNode_((void **)a3, (uint64_t)a4);
}

+ (id)balanceDeletionWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3 withJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a4
{
  return JavaUtilConcurrentConcurrentHashMap_TreeBin_balanceDeletionWithJavaUtilConcurrentConcurrentHashMap_TreeNode_withJavaUtilConcurrentConcurrentHashMap_TreeNode_((void **)a3, (uint64_t)a4);
}

+ (BOOL)checkInvariantsWithJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a3
{
  return JavaUtilConcurrentConcurrentHashMap_TreeBin_checkInvariantsWithJavaUtilConcurrentConcurrentHashMap_TreeNode_((uint64_t)a3);
}

- (void)dealloc
{
  JreReleaseVolatile(&self->first_);
  JreReleaseVolatile(&self->waiter_);
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap_TreeBin;
  [(JavaUtilConcurrentConcurrentHashMap_Node *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap_TreeBin;
  [(JavaUtilConcurrentConcurrentHashMap_Node *)&v3 __javaClone];
  JreRetainVolatile(&self->first_);
  JreRetainVolatile(&self->waiter_);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    Unsafe = (void *)SunMiscUnsafe_getUnsafe();
    JreStrongAssign((id *)&qword_100560BB0, Unsafe);
    objc_super v3 = (void *)JavaUtilConcurrentConcurrentHashMap_TreeBin_class_();
    if (!qword_100560BB0) {
      JreThrowNullPointerException();
    }
    qword_100560BB8 = (uint64_t)objc_msgSend((id)qword_100560BB0, "objectFieldOffsetWithJavaLangReflectField:", objc_msgSend(v3, "getDeclaredField:", @"lockState"));
    atomic_store(1u, (unsigned __int8 *)JavaUtilConcurrentConcurrentHashMap_TreeBin__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041F5A0;
}

@end