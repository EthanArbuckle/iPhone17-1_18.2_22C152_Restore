@interface PHProgressContainerForRetryableRequest
- (NSProgress)totalProgress;
- (PHProgressContainerForRetryableRequest)init;
- (void)setRequestProgress:(id)a3;
@end

@implementation PHProgressContainerForRetryableRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalProgress, 0);

  objc_storeStrong((id *)&self->_currentRequestProgress, 0);
}

- (NSProgress)totalProgress
{
  return self->_totalProgress;
}

- (void)setRequestProgress:(id)a3
{
  v4 = (NSProgress *)a3;
  int64_t v5 = [(NSProgress *)self->_totalProgress totalUnitCount];
  currentRequestProgress = self->_currentRequestProgress;
  if (currentRequestProgress)
  {
    [(NSProgress *)currentRequestProgress setCompletedUnitCount:0];
    v7 = self->_currentRequestProgress;
  }
  else
  {
    v7 = 0;
  }
  self->_currentRequestProgress = v4;
  v8 = v4;

  [(NSProgress *)self->_totalProgress addChild:self->_currentRequestProgress withPendingUnitCount:v5];
}

- (PHProgressContainerForRetryableRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHProgressContainerForRetryableRequest;
  v2 = [(PHProgressContainerForRetryableRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1000];
    totalProgress = v2->_totalProgress;
    v2->_totalProgress = (NSProgress *)v3;
  }
  return v2;
}

@end