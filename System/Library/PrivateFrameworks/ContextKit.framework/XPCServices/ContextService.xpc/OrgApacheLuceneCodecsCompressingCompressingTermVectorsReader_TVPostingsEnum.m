@interface OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVPostingsEnum
- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVPostingsEnum)init;
- (id)getPayload;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)endOffset;
- (int)freq;
- (int)nextDoc;
- (int)nextPosition;
- (int)startOffset;
- (int64_t)cost;
- (void)dealloc;
- (void)resetWithInt:(int)a3 withInt:(int)a4 withIntArray:(id)a5 withIntArray:(id)a6 withIntArray:(id)a7 withOrgApacheLuceneUtilBytesRef:(id)a8 withIntArray:(id)a9;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVPostingsEnum

- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVPostingsEnum)init
{
  OrgApacheLuceneIndexPostingsEnum_init((uint64_t)self, (uint64_t)a2);
  self->doc_ = -1;
  v3 = new_OrgApacheLuceneUtilBytesRef_init();
  JreStrongAssignAndConsume((id *)&self->payload_, v3);
  return self;
}

- (void)resetWithInt:(int)a3 withInt:(int)a4 withIntArray:(id)a5 withIntArray:(id)a6 withIntArray:(id)a7 withOrgApacheLuceneUtilBytesRef:(id)a8 withIntArray:(id)a9
{
  self->termFreq_ = a3;
  self->positionIndex_ = a4;
  JreStrongAssign((id *)&self->positions_, a5);
  JreStrongAssign((id *)&self->startOffsets_, a6);
  JreStrongAssign((id *)&self->lengths_, a7);
  if (!a8 || (self->basePayloadOffset_ = *((_DWORD *)a8 + 4), (payload = self->payload_) == 0)) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)&payload->bytes_, *((void **)a8 + 1));
  self->payload_->length_ = 0;
  self->payload_->offset_ = 0;
  JreStrongAssign((id *)&self->payloadIndex_, a9);
  self->i_ = -1;
  self->doc_ = -1;
}

- (int)nextPosition
{
  if (self->doc_)
  {
    v22 = new_JavaLangIllegalStateException_init();
    goto LABEL_24;
  }
  int i = self->i_;
  if (i >= self->termFreq_ - 1)
  {
    v22 = new_JavaLangIllegalStateException_initWithNSString_(@"Read past last position");
LABEL_24:
    objc_exception_throw(v22);
  }
  int v4 = i + 1;
  self->i_ = v4;
  payloadIndex = self->payloadIndex_;
  if (payloadIndex)
  {
    int basePayloadOffset = self->basePayloadOffset_;
    int positionIndex = self->positionIndex_;
    uint64_t size = payloadIndex->super.size_;
    int v9 = positionIndex + v4;
    uint64_t v10 = v9;
    if (v9 < 0 || v9 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v9);
    }
    payload = self->payload_;
    if (!payload) {
      JreThrowNullPointerException();
    }
    payload->offset_ = *(&payloadIndex->super.size_ + v10 + 1) + basePayloadOffset;
    v12 = self->payloadIndex_;
    int v13 = self->positionIndex_;
    int v14 = self->i_;
    uint64_t v15 = v12->super.size_;
    int v16 = v13 + v14 + 1;
    if (v16 < 0 || v16 >= (int)v15) {
      IOSArray_throwOutOfBoundsWithMsg(v15, v16);
    }
    int v17 = v14 + v13;
    if (v17 < 0 || v17 >= (int)v15) {
      IOSArray_throwOutOfBoundsWithMsg(v15, v17);
    }
    self->payload_->length_ = *(&v12->super.size_ + v16 + 1) - *(&v12->super.size_ + v17 + 1);
  }
  positions = self->positions_;
  if (!positions) {
    return -1;
  }
  uint64_t v19 = positions->super.size_;
  int v20 = self->i_ + self->positionIndex_;
  if (v20 < 0 || v20 >= (int)v19) {
    IOSArray_throwOutOfBoundsWithMsg(v19, v20);
  }
  return *(&positions->super.size_ + v20 + 1);
}

- (int)startOffset
{
  sub_10008A6D0((uint64_t)self);
  startOffsets = self->startOffsets_;
  if (!startOffsets) {
    return -1;
  }
  uint64_t size = startOffsets->super.size_;
  int v5 = self->i_ + self->positionIndex_;
  if (v5 < 0 || v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  return *(&startOffsets->super.size_ + v5 + 1);
}

- (int)endOffset
{
  sub_10008A6D0((uint64_t)self);
  startOffsets = self->startOffsets_;
  if (!startOffsets) {
    return -1;
  }
  uint64_t size = startOffsets->super.size_;
  int v5 = self->i_ + self->positionIndex_;
  if (v5 < 0 || v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  lengths = self->lengths_;
  if (!lengths) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = lengths->super.size_;
  int v8 = self->i_ + self->positionIndex_;
  if (v8 < 0 || v8 >= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(v7, v8);
  }
  return *(&lengths->super.size_ + v8 + 1) + *(&startOffsets->super.size_ + v5 + 1);
}

- (id)getPayload
{
  sub_10008A6D0((uint64_t)self);
  if (!self->payloadIndex_) {
    return 0;
  }
  payload = self->payload_;
  if (!payload) {
    JreThrowNullPointerException();
  }
  if (payload->length_) {
    return self->payload_;
  }
  else {
    return 0;
  }
}

- (int)freq
{
  return self->termFreq_;
}

- (int)docID
{
  return self->doc_;
}

- (int)nextDoc
{
  if (self->doc_ == -1) {
    int v2 = 0;
  }
  else {
    int v2 = 0x7FFFFFFF;
  }
  self->doc_ = v2;
  return v2;
}

- (int)advanceWithInt:(int)a3
{
  return [(OrgApacheLuceneSearchDocIdSetIterator *)self slowAdvanceWithInt:*(void *)&a3];
}

- (int64_t)cost
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVPostingsEnum;
  [(OrgApacheLuceneIndexPostingsEnum *)&v3 dealloc];
}

@end