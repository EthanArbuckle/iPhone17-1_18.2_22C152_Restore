@interface CATConcreteIDSServiceConnectionDataChunker
- (CATConcreteIDSServiceConnectionDataChunker)initWithWorkQueue:(id)a3 maxDataLength:(int64_t)a4;
- (id)chunkDataIntoMessageContent:(id)a3;
@end

@implementation CATConcreteIDSServiceConnectionDataChunker

- (CATConcreteIDSServiceConnectionDataChunker)initWithWorkQueue:(id)a3 maxDataLength:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CATConcreteIDSServiceConnectionDataChunker;
  v8 = [(CATConcreteIDSServiceConnectionDataChunker *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->mWorkQueue, a3);
    v9->mMaxDataLength = a4;
  }

  return v9;
}

- (id)chunkDataIntoMessageContent:(id)a3
{
  id v4 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  unint64_t mNextDataNumber = self->mNextDataNumber;
  self->unint64_t mNextDataNumber = mNextDataNumber + 1;
  unint64_t v5 = (unint64_t)[v4 length] / self->mMaxDataLength;
  if ((unint64_t)[v4 length] % self->mMaxDataLength) {
    unint64_t v6 = v5 + 1;
  }
  else {
    unint64_t v6 = v5;
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6];
  v8 = (void *)[v4 copy];
  if (v6)
  {
    uint64_t v9 = 0;
    do
    {
      int64_t v10 = self->mMaxDataLength * v9;
      uint64_t v11 = [v4 length];
      if (self->mMaxDataLength >= (unint64_t)(v11 - v10)) {
        int64_t mMaxDataLength = v11 - v10;
      }
      else {
        int64_t mMaxDataLength = self->mMaxDataLength;
      }
      unint64_t mNextSequenceNumber = self->mNextSequenceNumber;
      self->unint64_t mNextSequenceNumber = mNextSequenceNumber + 1;
      v14 = [CATActiveIDSServiceConnectionContentSendData alloc];
      v15 = [NSNumber numberWithUnsignedInteger:mNextSequenceNumber];
      v16 = -[CATActiveIDSServiceConnectionContentSendData initWithSequenceNumber:dataNumber:dataSegment:segmentRange:segmentNumber:totalSegments:](v14, "initWithSequenceNumber:dataNumber:dataSegment:segmentRange:segmentNumber:totalSegments:", v15, mNextDataNumber, v8, v10, mMaxDataLength, ++v9, v6);

      [v7 addObject:v16];
    }
    while (v6 != v9);
  }
  v17 = (void *)[v7 copy];

  return v17;
}

- (void).cxx_destruct
{
}

@end