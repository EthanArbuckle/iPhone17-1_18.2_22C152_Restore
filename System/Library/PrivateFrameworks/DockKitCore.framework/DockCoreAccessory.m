@interface DockCoreAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSystemActuatorsWithName:(id)a3 actuators:(id)a4;
- (BOOL)hasSystemSensorsWithName:(id)a3 sensors:(id)a4;
- (BOOL)hasSystemWithName:(id)a3 kind:(Class)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)systems;
- (NSString)description;
- (NSString)summary;
- (_TtC11DockKitCore12DockCoreInfo)info;
- (_TtC11DockKitCore17DockCoreAccessory)init;
- (_TtC11DockKitCore17DockCoreAccessory)initWithCoder:(id)a3;
- (_TtC11DockKitCore17DockCoreAccessory)initWithInfo:(id)a3 systems:(id)a4;
- (id)getActuatorWithName:(id)a3;
- (id)getSystemSensorsWithName:(id)a3 sensors:(id)a4;
- (int64_t)getActuatorIndexWithName:(id)a3 system:(id)a4;
- (int64_t)hash;
- (void)actuatorFeedbackWithInfo:(id)a3 system:(id)a4 actuators:(id)a5 positions:(id)a6 velocities:(id)a7 timestamp:(double)a8;
- (void)batteryStateDataWithInfo:(id)a3 data:(id)a4;
- (void)dealloc;
- (void)disconnectWithAllowReconnect:(BOOL)a3;
- (void)disconnectedWithErr:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)sensorDataWithInfo:(id)a3 system:(id)a4 sensors:(id)a5 data:(id)a6;
- (void)setInfo:(id)a3;
- (void)setSystems:(id)a3;
- (void)systemEventDataWithInfo:(id)a3 data:(id)a4;
- (void)trackingSummaryDataDebugWithInfo:(id)a3 data:(id)a4;
- (void)trackingSummaryDataWithInfo:(id)a3 data:(id)a4;
- (void)trajectoryProgressFeedbackWithInfo:(id)a3 system:(id)a4 progress:(id)a5;
- (void)updateFromAccessory:(id)a3;
@end

@implementation DockCoreAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore12DockCoreInfo)info
{
  return (_TtC11DockKitCore12DockCoreInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info));
}

- (void)setInfo:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info) = (Class)a3;
  id v3 = a3;
}

- (NSArray)systems
{
  type metadata accessor for System();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24CF3B450();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSystems:(id)a3
{
  type metadata accessor for System();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_systems) = (Class)sub_24CF3B470();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_24CE77434(self, (uint64_t)a2, (void (*)(void))sub_24CE76E78);
}

- (NSString)summary
{
  return (NSString *)sub_24CE77434(self, (uint64_t)a2, (void (*)(void))sub_24CE774A4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_24CF3B840();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_24CE77888((uint64_t)v8);

  sub_24CE3C198((uint64_t)v8, &qword_26983BB90);
  return v6 & 1;
}

- (int64_t)hash
{
  sub_24CF3BDB0();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info);
  id v4 = self;
  id v5 = v3;
  sub_24CF3B7B0();

  int64_t v6 = sub_24CF3BD90();
  return v6;
}

- (_TtC11DockKitCore17DockCoreAccessory)initWithInfo:(id)a3 systems:(id)a4
{
  type metadata accessor for System();
  uint64_t v5 = sub_24CF3B470();
  id v6 = a3;
  v7 = (_TtC11DockKitCore17DockCoreAccessory *)sub_24CE8CC34(v6, v5);

  return v7;
}

- (void)updateFromAccessory:(id)a3
{
  id v4 = *(objc_class **)((char *)a3 + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_info) = v4;
  id v6 = (char *)a3;
  v8 = self;
  v7 = v4;

  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_systems) = *(Class *)&v6[OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_systems];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_version) = (Class)2;
}

- (void)disconnectWithAllowReconnect:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_24CE77C74(v3);
}

- (void)dealloc
{
  v2 = self;
  DockCoreAccessory.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CE74DA8((uint64_t)self + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_trajectoryProgressDelegate);
  BOOL v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_logger;
  uint64_t v4 = sub_24CF3B1C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_created;
  uint64_t v6 = sub_24CF3A960();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory__xpcConnection_CameraCapture);
}

- (BOOL)hasSystemWithName:(id)a3 kind:(Class)a4
{
  uint64_t v5 = sub_24CF3B320();
  uint64_t v7 = v6;
  swift_getObjCClassMetadata();
  v8 = self;
  unint64_t v9 = swift_bridgeObjectRetain();
  unint64_t v10 = sub_24CE8CED4(v9, v5, v7);
  swift_bridgeObjectRelease();
  if (v10 >> 62) {
    uint64_t v11 = sub_24CF3BA40();
  }
  else {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v11 > 0;
}

- (BOOL)hasSystemActuatorsWithName:(id)a3 actuators:(id)a4
{
  return sub_24CE78D78(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CE785D4);
}

- (int64_t)getActuatorIndexWithName:(id)a3 system:(id)a4
{
  uint64_t v5 = sub_24CF3B320();
  uint64_t v7 = v6;
  uint64_t v8 = sub_24CF3B320();
  uint64_t v10 = v9;
  uint64_t v11 = self;
  int64_t v12 = sub_24CE78834(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (BOOL)hasSystemSensorsWithName:(id)a3 sensors:(id)a4
{
  return sub_24CE78D78(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24CE78AA8);
}

- (id)getSystemSensorsWithName:(id)a3 sensors:(id)a4
{
  uint64_t v5 = sub_24CF3B320();
  uint64_t v7 = v6;
  uint64_t v8 = sub_24CF3B470();
  uint64_t v9 = self;
  sub_24CE78E0C(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for Sensor();
  uint64_t v10 = (void *)sub_24CF3B450();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)getActuatorWithName:(id)a3
{
  uint64_t v4 = sub_24CF3B320();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = sub_24CE7943C(0);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    type metadata accessor for ActuationController();
    uint64_t v10 = (void *)swift_dynamicCastClass();
    if (v10) {
      uint64_t v10 = (void *)sub_24CEC69E0(v4, v6);
    }

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    uint64_t v10 = 0;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24CE79674(v4);
}

- (_TtC11DockKitCore17DockCoreAccessory)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore17DockCoreAccessory *)DockCoreAccessory.init(coder:)(a3);
}

- (void)actuatorFeedbackWithInfo:(id)a3 system:(id)a4 actuators:(id)a5 positions:(id)a6 velocities:(id)a7 timestamp:(double)a8
{
  sub_24CF3B320();
  sub_24CF3B470();
  sub_24CF3B470();
  sub_24CF3B470();
  id v11 = a3;
  int64_t v12 = self;
  sub_24CE7E510((uint64_t)v11, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)trajectoryProgressFeedbackWithInfo:(id)a3 system:(id)a4 progress:(id)a5
{
  sub_24CF3B320();
  uint64_t v8 = MEMORY[0x253318A80]((char *)self + OBJC_IVAR____TtC11DockKitCore17DockCoreAccessory_trajectoryProgressDelegate);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v10 = a3;
    id v11 = a5;
    int64_t v12 = self;
    id v13 = (id)sub_24CF3B300();
    objc_msgSend(v9, sel_trajectoryProgressFeedbackWithInfo_system_progress_, v10, v13, v11);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)systemEventDataWithInfo:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_24CE7E948((uint64_t)v6, (uint64_t)v7);
}

- (void)batteryStateDataWithInfo:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_24CE7E9D8((uint64_t)v6, (uint64_t)v7);
}

- (void)trackingSummaryDataWithInfo:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_24CE7EA68((uint64_t)v6, (uint64_t)v7);
}

- (void)trackingSummaryDataDebugWithInfo:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_24CE7EAF8((uint64_t)v6, (uint64_t)v7);
}

- (void)disconnectedWithErr:(id)a3
{
  id v4 = self;
  id v5 = a3;
  sub_24CE7EC34((uint64_t)a3);
}

- (void)sensorDataWithInfo:(id)a3 system:(id)a4 sensors:(id)a5 data:(id)a6
{
  sub_24CF3B320();
  sub_24CF3B470();
  type metadata accessor for SensorData();
  sub_24CF3B470();
  id v8 = a3;
  uint64_t v9 = self;
  sub_24CE8832C((uint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC11DockKitCore17DockCoreAccessory)init
{
  result = (_TtC11DockKitCore17DockCoreAccessory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end