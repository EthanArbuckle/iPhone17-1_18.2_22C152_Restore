@interface SensorController
+ (BOOL)supportsSecureCoding;
- (_TtC11DockKitCore16SensorController)initWithAccessory:(id)a3 id:(int64_t)a4 name:(id)a5 sensors:(id)a6;
- (_TtC11DockKitCore16SensorController)initWithAccessory:(id)a3 id:(int64_t)a4 type:(int64_t)a5 name:(id)a6;
- (_TtC11DockKitCore16SensorController)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getSensorDataWithSensors:(NSArray *)a3 delegate:(_TtP11DockKitCore23XPCSensorClientProtocol_ *)a4 occurrence:(int64_t)a5 completionHandler:(id)a6;
- (void)setSensorStateWithSensors:(NSArray *)a3 states:(NSArray *)a4 completionHandler:(id)a5;
- (void)stopSensorDataWithSensors:(NSArray *)a3 completionHandler:(id)a4;
@end

@implementation SensorController

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore16SensorController)initWithAccessory:(id)a3 id:(int64_t)a4 name:(id)a5 sensors:(id)a6
{
  uint64_t v8 = sub_24CF3B320();
  uint64_t v10 = v9;
  type metadata accessor for Sensor();
  unint64_t v11 = sub_24CF3B470();
  id v12 = a3;
  v13 = (_TtC11DockKitCore16SensorController *)sub_24CF1D104(a3, a4, v8, v10, v11);

  swift_bridgeObjectRelease();
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24CEBF19C(v4);
}

- (_TtC11DockKitCore16SensorController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24CF3B1B0();
  swift_unknownObjectWeakInit();
  id v4 = (_TtC11DockKitCore16SensorController *)sub_24CEC00A8();

  return v4;
}

- (void)getSensorDataWithSensors:(NSArray *)a3 delegate:(_TtP11DockKitCore23XPCSensorClientProtocol_ *)a4 occurrence:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26983C608;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26983BBF0;
  v18[5] = v17;
  v19 = a3;
  swift_unknownObjectRetain();
  v20 = self;
  sub_24CF244A8((uint64_t)v13, (uint64_t)&unk_26983BBF8, (uint64_t)v18);
  swift_release();
}

- (void)stopSensorDataWithSensors:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983C5E8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983C5F0;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983C5F8, (uint64_t)v14);
  swift_release();
}

- (void)setSensorStateWithSensors:(NSArray *)a3 states:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983C5D8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983BBD0;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983B880, (uint64_t)v16);
  swift_release();
}

- (_TtC11DockKitCore16SensorController)initWithAccessory:(id)a3 id:(int64_t)a4 type:(int64_t)a5 name:(id)a6
{
  id v6 = a3;
  result = (_TtC11DockKitCore16SensorController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11DockKitCore16SensorController_logger;
  uint64_t v3 = sub_24CF3B1C0();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end