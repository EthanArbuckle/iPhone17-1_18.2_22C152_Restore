@interface IMNetworkMonitor
- (BOOL)immediatelyReachable;
- (IMNetworkMonitor)init;
- (IMNetworkMonitor)initWithRemoteHost:(id)a3 delegate:(id)a4;
- (IMNetworkMonitor)initWithRemoteHost:(id)a3 delegate:(id)a4 supportsConstrainedNetwork:(BOOL)a5;
- (NSString)remoteHost;
- (id)description;
- (void)clear;
@end

@implementation IMNetworkMonitor

- (IMNetworkMonitor)initWithRemoteHost:(id)a3 delegate:(id)a4
{
  if (a3)
  {
    sub_1A09F3E18();
    swift_unknownObjectRetain();
    v6 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRetain();
    v6 = 0;
  }
  v7 = [(IMNetworkMonitor *)self initWithRemoteHost:v6 delegate:a4 supportsConstrainedNetwork:0];

  swift_unknownObjectRelease();
  return v7;
}

- (IMNetworkMonitor)initWithRemoteHost:(id)a3 delegate:(id)a4 supportsConstrainedNetwork:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3)
  {
    uint64_t v7 = sub_1A09F3E18();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0;
  }
  swift_unknownObjectRetain();
  return (IMNetworkMonitor *)sub_1A099F0DC(v7, v9, (uint64_t)a4, v5);
}

- (void)clear
{
  v2 = self;
  nw_path_evaluator_cancel();
  swift_unknownObjectWeakAssign();
}

- (NSString)remoteHost
{
  if (*(void *)&self->queue[OBJC_IVAR___IMNetworkMonitor_host])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (id)description
{
  v2 = self;
  sub_1A099F980();

  v3 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (BOOL)immediatelyReachable
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMNetworkMonitor_networkAvailable);
}

- (IMNetworkMonitor)init
{
  result = (IMNetworkMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A0875BDC((uint64_t)self + OBJC_IVAR___IMNetworkMonitor_delegate);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end