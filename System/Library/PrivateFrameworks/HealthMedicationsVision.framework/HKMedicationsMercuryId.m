@interface HKMedicationsMercuryId
- (BOOL)tradeNameMatched;
- (float)jaccardSimilarity;
- (int64_t)hgId;
- (void)setHgId:(int64_t)a3;
- (void)setJaccardSimilarity:(float)a3;
- (void)setTradeNameMatched:(BOOL)a3;
@end

@implementation HKMedicationsMercuryId

- (int64_t)hgId
{
  return self->_hgId;
}

- (void)setHgId:(int64_t)a3
{
  self->_hgId = a3;
}

- (float)jaccardSimilarity
{
  return self->_jaccardSimilarity;
}

- (void)setJaccardSimilarity:(float)a3
{
  self->_jaccardSimilarity = a3;
}

- (BOOL)tradeNameMatched
{
  return self->_tradeNameMatched;
}

- (void)setTradeNameMatched:(BOOL)a3
{
  self->_tradeNameMatched = a3;
}

@end