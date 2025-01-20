@interface OrgApacheLuceneUtilPackedPackedLongValues_Iterator
- (BOOL)hasNext;
- (OrgApacheLuceneUtilPackedPackedLongValues_Iterator)initWithOrgApacheLuceneUtilPackedPackedLongValues:(id)a3;
- (int64_t)next;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedPackedLongValues_Iterator

- (OrgApacheLuceneUtilPackedPackedLongValues_Iterator)initWithOrgApacheLuceneUtilPackedPackedLongValues:(id)a3
{
  return self;
}

- (BOOL)hasNext
{
  return self->pOff_ < self->currentCount_;
}

- (int64_t)next
{
  currentValues = self->currentValues_;
  if (!currentValues) {
    JreThrowNullPointerException();
  }
  int pOff = self->pOff_;
  self->pOff_ = pOff + 1;
  uint64_t size = currentValues->super.size_;
  if (pOff < 0 || pOff >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pOff);
  }
  int64_t v6 = currentValues->buffer_[pOff];
  if (pOff + 1 == self->currentCount_)
  {
    *(void *)&self->vOff_ = (self->vOff_ + 1);
    sub_1000D1464((uint64_t)self);
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedPackedLongValues_Iterator;
  [(OrgApacheLuceneUtilPackedPackedLongValues_Iterator *)&v3 dealloc];
}

@end