@interface APSDefaultConnectionRetryStateManager
- (APSDefaultConnectionRetryStateManager)init;
- (BOOL)shouldDelayNextReconnect;
- (double)currentDelay;
- (void)noteConnectionAttemptFailed;
- (void)noteConnectionAttemptStart;
- (void)noteConnectionEstablished;
- (void)notePresenceFailure;
- (void)notePresenceSuccess;
@end

@implementation APSDefaultConnectionRetryStateManager

- (double)currentDelay
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v3 = self;
  double v4 = COERCE_DOUBLE(v2());
  double v6 = v5;
  char v8 = v7;
  int v9 = ~v7;

  if (!v9) {
    return 0.0;
  }
  if (v8) {
    return v4;
  }
  return v6;
}

- (BOOL)shouldDelayNextReconnect
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v3 = self;
  *(double *)&uint64_t v4 = COERCE_DOUBLE(v2());
  if (v6 == -1)
  {
    sub_1000B6160();
    v12 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    return 0;
  }
  else
  {
    double v7 = *(double *)&v4;
    double v8 = v5;
    char v9 = v6;

    if (v9) {
      double v10 = v7;
    }
    else {
      double v10 = v8;
    }
    return v10 > 0.0;
  }
}

- (APSDefaultConnectionRetryStateManager)init
{
  uint64_t ObjectType = swift_getObjectType();
  type metadata accessor for DefaultsDebugOverrides();
  id v3 = sub_1000B6B38();
  uint64_t v4 = (APSDefaultConnectionRetryStateManager *)(*(uint64_t (**)(id))(ObjectType + 296))(v3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)noteConnectionAttemptStart
{
  id v3 = self;
  __uint64_t v2 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  (*(void (**)(__uint64_t))((swift_isaMask & (uint64_t)v3->super.isa) + 0x108))(v2);
}

- (void)noteConnectionEstablished
{
  __uint64_t v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x108);
  id v3 = self;
  v2(0);
}

- (void)noteConnectionAttemptFailed
{
  __uint64_t v2 = self;
  sub_1000B86C4();
}

- (void)notePresenceSuccess
{
  __uint64_t v2 = self;
  sub_1000B8880();
}

- (void)notePresenceFailure
{
  __uint64_t v2 = self;
  sub_1000B89EC();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end