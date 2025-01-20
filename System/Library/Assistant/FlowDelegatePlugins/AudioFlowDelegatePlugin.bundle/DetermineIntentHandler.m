@interface DetermineIntentHandler
- (_TtC23AudioFlowDelegatePlugin22DetermineIntentHandler)init;
- (void)confirmDetermine:(id)a3 completion:(id)a4;
- (void)handleDetermine:(id)a3 completion:(id)a4;
- (void)resolveNowPlayingIntentInfoForDetermine:(id)a3 withCompletion:(id)a4;
@end

@implementation DetermineIntentHandler

- (_TtC23AudioFlowDelegatePlugin22DetermineIntentHandler)init
{
  return (_TtC23AudioFlowDelegatePlugin22DetermineIntentHandler *)DetermineIntentHandler.init()();
}

- (void)resolveNowPlayingIntentInfoForDetermine:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  DetermineIntentHandler.resolveNowPlayingIntentInfo(for:with:)(v8, (uint64_t)sub_12C8E0, v7);

  swift_release();
}

- (void)confirmDetermine:(id)a3 completion:(id)a4
{
}

- (void)handleDetermine:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  sub_7184((uint64_t)self + OBJC_IVAR____TtC23AudioFlowDelegatePlugin22DetermineIntentHandler_nowPlayingProvider);
  v3 = (char *)self + OBJC_IVAR____TtC23AudioFlowDelegatePlugin22DetermineIntentHandler_siriKitTaskLoggingProvider;

  sub_7184((uint64_t)v3);
}

@end