@interface CNKDestinationQueryControllerInternal
- (CNKDestinationQueryControllerDelegate)delegate;
- (CNKDestinationQueryControllerInternal)init;
- (int64_t)isAudioAllowedFor:(id)a3;
- (int64_t)isFaceTimeAllowedFor:(id)a3;
- (int64_t)isMultiwayAllowedFor:(id)a3;
- (int64_t)isVideoAllowedFor:(id)a3;
- (int64_t)isWebCapableFor:(id)a3;
- (int64_t)presentationStyleFor:(id)a3;
- (void)addRecipient:(id)a3;
- (void)handleIDSStatusChanged;
- (void)queryAddresses:(id)a3;
- (void)removeRecipient:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
@end

@implementation CNKDestinationQueryControllerInternal

- (CNKDestinationQueryControllerDelegate)delegate
{
  v2 = (void *)DestinationQueryController.delegate.getter();
  return (CNKDestinationQueryControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  DestinationQueryController.delegate.setter();
}

- (CNKDestinationQueryControllerInternal)init
{
  return (CNKDestinationQueryControllerInternal *)DestinationQueryController.init()();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR___CNKDestinationQueryControllerInternal_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CNKDestinationQueryControllerInternal_idsLookupManager);
}

- (void)handleIDSStatusChanged
{
  v2 = self;
  DestinationQueryController.handleIDSStatusChanged()();
}

- (void)addRecipient:(id)a3
{
}

- (void)removeRecipient:(id)a3
{
}

- (void)reset
{
  v2 = self;
  DestinationQueryController.reset()();
}

- (void)queryAddresses:(id)a3
{
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  DestinationQueryController.queryAddresses(_:)(v4);

  swift_bridgeObjectRelease();
}

- (int64_t)isFaceTimeAllowedFor:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  int64_t v6 = DestinationQueryController.isFaceTimeAllowed(for:)(a3);
  swift_unknownObjectRelease();

  return v6;
}

- (int64_t)isMultiwayAllowedFor:(id)a3
{
  return @objc DestinationQueryController.isMultiwayAllowed(for:)();
}

- (int64_t)isAudioAllowedFor:(id)a3
{
  return @objc DestinationQueryController.isMultiwayAllowed(for:)();
}

- (int64_t)isVideoAllowedFor:(id)a3
{
  return @objc DestinationQueryController.isMultiwayAllowed(for:)();
}

- (int64_t)isWebCapableFor:(id)a3
{
  return @objc DestinationQueryController.isMultiwayAllowed(for:)();
}

- (int64_t)presentationStyleFor:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  int64_t v6 = DestinationQueryController.presentationStyle(for:)(a3);
  swift_unknownObjectRelease();

  return v6;
}

@end