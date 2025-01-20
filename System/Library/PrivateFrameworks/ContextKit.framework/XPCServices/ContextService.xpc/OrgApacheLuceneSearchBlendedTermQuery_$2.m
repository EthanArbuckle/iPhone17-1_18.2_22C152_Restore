@interface OrgApacheLuceneSearchBlendedTermQuery_$2
- (OrgApacheLuceneSearchBlendedTermQuery_$2)initWithOrgApacheLuceneIndexTermArray:(id)a3 withOrgApacheLuceneIndexTermContextArray:(id)a4 withFloatArray:(id)a5;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)swapWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneSearchBlendedTermQuery_$2

- (void)swapWithInt:(int)a3 withInt:(int)a4
{
  v4 = self->val$terms_;
  if (!v4) {
    goto LABEL_21;
  }
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v8 = a3;
  uint64_t size = v4->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v10 = (&v4->elementType_)[a3];
  if (a4 < 0 || (int)size <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a4);
  }
  IOSObjectArray_Set((uint64_t)v4, a3, (&v4->elementType_)[a4]);
  IOSObjectArray_Set((uint64_t)self->val$terms_, (int)v5, v10);
  v11 = self->val$contexts_;
  if (!v11) {
    goto LABEL_21;
  }
  uint64_t v12 = v11->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v12 <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v6);
  }
  v13 = (&v11->elementType_)[v8];
  if ((v5 & 0x80000000) != 0 || (int)v12 <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v5);
  }
  IOSObjectArray_Set((uint64_t)self->val$contexts_, v8, (&self->val$contexts_->elementType_)[(int)v5]);
  IOSObjectArray_Set((uint64_t)self->val$contexts_, (int)v5, v13);
  v14 = self->val$boosts_;
  if (!v14) {
LABEL_21:
  }
    JreThrowNullPointerException();
  uint64_t v15 = v14->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v15 <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(v15, v6);
  }
  int v16 = *(&v14->super.size_ + v8 + 1);
  if ((v5 & 0x80000000) != 0 || (int)v15 <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(v15, v5);
  }
  if ((v6 & 0x80000000) != 0 || (int)v15 <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(v15, v6);
  }
  *(&self->val$boosts_->super.size_ + v8 + 1) = *(&self->val$boosts_->super.size_ + (int)v5 + 1);
  v17 = self->val$boosts_;
  uint64_t v18 = v17->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)v18 <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v5);
  }
  *(&v17->super.size_ + (int)v5 + 1) = v16;
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  v4 = self->val$terms_;
  if (!v4) {
    goto LABEL_10;
  }
  uint64_t size = v4->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v7 = (&v4->elementType_)[a3];
  if (!v7) {
LABEL_10:
  }
    JreThrowNullPointerException();
  uint64_t v8 = self->val$terms_;
  uint64_t v9 = v8->super.size_;
  if (a4 < 0 || (int)v9 <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(v9, *(uint64_t *)&a4);
  }
  v10 = (&v8->elementType_)[a4];
  return [(IOSClass *)v7 compareToWithId:v10];
}

- (OrgApacheLuceneSearchBlendedTermQuery_$2)initWithOrgApacheLuceneIndexTermArray:(id)a3 withOrgApacheLuceneIndexTermContextArray:(id)a4 withFloatArray:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBlendedTermQuery__2;
  [(OrgApacheLuceneSearchBlendedTermQuery_$2 *)&v3 dealloc];
}

@end