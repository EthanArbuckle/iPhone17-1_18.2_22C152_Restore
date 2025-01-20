@interface ShowClockIntentHandler
- (_TtC15ClockFlowPlugin22ShowClockIntentHandler)init;
- (void)confirmShowClock:(id)a3 completion:(id)a4;
- (void)handleShowClock:(id)a3 completion:(id)a4;
@end

@implementation ShowClockIntentHandler

- (void)confirmShowClock:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void *, id))_Block_copy(a4);
  id v7 = objc_allocWithZone((Class)type metadata accessor for ShowClockIntentResponse());
  id v8 = a3;
  v9 = self;
  v10 = (char *)[v7 init];
  v11 = &v10[OBJC_IVAR___ShowClockIntentResponse_code];
  swift_beginAccess();
  *(void *)v11 = 1;
  [v10 setUserActivity:0];
  v6[2](v6, v10);

  _Block_release(v6);
}

- (void)handleShowClock:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_5754(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC15ClockFlowPlugin22ShowClockIntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShowClockIntentHandler();
  return [(ShowClockIntentHandler *)&v3 init];
}

@end