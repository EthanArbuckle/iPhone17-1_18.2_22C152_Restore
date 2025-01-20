@interface DeviceActivityReport.SceneConfiguration
- (_TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration)init;
- (void)updateDeviceActivityData:(id)a3 segmentInterval:(id)a4 replyHandler:(id)a5;
@end

@implementation DeviceActivityReport.SceneConfiguration

- (void)updateDeviceActivityData:(id)a3 segmentInterval:(id)a4 replyHandler:(id)a5
{
  uint64_t v7 = sub_23776CFC8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = sub_23776D678();
  sub_23776CFB8();
  _Block_copy(v11);
  v13 = self;
  sub_2377637F4(v12, (uint64_t)v10, v13, v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration)init
{
  return (_TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration *)sub_237760BD0();
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration__deviceActivityData;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925688);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connectionQueue));
  swift_release();
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTaskQueue);
}

@end