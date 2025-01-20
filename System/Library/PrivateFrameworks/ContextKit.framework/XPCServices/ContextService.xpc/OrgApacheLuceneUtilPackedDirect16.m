@interface OrgApacheLuceneUtilPackedDirect16
- (OrgApacheLuceneUtilPackedDirect16)initWithInt:(int)a3;
- (OrgApacheLuceneUtilPackedDirect16)initWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withInt:(int)a5;
- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int64_t)getWithInt:(int)a3;
- (int64_t)ramBytesUsed;
- (void)clear;
- (void)dealloc;
- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedDirect16

- (OrgApacheLuceneUtilPackedDirect16)initWithInt:(int)a3
{
  return self;
}

- (OrgApacheLuceneUtilPackedDirect16)initWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withInt:(int)a5
{
  return self;
}

- (int64_t)getWithInt:(int)a3
{
  values = self->values_;
  if (!values) {
    JreThrowNullPointerException();
  }
  uint64_t size = values->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return *((unsigned __int16 *)&values->super.size_ + a3 + 2);
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  values = self->values_;
  if (!values) {
    JreThrowNullPointerException();
  }
  uint64_t size = values->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  *((_WORD *)&values->super.size_ + a3 + 2) = a4;
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
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithShortArray_((uint64_t)self->values_) + v4;
}

- (void)clear
{
}

- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a5;
  LODWORD(v8) = a3;
  int v10 = JavaLangMath_minWithInt_withInt_((self->super.valueCount_ - a3), a6);
  if (v10 + (int)v8 > (int)v8)
  {
    uint64_t v8 = (int)v8;
    int v11 = v10 + v8;
    do
    {
      values = self->values_;
      if (!values) {
        JreThrowNullPointerException();
      }
      uint64_t size = values->super.size_;
      if (v8 < 0 || v8 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v8);
      }
      uint64_t v14 = *((unsigned int *)a4 + 2);
      if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v6);
      }
      *((void *)a4 + (int)v6 + 2) = *((unsigned __int16 *)&values->super.size_ + v8++ + 2);
      uint64_t v6 = (v6 + 1);
    }
    while (v11 != v8);
  }
  return v10;
}

- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  LODWORD(v8) = a3;
  int v10 = JavaLangMath_minWithInt_withInt_((self->super.valueCount_ - a3), a6);
  int v11 = v10 + v8;
  if (v10 + (int)v8 > (int)v8)
  {
    uint64_t v8 = (int)v8;
    do
    {
      uint64_t v12 = a5;
      uint64_t v13 = *((unsigned int *)a4 + 2);
      if (a5 < 0 || a5 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, a5);
      }
      values = self->values_;
      if (!values) {
        JreThrowNullPointerException();
      }
      uint64_t size = values->super.size_;
      if (v8 < 0 || v8 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v8);
      }
      *((_WORD *)&values->super.size_ + v8++ + 2) = *((void *)a4 + v12 + 2);
      a5 = v12 + 1;
    }
    while (v11 != v8);
  }
  return v10;
}

- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5
{
  JavaUtilArrays_fillWithShortArray_withInt_withInt_withShort_((uint64_t)self->values_, *(uint64_t *)&a3, *(uint64_t *)&a4, (__int16)a5, a5, v5, v6, v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDirect16;
  [(OrgApacheLuceneUtilPackedDirect16 *)&v3 dealloc];
}

@end