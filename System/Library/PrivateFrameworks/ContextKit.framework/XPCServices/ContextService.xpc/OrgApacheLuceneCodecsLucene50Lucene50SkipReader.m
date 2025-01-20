@interface OrgApacheLuceneCodecsLucene50Lucene50SkipReader
- (OrgApacheLuceneCodecsLucene50Lucene50SkipReader)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7;
- (int)getNextSkipDoc;
- (int)getPayloadByteUpto;
- (int)getPosBufferUpto;
- (int)readSkipDataWithInt:(int)a3 withOrgApacheLuceneStoreIndexInput:(id)a4;
- (int)trimWithInt:(int)a3;
- (int64_t)getDocPointer;
- (int64_t)getPayPointer;
- (int64_t)getPosPointer;
- (void)dealloc;
- (void)init__WithLong:(int64_t)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withInt:(int)a7;
- (void)seekChildWithInt:(int)a3;
- (void)setLastSkipDataWithInt:(int)a3;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50SkipReader

- (OrgApacheLuceneCodecsLucene50Lucene50SkipReader)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7
{
  return self;
}

- (int)trimWithInt:(int)a3
{
  return (__PAIR64__(a3, a3 & 0x7F) - 1) >> 32;
}

- (void)init__WithLong:(int64_t)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withInt:(int)a7
{
  v13.receiver = self;
  v13.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50SkipReader;
  [(OrgApacheLuceneCodecsMultiLevelSkipListReader *)&v13 init__WithLong:a3 withInt:[(OrgApacheLuceneCodecsLucene50Lucene50SkipReader *)self trimWithInt:*(void *)&a7]];
  self->lastDocPointer_ = a4;
  self->lastPosPointer_ = a5;
  self->lastPayPointer_ = a6;
  JavaUtilArrays_fillWithLongArray_withLong_((uint64_t)self->docPointer_, a4);
  posPointer = self->posPointer_;
  if (posPointer)
  {
    JavaUtilArrays_fillWithLongArray_withLong_((uint64_t)posPointer, a5);
    payPointer = self->payPointer_;
    if (payPointer) {
      JavaUtilArrays_fillWithLongArray_withLong_((uint64_t)payPointer, a6);
    }
  }
}

- (int64_t)getDocPointer
{
  return self->lastDocPointer_;
}

- (int64_t)getPosPointer
{
  return self->lastPosPointer_;
}

- (int)getPosBufferUpto
{
  return self->lastPosBufferUpto_;
}

- (int64_t)getPayPointer
{
  return self->lastPayPointer_;
}

- (int)getPayloadByteUpto
{
  return self->lastPayloadByteUpto_;
}

- (int)getNextSkipDoc
{
  skipDoc = self->super.skipDoc_;
  if (!skipDoc) {
    JreThrowNullPointerException();
  }
  uint64_t size = skipDoc->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  return *(&skipDoc->super.size_ + 1);
}

- (void)seekChildWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v16.receiver = self;
  v16.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50SkipReader;
  -[OrgApacheLuceneCodecsMultiLevelSkipListReader seekChildWithInt:](&v16, "seekChildWithInt:");
  docPointer = self->docPointer_;
  if (!docPointer) {
    goto LABEL_19;
  }
  uint64_t size = docPointer->super.size_;
  if ((v3 & 0x80000000) != 0 || (int)size <= (int)v3) {
    IOSArray_throwOutOfBoundsWithMsg(size, v3);
  }
  docPointer->buffer_[(int)v3] = self->lastDocPointer_;
  posPointer = self->posPointer_;
  if (posPointer)
  {
    uint64_t v8 = posPointer->super.size_;
    if ((v3 & 0x80000000) != 0 || (int)v8 <= (int)v3) {
      IOSArray_throwOutOfBoundsWithMsg(v8, v3);
    }
    posPointer->buffer_[(int)v3] = self->lastPosPointer_;
    posBufferUpto = self->posBufferUpto_;
    if (posBufferUpto)
    {
      uint64_t v10 = posBufferUpto->super.size_;
      if ((v3 & 0x80000000) != 0 || (int)v10 <= (int)v3) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v3);
      }
      *(&posBufferUpto->super.size_ + (int)v3 + 1) = self->lastPosBufferUpto_;
      payloadByteUpto = self->payloadByteUpto_;
      if (payloadByteUpto)
      {
        uint64_t v12 = payloadByteUpto->super.size_;
        if ((v3 & 0x80000000) != 0 || (int)v12 <= (int)v3) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v3);
        }
        *(&payloadByteUpto->super.size_ + (int)v3 + 1) = self->lastPayloadByteUpto_;
      }
      payPointer = self->payPointer_;
      if (payPointer)
      {
        int64_t lastPayPointer = self->lastPayPointer_;
        uint64_t v15 = payPointer->super.size_;
        if ((v3 & 0x80000000) != 0 || (int)v15 <= (int)v3) {
          IOSArray_throwOutOfBoundsWithMsg(v15, v3);
        }
        payPointer->buffer_[(int)v3] = lastPayPointer;
      }
      return;
    }
LABEL_19:
    JreThrowNullPointerException();
  }
}

- (void)setLastSkipDataWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v15.receiver = self;
  v15.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50SkipReader;
  -[OrgApacheLuceneCodecsMultiLevelSkipListReader setLastSkipDataWithInt:](&v15, "setLastSkipDataWithInt:");
  docPointer = self->docPointer_;
  if (!docPointer) {
    goto LABEL_19;
  }
  uint64_t size = docPointer->super.size_;
  if ((v3 & 0x80000000) != 0 || (int)size <= (int)v3) {
    IOSArray_throwOutOfBoundsWithMsg(size, v3);
  }
  self->lastDocPointer_ = docPointer->buffer_[(int)v3];
  posPointer = self->posPointer_;
  if (posPointer)
  {
    uint64_t v8 = posPointer->super.size_;
    if ((v3 & 0x80000000) != 0 || (int)v8 <= (int)v3) {
      IOSArray_throwOutOfBoundsWithMsg(v8, v3);
    }
    self->lastPosPointer_ = posPointer->buffer_[(int)v3];
    posBufferUpto = self->posBufferUpto_;
    if (posBufferUpto)
    {
      uint64_t v10 = posBufferUpto->super.size_;
      if ((v3 & 0x80000000) != 0 || (int)v10 <= (int)v3) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v3);
      }
      self->lastPosBufferUpto_ = *(&posBufferUpto->super.size_ + (int)v3 + 1);
      payPointer = self->payPointer_;
      if (payPointer)
      {
        uint64_t v12 = payPointer->super.size_;
        if ((v3 & 0x80000000) != 0 || (int)v12 <= (int)v3) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v3);
        }
        self->lastPayPointer_ = payPointer->buffer_[(int)v3];
      }
      payloadByteUpto = self->payloadByteUpto_;
      if (payloadByteUpto)
      {
        uint64_t v14 = payloadByteUpto->super.size_;
        if ((v3 & 0x80000000) != 0 || (int)v14 <= (int)v3) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v3);
        }
        self->lastPayloadByteUpto_ = *(&payloadByteUpto->super.size_ + (int)v3 + 1);
      }
      return;
    }
LABEL_19:
    JreThrowNullPointerException();
  }
}

- (int)readSkipDataWithInt:(int)a3 withOrgApacheLuceneStoreIndexInput:(id)a4
{
  if (!a4) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)&a3;
  int v7 = [a4 readVInt];
  id v8 = [a4 readVLong];
  docPointer = self->docPointer_;
  if (!docPointer) {
    goto LABEL_20;
  }
  id v10 = v8;
  uint64_t size = docPointer->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  docPointer->buffer_[(int)v5] += (int64_t)v10;
  if (self->posPointer_)
  {
    id v12 = [a4 readVLong];
    posPointer = self->posPointer_;
    uint64_t v14 = posPointer->super.size_;
    if ((v5 & 0x80000000) != 0 || (int)v14 <= (int)v5) {
      IOSArray_throwOutOfBoundsWithMsg(v14, v5);
    }
    posPointer->buffer_[(int)v5] += (int64_t)v12;
    unsigned int v15 = [a4 readVInt];
    posBufferUpto = self->posBufferUpto_;
    if (posBufferUpto)
    {
      unsigned int v17 = v15;
      uint64_t v18 = posBufferUpto->super.size_;
      if ((v5 & 0x80000000) != 0 || (int)v18 <= (int)v5) {
        IOSArray_throwOutOfBoundsWithMsg(v18, v5);
      }
      *(&posBufferUpto->super.size_ + (int)v5 + 1) = v17;
      if (self->payloadByteUpto_)
      {
        unsigned int v19 = [a4 readVInt];
        payloadByteUpto = self->payloadByteUpto_;
        uint64_t v21 = payloadByteUpto->super.size_;
        if ((v5 & 0x80000000) != 0 || (int)v21 <= (int)v5) {
          IOSArray_throwOutOfBoundsWithMsg(v21, v5);
        }
        *(&payloadByteUpto->super.size_ + (int)v5 + 1) = v19;
      }
      if (self->payPointer_)
      {
        id v22 = [a4 readVLong];
        payPointer = self->payPointer_;
        uint64_t v24 = payPointer->super.size_;
        if ((v5 & 0x80000000) != 0 || (int)v24 <= (int)v5) {
          IOSArray_throwOutOfBoundsWithMsg(v24, v5);
        }
        payPointer->buffer_[(int)v5] += (int64_t)v22;
      }
      return v7;
    }
LABEL_20:
    JreThrowNullPointerException();
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50SkipReader;
  [(OrgApacheLuceneCodecsMultiLevelSkipListReader *)&v3 dealloc];
}

@end