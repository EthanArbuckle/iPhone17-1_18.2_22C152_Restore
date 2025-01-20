@interface OrgApacheLuceneUtilPackedBlockPackedReaderIterator
+ (int64_t)readVLongWithOrgApacheLuceneStoreDataInput:(id)a3;
- (OrgApacheLuceneUtilPackedBlockPackedReaderIterator)initWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6;
- (id)nextWithInt:(int)a3;
- (int64_t)next;
- (int64_t)ord;
- (uint64_t)refill;
- (void)dealloc;
- (void)resetWithOrgApacheLuceneStoreDataInput:(id)a3 withLong:(int64_t)a4;
- (void)skipBytesWithLong:(int64_t)a3;
- (void)skipWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneUtilPackedBlockPackedReaderIterator

+ (int64_t)readVLongWithOrgApacheLuceneStoreDataInput:(id)a3
{
  return OrgApacheLuceneUtilPackedBlockPackedReaderIterator_readVLongWithOrgApacheLuceneStoreDataInput_(a3);
}

- (OrgApacheLuceneUtilPackedBlockPackedReaderIterator)initWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6
{
  OrgApacheLuceneUtilPackedBlockPackedReaderIterator_initWithOrgApacheLuceneStoreDataInput_withInt_withInt_withLong_((uint64_t)self, (uint64_t)a3, a4, *(uint64_t *)&a5, a6, a6, v6, v7);
  return self;
}

- (void)resetWithOrgApacheLuceneStoreDataInput:(id)a3 withLong:(int64_t)a4
{
  self->valueCount_ = a4;
  self->off_ = self->blockSize_;
  self->ord_ = 0;
}

- (void)skipWithLong:(int64_t)a3
{
  int64_t v3 = self->ord_ + a3;
  if (v3 > self->valueCount_ || v3 < 0)
  {
    v12 = new_JavaIoEOFException_init();
LABEL_18:
    objc_exception_throw(v12);
  }
  int v6 = JavaLangMath_minWithLong_withLong_(a3, self->blockSize_ - self->off_);
  self->off_ += v6;
  self->ord_ += v6;
  int64_t v7 = a3 - v6;
  if (a3 == v6) {
    return;
  }
  if (v7 < self->blockSize_) {
    goto LABEL_14;
  }
  do
  {
    in = self->in_;
    if (!in) {
LABEL_16:
    }
      JreThrowNullPointerException();
    unsigned int v9 = [(OrgApacheLuceneStoreDataInput *)in readByte];
    if (v9 >= 0xFFFFFF82)
    {
      v12 = (JavaIoEOFException *)new_JavaIoIOException_initWithNSString_(@"Corrupted");
      goto LABEL_18;
    }
    unsigned __int8 v10 = v9;
    if ((v9 & 1) == 0) {
      OrgApacheLuceneUtilPackedBlockPackedReaderIterator_readVLongWithOrgApacheLuceneStoreDataInput_(self->in_);
    }
    if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (!OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_[0]) {
      goto LABEL_16;
    }
    sub_1000FB47C((uint64_t)self, (uint64_t)[(id)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_[0] byteCountWithInt:self->packedIntsVersion_ withInt:self->blockSize_ withInt:v10 >> 1]);
    int64_t blockSize = self->blockSize_;
    self->ord_ += blockSize;
    v7 -= blockSize;
  }
  while (v7 >= blockSize);
  if (v7)
  {
LABEL_14:
    -[OrgApacheLuceneUtilPackedBlockPackedReaderIterator refill]_0((uint64_t)self);
    self->ord_ += v7;
    self->off_ += v7;
  }
}

- (uint64_t)refill
{
  v2 = *(void **)(a1 + 8);
  if (!v2) {
    goto LABEL_26;
  }
  unsigned int v3 = [v2 readByte];
  if (v3 >= 0xFFFFFF82)
  {
    v25 = new_JavaIoIOException_initWithNSString_(@"Corrupted");
    objc_exception_throw(v25);
  }
  unsigned __int8 v9 = v3;
  unsigned int v10 = v3;
  if (v3)
  {
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t VLongWithOrgApacheLuceneStoreDataInput = OrgApacheLuceneUtilPackedBlockPackedReaderIterator_readVLongWithOrgApacheLuceneStoreDataInput_(*(void **)(a1 + 8));
    unint64_t v12 = OrgApacheLuceneUtilBitUtil_zigZagDecodeWithLong_(VLongWithOrgApacheLuceneStoreDataInput + 1);
  }
  if (v10 <= 1)
  {
    uint64_t result = JavaUtilArrays_fillWithLongArray_withLong_(*(void *)(a1 + 40), v12);
    goto LABEL_8;
  }
  uint64_t v14 = v9 >> 1;
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  DecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt = (void *)OrgApacheLuceneUtilPackedPackedInts_getDecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_((void *)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_[0], *(unsigned int *)(a1 + 16), v14, v4, v5, v6, v7, v8);
  if (!DecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt) {
    goto LABEL_26;
  }
  v16 = DecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt;
  int v17 = *(_DWORD *)(a1 + 32);
  uint64_t v18 = (v17
                     / (int)[DecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt byteValueCount]);
  int v19 = [v16 byteBlockCount] * v18;
  uint64_t v20 = *(void *)(a1 + 56);
  if (!v20 || *(_DWORD *)(v20 + 8) < v19) {
    JreStrongAssignAndConsume((id *)(a1 + 56), +[IOSByteArray newArrayWithLength:v19]);
  }
  uint64_t v21 = JavaLangMath_minWithLong_withLong_(*(void *)(a1 + 24) - *(void *)(a1 + 72), *(int *)(a1 + 32));
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_[0]) {
LABEL_26:
  }
    JreThrowNullPointerException();
  objc_msgSend(*(id *)(a1 + 8), "readBytesWithByteArray:withInt:withInt:", *(void *)(a1 + 56), 0, objc_msgSend((id)OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_[0], "byteCountWithInt:withInt:withInt:", *(unsigned int *)(a1 + 16), v21, v14));
  uint64_t result = (uint64_t)[v16 decodeWithByteArray:*(void *)(a1 + 56) withInt:0 withLongArray:*(void *)(a1 + 40) withInt:0 withInt:v18];
  if (v12 && (int)v21 >= 1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = v21;
    do
    {
      uint64_t v24 = *(void *)(a1 + 40);
      if (!v24) {
        goto LABEL_26;
      }
      uint64_t result = *(int *)(v24 + 8);
      if (v22 >= result) {
        IOSArray_throwOutOfBoundsWithMsg(result, v22);
      }
      *(void *)(v24 + 16 + 8 * v22++) += v12;
    }
    while (v23 != v22);
  }
LABEL_8:
  *(_DWORD *)(a1 + 64) = 0;
  return result;
}

- (void)skipBytesWithLong:(int64_t)a3
{
}

- (int64_t)next
{
  if (self->ord_ == self->valueCount_)
  {
    uint64_t v7 = new_JavaIoEOFException_init();
    objc_exception_throw(v7);
  }
  if (self->off_ == self->blockSize_) {
    -[OrgApacheLuceneUtilPackedBlockPackedReaderIterator refill]_0((uint64_t)self);
  }
  values = self->values_;
  if (!values) {
    JreThrowNullPointerException();
  }
  int off = self->off_;
  self->off_ = off + 1;
  uint64_t size = values->super.size_;
  if (off < 0 || off >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, off);
  }
  int64_t result = values->buffer_[off];
  ++self->ord_;
  return result;
}

- (id)nextWithInt:(int)a3
{
  if (self->ord_ == self->valueCount_)
  {
    v11 = new_JavaIoEOFException_init();
    objc_exception_throw(v11);
  }
  uint64_t v3 = *(void *)&a3;
  int off = self->off_;
  int blockSize = self->blockSize_;
  if (off == blockSize)
  {
    -[OrgApacheLuceneUtilPackedBlockPackedReaderIterator refill]_0((uint64_t)self);
    int blockSize = self->blockSize_;
    int off = self->off_;
  }
  int v7 = JavaLangMath_minWithInt_withInt_(v3, blockSize - off);
  int v8 = JavaLangMath_minWithLong_withLong_(v7, self->valueCount_ - self->ord_);
  valuesRef = self->valuesRef_;
  if (!valuesRef) {
    JreThrowNullPointerException();
  }
  valuesRef->offset_ = self->off_;
  self->valuesRef_->length_ = v8;
  self->off_ += v8;
  self->ord_ += v8;
  return self->valuesRef_;
}

- (int64_t)ord
{
  return self->ord_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedBlockPackedReaderIterator;
  [(OrgApacheLuceneUtilPackedBlockPackedReaderIterator *)&v3 dealloc];
}

@end