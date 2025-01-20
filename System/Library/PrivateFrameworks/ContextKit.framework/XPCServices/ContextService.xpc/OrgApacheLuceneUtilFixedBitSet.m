@interface OrgApacheLuceneUtilFixedBitSet
+ (id)ensureCapacityWithOrgApacheLuceneUtilFixedBitSet:(id)a3 withInt:(int)a4;
+ (int)bits2wordsWithInt:(int)a3;
+ (int64_t)andNotCountWithOrgApacheLuceneUtilFixedBitSet:(id)a3 withOrgApacheLuceneUtilFixedBitSet:(id)a4;
+ (int64_t)intersectionCountWithOrgApacheLuceneUtilFixedBitSet:(id)a3 withOrgApacheLuceneUtilFixedBitSet:(id)a4;
+ (int64_t)unionCountWithOrgApacheLuceneUtilFixedBitSet:(id)a3 withOrgApacheLuceneUtilFixedBitSet:(id)a4;
+ (void)initialize;
- (BOOL)getAndClearWithInt:(int)a3;
- (BOOL)getAndSetWithInt:(int)a3;
- (BOOL)getWithInt:(int)a3;
- (BOOL)intersectsWithOrgApacheLuceneUtilFixedBitSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)scanIsEmpty;
- (BOOL)verifyGhostBitsClear;
- (OrgApacheLuceneUtilFixedBitSet)initWithInt:(int)a3;
- (OrgApacheLuceneUtilFixedBitSet)initWithLongArray:(id)a3 withInt:(int)a4;
- (OrgApacheLuceneUtilFixedBitSet)setWithInt:(int)a3;
- (OrgApacheLuceneUtilFixedBitSet)setWithInt:(int)a3 withInt:(int)a4;
- (id)clone;
- (id)getBits;
- (int)cardinality;
- (int)length;
- (int)nextSetBitWithInt:(int)a3;
- (int)prevSetBitWithInt:(int)a3;
- (int64_t)ramBytesUsed;
- (unint64_t)hash;
- (void)andNotWithLongArray:(id)a3 withInt:(int)a4;
- (void)andNotWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)andNotWithOrgApacheLuceneUtilFixedBitSet:(id)a3;
- (void)and__WithLongArray:(id)a3 withInt:(int)a4;
- (void)and__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)and__WithOrgApacheLuceneUtilFixedBitSet:(id)a3;
- (void)clearWithInt:(int)a3;
- (void)clearWithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)flipWithInt:(int)a3;
- (void)flipWithInt:(int)a3 withInt:(int)a4;
- (void)or__WithLongArray:(id)a3 withInt:(int)a4;
- (void)or__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)or__WithOrgApacheLuceneUtilFixedBitSet:(id)a3;
- (void)xor__WithLongArray:(id)a3 withInt:(int)a4;
- (void)xor__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)xor__WithOrgApacheLuceneUtilFixedBitSet:(id)a3;
@end

@implementation OrgApacheLuceneUtilFixedBitSet

+ (id)ensureCapacityWithOrgApacheLuceneUtilFixedBitSet:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilFixedBitSet_ensureCapacityWithOrgApacheLuceneUtilFixedBitSet_withInt_(a3, a4);
}

+ (int)bits2wordsWithInt:(int)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilFixedBitSet__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return ((a3 - 1) >> 6) + 1;
}

+ (int64_t)intersectionCountWithOrgApacheLuceneUtilFixedBitSet:(id)a3 withOrgApacheLuceneUtilFixedBitSet:(id)a4
{
  return OrgApacheLuceneUtilFixedBitSet_intersectionCountWithOrgApacheLuceneUtilFixedBitSet_withOrgApacheLuceneUtilFixedBitSet_((uint64_t)a3, (uint64_t)a4);
}

+ (int64_t)unionCountWithOrgApacheLuceneUtilFixedBitSet:(id)a3 withOrgApacheLuceneUtilFixedBitSet:(id)a4
{
  return OrgApacheLuceneUtilFixedBitSet_unionCountWithOrgApacheLuceneUtilFixedBitSet_withOrgApacheLuceneUtilFixedBitSet_((uint64_t)a3, (uint64_t)a4);
}

+ (int64_t)andNotCountWithOrgApacheLuceneUtilFixedBitSet:(id)a3 withOrgApacheLuceneUtilFixedBitSet:(id)a4
{
  return OrgApacheLuceneUtilFixedBitSet_andNotCountWithOrgApacheLuceneUtilFixedBitSet_withOrgApacheLuceneUtilFixedBitSet_((uint64_t)a3, (uint64_t)a4);
}

- (OrgApacheLuceneUtilFixedBitSet)initWithInt:(int)a3
{
  return self;
}

- (OrgApacheLuceneUtilFixedBitSet)initWithLongArray:(id)a3 withInt:(int)a4
{
  return self;
}

- (BOOL)verifyGhostBitsClear
{
  bits = self->bits_;
  if (!bits) {
LABEL_15:
  }
    JreThrowNullPointerException();
  uint64_t numWords = self->numWords_;
  while (1)
  {
    uint64_t size = bits->super.size_;
    if (numWords >= size) {
      break;
    }
    if (numWords < 0) {
      IOSArray_throwOutOfBoundsWithMsg(size, numWords);
    }
    if (bits->buffer_[numWords]) {
      return 0;
    }
    ++numWords;
    bits = self->bits_;
    if (!bits) {
      goto LABEL_15;
    }
  }
  if ((self->numBits_ & 0x3F) == 0) {
    return 1;
  }
  int v6 = self->numWords_ - 1;
  if (v6 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  return (bits->buffer_[v6] & (-1 << (self->numBits_ & 0x3F))) == 0;
}

- (int)length
{
  return self->numBits_;
}

- (int64_t)ramBytesUsed
{
  uint64_t v2 = qword_100560460;
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)self->bits_) + v2;
}

- (id)getBits
{
  return self->bits_;
}

- (int)cardinality
{
  return OrgApacheLuceneUtilBitUtil_pop_arrayWithLongArray_withInt_withInt_((uint64_t)self->bits_, 0, self->numWords_);
}

- (BOOL)getWithInt:(int)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int v4 = a3 >> 6;
  uint64_t size = bits->super.size_;
  if (a3 < 0 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
  }
  return ((unint64_t)bits->buffer_[v4] >> a3) & 1;
}

- (OrgApacheLuceneUtilFixedBitSet)setWithInt:(int)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int v4 = a3 >> 6;
  result = (OrgApacheLuceneUtilFixedBitSet *)bits->super.size_;
  if (a3 < 0 || v4 >= (int)result) {
    IOSArray_throwOutOfBoundsWithMsg((uint64_t)result, (a3 >> 6));
  }
  bits->buffer_[v4] |= 1 << a3;
  return result;
}

- (BOOL)getAndSetWithInt:(int)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int v4 = a3 >> 6;
  uint64_t size = bits->super.size_;
  if (a3 < 0 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
  }
  int v6 = bits;
  int64_t v7 = bits->buffer_[v4];
  if (a3 < 0 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
  }
  BOOL result = (v7 & (1 << a3)) != 0;
  v6->buffer_[v4] |= 1 << a3;
  return result;
}

- (void)clearWithInt:(int)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int v4 = a3 >> 6;
  uint64_t size = bits->super.size_;
  if (a3 < 0 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
  }
  bits->buffer_[v4] &= ~(1 << a3);
}

- (BOOL)getAndClearWithInt:(int)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int v4 = a3 >> 6;
  uint64_t size = bits->super.size_;
  if (a3 < 0 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
  }
  int v6 = bits;
  int64_t v7 = bits->buffer_[v4];
  if (a3 < 0 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
  }
  BOOL result = (v7 & (1 << a3)) != 0;
  v6->buffer_[v4] &= ~(1 << a3);
  return result;
}

- (int)nextSetBitWithInt:(int)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int v4 = a3;
  int v6 = a3 >> 6;
  uint64_t size = bits->super.size_;
  if (a3 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
  }
  uint64_t v8 = bits->buffer_[v6] >> a3;
  if (v8) {
    return JavaLangLong_numberOfTrailingZerosWithLong_(v8) + v4;
  }
  uint64_t v10 = v6 + 1;
  int v4 = v6 << 6;
  while (v10 < self->numWords_)
  {
    v11 = self->bits_;
    uint64_t v12 = v11->super.size_;
    if (v10 - 1 < -1 || v10 >= (int)v12) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v10);
    }
    uint64_t v8 = v11->buffer_[v10++];
    v4 += 64;
    if (v8) {
      return JavaLangLong_numberOfTrailingZerosWithLong_(v8) + v4;
    }
  }
  return 0x7FFFFFFF;
}

- (int)prevSetBitWithInt:(int)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int v4 = a3;
  int v6 = a3 >> 6;
  uint64_t size = bits->super.size_;
  if (a3 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
  }
  unint64_t v8 = bits->buffer_[v6] << (a3 & 0x3F ^ 0x3Fu);
  if (v8) {
    return v4 - JavaLangLong_numberOfLeadingZerosWithLong_(v8);
  }
  int v4 = (v6 << 6) | 0x3F;
  while (v6 >= 1)
  {
    uint64_t v10 = self->bits_;
    uint64_t v11 = v10->super.size_;
    if (v6 > (int)v11) {
      IOSArray_throwOutOfBoundsWithMsg(v11, (v6 - 1));
    }
    unint64_t v8 = v10->buffer_[v6 - 1];
    v4 -= 64;
    --v6;
    if (v8) {
      return v4 - JavaLangLong_numberOfLeadingZerosWithLong_(v8);
    }
  }
  return -1;
}

- (void)or__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  if (OrgApacheLuceneUtilBitSetIterator_getFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)a3))
  {
    [(OrgApacheLuceneUtilBitSet *)self assertUnpositionedWithOrgApacheLuceneSearchDocIdSetIterator:a3];
    id FixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator = OrgApacheLuceneUtilBitSetIterator_getFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)a3);
    [(OrgApacheLuceneUtilFixedBitSet *)self or__WithOrgApacheLuceneUtilFixedBitSet:FixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)OrgApacheLuceneUtilFixedBitSet;
    [(OrgApacheLuceneUtilBitSet *)&v6 or__WithOrgApacheLuceneSearchDocIdSetIterator:a3];
  }
}

- (void)or__WithOrgApacheLuceneUtilFixedBitSet:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((void *)a3 + 1);
  int v4 = *((_DWORD *)a3 + 5);
  sub_1000F80F8((uint64_t)self, v3, v4);
}

- (void)or__WithLongArray:(id)a3 withInt:(int)a4
{
}

- (void)xor__WithOrgApacheLuceneUtilFixedBitSet:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((void *)a3 + 1);
  int v4 = *((_DWORD *)a3 + 5);
  sub_1000F823C((uint64_t)self, v3, v4);
}

- (void)xor__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  -[OrgApacheLuceneUtilBitSet assertUnpositionedWithOrgApacheLuceneSearchDocIdSetIterator:](self, "assertUnpositionedWithOrgApacheLuceneSearchDocIdSetIterator:");
  if (OrgApacheLuceneUtilBitSetIterator_getFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)a3))
  {
    id FixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator = OrgApacheLuceneUtilBitSetIterator_getFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)a3);
    [(OrgApacheLuceneUtilFixedBitSet *)self xor__WithOrgApacheLuceneUtilFixedBitSet:FixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator];
  }
  else
  {
    if (!a3) {
      JreThrowNullPointerException();
    }
    id v6 = [a3 nextDoc];
    if ((int)v6 < self->numBits_)
    {
      id v7 = v6;
      do
      {
        [(OrgApacheLuceneUtilFixedBitSet *)self flipWithInt:v7];
        id v7 = [a3 nextDoc];
      }
      while ((int)v7 < self->numBits_);
    }
  }
}

- (void)xor__WithLongArray:(id)a3 withInt:(int)a4
{
}

- (void)and__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  if (OrgApacheLuceneUtilBitSetIterator_getFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)a3))
  {
    [(OrgApacheLuceneUtilBitSet *)self assertUnpositionedWithOrgApacheLuceneSearchDocIdSetIterator:a3];
    id FixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator = OrgApacheLuceneUtilBitSetIterator_getFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)a3);
    [(OrgApacheLuceneUtilFixedBitSet *)self and__WithOrgApacheLuceneUtilFixedBitSet:FixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)OrgApacheLuceneUtilFixedBitSet;
    [(OrgApacheLuceneUtilBitSet *)&v6 and__WithOrgApacheLuceneSearchDocIdSetIterator:a3];
  }
}

- (BOOL)intersectsWithOrgApacheLuceneUtilFixedBitSet:(id)a3
{
  if (!a3) {
LABEL_12:
  }
    JreThrowNullPointerException();
  uint64_t v5 = JavaLangMath_minWithInt_withInt_(self->numWords_, *((_DWORD *)a3 + 5)) - 1;
  do
  {
    unsigned int v6 = v5;
    if ((v5 & 0x80000000) != 0) {
      break;
    }
    bits = self->bits_;
    if (!bits) {
      goto LABEL_12;
    }
    uint64_t size = bits->super.size_;
    if ((int)v5 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v5);
    }
    int64_t v9 = bits->buffer_[v5];
    uint64_t v10 = *((void *)a3 + 1);
    uint64_t v11 = *(unsigned int *)(v10 + 8);
    if ((int)v5 >= (int)v11) {
      IOSArray_throwOutOfBoundsWithMsg(v11, v5);
    }
    uint64_t v5 = (v5 - 1);
  }
  while ((*(void *)(v10 + 16 + 8 * v6) & v9) == 0);
  return (v6 & 0x80000000) == 0;
}

- (void)and__WithOrgApacheLuceneUtilFixedBitSet:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((void *)a3 + 1);
  uint64_t v4 = *((unsigned int *)a3 + 5);
  sub_1000F85C8((uint64_t)self, v3, v4);
}

- (void)and__WithLongArray:(id)a3 withInt:(int)a4
{
}

- (void)andNotWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  if (OrgApacheLuceneUtilBitSetIterator_getFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)a3))
  {
    [(OrgApacheLuceneUtilBitSet *)self assertUnpositionedWithOrgApacheLuceneSearchDocIdSetIterator:a3];
    id FixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator = OrgApacheLuceneUtilBitSetIterator_getFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)a3);
    [(OrgApacheLuceneUtilFixedBitSet *)self andNotWithOrgApacheLuceneUtilFixedBitSet:FixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)OrgApacheLuceneUtilFixedBitSet;
    [(OrgApacheLuceneUtilBitSet *)&v6 andNotWithOrgApacheLuceneSearchDocIdSetIterator:a3];
  }
}

- (void)andNotWithOrgApacheLuceneUtilFixedBitSet:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((void *)a3 + 1);
  int v4 = *((_DWORD *)a3 + 5);
  sub_1000F87FC((uint64_t)self, v3, v4);
}

- (void)andNotWithLongArray:(id)a3 withInt:(int)a4
{
}

- (BOOL)scanIsEmpty
{
  int numWords = self->numWords_;
  if (numWords < 1)
  {
    return 1;
  }
  else
  {
    uint64_t v4 = 0;
    BOOL v5 = 0;
    do
    {
      bits = self->bits_;
      if (!bits) {
        JreThrowNullPointerException();
      }
      uint64_t size = bits->super.size_;
      if ((int)v4 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v4);
      }
      if (bits->buffer_[v4]) {
        break;
      }
      BOOL v5 = (int)++v4 >= numWords;
    }
    while (numWords != v4);
  }
  return v5;
}

- (void)flipWithInt:(int)a3 withInt:(int)a4
{
  if (a4 > a3)
  {
    int v5 = a3 >> 6;
    uint64_t v6 = -1 << a3;
    unint64_t v7 = 0xFFFFFFFFFFFFFFFFLL >> -(char)a4;
    if (a3 >> 6 == (a4 - 1) >> 6)
    {
      bits = self->bits_;
      if (bits)
      {
        v7 &= v6;
        uint64_t v9 = v5;
        uint64_t size = bits->super.size_;
        if (a3 < 0 || v5 >= (int)size)
        {
          uint64_t v11 = (a3 >> 6);
          goto LABEL_24;
        }
LABEL_20:
        bits->buffer_[v9] ^= v7;
        return;
      }
    }
    else
    {
      uint64_t v12 = self->bits_;
      if (v12)
      {
        uint64_t v11 = ((a4 - 1) >> 6);
        uint64_t v13 = v12->super.size_;
        if (a3 < 0 || v5 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, (a3 >> 6));
        }
        v12->buffer_[v5] ^= v6;
        if (v5 + 1 >= (int)v11)
        {
          uint64_t v9 = (int)v11;
        }
        else
        {
          uint64_t v14 = v5 + 1;
          uint64_t v9 = (int)v11;
          do
          {
            v15 = self->bits_;
            uint64_t v16 = v15->super.size_;
            if (v5 < -1 || v14 >= (int)v16) {
              IOSArray_throwOutOfBoundsWithMsg(v16, (v5 + 1));
            }
            self->bits_->buffer_[v14] = ~v15->buffer_[v14];
            ++v14;
            ++v5;
          }
          while ((int)v11 != v14);
        }
        bits = self->bits_;
        uint64_t size = bits->super.size_;
        if (a4 < 1 || (int)v11 >= (int)size) {
LABEL_24:
        }
          IOSArray_throwOutOfBoundsWithMsg(size, v11);
        goto LABEL_20;
      }
    }
    JreThrowNullPointerException();
  }
}

- (void)flipWithInt:(int)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int v4 = a3 >> 6;
  uint64_t size = bits->super.size_;
  if (a3 < 0 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
  }
  bits->buffer_[v4] ^= 1 << a3;
}

- (OrgApacheLuceneUtilFixedBitSet)setWithInt:(int)a3 withInt:(int)a4
{
  if (a4 > a3)
  {
    uint64_t v9 = self;
    int v10 = a3 >> 6;
    uint64_t v11 = -1 << a3;
    unint64_t v12 = 0xFFFFFFFFFFFFFFFFLL >> -(char)a4;
    if (a3 >> 6 == (a4 - 1) >> 6)
    {
      bits = self->bits_;
      if (bits)
      {
        v12 &= v11;
        self = (OrgApacheLuceneUtilFixedBitSet *)bits->super.size_;
        if (a3 < 0 || v10 >= (int)self) {
          IOSArray_throwOutOfBoundsWithMsg((uint64_t)self, (a3 >> 6));
        }
LABEL_13:
        bits->buffer_[v10] |= v12;
        return self;
      }
    }
    else
    {
      uint64_t v14 = self->bits_;
      if (v14)
      {
        uint64_t v15 = ((a4 - 1) >> 6);
        uint64_t size = v14->super.size_;
        if (a3 < 0 || v10 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
        }
        v14->buffer_[v10] |= v11;
        JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)v9->bits_, (v10 + 1), v15, -1, v4, v5, v6, v7);
        bits = v9->bits_;
        self = (OrgApacheLuceneUtilFixedBitSet *)bits->super.size_;
        if (a4 < 1 || (int)v15 >= (int)self) {
          IOSArray_throwOutOfBoundsWithMsg((uint64_t)self, v15);
        }
        int v10 = v15;
        goto LABEL_13;
      }
    }
    JreThrowNullPointerException();
  }
  return self;
}

- (void)clearWithInt:(int)a3 withInt:(int)a4
{
  if (a4 > a3)
  {
    int v10 = a3 >> 6;
    uint64_t v11 = ~(-1 << a3);
    unint64_t v12 = ~(0xFFFFFFFFFFFFFFFFLL >> -(char)a4);
    if (a3 >> 6 == (a4 - 1) >> 6)
    {
      bits = self->bits_;
      if (bits)
      {
        v12 |= v11;
        uint64_t size = bits->super.size_;
        if (a3 < 0 || v10 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
        }
LABEL_13:
        bits->buffer_[v10] &= v12;
        return;
      }
    }
    else
    {
      uint64_t v15 = self->bits_;
      if (v15)
      {
        uint64_t v16 = ((a4 - 1) >> 6);
        uint64_t v17 = v15->super.size_;
        if (a3 < 0 || v10 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (a3 >> 6));
        }
        v15->buffer_[v10] &= v11;
        JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)self->bits_, (v10 + 1), v16, 0, v4, v5, v6, v7);
        bits = self->bits_;
        uint64_t v18 = bits->super.size_;
        if (a4 < 1 || (int)v16 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v16);
        }
        int v10 = v16;
        goto LABEL_13;
      }
    }
    JreThrowNullPointerException();
  }
}

- (id)clone
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = self;
  uint64_t v4 = +[IOSLongArray arrayWithLength:bits->super.size_];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v3->bits_, 0, v4, 0, v3->numWords_);
  LODWORD(v3) = v3->numBits_;
  uint64_t v5 = [OrgApacheLuceneUtilFixedBitSet alloc];
  OrgApacheLuceneUtilFixedBitSet_initWithLongArray_withInt_((uint64_t)v5, v4, (int)v3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (self->numBits_ != *((_DWORD *)a3 + 4)) {
    return 0;
  }
  bits = self->bits_;
  uint64_t v6 = *((void *)a3 + 1);
  return JavaUtilArrays_equalsWithLongArray_withLongArray_((uint64_t)bits, v6);
}

- (unint64_t)hash
{
  int numWords = self->numWords_;
  uint64_t v3 = (numWords - 1);
  if (numWords - 1 < 0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    do
    {
      bits = self->bits_;
      if (!bits) {
        JreThrowNullPointerException();
      }
      uint64_t size = bits->super.size_;
      if ((int)v3 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v3);
      }
      uint64_t v5 = __ROR8__(bits->buffer_[v3] ^ v5, 63);
      --numWords;
      --v3;
    }
    while (numWords > 0);
  }
  return (uint64_t)((v5 & 0xFFFFFFFF00000000 ^ (v5 << 32)) - 0x6789EDCC00000000) >> 32;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFixedBitSet;
  [(OrgApacheLuceneUtilFixedBitSet *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = (void *)OrgApacheLuceneUtilFixedBitSet_class_();
    qword_100560460 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilFixedBitSet__initialized);
  }
}

@end