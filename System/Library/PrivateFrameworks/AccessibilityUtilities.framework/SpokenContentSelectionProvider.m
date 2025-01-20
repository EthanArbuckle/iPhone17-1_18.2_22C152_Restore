@interface SpokenContentSelectionProvider
- (void)siriVoiceChanged;
@end

@implementation SpokenContentSelectionProvider

- (void)siriVoiceChanged
{
  v2 = (os_unfair_lock_s *)(*(void *)self->lock + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  sub_18D4048A8();
  os_unfair_lock_unlock(v2);
  swift_release();
}

@end