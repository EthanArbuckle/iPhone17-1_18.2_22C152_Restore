@interface _BSNSXPCInvalidCallbackTracking
- (os_unfair_lock_s)isInvalidationStillPending;
- (void)clearPendingInvalidation;
@end

@implementation _BSNSXPCInvalidCallbackTracking

- (void)clearPendingInvalidation
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v3 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    os_unfair_lock_unlock(v2);
  }
}

- (void).cxx_destruct
{
}

- (os_unfair_lock_s)isInvalidationStillPending
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (os_unfair_lock_s *)(*(void *)&v1[2]._os_unfair_lock_opaque != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

@end