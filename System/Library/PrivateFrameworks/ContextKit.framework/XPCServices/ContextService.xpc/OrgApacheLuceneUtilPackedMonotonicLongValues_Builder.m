@interface OrgApacheLuceneUtilPackedMonotonicLongValues_Builder
+ (void)initialize;
- (OrgApacheLuceneUtilPackedMonotonicLongValues_Builder)initWithInt:(int)a3 withFloat:(float)a4;
- (id)build;
- (int64_t)baseRamBytesUsed;
- (void)dealloc;
- (void)growWithInt:(int)a3;
- (void)packWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withFloat:(float)a6;
@end

@implementation OrgApacheLuceneUtilPackedMonotonicLongValues_Builder

- (OrgApacheLuceneUtilPackedMonotonicLongValues_Builder)initWithInt:(int)a3 withFloat:(float)a4
{
  OrgApacheLuceneUtilPackedMonotonicLongValues_Builder_initWithInt_withFloat_((uint64_t)self, a3, *(uint64_t *)&a3, v4, v5, v6, v7, v8, a4);
  return self;
}

- (int64_t)baseRamBytesUsed
{
  return qword_10055FD60;
}

- (id)build
{
  [(OrgApacheLuceneUtilPackedPackedLongValues_Builder *)self finish];
  JreStrongAssign((id *)&self->super.super.pending_, 0);
  v3 = JavaUtilArrays_copyOfWithNSObjectArray_withInt_(self->super.super.values_, self->super.super.valuesOff_);
  uint64_t v4 = JavaUtilArrays_copyOfWithLongArray_withInt_(self->super.mins_, self->super.super.valuesOff_);
  uint64_t v5 = JavaUtilArrays_copyOfWithFloatArray_withInt_(self->averages_, self->super.super.valuesOff_);
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilPackedMonotonicLongValues__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v6 = qword_10055FD48;
  }
  uint64_t v7 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithOrgApacheLuceneUtilAccountableArray_((uint64_t)v3) + v6;
  uint64_t v8 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)v4);
  uint64_t v9 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithFloatArray_((uint64_t)v5);
  v10 = new_OrgApacheLuceneUtilPackedMonotonicLongValues_initWithInt_withInt_withOrgApacheLuceneUtilPackedPackedInts_ReaderArray_withLongArray_withFloatArray_withLong_withLong_(self->super.super.pageShift_, self->super.super.pageMask_, v3, v4, v5, self->super.super.size_, v7 + v8 + v9);
  return v10;
}

- (void)packWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withFloat:(float)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  float v11 = 0.0;
  if (a4 == 1) {
    goto LABEL_7;
  }
  if (!a3) {
    goto LABEL_17;
  }
  uint64_t v12 = *((unsigned int *)a3 + 2);
  int v13 = a4 - 1;
  if (a4 - 1 < 0 || v13 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v13);
  }
  if ((int)v12 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v12, 0);
  }
  float v11 = (float)(uint64_t)(*((void *)a3 + a4 + 1) - *((void *)a3 + 2)) / (float)(a4 - 1);
  if (a4 >= 1)
  {
LABEL_7:
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = OrgApacheLuceneUtilPackedMonotonicBlockPackedReader_expectedWithLong_withFloat_withInt_(0, v14, v11);
      if (!a3) {
        break;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *((int *)a3 + 2);
      if (v14 >= v17) {
        IOSArray_throwOutOfBoundsWithMsg(v17, v14);
      }
      *((void *)a3 + v14++ + 2) -= v16;
      if (v8 == v14) {
        goto LABEL_13;
      }
    }
LABEL_17:
    JreThrowNullPointerException();
  }
LABEL_13:
  v21.receiver = self;
  v21.super_class = (Class)OrgApacheLuceneUtilPackedMonotonicLongValues_Builder;
  *(float *)&double v18 = a6;
  [(OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder *)&v21 packWithLongArray:a3 withInt:v8 withInt:v7 withFloat:v18];
  averages = self->averages_;
  if (!averages) {
    goto LABEL_17;
  }
  uint64_t size = averages->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)size <= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  *((float *)&averages->super.size_ + (int)v7 + 1) = v11;
}

- (void)growWithInt:(int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneUtilPackedMonotonicLongValues_Builder;
  -[OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder growWithInt:](&v6, "growWithInt:");
  self->super.super.ramBytesUsed_ -= OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithFloatArray_((uint64_t)self->averages_);
  uint64_t v5 = JavaUtilArrays_copyOfWithFloatArray_withInt_(self->averages_, a3);
  JreStrongAssign((id *)&self->averages_, v5);
  self->super.super.ramBytesUsed_ += OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithFloatArray_((uint64_t)self->averages_);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedMonotonicLongValues_Builder;
  [(OrgApacheLuceneUtilPackedDeltaPackedLongValues_Builder *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgApacheLuceneUtilPackedMonotonicLongValues_Builder_class_();
    qword_10055FD60 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilPackedMonotonicLongValues_Builder__initialized);
  }
}

@end