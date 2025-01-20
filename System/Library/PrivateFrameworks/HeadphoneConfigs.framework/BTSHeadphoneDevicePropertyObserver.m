@interface BTSHeadphoneDevicePropertyObserver
- (BOOL)reloadTriggered;
- (HPMHeadphoneDevice)headphoneDevice;
- (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver)init;
- (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver)initWithDevice:(id)a3 onChangeAction:(id)a4 onChangeReloadAllAction:(id)a5;
- (void)dealloc;
- (void)reloadAll;
- (void)setHeadphoneDevice:(id)a3;
- (void)setReloadTriggered:(BOOL)a3;
@end

@implementation BTSHeadphoneDevicePropertyObserver

- (HPMHeadphoneDevice)headphoneDevice
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice);
  swift_beginAccess();
  return (HPMHeadphoneDevice *)*v2;
}

- (void)setHeadphoneDevice:(id)a3
{
  v5 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_1E4C7AC3C();
}

- (BOOL)reloadTriggered
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1E4CBF050(&v5);
  swift_release();
  swift_release();

  return v5;
}

- (void)setReloadTriggered:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_1E4CBF060();
}

- (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver)initWithDevice:(id)a3 onChangeAction:(id)a4 onChangeReloadAllAction:(id)a5
{
  id v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  id v11 = a3;
  return (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *)sub_1E4C7C2B0(a3, (uint64_t)sub_1E4C7D020, v9, (uint64_t)sub_1E4C7D398, v10);
}

- (void)reloadAll
{
  v2 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0xB8);
  v3 = self;
  v2(1);
}

- (void)dealloc
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_listeners);
  swift_beginAccess();
  void *v3 = MEMORY[0x1E4FBC870];
  v4 = self;
  swift_bridgeObjectRelease();
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for BTSHeadphoneDevicePropertyObserver();
  [(BTSHeadphoneDevicePropertyObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver__reloadTriggered;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8D620);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

- (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver)init
{
  result = (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end