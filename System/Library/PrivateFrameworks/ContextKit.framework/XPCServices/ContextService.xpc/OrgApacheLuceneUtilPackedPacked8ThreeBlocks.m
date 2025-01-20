@interface OrgApacheLuceneUtilPackedPacked8ThreeBlocks
- (OrgApacheLuceneUtilPackedPacked8ThreeBlocks)initWithInt:(int)a3;
- (OrgApacheLuceneUtilPackedPacked8ThreeBlocks)initWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withInt:(int)a5;
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

@implementation OrgApacheLuceneUtilPackedPacked8ThreeBlocks

- (OrgApacheLuceneUtilPackedPacked8ThreeBlocks)initWithInt:(int)a3
{
  return self;
}

- (OrgApacheLuceneUtilPackedPacked8ThreeBlocks)initWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withInt:(int)a5
{
  return self;
}

- (int64_t)getWithInt:(int)a3
{
  blocks = self->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  int v4 = 3 * a3;
  uint64_t size = blocks->super.size_;
  if (3 * a3 < 0 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (3 * a3));
  }
  v6 = blocks;
  uint64_t v7 = *((unsigned __int8 *)&blocks->super.size_ + v4 + 4);
  int v8 = v4 + 1;
  if (v4 + 1 < 0 || v8 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v8);
  }
  uint64_t v9 = *((unsigned __int8 *)&blocks->super.size_ + v4 + 5);
  uint64_t v10 = (v4 + 2);
  if ((int)v10 < 0 || (int)v10 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v10);
  }
  return (v7 << 16) | (v9 << 8) | *((unsigned __int8 *)&v6->super.size_ + (int)v10 + 4);
}

- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a5;
  int v10 = JavaLangMath_minWithInt_withInt_((self->super.valueCount_ - a3), a6);
  uint64_t v11 = (3 * a3);
  for (i = 3 * (v10 + a3); (int)v11 < i; uint64_t v6 = (v6 + 1))
  {
    blocks = self->blocks_;
    if (!blocks) {
      JreThrowNullPointerException();
    }
    uint64_t size = blocks->super.size_;
    if ((v11 & 0x80000000) != 0 || (int)v11 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v11);
    }
    int v15 = v11 + 1;
    if ((int)v11 < -1 || v15 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v15);
    }
    uint64_t v16 = *((unsigned __int8 *)&self->blocks_->super.size_ + v15 + 4);
    int v17 = v11 + 2;
    if ((int)v11 + 2 < 0 || v17 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v17);
    }
    uint64_t v18 = *((unsigned int *)a4 + 2);
    if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)v18) {
      IOSArray_throwOutOfBoundsWithMsg(v18, v6);
    }
    *((void *)a4 + (int)v6 + 2) = ((unint64_t)*((unsigned __int8 *)&blocks->super.size_ + (int)v11 + 4) << 16) | (v16 << 8) | *((unsigned __int8 *)&blocks->super.size_ + v17 + 4);
    uint64_t v11 = (v11 + 3);
  }
  return v10;
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  blocks = self->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  int v6 = 3 * a3;
  uint64_t size = blocks->super.size_;
  if (3 * a3 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (3 * a3));
  }
  *((unsigned char *)&blocks->super.size_ + v6 + 4) = BYTE2(a4);
  int v8 = self->blocks_;
  uint64_t v9 = v8->super.size_;
  int v10 = v6 + 1;
  if (v6 + 1 < 0 || v10 >= (int)v9) {
    IOSArray_throwOutOfBoundsWithMsg(v9, v10);
  }
  *((unsigned char *)&v8->super.size_ + v10 + 4) = BYTE1(a4);
  uint64_t v11 = self->blocks_;
  uint64_t v12 = v11->super.size_;
  int v13 = v6 + 2;
  if (v6 + 2 < 0 || v13 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, (v6 + 2));
  }
  *((unsigned char *)&v11->super.size_ + v13 + 4) = a4;
}

- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  LODWORD(v6) = a5;
  int v10 = JavaLangMath_minWithInt_withInt_((self->super.valueCount_ - a3), a6);
  int v11 = v10 + v6;
  if (v10 + (int)v6 > (int)v6)
  {
    uint64_t v6 = (int)v6;
    uint64_t v12 = (3 * a3);
    do
    {
      uint64_t v13 = *((unsigned int *)a4 + 2);
      if (v6 < 0 || v6 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v6);
      }
      blocks = self->blocks_;
      if (!blocks) {
        JreThrowNullPointerException();
      }
      uint64_t v15 = *((void *)a4 + v6 + 2);
      uint64_t size = blocks->super.size_;
      if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v12);
      }
      *((unsigned char *)&blocks->super.size_ + (int)v12 + 4) = BYTE2(v15);
      int v17 = v12 + 1;
      uint64_t v18 = self->blocks_;
      uint64_t v19 = v18->super.size_;
      if (v12 + 1 < 0 || v17 >= (int)v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, (v12 + 1));
      }
      *((unsigned char *)&v18->super.size_ + v17 + 4) = BYTE1(v15);
      int v20 = v12 + 2;
      v21 = self->blocks_;
      uint64_t v22 = v21->super.size_;
      if (v12 + 2 < 0 || v20 >= (int)v22) {
        IOSArray_throwOutOfBoundsWithMsg(v22, (v12 + 2));
      }
      *((unsigned char *)&v21->super.size_ + v20 + 4) = v15;
      ++v6;
      uint64_t v12 = (v12 + 3);
    }
    while (v11 != v6);
  }
  return v10;
}

- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5
{
  for (uint64_t i = (3 * a3); (int)i < 3 * a4; uint64_t i = (i + 3))
  {
    blocks = self->blocks_;
    if (!blocks) {
      JreThrowNullPointerException();
    }
    uint64_t size = blocks->super.size_;
    if ((i & 0x80000000) != 0 || (int)i >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, i);
    }
    *((unsigned char *)&blocks->super.size_ + (int)i + 4) = BYTE2(a5);
    uint64_t v9 = self->blocks_;
    int v10 = i + 1;
    uint64_t v11 = v9->super.size_;
    if ((int)i < -1 || v10 >= (int)v11) {
      IOSArray_throwOutOfBoundsWithMsg(v11, v10);
    }
    *((unsigned char *)&v9->super.size_ + v10 + 4) = BYTE1(a5);
    uint64_t v12 = self->blocks_;
    uint64_t v13 = v12->super.size_;
    int v14 = i + 2;
    if ((int)i + 2 < 0 || v14 >= (int)v13) {
      IOSArray_throwOutOfBoundsWithMsg(v13, v14);
    }
    *((unsigned char *)&v12->super.size_ + (int)i + 6) = a5;
  }
}

- (void)clear
{
}

- (int64_t)ramBytesUsed
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  int v3 = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_HEADER_;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_alignObjectSizeWithLong_(v3
  }
                                                                   + OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_ + 8);
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithByteArray_((uint64_t)self->blocks_) + v4;
}

- (id)description
{
  id v3 = objc_msgSend(-[OrgApacheLuceneUtilPackedPacked8ThreeBlocks getClass](self, "getClass"), "getSimpleName");
  [(OrgApacheLuceneUtilPackedPackedInts_MutableImpl *)self size];
  if (!self->blocks_) {
    JreThrowNullPointerException();
  }
  return (id)JreStrcat("$$I$I$IC", v4, v5, v6, v7, v8, v9, v10, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedPacked8ThreeBlocks;
  [(OrgApacheLuceneUtilPackedPacked8ThreeBlocks *)&v3 dealloc];
}

@end