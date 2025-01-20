@interface CATConcreteIDSServiceConnectionDataAggregator
+ (id)missingContentTimerIdentifier;
- (CATConcreteIDSServiceConnectionDataAggregator)initWithWorkQueue:(id)a3 timerSource:(id)a4 missingItemInterval:(double)a5 supportsSequenceCorrection:(BOOL)a6;
- (CATIDSServiceConnectionDataAggregatorDelegate)delegate;
- (id)description;
- (id)missingSequenceNumbers;
- (unint64_t)receivedSequenceNumber;
- (void)dataAggregationCompleted:(id)a3;
- (void)missingContentTimerDidFire:(id)a3 fireCount:(unint64_t)a4;
- (void)processNewDataWindowWithContent:(id)a3;
- (void)receiveDataContent:(id)a3;
- (void)receiveExpectedSequenceNumber:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)updateExistingDataWindowWithContent:(id)a3;
- (void)updateMissingContentTrackingForDataContent:(id)a3;
@end

@implementation CATConcreteIDSServiceConnectionDataAggregator

- (CATConcreteIDSServiceConnectionDataAggregator)initWithWorkQueue:(id)a3 timerSource:(id)a4 missingItemInterval:(double)a5 supportsSequenceCorrection:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CATConcreteIDSServiceConnectionDataAggregator;
  v13 = [(CATConcreteIDSServiceConnectionDataAggregator *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->mWorkQueue, a3);
    objc_storeStrong((id *)&v14->mTimerSource, a4);
    v14->mMissingItemInterval = a5;
    v14->mSupportsSequenceCorrection = a6;
    uint64_t v15 = objc_opt_new();
    mAggregationsByDataNumber = v14->mAggregationsByDataNumber;
    v14->mAggregationsByDataNumber = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    mPendingSequenceNumbers = v14->mPendingSequenceNumbers;
    v14->mPendingSequenceNumbers = (NSMutableIndexSet *)v17;
  }
  return v14;
}

- (id)missingSequenceNumbers
{
  v3 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:");
  [v3 removeIndexes:self->mPendingSequenceNumbers];
  v4 = objc_msgSend(MEMORY[0x263EFF8C0], "cat_arrayFromIndexSet:", v3);

  return v4;
}

- (unint64_t)receivedSequenceNumber
{
  return self->mNextExpectedSequenceNumber - 1;
}

- (void)receiveDataContent:(id)a3
{
  id v15 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  unint64_t v4 = [v15 dataNumber];
  unint64_t mNextDeploymentNumber = self->mNextDeploymentNumber;
  if (v4 <= mNextDeploymentNumber) {
    unint64_t v6 = self->mNextDeploymentNumber;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v4 >= mNextDeploymentNumber) {
    unint64_t v7 = self->mNextDeploymentNumber;
  }
  else {
    unint64_t v7 = v4;
  }
  if (v7 + ~v6 > 0x186A0)
  {
    BOOL v8 = v4 >= mNextDeploymentNumber;
    BOOL v9 = v4 > mNextDeploymentNumber;
  }
  else
  {
    BOOL v8 = mNextDeploymentNumber >= v4;
    BOOL v9 = mNextDeploymentNumber > v4;
  }
  char v10 = !v8;
  id v11 = v15;
  if (v9 || (v10 & 1) == 0)
  {
    [(CATConcreteIDSServiceConnectionDataAggregator *)self updateMissingContentTrackingForDataContent:v15];
    mAggregationsByDataNumber = self->mAggregationsByDataNumber;
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "dataNumber"));
    v14 = [(NSMutableDictionary *)mAggregationsByDataNumber objectForKeyedSubscript:v13];

    if (v14) {
      unint64_t v4 = [(CATConcreteIDSServiceConnectionDataAggregator *)self updateExistingDataWindowWithContent:v15];
    }
    else {
      unint64_t v4 = [(CATConcreteIDSServiceConnectionDataAggregator *)self processNewDataWindowWithContent:v15];
    }
    id v11 = v15;
  }

  MEMORY[0x270F9A758](v4, v11);
}

- (void)receiveExpectedSequenceNumber:(unint64_t)a3
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  unint64_t v5 = self->mNextExpectedSequenceNumber - 1;
  if (a3 <= v5) {
    unint64_t v6 = self->mNextExpectedSequenceNumber - 1;
  }
  else {
    unint64_t v6 = a3;
  }
  if (a3 >= v5) {
    unint64_t v7 = self->mNextExpectedSequenceNumber - 1;
  }
  else {
    unint64_t v7 = a3;
  }
  if (v7 + ~v6 > 0x186A0)
  {
    BOOL v10 = v5 >= a3;
    BOOL v9 = v5 > a3;
    if (!v10) {
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v8 = v5 > a3;
    BOOL v9 = v5 < a3;
    if (v8) {
      goto LABEL_15;
    }
  }
  if (v9)
  {
    id v12 = [(CATConcreteIDSServiceConnectionDataAggregator *)self delegate];
    [v12 connectionDataAggregatorWantsToReportSequenceNumber:self];
    goto LABEL_16;
  }
LABEL_15:
  id v12 = [(CATConcreteIDSServiceConnectionDataAggregator *)self delegate];
  id v11 = [(CATConcreteIDSServiceConnectionDataAggregator *)self missingSequenceNumbers];
  [v12 connectionDataAggregator:self isMissingSequenceNumbers:v11];

LABEL_16:
}

- (void)processNewDataWindowWithContent:(id)a3
{
  mWorkQueue = self->mWorkQueue;
  id v5 = a3;
  CATAssertIsQueue(mWorkQueue);
  BOOL v8 = [[CATIDSServiceConnectionDataAggregation alloc] initWithWorkQueue:self->mWorkQueue];
  [(CATIDSServiceConnectionDataAggregation *)v8 setDelegate:self];
  mAggregationsByDataNumber = self->mAggregationsByDataNumber;
  unint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "dataNumber"));
  [(NSMutableDictionary *)mAggregationsByDataNumber setObject:v8 forKeyedSubscript:v7];

  [(CATConcreteIDSServiceConnectionDataAggregator *)self updateExistingDataWindowWithContent:v5];
}

- (void)updateExistingDataWindowWithContent:(id)a3
{
  id v9 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  mAggregationsByDataNumber = self->mAggregationsByDataNumber;
  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "dataNumber"));
  unint64_t v7 = [(NSMutableDictionary *)mAggregationsByDataNumber objectForKeyedSubscript:v6];

  if (!v7)
  {
    BOOL v8 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CATIDSServiceConnectionDataAggregator.m", 138, @"Should have an aggregation for window number %ld", objc_msgSend(v9, "dataNumber"));
  }
  [v7 updateWithDataContent:v9];
}

- (void)updateMissingContentTrackingForDataContent:(id)a3
{
  id v4 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (!self->mSupportsSequenceCorrection) {
    goto LABEL_34;
  }
  unint64_t mNextExpectedSequenceNumber = self->mNextExpectedSequenceNumber;
  unint64_t v6 = [v4 sequenceNumber];
  unint64_t v7 = [v6 unsignedIntegerValue];
  if (mNextExpectedSequenceNumber <= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = mNextExpectedSequenceNumber;
  }
  if (mNextExpectedSequenceNumber >= v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = mNextExpectedSequenceNumber;
  }
  if (v9 + ~v8 >= 0x186A1)
  {
    if (mNextExpectedSequenceNumber <= v7) {
      goto LABEL_10;
    }
LABEL_19:

    goto LABEL_34;
  }
  if (v7 > mNextExpectedSequenceNumber) {
    goto LABEL_19;
  }
LABEL_10:

  BOOL v10 = [v4 sequenceNumber];
  uint64_t v11 = [v10 unsignedIntegerValue];
  uint64_t v12 = v11 - [v4 segmentNumber];
  unint64_t v13 = v12 + [v4 totalSegments];

  unint64_t mGreatestExpectedSequenceNumber = self->mGreatestExpectedSequenceNumber;
  if (mGreatestExpectedSequenceNumber <= v13) {
    unint64_t v15 = v13;
  }
  else {
    unint64_t v15 = self->mGreatestExpectedSequenceNumber;
  }
  if (mGreatestExpectedSequenceNumber >= v13) {
    unint64_t v16 = v13;
  }
  else {
    unint64_t v16 = self->mGreatestExpectedSequenceNumber;
  }
  if (v16 + ~v15 >= 0x186A1)
  {
    BOOL v17 = mGreatestExpectedSequenceNumber >= v13;
    BOOL v18 = mGreatestExpectedSequenceNumber > v13;
  }
  else
  {
    BOOL v17 = v13 >= mGreatestExpectedSequenceNumber;
    BOOL v18 = v13 > mGreatestExpectedSequenceNumber;
  }
  int v19 = !v17;
  if (!v18 && v19) {
    self->unint64_t mGreatestExpectedSequenceNumber = v13;
  }
  mPendingSequenceNumbers = self->mPendingSequenceNumbers;
  v21 = [v4 sequenceNumber];
  -[NSMutableIndexSet addIndex:](mPendingSequenceNumbers, "addIndex:", [v21 unsignedIntegerValue]);

  int v22 = [(NSMutableIndexSet *)self->mPendingSequenceNumbers containsIndex:self->mNextExpectedSequenceNumber];
  if (v22)
  {
    do
    {
      v23 = self->mPendingSequenceNumbers;
      ++self->mNextExpectedSequenceNumber;
      -[NSMutableIndexSet removeIndex:](v23, "removeIndex:");
    }
    while (([(NSMutableIndexSet *)self->mPendingSequenceNumbers containsIndex:self->mNextExpectedSequenceNumber] & 1) != 0);
  }
  BOOL v24 = self->mGreatestExpectedSequenceNumber <= self->mNextDeploymentNumber && self->mMissingContentTimer == 0;
  if ((v22 | v24) == 1)
  {
    objc_initWeak(&location, self);
    [(CATTimer *)self->mMissingContentTimer invalidate];
    mTimerSource = self->mTimerSource;
    v26 = [(id)objc_opt_class() missingContentTimerIdentifier];
    double mMissingItemInterval = self->mMissingItemInterval;
    mWorkQueue = self->mWorkQueue;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __92__CATConcreteIDSServiceConnectionDataAggregator_updateMissingContentTrackingForDataContent___block_invoke;
    v31[3] = &unk_2641DBF28;
    objc_copyWeak(&v32, &location);
    v29 = [(CATTimerSource *)mTimerSource scheduleInfiniteTimerWithIdentifier:v26 timeInterval:mWorkQueue queue:v31 fireHandler:mMissingItemInterval];
    mMissingContentTimer = self->mMissingContentTimer;
    self->mMissingContentTimer = v29;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
LABEL_34:
}

void __92__CATConcreteIDSServiceConnectionDataAggregator_updateMissingContentTrackingForDataContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained missingContentTimerDidFire:v5 fireCount:a3];
}

- (void)missingContentTimerDidFire:(id)a3 fireCount:(unint64_t)a4
{
  char v4 = a4;
  mWorkQueue = self->mWorkQueue;
  unint64_t v7 = (CATTimer *)a3;
  CATAssertIsQueue(mWorkQueue);
  mMissingContentTimer = self->mMissingContentTimer;

  if (mMissingContentTimer == v7)
  {
    id v11 = [(CATConcreteIDSServiceConnectionDataAggregator *)self missingSequenceNumbers];
    uint64_t v9 = [v11 count];
    if ((v4 & 1) != 0 && v9)
    {
      BOOL v10 = [(CATConcreteIDSServiceConnectionDataAggregator *)self delegate];
      [v10 connectionDataAggregator:self isMissingSequenceNumbers:v11];
    }
  }
}

- (void)dataAggregationCompleted:(id)a3
{
  id v13 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  char v4 = 0;
  unint64_t mNextDeploymentNumber = self->mNextDeploymentNumber;
  while (1)
  {
    mAggregationsByDataNumber = self->mAggregationsByDataNumber;
    unint64_t v7 = [NSNumber numberWithUnsignedInteger:mNextDeploymentNumber];
    unint64_t v8 = [(NSMutableDictionary *)mAggregationsByDataNumber objectForKeyedSubscript:v7];
    uint64_t v9 = [v8 totalData];

    if (!v9) {
      break;
    }
    BOOL v10 = [(CATConcreteIDSServiceConnectionDataAggregator *)self delegate];
    [v10 connectionDataAggregator:self aggregatedData:v9 withNumber:self->mNextDeploymentNumber];

    id v11 = self->mAggregationsByDataNumber;
    uint64_t v12 = [NSNumber numberWithUnsignedInteger:self->mNextDeploymentNumber];
    [(NSMutableDictionary *)v11 setObject:0 forKeyedSubscript:v12];

    unint64_t mNextDeploymentNumber = self->mNextDeploymentNumber + 1;
    self->unint64_t mNextDeploymentNumber = mNextDeploymentNumber;
    char v4 = (void *)v9;
  }
}

+ (id)missingContentTimerIdentifier
{
  v2 = NSString;
  v3 = NSStringFromClass((Class)a1);
  char v4 = [v2 stringWithFormat:@"%@-MissingContentTimer", v3];

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p { nextDeploymentNumber = %lu, aggregationsByDataNumber = %@ }>", objc_opt_class(), self, self->mNextDeploymentNumber, self->mAggregationsByDataNumber];
}

- (CATIDSServiceConnectionDataAggregatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATIDSServiceConnectionDataAggregatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mMissingContentTimer, 0);
  objc_storeStrong((id *)&self->mPendingSequenceNumbers, 0);
  objc_storeStrong((id *)&self->mAggregationsByDataNumber, 0);
  objc_storeStrong((id *)&self->mTimerSource, 0);

  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

@end