@interface ScreenSharingStateMonitor
- (BOOL)isBroadcastingScreenSharing;
- (CGSize)currentlySharingParticipantContentsSize;
- (TUCall)call;
- (_TtC15ConversationKit25ScreenSharingStateMonitor)init;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCall:(id)a3;
- (void)setIsBroadcastingScreenSharing:(BOOL)a3;
@end

@implementation ScreenSharingStateMonitor

- (_TtC15ConversationKit25ScreenSharingStateMonitor)init
{
  return (_TtC15ConversationKit25ScreenSharingStateMonitor *)ScreenSharingStateMonitor.init()();
}

- (BOOL)isBroadcastingScreenSharing
{
  return ScreenSharingStateMonitor.isBroadcastingScreenSharing.getter() & 1;
}

- (void)setIsBroadcastingScreenSharing:(BOOL)a3
{
}

- (CGSize)currentlySharingParticipantContentsSize
{
  v2 = self;
  double v3 = ScreenSharingStateMonitor.currentlySharingParticipantContentsSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (TUCall)call
{
  v2 = ScreenSharingStateMonitor.call.getter();
  return (TUCall *)v2;
}

- (void)setCall:(id)a3
{
  id v5 = a3;
  double v6 = self;
  ScreenSharingStateMonitor.call.setter(a3);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit25ScreenSharingStateMonitor_conversationController, (uint64_t *)&demangling cache variable for type metadata for ScreenSharingStateMonitorConversationProviderProtocol?);
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit25ScreenSharingStateMonitor_conversationControllerProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25ScreenSharingStateMonitor_screenSharingRemoteControllerObservation));
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit25ScreenSharingStateMonitor_currentlySharingParticipant, &demangling cache variable for type metadata for Participant?);
  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit25ScreenSharingStateMonitor_call);
}

@end