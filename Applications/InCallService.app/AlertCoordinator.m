@interface AlertCoordinator
+ (NSString)automaticallyInvokedKey;
+ (double)countdownDuration;
- (BOOL)isAlertRequestPending;
- (BOOL)isAvailable;
- (BOOL)isBackgroundCountdownRunning;
- (BOOL)isMonitoring;
- (BOOL)isStewieActive;
- (_TtC13InCallService16AlertCoordinator)init;
- (_TtP13InCallService24AlertCoordinatorDelegate_)delegate;
- (double)currentBackgroundCountdownDuration;
- (void)invokeAlertWithRequestUnlock:(BOOL)a3 automaticallyInvoked:(BOOL)a4;
- (void)performAlertRequestWithRequestUnlock:(BOOL)a3 automaticallyInvoked:(BOOL)a4;
- (void)refreshDelegateWithState;
- (void)setDelegate:(id)a3;
- (void)setIsAlertRequestPending:(BOOL)a3;
- (void)startMonitoring;
- (void)stateChanged:(id)a3;
- (void)statusChanged:(int64_t)a3;
- (void)stopBackgroundCountdown;
- (void)stopMonitoring;
@end

@implementation AlertCoordinator

+ (double)countdownDuration
{
  return 10.0;
}

+ (NSString)automaticallyInvokedKey
{
  sub_1001E59B0();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtP13InCallService24AlertCoordinatorDelegate_)delegate
{
  NSString v2 = (void *)sub_1001E5A50();

  return (_TtP13InCallService24AlertCoordinatorDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1001E5AC0();
}

- (BOOL)isAlertRequestPending
{
  return sub_1001E5B30() & 1;
}

- (void)setIsAlertRequestPending:(BOOL)a3
{
}

- (BOOL)isAvailable
{
  NSString v2 = self;
  unsigned __int8 v3 = sub_1001E5BC0();

  return v3 & 1;
}

- (_TtC13InCallService16AlertCoordinator)init
{
  return (_TtC13InCallService16AlertCoordinator *)sub_1001E61B0();
}

- (void).cxx_destruct
{
  sub_1001443AC((uint64_t)self + OBJC_IVAR____TtC13InCallService16AlertCoordinator_delegate);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  unsigned __int8 v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13InCallService16AlertCoordinator_backgroundCountdownTimer);
}

- (BOOL)isMonitoring
{
  return sub_1001E6DE0();
}

- (BOOL)isStewieActive
{
  NSString v2 = self;
  unsigned __int8 v3 = sub_1001E7418(&OBJC_IVAR____TtC13InCallService16AlertCoordinator_stateMonitor, (SEL *)&selRef_isAlertActive);

  return v3 & 1;
}

- (void)startMonitoring
{
  NSString v2 = self;
  sub_1001E6E3C();
}

- (void)stopMonitoring
{
  NSString v2 = self;
  sub_1001E7078();
}

- (void)refreshDelegateWithState
{
  NSString v2 = self;
  sub_1001E7158();
}

- (void)invokeAlertWithRequestUnlock:(BOOL)a3 automaticallyInvoked:(BOOL)a4
{
  v6 = self;
  sub_1001E728C(a3, a4);
}

- (double)currentBackgroundCountdownDuration
{
  return sub_1001E73C4();
}

- (BOOL)isBackgroundCountdownRunning
{
  NSString v2 = self;
  unsigned __int8 v3 = sub_1001E7418(&OBJC_IVAR____TtC13InCallService16AlertCoordinator_backgroundCountdownTimer, (SEL *)&selRef_isValid);

  return v3 & 1;
}

- (void)stopBackgroundCountdown
{
  NSString v2 = self;
  sub_1001E7440();
}

- (void)performAlertRequestWithRequestUnlock:(BOOL)a3 automaticallyInvoked:(BOOL)a4
{
  v6 = self;
  sub_1001E7490(a3, a4);
}

- (void)stateChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001E84F4(v4);
}

- (void)statusChanged:(int64_t)a3
{
  unsigned __int8 v3 = self;
  sub_1001E86CC();
}

@end