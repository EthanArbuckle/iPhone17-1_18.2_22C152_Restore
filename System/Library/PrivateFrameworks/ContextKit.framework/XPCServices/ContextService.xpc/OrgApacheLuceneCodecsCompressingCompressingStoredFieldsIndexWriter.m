@interface OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexWriter
- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexWriter)initWithOrgApacheLuceneStoreIndexOutput:(id)a3 withInt:(int)a4;
- (void)close;
- (void)dealloc;
- (void)finishWithInt:(int)a3 withLong:(int64_t)a4;
- (void)reset;
- (void)writeIndexWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexWriter

- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexWriter)initWithOrgApacheLuceneStoreIndexOutput:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)reset
{
  *(void *)&self->blockDocs_ = 0;
  self->firstStartPointer_ = -1;
}

- (void)writeIndexWithInt:(int)a3 withLong:(int64_t)a4
{
  uint64_t blockChunks = self->blockChunks_;
  if (blockChunks == self->blockSize_)
  {
    sub_100017538((uint64_t)self);
    uint64_t blockChunks = 0;
    *(void *)&self->blockDocs_ = 0;
LABEL_4:
    self->firstStartPointer_ = a4;
    self->maxStartPointer_ = a4;
    goto LABEL_5;
  }
  if (self->firstStartPointer_ == -1) {
    goto LABEL_4;
  }
LABEL_5:
  docBaseDeltas = self->docBaseDeltas_;
  if (!docBaseDeltas) {
    goto LABEL_12;
  }
  uint64_t size = docBaseDeltas->super.size_;
  if ((blockChunks & 0x80000000) != 0 || (int)blockChunks >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, blockChunks);
  }
  *(&docBaseDeltas->super.size_ + (int)blockChunks + 1) = a3;
  startPointerDeltas = self->startPointerDeltas_;
  if (!startPointerDeltas) {
LABEL_12:
  }
    JreThrowNullPointerException();
  uint64_t v11 = self->blockChunks_;
  uint64_t v12 = startPointerDeltas->super.size_;
  if ((v11 & 0x80000000) != 0 || (int)v11 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v11);
  }
  startPointerDeltas->buffer_[(int)v11] = a4 - self->maxStartPointer_;
  self->blockChunks_ = v11 + 1;
  *(int32x2_t *)&self->totalDocs_ = vadd_s32(*(int32x2_t *)&self->totalDocs_, vdup_n_s32(a3));
  self->maxStartPointer_ = a4;
}

- (void)finishWithInt:(int)a3 withLong:(int64_t)a4
{
  if (self->totalDocs_ != a3)
  {
    CFStringRef v12 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, a4, v4, v5, v6, v7, @"Expected ");
    v13 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v12);
    objc_exception_throw(v13);
  }
  if (self->blockChunks_ >= 1) {
    sub_100017538((uint64_t)self);
  }
  fieldsIndexOut = self->fieldsIndexOut_;
  if (!fieldsIndexOut) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreDataOutput *)fieldsIndexOut writeVIntWithInt:0];
  [(OrgApacheLuceneStoreDataOutput *)self->fieldsIndexOut_ writeVLongWithLong:a4];
  uint64_t v11 = self->fieldsIndexOut_;
  OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(v11);
}

- (void)close
{
  fieldsIndexOut = self->fieldsIndexOut_;
  if (!fieldsIndexOut) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexOutput *)fieldsIndexOut close];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexWriter;
  [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexWriter *)&v3 dealloc];
}

@end