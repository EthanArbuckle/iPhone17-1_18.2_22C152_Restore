@interface HMDWidgetMonitoredCharacteristic
- (BOOL)isEqual:(id)a3;
- (BOOL)reachabilityMonitored;
- (HMDCharacteristic)characteristic;
- (_TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic)init;
- (_TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic)initWithCharacteristic:(id)a3 reachabilityMonitored:(BOOL)a4;
- (int64_t)hash;
@end

@implementation HMDWidgetMonitoredCharacteristic

- (HMDCharacteristic)characteristic
{
  return (HMDCharacteristic *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic_characteristic));
}

- (BOOL)reachabilityMonitored
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic_reachabilityMonitored);
}

- (_TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic)initWithCharacteristic:(id)a3 reachabilityMonitored:(BOOL)a4
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic_characteristic) = (Class)a3;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic_reachabilityMonitored) = a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HMDWidgetMonitoredCharacteristic();
  id v5 = a3;
  return [(HMDWidgetMonitoredCharacteristic *)&v7 init];
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1D5459E28();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D5459E88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = HMDWidgetMonitoredCharacteristic.isEqual(_:)((uint64_t)v8);

  sub_1D4A5D56C((uint64_t)v8);
  return v6 & 1;
}

- (_TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic)init
{
  result = (_TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HomeKitDaemonLegacy32HMDWidgetMonitoredCharacteristic_characteristic));
}

@end