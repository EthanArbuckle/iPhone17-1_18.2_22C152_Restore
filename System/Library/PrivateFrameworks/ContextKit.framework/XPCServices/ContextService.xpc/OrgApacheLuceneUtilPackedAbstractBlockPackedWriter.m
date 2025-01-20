@interface OrgApacheLuceneUtilPackedAbstractBlockPackedWriter
+ (void)writeVLongWithOrgApacheLuceneStoreDataOutput:(id)a3 withLong:(int64_t)a4;
- (OrgApacheLuceneUtilPackedAbstractBlockPackedWriter)initWithOrgApacheLuceneStoreDataOutput:(id)a3 withInt:(int)a4;
- (int64_t)ord;
- (void)addBlockOfZeros;
- (void)addWithLong:(int64_t)a3;
- (void)dealloc;
- (void)finish;
- (void)resetWithOrgApacheLuceneStoreDataOutput:(id)a3;
- (void)writeValuesWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilPackedAbstractBlockPackedWriter

+ (void)writeVLongWithOrgApacheLuceneStoreDataOutput:(id)a3 withLong:(int64_t)a4
{
}

- (OrgApacheLuceneUtilPackedAbstractBlockPackedWriter)initWithOrgApacheLuceneStoreDataOutput:(id)a3 withInt:(int)a4
{
  OrgApacheLuceneUtilPackedAbstractBlockPackedWriter_initWithOrgApacheLuceneStoreDataOutput_withInt_((id *)&self->super.isa, (uint64_t)a3, a4, *(uint64_t *)&a4, v4, v5, v6, v7);
  return self;
}

- (void)resetWithOrgApacheLuceneStoreDataOutput:(id)a3
{
  self->off_ = 0;
  self->ord_ = 0;
  self->finished_ = 0;
}

- (void)addWithLong:(int64_t)a3
{
  sub_100010824((uint64_t)self);
  values = self->values_;
  if (!values) {
    JreThrowNullPointerException();
  }
  uint64_t off = self->off_;
  if (off == values->super.size_)
  {
    [(OrgApacheLuceneUtilPackedAbstractBlockPackedWriter *)self flush];
    values = self->values_;
    uint64_t off = self->off_;
  }
  self->off_ = off + 1;
  uint64_t size = values->super.size_;
  if ((off & 0x80000000) != 0 || (int)off >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, off);
  }
  values->buffer_[(int)off] = a3;
  ++self->ord_;
}

- (void)addBlockOfZeros
{
  sub_100010824((uint64_t)self);
  int off = self->off_;
  values = self->values_;
  if (!off)
  {
    if (values) {
      goto LABEL_6;
    }
LABEL_9:
    JreThrowNullPointerException();
  }
  if (!values) {
    goto LABEL_9;
  }
  if (off != values->super.size_)
  {
    CFStringRef v12 = JreStrcat("I", v3, v4, v5, v6, v7, v8, v9, self->off_);
    v13 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v12);
    objc_exception_throw(v13);
  }
LABEL_6:
  if (off == values->super.size_)
  {
    [(OrgApacheLuceneUtilPackedAbstractBlockPackedWriter *)self flush];
    values = self->values_;
  }
  JavaUtilArrays_fillWithLongArray_withLong_((uint64_t)values, 0);
  v14 = self->values_;
  self->off_ = v14->super.size_;
  self->ord_ += v14->super.size_;
}

- (void)finish
{
  if (self->off_ >= 1) {
    [(OrgApacheLuceneUtilPackedAbstractBlockPackedWriter *)self flush];
  }
  self->finished_ = 1;
}

- (int64_t)ord
{
  return self->ord_;
}

- (void)writeValuesWithInt:(int)a3
{
  uint64_t v8 = *(void *)&a3;
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  EncoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt = (void *)OrgApacheLuceneUtilPackedPackedInts_getEncoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_((void *)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_, 2, v8, v3, v4, v5, v6, v7);
  values = self->values_;
  if (!values) {
    goto LABEL_17;
  }
  CFStringRef v12 = EncoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt;
  if (!EncoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt) {
    goto LABEL_17;
  }
  int size = values->super.size_;
  uint64_t v14 = (size
                     / (int)[EncoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt byteValueCount]);
  int v19 = [v12 byteBlockCount] * v14;
  p_blocks = &self->blocks_;
  blocks = self->blocks_;
  if (!blocks || blocks->super.size_ < v19) {
    JreStrongAssignAndConsume((id *)&self->blocks_, +[IOSByteArray newArrayWithLength:v19]);
  }
  uint64_t off = self->off_;
  v23 = self->values_;
  if ((int)off < v23->super.size_)
  {
    JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)self->values_, off, v23->super.size_, 0, v15, v16, v17, v18);
    v23 = self->values_;
  }
  [v12 encodeWithLongArray:v23 withInt:0 withByteArray:*p_blocks withInt:0 withInt:v14];
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_
    || (id v24 = [(id)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_ byteCountWithInt:2 withInt:self->off_ withInt:v8], (out = self->out_) == 0))
  {
LABEL_17:
    JreThrowNullPointerException();
  }
  v26 = *p_blocks;
  [(OrgApacheLuceneStoreDataOutput *)out writeBytesWithByteArray:v26 withInt:v24];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedAbstractBlockPackedWriter;
  [(OrgApacheLuceneUtilPackedAbstractBlockPackedWriter *)&v3 dealloc];
}

@end