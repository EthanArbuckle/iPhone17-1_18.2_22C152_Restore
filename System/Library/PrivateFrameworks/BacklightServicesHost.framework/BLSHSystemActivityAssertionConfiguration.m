@interface BLSHSystemActivityAssertionConfiguration
- (BLSHOSInterfaceProviding)osInterfaceProvider;
- (BOOL)acquireWaitsToAbortSleepImminent;
- (BOOL)acquireWaitsToAbortSleepRequested;
- (void)setAcquireWaitsToAbortSleepImminent:(BOOL)a3;
- (void)setAcquireWaitsToAbortSleepRequested:(BOOL)a3;
- (void)setOSInterfaceProvider:(id)a3;
@end

@implementation BLSHSystemActivityAssertionConfiguration

- (BLSHOSInterfaceProviding)osInterfaceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_osInterfaceProvider);

  return (BLSHOSInterfaceProviding *)WeakRetained;
}

- (void)setOSInterfaceProvider:(id)a3
{
}

- (BOOL)acquireWaitsToAbortSleepRequested
{
  return self->_acquireWaitsToAbortSleepRequested;
}

- (void)setAcquireWaitsToAbortSleepRequested:(BOOL)a3
{
  self->_acquireWaitsToAbortSleepRequested = a3;
}

- (BOOL)acquireWaitsToAbortSleepImminent
{
  return self->_acquireWaitsToAbortSleepImminent;
}

- (void)setAcquireWaitsToAbortSleepImminent:(BOOL)a3
{
  self->_acquireWaitsToAbortSleepImminent = a3;
}

- (void).cxx_destruct
{
}

@end