@interface DeviceNotification
- (_TtC11DockKitCore18DeviceNotification)init;
- (_TtC11DockKitCore18DeviceNotification)initWithName:(id)a3;
- (_TtC11DockKitCore18DeviceNotification)initWithName:(id)a3 queue:(id)a4 handler:(id)a5;
- (unint64_t)state;
- (void)dealloc;
- (void)setState:(unint64_t)a3;
@end

@implementation DeviceNotification

- (unint64_t)state
{
  uint64_t v3 = OBJC_IVAR____TtC11DockKitCore18DeviceNotification_allocatedLock;
  v4 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore18DeviceNotification_allocatedLock);
  v5 = self;
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  v6 = (unint64_t *)((char *)v5 + OBJC_IVAR____TtC11DockKitCore18DeviceNotification__state);
  notify_get_state(*(_DWORD *)((char *)&v5->super.isa + OBJC_IVAR____TtC11DockKitCore18DeviceNotification_token), (uint64_t *)((char *)v5 + OBJC_IVAR____TtC11DockKitCore18DeviceNotification__state));
  unint64_t v7 = *v6;
  v8 = *(os_unfair_lock_s **)((char *)&self->super.isa + v3);
  swift_retain();
  os_unfair_lock_unlock(v8 + 4);

  swift_release();
  return v7;
}

- (void)setState:(unint64_t)a3
{
  v4 = self;
  DeviceNotification.state.setter(a3);
}

- (_TtC11DockKitCore18DeviceNotification)initWithName:(id)a3
{
  uint64_t v3 = sub_24CF3B320();
  return (_TtC11DockKitCore18DeviceNotification *)DeviceNotification.init(name:)(v3, v4);
}

- (_TtC11DockKitCore18DeviceNotification)initWithName:(id)a3 queue:(id)a4 handler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_24CF3B320();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  id v11 = a4;
  v12 = sub_24CEC196C(v7, v9, v11, (uint64_t)sub_24CEC1D74, v10);

  return (_TtC11DockKitCore18DeviceNotification *)v12;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  int v4 = *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore18DeviceNotification_token);
  v5 = self;
  if (v4 != -1) {
    notify_cancel(v4);
  }
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(DeviceNotification *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore18DeviceNotification_logger;
  uint64_t v4 = sub_24CF3B1C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

- (_TtC11DockKitCore18DeviceNotification)init
{
  result = (_TtC11DockKitCore18DeviceNotification *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end