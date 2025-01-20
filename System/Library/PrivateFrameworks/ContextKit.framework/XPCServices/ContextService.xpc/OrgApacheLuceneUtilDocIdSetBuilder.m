@interface OrgApacheLuceneUtilDocIdSetBuilder
- (OrgApacheLuceneUtilDocIdSetBuilder)initWithInt:(int)a3;
- (id)build;
- (id)buildWithLong:(int64_t)a3;
- (void)addWithInt:(int)a3;
- (void)addWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)dealloc;
- (void)growBufferWithInt:(int)a3;
- (void)growWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilDocIdSetBuilder

- (OrgApacheLuceneUtilDocIdSetBuilder)initWithInt:(int)a3
{
  return self;
}

- (void)growBufferWithInt:(int)a3
{
  sub_1000E6B0C((char *)self, a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (void)addWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  if (!a3) {
    goto LABEL_22;
  }
  -[OrgApacheLuceneUtilDocIdSetBuilder growWithInt:](self, "growWithInt:", JavaLangMath_minWithLong_withLong_(0x7FFFFFFFLL, (uint64_t)[a3 cost]));
  bitSet = self->bitSet_;
  if (bitSet)
  {
    [(OrgApacheLuceneUtilBitSet *)bitSet or__WithOrgApacheLuceneSearchDocIdSetIterator:a3];
  }
  else
  {
    while (1)
    {
      int size = self->buffer_->super.size_;
      int bufferSize = self->bufferSize_;
      if (bufferSize < size)
      {
        while (1)
        {
          unsigned int v14 = [a3 nextDoc];
          if (v14 == 0x7FFFFFFF) {
            break;
          }
          unsigned int v15 = v14;
          buffer = self->buffer_;
          int v17 = self->bufferSize_;
          self->bufferSize_ = v17 + 1;
          uint64_t v18 = buffer->super.size_;
          if (v17 < 0 || v17 >= (int)v18) {
            IOSArray_throwOutOfBoundsWithMsg(v18, v17);
          }
          *(&buffer->super.size_ + v17 + 1) = v15;
          if (size == ++bufferSize) {
            goto LABEL_13;
          }
        }
        self->bufferSize_ = bufferSize;
        return;
      }
LABEL_13:
      self->bufferSize_ = size;
      if (size + 1 >= self->threshold_) {
        break;
      }
      sub_1000E6B0C((char *)self, size + 1, v5, v6, v7, v8, v9, v10);
    }
    sub_1000E6A38((uint64_t)self);
    id v19 = [a3 nextDoc];
    if (v19 != 0x7FFFFFFF)
    {
      id v20 = v19;
      while (1)
      {
        v21 = self->bitSet_;
        if (!v21) {
          break;
        }
        [(OrgApacheLuceneUtilBitSet *)v21 setWithInt:v20];
        id v20 = [a3 nextDoc];
        if (v20 == 0x7FFFFFFF) {
          return;
        }
      }
LABEL_22:
      JreThrowNullPointerException();
    }
  }
}

- (void)growWithInt:(int)a3
{
  if (!self->bitSet_)
  {
    signed int v8 = self->bufferSize_ + a3;
    if (v8 >= self->threshold_) {
      sub_1000E6A38((uint64_t)self);
    }
    else {
      sub_1000E6B0C((char *)self, v8, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
    }
  }
}

- (void)addWithInt:(int)a3
{
  uint64_t v8 = *(void *)&a3;
  bitSet = self->bitSet_;
  if (bitSet)
  {
LABEL_2:
    [(OrgApacheLuceneUtilBitSet *)bitSet setWithInt:v8];
    return;
  }
  buffer = self->buffer_;
  if (!buffer) {
LABEL_13:
  }
    JreThrowNullPointerException();
  int bufferSize = self->bufferSize_;
  signed int v13 = bufferSize + 1;
  if (bufferSize + 1 <= buffer->super.size_) {
    goto LABEL_9;
  }
  if (v13 >= self->threshold_)
  {
    sub_1000E6A38((uint64_t)self);
    bitSet = self->bitSet_;
    if (bitSet) {
      goto LABEL_2;
    }
    goto LABEL_13;
  }
  sub_1000E6B0C((char *)self, v13, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  buffer = self->buffer_;
  int bufferSize = self->bufferSize_;
  signed int v13 = bufferSize + 1;
LABEL_9:
  self->bufferSize_ = v13;
  uint64_t size = buffer->super.size_;
  if (bufferSize < 0 || bufferSize >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, bufferSize);
  }
  *(&buffer->super.size_ + bufferSize + 1) = v8;
}

- (id)build
{
  return [(OrgApacheLuceneUtilDocIdSetBuilder *)self buildWithLong:-1];
}

- (id)buildWithLong:(int64_t)a3
{
  p_bitSet = &self->bitSet_;
  bitSet = self->bitSet_;
  if (bitSet)
  {
    if (a3 == -1) {
      uint64_t v6 = new_OrgApacheLuceneUtilBitDocIdSet_initWithOrgApacheLuceneUtilBitSet_(bitSet);
    }
    else {
      uint64_t v6 = new_OrgApacheLuceneUtilBitDocIdSet_initWithOrgApacheLuceneUtilBitSet_withLong_(bitSet, a3);
    }
    v23 = v6;
    goto LABEL_26;
  }
  p_buffer = (unsigned int **)&self->buffer_;
  [new_OrgApacheLuceneUtilLSBRadixSorter_init() sortWithIntArray:self->buffer_ withInt:0 withInt:self->bufferSize_];
  uint64_t bufferSize = self->bufferSize_;
  v29 = p_bitSet;
  if (bufferSize)
  {
    buffer = self->buffer_;
    if (!buffer) {
      goto LABEL_27;
    }
    uint64_t size = buffer->super.size_;
    if ((int)size < 1) {
      IOSArray_throwOutOfBoundsWithMsg(size, 0);
    }
    if ((int)bufferSize <= 1)
    {
      uint64_t v19 = 1;
    }
    else
    {
      int v17 = *(&buffer->super.size_ + 1);
      uint64_t v18 = 1;
      uint64_t v19 = 1;
      do
      {
        uint64_t v20 = buffer->super.size_;
        if (v18 >= v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, v18);
        }
        int v21 = *(&buffer->super.size_ + v18 + 1);
        if (v21 != v17)
        {
          uint64_t v22 = buffer->super.size_;
          if ((v19 & 0x80000000) != 0 || (int)v19 >= (int)v22) {
            IOSArray_throwOutOfBoundsWithMsg(v22, v19);
          }
          *(&buffer->super.size_ + (int)v19 + 1) = v21;
          uint64_t v19 = (v19 + 1);
          int v17 = v21;
        }
        ++v18;
      }
      while (bufferSize != v18);
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  p_bitSet = v29;
  v24 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_(*p_buffer, (int)v19 + 1, v8, v9, v10, v11, v12, v13);
  JreStrongAssign((id *)&self->buffer_, v24);
  v25 = *p_buffer;
  if (!*p_buffer) {
LABEL_27:
  }
    JreThrowNullPointerException();
  uint64_t v26 = v25[2];
  if ((v19 & 0x80000000) != 0 || (int)v19 >= (int)v26) {
    IOSArray_throwOutOfBoundsWithMsg(v26, v19);
  }
  v25[(int)v19 + 3] = 0x7FFFFFFF;
  v23 = new_OrgApacheLuceneUtilIntArrayDocIdSet_initWithIntArray_withInt_(*p_buffer, v19);
LABEL_26:
  v27 = v23;
  JreStrongAssign((id *)&self->buffer_, 0);
  self->bufferSize_ = 0;
  JreStrongAssign((id *)p_bitSet, 0);
  return v27;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilDocIdSetBuilder;
  [(OrgApacheLuceneUtilDocIdSetBuilder *)&v3 dealloc];
}

@end