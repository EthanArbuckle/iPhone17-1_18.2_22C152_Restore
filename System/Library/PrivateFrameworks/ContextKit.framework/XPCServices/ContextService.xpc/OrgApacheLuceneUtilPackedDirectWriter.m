@interface OrgApacheLuceneUtilPackedDirectWriter
+ (id)getInstanceWithOrgApacheLuceneStoreIndexOutput:(id)a3 withLong:(int64_t)a4 withInt:(int)a5;
+ (int)bitsRequiredWithLong:(int64_t)a3;
+ (int)unsignedBitsRequiredWithLong:(int64_t)a3;
+ (void)initialize;
- (OrgApacheLuceneUtilPackedDirectWriter)initWithOrgApacheLuceneStoreIndexOutput:(id)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (uint64_t)flush;
- (void)addWithLong:(int64_t)a3;
- (void)dealloc;
- (void)finish;
@end

@implementation OrgApacheLuceneUtilPackedDirectWriter

- (OrgApacheLuceneUtilPackedDirectWriter)initWithOrgApacheLuceneStoreIndexOutput:(id)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  return self;
}

- (void)addWithLong:(int64_t)a3
{
  if (self->count_ >= self->numValues_)
  {
    v7 = new_JavaIoEOFException_initWithNSString_(@"Writing past end of stream");
    objc_exception_throw(v7);
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
    -[OrgApacheLuceneUtilPackedDirectWriter flush]_0((uint64_t)self);
  }
  ++self->count_;
}

- (uint64_t)flush
{
  v2 = *(void **)(a1 + 64);
  if (!v2) {
    goto LABEL_7;
  }
  [v2 encodeWithLongArray:*(void *)(a1 + 56) withInt:0 withByteArray:*(void *)(a1 + 48) withInt:0 withInt:*(unsigned int *)(a1 + 72)];
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_
    || (id v3 = [(id)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_ byteCountWithInt:2 withInt:*(unsigned int *)(a1 + 44) withInt:*(unsigned int *)(a1 + 8)], (v4 = *(void **)(a1 + 24)) == 0))
  {
LABEL_7:
    JreThrowNullPointerException();
  }
  [v4 writeBytesWithByteArray:*(void *)(a1 + 48) withInt:v3];
  uint64_t result = JavaUtilArrays_fillWithLongArray_withLong_(*(void *)(a1 + 56), 0);
  *(_DWORD *)(a1 + 44) = 0;
  return result;
}

- (void)finish
{
  if (self->count_ != self->numValues_)
  {
    CFStringRef v11 = JreStrcat("$J$J", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"Wrong number of values added, expected: ");
    v12 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v11);
    objc_exception_throw(v12);
  }
  -[OrgApacheLuceneUtilPackedDirectWriter flush]_0((uint64_t)self);
  int v9 = 3;
  do
  {
    output = self->output_;
    if (!output) {
      JreThrowNullPointerException();
    }
    [(OrgApacheLuceneStoreIndexOutput *)output writeByteWithByte:0];
    --v9;
  }
  while (v9);
  self->finished_ = 1;
}

+ (id)getInstanceWithOrgApacheLuceneStoreIndexOutput:(id)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilPackedDirectWriter_getInstanceWithOrgApacheLuceneStoreIndexOutput_withLong_withInt_(a3, a4, a5);
}

+ (int)bitsRequiredWithLong:(int64_t)a3
{
  return OrgApacheLuceneUtilPackedDirectWriter_bitsRequiredWithLong_(a3, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
}

+ (int)unsignedBitsRequiredWithLong:(int64_t)a3
{
  return OrgApacheLuceneUtilPackedDirectWriter_unsignedBitsRequiredWithLong_(a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDirectWriter;
  [(OrgApacheLuceneUtilPackedDirectWriter *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = 0x4000000038;
    v2[0] = xmmword_10031F300;
    v2[1] = unk_10031F310;
    v2[2] = xmmword_10031F320;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilPackedDirectWriter_SUPPORTED_BITS_PER_VALUE_, +[IOSIntArray newArrayWithInts:v2 count:14]);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilPackedDirectWriter__initialized);
  }
}

@end