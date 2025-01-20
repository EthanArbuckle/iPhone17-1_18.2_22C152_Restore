@interface ComAppleContextkitCategoriesConstellation_Request_$2
- (ComAppleContextkitCategoriesConstellation_Request_$2)initWithComAppleContextkitCategoriesConstellation_Request:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilConcurrentAtomicAtomicBoolean:(id)a6 withJavaUtilConcurrentAtomicAtomicInteger:(id)a7;
- (void)acceptWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)dealloc;
@end

@implementation ComAppleContextkitCategoriesConstellation_Request_$2

- (void)acceptWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  int v7 = self->val$weight_;
  int v8 = sub_1000C7FDC((uint64_t)self->this$0_->qidCounts_, *(uint64_t *)&a5, self->val$count_);
  int v9 = sub_1000C7FDC((uint64_t)self->this$0_->qidWeights_, v5, v7);
  if (v8 > 0 || v9 >= 1)
  {
    v11 = self->val$hasModifications_;
    if (!v11) {
      goto LABEL_26;
    }
    [(JavaUtilConcurrentAtomicAtomicBoolean *)v11 setWithBoolean:1];
  }
  v12 = self->this$0_;
  qidWeights = v12->qidWeights_;
  if (!qidWeights) {
LABEL_26:
  }
    JreThrowNullPointerException();
  uint64_t size = qidWeights->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  if (*(&qidWeights->super.size_ + (int)v5 + 1) >= 1)
  {
    qidCounts = v12->qidCounts_;
    if (!qidCounts) {
      goto LABEL_26;
    }
    uint64_t v16 = qidCounts->super.size_;
    if ((v5 & 0x80000000) != 0 || (int)v16 <= (int)v5) {
      IOSArray_throwOutOfBoundsWithMsg(v16, v5);
    }
    if (*(&qidCounts->super.size_ + (int)v5 + 1) > 0) {
      goto LABEL_22;
    }
    v12 = self->this$0_;
  }
  v17 = v12->qidCounts_;
  if (!v17) {
    goto LABEL_26;
  }
  uint64_t v18 = v17->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)v18 <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v5);
  }
  *(&v17->super.size_ + (int)v5 + 1) = 0;
  v19 = self->this$0_->qidWeights_;
  uint64_t v20 = v19->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)v20 <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(v20, v5);
  }
  *(&v19->super.size_ + (int)v5 + 1) = 0;
LABEL_22:
  v21 = self->val$numNonZeroesTouched_;
  if (!v21) {
    goto LABEL_26;
  }
  [(JavaUtilConcurrentAtomicAtomicInteger *)v21 incrementAndGet];
}

- (ComAppleContextkitCategoriesConstellation_Request_$2)initWithComAppleContextkitCategoriesConstellation_Request:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilConcurrentAtomicAtomicBoolean:(id)a6 withJavaUtilConcurrentAtomicAtomicInteger:(id)a7
{
  self->val$count_ = a4;
  self->val$weight_ = a5;
  JreStrongAssign((id *)&self->val$hasModifications_, a6);
  JreStrongAssign((id *)&self->val$numNonZeroesTouched_, a7);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesConstellation_Request__2;
  [(ComAppleContextkitCategoriesConstellation_Request_$2 *)&v3 dealloc];
}

@end