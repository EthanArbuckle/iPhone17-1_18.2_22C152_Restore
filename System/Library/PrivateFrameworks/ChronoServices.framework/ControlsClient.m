@interface ControlsClient
- (_TtC14ChronoServices14ControlsClient)init;
- (void)liveControlsDidChange:(id)a3;
- (void)previewControlsDidChange:(id)a3;
- (void)systemEnvironmentDidChange:(id)a3;
@end

@implementation ControlsClient

- (_TtC14ChronoServices14ControlsClient)init
{
  return (_TtC14ChronoServices14ControlsClient *)ControlsClient.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_190CEA394(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14ChronoServices14ControlsClient__lock_environmentData), *(void *)&self->_calloutQueue[OBJC_IVAR____TtC14ChronoServices14ControlsClient__lock_environmentData]);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC14ChronoServices14ControlsClient_handleSystemEnvironmentDidChange);
  sub_190CDAA9C(v3);
}

- (void)systemEnvironmentDidChange:(id)a3
{
}

- (void)liveControlsDidChange:(id)a3
{
}

- (void)previewControlsDidChange:(id)a3
{
}

@end