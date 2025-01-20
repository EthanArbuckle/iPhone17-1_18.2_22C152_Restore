@interface TopHitResult
- (NSDate)interestingDate;
- (NSString)bundleID;
- (NSString)dataclass;
- (NSString)identifier;
- (NSString)threadId;
- (PRSRankingItem)rankingItem;
- (TopHitResult)initWithRankingItem:(id)a3;
- (float)scoreL1;
- (uint64_t)score;
- (void)setBundleID:(id)a3;
- (void)setDataclass:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterestingDate:(id)a3;
- (void)setScore:(TopHitResult *)self;
- (void)setScoreL1:(float)a3;
- (void)setThreadId:(id)a3;
@end

@implementation TopHitResult

- (TopHitResult)initWithRankingItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TopHitResult;
  v6 = [(TopHitResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rankingItem, a3);
  }

  return v7;
}

- (uint64_t)score
{
  return *(void *)(a1 + 64);
}

- (void)setScore:(TopHitResult *)self
{
  *(void *)self->_score = v2;
  *(void *)&self->_score[8] = v3;
}

- (float)scoreL1
{
  return self->_scoreL1;
}

- (void)setScoreL1:(float)a3
{
  self->_scoreL1 = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void)setDataclass:(id)a3
{
}

- (NSDate)interestingDate
{
  return self->_interestingDate;
}

- (void)setInterestingDate:(id)a3
{
}

- (NSString)threadId
{
  return self->_threadId;
}

- (void)setThreadId:(id)a3
{
}

- (PRSRankingItem)rankingItem
{
  return self->_rankingItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingItem, 0);
  objc_storeStrong((id *)&self->_threadId, 0);
  objc_storeStrong((id *)&self->_interestingDate, 0);
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end