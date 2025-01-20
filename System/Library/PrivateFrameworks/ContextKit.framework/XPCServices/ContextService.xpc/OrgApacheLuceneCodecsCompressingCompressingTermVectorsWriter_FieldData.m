@interface OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FieldData
- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FieldData)initWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8 withInt:(int)a9 withInt:(int)a10 withInt:(int)a11;
- (void)addPositionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)addTermWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FieldData

- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FieldData)initWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8 withInt:(int)a9 withInt:(int)a10 withInt:(int)a11
{
  return self;
}

- (void)addTermWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  freqs = self->freqs_;
  if (!freqs) {
    goto LABEL_11;
  }
  int ord = self->ord_;
  uint64_t size = freqs->super.size_;
  if (ord < 0 || ord >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, ord);
  }
  *(&freqs->super.size_ + ord + 1) = a3;
  prefixLengths = self->prefixLengths_;
  if (!prefixLengths) {
    goto LABEL_11;
  }
  int v10 = self->ord_;
  uint64_t v11 = prefixLengths->super.size_;
  if (v10 < 0 || v10 >= (int)v11) {
    IOSArray_throwOutOfBoundsWithMsg(v11, v10);
  }
  *(&prefixLengths->super.size_ + v10 + 1) = a4;
  suffixLengths = self->suffixLengths_;
  if (!suffixLengths) {
LABEL_11:
  }
    JreThrowNullPointerException();
  int v13 = self->ord_;
  uint64_t v14 = suffixLengths->super.size_;
  if (v13 < 0 || v13 >= (int)v14) {
    IOSArray_throwOutOfBoundsWithMsg(v14, v13);
  }
  *(&suffixLengths->super.size_ + v13 + 1) = a5;
  ++self->ord_;
}

- (void)addPositionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  if (self->hasPositions_)
  {
    p_positionsBuf = (id *)&self->this$0_->positionsBuf_;
    positionsBuf = (unsigned int *)*p_positionsBuf;
    if (!*p_positionsBuf) {
      goto LABEL_26;
    }
    if (self->totalPositions_ + self->posStart_ == positionsBuf[2])
    {
      v15 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_(positionsBuf, (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, v6, v7);
      JreStrongAssign(p_positionsBuf, v15);
      positionsBuf = (unsigned int *)self->this$0_->positionsBuf_;
      if (!positionsBuf) {
        goto LABEL_26;
      }
    }
    uint64_t v16 = positionsBuf[2];
    int v17 = self->totalPositions_ + self->posStart_;
    if (v17 < 0 || v17 >= (int)v16) {
      IOSArray_throwOutOfBoundsWithMsg(v16, v17);
    }
    positionsBuf[v17 + 3] = a3;
  }
  if (self->hasOffsets_)
  {
    startOffsetsBuf = self->this$0_->startOffsetsBuf_;
    if (!startOffsetsBuf) {
      goto LABEL_26;
    }
    unsigned int v19 = self->totalPositions_ + self->offStart_;
    if (v19 == startOffsetsBuf->super.size_)
    {
      unsigned int v20 = OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v19, 4, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, v6, v7);
      p_startOffsetsBuf = &self->this$0_->startOffsetsBuf_;
      v22 = JavaUtilArrays_copyOfWithIntArray_withInt_(*p_startOffsetsBuf, v20);
      JreStrongAssign((id *)p_startOffsetsBuf, v22);
      p_lengthsBuf = &self->this$0_->lengthsBuf_;
      v24 = JavaUtilArrays_copyOfWithIntArray_withInt_(*p_lengthsBuf, v20);
      JreStrongAssign((id *)p_lengthsBuf, v24);
      startOffsetsBuf = self->this$0_->startOffsetsBuf_;
      if (!startOffsetsBuf) {
        goto LABEL_26;
      }
    }
    uint64_t size = startOffsetsBuf->super.size_;
    int v26 = self->totalPositions_ + self->offStart_;
    if (v26 < 0 || v26 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v26);
    }
    *(&startOffsetsBuf->super.size_ + v26 + 1) = a4;
    lengthsBuf = self->this$0_->lengthsBuf_;
    if (!lengthsBuf) {
      goto LABEL_26;
    }
    uint64_t v28 = lengthsBuf->super.size_;
    int v29 = self->totalPositions_ + self->offStart_;
    if (v29 < 0 || v29 >= (int)v28) {
      IOSArray_throwOutOfBoundsWithMsg(v28, v29);
    }
    *(&lengthsBuf->super.size_ + v29 + 1) = a5;
  }
  if (!self->hasPayloads_) {
    goto LABEL_25;
  }
  p_payloadLengthsBuf = (id *)&self->this$0_->payloadLengthsBuf_;
  payloadLengthsBuf = (unsigned int *)*p_payloadLengthsBuf;
  if (!*p_payloadLengthsBuf
    || self->totalPositions_ + self->payStart_ == payloadLengthsBuf[2]
    && (v32 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_(payloadLengthsBuf, (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, v6, v7), JreStrongAssign(p_payloadLengthsBuf, v32), (payloadLengthsBuf = (unsigned int *)self->this$0_->payloadLengthsBuf_) == 0))
  {
LABEL_26:
    JreThrowNullPointerException();
  }
  uint64_t v33 = payloadLengthsBuf[2];
  int v34 = self->totalPositions_ + self->payStart_;
  if (v34 < 0 || v34 >= (int)v33) {
    IOSArray_throwOutOfBoundsWithMsg(v33, v34);
  }
  payloadLengthsBuf[v34 + 3] = a6;
LABEL_25:
  ++self->totalPositions_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FieldData;
  [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FieldData *)&v3 dealloc];
}

@end