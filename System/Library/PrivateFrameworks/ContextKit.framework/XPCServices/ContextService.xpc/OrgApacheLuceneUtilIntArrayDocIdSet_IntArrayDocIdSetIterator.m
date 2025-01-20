@interface OrgApacheLuceneUtilIntArrayDocIdSet_IntArrayDocIdSetIterator
- (OrgApacheLuceneUtilIntArrayDocIdSet_IntArrayDocIdSetIterator)initWithIntArray:(id)a3 withInt:(int)a4;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilIntArrayDocIdSet_IntArrayDocIdSetIterator

- (OrgApacheLuceneUtilIntArrayDocIdSet_IntArrayDocIdSetIterator)initWithIntArray:(id)a3 withInt:(int)a4
{
  self->i_ = -1;
  self->doc_ = -1;
  JreStrongAssign((id *)&self->docs_, a3);
  self->length_ = a4;
  return self;
}

- (int)docID
{
  return self->doc_;
}

- (int)nextDoc
{
  docs = self->docs_;
  if (!docs) {
    JreThrowNullPointerException();
  }
  int i = self->i_;
  int v5 = i + 1;
  self->i_ = i + 1;
  uint64_t size = docs->super.size_;
  if (i + 1 < 0 || v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (i + 1));
  }
  int result = *(&docs->super.size_ + v5 + 1);
  self->doc_ = result;
  return result;
}

- (int)advanceWithInt:(int)a3
{
  int v4 = JavaUtilArrays_binarySearchWithIntArray_withInt_withInt_withInt_((uint64_t)self->docs_, (self->i_ + 1), self->length_, a3);
  uint64_t v5 = v4 ^ (v4 >> 31);
  self->i_ = v5;
  docs = self->docs_;
  if (!docs) {
    JreThrowNullPointerException();
  }
  uint64_t size = docs->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  int result = *(&docs->super.size_ + (int)v5 + 1);
  self->doc_ = result;
  return result;
}

- (int64_t)cost
{
  return self->length_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilIntArrayDocIdSet_IntArrayDocIdSetIterator;
  [(OrgApacheLuceneUtilIntArrayDocIdSet_IntArrayDocIdSetIterator *)&v3 dealloc];
}

@end