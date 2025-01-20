@interface CDMXPCService
- (_TtC14assistant_cdmd13CDMXPCService)init;
- (_TtC14assistant_cdmd13CDMXPCService)initWithClientToUse:(id)a3;
- (id)sandboxToken;
- (void)areAssetsAvailableWithLocale:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)processCDMNluRequestWithCdmNluRequest:(id)a3 completionHandler:(id)a4;
- (void)processRequestWithServiceGraphCommand:(id)a3 completionHandler:(id)a4;
- (void)setupWithConfig:(id)a3 completionHandler:(id)a4;
- (void)waitForDataDispatcherCompletionWithCompletionHandler:(id)a3;
- (void)wake;
- (void)warmupWithCompletionHandler:(id)a3;
@end

@implementation CDMXPCService

- (void)wake
{
  v2 = self;
  sub_1000027F0();
}

- (void)setupWithConfig:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_100002FBC(v7, (uint64_t)v8, v6);
  _Block_release(v6);
}

- (_TtC14assistant_cdmd13CDMXPCService)init
{
  return (_TtC14assistant_cdmd13CDMXPCService *)sub_100006224();
}

- (_TtC14assistant_cdmd13CDMXPCService)initWithClientToUse:(id)a3
{
  return (_TtC14assistant_cdmd13CDMXPCService *)sub_100006330((uint64_t)a3);
}

- (id)sandboxToken
{
  sub_1000063B0();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  return v3;
}

- (void)warmupWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10000679C((uint64_t)sub_100003D60, v5);

  swift_release();
}

- (void)processCDMNluRequestWithCdmNluRequest:(id)a3 completionHandler:(id)a4
{
}

- (void)areAssetsAvailableWithLocale:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = type metadata accessor for Locale();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v10);
  v11 = self;
  sub_100006B8C((uint64_t)v9, (uint64_t)v11, (void (**)(void, void))v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)processRequestWithServiceGraphCommand:(id)a3 completionHandler:(id)a4
{
}

- (void)waitForDataDispatcherCompletionWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_100007148((uint64_t)v5, (void (**)(void))v4);
  _Block_release(v4);
}

- (void)dealloc
{
  uint64_t v2 = self;
  sub_100007328();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end