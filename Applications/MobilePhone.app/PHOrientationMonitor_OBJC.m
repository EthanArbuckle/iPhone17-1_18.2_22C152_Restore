@interface PHOrientationMonitor_OBJC
- (BOOL)orientationEventsEnabled;
- (_TtC11MobilePhone25PHOrientationMonitor_OBJC)init;
- (int64_t)deviceOrientation;
- (int64_t)interfaceOrientation;
- (int64_t)lastValidInterfaceOrientation;
- (int64_t)makeInterfaceOrientationFrom:(int64_t)a3 whenFailing:(int64_t)a4;
- (void)setOrientationEventsEnabled:(BOOL)a3;
@end

@implementation PHOrientationMonitor_OBJC

- (int64_t)deviceOrientation
{
  return (int64_t)[*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC11MobilePhone25PHOrientationMonitor_OBJC_wrapped) deviceOrientation];
}

- (int64_t)interfaceOrientation
{
  return (int64_t)[*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC11MobilePhone25PHOrientationMonitor_OBJC_wrapped) interfaceOrientation];
}

- (int64_t)lastValidInterfaceOrientation
{
  return (int64_t)[*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC11MobilePhone25PHOrientationMonitor_OBJC_wrapped) lastValidInterfaceOrientation];
}

- (BOOL)orientationEventsEnabled
{
  return [*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC11MobilePhone25PHOrientationMonitor_OBJC_wrapped) orientationEventsEnabled];
}

- (void)setOrientationEventsEnabled:(BOOL)a3
{
}

- (int64_t)makeInterfaceOrientationFrom:(int64_t)a3 whenFailing:(int64_t)a4
{
  int64_t v5 = a3;
  if (!UIDeviceOrientationIsValidInterfaceOrientation(a3)) {
    return a4;
  }
  switch(v5)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return v5;
    default:
      return a4;
  }
}

- (_TtC11MobilePhone25PHOrientationMonitor_OBJC)init
{
  result = (_TtC11MobilePhone25PHOrientationMonitor_OBJC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end