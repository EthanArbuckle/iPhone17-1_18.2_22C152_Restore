@interface IRProximityPrerequisite
- (BOOL)anyCandidateInProximity;
- (NSDictionary)proximityPerCandiate;
- (void)setAnyCandidateInProximity:(BOOL)a3;
- (void)setProximityPerCandiate:(id)a3;
@end

@implementation IRProximityPrerequisite

- (BOOL)anyCandidateInProximity
{
  return self->_anyCandidateInProximity;
}

- (void)setAnyCandidateInProximity:(BOOL)a3
{
  self->_anyCandidateInProximity = a3;
}

- (NSDictionary)proximityPerCandiate
{
  return self->_proximityPerCandiate;
}

- (void)setProximityPerCandiate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end