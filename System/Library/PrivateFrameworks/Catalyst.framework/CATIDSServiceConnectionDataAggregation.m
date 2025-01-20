@interface CATIDSServiceConnectionDataAggregation
- (CATIDSServiceConnectionDataAggregation)initWithWorkQueue:(id)a3;
- (CATIDSServiceConnectionDataAggregationDelegate)delegate;
- (NSData)totalData;
- (id)description;
- (id)pendingSequenceNumbersDescription;
- (unint64_t)dataNumber;
- (void)finishAggregating;
- (void)hydratePendingNumbersWithContent:(id)a3;
- (void)hydrateStartingSequenceNumber:(id)a3;
- (void)hydrateWithContentIfNeededWithContent:(id)a3;
- (void)setDataNumber:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setTotalData:(id)a3;
- (void)updateWithDataContent:(id)a3;
@end

@implementation CATIDSServiceConnectionDataAggregation

- (CATIDSServiceConnectionDataAggregation)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CATIDSServiceConnectionDataAggregation;
  v6 = [(CATIDSServiceConnectionDataAggregation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mWorkQueue, a3);
    uint64_t v8 = objc_opt_new();
    mDataSegmentsBySegmentNumber = v7->mDataSegmentsBySegmentNumber;
    v7->mDataSegmentsBySegmentNumber = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)updateWithDataContent:(id)a3
{
  id v7 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  [(CATIDSServiceConnectionDataAggregation *)self hydrateWithContentIfNeededWithContent:v7];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "segmentNumber"));
  if ([(NSMutableSet *)self->mPendingSegmentNumbers containsObject:v4])
  {
    unint64_t v5 = [(CATIDSServiceConnectionDataAggregation *)self dataNumber];
    if (v5 != [v7 dataNumber]) {
      -[CATIDSServiceConnectionDataAggregation setDataNumber:](self, "setDataNumber:", [v7 dataNumber]);
    }
    v6 = [v7 dataSegment];
    [(NSMutableDictionary *)self->mDataSegmentsBySegmentNumber setObject:v6 forKeyedSubscript:v4];

    [(NSMutableSet *)self->mPendingSegmentNumbers removeObject:v4];
    if (![(NSMutableSet *)self->mPendingSegmentNumbers count]) {
      [(CATIDSServiceConnectionDataAggregation *)self finishAggregating];
    }
  }
}

- (void)finishAggregating
{
  id v13 = (id)objc_opt_new();
  uint64_t v3 = [(NSMutableDictionary *)self->mDataSegmentsBySegmentNumber count];
  if (v3)
  {
    unint64_t v4 = v3;
    for (unint64_t i = 1; i <= v4; ++i)
    {
      mDataSegmentsBySegmentNumber = self->mDataSegmentsBySegmentNumber;
      id v7 = [NSNumber numberWithUnsignedInteger:i];
      uint64_t v8 = [(NSMutableDictionary *)mDataSegmentsBySegmentNumber objectForKeyedSubscript:v7];

      v9 = self->mDataSegmentsBySegmentNumber;
      v10 = [NSNumber numberWithUnsignedInteger:i];
      [(NSMutableDictionary *)v9 setObject:0 forKeyedSubscript:v10];

      [v13 appendData:v8];
    }
  }
  objc_super v11 = (void *)[v13 copy];
  [(CATIDSServiceConnectionDataAggregation *)self setTotalData:v11];

  v12 = [(CATIDSServiceConnectionDataAggregation *)self delegate];
  [v12 dataAggregationCompleted:self];
}

- (void)hydrateWithContentIfNeededWithContent:(id)a3
{
  id v4 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (!self->mPerformedInitialHydration)
  {
    [(CATIDSServiceConnectionDataAggregation *)self hydratePendingNumbersWithContent:v4];
    [(CATIDSServiceConnectionDataAggregation *)self hydrateStartingSequenceNumber:v4];
    self->mPerformedInitialHydration = 1;
  }
}

- (void)hydratePendingNumbersWithContent:(id)a3
{
  id v9 = a3;
  id v4 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", (unint64_t)((double)(unint64_t)objc_msgSend(v9, "totalSegments") * 1.5));
  mPendingSegmentNumbers = self->mPendingSegmentNumbers;
  self->mPendingSegmentNumbers = v4;

  if ([v9 totalSegments])
  {
    unint64_t v6 = 1;
    do
    {
      id v7 = self->mPendingSegmentNumbers;
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
      [(NSMutableSet *)v7 addObject:v8];

      ++v6;
    }
    while (v6 <= [v9 totalSegments]);
  }
}

- (void)hydrateStartingSequenceNumber:(id)a3
{
  id v12 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  id v4 = [v12 sequenceNumber];

  if (v4)
  {
    unint64_t v5 = [v12 sequenceNumber];
    uint64_t v6 = [v5 unsignedIntegerValue];
    uint64_t v7 = v6 - [v12 segmentNumber] + 1;

    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
    mStartingSequenceNumber = self->mStartingSequenceNumber;
    self->mStartingSequenceNumber = v8;

    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "totalSegments"));
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    mTotalSegments = self->mTotalSegments;
    self->mTotalSegments = v10;
  }
}

- (id)pendingSequenceNumbersDescription
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"self" ascending:1];
  v12[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

  unint64_t v5 = [(NSMutableSet *)self->mPendingSegmentNumbers sortedArrayUsingDescriptors:v4];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__CATIDSServiceConnectionDataAggregation_pendingSequenceNumbersDescription__block_invoke;
  v11[3] = &unk_2641DBED8;
  v11[4] = self;
  uint64_t v6 = objc_msgSend(v5, "cat_map:", v11);

  uint64_t v7 = NSString;
  uint64_t v8 = [v6 componentsJoinedByString:@","];
  id v9 = [v7 stringWithFormat:@"[%@]", v8];

  return v9;
}

uint64_t __75__CATIDSServiceConnectionDataAggregation_pendingSequenceNumbersDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  id v4 = a2;
  uint64_t v5 = [v3 unsignedIntegerValue];
  uint64_t v6 = [v4 unsignedIntegerValue];

  return [v2 numberWithUnsignedInteger:v5 + v6 - 1];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(CATIDSServiceConnectionDataAggregation *)self dataNumber];
  uint64_t v6 = [(CATIDSServiceConnectionDataAggregation *)self pendingSequenceNumbersDescription];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p { dataNumber = %lu, pendingSequenceNumbers = %@ }>", v4, self, v5, v6];

  return v7;
}

- (CATIDSServiceConnectionDataAggregationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATIDSServiceConnectionDataAggregationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)dataNumber
{
  return self->_dataNumber;
}

- (void)setDataNumber:(unint64_t)a3
{
  self->_dataNumber = a3;
}

- (NSData)totalData
{
  return self->_totalData;
}

- (void)setTotalData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mTotalSegments, 0);
  objc_storeStrong((id *)&self->mStartingSequenceNumber, 0);
  objc_storeStrong((id *)&self->mPendingSegmentNumbers, 0);
  objc_storeStrong((id *)&self->mDataSegmentsBySegmentNumber, 0);

  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

@end