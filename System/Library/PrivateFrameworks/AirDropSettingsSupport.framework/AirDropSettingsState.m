@interface AirDropSettingsState
- (_TtC22AirDropSettingsSupport20AirDropSettingsState)init;
- (void)dealloc;
- (void)discoveryControllerSettingsDidChange:(void *)a3;
@end

@implementation AirDropSettingsState

- (_TtC22AirDropSettingsSupport20AirDropSettingsState)init
{
  return (_TtC22AirDropSettingsSupport20AirDropSettingsState *)AirDropSettingsState.init()();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(AirDropSettingsState *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController));
  v3 = (char *)self + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState___observationRegistrar;
  uint64_t v4 = sub_2477F1420();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)discoveryControllerSettingsDidChange:(void *)a3
{
  if (a3)
  {
    id v5 = a1;
    id v4 = a3;
    sub_2477F0E68(v4);
  }
  else
  {
    __break(1u);
  }
}

@end