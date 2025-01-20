@interface OrgApacheLuceneUtilLongBitSet
+ (id)ensureCapacityWithOrgApacheLuceneUtilLongBitSet:(id)a3 withLong:(int64_t)a4;
+ (int)bits2wordsWithLong:(int64_t)a3;
- (BOOL)getAndClearWithLong:(int64_t)a3;
- (BOOL)getAndSetWithLong:(int64_t)a3;
- (BOOL)getWithLong:(int64_t)a3;
- (BOOL)intersectsWithOrgApacheLuceneUtilLongBitSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)scanIsEmpty;
- (BOOL)verifyGhostBitsClear;
- (OrgApacheLuceneUtilLongBitSet)initWithLong:(int64_t)a3;
- (OrgApacheLuceneUtilLongBitSet)initWithLongArray:(id)a3 withLong:(int64_t)a4;
- (OrgApacheLuceneUtilLongBitSet)setWithLong:(int64_t)a3;
- (OrgApacheLuceneUtilLongBitSet)setWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (id)clone;
- (id)getBits;
- (int64_t)cardinality;
- (int64_t)length;
- (int64_t)nextSetBitWithLong:(int64_t)a3;
- (int64_t)prevSetBitWithLong:(int64_t)a3;
- (unint64_t)hash;
- (void)andNotWithOrgApacheLuceneUtilLongBitSet:(id)a3;
- (void)and__WithOrgApacheLuceneUtilLongBitSet:(id)a3;
- (void)clearWithLong:(int64_t)a3;
- (void)clearWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (void)dealloc;
- (void)flipWithLong:(int64_t)a3;
- (void)flipWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (void)or__WithOrgApacheLuceneUtilLongBitSet:(id)a3;
- (void)xor__WithOrgApacheLuceneUtilLongBitSet:(id)a3;
@end

@implementation OrgApacheLuceneUtilLongBitSet

+ (id)ensureCapacityWithOrgApacheLuceneUtilLongBitSet:(id)a3 withLong:(int64_t)a4
{
  return OrgApacheLuceneUtilLongBitSet_ensureCapacityWithOrgApacheLuceneUtilLongBitSet_withLong_((OrgApacheLuceneUtilLongBitSet *)a3, a4);
}

+ (int)bits2wordsWithLong:(int64_t)a3
{
  return ((unint64_t)(a3 - 1) >> 6) + 1;
}

- (OrgApacheLuceneUtilLongBitSet)initWithLong:(int64_t)a3
{
  self->numBits_ = a3;
  JreStrongAssignAndConsume((id *)&self->bits_, +[IOSLongArray newArrayWithLength:((a3 << 26) + 4227858432) >> 32]);
  self->numWords_ = self->bits_->super.size_;
  return self;
}

- (OrgApacheLuceneUtilLongBitSet)initWithLongArray:(id)a3 withLong:(int64_t)a4
{
  OrgApacheLuceneUtilLongBitSet_initWithLongArray_withLong_((uint64_t)self, a3, a4, a4, v4, v5, v6, v7);
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
  int64_t v6 = self->numBits_ & 0x3F;
  if (!v6) {
    return 1;
  }
  uint64_t v7 = -1 << v6;
  int v8 = self->numWords_ - 1;
  if (v8 < 0 || v8 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v8);
  }
  return (bits->buffer_[v8] & v7) == 0;
}

- (int64_t)length
{
  return self->numBits_;
}

- (id)getBits
{
  return self->bits_;
}

- (int64_t)cardinality
{
  return OrgApacheLuceneUtilBitUtil_pop_arrayWithLongArray_withInt_withInt_((uint64_t)self->bits_, 0, self->numWords_);
}

- (BOOL)getWithLong:(int64_t)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  unint64_t v4 = (unint64_t)a3 >> 6;
  uint64_t size = bits->super.size_;
  if ((a3 & 0x2000000000) != 0 || (int)size <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  return ((unint64_t)bits->buffer_[(int)(a3 >> 6)] >> a3) & 1;
}

- (OrgApacheLuceneUtilLongBitSet)setWithLong:(int64_t)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  unint64_t v4 = (unint64_t)a3 >> 6;
  result = (OrgApacheLuceneUtilLongBitSet *)bits->super.size_;
  if ((a3 & 0x2000000000) != 0 || (int)result <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg((uint64_t)result, v4);
  }
  bits->buffer_[(int)(a3 >> 6)] |= 1 << a3;
  return result;
}

- (BOOL)getAndSetWithLong:(int64_t)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (int)(a3 >> 6);
  unint64_t v5 = (unint64_t)a3 >> 6;
  uint64_t size = bits->super.size_;
  if (a3 << 26 < 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, (unint64_t)a3 >> 6);
  }
  uint64_t v7 = bits;
  int64_t v8 = bits->buffer_[v4];
  if (a3 << 26 < 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, (unint64_t)a3 >> 6);
  }
  BOOL result = (v8 & (1 << a3)) != 0;
  v7->buffer_[v4] |= 1 << a3;
  return result;
}

- (void)clearWithLong:(int64_t)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  unint64_t v4 = (unint64_t)a3 >> 6;
  uint64_t size = bits->super.size_;
  if ((a3 & 0x2000000000) != 0 || (int)size <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  bits->buffer_[(int)(a3 >> 6)] &= ~(1 << a3);
}

- (BOOL)getAndClearWithLong:(int64_t)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (int)(a3 >> 6);
  unint64_t v5 = (unint64_t)a3 >> 6;
  uint64_t size = bits->super.size_;
  if (a3 << 26 < 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, (unint64_t)a3 >> 6);
  }
  uint64_t v7 = bits;
  int64_t v8 = bits->buffer_[v4];
  if (a3 << 26 < 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, (unint64_t)a3 >> 6);
  }
  BOOL result = (v8 & (1 << a3)) != 0;
  v7->buffer_[v4] &= ~(1 << a3);
  return result;
}

- (int64_t)nextSetBitWithLong:(int64_t)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int64_t v5 = a3 >> 6;
  uint64_t size = bits->super.size_;
  if (((a3 >> 6) & 0x80000000) != 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 6);
  }
  uint64_t v7 = bits->buffer_[(int)(a3 >> 6)] >> a3;
  if (v7) {
    return a3 + (int)JavaLangLong_numberOfTrailingZerosWithLong_(v7);
  }
  int v9 = v5 << 6;
  uint64_t v10 = (v5 + 1);
  while ((int)v10 < self->numWords_)
  {
    v11 = self->bits_;
    uint64_t v12 = v11->super.size_;
    if ((v10 & 0x80000000) != 0 || (int)v10 >= (int)v12) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v10);
    }
    uint64_t v13 = v11->buffer_[(int)v10];
    v9 += 64;
    uint64_t v10 = (v10 + 1);
    if (v13) {
      return (int)(JavaLangLong_numberOfTrailingZerosWithLong_(v13) + v9);
    }
  }
  return -1;
}

- (int64_t)prevSetBitWithLong:(int64_t)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int64_t v5 = a3 >> 6;
  int v6 = a3 & 0x3F;
  uint64_t size = bits->super.size_;
  if (((a3 >> 6) & 0x80000000) != 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 6);
  }
  unint64_t v8 = bits->buffer_[(int)(a3 >> 6)] << (v6 ^ 0x3Fu);
  if (v8) {
    return (int)((v6 | (v5 << 6)) - JavaLangLong_numberOfLeadingZerosWithLong_(v8));
  }
  while (1)
  {
    int64_t v5 = (v5 - 1);
    if ((int)v5 < 0) {
      break;
    }
    int v9 = self->bits_;
    uint64_t v10 = v9->super.size_;
    if ((int)v5 >= (int)v10) {
      IOSArray_throwOutOfBoundsWithMsg(v10, v5);
    }
    unint64_t v8 = v9->buffer_[v5];
    if (v8)
    {
      int v6 = 63;
      return (int)((v6 | (v5 << 6)) - JavaLangLong_numberOfLeadingZerosWithLong_(v8));
    }
  }
  return -1;
}

- (void)or__WithOrgApacheLuceneUtilLongBitSet:(id)a3
{
  int v5 = JavaLangMath_minWithInt_withInt_(self->numWords_, *((_DWORD *)a3 + 6));
  uint64_t v6 = (v5 - 1);
  if (v5 - 1 >= 0)
  {
    int v7 = v5;
    do
    {
      uint64_t v8 = *((void *)a3 + 1);
      uint64_t v9 = *(unsigned int *)(v8 + 8);
      if ((int)v6 >= (int)v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v6);
      }
      bits = self->bits_;
      if (!bits) {
        JreThrowNullPointerException();
      }
      uint64_t v11 = *(void *)(v8 + 16 + 8 * v6);
      uint64_t size = bits->super.size_;
      if ((int)v6 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      bits->buffer_[v6] |= v11;
      --v7;
      --v6;
    }
    while (v7 > 0);
  }
}

- (void)xor__WithOrgApacheLuceneUtilLongBitSet:(id)a3
{
  int v5 = JavaLangMath_minWithInt_withInt_(self->numWords_, *((_DWORD *)a3 + 6));
  uint64_t v6 = (v5 - 1);
  if (v5 - 1 >= 0)
  {
    int v7 = v5;
    do
    {
      uint64_t v8 = *((void *)a3 + 1);
      uint64_t v9 = *(unsigned int *)(v8 + 8);
      if ((int)v6 >= (int)v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v6);
      }
      bits = self->bits_;
      if (!bits) {
        JreThrowNullPointerException();
      }
      uint64_t v11 = *(void *)(v8 + 16 + 8 * v6);
      uint64_t size = bits->super.size_;
      if ((int)v6 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      bits->buffer_[v6] ^= v11;
      --v7;
      --v6;
    }
    while (v7 > 0);
  }
}

- (BOOL)intersectsWithOrgApacheLuceneUtilLongBitSet:(id)a3
{
  if (!a3) {
LABEL_12:
  }
    JreThrowNullPointerException();
  uint64_t v5 = JavaLangMath_minWithInt_withInt_(self->numWords_, *((_DWORD *)a3 + 6)) - 1;
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

- (void)and__WithOrgApacheLuceneUtilLongBitSet:(id)a3
{
  if (!a3) {
    goto LABEL_16;
  }
  int v5 = JavaLangMath_minWithInt_withInt_(self->numWords_, *((_DWORD *)a3 + 6));
  uint64_t v10 = (v5 - 1);
  if (v5 - 1 >= 0)
  {
    int v11 = v5;
    while (1)
    {
      uint64_t v12 = *((void *)a3 + 1);
      uint64_t v13 = *(unsigned int *)(v12 + 8);
      if ((int)v10 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v10);
      }
      bits = self->bits_;
      if (!bits) {
        break;
      }
      uint64_t v15 = *(void *)(v12 + 16 + 8 * v10);
      uint64_t size = bits->super.size_;
      if ((int)v10 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v10);
      }
      bits->buffer_[v10] &= v15;
      --v11;
      --v10;
      if (v11 <= 0) {
        goto LABEL_11;
      }
    }
LABEL_16:
    JreThrowNullPointerException();
  }
LABEL_11:
  uint64_t numWords = self->numWords_;
  uint64_t v18 = *((unsigned int *)a3 + 6);
  if ((int)numWords > (int)v18)
  {
    v19 = self->bits_;
    JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)v19, v18, numWords, 0, v6, v7, v8, v9);
  }
}

- (void)andNotWithOrgApacheLuceneUtilLongBitSet:(id)a3
{
  if (!a3) {
    goto LABEL_12;
  }
  int v5 = JavaLangMath_minWithInt_withInt_(self->numWords_, *((_DWORD *)a3 + 6));
  uint64_t v6 = (v5 - 1);
  if (v5 - 1 >= 0)
  {
    int v7 = v5;
    while (1)
    {
      uint64_t v8 = *((void *)a3 + 1);
      uint64_t v9 = *(unsigned int *)(v8 + 8);
      if ((int)v6 >= (int)v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v6);
      }
      bits = self->bits_;
      if (!bits) {
        break;
      }
      uint64_t v11 = *(void *)(v8 + 16 + 8 * v6);
      uint64_t size = bits->super.size_;
      if ((int)v6 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      bits->buffer_[v6] &= ~v11;
      --v7;
      --v6;
      if (v7 <= 0) {
        return;
      }
    }
LABEL_12:
    JreThrowNullPointerException();
  }
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

- (void)flipWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if (a4 > a3)
  {
    int64_t v5 = a3 >> 6;
    int64_t v6 = (a4 - 1) >> 6;
    uint64_t v7 = -1 << a3;
    unint64_t v8 = 0xFFFFFFFFFFFFFFFFLL >> -(char)a4;
    if ((a3 >> 6) == v6)
    {
      bits = self->bits_;
      if (bits)
      {
        v8 &= v7;
        uint64_t size = bits->super.size_;
        if ((v5 & 0x80000000) != 0 || (int)size <= (int)v5) {
          IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 6);
        }
LABEL_23:
        bits->buffer_[(int)v5] ^= v8;
        return;
      }
    }
    else
    {
      uint64_t v11 = self->bits_;
      if (v11)
      {
        uint64_t v12 = v11->super.size_;
        if ((v5 & 0x80000000) != 0 || (int)v12 <= (int)v5) {
          IOSArray_throwOutOfBoundsWithMsg(v12, a3 >> 6);
        }
        v11->buffer_[(int)v5] ^= v7;
        if ((int)v5 + 1 < (int)v6)
        {
          uint64_t v13 = (int)v5 + 1;
          do
          {
            v14 = self->bits_;
            uint64_t v15 = v14->super.size_;
            if (v13 < 0 || v13 >= (int)v15) {
              IOSArray_throwOutOfBoundsWithMsg(v15, v13);
            }
            int64_t v16 = v14->buffer_[v13];
            if (v13 < 0 || v13 >= (int)v15) {
              IOSArray_throwOutOfBoundsWithMsg(v15, v13);
            }
            self->bits_->buffer_[v13++] = ~v16;
          }
          while (v6 != v13);
        }
        bits = self->bits_;
        uint64_t v17 = bits->super.size_;
        if ((v6 & 0x80000000) != 0 || (int)v17 <= (int)v6) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (a4 - 1) >> 6);
        }
        int64_t v5 = (a4 - 1) >> 6;
        goto LABEL_23;
      }
    }
    JreThrowNullPointerException();
  }
}

- (void)flipWithLong:(int64_t)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  unint64_t v4 = (unint64_t)a3 >> 6;
  uint64_t size = bits->super.size_;
  if ((a3 & 0x2000000000) != 0 || (int)size <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  bits->buffer_[(int)(a3 >> 6)] ^= 1 << a3;
}

- (OrgApacheLuceneUtilLongBitSet)setWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if (a4 > a3)
  {
    unint64_t v8 = self;
    int64_t v9 = a3 >> 6;
    int64_t v10 = (a4 - 1) >> 6;
    uint64_t v11 = -1 << a3;
    unint64_t v12 = 0xFFFFFFFFFFFFFFFFLL >> -(char)a4;
    if ((a3 >> 6) == v10)
    {
      bits = self->bits_;
      if (bits)
      {
        v12 &= v11;
        self = (OrgApacheLuceneUtilLongBitSet *)bits->super.size_;
        if ((v9 & 0x80000000) != 0 || (int)self <= (int)v9) {
          IOSArray_throwOutOfBoundsWithMsg((uint64_t)self, a3 >> 6);
        }
LABEL_13:
        bits->buffer_[(int)v9] |= v12;
        return self;
      }
    }
    else
    {
      v14 = self->bits_;
      if (v14)
      {
        uint64_t size = v14->super.size_;
        if ((v9 & 0x80000000) != 0 || (int)size <= (int)v9) {
          IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 6);
        }
        v14->buffer_[(int)v9] |= v11;
        JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)v8->bits_, (v9 + 1), (a4 - 1) >> 6, -1, v4, v5, v6, v7);
        bits = v8->bits_;
        self = (OrgApacheLuceneUtilLongBitSet *)bits->super.size_;
        if ((v10 & 0x80000000) != 0 || (int)self <= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg((uint64_t)self, v10);
        }
        LODWORD(v9) = v10;
        goto LABEL_13;
      }
    }
    JreThrowNullPointerException();
  }
  return self;
}

- (void)clearWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if (a4 > a3)
  {
    int64_t v9 = a3 >> 6;
    int64_t v10 = (a4 - 1) >> 6;
    uint64_t v11 = ~(-1 << a3);
    unint64_t v12 = ~(0xFFFFFFFFFFFFFFFFLL >> -(char)a4);
    if ((a3 >> 6) == v10)
    {
      bits = self->bits_;
      if (bits)
      {
        v12 |= v11;
        uint64_t size = bits->super.size_;
        if ((v9 & 0x80000000) != 0 || (int)size <= (int)v9) {
          IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 6);
        }
LABEL_13:
        bits->buffer_[(int)v9] &= v12;
        return;
      }
    }
    else
    {
      uint64_t v15 = self->bits_;
      if (v15)
      {
        uint64_t v16 = v15->super.size_;
        if ((v9 & 0x80000000) != 0 || (int)v16 <= (int)v9) {
          IOSArray_throwOutOfBoundsWithMsg(v16, a3 >> 6);
        }
        v15->buffer_[(int)v9] &= v11;
        JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)self->bits_, (v9 + 1), (a4 - 1) >> 6, 0, v4, v5, v6, v7);
        bits = self->bits_;
        uint64_t v17 = bits->super.size_;
        if ((v10 & 0x80000000) != 0 || (int)v17 <= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v10);
        }
        LODWORD(v9) = v10;
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
  uint64_t v4 = +[IOSLongArray arrayWithLength:bits->super.size_];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->bits_, 0, v4, 0, self->numWords_);
  int64_t numBits = self->numBits_;
  uint64_t v6 = [OrgApacheLuceneUtilLongBitSet alloc];
  OrgApacheLuceneUtilLongBitSet_initWithLongArray_withLong_((uint64_t)v6, v4, numBits, v7, v8, v9, v10, v11);
  return v6;
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
  if (self->numBits_ != *((void *)a3 + 2)) {
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
  v3.super_class = (Class)OrgApacheLuceneUtilLongBitSet;
  [(OrgApacheLuceneUtilLongBitSet *)&v3 dealloc];
}

@end