@interface BSStateCaptureInvalidator
- (void)invalidate;
@end

@implementation BSStateCaptureInvalidator

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_handle)
    {
      os_state_remove_handler();
      os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_32);
      v3 = (void *)qword_1EB21B350;
      v4 = [NSNumber numberWithUnsignedLongLong:self->_handle];
      [v3 removeObjectForKey:v4];

      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_32);
    }
  }
}

@end