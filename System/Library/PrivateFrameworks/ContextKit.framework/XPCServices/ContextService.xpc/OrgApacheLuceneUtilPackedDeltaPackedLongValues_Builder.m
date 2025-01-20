@interface OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder
+ (void)initialize;
- (OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder)initWithInt:(int)a3 withFloat:(float)a4;
- (id)build;
- (int64_t)baseRamBytesUsed;
- (void)dealloc;
- (void)growWithInt:(int)a3;
- (void)packWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withFloat:(float)a6;
@end

@implementation OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder

- (OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder)initWithInt:(int)a3 withFloat:(float)a4
{
  OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder_initWithInt_withFloat_((uint64_t)self, a3, *(uint64_t *)&a3, v4, v5, v6, v7, v8, a4);
  return self;
}

- (int64_t)baseRamBytesUsed
{
  return qword_100560438;
}

- (id)build
{
  [(OrgApacheLuceneUtilPackedPackedLongValues_Builder *)self finish];
  JreStrongAssign((id *)&self->super.pending_, 0);
  v3 = JavaUtilArrays_copyOfWithNSObjectArray_withInt_(self->super.values_, self->super.valuesOff_);
  uint64_t v4 = JavaUtilArrays_copyOfWithLongArray_withInt_(self->mins_, self->super.valuesOff_);
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilPackedDeltaPackedLongValues__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v5 = qword_100560420;
  }
  uint64_t v6 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithOrgApacheLuceneUtilAccountableArray_((uint64_t)v3) + v5;
  uint64_t v7 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)v4);
  uint64_t v8 = new_OrgApacheLuceneUtilPackedDeltaPackedLongValues_initWithInt_withInt_withOrgApacheLuceneUtilPackedPackedInts_ReaderArray_withLongArray_withLong_withLong_(self->super.pageShift_, self->super.pageMask_, v3, v4, self->super.size_, v6 + v7);
  return v8;
}

- (void)packWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withFloat:(float)a6
{
  if (!a3) {
    goto LABEL_19;
  }
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v11 = *((unsigned int *)a3 + 2);
  if ((int)v11 < 1) {
    IOSArray_throwOutOfBoundsWithMsg(v11, 0);
  }
  uint64_t v12 = *((void *)a3 + 2);
  if (a4 > 1)
  {
    uint64_t v13 = 1;
    do
    {
      uint64_t v14 = *((int *)a3 + 2);
      if (v13 >= v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v13);
      }
      uint64_t v12 = JavaLangMath_minWithLong_withLong_(v12, *((void *)a3 + v13++ + 2));
    }
    while (v8 != v13);
  }
  if ((int)v8 >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = *((int *)a3 + 2);
      if (v15 >= v16) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v15);
      }
      *((void *)a3 + v15++ + 2) -= v12;
    }
    while (v8 != v15);
  }
  v20.receiver = self;
  v20.super_class = (Class)OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder;
  *(float *)&double v17 = a6;
  [(OrgApacheLuceneUtilPackedPackedLongValues_Builder *)&v20 packWithLongArray:a3 withInt:v8 withInt:v7 withFloat:v17];
  mins = self->mins_;
  if (!mins) {
LABEL_19:
  }
    JreThrowNullPointerException();
  uint64_t size = mins->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)size <= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  mins->buffer_[(int)v7] = v12;
}

- (void)growWithInt:(int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder;
  -[OrgApacheLuceneUtilPackedPackedLongValues_Builder growWithInt:](&v6, "growWithInt:");
  self->super.ramBytesUsed_ -= OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)self->mins_);
  uint64_t v5 = JavaUtilArrays_copyOfWithLongArray_withInt_(self->mins_, a3);
  JreStrongAssign((id *)&self->mins_, v5);
  self->super.ramBytesUsed_ += OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)self->mins_);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder;
  [(OrgApacheLuceneUtilPackedPackedLongValues_Builder *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder_class_();
    qword_100560438 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder__initialized);
  }
}

@end