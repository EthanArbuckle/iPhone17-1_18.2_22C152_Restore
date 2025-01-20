@interface JavaUtilConcurrentCopyOnWriteArrayList_CowSubList
+ (const)__metadata;
- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeAllWithJavaUtilCollection:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (BOOL)retainAllWithJavaUtilCollection:(id)a3;
- (JavaUtilConcurrentCopyOnWriteArrayList_CowSubList)initWithJavaUtilConcurrentCopyOnWriteArrayList:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (JavaUtilConcurrentCopyOnWriteArrayList_CowSubList)subListWithInt:(int)a3 withInt:(int)a4;
- (id)getWithInt:(int)a3;
- (id)iterator;
- (id)listIterator;
- (id)listIteratorWithInt:(int)a3;
- (id)removeWithInt:(int)a3;
- (id)setWithInt:(int)a3 withId:(id)a4;
- (int)indexOfWithId:(id)a3;
- (int)lastIndexOfWithId:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
- (void)addWithInt:(int)a3 withId:(id)a4;
- (void)clear;
- (void)dealloc;
@end

@implementation JavaUtilConcurrentCopyOnWriteArrayList_CowSubList

- (JavaUtilConcurrentCopyOnWriteArrayList_CowSubList)initWithJavaUtilConcurrentCopyOnWriteArrayList:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return self;
}

- (int)size
{
  unint64_t v2 = atomic_load((unint64_t *)&self->slice_);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return *(_DWORD *)(v2 + 20) - *(_DWORD *)(v2 + 16);
}

- (BOOL)isEmpty
{
  unint64_t v2 = atomic_load((unint64_t *)&self->slice_);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return *(_DWORD *)(v2 + 16) == *(_DWORD *)(v2 + 20);
}

- (id)getWithInt:(int)a3
{
  v3 = (_DWORD *)atomic_load((unint64_t *)&self->slice_);
  unint64_t v4 = atomic_load((unint64_t *)&self->this$0_->elements_);
  if (!v3
    || (objc_msgSend(v3, "checkElementIndexWithInt:"),
        [v3 checkConcurrentModificationWithNSObjectArray:v4],
        !v4))
  {
    JreThrowNullPointerException();
  }
  uint64_t v6 = *(unsigned int *)(v4 + 8);
  uint64_t v7 = (v3[4] + a3);
  if ((int)v7 < 0 || (int)v7 >= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(v6, v7);
  }
  return *(id *)(v4 + 24 + 8 * (int)v7);
}

- (id)iterator
{
  return [(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)self listIteratorWithInt:0];
}

- (id)listIterator
{
  return [(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)self listIteratorWithInt:0];
}

- (id)listIteratorWithInt:(int)a3
{
  v3 = (void *)atomic_load((unint64_t *)&self->slice_);
  unint64_t v4 = (void *)atomic_load((unint64_t *)&self->this$0_->elements_);
  if (!v3) {
    JreThrowNullPointerException();
  }
  objc_msgSend(v3, "checkPositionIndexWithInt:");
  [v3 checkConcurrentModificationWithNSObjectArray:v4];
  uint64_t v8 = v3[2];
  uint64_t v6 = [JavaUtilConcurrentCopyOnWriteArrayList_CowIterator alloc];
  v6->index_ = 0;
  JreStrongAssign((id *)&v6->snapshot_, v4);
  *(void *)&v6->from_ = v8;
  v6->index_ = v8;
  id result = v6;
  *((_DWORD *)result + 6) = *((_DWORD *)v3 + 4) + a3;
  return result;
}

- (int)indexOfWithId:(id)a3
{
  unint64_t v3 = atomic_load((unint64_t *)&self->slice_);
  uint64_t v4 = atomic_load((unint64_t *)&self->this$0_->elements_);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [(id)v3 checkConcurrentModificationWithNSObjectArray:v4];
  int result = JavaUtilConcurrentCopyOnWriteArrayList_indexOfWithId_withNSObjectArray_withInt_withInt_(a3, v4, *(unsigned int *)(v3 + 16), *(_DWORD *)(v3 + 20));
  if (result != -1) {
    result -= *(_DWORD *)(v3 + 16);
  }
  return result;
}

- (int)lastIndexOfWithId:(id)a3
{
  unint64_t v3 = (int *)atomic_load((unint64_t *)&self->slice_);
  uint64_t v4 = atomic_load((unint64_t *)&self->this$0_->elements_);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 checkConcurrentModificationWithNSObjectArray:v4];
  int result = JavaUtilConcurrentCopyOnWriteArrayList_lastIndexOfWithId_withNSObjectArray_withInt_withInt_(a3, v4, v3[4], v3[5]);
  if (result != -1) {
    result -= v3[4];
  }
  return result;
}

- (BOOL)containsWithId:(id)a3
{
  return [(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)self indexOfWithId:a3] != -1;
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  unint64_t v3 = (unsigned int *)atomic_load((unint64_t *)&self->slice_);
  uint64_t v4 = atomic_load((unint64_t *)&self->this$0_->elements_);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 checkConcurrentModificationWithNSObjectArray:v4];
  uint64_t v6 = v3[4];
  int v7 = v3[5];
  return JavaUtilConcurrentCopyOnWriteArrayList_containsAllWithJavaUtilCollection_withNSObjectArray_withInt_withInt_(a3, v4, v6, v7);
}

- (JavaUtilConcurrentCopyOnWriteArrayList_CowSubList)subListWithInt:(int)a3 withInt:(int)a4
{
  unint64_t v7 = atomic_load((unint64_t *)&self->slice_);
  if (a3 < 0 || a3 > a4 || [(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)self size] < a4)
  {
    [(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)self size];
    CFStringRef v22 = JreStrcat("$I$I$I", v15, v16, v17, v18, v19, v20, v21, @"from=");
    v23 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v22);
    objc_exception_throw(v23);
  }
  if (!v7) {
    JreThrowNullPointerException();
  }
  uint64_t v8 = self->this$0_;
  v9 = *(void **)(v7 + 8);
  int v10 = *(_DWORD *)(v7 + 16);
  int v11 = v10 + a3;
  int v12 = v10 + a4;
  v13 = [JavaUtilConcurrentCopyOnWriteArrayList_CowSubList alloc];
  JavaUtilConcurrentCopyOnWriteArrayList_CowSubList_initWithJavaUtilConcurrentCopyOnWriteArrayList_withNSObjectArray_withInt_withInt_((uint64_t)v13, v8, v9, v11, v12);
  return v13;
}

- (id)removeWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = self->this$0_;
  objc_sync_enter(v5);
  p_slice = (unint64_t *)&self->slice_;
  unint64_t v7 = (void *)atomic_load((unint64_t *)&self->slice_);
  if (!v7) {
    JreThrowNullPointerException();
  }
  [v7 checkElementIndexWithInt:v3];
  uint64_t v8 = (void *)atomic_load(p_slice);
  unint64_t v9 = atomic_load((unint64_t *)&self->this$0_->elements_);
  [v8 checkConcurrentModificationWithNSObjectArray:v9];
  int v10 = self->this$0_;
  unint64_t v11 = atomic_load(p_slice);
  id v12 = [(JavaUtilConcurrentCopyOnWriteArrayList *)v10 removeWithInt:(*(_DWORD *)(v11 + 16) + v3)];
  v13 = (void *)atomic_load((unint64_t *)&self->this$0_->elements_);
  unint64_t v14 = atomic_load(p_slice);
  int v15 = *(_DWORD *)(v14 + 16);
  unint64_t v16 = atomic_load(p_slice);
  int v17 = *(_DWORD *)(v16 + 20);
  uint64_t v18 = [JavaUtilConcurrentCopyOnWriteArrayList_Slice alloc];
  JreStrongAssign((id *)&v18->expectedElements_, v13);
  v18->from_ = v15;
  v18->to_ = v17 - 1;
  JreVolatileStrongAssignAndConsume((atomic_ullong *)p_slice, (unint64_t)v18);
  objc_sync_exit(v5);
  return v12;
}

- (void)clear
{
  uint64_t v3 = self->this$0_;
  objc_sync_enter(v3);
  p_slice = (unint64_t *)&self->slice_;
  v5 = (void *)atomic_load((unint64_t *)&self->slice_);
  if (!v5) {
    JreThrowNullPointerException();
  }
  unint64_t v6 = atomic_load((unint64_t *)&self->this$0_->elements_);
  [v5 checkConcurrentModificationWithNSObjectArray:v6];
  unint64_t v7 = self->this$0_;
  unint64_t v8 = atomic_load(p_slice);
  uint64_t v9 = *(unsigned int *)(v8 + 16);
  unint64_t v10 = atomic_load(p_slice);
  sub_100296C1C((uint64_t)v7, v9, *(unsigned int *)(v10 + 20));
  unint64_t v11 = (void *)atomic_load((unint64_t *)&self->this$0_->elements_);
  unint64_t v12 = atomic_load(p_slice);
  int v13 = *(_DWORD *)(v12 + 16);
  unint64_t v14 = atomic_load(p_slice);
  int v15 = *(_DWORD *)(v14 + 16);
  unint64_t v16 = [JavaUtilConcurrentCopyOnWriteArrayList_Slice alloc];
  JreStrongAssign((id *)&v16->expectedElements_, v11);
  v16->from_ = v13;
  v16->to_ = v15;
  JreVolatileStrongAssignAndConsume((atomic_ullong *)p_slice, (unint64_t)v16);
  objc_sync_exit(v3);
}

- (void)addWithInt:(int)a3 withId:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  unint64_t v7 = self->this$0_;
  objc_sync_enter(v7);
  p_slice = (unint64_t *)&self->slice_;
  uint64_t v9 = (void *)atomic_load((unint64_t *)&self->slice_);
  if (!v9) {
    JreThrowNullPointerException();
  }
  [v9 checkPositionIndexWithInt:v5];
  unint64_t v10 = (void *)atomic_load(p_slice);
  unint64_t v11 = atomic_load((unint64_t *)&self->this$0_->elements_);
  [v10 checkConcurrentModificationWithNSObjectArray:v11];
  unint64_t v12 = self->this$0_;
  unint64_t v13 = atomic_load(p_slice);
  [(JavaUtilConcurrentCopyOnWriteArrayList *)v12 addWithInt:(*(_DWORD *)(v13 + 16) + v5) withId:a4];
  unint64_t v14 = (void *)atomic_load((unint64_t *)&self->this$0_->elements_);
  unint64_t v15 = atomic_load(p_slice);
  int v16 = *(_DWORD *)(v15 + 16);
  unint64_t v17 = atomic_load(p_slice);
  int v18 = *(_DWORD *)(v17 + 20);
  uint64_t v19 = [JavaUtilConcurrentCopyOnWriteArrayList_Slice alloc];
  JreStrongAssign((id *)&v19->expectedElements_, v14);
  v19->from_ = v16;
  v19->to_ = v18 + 1;
  JreVolatileStrongAssignAndConsume((atomic_ullong *)p_slice, (unint64_t)v19);
  objc_sync_exit(v7);
}

- (BOOL)addWithId:(id)a3
{
  uint64_t v5 = self->this$0_;
  objc_sync_enter(v5);
  unint64_t v6 = atomic_load((unint64_t *)&self->slice_);
  if (!v6) {
    JreThrowNullPointerException();
  }
  int v7 = *(_DWORD *)(v6 + 20);
  unint64_t v8 = atomic_load((unint64_t *)&self->slice_);
  [(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)self addWithInt:(v7 - *(_DWORD *)(v8 + 16)) withId:a3];
  objc_sync_exit(v5);
  return 1;
}

- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = self->this$0_;
  objc_sync_enter(v7);
  p_slice = (unint64_t *)&self->slice_;
  uint64_t v9 = (void *)atomic_load((unint64_t *)&self->slice_);
  if (!v9) {
    JreThrowNullPointerException();
  }
  [v9 checkPositionIndexWithInt:v5];
  unint64_t v10 = (void *)atomic_load(p_slice);
  unint64_t v11 = atomic_load((unint64_t *)&self->this$0_->elements_);
  [v10 checkConcurrentModificationWithNSObjectArray:v11];
  unint64_t v12 = atomic_load((unint64_t *)&self->this$0_->elements_);
  if (!v12) {
    JreThrowNullPointerException();
  }
  int v13 = *(_DWORD *)(v12 + 8);
  unint64_t v14 = self->this$0_;
  unint64_t v15 = atomic_load(p_slice);
  unsigned __int8 v16 = [(JavaUtilConcurrentCopyOnWriteArrayList *)v14 addAllWithInt:(*(_DWORD *)(v15 + 16) + v5) withJavaUtilCollection:a4];
  unint64_t v17 = (void *)atomic_load((unint64_t *)&self->this$0_->elements_);
  unint64_t v18 = atomic_load(p_slice);
  int v19 = *(_DWORD *)(v18 + 16);
  unint64_t v20 = atomic_load(p_slice);
  int v21 = *(_DWORD *)(v20 + 20);
  unint64_t v22 = atomic_load((unint64_t *)&self->this$0_->elements_);
  int v23 = *(_DWORD *)(v22 + 8);
  v24 = [JavaUtilConcurrentCopyOnWriteArrayList_Slice alloc];
  JreStrongAssign((id *)&v24->expectedElements_, v17);
  v24->from_ = v19;
  v24->to_ = v21 - v13 + v23;
  JreVolatileStrongAssignAndConsume((atomic_ullong *)p_slice, (unint64_t)v24);
  objc_sync_exit(v7);
  return v16;
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  uint64_t v5 = self->this$0_;
  objc_sync_enter(v5);
  LOBYTE(a3) = [(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)self addAllWithInt:[(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)self size] withJavaUtilCollection:a3];
  objc_sync_exit(v5);
  return (char)a3;
}

- (id)setWithInt:(int)a3 withId:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = self->this$0_;
  objc_sync_enter(v7);
  p_slice = (unint64_t *)&self->slice_;
  uint64_t v9 = (void *)atomic_load((unint64_t *)&self->slice_);
  if (!v9) {
    JreThrowNullPointerException();
  }
  [v9 checkElementIndexWithInt:v5];
  unint64_t v10 = (void *)atomic_load(p_slice);
  unint64_t v11 = atomic_load((unint64_t *)&self->this$0_->elements_);
  [v10 checkConcurrentModificationWithNSObjectArray:v11];
  unint64_t v12 = self->this$0_;
  unint64_t v13 = atomic_load(p_slice);
  id v14 = [(JavaUtilConcurrentCopyOnWriteArrayList *)v12 setWithInt:(*(_DWORD *)(v13 + 16) + v5) withId:a4];
  unint64_t v15 = (void *)atomic_load((unint64_t *)&self->this$0_->elements_);
  unint64_t v16 = atomic_load(p_slice);
  int v17 = *(_DWORD *)(v16 + 16);
  unint64_t v18 = atomic_load(p_slice);
  int v19 = *(_DWORD *)(v18 + 20);
  unint64_t v20 = [JavaUtilConcurrentCopyOnWriteArrayList_Slice alloc];
  JreStrongAssign((id *)&v20->expectedElements_, v15);
  v20->from_ = v17;
  v20->to_ = v19;
  JreVolatileStrongAssignAndConsume((atomic_ullong *)p_slice, (unint64_t)v20);
  objc_sync_exit(v7);
  return v14;
}

- (BOOL)removeWithId:(id)a3
{
  uint64_t v5 = self->this$0_;
  objc_sync_enter(v5);
  uint64_t v6 = [(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)self indexOfWithId:a3];
  if (v6 != -1) {
    [(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)self removeWithInt:v6];
  }
  objc_sync_exit(v5);
  return v6 != -1;
}

- (BOOL)removeAllWithJavaUtilCollection:(id)a3
{
  uint64_t v5 = self->this$0_;
  objc_sync_enter(v5);
  p_slice = (unint64_t *)&self->slice_;
  int v7 = (void *)atomic_load((unint64_t *)&self->slice_);
  if (!v7) {
    JreThrowNullPointerException();
  }
  unint64_t v8 = atomic_load((unint64_t *)&self->this$0_->elements_);
  [v7 checkConcurrentModificationWithNSObjectArray:v8];
  uint64_t v9 = self->this$0_;
  unint64_t v10 = atomic_load(p_slice);
  int v11 = *(_DWORD *)(v10 + 16);
  unint64_t v12 = atomic_load(p_slice);
  int v13 = sub_100296DEC((uint64_t)v9, a3, 0, v11, *(unsigned int *)(v12 + 20));
  id v14 = (void *)atomic_load((unint64_t *)&self->this$0_->elements_);
  unint64_t v15 = atomic_load(p_slice);
  int v16 = *(_DWORD *)(v15 + 16);
  unint64_t v17 = atomic_load(p_slice);
  int v18 = *(_DWORD *)(v17 + 20);
  int v19 = [JavaUtilConcurrentCopyOnWriteArrayList_Slice alloc];
  JreStrongAssign((id *)&v19->expectedElements_, v14);
  v19->from_ = v16;
  v19->to_ = v18 - v13;
  JreVolatileStrongAssignAndConsume((atomic_ullong *)p_slice, (unint64_t)v19);
  objc_sync_exit(v5);
  return v13 != 0;
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  uint64_t v5 = self->this$0_;
  objc_sync_enter(v5);
  p_slice = (unint64_t *)&self->slice_;
  int v7 = (void *)atomic_load((unint64_t *)&self->slice_);
  if (!v7) {
    JreThrowNullPointerException();
  }
  unint64_t v8 = atomic_load((unint64_t *)&self->this$0_->elements_);
  [v7 checkConcurrentModificationWithNSObjectArray:v8];
  uint64_t v9 = self->this$0_;
  unint64_t v10 = atomic_load(p_slice);
  int v11 = *(_DWORD *)(v10 + 16);
  unint64_t v12 = atomic_load(p_slice);
  int v13 = sub_100296DEC((uint64_t)v9, a3, 1, v11, *(unsigned int *)(v12 + 20));
  id v14 = (void *)atomic_load((unint64_t *)&self->this$0_->elements_);
  unint64_t v15 = atomic_load(p_slice);
  int v16 = *(_DWORD *)(v15 + 16);
  unint64_t v17 = atomic_load(p_slice);
  int v18 = *(_DWORD *)(v17 + 20);
  int v19 = [JavaUtilConcurrentCopyOnWriteArrayList_Slice alloc];
  JreStrongAssign((id *)&v19->expectedElements_, v14);
  v19->from_ = v16;
  v19->to_ = v18 - v13;
  JreVolatileStrongAssignAndConsume((atomic_ullong *)p_slice, (unint64_t)v19);
  objc_sync_exit(v5);
  return v13 != 0;
}

- (void)dealloc
{
  JreReleaseVolatile(&self->slice_);
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentCopyOnWriteArrayList_CowSubList;
  [(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentCopyOnWriteArrayList_CowSubList;
  [(JavaUtilConcurrentCopyOnWriteArrayList_CowSubList *)&v3 __javaClone];
  JreRetainVolatile(&self->slice_);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100486B98;
}

@end