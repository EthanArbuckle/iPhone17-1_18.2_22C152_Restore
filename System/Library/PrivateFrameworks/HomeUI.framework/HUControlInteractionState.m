@interface HUControlInteractionState
- (BOOL)areWritesInProgressOrPossible;
- (BOOL)isUserInteractionActive;
- (NAValueThrottler)writeThrottler;
- (unint64_t)inFlightWriteCount;
- (void)setInFlightWriteCount:(unint64_t)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setWriteThrottler:(id)a3;
- (void)setWritesInProgressOrPossible:(BOOL)a3;
@end

@implementation HUControlInteractionState

- (NAValueThrottler)writeThrottler
{
  return self->_writeThrottler;
}

- (void)setWriteThrottler:(id)a3
{
}

- (unint64_t)inFlightWriteCount
{
  return self->_inFlightWriteCount;
}

- (void)setInFlightWriteCount:(unint64_t)a3
{
  self->_inFlightWriteCount = a3;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (BOOL)areWritesInProgressOrPossible
{
  return self->_writesInProgressOrPossible;
}

- (void)setWritesInProgressOrPossible:(BOOL)a3
{
  self->_writesInProgressOrPossible = a3;
}

- (void).cxx_destruct
{
}

@end