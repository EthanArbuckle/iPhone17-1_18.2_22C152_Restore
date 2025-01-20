@interface OrgApacheLuceneUtilPackedPackedInts_NullReader
- (OrgApacheLuceneUtilPackedPackedInts_NullReader)initWithInt:(int)a3;
- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)size;
- (int64_t)getWithInt:(int)a3;
- (int64_t)ramBytesUsed;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts_NullReader

- (OrgApacheLuceneUtilPackedPackedInts_NullReader)initWithInt:(int)a3
{
  self->valueCount_ = a3;
  return self;
}

- (int64_t)getWithInt:(int)a3
{
  return 0;
}

- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a5;
  int v8 = JavaLangMath_minWithInt_withInt_(*(uint64_t *)&a6, self->valueCount_ - a3);
  JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)a4, v6, (v8 + v6), 0, v9, v10, v11, v12);
  return v8;
}

- (int)size
{
  return self->valueCount_;
}

- (int64_t)ramBytesUsed
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v2 = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_HEADER_ + 4;
  }
  return OrgApacheLuceneUtilRamUsageEstimator_alignObjectSizeWithLong_(v2);
}

@end