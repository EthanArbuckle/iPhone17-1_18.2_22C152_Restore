@interface ComAppleProactiveOrgApacheLuceneUtilOpenBitSet
+ (int)bits2wordsWithLong:(int64_t)a3;
+ (int64_t)andNotCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3 withComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a4;
+ (int64_t)intersectionCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3 withComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a4;
+ (int64_t)unionCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3 withComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a4;
+ (int64_t)xorCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3 withComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a4;
+ (void)initialize;
- (BOOL)fastGetWithInt:(int)a3;
- (BOOL)fastGetWithLong:(int64_t)a3;
- (BOOL)flipAndGetWithInt:(int)a3;
- (BOOL)flipAndGetWithLong:(int64_t)a3;
- (BOOL)getAndSetWithInt:(int)a3;
- (BOOL)getAndSetWithLong:(int64_t)a3;
- (BOOL)getWithInt:(int)a3;
- (BOOL)getWithLong:(int64_t)a3;
- (BOOL)intersectsWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3;
- (BOOL)isCacheable;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet)init;
- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet)initWithLong:(int64_t)a3;
- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet)initWithLongArray:(id)a3 withInt:(int)a4;
- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet)setWithLong:(int64_t)a3;
- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet)setWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getBits;
- (id)iterator;
- (int)expandingWordNumWithLong:(int64_t)a3;
- (int)getBitWithInt:(int)a3;
- (int)getNumWords;
- (int)length;
- (int)nextSetBitWithInt:(int)a3;
- (int)prevSetBitWithInt:(int)a3;
- (int64_t)capacity;
- (int64_t)cardinality;
- (int64_t)nextSetBitWithLong:(int64_t)a3;
- (int64_t)prevSetBitWithLong:(int64_t)a3;
- (int64_t)ramBytesUsed;
- (unint64_t)hash;
- (void)andNotWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3;
- (void)and__WithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3;
- (void)clearWithInt:(int)a3 withInt:(int)a4;
- (void)clearWithLong:(int64_t)a3;
- (void)clearWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (void)dealloc;
- (void)ensureCapacityWithLong:(int64_t)a3;
- (void)ensureCapacityWordsWithInt:(int)a3;
- (void)fastClearWithInt:(int)a3;
- (void)fastClearWithLong:(int64_t)a3;
- (void)fastFlipWithInt:(int)a3;
- (void)fastFlipWithLong:(int64_t)a3;
- (void)fastSetWithInt:(int)a3;
- (void)fastSetWithLong:(int64_t)a3;
- (void)flipWithLong:(int64_t)a3;
- (void)flipWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (void)intersectWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3;
- (void)or__WithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3;
- (void)removeWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3;
- (void)trimTrailingZeros;
- (void)union__WithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3;
- (void)xor__WithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3;
@end

@implementation ComAppleProactiveOrgApacheLuceneUtilOpenBitSet

- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet)initWithLong:(int64_t)a3
{
  return self;
}

- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet)init
{
  return self;
}

- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet)initWithLongArray:(id)a3 withInt:(int)a4
{
  return self;
}

- (id)iterator
{
  v2 = new_ComAppleProactiveOrgApacheLuceneUtilOpenBitSetIterator_initWithLongArray_withInt_(self->bits_, self->wlen_);
  return v2;
}

- (BOOL)isCacheable
{
  return 1;
}

- (int64_t)ramBytesUsed
{
  uint64_t v2 = qword_100560058;
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)self->bits_) + v2;
}

- (int64_t)capacity
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  return bits->super.size_ << 6;
}

- (int)length
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  return bits->super.size_ << 6;
}

- (BOOL)isEmpty
{
  return [(ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)self cardinality] == 0;
}

- (id)getBits
{
  return self->bits_;
}

- (int)getNumWords
{
  return self->wlen_;
}

- (BOOL)getWithInt:(int)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (a3 >> 6);
  uint64_t size = bits->super.size_;
  if ((int)v4 >= (int)size) {
    return 0;
  }
  if (a3 < 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  return (bits->buffer_[(int)v4] & (1 << a3)) != 0;
}

- (BOOL)fastGetWithInt:(int)a3
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

- (BOOL)getWithLong:(int64_t)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  unint64_t v4 = (unint64_t)a3 >> 6;
  uint64_t size = bits->super.size_;
  if ((int)size <= (int)((unint64_t)a3 >> 6)) {
    return 0;
  }
  if ((v4 & 0x80000000) != 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  return (bits->buffer_[(int)(a3 >> 6)] & (1 << a3)) != 0;
}

- (BOOL)fastGetWithLong:(int64_t)a3
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

- (int)getBitWithInt:(int)a3
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

- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet)setWithLong:(int64_t)a3
{
  char v3 = a3;
  uint64_t v5 = -[ComAppleProactiveOrgApacheLuceneUtilOpenBitSet expandingWordNumWithLong:](self, "expandingWordNumWithLong:");
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = v5;
  result = (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)bits->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)result) {
    IOSArray_throwOutOfBoundsWithMsg((uint64_t)result, v7);
  }
  bits->buffer_[(int)v7] |= 1 << v3;
  return result;
}

- (void)fastSetWithInt:(int)a3
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
  bits->buffer_[v4] |= 1 << a3;
}

- (void)fastSetWithLong:(int64_t)a3
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
  bits->buffer_[(int)(a3 >> 6)] |= 1 << a3;
}

- (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet)setWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if (a4 > a3)
  {
    char v4 = a4;
    char v5 = a3;
    v6 = self;
    int64_t v7 = a3 >> 6;
    uint64_t v8 = [(ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)self expandingWordNumWithLong:a4 - 1];
    uint64_t v13 = -1 << v5;
    unint64_t v14 = 0xFFFFFFFFFFFFFFFFLL >> -v4;
    if (v8 == v7)
    {
      bits = v6->bits_;
      if (bits)
      {
        v14 &= v13;
        uint64_t v16 = (int)v7;
        self = (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)bits->super.size_;
        if ((v7 & 0x80000000) != 0 || (int)self <= (int)v7)
        {
          uint64_t v17 = v7;
          goto LABEL_17;
        }
LABEL_12:
        bits->buffer_[v16] |= v14;
        return self;
      }
    }
    else
    {
      v18 = v6->bits_;
      if (v18)
      {
        uint64_t v19 = v8;
        uint64_t size = v18->super.size_;
        if ((v7 & 0x80000000) != 0 || (int)size <= (int)v7) {
          IOSArray_throwOutOfBoundsWithMsg(size, v7);
        }
        v18->buffer_[(int)v7] |= v13;
        JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)v6->bits_, (v7 + 1), v19, -1, v9, v10, v11, v12);
        bits = v6->bits_;
        uint64_t v16 = (int)v19;
        self = (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)bits->super.size_;
        if ((v19 & 0x80000000) != 0 || (int)v19 >= (int)self)
        {
          uint64_t v17 = v19;
LABEL_17:
          IOSArray_throwOutOfBoundsWithMsg((uint64_t)self, v17);
        }
        goto LABEL_12;
      }
    }
    JreThrowNullPointerException();
  }
  return self;
}

- (int)expandingWordNumWithLong:(int64_t)a3
{
  unint64_t v3 = (unint64_t)a3 >> 6;
  if (self->wlen_ <= (int)((unint64_t)a3 >> 6)) {
    [(ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)self ensureCapacityWithLong:a3 + 1];
  }
  return v3;
}

- (void)fastClearWithInt:(int)a3
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

- (void)fastClearWithLong:(int64_t)a3
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

- (void)clearWithLong:(int64_t)a3
{
  int64_t v3 = a3 >> 6;
  if (self->wlen_ > (int)(a3 >> 6))
  {
    bits = self->bits_;
    if (!bits) {
      JreThrowNullPointerException();
    }
    uint64_t size = bits->super.size_;
    if ((v3 & 0x80000000) != 0 || (int)size <= (int)v3) {
      IOSArray_throwOutOfBoundsWithMsg(size, v3);
    }
    bits->buffer_[(int)v3] &= ~(1 << a3);
  }
}

- (void)clearWithInt:(int)a3 withInt:(int)a4
{
  if (a4 > a3)
  {
    int v5 = a3 >> 6;
    uint64_t wlen = self->wlen_;
    if (a3 >> 6 < (int)wlen)
    {
      uint64_t v8 = ~(-1 << a3);
      unint64_t v9 = ~(0xFFFFFFFFFFFFFFFFLL >> -(char)a4);
      if (v5 == (a4 - 1) >> 6)
      {
        bits = self->bits_;
        if (bits)
        {
          v9 |= v8;
          uint64_t size = bits->super.size_;
          if (a3 < 0 || v5 >= (int)size) {
            IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
          }
LABEL_15:
          bits->buffer_[v5] &= v9;
          return;
        }
LABEL_17:
        JreThrowNullPointerException();
      }
      uint64_t v12 = self->bits_;
      if (!v12) {
        goto LABEL_17;
      }
      uint64_t v13 = ((a4 - 1) >> 6);
      if (a3 < 0 || v5 >= v12->super.size_) {
        IOSArray_throwOutOfBoundsWithMsg(v12->super.size_, (a3 >> 6));
      }
      v12->buffer_[v5] &= v8;
      uint64_t v14 = JavaLangMath_minWithInt_withInt_(wlen, v13);
      JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)self->bits_, (v5 + 1), v14, 0, v15, v16, v17, v18);
      if ((int)v13 < self->wlen_)
      {
        bits = self->bits_;
        uint64_t v19 = bits->super.size_;
        if (a4 < 1 || (int)v13 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, v13);
        }
        int v5 = v13;
        goto LABEL_15;
      }
    }
  }
}

- (void)clearWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if (a4 > a3)
  {
    int64_t v5 = a3 >> 6;
    uint64_t wlen = self->wlen_;
    if ((int)wlen > (int)(a3 >> 6))
    {
      int64_t v7 = (a4 - 1) >> 6;
      uint64_t v8 = ~(-1 << a3);
      unint64_t v9 = ~(0xFFFFFFFFFFFFFFFFLL >> -(char)a4);
      if (v5 == v7)
      {
        bits = self->bits_;
        if (bits)
        {
          v9 |= v8;
          uint64_t size = bits->super.size_;
          if ((v5 & 0x80000000) != 0 || (int)size <= (int)v5) {
            IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 6);
          }
LABEL_15:
          bits->buffer_[(int)v5] &= v9;
          return;
        }
LABEL_17:
        JreThrowNullPointerException();
      }
      uint64_t v12 = self->bits_;
      if (!v12) {
        goto LABEL_17;
      }
      if ((v5 & 0x80000000) != 0 || v12->super.size_ <= (int)v5) {
        IOSArray_throwOutOfBoundsWithMsg(v12->super.size_, a3 >> 6);
      }
      v12->buffer_[(int)v5] &= v8;
      uint64_t v13 = JavaLangMath_minWithInt_withInt_(wlen, (a4 - 1) >> 6);
      JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)self->bits_, (v5 + 1), v13, 0, v14, v15, v16, v17);
      if (self->wlen_ > (int)v7)
      {
        bits = self->bits_;
        uint64_t v18 = bits->super.size_;
        if ((v7 & 0x80000000) != 0 || (int)v18 <= (int)v7) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v7);
        }
        LODWORD(v5) = v7;
        goto LABEL_15;
      }
    }
  }
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
  v6 = bits;
  int64_t v7 = bits->buffer_[v4];
  if (a3 < 0 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
  }
  BOOL result = (v7 & (1 << a3)) != 0;
  v6->buffer_[v4] |= 1 << a3;
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
  int64_t v7 = bits;
  int64_t v8 = bits->buffer_[v4];
  if (a3 << 26 < 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, (unint64_t)a3 >> 6);
  }
  BOOL result = (v8 & (1 << a3)) != 0;
  v7->buffer_[v4] |= 1 << a3;
  return result;
}

- (void)fastFlipWithInt:(int)a3
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

- (void)fastFlipWithLong:(int64_t)a3
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

- (void)flipWithLong:(int64_t)a3
{
  char v3 = a3;
  uint64_t v5 = -[ComAppleProactiveOrgApacheLuceneUtilOpenBitSet expandingWordNumWithLong:](self, "expandingWordNumWithLong:");
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = v5;
  uint64_t size = bits->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  bits->buffer_[(int)v7] ^= 1 << v3;
}

- (BOOL)flipAndGetWithInt:(int)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int v5 = a3 >> 6;
  uint64_t v6 = 1 << a3;
  uint64_t size = bits->super.size_;
  if (a3 < 0 || v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
  }
  bits->buffer_[v5] ^= v6;
  int64_t v8 = self->bits_;
  uint64_t v9 = v8->super.size_;
  if (a3 < 0 || v5 >= (int)v9) {
    IOSArray_throwOutOfBoundsWithMsg(v9, (a3 >> 6));
  }
  return (v8->buffer_[v5] & v6) != 0;
}

- (BOOL)flipAndGetWithLong:(int64_t)a3
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = 1 << a3;
  uint64_t v6 = (int)(a3 >> 6);
  unint64_t v7 = (unint64_t)a3 >> 6;
  uint64_t size = bits->super.size_;
  if (a3 << 26 < 0 || (int)size <= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(size, (unint64_t)a3 >> 6);
  }
  bits->buffer_[v6] ^= v5;
  uint64_t v9 = self->bits_;
  uint64_t v10 = v9->super.size_;
  if (a3 << 26 < 0 || (int)v10 <= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(v10, (unint64_t)a3 >> 6);
  }
  return (v9->buffer_[v6] & v5) != 0;
}

- (void)flipWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if (a4 > a3)
  {
    char v4 = a4;
    char v5 = a3;
    int64_t v7 = a3 >> 6;
    uint64_t v8 = [(ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)self expandingWordNumWithLong:a4 - 1];
    uint64_t v9 = -1 << v5;
    unint64_t v10 = 0xFFFFFFFFFFFFFFFFLL >> -v4;
    if (v8 == v7)
    {
      bits = self->bits_;
      if (bits)
      {
        v10 &= v9;
        uint64_t v12 = (int)v7;
        uint64_t size = bits->super.size_;
        if ((v7 & 0x80000000) != 0 || (int)size <= (int)v7)
        {
          uint64_t v14 = v7;
          goto LABEL_27;
        }
LABEL_22:
        bits->buffer_[v12] ^= v10;
        return;
      }
    }
    else
    {
      uint64_t v15 = self->bits_;
      if (v15)
      {
        uint64_t v16 = v8;
        uint64_t v17 = v15->super.size_;
        if ((v7 & 0x80000000) != 0 || (int)v17 <= (int)v7) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v7);
        }
        v15->buffer_[(int)v7] ^= v9;
        if ((int)v7 + 1 < (int)v16)
        {
          uint64_t v18 = (int)v7 + 1;
          do
          {
            uint64_t v19 = self->bits_;
            uint64_t v20 = v19->super.size_;
            if (v18 < 0 || v18 >= (int)v20) {
              IOSArray_throwOutOfBoundsWithMsg(v20, v18);
            }
            int64_t v21 = v19->buffer_[v18];
            if (v18 < 0 || v18 >= (int)v20) {
              IOSArray_throwOutOfBoundsWithMsg(v20, v18);
            }
            self->bits_->buffer_[v18++] = ~v21;
          }
          while (v16 != v18);
        }
        bits = self->bits_;
        uint64_t v12 = (int)v16;
        uint64_t size = bits->super.size_;
        if ((v16 & 0x80000000) != 0 || (int)v16 >= (int)size)
        {
          uint64_t v14 = v16;
LABEL_27:
          IOSArray_throwOutOfBoundsWithMsg(size, v14);
        }
        goto LABEL_22;
      }
    }
    JreThrowNullPointerException();
  }
}

- (int64_t)cardinality
{
  return OrgApacheLuceneUtilBitUtil_pop_arrayWithLongArray_withInt_withInt_((uint64_t)self->bits_, 0, self->wlen_);
}

+ (int64_t)intersectionCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3 withComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a4
{
  return ComAppleProactiveOrgApacheLuceneUtilOpenBitSet_intersectionCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet_withComAppleProactiveOrgApacheLuceneUtilOpenBitSet_((uint64_t)a3, (uint64_t)a4);
}

+ (int64_t)unionCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3 withComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a4
{
  return ComAppleProactiveOrgApacheLuceneUtilOpenBitSet_unionCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet_withComAppleProactiveOrgApacheLuceneUtilOpenBitSet_((uint64_t)a3, (uint64_t)a4);
}

+ (int64_t)andNotCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3 withComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a4
{
  return ComAppleProactiveOrgApacheLuceneUtilOpenBitSet_andNotCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet_withComAppleProactiveOrgApacheLuceneUtilOpenBitSet_((uint64_t)a3, (uint64_t)a4);
}

+ (int64_t)xorCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3 withComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a4
{
  return ComAppleProactiveOrgApacheLuceneUtilOpenBitSet_xorCountWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet_withComAppleProactiveOrgApacheLuceneUtilOpenBitSet_((uint64_t)a3, (uint64_t)a4);
}

- (int)nextSetBitWithInt:(int)a3
{
  int v3 = a3 >> 6;
  if (a3 >> 6 < self->wlen_)
  {
    bits = self->bits_;
    if (!bits) {
      JreThrowNullPointerException();
    }
    int v6 = a3;
    uint64_t size = bits->super.size_;
    if (a3 < 0 || v3 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
    }
    uint64_t v8 = bits->buffer_[v3] >> (a3 & 0x3F);
    if (v8) {
      return JavaLangLong_numberOfTrailingZerosWithLong_(v8) + v6;
    }
    uint64_t v10 = v3 + 1;
    int v6 = v3 << 6;
    while (v10 < self->wlen_)
    {
      uint64_t v11 = self->bits_;
      uint64_t v12 = v11->super.size_;
      if (v10 - 1 < -1 || v10 >= (int)v12) {
        IOSArray_throwOutOfBoundsWithMsg(v12, v10);
      }
      uint64_t v8 = v11->buffer_[v10++];
      v6 += 64;
      if (v8) {
        return JavaLangLong_numberOfTrailingZerosWithLong_(v8) + v6;
      }
    }
  }
  return -1;
}

- (int64_t)nextSetBitWithLong:(int64_t)a3
{
  unint64_t v3 = (unint64_t)a3 >> 6;
  if (self->wlen_ > (int)((unint64_t)a3 >> 6))
  {
    bits = self->bits_;
    if (!bits) {
      JreThrowNullPointerException();
    }
    uint64_t size = bits->super.size_;
    if ((v3 & 0x80000000) != 0 || (int)size <= (int)v3) {
      IOSArray_throwOutOfBoundsWithMsg(size, (unint64_t)a3 >> 6);
    }
    uint64_t v7 = (unint64_t)bits->buffer_[(int)v3] >> a3;
    if (v7) {
      return ((uint64_t)(int)v3 << 6) + (int)(JavaLangLong_numberOfTrailingZerosWithLong_(v7) + (a3 & 0x3F));
    }
    uint64_t v9 = (int)v3 + 1;
    uint64_t v10 = (uint64_t)(int)v3 << 6;
    while (v9 < self->wlen_)
    {
      uint64_t v11 = self->bits_;
      uint64_t v12 = v11->super.size_;
      if (v9 - 1 < -1 || v9 >= (int)v12) {
        IOSArray_throwOutOfBoundsWithMsg(v12, v9);
      }
      uint64_t v13 = v11->buffer_[v9++];
      v10 += 64;
      if (v13) {
        return v10 + (int)JavaLangLong_numberOfTrailingZerosWithLong_(v13);
      }
    }
  }
  return -1;
}

- (int)prevSetBitWithInt:(int)a3
{
  uint64_t v4 = (a3 >> 6);
  int wlen = self->wlen_;
  if ((int)v4 < wlen)
  {
    if ((a3 & 0x80000000) == 0)
    {
      bits = self->bits_;
      if (bits)
      {
        int v7 = a3 & 0x3F;
        uint64_t size = bits->super.size_;
        if ((int)v4 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, (a3 >> 6));
        }
        unint64_t v9 = bits->buffer_[v4] << (v7 ^ 0x3Fu);
        if (v9) {
          goto LABEL_6;
        }
        goto LABEL_11;
      }
LABEL_20:
      JreThrowNullPointerException();
    }
    return -1;
  }
  uint64_t v4 = (wlen - 1);
  if (wlen - 1 < 0) {
    return -1;
  }
  uint64_t v11 = self->bits_;
  if (!v11) {
    goto LABEL_20;
  }
  uint64_t v12 = v11->super.size_;
  if ((int)v4 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v4);
  }
  unint64_t v9 = v11->buffer_[v4];
  int v7 = 63;
  if (!v9)
  {
LABEL_11:
    uint64_t v13 = v4 - 1;
    while (1)
    {
      int v10 = v4 - 1;
      if ((int)v4 < 1) {
        return -1;
      }
      uint64_t v14 = self->bits_;
      if (!v14) {
        goto LABEL_20;
      }
      uint64_t v15 = v14->super.size_;
      if ((int)v15 < (int)v4) {
        IOSArray_throwOutOfBoundsWithMsg(v15, (v4 - 1));
      }
      unint64_t v9 = v14->buffer_[v13--];
      LODWORD(v4) = v4 - 1;
      if (v9)
      {
        int v7 = 63;
        return (v7 | (v10 << 6)) - JavaLangLong_numberOfLeadingZerosWithLong_(v9);
      }
    }
  }
LABEL_6:
  int v10 = v4;
  return (v7 | (v10 << 6)) - JavaLangLong_numberOfLeadingZerosWithLong_(v9);
}

- (int64_t)prevSetBitWithLong:(int64_t)a3
{
  unint64_t v4 = (unint64_t)a3 >> 6;
  int wlen = self->wlen_;
  if (wlen > (int)((unint64_t)a3 >> 6))
  {
    if ((v4 & 0x80000000) == 0)
    {
      bits = self->bits_;
      if (bits)
      {
        int64_t v7 = a3 & 0x3F;
        uint64_t size = bits->super.size_;
        if ((int)size <= (int)v4) {
          IOSArray_throwOutOfBoundsWithMsg(size, (unint64_t)a3 >> 6);
        }
        unint64_t v9 = bits->buffer_[((unint64_t)a3 >> 6)] << (v7 ^ 0x3Fu);
        goto LABEL_10;
      }
LABEL_21:
      JreThrowNullPointerException();
    }
    return -1;
  }
  unint64_t v4 = (wlen - 1);
  if (wlen - 1 < 0) {
    return -1;
  }
  int v10 = self->bits_;
  if (!v10) {
    goto LABEL_21;
  }
  uint64_t v11 = v10->super.size_;
  if ((int)v4 >= (int)v11) {
    IOSArray_throwOutOfBoundsWithMsg(v11, v4);
  }
  unint64_t v9 = v10->buffer_[v4];
  int64_t v7 = 63;
LABEL_10:
  uint64_t v12 = v4;
  if (!v9)
  {
    int64_t v7 = 63;
    while ((int)v12 >= 1)
    {
      uint64_t v15 = self->bits_;
      if (!v15) {
        goto LABEL_21;
      }
      uint64_t v16 = v15->super.size_;
      if ((int)v16 < (int)v12) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v12 - 1);
      }
      uint64_t v13 = (v12 - 1);
      unint64_t v9 = v15->buffer_[v13];
      --v12;
      if (v9) {
        return (v7 | (v13 << 6)) - (int)JavaLangLong_numberOfLeadingZerosWithLong_(v9);
      }
    }
    return -1;
  }
  uint64_t v13 = v4;
  return (v7 | (v13 << 6)) - (int)JavaLangLong_numberOfLeadingZerosWithLong_(v9);
}

- (id)clone
{
  v5.receiver = self;
  v5.super_class = (Class)ComAppleProactiveOrgApacheLuceneUtilOpenBitSet;
  uint64_t v2 = [(ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)&v5 clone];
  objc_opt_class();
  if (!v2) {
    goto LABEL_5;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id v3 = v2[1];
  if (!v3) {
LABEL_5:
  }
    JreThrowNullPointerException();
  JreStrongAssign(v2 + 1, [v3 clone]);
  return v2;
}

- (void)intersectWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3
{
  if (!a3) {
    goto LABEL_15;
  }
  uint64_t v4 = JavaLangMath_minWithInt_withInt_(self->wlen_, *((_DWORD *)a3 + 4));
  unint64_t v9 = self;
  uint64_t v10 = v4;
  unsigned int v11 = v4 - 1;
  if ((int)v4 - 1 >= 0)
  {
    uint64_t v12 = *((void *)a3 + 1);
    if (v12)
    {
      bits = self->bits_;
      uint64_t v14 = &bits->super.super.isa + v11;
      uint64_t v15 = v12 + 8 * v11;
      LODWORD(v16) = v4;
      while (1)
      {
        uint64_t v16 = (v16 - 1);
        uint64_t v17 = *(unsigned int *)(v12 + 8);
        if ((int)v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v16);
        }
        if (!bits) {
          break;
        }
        uint64_t size = bits->super.size_;
        if ((int)v16 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v16);
        }
        v14[2] = (Class)((unint64_t)v14[2] & *(void *)(v15 + 16));
        --v14;
        v15 -= 8;
        if ((int)v16 <= 0) {
          goto LABEL_12;
        }
      }
    }
LABEL_15:
    JreThrowNullPointerException();
  }
LABEL_12:
  uint64_t wlen = self->wlen_;
  if ((int)wlen > (int)v10)
  {
    JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)self->bits_, v10, wlen, 0, v5, v6, v7, v8);
    unint64_t v9 = self;
  }
  v9->wlen_ = v10;
}

- (void)union__WithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3
{
  if (!a3) {
    goto LABEL_15;
  }
  int v15 = JavaLangMath_maxWithInt_withInt_(self->wlen_, *((_DWORD *)a3 + 4));
  -[ComAppleProactiveOrgApacheLuceneUtilOpenBitSet ensureCapacityWordsWithInt:](self, "ensureCapacityWordsWithInt:");
  bits = self->bits_;
  uint64_t v6 = (unsigned int *)*((void *)a3 + 1);
  int v7 = JavaLangMath_minWithInt_withInt_(self->wlen_, *((_DWORD *)a3 + 4));
  unsigned int v8 = v7 - 1;
  if (v7 - 1 >= 0)
  {
    if (v6)
    {
      LODWORD(v9) = v7;
      uint64_t v10 = &bits->super.super.isa + v8;
      unsigned int v11 = &v6[2 * v8];
      while (1)
      {
        uint64_t v9 = (v9 - 1);
        uint64_t v12 = v6[2];
        if ((int)v9 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v9);
        }
        if (!bits) {
          break;
        }
        uint64_t size = bits->super.size_;
        if ((int)v9 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v9);
        }
        v10[2] = (Class)((unint64_t)v10[2] | *((void *)v11 + 2));
        --v10;
        v11 -= 2;
        if ((int)v9 <= 0) {
          goto LABEL_12;
        }
      }
    }
LABEL_15:
    JreThrowNullPointerException();
  }
LABEL_12:
  uint64_t wlen = self->wlen_;
  if (v15 > (int)wlen) {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v6, wlen, bits, self->wlen_, (v15 - wlen));
  }
  self->wlen_ = v15;
}

- (void)removeWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3
{
  if (!a3) {
    goto LABEL_13;
  }
  int v5 = JavaLangMath_minWithInt_withInt_(self->wlen_, *((_DWORD *)a3 + 4));
  unsigned int v6 = v5 - 1;
  if (v5 - 1 >= 0)
  {
    uint64_t v7 = *((void *)a3 + 1);
    if (v7)
    {
      LODWORD(v8) = v5;
      bits = self->bits_;
      uint64_t v10 = &bits->super.super.isa + v6;
      for (uint64_t i = v7 + 8 * v6; ; i -= 8)
      {
        uint64_t v8 = (v8 - 1);
        uint64_t v12 = *(unsigned int *)(v7 + 8);
        if ((int)v8 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v8);
        }
        if (!bits) {
          break;
        }
        uint64_t size = bits->super.size_;
        if ((int)v8 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v8);
        }
        v10[2] = (Class)((unint64_t)v10[2] & ~*(void *)(i + 16));
        --v10;
        if ((int)v8 <= 0) {
          return;
        }
      }
    }
LABEL_13:
    JreThrowNullPointerException();
  }
}

- (void)xor__WithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3
{
  if (!a3) {
    goto LABEL_15;
  }
  int v15 = JavaLangMath_maxWithInt_withInt_(self->wlen_, *((_DWORD *)a3 + 4));
  -[ComAppleProactiveOrgApacheLuceneUtilOpenBitSet ensureCapacityWordsWithInt:](self, "ensureCapacityWordsWithInt:");
  bits = self->bits_;
  unsigned int v6 = (unsigned int *)*((void *)a3 + 1);
  int v7 = JavaLangMath_minWithInt_withInt_(self->wlen_, *((_DWORD *)a3 + 4));
  unsigned int v8 = v7 - 1;
  if (v7 - 1 >= 0)
  {
    if (v6)
    {
      LODWORD(v9) = v7;
      uint64_t v10 = &bits->super.super.isa + v8;
      unsigned int v11 = &v6[2 * v8];
      while (1)
      {
        uint64_t v9 = (v9 - 1);
        uint64_t v12 = v6[2];
        if ((int)v9 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v9);
        }
        if (!bits) {
          break;
        }
        uint64_t size = bits->super.size_;
        if ((int)v9 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v9);
        }
        v10[2] = (Class)((unint64_t)v10[2] ^ *((void *)v11 + 2));
        --v10;
        v11 -= 2;
        if ((int)v9 <= 0) {
          goto LABEL_12;
        }
      }
    }
LABEL_15:
    JreThrowNullPointerException();
  }
LABEL_12:
  uint64_t wlen = self->wlen_;
  if (v15 > (int)wlen) {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v6, wlen, bits, self->wlen_, (v15 - wlen));
  }
  self->wlen_ = v15;
}

- (void)and__WithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3
{
}

- (void)or__WithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3
{
}

- (void)andNotWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3
{
}

- (BOOL)intersectsWithComAppleProactiveOrgApacheLuceneUtilOpenBitSet:(id)a3
{
  if (!a3) {
LABEL_13:
  }
    JreThrowNullPointerException();
  int v5 = JavaLangMath_minWithInt_withInt_(self->wlen_, *((_DWORD *)a3 + 4));
  bits = self->bits_;
  uint64_t v7 = *((void *)a3 + 1);
  uint64_t v8 = (v5 - 1);
  do
  {
    unsigned int v9 = v8;
    if ((v8 & 0x80000000) != 0) {
      break;
    }
    if (!bits) {
      goto LABEL_13;
    }
    uint64_t size = bits->super.size_;
    if ((int)v8 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v8);
    }
    if (!v7) {
      goto LABEL_13;
    }
    uint64_t v11 = *(unsigned int *)(v7 + 8);
    if ((int)v8 >= (int)v11) {
      IOSArray_throwOutOfBoundsWithMsg(v11, v8);
    }
    uint64_t v8 = (v8 - 1);
  }
  while ((*(void *)(v7 + 16 + 8 * v9) & bits->buffer_[v9]) == 0);
  return (v9 & 0x80000000) == 0;
}

- (void)ensureCapacityWordsWithInt:(int)a3
{
  p_bits = &self->bits_;
  uint64_t v11 = OrgApacheLuceneUtilArrayUtil_growWithLongArray_withInt_((unsigned int *)self->bits_, a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  JreStrongAssign((id *)p_bits, v11);
  self->wlen_ = a3;
}

- (void)ensureCapacityWithLong:(int64_t)a3
{
  if ((atomic_load_explicit(ComAppleProactiveOrgApacheLuceneUtilOpenBitSet__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  [(ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)self ensureCapacityWordsWithInt:((unint64_t)(a3 - 1) >> 6) + 1];
}

- (void)trimTrailingZeros
{
  LODWORD(v3) = self->wlen_;
  do
  {
    int v4 = v3;
    uint64_t v3 = (v3 - 1);
    if ((int)v3 < 0) {
      break;
    }
    bits = self->bits_;
    if (!bits) {
      JreThrowNullPointerException();
    }
    uint64_t size = bits->super.size_;
    if ((int)v3 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v3);
    }
  }
  while (!bits->buffer_[v3]);
  self->wlen_ = v4;
}

+ (int)bits2wordsWithLong:(int64_t)a3
{
  if ((atomic_load_explicit(ComAppleProactiveOrgApacheLuceneUtilOpenBitSet__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return ((unint64_t)(a3 - 1) >> 6) + 1;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (!a3) {
        goto LABEL_32;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      int v5 = *((_DWORD *)a3 + 4);
      int wlen = self->wlen_;
      uint64_t v7 = v5 <= wlen ? self : (ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)a3;
      uint64_t v8 = v5 <= wlen ? a3 : self;
      if (!v7) {
LABEL_32:
      }
        JreThrowNullPointerException();
      uint64_t v9 = (v7->wlen_ - 1);
      while (1)
      {
        int v10 = v8[4];
        if ((int)v9 < v10) {
          break;
        }
        bits = v7->bits_;
        if (!bits) {
          goto LABEL_32;
        }
        uint64_t size = bits->super.size_;
        if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v9);
        }
        int64_t v13 = bits->buffer_[(int)v9];
        uint64_t v9 = (v9 - 1);
        if (v13) {
          goto LABEL_20;
        }
      }
      uint64_t v16 = (v10 - 1);
      do
      {
        unsigned int v14 = v16 >> 31;
        if ((v16 & 0x80000000) != 0) {
          break;
        }
        uint64_t v17 = v7->bits_;
        if (!v17) {
          goto LABEL_32;
        }
        uint64_t v18 = v17->super.size_;
        if ((int)v16 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v16);
        }
        int64_t v19 = v17->buffer_[v16];
        uint64_t v20 = *((void *)v8 + 1);
        uint64_t v21 = *(unsigned int *)(v20 + 8);
        if ((int)v16 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, v16);
        }
        uint64_t v22 = *(void *)(v20 + 16 + 8 * v16);
        uint64_t v16 = (v16 - 1);
      }
      while (v19 == v22);
    }
    else
    {
LABEL_20:
      LOBYTE(v14) = 0;
    }
  }
  return v14;
}

- (unint64_t)hash
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  int size = bits->super.size_;
  uint64_t v4 = (size - 1);
  if (size - 1 < 0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = self->bits_;
      uint64_t v8 = v7->super.size_;
      if ((int)v4 >= (int)v8) {
        IOSArray_throwOutOfBoundsWithMsg(v8, v4);
      }
      uint64_t v6 = __ROR8__(v7->buffer_[v4] ^ v6, 63);
      --size;
      --v4;
    }
    while (size > 0);
  }
  return (uint64_t)((v6 & 0xFFFFFFFF00000000 ^ (v6 << 32)) - 0x6789EDCC00000000) >> 32;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveOrgApacheLuceneUtilOpenBitSet;
  [(ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = (void *)ComAppleProactiveOrgApacheLuceneUtilOpenBitSet_class_();
    qword_100560058 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)ComAppleProactiveOrgApacheLuceneUtilOpenBitSet__initialized);
  }
}

@end