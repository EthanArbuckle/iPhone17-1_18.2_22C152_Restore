@interface PasteboardEventObserver
- (void)invalidateEnabledState;
@end

@implementation PasteboardEventObserver

- (void)invalidateEnabledState
{
  swift_retain();
  PasteboardEventObserver.invalidateEnabledState()();

  swift_release();
}

@end