@interface OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockPostingsEnum
- (BOOL)canReuseWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexFieldInfo:(id)a4;
- (OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockPostingsEnum)initWithOrgApacheLuceneCodecsLucene50AAPL50PostingsReader:(id)a3 withOrgApacheLuceneIndexFieldInfo:(id)a4;
- (id)getPayload;
- (id)resetWithOrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState:(id)a3;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)endOffset;
- (int)freq;
- (int)nextDoc;
- (int)nextPosition;
- (int)startOffset;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockPostingsEnum

- (OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockPostingsEnum)initWithOrgApacheLuceneCodecsLucene50AAPL50PostingsReader:(id)a3 withOrgApacheLuceneIndexFieldInfo:(id)a4
{
  return self;
}

- (BOOL)canReuseWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexFieldInfo:(id)a4
{
  if (self->startDocIn_ != a3) {
    return 0;
  }
  if (!a4 || (BOOL indexHasOffsets = self->indexHasOffsets_, (v7 = [a4 getIndexOptions]) == 0)) {
    JreThrowNullPointerException();
  }
  v8 = v7;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (indexHasOffsets != (int)[v8 compareToWithId:qword_100563210] >= 0) {
    return 0;
  }
  int indexHasPayloads = self->indexHasPayloads_;
  return indexHasPayloads == [a4 hasPayloads];
}

- (id)resetWithOrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState:(id)a3
{
  if (!a3) {
    goto LABEL_16;
  }
  self->docFreq_ = *((_DWORD *)a3 + 4);
  self->docTermStartFP_ = *((void *)a3 + 7);
  self->posTermStartFP_ = *((void *)a3 + 8);
  self->payTermStartFP_ = *((void *)a3 + 9);
  self->skipOffset_ = *((void *)a3 + 10);
  self->totalTermFreq_ = *((void *)a3 + 3);
  self->singletonDocID_ = *((_DWORD *)a3 + 24);
  if (self->docFreq_ < 2) {
    goto LABEL_7;
  }
  p_docIn = &self->docIn_;
  docIn = self->docIn_;
  if (!docIn)
  {
    startDocIn = self->startDocIn_;
    if (!startDocIn
      || (JreStrongAssign((id *)&self->docIn_, [(OrgApacheLuceneStoreIndexInput *)startDocIn clone]),
          (docIn = *p_docIn) == 0))
    {
LABEL_16:
      JreThrowNullPointerException();
    }
  }
  [(OrgApacheLuceneStoreIndexInput *)docIn seekWithLong:self->docTermStartFP_];
LABEL_7:
  self->posPendingFP_ = self->posTermStartFP_;
  self->posPendingCount_ = 0;
  uint64_t v8 = *((void *)a3 + 3);
  if (v8 > 127)
  {
    if (v8 == 128) {
      int64_t posTermStartFP = -1;
    }
    else {
      int64_t posTermStartFP = *((void *)a3 + 11) + self->posTermStartFP_;
    }
  }
  else
  {
    int64_t posTermStartFP = self->posTermStartFP_;
  }
  self->lastPosBlockFP_ = posTermStartFP;
  self->doc_ = -1;
  self->accum_ = 0;
  self->docUpto_ = 0;
  if (self->docFreq_ <= 128) {
    int v10 = 0x7FFFFFFF;
  }
  else {
    int v10 = 127;
  }
  self->nextSkipDoc_ = v10;
  self->docBufferUpto_ = 128;
  self->skipped_ = 0;
  return self;
}

- (int)freq
{
  return self->freq_;
}

- (int)docID
{
  return self->doc_;
}

- (int)nextDoc
{
  self->remainingPostingsInDoc_ = 0;
  if (self->docUpto_ == self->docFreq_)
  {
    int result = 0x7FFFFFFF;
    self->doc_ = 0x7FFFFFFF;
  }
  else
  {
    if (self->docBufferUpto_ == 128) {
      sub_100071858((uint64_t)self);
    }
    docDeltaBuffer = self->docDeltaBuffer_;
    if (!docDeltaBuffer) {
      goto LABEL_15;
    }
    int docBufferUpto = self->docBufferUpto_;
    uint64_t size = docDeltaBuffer->super.size_;
    if (docBufferUpto < 0 || docBufferUpto >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, docBufferUpto);
    }
    self->accum_ += *(&docDeltaBuffer->super.size_ + docBufferUpto + 1);
    freqBuffer = self->freqBuffer_;
    if (!freqBuffer) {
      goto LABEL_15;
    }
    int v8 = self->docBufferUpto_;
    uint64_t v9 = freqBuffer->super.size_;
    if (v8 < 0 || v8 >= (int)v9) {
      IOSArray_throwOutOfBoundsWithMsg(v9, v8);
    }
    int v10 = *(&freqBuffer->super.size_ + v8 + 1);
    self->freqWithPostings_ = v10;
    freqPostingDeltaBuffer = self->freqPostingDeltaBuffer_;
    if (!freqPostingDeltaBuffer) {
LABEL_15:
    }
      JreThrowNullPointerException();
    int v12 = self->docBufferUpto_;
    uint64_t v13 = freqPostingDeltaBuffer->super.size_;
    if (v12 < 0 || v12 >= (int)v13) {
      IOSArray_throwOutOfBoundsWithMsg(v13, v12);
    }
    self->freq_ = *(&freqPostingDeltaBuffer->super.size_ + v12 + 1) + v10;
    self->remainingPostingsInDoc_ = self->freqWithPostings_;
    self->posPendingCount_ += self->freqWithPostings_;
    ++self->docBufferUpto_;
    ++self->docUpto_;
    self->doc_ = self->accum_;
    self->previousPosition_ = 2147483519;
    self->position_ = 0;
    return self->doc_;
  }
  return result;
}

- (int)advanceWithInt:(int)a3
{
  if (self->nextSkipDoc_ < a3)
  {
    p_skipper = (id *)&self->skipper_;
    skipper = self->skipper_;
    if (!skipper)
    {
      docIn = self->docIn_;
      if (!docIn) {
        goto LABEL_35;
      }
      int v7 = a3;
      int v8 = new_OrgApacheLuceneCodecsLucene50Lucene50SkipReader_initWithOrgApacheLuceneStoreIndexInput_withInt_withBoolean_withBoolean_withBoolean_([(OrgApacheLuceneStoreIndexInput *)docIn clone], 10, 1, self->indexHasOffsets_, self->indexHasPayloads_);
      JreStrongAssignAndConsume((id *)&self->skipper_, v8);
      skipper = (OrgApacheLuceneCodecsLucene50Lucene50SkipReader *)*p_skipper;
      a3 = v7;
    }
    if (!self->skipped_)
    {
      if (!skipper) {
        goto LABEL_35;
      }
      int v9 = a3;
      [(OrgApacheLuceneCodecsLucene50Lucene50SkipReader *)skipper init__WithLong:self->skipOffset_ + self->docTermStartFP_ withLong:self->docTermStartFP_ withLong:self->posTermStartFP_ withLong:self->payTermStartFP_ withInt:self->docFreq_];
      self->skipped_ = 1;
      skipper = (OrgApacheLuceneCodecsLucene50Lucene50SkipReader *)*p_skipper;
      a3 = v9;
    }
    if (skipper)
    {
      int v10 = a3;
      signed int v11 = -[OrgApacheLuceneCodecsMultiLevelSkipListReader skipToWithInt:](skipper, "skipToWithInt:") + 1;
      if (v11 <= self->docUpto_)
      {
LABEL_12:
        self->nextSkipDoc_ = [*p_skipper getNextSkipDoc];
        a3 = v10;
        goto LABEL_13;
      }
      self->docUpto_ = v11;
      self->docBufferUpto_ = 128;
      self->accum_ = [*p_skipper getDoc];
      int v12 = self->docIn_;
      if (v12)
      {
        -[OrgApacheLuceneStoreIndexInput seekWithLong:](v12, "seekWithLong:", [*p_skipper getDocPointer]);
        self->posPendingFP_ = (int64_t)[*p_skipper getPosPointer];
        self->posPendingCount_ = [*p_skipper getPosBufferUpto];
        goto LABEL_12;
      }
    }
LABEL_35:
    JreThrowNullPointerException();
  }
LABEL_13:
  if (self->docUpto_ == self->docFreq_)
  {
LABEL_14:
    int result = 0x7FFFFFFF;
  }
  else
  {
    if (self->docBufferUpto_ == 128)
    {
      int v14 = a3;
      sub_100071858((uint64_t)self);
      a3 = v14;
    }
    self->previousPosition_ = 2147483519;
    while (1)
    {
      docDeltaBuffer = self->docDeltaBuffer_;
      if (!docDeltaBuffer) {
        goto LABEL_35;
      }
      int docBufferUpto = self->docBufferUpto_;
      uint64_t size = docDeltaBuffer->super.size_;
      if (docBufferUpto < 0 || docBufferUpto >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, docBufferUpto);
      }
      self->accum_ += *(&docDeltaBuffer->super.size_ + docBufferUpto + 1);
      freqBuffer = self->freqBuffer_;
      if (!freqBuffer) {
        goto LABEL_35;
      }
      int v19 = self->docBufferUpto_;
      uint64_t v20 = freqBuffer->super.size_;
      if (v19 < 0 || v19 >= (int)v20) {
        IOSArray_throwOutOfBoundsWithMsg(v20, v19);
      }
      int v21 = *(&freqBuffer->super.size_ + v19 + 1);
      self->freqWithPostings_ = v21;
      freqPostingDeltaBuffer = self->freqPostingDeltaBuffer_;
      if (!freqPostingDeltaBuffer) {
        goto LABEL_35;
      }
      int v23 = self->docBufferUpto_;
      uint64_t v24 = freqPostingDeltaBuffer->super.size_;
      if (v23 < 0 || v23 >= (int)v24) {
        IOSArray_throwOutOfBoundsWithMsg(v24, v23);
      }
      self->freq_ = *(&freqPostingDeltaBuffer->super.size_ + v23 + 1) + v21;
      self->remainingPostingsInDoc_ = self->freqWithPostings_;
      self->posPendingCount_ += self->freqWithPostings_;
      ++self->docBufferUpto_;
      int v25 = self->docUpto_ + 1;
      self->docUpto_ = v25;
      if (self->accum_ >= a3) {
        break;
      }
      if (v25 == self->docFreq_) {
        goto LABEL_14;
      }
    }
    self->position_ = 0;
    int result = self->accum_;
  }
  self->doc_ = result;
  return result;
}

- (int)nextPosition
{
  int remainingPostingsInDoc = self->remainingPostingsInDoc_;
  BOOL v3 = __OFSUB__(remainingPostingsInDoc--, 1);
  self->remainingPostingsInDoc_ = remainingPostingsInDoc;
  if (remainingPostingsInDoc < 0 != v3) {
    return 2147483519;
  }
  if (self->posPendingFP_ != -1)
  {
    posIn = self->posIn_;
    if (!posIn) {
      goto LABEL_14;
    }
    -[OrgApacheLuceneStoreIndexInput seekWithLong:](posIn, "seekWithLong:");
    self->posPendingFP_ = -1;
    self->posBufferUpto_ = 128;
  }
  if (self->posPendingCount_ > self->freqWithPostings_)
  {
    sub_100072344(self);
    self->posPendingCount_ = self->freqWithPostings_;
  }
  if (self->posBufferUpto_ == 128)
  {
    sub_100071A94((uint64_t)self);
    self->posBufferUpto_ = 0;
  }
  self->previousPosition_ = self->position_;
  posDeltaBuffer = self->posDeltaBuffer_;
  if (!posDeltaBuffer) {
LABEL_14:
  }
    JreThrowNullPointerException();
  int posBufferUpto = self->posBufferUpto_;
  self->posBufferUpto_ = posBufferUpto + 1;
  uint64_t size = posDeltaBuffer->super.size_;
  if (posBufferUpto < 0 || posBufferUpto >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, posBufferUpto);
  }
  self->position_ += *(&posDeltaBuffer->super.size_ + posBufferUpto + 1);
  --self->posPendingCount_;
  return self->position_;
}

- (int)startOffset
{
  return -1;
}

- (int)endOffset
{
  return -1;
}

- (id)getPayload
{
  return 0;
}

- (int64_t)cost
{
  return self->docFreq_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockPostingsEnum;
  [(OrgApacheLuceneIndexPostingsEnum *)&v3 dealloc];
}

@end