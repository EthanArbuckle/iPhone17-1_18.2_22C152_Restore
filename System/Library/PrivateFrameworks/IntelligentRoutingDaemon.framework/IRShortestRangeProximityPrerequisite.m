@interface IRShortestRangeProximityPrerequisite
- (BOOL)anyCandidateMeetsCondition;
- (NSNumber)shortestRange;
- (NSString)shortestRangeCandidateIdentifier;
- (void)setAnyCandidateMeetsCondition:(BOOL)a3;
- (void)setShortestRange:(id)a3;
- (void)setShortestRangeCandidateIdentifier:(id)a3;
@end

@implementation IRShortestRangeProximityPrerequisite

- (BOOL)anyCandidateMeetsCondition
{
  return self->_anyCandidateMeetsCondition;
}

- (void)setAnyCandidateMeetsCondition:(BOOL)a3
{
  self->_anyCandidateMeetsCondition = a3;
}

- (NSNumber)shortestRange
{
  return self->_shortestRange;
}

- (void)setShortestRange:(id)a3
{
}

- (NSString)shortestRangeCandidateIdentifier
{
  return self->_shortestRangeCandidateIdentifier;
}

- (void)setShortestRangeCandidateIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortestRangeCandidateIdentifier, 0);

  objc_storeStrong((id *)&self->_shortestRange, 0);
}

@end