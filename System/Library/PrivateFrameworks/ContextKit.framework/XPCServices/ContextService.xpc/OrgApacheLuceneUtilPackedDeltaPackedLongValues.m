@interface OrgApacheLuceneUtilPackedDeltaPackedLongValues
+ (void)initialize;
- (OrgApacheLuceneUtilPackedDeltaPackedLongValues)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_ReaderArray:(id)a5 withLongArray:(id)a6 withLong:(int64_t)a7 withLong:(int64_t)a8;
- (int)decodeBlockWithInt:(int)a3 withLongArray:(id)a4;
- (int64_t)getWithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedDeltaPackedLongValues

- (OrgApacheLuceneUtilPackedDeltaPackedLongValues)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_ReaderArray:(id)a5 withLongArray:(id)a6 withLong:(int64_t)a7 withLong:(int64_t)a8
{
  return self;
}

- (int64_t)getWithInt:(int)a3 withInt:(int)a4
{
  mins = self->mins_;
  if (!mins) {
    goto LABEL_9;
  }
  uint64_t size = mins->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  values = self->super.values_;
  if (!values) {
    goto LABEL_9;
  }
  uint64_t v9 = values->super.size_;
  if (a3 < 0 || (int)v9 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v9, *(uint64_t *)&a3);
  }
  v10 = (&values->elementType_)[a3];
  if (!v10) {
LABEL_9:
  }
    JreThrowNullPointerException();
  int64_t v8 = mins->buffer_[a3];
  return (int64_t)-[IOSClass getWithInt:](v10, "getWithInt:", *(void *)&a4, *(void *)&a4) + v8;
}

- (int)decodeBlockWithInt:(int)a3 withLongArray:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  v15.receiver = self;
  v15.super_class = (Class)OrgApacheLuceneUtilPackedDeltaPackedLongValues;
  unsigned int v7 = -[OrgApacheLuceneUtilPackedPackedLongValues decodeBlockWithInt:withLongArray:](&v15, "decodeBlockWithInt:withLongArray:");
  mins = self->mins_;
  if (!mins) {
    goto LABEL_12;
  }
  int v9 = v7;
  uint64_t size = mins->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  if (v9 >= 1)
  {
    if (a4)
    {
      uint64_t v11 = 0;
      int64_t v12 = mins->buffer_[(int)v5];
      do
      {
        uint64_t v13 = *((int *)a4 + 2);
        if (v11 >= v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, v11);
        }
        *((void *)a4 + v11++ + 2) += v12;
      }
      while (v9 != v11);
      return v9;
    }
LABEL_12:
    JreThrowNullPointerException();
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDeltaPackedLongValues;
  [(OrgApacheLuceneUtilPackedPackedLongValues *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgApacheLuceneUtilPackedDeltaPackedLongValues_class_();
    qword_100560420 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilPackedDeltaPackedLongValues__initialized);
  }
}

@end