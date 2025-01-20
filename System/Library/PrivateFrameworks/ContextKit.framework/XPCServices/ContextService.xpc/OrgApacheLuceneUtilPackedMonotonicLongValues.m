@interface OrgApacheLuceneUtilPackedMonotonicLongValues
+ (void)initialize;
- (OrgApacheLuceneUtilPackedMonotonicLongValues)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_ReaderArray:(id)a5 withLongArray:(id)a6 withFloatArray:(id)a7 withLong:(int64_t)a8 withLong:(int64_t)a9;
- (int)decodeBlockWithInt:(int)a3 withLongArray:(id)a4;
- (int64_t)getWithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedMonotonicLongValues

- (OrgApacheLuceneUtilPackedMonotonicLongValues)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_ReaderArray:(id)a5 withLongArray:(id)a6 withFloatArray:(id)a7 withLong:(int64_t)a8 withLong:(int64_t)a9
{
  return self;
}

- (int64_t)getWithInt:(int)a3 withInt:(int)a4
{
  mins = self->super.mins_;
  if (!mins) {
    goto LABEL_12;
  }
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t size = mins->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  averages = self->averages_;
  if (!averages) {
    goto LABEL_12;
  }
  uint64_t v10 = mins->buffer_[a3];
  uint64_t v11 = averages->super.size_;
  if (a3 < 0 || (int)v11 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v11, *(uint64_t *)&a3);
  }
  uint64_t v12 = OrgApacheLuceneUtilPackedMonotonicBlockPackedReader_expectedWithLong_withFloat_withInt_(v10, a4, *((float *)&averages->super.size_ + a3 + 1));
  values = self->super.super.values_;
  if (!values) {
    goto LABEL_12;
  }
  uint64_t v14 = v12;
  uint64_t v15 = values->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v15 <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(v15, v6);
  }
  v16 = (&values->elementType_)[(int)v6];
  if (!v16) {
LABEL_12:
  }
    JreThrowNullPointerException();
  return (int64_t)[(IOSClass *)v16 getWithInt:v5] + v14;
}

- (int)decodeBlockWithInt:(int)a3 withLongArray:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  v17.receiver = self;
  v17.super_class = (Class)OrgApacheLuceneUtilPackedMonotonicLongValues;
  unsigned int v7 = -[OrgApacheLuceneUtilPackedDeltaPackedLongValues decodeBlockWithInt:withLongArray:](&v17, "decodeBlockWithInt:withLongArray:");
  averages = self->averages_;
  if (!averages) {
    goto LABEL_12;
  }
  int v9 = v7;
  uint64_t size = averages->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  if (v9 >= 1)
  {
    uint64_t v11 = 0;
    float v12 = *((float *)&averages->super.size_ + (int)v5 + 1);
    while (1)
    {
      uint64_t v13 = OrgApacheLuceneUtilPackedMonotonicBlockPackedReader_expectedWithLong_withFloat_withInt_(0, v11, v12);
      if (!a4) {
        break;
      }
      uint64_t v14 = v13;
      uint64_t v15 = *((int *)a4 + 2);
      if (v11 >= v15) {
        IOSArray_throwOutOfBoundsWithMsg(v15, v11);
      }
      *((void *)a4 + v11++ + 2) += v14;
      if (v9 == v11) {
        return v9;
      }
    }
LABEL_12:
    JreThrowNullPointerException();
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedMonotonicLongValues;
  [(OrgApacheLuceneUtilPackedDeltaPackedLongValues *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgApacheLuceneUtilPackedMonotonicLongValues_class_();
    qword_10055FD48 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilPackedMonotonicLongValues__initialized);
  }
}

@end