@interface LockdownModeServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC13lockdownmoded18LockdownModeServer)init;
- (void)dealloc;
- (void)deviceIsSetup;
- (void)enableIfNeededWithReboot:(BOOL)a3 completion:(id)a4;
- (void)getEnabledInAccountWithSynchronize:(BOOL)a3 completion:(id)a4;
- (void)migrateIfNeededWithCompletion:(id)a3;
- (void)notifyRestrictionChanged:(id)a3 completion:(id)a4;
- (void)rebootIfNeededWithCompletion:(id)a3;
- (void)setEnabledWithEnabled:(BOOL)a3 options:(id)a4 completion:(id)a5;
@end

@implementation LockdownModeServer

- (_TtC13lockdownmoded18LockdownModeServer)init
{
  return (_TtC13lockdownmoded18LockdownModeServer *)sub_10000D3D0();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_listener);
  v3 = self;
  [v2 invalidate];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LockdownModeServer();
  [(LockdownModeServer *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___notificationsManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___keyValueStore));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___idsManager));

  swift_bridgeObjectRelease();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100020370(v7);

  return v9 & 1;
}

- (void)setEnabledWithEnabled:(BOOL)a3 options:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  v8 = _Block_copy(a5);
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  _Block_copy(v8);
  char v9 = self;
  sub_100021148(v6, (uint64_t)a4, v9, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)getEnabledInAccountWithSynchronize:(BOOL)a3 completion:(id)a4
{
}

- (void)notifyRestrictionChanged:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  _Block_copy(v5);
  char v9 = self;
  sub_1000224D0(v6, v8, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)enableIfNeededWithReboot:(BOOL)a3 completion:(id)a4
{
}

- (void)migrateIfNeededWithCompletion:(id)a3
{
}

- (void)rebootIfNeededWithCompletion:(id)a3
{
}

- (void)deviceIsSetup
{
  v2 = self;
  sub_1000195D0();
}

@end