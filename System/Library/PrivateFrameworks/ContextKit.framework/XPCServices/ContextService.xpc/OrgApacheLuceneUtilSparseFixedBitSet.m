@interface OrgApacheLuceneUtilSparseFixedBitSet
+ (void)initialize;
- (BOOL)consistentWithInt:(int)a3;
- (BOOL)getWithInt:(int)a3;
- (NSString)description;
- (OrgApacheLuceneUtilSparseFixedBitSet)initWithInt:(int)a3;
- (OrgApacheLuceneUtilSparseFixedBitSet)setWithInt:(int)a3;
- (int)approximateCardinality;
- (int)cardinality;
- (int)firstDocWithInt:(int)a3;
- (int)lastDocWithInt:(int)a3;
- (int)length;
- (int)nextSetBitWithInt:(int)a3;
- (int)prevSetBitWithInt:(int)a3;
- (int64_t)longBitsWithLong:(int64_t)a3 withLongArray:(id)a4 withInt:(int)a5;
- (int64_t)ramBytesUsed;
- (void)and__WithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5;
- (void)and__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)clearWithInt:(int)a3;
- (void)clearWithInt:(int)a3 withInt:(int)a4;
- (void)clearWithinBlockWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)dealloc;
- (void)insertBlockWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)insertLongWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6;
- (void)orDenseWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)or__WithInt:(int)a3 withLong:(int64_t)a4 withLongArray:(id)a5 withInt:(int)a6;
- (void)or__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)or__WithOrgApacheLuceneUtilSparseFixedBitSet:(id)a3;
- (void)removeLongWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5 withInt:(int)a6;
@end

@implementation OrgApacheLuceneUtilSparseFixedBitSet

- (OrgApacheLuceneUtilSparseFixedBitSet)initWithInt:(int)a3
{
  return self;
}

- (int)length
{
  return self->length_;
}

- (BOOL)consistentWithInt:(int)a3
{
  return 1;
}

- (int)cardinality
{
  bits = self->bits_;
  if (!bits) {
    JreThrowNullPointerException();
  }
  p_elementType = &bits->elementType_;
  unint64_t v4 = (unint64_t)&(&bits->elementType_)[bits->super.size_];
  if ((unint64_t)&bits->elementType_ >= v4) {
    return 0;
  }
  int v5 = 0;
  do
  {
    uint64_t v7 = (uint64_t)*p_elementType++;
    uint64_t v6 = v7;
    if (v7)
    {
      v8 = (unint64_t *)(v6 + 16);
      unint64_t v9 = v6 + 16 + 8 * *(int *)(v6 + 8);
      while ((unint64_t)v8 < v9)
      {
        unint64_t v10 = *v8++;
        v5 += JavaLangLong_bitCountWithLong_(v10);
      }
    }
  }
  while ((unint64_t)p_elementType < v4);
  return v5;
}

- (int)approximateCardinality
{
  signed int v3 = (self->length_ + 63) >> 6;
  double v4 = (double)v3;
  long double v5 = JavaLangMath_logWithDouble_((double)v3 / (double)(v3 - self->nonZeroLongCount_));
  unint64_t v6 = JavaLangMath_roundWithDouble_(v5 * v4);
  return JavaLangMath_minWithLong_withLong_(self->length_, v6);
}

- (BOOL)getWithInt:(int)a3
{
  indices = self->indices_;
  if (!indices) {
    goto LABEL_11;
  }
  char v4 = a3;
  uint64_t v6 = a3 >> 12;
  uint64_t size = indices->super.size_;
  if ((int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 12);
  }
  int64_t v8 = indices->buffer_[v6];
  uint64_t v9 = 1 << (a3 >> 6);
  if ((v8 & v9) == 0)
  {
    LOBYTE(v15) = 0;
    return v15;
  }
  bits = self->bits_;
  if (!bits) {
    goto LABEL_11;
  }
  uint64_t v11 = bits->super.size_;
  if ((int)v6 >= (int)v11) {
    IOSArray_throwOutOfBoundsWithMsg(v11, a3 >> 12);
  }
  v12 = (&bits->elementType_)[v6];
  if (!v12) {
LABEL_11:
  }
    JreThrowNullPointerException();
  int v13 = JavaLangLong_bitCountWithLong_(v8 & (v9 - 1));
  uint64_t isa_low = LODWORD(v12[1].super.isa);
  if (v13 < 0 || v13 >= (int)isa_low) {
    IOSArray_throwOutOfBoundsWithMsg(isa_low, v13);
  }
  return ((unint64_t)v12[v13 + 2].super.isa >> v4) & 1;
}

- (OrgApacheLuceneUtilSparseFixedBitSet)setWithInt:(int)a3
{
  indices = self->indices_;
  if (!indices) {
    goto LABEL_17;
  }
  char v4 = a3;
  uint64_t v6 = a3 >> 12;
  uint64_t size = indices->super.size_;
  if ((int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 12);
  }
  uint64_t v8 = indices->buffer_[v6];
  unsigned int v9 = a3 >> 6;
  if ((v8 & (1 << v9)) != 0)
  {
    bits = self->bits_;
    if (bits)
    {
      uint64_t v11 = bits->super.size_;
      if ((int)v6 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v6);
      }
      v12 = (&bits->elementType_)[v6];
      if (v12)
      {
        int v13 = JavaLangLong_bitCountWithLong_(v8 & ((1 << v9) - 1));
        result = (OrgApacheLuceneUtilSparseFixedBitSet *)LODWORD(v12[1].super.isa);
        if (v13 < 0 || v13 >= (int)result) {
          IOSArray_throwOutOfBoundsWithMsg((uint64_t)result, v13);
        }
        v12[v13 + 2].super.isa = (Class)((uint64_t)v12[v13 + 2].super.isa | (1 << v4));
        return result;
      }
    }
LABEL_17:
    JreThrowNullPointerException();
  }
  if (v8)
  {
    return (OrgApacheLuceneUtilSparseFixedBitSet *)sub_10009FE9C((uint64_t)self, v6, v9, v4, v8);
  }
  else
  {
    return (OrgApacheLuceneUtilSparseFixedBitSet *)sub_10009FD68((uint64_t)self, v6, v9, v4);
  }
}

- (void)insertBlockWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)insertLongWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6
{
}

- (void)clearWithInt:(int)a3
{
}

- (void)and__WithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5
{
}

- (void)removeLongWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5 withInt:(int)a6
{
}

- (void)clearWithInt:(int)a3 withInt:(int)a4
{
  if (a3 < a4)
  {
    char v4 = self;
    uint64_t v5 = a3 >> 12;
    unsigned int v6 = a4 - 1;
    unsigned int v7 = a3 & 0xFFF;
    if (v5 == (a4 - 1) >> 12)
    {
      unsigned int v8 = v6 & 0xFFF;
      uint64_t v9 = v5;
    }
    else
    {
      uint64_t v10 = v6 >> 12;
      sub_1000A06C4((uint64_t)self, v5, v7, 0xFFFu);
      uint64_t v11 = (v5 + 1);
      if (v11 < v10)
      {
        do
        {
          indices = v4->indices_;
          if (!indices) {
            goto LABEL_18;
          }
          uint64_t size = indices->super.size_;
          if (v11 >= size) {
            IOSArray_throwOutOfBoundsWithMsg(size, v11);
          }
          v4->nonZeroLongCount_ -= JavaLangLong_bitCountWithLong_(indices->buffer_[v11]);
          v14 = v4->indices_;
          uint64_t v15 = v14->super.size_;
          if (v11 >= v15) {
            IOSArray_throwOutOfBoundsWithMsg(v15, v11);
          }
          v14->buffer_[v11] = 0;
          uint64_t bits = (uint64_t)v4->bits_;
          if (!bits) {
LABEL_18:
          }
            JreThrowNullPointerException();
          IOSObjectArray_Set(bits, v11++, 0);
        }
        while (v10 != v11);
      }
      unsigned int v8 = v6 & 0xFFF;
      self = v4;
      uint64_t v9 = v6 >> 12;
      unsigned int v7 = 0;
    }
    sub_1000A06C4((uint64_t)self, v9, v7, v8);
  }
}

- (void)clearWithinBlockWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (int)firstDocWithInt:(int)a3
{
  return sub_1000A07B8((uint64_t)self, a3);
}

- (int)nextSetBitWithInt:(int)a3
{
  indices = self->indices_;
  if (!indices) {
    goto LABEL_20;
  }
  uint64_t v6 = a3 >> 12;
  uint64_t size = indices->super.size_;
  if ((int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 12);
  }
  uint64_t bits = self->bits_;
  if (!bits) {
    goto LABEL_20;
  }
  unint64_t v9 = indices->buffer_[v6];
  uint64_t v10 = bits->super.size_;
  if ((int)v6 >= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v10, a3 >> 12);
  }
  uint64_t v11 = (&bits->elementType_)[v6];
  unsigned int v12 = a3 >> 6;
  uint64_t v13 = 1 << (a3 >> 6);
  uint64_t v14 = JavaLangLong_bitCountWithLong_(v9 & (v13 - 1));
  if ((v9 & v13) != 0)
  {
    if (!v11) {
      goto LABEL_20;
    }
    uint64_t isa_low = LODWORD(v11[1].super.isa);
    if ((v14 & 0x80000000) != 0 || (int)v14 >= (int)isa_low) {
      IOSArray_throwOutOfBoundsWithMsg(isa_low, v14);
    }
    uint64_t v16 = (unint64_t)v11[(int)v14 + 2].super.isa >> a3;
    if (v16) {
      return JavaLangLong_numberOfTrailingZerosWithLong_(v16) + a3;
    }
    uint64_t v14 = (v14 + 1);
  }
  unint64_t v18 = v9 >> ((a3 >> 6) & 0x3F);
  if (v18 <= 1)
  {
    return sub_1000A07B8((uint64_t)self, (int)v6 + 1);
  }
  int v19 = JavaLangLong_numberOfTrailingZerosWithLong_(v18 >> 1);
  if (!v11) {
LABEL_20:
  }
    JreThrowNullPointerException();
  int v20 = v12 + v19 + 1;
  uint64_t v21 = LODWORD(v11[1].super.isa);
  if ((v14 & 0x80000000) != 0 || (int)v14 >= (int)v21) {
    IOSArray_throwOutOfBoundsWithMsg(v21, v14);
  }
  return JavaLangLong_numberOfTrailingZerosWithLong_((uint64_t)v11[(int)v14 + 2].super.isa) | (v20 << 6);
}

- (int)lastDocWithInt:(int)a3
{
  return sub_1000A0AD0((uint64_t)self, *(uint64_t *)&a3);
}

- (int)prevSetBitWithInt:(int)a3
{
  indices = self->indices_;
  if (!indices) {
    goto LABEL_19;
  }
  uint64_t v6 = a3 >> 12;
  uint64_t size = indices->super.size_;
  if ((int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 12);
  }
  uint64_t bits = self->bits_;
  if (!bits) {
    goto LABEL_19;
  }
  int64_t v9 = indices->buffer_[v6];
  uint64_t v10 = bits->super.size_;
  if ((int)v6 >= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v10, a3 >> 12);
  }
  uint64_t v11 = (&bits->elementType_)[v6];
  uint64_t v12 = 1 << (a3 >> 6);
  unint64_t v13 = v9 & (v12 - 1);
  uint64_t v14 = JavaLangLong_bitCountWithLong_(v13);
  if ((v9 & v12) != 0)
  {
    if (!v11) {
      goto LABEL_19;
    }
    uint64_t isa_low = LODWORD(v11[1].super.isa);
    if ((v14 & 0x80000000) != 0 || (int)v14 >= (int)isa_low) {
      IOSArray_throwOutOfBoundsWithMsg(isa_low, v14);
    }
    unint64_t v16 = (uint64_t)v11[(int)v14 + 2].super.isa & ((2 << a3) - 1);
    if (v16) {
      return (63 - JavaLangLong_numberOfLeadingZerosWithLong_(v16)) | a3 & 0xFFFFFFC0;
    }
  }
  if (v13)
  {
    int v18 = JavaLangLong_numberOfLeadingZerosWithLong_(v13);
    if (v11)
    {
      int v19 = v18;
      uint64_t v20 = LODWORD(v11[1].super.isa);
      int v21 = v14 - 1;
      if ((int)v14 - 1 < 0 || v21 >= (int)v20) {
        IOSArray_throwOutOfBoundsWithMsg(v20, v21);
      }
      return (4032 - (v19 << 6)) | a3 & 0xFFFFF000 | (63
                                                    - JavaLangLong_numberOfLeadingZerosWithLong_((unint64_t)v11[v21 + 2].super.isa));
    }
LABEL_19:
    JreThrowNullPointerException();
  }
  return sub_1000A0AD0((uint64_t)self, (v6 - 1));
}

- (int64_t)longBitsWithLong:(int64_t)a3 withLongArray:(id)a4 withInt:(int)a5
{
  return sub_1000A0E40(a3, (uint64_t)a4, a5);
}

- (void)or__WithInt:(int)a3 withLong:(int64_t)a4 withLongArray:(id)a5 withInt:(int)a6
{
}

- (void)or__WithOrgApacheLuceneUtilSparseFixedBitSet:(id)a3
{
}

- (void)orDenseWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
}

- (void)or__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  id SparseFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator = OrgApacheLuceneUtilBitSetIterator_getSparseFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)a3);
  if (SparseFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator)
  {
    uint64_t v6 = (uint64_t)SparseFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator;
    [(OrgApacheLuceneUtilBitSet *)self assertUnpositionedWithOrgApacheLuceneSearchDocIdSetIterator:a3];
    sub_1000A1238((uint64_t)self, v6);
  }
  else
  {
    if (!a3 || (id v7 = [a3 cost], (indices = self->indices_) == 0)) {
      JreThrowNullPointerException();
    }
    if ((uint64_t)v7 >= indices->super.size_)
    {
      sub_1000A1340(self, a3);
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)OrgApacheLuceneUtilSparseFixedBitSet;
      [(OrgApacheLuceneUtilBitSet *)&v9 or__WithOrgApacheLuceneSearchDocIdSetIterator:a3];
    }
  }
}

- (void)and__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  id SparseFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator = OrgApacheLuceneUtilBitSetIterator_getSparseFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)a3);
  if (SparseFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator)
  {
    indices = self->indices_;
    if (!indices) {
LABEL_19:
    }
      JreThrowNullPointerException();
    uint64_t v6 = SparseFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator;
    int v7 = JavaLangMath_minWithInt_withInt_(indices->super.size_, *(_DWORD *)(SparseFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator[1] + 8));
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        uint64_t v10 = self->indices_;
        uint64_t size = v10->super.size_;
        if (v8 >= size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v8);
        }
        int64_t v12 = v10->buffer_[v8];
        uint64_t v13 = v6[1];
        uint64_t v14 = *(int *)(v13 + 8);
        if (v8 >= v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v8);
        }
        if ((*(void *)(v13 + 16 + 8 * v8) & v12) == 0)
        {
          uint64_t v15 = self->indices_;
          uint64_t v16 = v15->super.size_;
          if (v8 >= v16) {
            IOSArray_throwOutOfBoundsWithMsg(v16, v8);
          }
          self->nonZeroLongCount_ -= JavaLangLong_bitCountWithLong_(v15->buffer_[v8]);
          v17 = self->indices_;
          uint64_t v18 = v17->super.size_;
          if (v8 >= v18) {
            IOSArray_throwOutOfBoundsWithMsg(v18, v8);
          }
          v17->buffer_[v8] = 0;
          uint64_t bits = self->bits_;
          if (!bits) {
            goto LABEL_19;
          }
          IOSObjectArray_Set((uint64_t)bits, v8, 0);
        }
        ++v8;
      }
      while (v9 != v8);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)OrgApacheLuceneUtilSparseFixedBitSet;
  [(OrgApacheLuceneUtilBitSet *)&v21 and__WithOrgApacheLuceneSearchDocIdSetIterator:a3];
}

- (int64_t)ramBytesUsed
{
  return self->ramBytesUsed_;
}

- (NSString)description
{
  [(OrgApacheLuceneUtilSparseFixedBitSet *)self approximateCardinality];
  return (NSString *)JreStrcat("$I$I", v2, v3, v4, v5, v6, v7, v8, @"SparseFixedBitSet(size=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilSparseFixedBitSet;
  [(OrgApacheLuceneUtilSparseFixedBitSet *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = (void *)OrgApacheLuceneUtilSparseFixedBitSet_class_();
    qword_1005600F0 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    qword_1005600F8 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)+[IOSLongArray arrayWithLength:1]);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilSparseFixedBitSet__initialized);
  }
}

@end