@interface IDSKTGossipPolicySpecification
- (char)firstGossipChance;
- (char)maxRecipientMemory;
- (char)subsequentGossipChance;
- (double)selfVerifyThrottleTime;
- (void)setFirstGossipChance:(char)a3;
- (void)setMaxRecipientMemory:(char)a3;
- (void)setSelfVerifyThrottleTime:(double)a3;
- (void)setSubsequentGossipChance:(char)a3;
@end

@implementation IDSKTGossipPolicySpecification

- (char)firstGossipChance
{
  return self->_firstGossipChance;
}

- (void)setFirstGossipChance:(char)a3
{
  self->_firstGossipChance = a3;
}

- (char)subsequentGossipChance
{
  return self->_subsequentGossipChance;
}

- (void)setSubsequentGossipChance:(char)a3
{
  self->_subsequentGossipChance = a3;
}

- (char)maxRecipientMemory
{
  return self->_maxRecipientMemory;
}

- (void)setMaxRecipientMemory:(char)a3
{
  self->_maxRecipientMemory = a3;
}

- (double)selfVerifyThrottleTime
{
  return self->_selfVerifyThrottleTime;
}

- (void)setSelfVerifyThrottleTime:(double)a3
{
  self->_selfVerifyThrottleTime = a3;
}

@end