@interface OrgApacheLuceneUtilPackedPacked64
- (OrgApacheLuceneUtilPackedPacked64)initWithInt:(int)a3 withInt:(int)a4;
- (OrgApacheLuceneUtilPackedPacked64)initWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (id)description;
- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int64_t)getWithInt:(int)a3;
- (int64_t)ramBytesUsed;
- (void)clear;
- (void)dealloc;
- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedPacked64

- (OrgApacheLuceneUtilPackedPacked64)initWithInt:(int)a3 withInt:(int)a4
{
  return self;
}

- (OrgApacheLuceneUtilPackedPacked64)initWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return self;
}

- (int64_t)getWithInt:(int)a3
{
  unint64_t v4 = self->super.bitsPerValue_ * (uint64_t)a3;
  uint64_t v5 = v4 >> 6;
  uint64_t bpvMinusBlockSize = self->bpvMinusBlockSize_;
  unint64_t v7 = v4 & 0x3F;
  blocks = self->blocks_;
  char v9 = v7 + bpvMinusBlockSize;
  if (!(((uint64_t)(v7 + bpvMinusBlockSize) < 0) ^ __OFADD__(v7, bpvMinusBlockSize) | (v7 + bpvMinusBlockSize == 0)))
  {
    if (blocks)
    {
      uint64_t v10 = v5 << 32;
      uint64_t size = blocks->super.size_;
      if ((v5 & 0x80000000) != 0 || (int)size <= (int)v5) {
        IOSArray_throwOutOfBoundsWithMsg(size, (int)v5);
      }
      v12 = blocks;
      int64_t v13 = blocks->buffer_[(int)v5] << v9;
      uint64_t v14 = ((uint64_t)&_mh_execute_header + v10) >> 32;
      if ((uint64_t)&_mh_execute_header + v10 < 0 || (int)size <= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(size, ((uint64_t)&_mh_execute_header + v10) >> 32);
      }
      int64_t v15 = ((unint64_t)v12->buffer_[v14] >> -v9) | v13;
      int64_t maskRight = self->maskRight_;
      return v15 & maskRight;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (!blocks) {
    goto LABEL_13;
  }
  uint64_t v17 = blocks->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)v17 <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(v17, v5);
  }
  int64_t maskRight = (unint64_t)blocks->buffer_[(int)v5] >> -v9;
  int64_t v15 = self->maskRight_;
  return v15 & maskRight;
}

- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  int v10 = JavaLangMath_minWithInt_withInt_(*(uint64_t *)&a6, self->super.valueCount_ - a3);
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v11 = (void *)OrgApacheLuceneUtilPackedBulkOperation_ofWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_((void *)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_, self->super.bitsPerValue_);
  if (!v11) {
    JreThrowNullPointerException();
  }
  v12 = v11;
  int v13 = (int)v8 % (int)[v11 longValueCount];
  if (v13)
  {
    BOOL v14 = v13 >= (int)[v12 longValueCount] || v10 < 1;
    int v24 = v8;
    if (v14)
    {
      int v15 = v10;
      LODWORD(v20) = v8;
    }
    else
    {
      uint64_t v20 = v8;
      int v21 = v13 + 1;
      do
      {
        int64_t v22 = [(OrgApacheLuceneUtilPackedPacked64 *)self getWithInt:v20];
        uint64_t v23 = *((unsigned int *)a4 + 2);
        if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (int)v6);
        }
        *((void *)a4 + (int)v6 + 2) = v22;
        int v15 = v10 - 1;
        uint64_t v20 = (v20 + 1);
        uint64_t v6 = (v6 + 1);
        if (v21 >= (int)[v12 longValueCount]) {
          break;
        }
        ++v21;
        BOOL v14 = v10-- > 1;
      }
      while (v14);
    }
    if (!v15) {
      return v20 - v24;
    }
    int v10 = v15;
    LODWORD(v8) = v24;
  }
  else
  {
    LODWORD(v20) = v8;
  }
  unint64_t v16 = (unint64_t)(self->super.bitsPerValue_ * (uint64_t)(int)v20) >> 6;
  uint64_t v17 = (v10 / (int)[v12 longValueCount]);
  [v12 decodeWithLongArray:self->blocks_ withInt:v16 withLongArray:a4 withInt:v6 withInt:v17];
  int v18 = [v12 longValueCount] * v17 + v20;
  int result = v18 - v8;
  if (v18 <= (int)v8)
  {
    v25.receiver = self;
    v25.super_class = (Class)OrgApacheLuceneUtilPackedPacked64;
    return -[OrgApacheLuceneUtilPackedPackedInts_Reader getWithInt:withLongArray:withInt:withInt:](&v25, "getWithInt:withLongArray:withInt:withInt:");
  }
  return result;
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  uint64_t v5 = self->super.bitsPerValue_ * (uint64_t)a3;
  uint64_t v6 = (unint64_t)v5 >> 6;
  blocks = self->blocks_;
  uint64_t v8 = (v5 & 0x3F) + self->bpvMinusBlockSize_;
  uint64_t v9 = (int)(v5 >> 6);
  uint64_t size = blocks->super.size_;
  BOOL v12 = (((unint64_t)v5 >> 6) & 0x80000000) != 0 || (int)size <= (int)v6;
  if (v8 > 0)
  {
    if (v12) {
      IOSArray_throwOutOfBoundsWithMsg(size, v6);
    }
    if (blocks)
    {
      uint64_t v13 = v6 << 32;
      uint64_t v14 = blocks->super.size_;
      if ((v6 & 0x80000000) != 0 || (int)v14 <= (int)v6) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v6);
      }
      blocks->buffer_[v9] = blocks->buffer_[v9] & ~((unint64_t)self->maskRight_ >> v8) | ((unint64_t)a4 >> v8);
      int v15 = self->blocks_;
      uint64_t v16 = v15->super.size_;
      uint64_t v17 = ((uint64_t)&_mh_execute_header + v13) >> 32;
      if ((uint64_t)&_mh_execute_header + v13 < 0 || (int)v16 <= (int)v17) {
        IOSArray_throwOutOfBoundsWithMsg(v16, ((uint64_t)&_mh_execute_header + v13) >> 32);
      }
      if ((((unint64_t)&_mh_execute_header + v13) & 0x8000000000000000) != 0 || (int)v16 <= (int)v17) {
        IOSArray_throwOutOfBoundsWithMsg(v16, ((uint64_t)&_mh_execute_header + v13) >> 32);
      }
      v15->buffer_[v17] = v15->buffer_[v17] & (0xFFFFFFFFFFFFFFFFLL >> (v8 & 0x3F)) | (a4 << -(char)v8);
      return;
    }
LABEL_27:
    JreThrowNullPointerException();
  }
  if (v12) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  if (!blocks) {
    goto LABEL_27;
  }
  uint64_t v18 = blocks->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v18 <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v6);
  }
  blocks->buffer_[v9] = blocks->buffer_[v9] & ~(self->maskRight_ << -(char)v8) | (a4 << -(char)v8);
}

- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  int v10 = JavaLangMath_minWithInt_withInt_(*(uint64_t *)&a6, self->super.valueCount_ - a3);
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v11 = (void *)OrgApacheLuceneUtilPackedBulkOperation_ofWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_((void *)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_, self->super.bitsPerValue_);
  if (!v11) {
    JreThrowNullPointerException();
  }
  BOOL v12 = v11;
  int v13 = (int)v8 % (int)[v11 longValueCount];
  if (v13)
  {
    BOOL v14 = v13 >= (int)[v12 longValueCount] || v10 < 1;
    int v23 = v8;
    if (v14)
    {
      int v15 = v10;
      LODWORD(v20) = v8;
    }
    else
    {
      uint64_t v20 = v8;
      int v21 = v13 + 1;
      do
      {
        uint64_t v22 = *((unsigned int *)a4 + 2);
        if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (int)v6);
        }
        [(OrgApacheLuceneUtilPackedPacked64 *)self setWithInt:v20 withLong:*((void *)a4 + (int)v6 + 2)];
        int v15 = v10 - 1;
        uint64_t v20 = (v20 + 1);
        uint64_t v6 = (v6 + 1);
        if (v21 >= (int)[v12 longValueCount]) {
          break;
        }
        ++v21;
        BOOL v14 = v10-- > 1;
      }
      while (v14);
    }
    if (!v15) {
      return v20 - v23;
    }
    int v10 = v15;
    LODWORD(v8) = v23;
  }
  else
  {
    LODWORD(v20) = v8;
  }
  unint64_t v16 = (unint64_t)(self->super.bitsPerValue_ * (uint64_t)(int)v20) >> 6;
  uint64_t v17 = (v10 / (int)[v12 longValueCount]);
  [v12 encodeWithLongArray:a4 withInt:v6 withLongArray:self->blocks_ withInt:v16 withInt:v17];
  int v18 = [v12 longValueCount] * v17 + v20;
  int result = v18 - v8;
  if (v18 <= (int)v8)
  {
    v24.receiver = self;
    v24.super_class = (Class)OrgApacheLuceneUtilPackedPacked64;
    return -[OrgApacheLuceneUtilPackedPackedInts_Mutable setWithInt:withLongArray:withInt:withInt:](&v24, "setWithInt:withLongArray:withInt:withInt:");
  }
  return result;
}

- (id)description
{
  [(OrgApacheLuceneUtilPackedPackedInts_MutableImpl *)self size];
  if (!self->blocks_) {
    JreThrowNullPointerException();
  }
  return (id)JreStrcat("$I$I$IC", v3, v4, v5, v6, v7, v8, v9, @"Packed64(bitsPerValue=");
}

- (int64_t)ramBytesUsed
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  int v3 = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_HEADER_;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_alignObjectSizeWithLong_(v3
  }
                                                                   + OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_ + 20);
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)self->blocks_) + v4;
}

- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t bitsPerValue = self->super.bitsPerValue_;
  uint64_t v10 = 64;
  uint64_t v11 = bitsPerValue;
  while (1)
  {
    do
    {
      uint64_t v12 = v11;
      uint64_t v11 = v10;
      uint64_t v10 = v12;
    }
    while ((int)v11 < (int)v12);
    if (!v12) {
      break;
    }
    uint64_t v11 = ((int)v11 % (int)v12);
    uint64_t v10 = v12;
  }
  uint64_t v13 = (64 / (int)v11);
  if (a4 - a3 <= 3 * (int)v13)
  {
    v30.receiver = self;
    v30.super_class = (Class)OrgApacheLuceneUtilPackedPacked64;
    [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)&v30 fillWithInt:*(void *)&a3 withInt:*(void *)&a4 withLong:a5];
  }
  else
  {
    int v14 = a3 % (int)v13;
    if (a3 % (int)v13 && (v13 & 0x80000000) == 0)
    {
      do
      {
        uint64_t v15 = v7;
        uint64_t v7 = (v7 + 1);
        [(OrgApacheLuceneUtilPackedPacked64 *)self setWithInt:v15 withLong:a5];
        ++v14;
      }
      while (v14 < (int)v13);
      uint64_t bitsPerValue = self->super.bitsPerValue_;
    }
    unint64_t v16 = [OrgApacheLuceneUtilPackedPacked64 alloc];
    OrgApacheLuceneUtilPackedPacked64_initWithInt_withInt_((uint64_t)v16, v13, bitsPerValue);
    uint64_t v17 = v16;
    if ((int)v13 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        [(OrgApacheLuceneUtilPackedPacked64 *)v17 setWithInt:v18 withLong:a5];
        uint64_t v18 = (v18 + 1);
      }
      while (v13 != v18);
    }
    uint64_t v19 = self->super.bitsPerValue_;
    unint64_t v20 = (unint64_t)((int)v19 * (uint64_t)(int)v7) >> 6;
    unint64_t v21 = (unint64_t)((int)v19 * (uint64_t)a4) >> 6;
    if ((int)v20 < (int)v21)
    {
      int v22 = ((int)bitsPerValue * (int)v13) >> 6;
      blocks = v17->blocks_;
      uint64_t v24 = (int)v20;
      do
      {
        int v25 = (int)v24 % v22;
        uint64_t size = blocks->super.size_;
        if ((int)v24 % v22 < 0 || v25 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v25);
        }
        v27 = self->blocks_;
        if (!v27) {
          JreThrowNullPointerException();
        }
        uint64_t v28 = v27->super.size_;
        if (v24 < 0 || v24 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, v24);
        }
        v27->buffer_[v24] = blocks->buffer_[(int)v24 % v22];
        ++v24;
      }
      while ((int)v21 != v24);
      uint64_t v19 = self->super.bitsPerValue_;
    }
    uint64_t v29 = ((uint64_t)(int)v21 << 6) / v19;
    if ((int)v29 < a4)
    {
      do
      {
        [(OrgApacheLuceneUtilPackedPacked64 *)self setWithInt:v29 withLong:a5];
        uint64_t v29 = (v29 + 1);
      }
      while (a4 != v29);
    }
  }
}

- (void)clear
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedPacked64;
  [(OrgApacheLuceneUtilPackedPacked64 *)&v3 dealloc];
}

@end