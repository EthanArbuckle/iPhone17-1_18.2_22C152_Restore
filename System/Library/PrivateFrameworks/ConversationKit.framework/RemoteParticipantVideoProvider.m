@interface RemoteParticipantVideoProvider
- (NSString)debugDescription;
- (_TtC15ConversationKit30RemoteParticipantVideoProvider)init;
- (void)dealloc;
- (void)remoteVideoClient:(id)a3 networkQualityDidDegrade:(BOOL)a4 info:(id)a5;
- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4;
- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4;
- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4;
- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4;
- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4;
- (void)remoteVideoClient:(id)a3 videoDidSuspend:(BOOL)a4;
- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3;
@end

@implementation RemoteParticipantVideoProvider

- (void)dealloc
{
  v2 = self;
  RemoteParticipantVideoProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider_features));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider__remoteVideoAttributes));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider__remoteScreenAttributes));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider_avcRemoteVideoClient));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider_avcRemoteVideoClientDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider_oneToOneModeStateProvider;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

- (_TtC15ConversationKit30RemoteParticipantVideoProvider)init
{
}

- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3
{
  id v4 = a3;
  v5 = self;
  RemoteParticipantVideoProvider.remoteVideoClientDidReceiveFirstFrame(_:)((uint64_t)v4);
}

- (void)remoteVideoClient:(id)a3 videoDidSuspend:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:videoDidSuspend:)((uint64_t)v6, a4);
}

- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:remoteVideoDidPause:)((uint64_t)v6, a4);
}

- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:videoDidDegrade:)((uint64_t)v6, a4);
}

- (void)remoteVideoClient:(id)a3 networkQualityDidDegrade:(BOOL)a4 info:(id)a5
{
  if (a5) {
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:networkQualityDidDegrade:info:)((uint64_t)v9, a4, v8);

  swift_bridgeObjectRelease();
}

- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:remoteMediaDidStall:)((uint64_t)v6, a4);
}

- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:remoteVideoAttributesDidChange:)((uint64_t)v6, v7);
}

- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:remoteScreenAttributesDidChange:)((uint64_t)a3, a4);
}

- (NSString)debugDescription
{
  v2 = self;
  uint64_t v3 = RemoteParticipantVideoProvider.debugDescription.getter();
  uint64_t v5 = v4;

  id v6 = (void *)MEMORY[0x1C87730B0](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

@end