@interface ComAppleProactiveOrgApacheLuceneUtilOpenBitSetIterator
- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSetIterator)initWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3;
- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSetIterator)initWithLongArray:(id)a3 withInt:(int)a4;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation ComAppleProactiveOrgApacheLuceneUtilOpenBitSetIterator

- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSetIterator)initWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3
{
  return self;
}

- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSetIterator)initWithLongArray:(id)a3 withInt:(int)a4
{
  self->i_ = -1;
  self->curDocId_ = -1;
  JreStrongAssign((id *)&self->arr_, a3);
  self->words_ = a4;
  return self;
}

- (int)nextDoc
{
  unsigned int indexArray = self->indexArray_;
  if (indexArray) {
    goto LABEL_12;
  }
  unint64_t word = self->word_;
  if (word)
  {
    self->word_ = word >> 8;
    self->wordShift_ += 8;
    if (word > 0xFF)
    {
LABEL_11:
      sub_100010040(self);
      unsigned int indexArray = self->indexArray_;
LABEL_12:
      int v9 = self->wordShift_ + (indexArray & 0xF);
      self->indexArray_ = indexArray >> 4;
      int result = v9 + (self->i_ << 6);
      goto LABEL_13;
    }
  }
  while (1)
  {
    uint64_t v5 = (self->i_ + 1);
    self->i_ = v5;
    if ((int)v5 >= self->words_) {
      break;
    }
    arr = self->arr_;
    if (!arr) {
      JreThrowNullPointerException();
    }
    uint64_t size = arr->super.size_;
    if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v5);
    }
    int64_t v8 = arr->buffer_[(int)v5];
    self->word_ = v8;
    self->wordShift_ = -1;
    if (v8) {
      goto LABEL_11;
    }
  }
  int result = 0x7FFFFFFF;
LABEL_13:
  self->curDocId_ = result;
  return result;
}

- (int)advanceWithInt:(int)a3
{
  self->indexArray_ = 0;
  self->i_ = a3 >> 6;
  if (a3 >> 6 >= self->words_)
  {
    self->word_ = 0;
LABEL_15:
    int result = 0x7FFFFFFF;
    goto LABEL_17;
  }
  int v4 = a3 & 0x3F;
  self->wordShift_ = v4;
  arr = self->arr_;
  if (!arr) {
    JreThrowNullPointerException();
  }
  int i = self->i_;
  uint64_t size = arr->super.size_;
  if (i < 0 || i >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, i);
  }
  int64_t v8 = (unint64_t)arr->buffer_[i] >> v4;
  self->word_ = v8;
  if (!v8)
  {
    while (1)
    {
      uint64_t v13 = (self->i_ + 1);
      self->i_ = v13;
      if ((int)v13 >= self->words_) {
        goto LABEL_15;
      }
      v10 = self->arr_;
      uint64_t v11 = v10->super.size_;
      if ((v13 & 0x80000000) != 0 || (int)v13 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v13);
      }
      int64_t v12 = v10->buffer_[(int)v13];
      self->word_ = v12;
      if (v12)
      {
        int v9 = -1;
        goto LABEL_16;
      }
    }
  }
  int v9 = v4 - 1;
LABEL_16:
  self->wordShift_ = v9;
  sub_100010040(self);
  int v15 = (self->indexArray_ & 0xF) + self->wordShift_;
  self->indexArray_ = self->indexArray_ >> 4;
  int result = v15 + (self->i_ << 6);
LABEL_17:
  self->curDocId_ = result;
  return result;
}

- (int)docID
{
  return self->curDocId_;
}

- (int64_t)cost
{
  return (uint64_t)(self->words_ + (self->words_ < 0 ? 0x3F : 0)) >> 6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveOrgApacheLuceneUtilOpenBitSetIterator;
  [(ComAppleProactiveOrgApacheLuceneUtilOpenBitSetIterator *)&v3 dealloc];
}

@end