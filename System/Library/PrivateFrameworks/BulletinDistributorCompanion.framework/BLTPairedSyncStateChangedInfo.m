@interface BLTPairedSyncStateChangedInfo
- (unint64_t)newState;
- (unint64_t)oldState;
- (void)setNewState:(unint64_t)a3;
- (void)setOldState:(unint64_t)a3;
@end

@implementation BLTPairedSyncStateChangedInfo

- (unint64_t)oldState
{
  return self->_oldState;
}

- (void)setOldState:(unint64_t)a3
{
  self->_oldState = a3;
}

- (unint64_t)newState
{
  return self->_newState;
}

- (void)setNewState:(unint64_t)a3
{
  self->_newState = a3;
}

@end