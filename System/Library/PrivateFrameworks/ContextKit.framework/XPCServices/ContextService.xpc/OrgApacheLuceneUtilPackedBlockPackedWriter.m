@interface OrgApacheLuceneUtilPackedBlockPackedWriter
- (OrgApacheLuceneUtilPackedBlockPackedWriter)initWithOrgApacheLuceneStoreDataOutput:(id)a3 withInt:(int)a4;
- (void)flush;
@end

@implementation OrgApacheLuceneUtilPackedBlockPackedWriter

- (OrgApacheLuceneUtilPackedBlockPackedWriter)initWithOrgApacheLuceneStoreDataOutput:(id)a3 withInt:(int)a4
{
  OrgApacheLuceneUtilPackedAbstractBlockPackedWriter_initWithOrgApacheLuceneStoreDataOutput_withInt_((id *)&self->super.super.isa, (uint64_t)a3, a4, *(uint64_t *)&a4, v4, v5, v6, v7);
  return self;
}

- (void)flush
{
  if (self->super.off_ < 1)
  {
    uint64_t v4 = 0x8000000000000000;
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0x8000000000000000;
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      values = self->super.values_;
      if (!values) {
        goto LABEL_30;
      }
      uint64_t size = values->super.size_;
      if (v3 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v3);
      }
      uint64_t v5 = JavaLangMath_minWithLong_withLong_(values->buffer_[v3], v5);
      v8 = self->super.values_;
      uint64_t v9 = v8->super.size_;
      if (v3 >= v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v3);
      }
      uint64_t v10 = JavaLangMath_maxWithLong_withLong_(v8->buffer_[v3], v4);
      uint64_t v4 = v10;
      ++v3;
    }
    while (v3 < self->super.off_);
    if (v10 == v5)
    {
      uint64_t v11 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v11 = OrgApacheLuceneUtilPackedPackedInts_unsignedBitsRequiredWithLong_(v4 - v5);
  if (v11 == 64)
  {
    uint64_t v5 = 0;
    goto LABEL_17;
  }
LABEL_15:
  if (v5 >= 1)
  {
    uint64_t v12 = OrgApacheLuceneUtilPackedPackedInts_maxValueWithInt_(v11);
    uint64_t v5 = JavaLangMath_maxWithLong_withLong_(0, v4 - v12);
  }
LABEL_17:
  out = self->super.out_;
  if (!out) {
    goto LABEL_30;
  }
  [(OrgApacheLuceneStoreDataOutput *)out writeByteWithByte:(char)((v5 == 0) | (2 * v11))];
  if (v5)
  {
    v14 = self->super.out_;
    uint64_t v15 = OrgApacheLuceneUtilBitUtil_zigZagEncodeWithLong_(v5);
    OrgApacheLuceneUtilPackedAbstractBlockPackedWriter_writeVLongWithOrgApacheLuceneStoreDataOutput_withLong_(v14, v15 - 1);
    if ((int)v11 >= 1)
    {
      int off = self->super.off_;
      if (off >= 1)
      {
        uint64_t v17 = 0;
        while (1)
        {
          v18 = self->super.values_;
          if (!v18) {
            break;
          }
          uint64_t v19 = v18->super.size_;
          if (v17 >= v19) {
            IOSArray_throwOutOfBoundsWithMsg(v19, v17);
          }
          v18->buffer_[v17++] -= v5;
          if (v17 >= off) {
            goto LABEL_28;
          }
        }
LABEL_30:
        JreThrowNullPointerException();
      }
      goto LABEL_28;
    }
  }
  else if ((int)v11 > 0)
  {
LABEL_28:
    [(OrgApacheLuceneUtilPackedAbstractBlockPackedWriter *)self writeValuesWithInt:v11];
  }
  self->super.off_ = 0;
}

@end