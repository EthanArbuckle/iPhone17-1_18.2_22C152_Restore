@interface OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockDocsEnum
- (BOOL)canReuseWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexFieldInfo:(id)a4;
- (OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockDocsEnum)initWithOrgApacheLuceneCodecsLucene50AAPL50PostingsReader:(id)a3 withOrgApacheLuceneIndexFieldInfo:(id)a4;
- (id)getPayload;
- (id)resetWithOrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState:(id)a3 withInt:(int)a4;
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

@implementation OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockDocsEnum

- (OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockDocsEnum)initWithOrgApacheLuceneCodecsLucene50AAPL50PostingsReader:(id)a3 withOrgApacheLuceneIndexFieldInfo:(id)a4
{
  return self;
}

- (BOOL)canReuseWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexFieldInfo:(id)a4
{
  if (self->startDocIn_ == a3)
  {
    if (!a4) {
      goto LABEL_13;
    }
    BOOL indexHasFreq = self->indexHasFreq_;
    id v7 = [a4 getIndexOptions];
    if (!v7) {
      goto LABEL_13;
    }
    v8 = v7;
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (indexHasFreq != (int)[v8 compareToWithId:qword_100563200] >= 0) {
      return 0;
    }
    BOOL indexHasPos = self->indexHasPos_;
    id v10 = [a4 getIndexOptions];
    if (!v10) {
LABEL_13:
    }
      JreThrowNullPointerException();
    v11 = v10;
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (indexHasPos == (int)[v11 compareToWithId:qword_100563208] >= 0)
    {
      int indexHasPayloads = self->indexHasPayloads_;
      return indexHasPayloads == [a4 hasPayloads];
    }
  }
  return 0;
}

- (id)resetWithOrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState:(id)a3 withInt:(int)a4
{
  if (!a3) {
    goto LABEL_13;
  }
  int64_t v6 = *((int *)a3 + 4);
  self->docFreq_ = v6;
  if (self->indexHasFreq_) {
    int64_t v6 = *((void *)a3 + 3);
  }
  self->totalTermFreq_ = v6;
  self->docTermStartFP_ = *((void *)a3 + 7);
  self->skipOffset_ = *((void *)a3 + 10);
  self->singletonDocID_ = *((_DWORD *)a3 + 24);
  if (self->docFreq_ >= 2)
  {
    p_docIn = &self->docIn_;
    docIn = self->docIn_;
    if (docIn
      || (startDocIn = self->startDocIn_) != 0
      && (JreStrongAssign((id *)&self->docIn_, [(OrgApacheLuceneStoreIndexInput *)startDocIn clone]),
          (docIn = *p_docIn) != 0))
    {
      [(OrgApacheLuceneStoreIndexInput *)docIn seekWithLong:self->docTermStartFP_];
      goto LABEL_9;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
LABEL_9:
  self->doc_ = -1;
  BOOL v10 = OrgApacheLuceneIndexPostingsEnum_featureRequestedWithInt_withShort_(a4, 8);
  self->needsFreq_ = v10;
  if (!self->indexHasFreq_ || !v10)
  {
    JavaUtilArrays_fillWithIntArray_withInt_((uint64_t)self->freqBuffer_, 1);
    JavaUtilArrays_fillWithIntArray_withInt_((uint64_t)self->freqPostingDeltaBuffer_, 0);
    self->remainingPostingsInDoc_ = 0;
  }
  self->accum_ = 0;
  self->docUpto_ = 0;
  self->nextSkipDoc_ = 127;
  self->docBufferUpto_ = 128;
  self->skipped_ = 0;
  return self;
}

- (int)freq
{
  return self->freq_;
}

- (int)nextPosition
{
  return -1;
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

- (int)docID
{
  return self->doc_;
}

- (int)nextDoc
{
  if (self->docUpto_ == self->docFreq_)
  {
    int result = 0x7FFFFFFF;
    self->doc_ = 0x7FFFFFFF;
  }
  else
  {
    if (self->docBufferUpto_ == 128) {
      sub_100070A28((uint64_t)self);
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
    ++self->docUpto_;
    self->doc_ = self->accum_;
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
    ++self->docBufferUpto_;
    return self->doc_;
  }
  return result;
}

- (int)advanceWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int docFreq = self->docFreq_;
  if (docFreq >= 129 && self->nextSkipDoc_ < a3)
  {
    p_skipper = (id *)&self->skipper_;
    skipper = self->skipper_;
    if (!skipper)
    {
      docIn = self->docIn_;
      if (!docIn) {
        goto LABEL_33;
      }
      uint64_t v9 = new_OrgApacheLuceneCodecsLucene50Lucene50SkipReader_initWithOrgApacheLuceneStoreIndexInput_withInt_withBoolean_withBoolean_withBoolean_([(OrgApacheLuceneStoreIndexInput *)docIn clone], 10, self->indexHasPos_, self->indexHasOffsets_, self->indexHasPayloads_);
      JreStrongAssignAndConsume((id *)&self->skipper_, v9);
      skipper = (OrgApacheLuceneCodecsLucene50Lucene50SkipReader *)*p_skipper;
    }
    if (!self->skipped_)
    {
      if (!skipper) {
        goto LABEL_33;
      }
      [(OrgApacheLuceneCodecsLucene50Lucene50SkipReader *)skipper init__WithLong:self->skipOffset_ + self->docTermStartFP_ withLong:self->docTermStartFP_ withLong:0 withLong:0 withInt:self->docFreq_];
      self->skipped_ = 1;
      skipper = (OrgApacheLuceneCodecsLucene50Lucene50SkipReader *)*p_skipper;
    }
    if (!skipper) {
LABEL_33:
    }
      JreThrowNullPointerException();
    signed int v10 = [(OrgApacheLuceneCodecsMultiLevelSkipListReader *)skipper skipToWithInt:v3] + 1;
    if (v10 > self->docUpto_)
    {
      self->docUpto_ = v10;
      self->docBufferUpto_ = 128;
      self->accum_ = [*p_skipper getDoc];
      v11 = self->docIn_;
      if (!v11) {
        goto LABEL_33;
      }
      -[OrgApacheLuceneStoreIndexInput seekWithLong:](v11, "seekWithLong:", [*p_skipper getDocPointer]);
    }
    self->nextSkipDoc_ = [*p_skipper getNextSkipDoc];
    int docFreq = self->docFreq_;
  }
  if (self->docUpto_ == docFreq)
  {
LABEL_15:
    int result = 0x7FFFFFFF;
    goto LABEL_32;
  }
  if (self->docBufferUpto_ == 128) {
    sub_100070A28((uint64_t)self);
  }
  while (1)
  {
    docDeltaBuffer = self->docDeltaBuffer_;
    if (!docDeltaBuffer) {
      goto LABEL_33;
    }
    int docBufferUpto = self->docBufferUpto_;
    uint64_t size = docDeltaBuffer->super.size_;
    if (docBufferUpto < 0 || docBufferUpto >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, docBufferUpto);
    }
    self->accum_ += *(&docDeltaBuffer->super.size_ + docBufferUpto + 1);
    ++self->docUpto_;
    if (self->accum_ >= (int)v3) {
      break;
    }
    ++self->docBufferUpto_;
    if (self->docUpto_ == self->docFreq_) {
      goto LABEL_15;
    }
  }
  freqBuffer = self->freqBuffer_;
  if (!freqBuffer) {
    goto LABEL_33;
  }
  int v17 = self->docBufferUpto_;
  uint64_t v18 = freqBuffer->super.size_;
  if (v17 < 0 || v17 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v17);
  }
  int v19 = *(&freqBuffer->super.size_ + v17 + 1);
  self->freqWithPostings_ = v19;
  freqPostingDeltaBuffer = self->freqPostingDeltaBuffer_;
  if (!freqPostingDeltaBuffer) {
    goto LABEL_33;
  }
  int v21 = self->docBufferUpto_;
  uint64_t v22 = freqPostingDeltaBuffer->super.size_;
  if (v21 < 0 || v21 >= (int)v22) {
    IOSArray_throwOutOfBoundsWithMsg(v22, v21);
  }
  self->freq_ = *(&freqPostingDeltaBuffer->super.size_ + v21 + 1) + v19;
  self->remainingPostingsInDoc_ = self->freqWithPostings_;
  ++self->docBufferUpto_;
  int result = self->accum_;
LABEL_32:
  self->doc_ = result;
  return result;
}

- (int64_t)cost
{
  return self->docFreq_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_BlockDocsEnum;
  [(OrgApacheLuceneIndexPostingsEnum *)&v3 dealloc];
}

@end