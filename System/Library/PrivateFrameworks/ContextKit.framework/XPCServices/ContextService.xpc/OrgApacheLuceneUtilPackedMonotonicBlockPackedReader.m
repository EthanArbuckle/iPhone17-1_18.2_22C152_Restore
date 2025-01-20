@interface OrgApacheLuceneUtilPackedMonotonicBlockPackedReader
+ (id)ofWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6 withBoolean:(BOOL)a7;
+ (int64_t)expectedWithLong:(int64_t)a3 withFloat:(float)a4 withInt:(int)a5;
- (NSString)description;
- (OrgApacheLuceneUtilPackedMonotonicBlockPackedReader)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6 withBoolean:(BOOL)a7;
- (int64_t)decodeDeltaWithLong:(int64_t)a3;
- (int64_t)getWithLong:(int64_t)a3;
- (int64_t)ramBytesUsed;
- (int64_t)size;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedMonotonicBlockPackedReader

+ (int64_t)expectedWithLong:(int64_t)a3 withFloat:(float)a4 withInt:(int)a5
{
  float v5 = (float)a5 * a4;
  uint64_t v6 = (uint64_t)v5;
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 < 0.0) {
    unint64_t v7 = 0x8000000000000000;
  }
  if (v6 == 0x8000000000000000) {
    uint64_t v6 = v7;
  }
  return v6 + a3;
}

+ (id)ofWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6 withBoolean:(BOOL)a7
{
  return OrgApacheLuceneUtilPackedMonotonicBlockPackedReader_ofWithOrgApacheLuceneStoreIndexInput_withInt_withInt_withLong_withBoolean_(a3, *(uint64_t *)&a4, *(uint64_t *)&a5, a6, a7);
}

- (OrgApacheLuceneUtilPackedMonotonicBlockPackedReader)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6 withBoolean:(BOOL)a7
{
  return self;
}

- (int64_t)getWithLong:(int64_t)a3
{
  minValues = self->minValues_;
  if (!minValues) {
    goto LABEL_17;
  }
  int blockMask = self->blockMask_;
  unint64_t v6 = (unint64_t)a3 >> self->blockShift_;
  uint64_t size = minValues->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)size <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  averages = self->averages_;
  if (!averages) {
    goto LABEL_17;
  }
  int64_t v9 = minValues->buffer_[(int)v6];
  uint64_t v10 = averages->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v10 <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(v10, v6);
  }
  subReaders = self->subReaders_;
  if (!subReaders) {
    goto LABEL_17;
  }
  uint64_t v12 = subReaders->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v12 <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v6);
  }
  v13 = (&subReaders->elementType_)[(int)v6];
  if (!v13) {
LABEL_17:
  }
    JreThrowNullPointerException();
  float v14 = *((float *)&averages->super.size_ + (int)v6 + 1) * (float)(int)(blockMask & a3);
  unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (v14 < 0.0) {
    unint64_t v15 = 0x8000000000000000;
  }
  if ((uint64_t)v14 == 0x8000000000000000) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = (uint64_t)v14;
  }
  return -[OrgApacheLuceneUtilPackedMonotonicBlockPackedReader decodeDeltaWithLong:](self, "decodeDeltaWithLong:", -[IOSClass getWithInt:](v13, "getWithInt:"))+ v9+ v16;
}

- (int64_t)decodeDeltaWithLong:(int64_t)a3
{
  return a3;
}

- (int64_t)size
{
  return self->valueCount_;
}

- (int64_t)ramBytesUsed
{
  uint64_t v3 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)self->minValues_);
  uint64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithFloatArray_((uint64_t)self->averages_);
  subReaders = self->subReaders_;
  if (!subReaders) {
LABEL_7:
  }
    JreThrowNullPointerException();
  int64_t v6 = v4 + v3;
  p_elementType = (void **)&subReaders->elementType_;
  unint64_t v8 = (unint64_t)&(&subReaders->elementType_)[subReaders->super.size_];
  while ((unint64_t)p_elementType < v8)
  {
    int64_t v9 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_7;
    }
    ++p_elementType;
    v6 += (int64_t)[v9 ramBytesUsed];
  }
  return v6;
}

- (NSString)description
{
  if (!self->subReaders_) {
    JreThrowNullPointerException();
  }
  id v2 = objc_msgSend(-[OrgApacheLuceneUtilPackedMonotonicBlockPackedReader getClass](self, "getClass"), "getSimpleName");
  return (NSString *)JreStrcat("$$I$J$JC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedMonotonicBlockPackedReader;
  [(OrgApacheLuceneUtilPackedMonotonicBlockPackedReader *)&v3 dealloc];
}

@end