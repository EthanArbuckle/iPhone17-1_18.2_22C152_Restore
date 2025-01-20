@interface OrgApacheLuceneUtilBytesRefHash_$1
- (OrgApacheLuceneUtilBytesRefHash_$1)initWithOrgApacheLuceneUtilBytesRefHash:(id)a3 withIntArray:(id)a4 withJavaUtilComparator:(id)a5;
- (int)comparePivotWithInt:(int)a3;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)setPivotWithInt:(int)a3;
- (void)swapWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilBytesRefHash_$1

- (void)swapWithInt:(int)a3 withInt:(int)a4
{
  v4 = self->val$compact_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  uint64_t size = v4->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v7 = v4;
  int v8 = *(&v4->super.size_ + a3 + 1);
  if (a4 < 0 || (int)size <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a4);
  }
  v9 = v7;
  int v10 = *(&v7->super.size_ + a4 + 1);
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  *(&v9->super.size_ + a3 + 1) = v10;
  v11 = self->val$compact_;
  uint64_t v12 = v11->super.size_;
  if (a4 < 0 || (int)v12 <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(v12, *(uint64_t *)&a4);
  }
  *(&v11->super.size_ + a4 + 1) = v8;
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  v4 = self->val$compact_;
  if (!v4) {
    goto LABEL_15;
  }
  uint64_t size = v4->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v7 = v4;
  uint64_t v8 = *(&v4->super.size_ + a3 + 1);
  if (a4 < 0 || (int)size <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a4);
  }
  v9 = self->this$0_;
  if (!v9->pool_) {
    goto LABEL_15;
  }
  uint64_t v10 = *(&v7->super.size_ + a4 + 1);
  bytesStart = v9->bytesStart_;
  uint64_t v12 = bytesStart->super.size_;
  if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v8);
  }
  [(OrgApacheLuceneUtilByteBlockPool *)v9->pool_ setBytesRefWithOrgApacheLuceneUtilBytesRef:self->scratch1_ withInt:*((unsigned int *)&bytesStart->super.size_ + v8 + 1)];
  v13 = self->this$0_;
  v14 = v13->bytesStart_;
  uint64_t v15 = v14->super.size_;
  if ((v10 & 0x80000000) != 0 || (int)v10 >= (int)v15) {
    IOSArray_throwOutOfBoundsWithMsg(v15, v10);
  }
  [(OrgApacheLuceneUtilByteBlockPool *)v13->pool_ setBytesRefWithOrgApacheLuceneUtilBytesRef:self->scratch2_ withInt:*((unsigned int *)&v14->super.size_ + v10 + 1)];
  v16 = self->val$comp_;
  if (!v16) {
LABEL_15:
  }
    JreThrowNullPointerException();
  scratch1 = self->scratch1_;
  scratch2 = self->scratch2_;
  return [(JavaUtilComparator *)v16 compareWithId:scratch1 withId:scratch2];
}

- (void)setPivotWithInt:(int)a3
{
  v3 = self->val$compact_;
  if (!v3) {
    goto LABEL_10;
  }
  uint64_t size = v3->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v6 = self->this$0_;
  if (!v6->pool_) {
LABEL_10:
  }
    JreThrowNullPointerException();
  uint64_t v7 = *(&v3->super.size_ + a3 + 1);
  pivot = self->pivot_;
  bytesStart = v6->bytesStart_;
  uint64_t v10 = bytesStart->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v10, v7);
  }
  uint64_t v11 = *((unsigned int *)&bytesStart->super.size_ + v7 + 1);
  pool = v6->pool_;
  [(OrgApacheLuceneUtilByteBlockPool *)pool setBytesRefWithOrgApacheLuceneUtilBytesRef:pivot withInt:v11];
}

- (int)comparePivotWithInt:(int)a3
{
  v3 = self->val$compact_;
  if (!v3) {
    goto LABEL_11;
  }
  uint64_t size = v3->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v6 = self->this$0_;
  if (!v6->pool_) {
    goto LABEL_11;
  }
  uint64_t v7 = *(&v3->super.size_ + a3 + 1);
  bytesStart = v6->bytesStart_;
  uint64_t v9 = bytesStart->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v9) {
    IOSArray_throwOutOfBoundsWithMsg(v9, v7);
  }
  [(OrgApacheLuceneUtilByteBlockPool *)v6->pool_ setBytesRefWithOrgApacheLuceneUtilBytesRef:self->scratch2_ withInt:*((unsigned int *)&bytesStart->super.size_ + v7 + 1)];
  uint64_t v10 = self->val$comp_;
  if (!v10) {
LABEL_11:
  }
    JreThrowNullPointerException();
  pivot = self->pivot_;
  scratch2 = self->scratch2_;
  return [(JavaUtilComparator *)v10 compareWithId:pivot withId:scratch2];
}

- (OrgApacheLuceneUtilBytesRefHash_$1)initWithOrgApacheLuceneUtilBytesRefHash:(id)a3 withIntArray:(id)a4 withJavaUtilComparator:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilBytesRefHash__1;
  [(OrgApacheLuceneUtilBytesRefHash_$1 *)&v3 dealloc];
}

@end