@interface MOMusicPlaybackCoordinator
- (void)nowPlayingItemChangedWithNote:(id)a3;
- (void)playbackStateDidChangeWithNote:(id)a3;
- (void)updateDelegateProgressIndication;
@end

@implementation MOMusicPlaybackCoordinator

- (void)updateDelegateProgressIndication
{
  swift_retain();
  MOMusicPlaybackCoordinator.updateDelegateProgressIndication()();

  swift_release();
}

- (void)playbackStateDidChangeWithNote:(id)a3
{
  v3 = *(void (**)(uint64_t))(*(void *)self->_TtCs12_SwiftObject_opaque + 280);
  id v4 = a3;
  uint64_t v5 = swift_retain();
  v3(v5);

  swift_release();
}

- (void)nowPlayingItemChangedWithNote:(id)a3
{
  v3 = *(void (**)(uint64_t))(*(void *)self->_TtCs12_SwiftObject_opaque + 272);
  id v4 = a3;
  uint64_t v5 = swift_retain();
  v3(v5);

  swift_release();
}

@end