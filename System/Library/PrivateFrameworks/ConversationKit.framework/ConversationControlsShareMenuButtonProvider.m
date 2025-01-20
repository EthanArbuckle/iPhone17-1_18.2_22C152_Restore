@interface ConversationControlsShareMenuButtonProvider
- (void)capturedDidChangeNotification:(id)a3;
- (void)screenSharingButtonPressed;
- (void)setAutomaticShareState:(BOOL)a3;
@end

@implementation ConversationControlsShareMenuButtonProvider

- (void)screenSharingButtonPressed
{
  swift_retain();
  ConversationControlsShareMenuButtonProvider.screenSharingButtonPressed()();
  swift_release();
}

- (void)setAutomaticShareState:(BOOL)a3
{
  swift_retain();
  ConversationControlsShareMenuButtonProvider.setAutomaticShareState(_:)(a3);
  swift_release();
}

- (void)capturedDidChangeNotification:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  ConversationControlsShareMenuButtonProvider.capturedDidChangeNotification(_:)((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end