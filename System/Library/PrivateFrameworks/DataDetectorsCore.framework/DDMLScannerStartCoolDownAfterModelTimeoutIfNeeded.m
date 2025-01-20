@interface DDMLScannerStartCoolDownAfterModelTimeoutIfNeeded
@end

@implementation DDMLScannerStartCoolDownAfterModelTimeoutIfNeeded

void ___DDMLScannerStartCoolDownAfterModelTimeoutIfNeeded_block_invoke()
{
  os_unfair_lock_lock((os_unfair_lock_t)&__DDMLCooldownLock);

  os_unfair_lock_unlock((os_unfair_lock_t)&__DDMLCooldownLock);
}

@end