@interface SummarySharingInputSignal
- (void)sharingEntryStoreDidUpdate;
@end

@implementation SummarySharingInputSignal

- (void)sharingEntryStoreDidUpdate
{
  v2 = *(os_unfair_lock_s **)self->lock;
  uint64_t v3 = (uint64_t)&v2[4];
  v4 = v2 + 18;
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_1C26AA92C(v3, &v5);
  os_unfair_lock_unlock(v4);
  v5();
  swift_release();

  swift_release();
}

@end