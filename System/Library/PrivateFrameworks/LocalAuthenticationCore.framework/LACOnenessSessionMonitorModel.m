@interface LACOnenessSessionMonitorModel
- (BOOL)isMonitoring;
- (BOOL)isSessionActive;
- (_TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel)init;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation LACOnenessSessionMonitorModel

- (BOOL)isSessionActive
{
  v2 = self;
  unsigned __int8 v3 = LACOnenessSessionMonitorModel.isOnenessActive.getter();

  return v3 & 1;
}

- (BOOL)isMonitoring
{
  return *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel_sessionSubscription) != 0;
}

- (void)startMonitoring
{
  v2 = self;
  LACOnenessSessionMonitorModel.start()();
}

- (void)stopMonitoring
{
  v2 = self;
  LACOnenessSessionMonitorModel.stop()();
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (_TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel)init
{
  result = (_TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel_observers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel_replyQueue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore29LACOnenessSessionMonitorModel_sessionProvider);
  swift_release();
}

@end