@interface OrgApacheLuceneUtilPackedGrowableWriter
- (OrgApacheLuceneUtilPackedGrowableWriter)initWithInt:(int)a3 withInt:(int)a4 withFloat:(float)a5;
- (id)getMutable;
- (id)resizeWithInt:(int)a3;
- (int)getBitsPerValue;
- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)size;
- (int64_t)getWithInt:(int)a3;
- (int64_t)ramBytesUsed;
- (void)clear;
- (void)dealloc;
- (void)ensureCapacityWithLong:(int64_t)a3;
- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5;
- (void)saveWithOrgApacheLuceneStoreDataOutput:(id)a3;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedGrowableWriter

- (OrgApacheLuceneUtilPackedGrowableWriter)initWithInt:(int)a3 withInt:(int)a4 withFloat:(float)a5
{
  return self;
}

- (int64_t)getWithInt:(int)a3
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneUtilPackedPackedInts_Mutable *)current getWithInt:*(void *)&a3];
}

- (int)size
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)current size];
}

- (int)getBitsPerValue
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)current getBitsPerValue];
}

- (id)getMutable
{
  return self->current_;
}

- (void)ensureCapacityWithLong:(int64_t)a3
{
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  sub_100021458((uint64_t)self, a4);
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)current setWithInt:v5 withLong:a4];
}

- (void)clear
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)current clear];
}

- (id)resizeWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(OrgApacheLuceneUtilPackedGrowableWriter *)self getBitsPerValue];
  float acceptableOverheadRatio = self->acceptableOverheadRatio_;
  v7 = [OrgApacheLuceneUtilPackedGrowableWriter alloc];
  OrgApacheLuceneUtilPackedGrowableWriter_initWithInt_withInt_withFloat_((uint64_t)v7, v5, v3, acceptableOverheadRatio);
  v8 = v7;
  uint64_t v9 = JavaLangMath_minWithInt_withInt_([(OrgApacheLuceneUtilPackedGrowableWriter *)self size], v3);
  OrgApacheLuceneUtilPackedPackedInts_copy__WithOrgApacheLuceneUtilPackedPackedInts_Reader_withInt_withOrgApacheLuceneUtilPackedPackedInts_Mutable_withInt_withInt_withInt_(self->current_, 0, v8, 0, v9, 0x400u);
  return v8;
}

- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilPackedPackedInts_Reader *)current getWithInt:*(void *)&a3 withLongArray:a4 withInt:*(void *)&a5 withInt:*(void *)&a6];
}

- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v9 = *(void *)&a3;
  if (a6 + a5 <= a5)
  {
    unint64_t v11 = 0;
  }
  else
  {
    if (!a4) {
      goto LABEL_14;
    }
    unint64_t v11 = 0;
    uint64_t v12 = a5;
    int v13 = a6;
    do
    {
      uint64_t v14 = *((unsigned int *)a4 + 2);
      if (v12 < 0 || v12 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v12);
      }
      v11 |= *((void *)a4 + v12++ + 2);
      --v13;
    }
    while (v13);
  }
  sub_100021458((uint64_t)self, v11);
  current = self->current_;
  if (!current) {
LABEL_14:
  }
    JreThrowNullPointerException();
  return [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)current setWithInt:v9 withLongArray:a4 withInt:v7 withInt:v6];
}

- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  sub_100021458((uint64_t)self, a5);
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)current fillWithInt:v7 withInt:v6 withLong:a5];
}

- (int64_t)ramBytesUsed
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  int v3 = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_HEADER_;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_alignObjectSizeWithLong_(v3
  }
                                                                   + OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_ + 12);
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneUtilPackedPackedInts_Mutable *)current ramBytesUsed] + v4;
}

- (void)saveWithOrgApacheLuceneStoreDataOutput:(id)a3
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneUtilPackedPackedInts_Mutable *)current saveWithOrgApacheLuceneStoreDataOutput:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedGrowableWriter;
  [(OrgApacheLuceneUtilPackedGrowableWriter *)&v3 dealloc];
}

@end