@interface HomeManagerXPCClientConnectionsManager
- (BOOL)hasActiveConnections;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (_TtC13HomeKitDaemon38HomeManagerXPCClientConnectionsManager)init;
- (void)configure;
- (void)handleActiveAssertionUpdateStateMessage:(id)a3;
- (void)handleProcessInfoStateChangedNotification:(id)a3;
- (void)handleXPCConnectionDidInvalidateNotification:(id)a3;
- (void)handleXPCConnectionDidStartNotification:(id)a3;
@end

@implementation HomeManagerXPCClientConnectionsManager

- (NSUUID)messageTargetUUID
{
  v2 = (void *)sub_2302DD250();
  return (NSUUID *)v2;
}

- (void)configure
{
  v2 = self;
  HomeManagerXPCClientConnectionsManager.configure()();
}

- (BOOL)hasActiveConnections
{
  v2 = self;
  BOOL active = HomeManagerXPCClientConnectionsManager.hasActiveConnections.getter();

  return active;
}

- (void)handleActiveAssertionUpdateStateMessage:(id)a3
{
  v4 = (char *)a3;
  v5 = self;
  sub_22F66AE48(v4);
}

- (void)handleXPCConnectionDidStartNotification:(id)a3
{
}

- (void)handleXPCConnectionDidInvalidateNotification:(id)a3
{
}

- (void)handleProcessInfoStateChangedNotification:(id)a3
{
}

- (_TtC13HomeKitDaemon38HomeManagerXPCClientConnectionsManager)init
{
  result = (_TtC13HomeKitDaemon38HomeManagerXPCClientConnectionsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HomeKitDaemon38HomeManagerXPCClientConnectionsManager_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HomeKitDaemon38HomeManagerXPCClientConnectionsManager_messageDispatcher));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HomeKitDaemon38HomeManagerXPCClientConnectionsManager_xpcTransport));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HomeKitDaemon38HomeManagerXPCClientConnectionsManager_notificationCenter));
  v3 = (char *)self + OBJC_IVAR____TtC13HomeKitDaemon38HomeManagerXPCClientConnectionsManager_messageTargetUUID;
  uint64_t v4 = sub_2302DD2B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_22F54F3D4((uint64_t)self + OBJC_IVAR____TtC13HomeKitDaemon38HomeManagerXPCClientConnectionsManager_lockedState, (uint64_t *)&unk_2686D9CA0);
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC13HomeKitDaemon38HomeManagerXPCClientConnectionsManager_queue));
}

@end