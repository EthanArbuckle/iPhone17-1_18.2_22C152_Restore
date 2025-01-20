@interface OrgApacheLuceneUtilPackedPackedReaderIterator
- (OrgApacheLuceneUtilPackedPackedReaderIterator)initWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withOrgApacheLuceneStoreDataInput:(id)a7 withInt:(int)a8;
- (id)nextWithInt:(int)a3;
- (int)iterationsWithInt:(int)a3;
- (int)ord;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedPackedReaderIterator

- (OrgApacheLuceneUtilPackedPackedReaderIterator)initWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withOrgApacheLuceneStoreDataInput:(id)a7 withInt:(int)a8
{
  return self;
}

- (int)iterationsWithInt:(int)a3
{
  return sub_100141AD4((uint64_t)self, *(uint64_t *)&a3);
}

- (id)nextWithInt:(int)a3
{
  self->nextValues_->offset_ += self->nextValues_->length_;
  int valueCount = self->super.valueCount_;
  uint64_t v4 = (valueCount + ~self->position_);
  if ((int)v4 <= 0)
  {
    v24 = new_JavaIoEOFException_init();
    objc_exception_throw(v24);
  }
  int v6 = JavaLangMath_minWithInt_withInt_((valueCount + ~self->position_), a3);
  nextValues = self->nextValues_;
  int offset = nextValues->offset_;
  int size = nextValues->longs_->super.size_;
  if (offset == size)
  {
    format = self->format_;
    if (!format) {
      goto LABEL_11;
    }
    int64_t v11 = [(OrgApacheLuceneUtilPackedPackedInts_FormatEnum *)format byteCountWithInt:self->packedIntsVersion_ withInt:v4 withInt:self->super.bitsPerValue_];
    nextBlocks = self->nextBlocks_;
    if (!nextBlocks) {
      goto LABEL_11;
    }
    uint64_t v13 = JavaLangMath_minWithLong_withLong_(v11, nextBlocks->super.size_);
    in = self->super.in_;
    if (!in) {
      goto LABEL_11;
    }
    [(OrgApacheLuceneStoreDataInput *)in readBytesWithByteArray:self->nextBlocks_ withInt:0 withInt:v13];
    v19 = self->nextBlocks_;
    uint64_t v20 = v19->super.size_;
    if ((int)v20 > (int)v13) {
      JavaUtilArrays_fillWithByteArray_withInt_withInt_withByte_((uint64_t)v19, v13, v20, 0, v15, v16, v17, v18);
    }
    bulkOperation = self->bulkOperation_;
    if (!bulkOperation) {
LABEL_11:
    }
      JreThrowNullPointerException();
    [(OrgApacheLuceneUtilPackedBulkOperation *)bulkOperation decodeWithByteArray:self->nextBlocks_ withInt:0 withLongArray:self->nextValues_->longs_ withInt:0 withInt:self->iterations_];
    self->nextValues_->offset_ = 0;
    v22 = self->nextValues_;
    int size = v22->longs_->super.size_;
    int offset = v22->offset_;
  }
  self->nextValues_->length_ = JavaLangMath_minWithInt_withInt_((size - offset), v6);
  self->position_ += self->nextValues_->length_;
  return self->nextValues_;
}

- (int)ord
{
  return self->position_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedPackedReaderIterator;
  [(OrgApacheLuceneUtilPackedPackedInts_ReaderIteratorImpl *)&v3 dealloc];
}

@end