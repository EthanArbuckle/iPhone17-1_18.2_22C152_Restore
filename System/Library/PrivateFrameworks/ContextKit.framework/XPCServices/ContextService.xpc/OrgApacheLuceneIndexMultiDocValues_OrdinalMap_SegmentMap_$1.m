@interface OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap_$1
- (OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap_$1)initWithIntArray:(id)a3 withLongArray:(id)a4;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)swapWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap_$1

- (void)swapWithInt:(int)a3 withInt:(int)a4
{
  v4 = self->val$newToOld_;
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
  v11 = self->val$newToOld_;
  uint64_t v12 = v11->super.size_;
  if (a4 < 0 || (int)v12 <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(v12, *(uint64_t *)&a4);
  }
  *(&v11->super.size_ + a4 + 1) = v8;
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  v4 = self->val$weights_;
  if (!v4 || (v6 = self->val$newToOld_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t size = v6->super.size_;
  if (a4 < 0 || (int)size <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a4);
  }
  int v8 = *(&v6->super.size_ + a4 + 1);
  uint64_t v9 = v4->super.size_;
  if (v8 < 0 || v8 >= (int)v9) {
    IOSArray_throwOutOfBoundsWithMsg(v9, v8);
  }
  uint64_t v10 = v4->buffer_[v8];
  v11 = self->val$weights_;
  uint64_t v12 = self->val$newToOld_;
  uint64_t v13 = v12->super.size_;
  if (a3 < 0 || (int)v13 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v13, *(uint64_t *)&a3);
  }
  int v14 = *(&v12->super.size_ + a3 + 1);
  uint64_t v15 = v11->super.size_;
  if (v14 < 0 || v14 >= (int)v15) {
    IOSArray_throwOutOfBoundsWithMsg(v15, v14);
  }
  uint64_t v16 = v11->buffer_[v14];
  return JavaLangLong_compareWithLong_withLong_(v10, v16);
}

- (OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap_$1)initWithIntArray:(id)a3 withLongArray:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap__1;
  [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap_$1 *)&v3 dealloc];
}

@end