@interface _EMBlockedSenderState
- (BOOL)valid;
- (NSSet)blockedSenders;
- (void)setBlockedSenders:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation _EMBlockedSenderState

- (BOOL)valid
{
  return self->_valid;
}

- (NSSet)blockedSenders
{
  return self->_blockedSenders;
}

- (void)setBlockedSenders:(id)a3
{
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
}

@end