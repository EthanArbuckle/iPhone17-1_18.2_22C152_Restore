@interface ARCollaborationStats
- (BOOL)originAnchorMerged;
- (unint64_t)anchorsCount;
- (unint64_t)externalKeyframesCount;
- (unint64_t)externalWeakKeyframesCount;
- (unint64_t)localSessionIdentifier;
- (unint64_t)mergedKeyframesCount;
- (unint64_t)remainingKeyframesCount;
- (unint64_t)remainingWeakKeyframesCount;
- (void)setAnchorsCount:(unint64_t)a3;
- (void)setExternalKeyframesCount:(unint64_t)a3;
- (void)setExternalWeakKeyframesCount:(unint64_t)a3;
- (void)setLocalSessionIdentifier:(unint64_t)a3;
- (void)setMergedKeyframesCount:(unint64_t)a3;
- (void)setOriginAnchorMerged:(BOOL)a3;
- (void)setRemainingKeyframesCount:(unint64_t)a3;
- (void)setRemainingWeakKeyframesCount:(unint64_t)a3;
@end

@implementation ARCollaborationStats

- (unint64_t)localSessionIdentifier
{
  return self->_localSessionIdentifier;
}

- (void)setLocalSessionIdentifier:(unint64_t)a3
{
  self->_localSessionIdentifier = a3;
}

- (unint64_t)mergedKeyframesCount
{
  return self->_mergedKeyframesCount;
}

- (void)setMergedKeyframesCount:(unint64_t)a3
{
  self->_mergedKeyframesCount = a3;
}

- (unint64_t)remainingKeyframesCount
{
  return self->_remainingKeyframesCount;
}

- (void)setRemainingKeyframesCount:(unint64_t)a3
{
  self->_remainingKeyframesCount = a3;
}

- (unint64_t)remainingWeakKeyframesCount
{
  return self->_remainingWeakKeyframesCount;
}

- (void)setRemainingWeakKeyframesCount:(unint64_t)a3
{
  self->_remainingWeakKeyframesCount = a3;
}

- (unint64_t)externalKeyframesCount
{
  return self->_externalKeyframesCount;
}

- (void)setExternalKeyframesCount:(unint64_t)a3
{
  self->_externalKeyframesCount = a3;
}

- (unint64_t)externalWeakKeyframesCount
{
  return self->_externalWeakKeyframesCount;
}

- (void)setExternalWeakKeyframesCount:(unint64_t)a3
{
  self->_externalWeakKeyframesCount = a3;
}

- (unint64_t)anchorsCount
{
  return self->_anchorsCount;
}

- (void)setAnchorsCount:(unint64_t)a3
{
  self->_anchorsCount = a3;
}

- (BOOL)originAnchorMerged
{
  return self->_originAnchorMerged;
}

- (void)setOriginAnchorMerged:(BOOL)a3
{
  self->_originAnchorMerged = a3;
}

@end