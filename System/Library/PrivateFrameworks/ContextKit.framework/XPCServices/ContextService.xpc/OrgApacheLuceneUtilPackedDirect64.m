@interface OrgApacheLuceneUtilPackedDirect64
- (OrgApacheLuceneUtilPackedDirect64)initWithInt:(int)a3;
- (OrgApacheLuceneUtilPackedDirect64)initWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withInt:(int)a5;
- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int64_t)getWithInt:(int)a3;
- (int64_t)ramBytesUsed;
- (void)clear;
- (void)dealloc;
- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedDirect64

- (OrgApacheLuceneUtilPackedDirect64)initWithInt:(int)a3
{
  return self;
}

- (OrgApacheLuceneUtilPackedDirect64)initWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withInt:(int)a5
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
  return values->buffer_[a3];
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
  values->buffer_[a3] = a4;
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
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)self->values_) + v4;
}

- (void)clear
{
}

- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  uint64_t v10 = JavaLangMath_minWithInt_withInt_((self->super.valueCount_ - a3), a6);
  int v11 = v10;
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->values_, v8, a4, v6, v10);
  return v11;
}

- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  uint64_t v10 = JavaLangMath_minWithInt_withInt_((self->super.valueCount_ - a3), a6);
  int v11 = v10;
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a4, v6, self->values_, v8, v10);
  return v11;
}

- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5
{
  JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)self->values_, *(uint64_t *)&a3, *(uint64_t *)&a4, a5, a5, v5, v6, v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDirect64;
  [(OrgApacheLuceneUtilPackedDirect64 *)&v3 dealloc];
}

@end