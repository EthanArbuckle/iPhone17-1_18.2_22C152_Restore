@interface OrgApacheLuceneUtilPackedPackedWriter
- (OrgApacheLuceneUtilPackedPackedWriter)initWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a3 withOrgApacheLuceneStoreDataOutput:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
- (id)getFormat;
- (int)ord;
- (uint64_t)flush;
- (void)addWithLong:(int64_t)a3;
- (void)dealloc;
- (void)finish;
@end

@implementation OrgApacheLuceneUtilPackedPackedWriter

- (OrgApacheLuceneUtilPackedPackedWriter)initWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a3 withOrgApacheLuceneStoreDataOutput:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return self;
}

- (id)getFormat
{
  return self->format_;
}

- (void)addWithLong:(int64_t)a3
{
  int valueCount = self->super.valueCount_;
  if (valueCount != -1 && self->written_ >= valueCount)
  {
    v8 = new_JavaIoEOFException_initWithNSString_(@"Writing past end of stream");
    objc_exception_throw(v8);
  }
  nextValues = self->nextValues_;
  if (!nextValues) {
    JreThrowNullPointerException();
  }
  int off = self->off_;
  self->off_ = off + 1;
  uint64_t size = nextValues->super.size_;
  if (off < 0 || off >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, off);
  }
  nextValues->buffer_[off] = a3;
  if (off + 1 == self->nextValues_->super.size_) {
    -[OrgApacheLuceneUtilPackedPackedWriter flush]_0((uint64_t)self);
  }
  ++self->written_;
}

- (uint64_t)flush
{
  v2 = *(void **)(a1 + 40);
  if (!v2
    || ([v2 encodeWithLongArray:*(void *)(a1 + 56) withInt:0 withByteArray:*(void *)(a1 + 48) withInt:0 withInt:*(unsigned int *)(a1 + 64)], (v3 = *(void **)(a1 + 32)) == 0)|| (id v4 = objc_msgSend(v3, "byteCountWithInt:withInt:withInt:", 2, *(unsigned int *)(a1 + 68), *(unsigned int *)(a1 + 20)), (v5 = *(void **)(a1 + 8)) == 0))
  {
    JreThrowNullPointerException();
  }
  [v5 writeBytesWithByteArray:*(void *)(a1 + 48) withInt:v4];
  uint64_t result = JavaUtilArrays_fillWithLongArray_withLong_(*(void *)(a1 + 56), 0);
  *(_DWORD *)(a1 + 68) = 0;
  return result;
}

- (void)finish
{
  int valueCount = self->super.valueCount_;
  if (valueCount != -1 && self->written_ < valueCount)
  {
    do
      [(OrgApacheLuceneUtilPackedPackedWriter *)self addWithLong:0];
    while (self->written_ < self->super.valueCount_);
  }
  -[OrgApacheLuceneUtilPackedPackedWriter flush]_0((uint64_t)self);
  self->finished_ = 1;
}

- (int)ord
{
  return self->written_ - 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedPackedWriter;
  [(OrgApacheLuceneUtilPackedPackedInts_Writer *)&v3 dealloc];
}

@end