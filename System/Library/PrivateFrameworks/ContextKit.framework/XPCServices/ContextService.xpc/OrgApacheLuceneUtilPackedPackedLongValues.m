@interface OrgApacheLuceneUtilPackedPackedLongValues
+ (id)deltaPackedBuilderWithInt:(int)a3 withFloat:(float)a4;
+ (id)monotonicBuilderWithInt:(int)a3 withFloat:(float)a4;
+ (id)packedBuilderWithInt:(int)a3 withFloat:(float)a4;
+ (void)initialize;
- (OrgApacheLuceneUtilPackedPackedLongValues)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_ReaderArray:(id)a5 withLong:(int64_t)a6 withLong:(int64_t)a7;
- (id)iterator;
- (int)decodeBlockWithInt:(int)a3 withLongArray:(id)a4;
- (int64_t)getWithInt:(int)a3 withInt:(int)a4;
- (int64_t)getWithLong:(int64_t)a3;
- (int64_t)ramBytesUsed;
- (int64_t)size;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedPackedLongValues

+ (id)packedBuilderWithInt:(int)a3 withFloat:(float)a4
{
  return OrgApacheLuceneUtilPackedPackedLongValues_packedBuilderWithInt_withFloat_(a3, a4);
}

+ (id)deltaPackedBuilderWithInt:(int)a3 withFloat:(float)a4
{
  return OrgApacheLuceneUtilPackedPackedLongValues_deltaPackedBuilderWithInt_withFloat_(a3, a4);
}

+ (id)monotonicBuilderWithInt:(int)a3 withFloat:(float)a4
{
  return OrgApacheLuceneUtilPackedPackedLongValues_monotonicBuilderWithInt_withFloat_(a3, a4);
}

- (OrgApacheLuceneUtilPackedPackedLongValues)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_ReaderArray:(id)a5 withLong:(int64_t)a6 withLong:(int64_t)a7
{
  self->pageShift_ = a3;
  self->pageMask_ = a4;
  JreStrongAssign((id *)&self->values_, a5);
  self->size_ = a6;
  self->ramBytesUsed_ = a7;
  return self;
}

- (int64_t)size
{
  return self->size_;
}

- (int)decodeBlockWithInt:(int)a3 withLongArray:(id)a4
{
  values = self->values_;
  if (!values) {
    goto LABEL_9;
  }
  uint64_t size = values->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v7 = (&values->elementType_)[a3];
  if (!v7) {
LABEL_9:
  }
    JreThrowNullPointerException();
  int v8 = [(IOSClass *)v7 size];
  if (v8 >= 1)
  {
    uint64_t v9 = 0;
    do
      LODWORD(v9) = [(IOSClass *)v7 getWithInt:v9 withLongArray:a4 withInt:v9 withInt:(v8 - v9)]+ v9;
    while ((int)v9 < v8);
  }
  return v8;
}

- (int64_t)getWithInt:(int)a3 withInt:(int)a4
{
  values = self->values_;
  if (!values) {
    goto LABEL_8;
  }
  uint64_t size = values->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v6 = (&values->elementType_)[a3];
  if (!v6) {
LABEL_8:
  }
    JreThrowNullPointerException();
  return (int64_t)[(IOSClass *)v6 getWithInt:*(void *)&a4];
}

- (int64_t)getWithLong:(int64_t)a3
{
  return [(OrgApacheLuceneUtilPackedPackedLongValues *)self getWithInt:a3 >> self->pageShift_ withInt:self->pageMask_ & a3];
}

- (int64_t)ramBytesUsed
{
  return self->ramBytesUsed_;
}

- (id)iterator
{
  v3 = [OrgApacheLuceneUtilPackedPackedLongValues_Iterator alloc];
  OrgApacheLuceneUtilPackedPackedLongValues_Iterator_initWithOrgApacheLuceneUtilPackedPackedLongValues_((uint64_t)v3, self);
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedPackedLongValues;
  [(OrgApacheLuceneUtilPackedPackedLongValues *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgApacheLuceneUtilPackedPackedLongValues_class_();
    qword_100560330 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilPackedPackedLongValues__initialized);
  }
}

@end